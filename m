Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914033469C;
	Sat, 19 Sep 2026 01:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789782722; cv=none; b=i8SRsM1VIzVUCf8fRTjwkKO82mKfxqZ6L50v1x3/5F89lpxJ5ODoIAoC3pN7GqdgR5px+vflOu7h+1HFf9YQTuoTzT1J7TzW4qgTQeNr88oUarEHe0+pA3qqxBBpCD5KHpUfU8QkiJyd+qPbZVcX9m8rKMeZDyfvuubN0rBTvW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789782722; c=relaxed/simple;
	bh=eHi0O9Ns6X89L9OYGaoFlRIk3tDCFSPMLOwA+uFdyes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6pS1N4hE4+hBj5HzKjauz1XLyVTJJb85ZFMW+oIK3eejsxa6oE//C5GvXcBG45whvyIkhUkYs7+aTsEKf3eEO483ujb8qBnGCj6R7fUa0xJt6oYx3fvJRDLqNOm0H0twcVc+PRiB+kgy+tqjI+bU+APAk7dgLdnmsIpldeKAkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJ4UaPMl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJ4UaPMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789782719; x=1821318719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eHi0O9Ns6X89L9OYGaoFlRIk3tDCFSPMLOwA+uFdyes=;
  b=WJ4UaPMli259MGLSyj2hazNmdpiZl9DP89I7H2EE+OVvsZoNl2AL0UNt
   gjhNlrqSFoOT9zJMpOt7EcwRrbW1QnRjomhR3p0RcGTGwJqJRrg7cal4b
   /h3SrIGCTwkdJiqYWIyhN/bdTUShXajE2l2yP7Wi0zzwTR8M0kwyiJPp5
   ypUyhPnjebgRXy7oZ1CkbeWosFB1977aTbSO4uUnnqXJXocQzUaZKrY27
   sufe621SZul5Z1HLuNjxZnl0TrKOKrra3K0XkmpX8ufpPEToGOR8HoxNV
   aR9j6rWqOBaVUsYp9i+wG9kQK6xbsPim6bK0bcCzp5zh9zU4eIbVvWPqW
   A==;
X-CSE-ConnectionGUID: VdiWPY58SGekSwIBl5jBzw==
X-CSE-MsgGUID: 2vWIuuysTdunUvCJSsPsww==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89454443"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89454443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 18:51:58 -0700
X-CSE-ConnectionGUID: zG2dtBZFQumderb7RF01oA==
X-CSE-MsgGUID: iPaffhS2Twq94KmHHxlTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="276617989"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Sep 2026 18:51:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7kF8-00000000AZF-258p;
	Sat, 19 Sep 2026 01:51:54 +0000
Date: Sat, 19 Sep 2026 09:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Zihao <guozh23@xiaopeng.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Liu Chao <liuc63@xiaopeng.com>
Subject: Re: [PATCH] media: cobalt: bound the dv timings to the descriptor
 buffers
Message-ID: <202609190912.ouKMS0Bi-lkp@intel.com>
References: <20260918072526.2478529-1-guozh23@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918072526.2478529-1-guozh23@xiaopeng.com>

Hi Guo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master sailus-media-tree/master linus/master sailus-media-tree/streams v7.3-rc3 next-20260918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Zihao/media-cobalt-bound-the-dv-timings-to-the-descriptor-buffers/20260918-152526
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260918072526.2478529-1-guozh23%40xiaopeng.com
patch subject: [PATCH] media: cobalt: bound the dv timings to the descriptor buffers
config: arm-randconfig-r1300-20260918 (https://download.01.org/0day-ci/archive/20260919/202609190912.ouKMS0Bi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190912.ouKMS0Bi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190912.ouKMS0Bi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/media/pci/cobalt/cobalt-v4l2.c:11:
   drivers/media/pci/cobalt/cobalt-v4l2.c: In function 'cobalt_s_dv_timings':
>> drivers/media/pci/cobalt/cobalt-driver.h:160:45: error: 'cobalt' undeclared (first use in this function)
     160 | #define cobalt_info(fmt, arg...) v4l2_info(&cobalt->v4l2_dev, fmt, ## arg)
         |                                             ^~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:67:9: note: in expansion of macro 'v4l2_printk'
      67 |         v4l2_printk(KERN_INFO, dev, fmt , ## arg)
         |         ^~~~~~~~~~~
   drivers/media/pci/cobalt/cobalt-driver.h:160:34: note: in expansion of macro 'v4l2_info'
     160 | #define cobalt_info(fmt, arg...) v4l2_info(&cobalt->v4l2_dev, fmt, ## arg)
         |                                  ^~~~~~~~~
   drivers/media/pci/cobalt/cobalt-v4l2.c:635:17: note: in expansion of macro 'cobalt_info'
     635 |                 cobalt_info("timings %ux%u out of range\n",
         |                 ^~~~~~~~~~~
   drivers/media/pci/cobalt/cobalt-driver.h:160:45: note: each undeclared identifier is reported only once for each function it appears in
     160 | #define cobalt_info(fmt, arg...) v4l2_info(&cobalt->v4l2_dev, fmt, ## arg)
         |                                             ^~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:67:9: note: in expansion of macro 'v4l2_printk'
      67 |         v4l2_printk(KERN_INFO, dev, fmt , ## arg)
         |         ^~~~~~~~~~~
   drivers/media/pci/cobalt/cobalt-driver.h:160:34: note: in expansion of macro 'v4l2_info'
     160 | #define cobalt_info(fmt, arg...) v4l2_info(&cobalt->v4l2_dev, fmt, ## arg)
         |                                  ^~~~~~~~~
   drivers/media/pci/cobalt/cobalt-v4l2.c:635:17: note: in expansion of macro 'cobalt_info'
     635 |                 cobalt_info("timings %ux%u out of range\n",
         |                 ^~~~~~~~~~~


vim +/cobalt +160 drivers/media/pci/cobalt/cobalt-driver.h

85756a069c55e0 Hans Verkuil 2015-05-12  157  
85756a069c55e0 Hans Verkuil 2015-05-12  158  #define cobalt_err(fmt, arg...)  v4l2_err(&cobalt->v4l2_dev, fmt, ## arg)
85756a069c55e0 Hans Verkuil 2015-05-12  159  #define cobalt_warn(fmt, arg...) v4l2_warn(&cobalt->v4l2_dev, fmt, ## arg)
85756a069c55e0 Hans Verkuil 2015-05-12 @160  #define cobalt_info(fmt, arg...) v4l2_info(&cobalt->v4l2_dev, fmt, ## arg)
85756a069c55e0 Hans Verkuil 2015-05-12  161  #define cobalt_dbg(level, fmt, arg...) \
85756a069c55e0 Hans Verkuil 2015-05-12  162  	v4l2_dbg(level, cobalt_debug, &cobalt->v4l2_dev, fmt, ## arg)
85756a069c55e0 Hans Verkuil 2015-05-12  163  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
