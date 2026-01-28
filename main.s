import json


def generate_tests(api_spec):
    tests = []

    for endpoint in api_spec["endpoints"]:
        tests.append({
            "endpoint": endpoint["path"],
            "method": endpoint["method"],
            "type": "valid_request",
            "expected_status": 200
        })

        tests.append({
            "endpoint": endpoint["path"],
            "method": endpoint["method"],
            "type": "invalid_request",
            "expected_status": 400
        })

    return tests


def main():
    with open("api_spec.json") as f:
        api_spec = json.load(f)

    tests = generate_tests(api_spec)

    with open("output/test_cases.json", "w") as f:
        json.dump(tests, f, indent=2)

    print("API test cases generated successfully.")


if __name__ == "__main__":
    main()
