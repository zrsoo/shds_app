import os
import json

def generate_json_for_assets(base_path, asset_folder, output_file):
    """
    Scans the specified asset folder and generates a JSON file
    containing all file paths relative to the base directory.

    Parameters:
    - base_path: The root path of the project.
    - asset_folder: The folder containing the assets (relative to base_path).
    - output_file: The path of the output JSON file.
    """
    assets = []
    asset_folder_full_path = os.path.join(base_path, asset_folder)

    for root, _, files in os.walk(asset_folder_full_path):
        for file in files:
            if not file.startswith('.'):  # Ignore hidden files
                relative_path = os.path.relpath(os.path.join(root, file), base_path)
                assets.append(relative_path.replace("\\", "/"))  # Normalize path for JSON

    # Write the assets to the JSON file
    with open(output_file, 'w') as json_file:
        json.dump(assets, json_file, indent=4)
    print(f"JSON file generated at {output_file} with {len(assets)} entries.")

# Example usage
base_path = os.getcwd()  # Change to your project's root directory if needed
asset_folder = "../sounds/"  # Relative path to your asset folder
output_file = "../json/sounds.json"  # Desired output JSON file name

generate_json_for_assets(base_path, asset_folder, output_file)