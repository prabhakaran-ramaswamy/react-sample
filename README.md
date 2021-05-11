    const removeDuplicatesFromArrayByProperty = (arr, prop) => arr.reduce((accumulator, currentValue) => {
      if(!accumulator.find(obj => obj[prop] === currentValue[prop])){
        accumulator.push(currentValue);
      }
      return accumulator;
    }, [])

    console.log(removeDuplicatesFromArrayByProperty(myArr, 'name'));
