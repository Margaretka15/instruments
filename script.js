let xhttp = new XMLHttpRequest();
let xml;

xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
        xml = this.responseXML;
        // getXML(this);
    }
};


xhttp.open("GET", "instruments.xml", true);
xhttp.send();

let displayElements = (type) => {

    let container = document.getElementById("container");
    container.innerHTML = "";

    let xpath;
    if (type !== undefined)
        xpath = "//instrument[@type=\"" + type + "\"]"; // wind\"]";
    else
        xpath = "//instrument";

    let nodes = xml.evaluate(xpath, xml, null, XPathResult.ANY_TYPE, null);
    container.innerHTML = generateHTML(nodes);
}

let form = document.getElementById("search-form");
form.addEventListener('submit', (e) => {
    e.preventDefault();
    searchForItem(document.getElementById("search-input").value);

    // let inputField = document.getElementById("search-input");
    // inputField.addEventListener("input", () => {
    //     searchForItem(document.getElementById("search-input").value)
    // });
})

function generateHTML(nodes) {
    let result = nodes.iterateNext();
    let content = "";
    while (result) {
        let name = (result.children[0].innerHTML);
        let category = (result.children[1].innerHTML);
        let image = (result.children[2].innerHTML);
        let description = (result.children[3].innerHTML);

        content += `<div class="card">
            <img src = ${image}>
            <div class="text-container red">
                <span class="name">${name}</span>
                <p>${description} </p>
                <span class="category-span">Category: ${category}</span>
            </div>
        </div>`

        result = nodes.iterateNext();

    }
    return content;
}

function searchForItem(phrase) {
    console.log(phrase)

    let container = document.getElementById("container");
    container.innerHTML = "";

    let xpath = "/instruments/instrument[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), \"" + phrase + "\") or contains(@type,\"" + phrase + "\")]";
    let nodes = xml.evaluate(xpath, xml, null, XPathResult.ANY_TYPE, null);

    container.innerHTML = generateHTML(nodes);


}