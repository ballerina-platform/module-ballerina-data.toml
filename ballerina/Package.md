# Ballerina TOML Data Library

The Ballerina data.toml library provides robust and flexible functionalities for working with TOML data within
Ballerina applications.
This library enables developers to seamlessly integrate TOML processing capabilities,
ensuring smooth data interchange and configuration management.

## Key Features

- **Versatile Input Handling**: Convert TOML input provided as strings, byte arrays, or streams of byte arrays into
  Ballerina's record sub-types.
- **Data Projection**: Efficiently project data from TOML,
  allowing for precise data extraction and manipulation.
- **Serialization**: Serialize Ballerina values into TOML-formatted strings, enabling easy generation of TOML content
  from Ballerina applications for configuration files, data storage, or data exchange purposes.

## Usage

### Converting external TOML document to a record value

For transforming TOML content from an external source into a record value,
the `parseString`, `parseBytes`, `parseStream` functions can be used.
This external source can be in the form of a string or a byte array/byte-block-stream that houses the TOML data.
This is commonly extracted from files or network sockets. The example below demonstrates the conversion of an
TOML value from an external source into a record value.

```ballerina
import ballerina/data.toml;
import ballerina/io;

type ServerConfig record {|
    int port;
    string host;
    string proxy;
|};

public function main() returns error? {
    string content = check io:fileReadString("path/to/<file-name>.yaml");
    ServerConfig serverConfig = check toml:parseString(content);
    io:println(serverConfig);
}
```

Make sure to handle possible errors that may arise during the file reading or YAML to anydata conversion process.
The `check` keyword is utilized to handle these errors,
but more sophisticated error handling can be implemented as per your requirements.

## Serialize anydata value to TOML

The serialization of anydata value into TOML-formatted strings can be done in the below way.

```ballerina
import ballerina/data.toml;
import ballerina/io;

public function main() returns error? {
    json content = {
        name: "Clean Code",
        author: "Robert C. Martin",
        year: 2008
    };
    string tomlString = check toml:toTomlString(content);
    io:println(tomlString);
}
```
