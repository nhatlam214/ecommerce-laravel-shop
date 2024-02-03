<ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{route('admin')}}">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Admin</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
      <a class="nav-link" href="{{route('admin')}}">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Slider
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <!-- Nav Item - Charts -->
    <li class="nav-item">
        <a class="nav-link" href="{{route('file-manager')}}">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>File Management</span></a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="{{route('banner.index')}}" >
        <i class="fas fa-image"></i>
        <span>Banner</span>
      </a>

    </li>
    <!-- Divider -->
    <hr class="sidebar-divider">
        <!-- Heading -->
        <div class="sidebar-heading">
            Shop
        </div>
    <!-- Categories -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="{{route('category.index')}}" >
          <i class="fas fa-sitemap"></i>
          <span>Category</span>
        </a>
    </li>
    {{-- Products --}}
    <li class="nav-item">
        <a class="nav-link collapsed" href="{{route('product.index')}}" >
          <i class="fas fa-cubes"></i>
          <span>Products</span>
        </a>

    </li>

    {{-- Brands --}}
    <li class="nav-item">
        <a class="nav-link collapsed" href="{{route('brand.index')}}" >
          <i class="fas fa-table"></i>
          <span>Brand</span>
        </a>
    </li>

    {{-- Shipping --}}
    <li class="nav-item">
        <a class="nav-link collapsed" href="{{route('shipping.index')}}">
          <i class="fas fa-truck"></i>
          <span>Shipping</span>
        </a>

    </li>

    <!--Orders -->
    <li class="nav-item">
        <a class="nav-link" href="{{route('order.index')}}">
            <i class="fas fa-hammer fa-chart-area"></i>
            <span>Order</span>
        </a>
    </li>

    <!-- Reviews -->
    <li class="nav-item">
        <a class="nav-link" href="{{route('review.index')}}">
            <i class="fas fa-comments"></i>
            <span>Rate</span></a>
    </li>


    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
      Posts
    </div>

    <!-- Posts -->
    <li class="nav-item">
      <a class="nav-link collapsed" href="{{route('post.index')}}" >
        <i class="fas fa-fw fa-folder"></i>
        <span>Posts</span>
      </a>

    </li>

     <!-- Category -->
     <li class="nav-item">
        <a class="nav-link collapsed" href="{{route('post-category.index')}}" >
          <i class="fas fa-sitemap fa-folder"></i>
          <span>Posts Type</span>
        </a>

      </li>

      <!-- Tags -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="{{route('post-tag.index')}}" >
            <i class="fas fa-tags fa-folder"></i>
            <span>Tags</span>
        </a>

    </li>

      <!-- Comments -->
      <li class="nav-item">
        <a class="nav-link" href="{{route('comment.index')}}">
            <i class="fas fa-comments fa-chart-area"></i>
            <span>Comments</span>
        </a>
      </li>


    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
     <!-- Heading -->
    <div class="sidebar-heading">
        General Settings
    </div>
    <li class="nav-item">
      <a class="nav-link" href="{{route('coupon.index')}}">
          <i class="fas fa-table"></i>
          <span>Coupon</span></a>
    </li>
     <!-- Users -->
     <li class="nav-item">
        <a class="nav-link" href="{{route('users.index')}}">
            <i class="fas fa-users"></i>
            <span>Account</span></a>
    </li>
     <!-- General settings -->
     <li class="nav-item">
        <a class="nav-link" href="{{route('settings')}}">
            <i class="fas fa-cog"></i>
            <span>Setting</span></a>
    </li>

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
