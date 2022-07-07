import QtQuick 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12


Window {

    //Variables
    property var  levels : 0
    property var  theScore : 0

    property var leftNo: generateNo()
    property var righttNo:generateNo()

    property var backgroundMusic: playbackgroundMusic()

    property var isValueTrue: checkTrue(leftNo,righttNo)


    id:id_window
    title: qsTr("Alligator Game"+ backgroundMusic)
    visible: true
    width: 840
    height: 580
    maximumWidth: 840
    minimumWidth: 840
    maximumHeight: 580
    minimumHeight: 580

    //Backgroud Image
    Image {
         id: id_Wallpaper
         source: "./images/Wallpaper.jpg"
         anchors.fill: parent
          }

    //Title
    Text {
        id:id_title
        text: qsTr("Choose the Correct Alligator's Face")
        font.pixelSize:  35
        font.bold: true
        font.letterSpacing: 2
        color: "black"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
         }

    //Score Box
     Rectangle{
       anchors.top: id_title.top
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.topMargin: 60
       color: "#1003D9402"
       width: 450
       height: 90

       Text {
        id:id_score
        text: qsTr(" Score : "+ theScore +"/10")
        font.pixelSize:  60
        font.bold: true
        font.letterSpacing: 2
        color: "gold"
         }
    }


    //Game Over Box, to appear when the game is done
    Rectangle {

    id:id_Game_over_box
    visible: false
    width: 85/100 * id_window.width
    height: 60/100 * id_window.width
    anchors.centerIn: parent
    z:1000

    Image {
       id: d
       anchors.fill: parent
       source: "./images/GameOver.jpg"
    }

    Text {
        id: id_Game_Over
        text: qsTr("   Game Over\nyour score is "+ theScore)
        color: "black"
        font.bold: true
        font.pixelSize: 70
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }


    //PLay again rectangle button (inside game-over box)
    Rectangle{
        id:id_play_again_button
        width: 60/100 * parent.width
        height: 15/100*parent.height
       anchors.verticalCenter: parent.verticalCenter
       anchors.horizontalCenter: parent.horizontalCenter
       color: "#FFCC00"
        border.color: "black"

        Text{
            text: qsTr("Play Again")
            color: "black"
            font.pixelSize: 10/100 * parent.width
            anchors.centerIn: parent
        }

        //click to play again
        MouseArea{
             anchors.fill: parent
             hoverEnabled: true

             onEntered: {
              parent.color="#90FFCC00"
             }

             onHoveredChanged: {
              parent.color="#FFCC00"
             }

             onClicked:{
                       theScore=0
                        levels=0
                        id_Game_over_box.visible=false
                       }
        }
    }

   //Quit or Back rectangle button (inside game-over box)
   Rectangle{
       width: 60/100 * parent.width
       height: 15/100*parent.height
       color: "#FFCC00"
       border.color: "black"

       anchors.bottom:  parent.bottom
       anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 110

       Text{
           text: qsTr("Quit")
           color: "black"
            font.pixelSize: 10/100 * parent.width
           anchors.centerIn: parent
       }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
             parent.color="#90FFCC00"
            }

            onHoveredChanged: {
             parent.color="#FFCC00"
            }

            onClicked:{
                close()
            }
         }
    }
  }

    //Sound SoundEffect Components

    //Boackground Music
    SoundEffect {
       id: backgroundMusic
       source: "./audios/BackgroundAudio.wav"
       loops: SoundEffect.Infinite
     }

    //Correct ans Sound Effect
    SoundEffect{
        id:id_correct_sound
        source: "./audios/Correct answer Sound effect 2.wav"
    }

    //Wrong ans Sound Effect
    SoundEffect{
        id:id_wrong_sound
        source: "./audios/WrongSoundEffect.wav"
    }


 //////////////////////////////////////////////////////////////////////////////////////////////////
 /* Game */

///////////////////////////////////////////////////////////////////////////
    //Row of the Numbers
    Row{
        id:id_row1
        spacing: 35/100 * id_window.width
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent

        //Left leaf Number
               Rectangle {
                id:id_left_num
                width: 25/100 * id_window.width
                height: 25/100 * id_window.height
                color: "transparent"

                   Image {
                       id: id_left_num_img
                       source: "./images/leaf.png"
                       anchors.fill: parent
                         }

                   Text {
                       id: id_lnum_txt
                       text: qsTr(""+ leftNo )
                       font.pixelSize:  25/100 * parent.width
                       font.bold: true
                       color: "white"
                       anchors.centerIn: parent
                        }

                }

         //Right leaf Number
             Rectangle {
               id:right_num
               width: 25/100 * id_window.width
               height: 25/100 * id_window.height
               color: "transparent"

               Image {
                   id: id_right_num_img
                   source: "./images/leaf.png"
                   anchors.fill: parent
               }

               Text {
                   id: id_rnum_txt
                   text: qsTr(""+ righttNo )
                   font.pixelSize: 25/100 * parent.width
                   font.bold: true
                   color: "white"
                   anchors.centerIn: parent
                    }
               }

    }
