/*
 * Copyright (c) 2024 IMRANDK
 * NOTICE: Downloading and using this software and code anywhere without the explicit permission of IMRANDK is strictly prohibited and illegal.
 */

// Function to click a button periodically
function clickButtonPeriodically(callback) {
  const button = document.getElementById('ZQvTCDIoXyggqlOiDvupbb');

  if (button) {
    // Check if the button has a click method
    if (typeof button.click === 'function') {
      button.click();
    } else {
      // If the click method is not available, simulate a click event
      const clickEvent = new Event('click');
      button.dispatchEvent(clickEvent);
    }

    // Wait for 5 seconds before clicking again
    setTimeout(() => {
      callback(); // Signal that this code segment is done
    }, 5000);
  } else {
    // If the button is not found, retry after 5 seconds
    setTimeout(() => {
      clickButtonPeriodically(callback); // Retry
    }, 5000);
  }
}

// Function to continuously search for a button element until found and click it
function searchAndClickButton(selector, callback) {
  const interval = setInterval(() => {
    const button = document.querySelector(selector);
    
    if (button) {
      button.click();
      clearInterval(interval);
      callback(); // Signal that this code segment is done
    }
  }, 1000);
}

// Function to check for the presence of an element containing specific text
function checkElement(selector, text, callback) {
  const interval = setInterval(() => {
    const elements = document.querySelectorAll(selector);

    for (const element of elements) {
      if (element.textContent.trim() === text) {
        clearInterval(interval);
        callback(element); // Signal that this code segment is done
        return;
      }
    }
  }, 100);
}

// Function to continuously search for a download button element until found and click it
function searchAndClickDownloadButton(selector, callback) {
  const interval = setInterval(() => {
    const downloadButton = document.querySelector(selector);
    
    if (downloadButton) {
      downloadButton.click();
      clearInterval(interval);
      callback(); // Signal that this code segment is done
    }
  }, 1000);
}

// Function to continuously search for a button element until found and click it
function searchAndClickButtonWithSVG(svgSelector, callback) {
  const interval = setInterval(() => {
    const svgElement = document.querySelector(svgSelector);
    
    if (svgElement) {
      const button = svgElement.closest('button');
      if (button) {
        button.click();
        clearInterval(interval);
        callback(); // Signal that this code segment is done
      }
    }
  }, 1000);
}

// Define the order in which the code segments will be executed
const codeSegments = [
  () => clickButtonPeriodically(segmentDone),
  () => searchAndClickButton('.mantine-UnstyledButton-root.mantine-Button-root.mantine-1vxfzrq', segmentDone),
  () => searchAndClickButton('.mantine-UnstyledButton-root.mantine-Button-root.mantine-fqua6i', segmentDone),
  () => checkElement('.mantine-Text-root.mantine-jeknur', 'Enhancer', segmentDone),
  () => searchAndClickDownloadButton('.mantine-UnstyledButton-root.mantine-ActionIcon-root[href*=".jpg"]', segmentDone),
  () => searchAndClickButtonWithSVG('svg.icon-tabler-repeat', segmentDone)
];

let currentSegmentIndex = 0;

function segmentDone() {
  currentSegmentIndex++;
  if (currentSegmentIndex >= codeSegments.length) {
    currentSegmentIndex = 0; // Reset to the beginning
  }
  codeSegments[currentSegmentIndex](); // Execute the next code segment
}

// Start executing the first code segment
codeSegments[currentSegmentIndex]();
