Project Folder Structure
```
├── data                    
│   ├── external            <-- vitalDb 같은 외부 데이터
│   ├── interim             <-- process 중인 데이터
│   ├── processed           <-- 최종 처리된 데이터
│   └── raw                 <-- 원본데이터, 심볼릭 링크 추천
├── docker                  <-- 도커 관련
├── docs                    <-- 연구 관련 정리된 문서
├── models                  <-- 모델 관련 파일 저장
├── notebooks               <-- 정리된 노트북 파일 저장  ex. 0_khs_preprocessing.ipyn
│   └── under               <-- 
├── references              <-- 레퍼런스 자료 정리
├── reports                 <-- 결과 정리
│   └── figures             <-- 결과 그림
└── src                         <-- 소스 코드
    ├── main.py                 <-- pipeline code
    ├── data                    <-- dataset generation 
    │   ├── build_dataset.py
    ├── models                  <-- model 관련 코드
    │   ├── basic_model.py
    │   ├── predict_model.py
    │   └── train_model.py
    ├── preprocess              <-- 전처리 코드
    │   └── preprocess.py
    ├── utils                   <-- 유틸
    │   └── utils.py
    └── visualization           <-- vis 관련 코드
        └── visualize.py
```