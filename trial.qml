import QtQuick 2.12
import QtQuick.Window 2.12

Window {


    property var  score : 0
    property var leftNo: Math.round(Math.random()*100)
    property var righttNo: Math.round(Math.random()*100)

    id:id_window
    visible: true
    width: 840
    height: 580
    title: qsTr("Alligator Game from trial")

    Image {
         id: id_Wallpaper
         source: "./images/Wallpaper.jpg"
         anchors.fill: parent
          }

    Text {
        id: id_Score
        text: qsTr("Score is : "+score)
         }

 //////////////////////////////////////////////////////////////////////////////////////////////////
 /*Code*/
    /*Row of Numbers*/
    Row{

        id:id_row1
        spacing: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent


        /*left num*/
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

               /*Mid placeholder*/
               Rectangle{

                   id:id_answer
                   width: 25/100 * id_window.width
                   height: 25/100 * id_window.height
                   color: "blue"



                   Image {
                       id: id_lftn_box_answer
                       source: "./images/square.jpg"
                       anchors.fill: parent

                   }
               }

               /*right num*/
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


/*Aligators*/

    Row{
        id:id_row2
        spacing: 40


        anchors.top: id_row1.bottom
        anchors.topMargin: 70

        anchors.left: parent.left
        anchors.margins: 12.5/100 * id_window.width + 30


        anchors.right:  parent.right


          /*LEFT*/
            Rectangle{
                id:id_left_face
                color: "transparent"
                width: 20/100 * id_window.width
                height: 20/100 * id_window.height



                Image {
                     id: id_l_img_face
                     source: "./images/left.png"
                     anchors.fill: parent
                     width: parent.width
                     height: parent.height
                }


                MouseArea {
                    anchors.rightMargin: 0
            anchors.bottomMargin: 66
            anchors.leftMargin: 0
            anchors.topMargin: 0


            anchors.fill: parent

                   drag.target:parent
                   drag.axis: Drag.XandYaxis

                    hoverEnabled: true

                    onHoveredChanged: {
                   parent.color="transparent"
                    }

                   onEntered:    {

                    // hover  parent.color="#40A2F513"
                    parent.color="#90A2F513"

                   }

                   onReleased: {

                    parent.color="transparent"

                       id_left_face.parent = id_answer
                         id_left_face.anchors.fill= parent

//if(id_left_face.x >id_answer.x && id_left_face.x + id_left_face.width < id_window.width - (id_answer.x + id_answer.width)   )
//                                   {console.log(id_answer.x)
//                                      console.log(id_row1.y)
//                                       console.log(id_left_face.x)
//                                     console.log(id_left_face.y//             }

//                       else{
//                           parent.x=0
//                            parent.y=0
//                           }


                   }

                  }


}

            /*Middel*/
              Rectangle{
                  id:id_mid_face
                  color: "transparent"

                  width: 23/100 * id_window.width
                  height: 23/100 * id_window.height

                  Image {
                      id: id_m_img_face
                      source: "./images/Front.png"
                       anchors.fill: parent
                  }
                  MouseArea {


                             anchors.fill: parent
                             drag.target:parent
                             drag.axis: Drag.XandYaxis

                             hoverEnabled: true

                             onHoveredChanged: {
                            parent.color="transparent"
                             }



                             onEntered:    {

                                              parent.color="#90A2F513"
                                         }



                             onReleased: {
                             parent.color="transparent"
                                parent.x= id_left_face.width + 30
                                 parent.y=0
                             }
                            }

}

            /*RIGHT*/
              Rectangle{
                  id:id_right_face

                  color: "transparent"
                  width: 20/100 * id_window.width
                  height: 20/100 * id_window.height
                  x:500
                  y:0


                  Image {
                      id: id_r_img_face
                      source: "./images/right.png"
                       anchors.fill: parent

                  }

                  MouseArea {


                             anchors.fill: parent
                             drag.target:parent
                             drag.axis: Drag.XandYaxis

                             hoverEnabled: true

                             onHoveredChanged: {
                            parent.color="transparent"
                             }



                             onEntered:    {

                                              parent.color="#90A2F513"
                                         }



                             onReleased: {
                             parent.color="transparent"
                                parent.x= id_left_face.width + id_mid_face.width +60
                                 parent.y=0
                             }
                            }
          }
    }

    function f ()
    {
        if(leftNo>righttNo)
            console.log("left > right")
        else if (righttNo> leftNo)
            console.log("right > left")
        else
            console.log("equal")
    }

 ////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////
/*test*/





  /////////////////////////////////////////////////////////////////////////////////////////




}
