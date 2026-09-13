Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D18003D;
	Sun, 13 Sep 2026 00:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789257979; cv=none; b=b9eHvZhpDrhLnRsiPY3ECXiKL1zBepPedYRxz6RLx5L5Iqj1qm/fpPOrSn3OO/P6edENn0UrhYFKoU643F2PzPAFl77HOP4wqzUdRsGEKwbRTvIFAXfa8vJ/TH9M4wUq6bQTimfPAhXq4pvw1GZj04+74vmtBUZwF5qFsju7B+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789257979; c=relaxed/simple;
	bh=ZLnw49gKs05+08T6u7Y6BTWTd4oIBSYI6qdEDF3gZLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzO9nCoJ71bbLKqeYQUfNClWSXMmO18K0AL+tBief3tuT0qm4qMtyLJxsu/p1o1i6IRynaQvW44kKrqRNjruXE2AG4MG820SmAJ62yOXXZ18emA38VKR286PLpZvAU1caIbrfuyugdHIZqaXgvImIfZMyvqT8kEMO1ZAPDHINPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMEeYSwv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMEeYSwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789257977; x=1820793977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZLnw49gKs05+08T6u7Y6BTWTd4oIBSYI6qdEDF3gZLI=;
  b=LMEeYSwvDqAtY5O/KZxcqbGcoR8nCUgf0rHcPbE1sWF2UeYwcbN9sUkn
   IYO+NPA7VH5XdsOlW85+7zKUMH8ksbWJR97mjbt9HWrUMEDFh1EP7wB/u
   /MrrXXjLICj6htEC3j+M79KPBU/ZKL7BG3PjZpR471IheyL5teyANzQYK
   KWnG7E+CA6lE5BOFjg/cXeoIznEfNM72JPYkChfkJte6vULw4Mff6R/pg
   cC83lP5I3Omlu687tGW6s5O6/wpaB01LFaz5N5fr92JUDZeT+qBVRric3
   g5vz7ozpbdwhH+xMFp48a8qO0XbxuG/AXzx5RqAYli+ekc8DUGFNedr0Q
   Q==;
X-CSE-ConnectionGUID: VDKnDrhgSAmgPuMz1YatTw==
X-CSE-MsgGUID: tbE7WATOQQqvdgY3DwBeQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="88815040"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="88815040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 17:06:17 -0700
X-CSE-ConnectionGUID: nDhxSNVAQCSC7ntaZgHpww==
X-CSE-MsgGUID: Pg2fjvf0SUWFcgbAHBgKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="271782991"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Sep 2026 17:06:14 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5XjX-000000003Rv-0N8k;
	Sun, 13 Sep 2026 00:06:11 +0000
Date: Sun, 13 Sep 2026 08:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v3] drm/msm: default separate_gpu_kms to auto
 selection
Message-ID: <202609130700.PDgnlEpm-lkp@intel.com>
References: <20260909-separate_gpu_kms-v3-1-eae64dfbb635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-separate_gpu_kms-v3-1-eae64dfbb635@oss.qualcomm.com>

Hi Mahadevan,

kernel test robot noticed the following build errors:

[auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Mahadevan-P/drm-msm-default-separate_gpu_kms-to-auto-selection/20260909-191834
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260909-separate_gpu_kms-v3-1-eae64dfbb635%40oss.qualcomm.com
patch subject: [PATCH RESEND v3] drm/msm: default separate_gpu_kms to auto selection
config: arm64-randconfig-r133-20260912 (https://download.01.org/0day-ci/archive/20260913/202609130700.PDgnlEpm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130700.PDgnlEpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130700.PDgnlEpm-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/msm/msm_drv.o: in function `msm_separate_gpu_kms_components':
>> msm_drv.c:(.text+0x1938): undefined reference to `msm_count_mdp4'
>> aarch64-linux-ld: msm_drv.c:(.text+0x1940): undefined reference to `msm_count_mdp5'
>> aarch64-linux-ld: msm_drv.c:(.text+0x1978): undefined reference to `msm_count_mdp4'
   aarch64-linux-ld: msm_drv.c:(.text+0x197c): undefined reference to `msm_count_mdp5'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
