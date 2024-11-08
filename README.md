![메인페이지1](https://github.com/duwon1/04_Spring_airLine/assets/139448976/a2e13f27-d170-492a-a025-4e9ec443f521)
![예약페이지](https://github.com/duwon1/04_Spring_airLine/assets/139448976/0adfa1aa-ff11-45d9-9afb-c8b8f868e6c2)
## 항공편 예약 사이트
## 주제 및 목적1

- 주제
  - 항공기 예약 사이트
- 목적
  - 사용자에게 항공편정보를 제공 및 예약
    - 오픈 API 를 이용하여 데이터를 조회 
## 밴치마킹 사이트
- 대한항공(https://www.koreanair.com/?hl=ko)
## 요구사항
- 주요기능
  - 사용자에게 항공편 예약기능 (왕복&편도)
  - 사용자가 예약한 정보를 조회&취소 할수 있는 기능
  - 사용자가 자주 여행하는 지역을 예약 수를 토대로 추천
  
- 회원
  - 로그인(회원정보 수정&탈퇴)
  - QNA 작성&수정 

- 비회원
  - 회원가입
  
- 공통
  - 항공편 조회 및 예약&취소
  - 게시판(공지사항&QnA 읽기)
  - 인기여행지 확인

- 관리자
  - 공지사항(작성, 수정, 삭제)
  - Q&A 답변
  - 예약 정보(조회, 삭제)
  - 회원 정보(수정, 삭제)
## 작업일정
- 2023.05.16 ~ 06.02

## 기술스택
- 프론트엔드

  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">

- 백엔드
  
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
  <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">

## 데이터베이스 

  ![데이터베이스](https://github.com/duwon1/04_Spring_airLine/assets/139448976/9f3f4fce-9ba7-4883-8f32-8460da56273a)

  - 설명
    - 회원유저/비회원유저 모두 비행기를 예약할 수 있도록 로그인여부와 상관없이 새롭게 회원정보를 입력받았습니다
    - 매진처리를 위해 몇가지 방법을 사용하였습니다
      - 1. 항공편 고유번호를 예약자 정보를 통해 조회합니다
      - 2. 해당 항공편을 예약한 회원이 없다면 해당항공사에 부여된 비행기정보를 토대로 좌석수를 지정합니다
      - 3. 예약자가 존재한다면 예약자 수와 예약한 좌석등급을 통해 예약한 회원수를 조회합니다
      - 4. 이노코미 예약자가 3명 프레스티지 예약자가 4명이라면 해당 비행기정보의 좌석수에서 예약자 수 만큼 빼고 출력합니다.
      - 5. 예약자수와 좌석등급이 같아지면 매진처리됩니다.
    - 이름과 전화번호를 통해 자신이 예약한 항공편을 조회하고 취소할 수 있습니다.

  

## 분할구조도
  사용자&관리자(https://github.com/duwon1/04_Spring_airLine/issues/1)
## 기능정의서
- 사용자&공통(https://github.com/duwon1/04_Spring_airLine/issues/2)
- 관리자(https://github.com/duwon1/04_Spring_airLine/issues/3)

## 화면구성
  - 사용자(https://github.com/duwon1/04_Spring_airLine/issues/5)
  - 관리자(https://github.com/duwon1/04_Spring_airLine/issues/6)
  

  
  
