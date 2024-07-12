// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/jballerina.java;

# Converts TOML string to subtype of record.
#
# + s - Source TOML string value
# + options - Options to be used for filtering in the projection
# + t - Target type
# + return - On success, value belonging to the given target type, else returns an `toml:Error` value.
public isolated function parseString(string s, ReadOptions options = {}, typedesc<record {}> t = <>)
    returns t|Error = external;

# Converts byte[] to subtype of record.
#
# + s - Source TOML byte array
# + options - Options to be used for filtering in the projection
# + t - Target type
# + return - On success, value belonging to the given target type, else returns an `toml:Error` value.
public isolated function parseBytes(byte[] s, ReadOptions options = {}, typedesc<record {}> t = <>)
    returns t|Error = @java:Method {'class: "io.ballerina.lib.data.toml.Native"} external;

# Converts TOML byte-block-stream to subtype of record.
#
# + s - Source TOML byte-block-stream
# + options - Options to be used for filtering in the projection
# + t - Target type
# + return - On success, value belonging to the given target type, else returns an `toml:Error` value.
public isolated function parseStream(stream<byte[], error?> s, ReadOptions options = {}, typedesc<record {}> t = <>)
    returns t|Error = @java:Method {'class: "io.ballerina.lib.data.toml.Native"} external;

# Converts anydata TOML value to a string.
#
# + tomlValue - Input TOML value
# + config - Options used to get desired toString representation
# + return - On success, returns to string value, else returns an `toml:Error`
public isolated function toTomlString(record {} tomlValue, ToStringOptions config = {})
    returns string|Error = @java:Method {'class: "io.ballerina.lib.data.toml.Native"} external;

# Represent the options that can be used for filtering in the projection.
public type ReadOptions record {|
|};

# Configurations for to TOML conversion.
public type ToStringOptions record {|
|};

# Represents the error type of the ballerina/data.toml module. This error type represents any error that can occur
# during the execution of data.yaml APIs.
public type Error distinct error;

# Defines the name of the TOML Object key.
#
# + value - The name of the TOML Object key
public type NameConfig record {|
    string value;
|};

# The annotation is used to overwrite the existing record field name.
public const annotation NameConfig Name on record field;
