import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('Next Page')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/SecondPage',
              params:{
                src: '从index传至second的参数'
              }
            },).catch((error:Error)=>console.error(error.message))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}