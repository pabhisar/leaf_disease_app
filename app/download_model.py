from pathlib import Path
import gdown

path = Path(__file__).parent
export_file_name = 'leaf_model.pkl'
file_id = "1E2v1kURSb_5jgWM-2fASBBSyQxlKy_y1"
url = "https://drive.google.com/uc?id={}".format(file_id)

gdown.download(url=url, output=(path/export_file_name).as_posix())