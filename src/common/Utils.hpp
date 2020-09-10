#ifndef UTILS_HPP
#define UTILS_HPP

#include <iterator>
#include <vector>

typedef int idx_t;

/**
 * Iterator for numeric type T to define ranges without backing arrays
 */
template<typename T>
class NumberIterator {
  public:
    using iterator_category = std::forward_iterator_tag;
    using value_type = T;
    using difference_type = T;
    using pointer = T*;
    using reference = T&;
    NumberIterator(T num) : num(num) {}

    const T& operator*() const { return num; }
    
    T operator-(const NumberIterator& other) const { return num - other.num; };
    NumberIterator& operator++() { ++num; return *this; }
    NumberIterator operator++(int) { auto old = num++; return NumberIterator(old); } // Postfix is marked by unused int argument

    bool operator==(const NumberIterator& other) const { return num == other.num; };
    bool operator!=(const NumberIterator& other) const { return num != other.num; };

  private:
    T num;
};

/**
 * This class is used to define an enumerable for example in for each iteration
 * 
 * Typical usage:
 *   for(auto x : NumberRange<int>(10)) {
 *     printf("%d\n", x);
 *   }
 */
template<typename T>
class NumberRange {
  public:
    NumberRange(T first, T last) : first(first), last(last) {}
    NumberRange(T count) : first(0), last(count) {}
    NumberIterator<T> begin() { return NumberIterator(first); }
    NumberIterator<T> end() { return NumberIterator(last); }

    /**
     * Create an std::vector containing the range
     */
    std::vector<T> Vector() { return std::vector<T>(begin(), end()); }
  private:
    T first, last;
};

enum strong_ordering {
  less = -1,
  equal = 0,
  greater = 1
};

/**
 * This function returns a vector containing the minimum elements (not only the first)
 * 
 * @param begin Begin iterator
 * @param end End iterator
 * @param pred Function-like entity that defines order returning strong_ordering (in seneral < 0, = 0, > 0)
 * @param prov Function-like that prerpocesses the elements (mapped onto iterator)
 */
template<class _It, class _Pred, class _Prov>
std::vector<typename std::iterator_traits<_It>::value_type> min_elements(_It begin, _It end, _Pred pred, _Prov prov) {
  using _Idx = typename std::iterator_traits<_It>::value_type;
  using _Val = decltype(prov(*begin));
  std::vector<_Idx> minimumIdxs;
  if(begin == end) {
    return minimumIdxs;
  }
  _Idx currentIdx = *begin++;
  minimumIdxs.push_back(currentIdx);
  _Val minimumValue = prov(currentIdx);
  for(; begin != end; ++begin) {
    currentIdx = *begin;
    _Val currentValue = prov(currentIdx);
    auto order = pred(currentValue, minimumValue); // strong_ordering
    if(order < 0) {
      // Less than
      minimumIdxs.clear();
      minimumValue = currentValue;
      minimumIdxs.push_back(currentIdx);
    } else if(order == 0) {
      minimumIdxs.push_back(currentIdx);
    }
  }
  return minimumIdxs;
}

/**
 * This function returns a vector containing the minimum elements (not only the first)
 * 
 * @param begin Begin iterator
 * @param end End iterator
 * @param pred Function-like entity that defines order returning strong_ordering (in seneral < 0, = 0, > 0)
 */
template<class _It, class _Pred>
std::vector<typename std::iterator_traits<_It>::value_type> min_elements(_It begin, _It end, _Pred pred) {
  return min_elements(begin, end, pred, [](auto x) { return x; });
}

/**
 * This function returns a vector containing the minimum elements (not only the first)
 * 
 * @param size Iterate trough index list with this size
 * @param pred Function-like entity that defines order returning strong_ordering (in seneral < 0, = 0, > 0)
 * @param prov Function-like that prerpocesses the elements (mapped onto iterator)
 */
template<class _Pred, class _Prov>
std::vector<idx_t> min_elements(idx_t size, _Pred pred, _Prov prov) {
  return min_elements(NumberIterator(0), NumberIterator(size), pred, prov);
}

/**
 * This function returns a vector containing the minimum elements (not only the first)
 * 
 * @param size Iterate trough index list with this size
 * @param pred Function-like entity that defines order returning strong_ordering (in seneral < 0, = 0, > 0)
 */
template<class _Pred>
std::vector<idx_t> min_elements(idx_t size, _Pred pred) {
  return min_elements(NumberIterator(0), NumberIterator(size), pred, [](auto x) { return x; });
}

/**
 * Default comparison predicate
 */
template<typename T>
T so_cmp(const T& x, const T& y) {
  return x - y;
}
/**
 * Inverted comparison predicate
 */
template<typename T>
T so_negcmp(const T& x, const T& y) {
  return y - x;
}

/**
 * Returns map[key] if present or def otherwise
 */
template<typename _MAP>
typename _MAP::mapped_type value_or_default(const _MAP map, const typename _MAP::key_type& key, const typename _MAP::mapped_type& def) {
  typename _MAP::const_iterator it = map.find(key);
  if(it == map.end()) {
    return def;
  }
  return it->second;
}

#endif