//End of the Row of Numbers
///////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////
      //Aligators Faces

          //LEFT Aligator's Face

            Rectangle{
                id:id_left_face
                color: "transparent"
                width: 20/100 * id_window.width
                height: 20/100 * id_window.height             
                x:15/100*id_window.width
                y:73/100*id_window.height
                z:10

                Image {
                     id: id_l_img_face
                     source: "./images/left.png"
                     anchors.fill: parent
                }

                Timer {
                     id:t1
                     interval: 2000;
                     running: false;
                     repeat: false

                     onTriggered: {
                         leftNo = generateNo()
                         righttNo = generateNo()
                         returnToPosition("left")
                         id_answer.color="#99C0BEBE"
                         checkifEndGame();
                        }
                 }


                //To Drag the Face
                MouseArea {
                   anchors.fill: parent
                   drag.target:parent
                   drag.axis: Drag.XandYaxis


                   onReleased: {

                       //if-condition checks if the Face is inside the answer-box interval, if yes: drop it, else return it to its position

                       if(parent.x>id_answer.x && parent.x+parent.width<id_window.width-id_answer.x
                                               && parent.y>id_answer.y && parent.y+parent.height<id_window.height-id_answer.y )
                           {
                           checkIfCorrect("left")
                           t1.start()
                           }
                       else
                           returnToPosition("left")
                   }
                }
          }

       //Middle Aligator's Face
            Rectangle{
              id:id_mid_face
              color: "transparent"
              width: 23/100 * id_window.width
              height: 23/100 * id_window.height
              x:40/100 * id_window.width
              y:70/100 * id_window.height
              z:10


              Image {
                   id: id_m_img_face
                   source: "./images/Front.png"
                   anchors.fill: parent
             }

             Timer {
                    id:t2
                    interval: 2000;
                    running: false;
                    repeat: false

                    onTriggered: {
                           leftNo = generateNo()
                           righttNo = generateNo()
                           returnToPosition("middle")
                           id_answer.color="#99C0BEBE"
                           checkifEndGame();
                       }
                    }

             MouseArea {
                     anchors.fill: parent
                     drag.target:parent
                     drag.axis: Drag.XandYaxis

                     onReleased: {

                         //if-condition checks if the Face is inside the answer-box interval, if yes: drop it, else return it to its position

                         if(parent.x>id_answer.x && parent.x+parent.width<id_window.width-id_answer.x
                                        && parent.y>id_answer.y && parent.y+parent.height<id_window.height-id_answer.y )
                          {
                          checkIfCorrect("middle")
                          t2.start()
                          }
                         else
                            returnToPosition("middle")
                       }
             }

          }

        //Right Alligator's Face
             Rectangle{

                id:id_right_face
                color: "transparent"
                width: 20/100 * id_window.width
                height: 20/100 * id_window.height
                x:67/100 * id_window.width
                y:73/100 * id_window.height
                z:10



                Image {
                   id: id_r_img_face
                   source: "./images/right.png"
                   anchors.fill: parent
                  }

                Timer {
                   id:t3
                   interval: 2000;
                   running: false;
                   repeat: false

                   onTriggered: {

                        leftNo = generateNo()
                        righttNo = generateNo()
                        returnToPosition("right")
                        id_answer.color="#99C0BEBE"
                        checkifEndGame();
                     }
                 }

                 MouseArea {
                        anchors.fill: parent
                        drag.target:parent
                        drag.axis: Drag.XandYaxis

                         onReleased: {

                             //if-condition checks if the Face is inside the answer-box interval, if yes: drop it, else return it to its position

                             if(parent.x>id_answer.x && parent.x+parent.width<id_window.width-id_answer.x
                                               && parent.y>id_answer.y && parent.y+parent.height<id_window.height-id_answer.y )
                              {
                              checkIfCorrect("right")
                              t3.start()
                              }
                             else
                                 returnToPosition("right")
                         }
                  }
          }

//End of the Aligators Faces
///////////////////////////////////////////////////////////////////////////



//Answer placeholder box
    Rectangle{
      id:id_answer
      anchors.centerIn: parent
      width: 25/100 * id_window.width
      height: 25/100 * id_window.height
      color: "#99C0BEBE"
    }

/* End of Game */
////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////
//Functions


    //takes 2 integer numbers and returns a string , either 'left' (if left no is >), 'right' (if right no is >) or 'equal'

    function checkTrue (L, R){

        if(L > R )
            return "left"
        else if (L < R)
            return "right"
        else if (L === R)
            return "middle"

        }



    // check if the choosen shape (answer) is correct or not, if true returns a string 'Correct', else 'Wrong'
    // + plays correct/wrong sounds
    // + colours the answer's box background (red/green) accordingly
    // + increments the score if correct answer is choosen, atherwise remains the same

    function checkIfCorrect(shape){

        if (checkTrue(leftNo,righttNo) === shape)
        {
         id_answer.color="#4DF305"
           id_correct_sound.play()
         theScore = theScore+1
        return "Correct"
        }
       else
        {
         id_answer.color="#DE1919"
         id_wrong_sound.play()
         return "Wrong"
        }
     }


    // generates a new Random Number

    function generateNo(){
      return Math.round(Math.random()*100)
     }

    // Returns the Aligators Faces to its initial position, according to the passed parameter strings =>'left', 'middle', 'right'

    function returnToPosition(face){

        if(face==="left")
             {id_left_face.x=15/100 * id_window.width
              id_left_face.y=73/100 * id_window.height}

        else if(face==="right")
             {id_right_face.x= 67/100 * id_window.width
              id_right_face.y=73/100 * id_window.height}

        else if(face==="middle")
        {id_mid_face.x=40/100 * id_window.width
            id_mid_face.y=70/100 * id_window.height}
    }



    //Plays the Bacground Music

    function playbackgroundMusic(){
        backgroundMusic.play()
    }


    //Checks if the Game levels has exceeded or not (10 levels), if true, reassigns the  score and levels to 0

    function checkifEndGame(){
    if(levels>=9)
        id_Game_over_box.visible=true;
    else
        levels=levels+1
    }


}
//End
//////////////////////////////////////////////////////////////////////////////////////
