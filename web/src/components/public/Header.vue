<template>
  <div
    class="header"
    :class="{ header_show: headerShow, shadow: headerShowActive }"
  >
    <div class="header_container">
      <div class="header_content">
        <div class="logo">
          <router-link to="/">
            <img :src="logo_img[0].path" alt="logo" v-if="headerLogoShow" />
            <img :src="logo_img[1].path" alt="logo" v-else />
          </router-link>
          <div class="text">酷诺软件外包团队</div>
        </div>
        <div></div>
        <div class="menu-wrapper">
          <div class="menu-item" v-for="(nav, index) in navList" :key="index">
            <h2 class="menu-item-link">
              <router-link :to="nav.path">
                <span :class="{ a_text_dark: navDarkActive }">{{
                  nav.title
                }}</span>
              </router-link>
            </h2>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script lang="ts" setup name="AwHeader">
import { computed, onBeforeMount, ref, toRefs } from 'vue'
import { mapState, useStore } from 'vuex'

import type { MainStates } from '@/store'

type NavItem = {
  title: string
  path: string
}
type ImgItem = {
  path: string
}
const navList = ref<NavItem[]>([])
const logo_img = ref<ImgItem[]>([])
const store = useStore<MainStates>()

const headerShowActive = computed(() => store.state.headerShadowActive)
const headerShow = computed(() => store.state.headerShow)
const headerLogoShow = computed(() => store.state.headerLogoShow)
const navDarkActive = computed(() => store.state.navDarkActive)
logo_img.value = [
  {
    // path: require('../../assets/img/index/logo.png')
    path: require('@/assets/img/index/kerno.png')
  },
  {
    // path: require('../../assets/img/index/logoColor.png')
    path: require('@/assets/img/index/kerno.png')
  }
]
onBeforeMount(() => {
  navList.value = [
    {
      title: '首页',
      path: '/index'
    },
    {
      title: '新闻中心',
      path: '/news'
    },
    {
      title: '产品与服务',
      path: '/product'
    },
    {
      title: '人才招聘',
      path: '/job'
    },
    // {
    //   title: '客户服务',
    //   path: '/customer'
    // },
    {
      title: '登录',
      path: '/login'
    }
  ]
})
</script>
<style lang="less" scoped>
@nav_active_color: #3370ff;

h2 {
  margin: 0;
}

.header_show {
  transform: translateY(-62px);
}

.a_text_dark {
  color: rgba(0, 0, 0, 0.8);
}

.header {
  width: 100%;
  height: 60px;
  background-color: rgba(255, 255, 255, 0);
  //backdrop-filter: blur(0);
  box-shadow: none;

  position: fixed;
  z-index: 999;
  transition: transform 0.2s ease;

  //color: rgba(255, 255, 255, 1) !important;
  //transition: all 0.3s ease;
  .header_container {
    height: 100%;
  }
}

.shadow {
  background-color: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(8px);
  box-shadow: 0 1px 8px 0 rgba(0, 0, 0, 0.1);
}

// .header_content {
//   display: flex;
//   justify-content: space-between;
//   flex-direction: row;
//   height: 100%;
//   align-items: center;
//   padding: 0 96px;
//   margin: 0 auto;

//   .logo {
//     flex: 0 0 auto;

//     img {
//       height: 35px;
//     }
//   }
// }

.header_content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 100%;
  padding: 0 96px;
  margin: 0 auto;

  .logo {
    flex: 0 0 auto;
    display: flex;
    justify-content: flex-start; // 改为从左开始排列
    align-items: center;

    img {
      height: 35px;
      margin-right: 16px; // 添加右边距，以便与文字之间留有空隙
    }
    .text {
      // 新增文本样式
      flex: 0 0 auto; // 固定宽度
      font-size: 25px; // 文本大小
      color: rgb(82, 82, 82);
      font-weight: bold;
    }
  }
}

.menu-wrapper {
  display: flex;
  flex-direction: row;
  list-style: none;
  -ms-flex-align: center;
  align-items: center;
  padding: 0;
  margin: 0 0 0 20px;
  position: relative;

  .menu-item {
    flex-shrink: 0;
  }

  .menu-item:last-child:before {
    content: '';
    display: block;
    height: 12px;
    border-right: 1px solid #bbbfc4;
    //border-right: 1px solid #fff;
    position: absolute;
    bottom: 24px;
    right: 48px;
  }

  > .menu-item + .menu-item {
    margin-left: 40px;
  }

  .menu-item-link {
    //color: #646a73;
    font-weight: 400;
    font-size: 14px;
    line-height: 60px;
    cursor: pointer;
    position: relative;

    a {
      display: inline-block;
      color: rgba(255, 255, 255, 1);
      transition: color 0.3s;

      :hover {
        color: @nav_active_color;
      }
    }

    .router-link-exact-active {
      color: @nav_active_color;
      font-weight: 600;

      span:after {
        content: '';
        display: block;
        height: 2px;
        position: absolute;
        width: 26px;
        left: calc(50% - 13px);
        bottom: 14px;
        background-color: @nav_active_color;
      }
    }
  }
}

.nav_text_white {
  color: rgba(255, 255, 255, 1);
}

.nav_text_dark {
  color: rgba(0, 0, 0, 0.8);
}

@media only screen and (max-width: 991px) {
  .header_content {
    padding: 0 32px;
  }
}
</style>
