Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E5495AEA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072023; cv=none; b=iSf1UettBVpbG+qebRGTJ0TrwvN91/773mRUbdMv8+R/NtO4njlCwiVsGuyuqQajjvmqS88rwaizJz0HXvUP3OwyIU4JGjFhDpjQ81sNb1nIlWRmBdukFqtUNCWBlCslnB//6naE2uf6s8+RaMaAdav/BJJPwbs5a5zQ7Oe+NOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072023; c=relaxed/simple;
	bh=MlgDolm+PjZn9ICMc1uArJE74lf/vWV2uq+Y9/jZ/Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5USzZdpvASSPkNX0Z+NFsRqtTFAJS3wygDyBQ+vAgzUsHpBLDrlRISOuFQX/nd9MnTe77wGF9sUO9jrxbzluiO7QQuy572KcVuDC50LTWHZeptu1PL+k5iIXntAmKzhwlMNBWxrmJgNWww8g3IrwkCZwU13b7bnFORI2tYlLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exHgMk2P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exHgMk2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792072022; x=1823608022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MlgDolm+PjZn9ICMc1uArJE74lf/vWV2uq+Y9/jZ/Tw=;
  b=exHgMk2P8i8tOUJSItPNLw9iGPmkHpqyGfEADBubpVflfo9pWlRdkxHp
   rxJzkUtQHPZvC22HqkTiYA9Lhc2ksgVUxeqSByq/2OciGeR15iMvY4djO
   CAaLPaxTVvjQdWWEznZ+u4TJ3dmWo/fiMR9OeJ8+YGwmS+wwTiwv/k11t
   JrODUZjjTbiQ+qLv1tTWRWi6LedcpOWm+7UU9kXk97w3YiPSgsCrFC2WG
   JTDCzQPrYqprNe10HNL4bc78KlfrveRRjyg+wjJv15njSBW0KI/p/bDTn
   Dina4O7LEh/vyR68Nhvn7mM4RauA+BQgFTuzBNLyPMOihdNEVh6/16/zq
   Q==;
X-CSE-ConnectionGUID: VQ/gJOccTbCZ+/bATYJ2Qg==
X-CSE-MsgGUID: lAghCgHIR9ukb+dVmEe4RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="841850"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="841850"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 06:47:01 -0700
X-CSE-ConnectionGUID: jpak3QI9QCaxoS/+Fi3fAQ==
X-CSE-MsgGUID: xJggO6zRTgKtxKMXZ6jpxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1665926"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by orviesa003.jf.intel.com with ESMTP; 15 Oct 2026 06:46:57 -0700
Date: Thu, 15 Oct 2026 21:42:46 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: x86@kernel.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
	dave.hansen@intel.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	jgg@nvidia.com, nicolinc@nvidia.com, aik@amd.com,
	aneesh.kumar@kernel.org, seanjc@google.com, pbonzini@redhat.com,
	chao.gao@intel.com, vishal.l.verma@intel.com, xiaoyao.li@intel.com,
	kevin.tian@intel.com, chao.p.peng@intel.com
Subject: Re: [RFC PATCH 04/15] virt: tdx-guest: Support devsec TSM for secure
 devices
Message-ID: <atDYVoLFgxyncF3c@yilunxu-OptiPlex-7050>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-5-zhenzhong.duan@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924041032.1096569-5-zhenzhong.duan@intel.com>

> diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
> index dbbdc14383b1..2e9407f8bc70 100644
> --- a/drivers/virt/coco/tdx-guest/Kconfig
> +++ b/drivers/virt/coco/tdx-guest/Kconfig
> @@ -10,3 +10,18 @@ config TDX_GUEST_DRIVER
>  
>  	  To compile this driver as module, choose M here. The module will
>  	  be called tdx-guest.
> +
> +config TDX_CONNECT_GUEST

I asked the similar question on host side series On host, we enable all
tdx-module-supported features regardless. Then why should we make the
driver support configurable, any good reason to switch the driver off?

> +	bool "Intel TDX Connect Guest Support"
> +	depends on TDX_GUEST_DRIVER
> +	depends on PCI_TSM
> +	default y
> +	help
> +	  Support Trust Device Interface (TDI) feature enumeration,
> +	  validation, and activation within an Intel TDX guest.
> +
> +	  This option enables the guest kernel to establish secure,
> +	  isolated connections with trusted devices assigned to the TD,
> +	  validating MMIO maps and authorizing DMA remapping tables.
> +
> +	  If unsure, say Y.
