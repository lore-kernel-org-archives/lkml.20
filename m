Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362988;
	b=U/NQ85agpytmN4eut3KdQdTVUWjWAvCkckxxvEqjl8XRSrrb2Qt8mvV3UWpK7OVqd6Sn
	 kQfIi3C01CKEdrbHEiEvD+v1rQMXOHnFJr4AbXcBYbKhmAzyMdLnxOoikJSfjCb9d6Wmd
	 vUH1xM7Sig86angWXLGaHYPS0/mL5udGvS9dbsUTRBhpnK359AnPFm6aAEWUUewuGSPee
	 HDRaVKbVVrADhcy9bLJZDsPNEJBvmUPUTdPY7Iuy/+wSCa2vVuh+qAr4x02hWwYdDpszU
	 pG9ADAlKKeeKe6bzoFPop0O/ZsRB9fUwSv80l6s0y+ecovbeZps9vg3pTfNssv4/biQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362988;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SrsqvXlC23t2i5m9ChfHqk9o6LLSXHvLDjxr/6Kvutc=;
	b=fUTgVeyUKvwFKsQxRnrNWSlEKds/xCwh1OSxkC8ae54I5tZbbF0hlXIO+9llSLFSHicP
	 Mzzw1z6HUNveZoGZIO6vwnT+6cmH+lEEqcoKS8zv+LwomWpdLFgeMTVseFv9CNfrep4dE
	 dM/yDC+EZu4lXZgB5g/XZRey1swh0bGcKghrnIqJP74E9hJLMSRpPREQFjflS/vxZNTQS
	 8dFEUJYGDCoscjCh0mATD9hazMyTh04IQS830yP6actCgYD89sFSOv/vnfvssb+xP5sIT
	 KQ15jqHFAr/DrluHAshpByaddyLm5nSvC91JsFE1SSrT1erdDY6UpbecqKVrTOx5pMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTsisof6;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36824606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36824606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HTsisof6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793362987; x=1824898987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ID9kIcML3QOIWye5853SxH/ukl9r+Nhlp63hh+Bsm5I=;
  b=HTsisof6j8MrzbljoC6Szyj3dlDV/rH+zHtqMloV/3ifqRiQmjsMtxCf
   xO/ZbO2bDXA3Qm0shiHYruEXGLhs6dtqkahQQoNsVyqPkVPnPyeIaORXw
   wQfqb8z2tTXu9xhpLiHBAhLs1FWcB5QvveaVTA64AlMTFiihp1FWZVeLC
   HEFhBGoykyLkRLBY2e20cXHsIPybpoVPnf4RZaahMxxfJTEt+xrRvp7qG
   n+3IfmyVEjVrowhmzhQdytoiEzRT4rVhYKc2ADDlCV/ekU7siZw8EgbMw
   eYZES5sae4W2QxUYbAlwrMeOmT6tJCiNYhKtPA6R2OlqBpZbJJtujANW1
   Q==;
X-CSE-ConnectionGUID: qRDuTZ/zSTS6w/LnYNMn4A==
X-CSE-MsgGUID: B2xNTpTqSHKgsz+KyqqDew==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2037394"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2037394"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 05:23:06 -0700
X-CSE-ConnectionGUID: bP5UZm82QSG9AZNkt3Q4ow==
X-CSE-MsgGUID: CpMiLXDgTmK3iwlFMHO/kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5748123"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2026 05:23:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMldM-00000000biW-3P3d;
	Fri, 30 Oct 2026 12:23:00 +0000
Date: Fri, 30 Oct 2026 20:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Camacho Romero <michal.camacho.romero@linux.intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ning Sun <ning.sun@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Michal Camacho Romero <michal.camacho.romero@intel.com>,
	x86@kernel.org, iommu@lists.linux.dev,
	tboot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	Mateusz Mowka <mateusz.mowka@intel.com>,
	Adam Pawlicki <adamx.pawlicki@intel.com>,
	Pawel Randzio <pawel.randzio@intel.com>
Subject: Re: [PATCH v7 1/2] x86/tboot: Add support for parsing DTPR table and
 disabling TPRs
Message-ID: <202610302057.2LOBfy3p-lkp@intel.com>
References: <8549af9ea60b73e120be377877c26d929f1ad25e.1793273244.git.michal.camacho.romero@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8549af9ea60b73e120be377877c26d929f1ad25e.1793273244.git.michal.camacho.romero@linux.intel.com>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/x86/core linus/master v7.3 next-20261029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Camacho-Romero/x86-tboot-Add-support-for-parsing-DTPR-table-and-disabling-TPRs/20261029-125726
base:   tip/master
patch link:    https://lore.kernel.org/r/8549af9ea60b73e120be377877c26d929f1ad25e.1793273244.git.michal.camacho.romero%40linux.intel.com
patch subject: [PATCH v7 1/2] x86/tboot: Add support for parsing DTPR table and disabling TPRs
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20261030/202610302057.2LOBfy3p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610302057.2LOBfy3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610302057.2LOBfy3p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/tboot.c: In function 'tboot_check_txt_heap_section_bounds':
>> arch/x86/kernel/tboot.c:253:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     253 |         if ((u64)heap_section > heap_end || heap_end - (u64)heap_section < 8) {
         |             ^
   arch/x86/kernel/tboot.c:253:56: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     253 |         if ((u64)heap_section > heap_end || heap_end - (u64)heap_section < 8) {
         |                                                        ^
   arch/x86/kernel/tboot.c:266:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     266 |         if (*heap_section_size > heap_end - (u64)heap_section) {
         |                                             ^
   arch/x86/kernel/tboot.c: In function 'tboot_get_dtpr_table':
   arch/x86/kernel/tboot.c:699:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     699 |         if (heap_size == 0 || (u64)txt_heap + heap_size < (u64)txt_heap) {
         |                               ^
   arch/x86/kernel/tboot.c:699:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     699 |         if (heap_size == 0 || (u64)txt_heap + heap_size < (u64)txt_heap) {
         |                                                           ^
   arch/x86/kernel/tboot.c:704:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     704 |         heap_end   = (u64)txt_heap + heap_size;
         |                      ^
   arch/x86/kernel/tboot.c: In function 'tboot_check_tprs':
   arch/x86/kernel/tboot.c:862:40: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Wimplicit-function-declaration]
     862 |                         tpr_base_val = readq(base);
         |                                        ^~~~~
         |                                        readl
   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/init_task.h:5,
                    from arch/x86/kernel/tboot.c:9:
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:584:16: note: in expansion of macro 'KERN_INFO'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   arch/x86/kernel/tboot.c:863:25: note: in expansion of macro 'pr_info'
     863 |                         pr_info("TPR instance %u, TPR %u:base 0x%llx, limit 0x%llx\n", i, j,
         |                         ^~~~~~~
   arch/x86/kernel/tboot.c: In function 'tboot_disable_tprs':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:584:16: note: in expansion of macro 'KERN_INFO'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   arch/x86/kernel/tboot.c:936:25: note: in expansion of macro 'pr_info'
     936 |                         pr_info("TPR instance %u, TPR %u:base 0x%llx, limit 0x%llx\n", i, j,
         |                         ^~~~~~~
   arch/x86/kernel/tboot.c:941:33: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Wimplicit-function-declaration]
     941 |                                 writeq(tpr_base_val | TPR_BASE_DISABLE_BIT, base);
         |                                 ^~~~~~
         |                                 writel


vim +253 arch/x86/kernel/tboot.c

   235	
   236	static bool tboot_check_txt_heap_section_bounds(const u64 heap_end,
   237							void *heap_section,
   238							u64 *heap_section_size,
   239							const char *section_name)
   240	{
   241		if (!heap_section) {
   242			pr_err("%s section is NULL\n", section_name);
   243			return false;
   244		}
   245	
   246		if (!heap_section_size) {
   247			pr_err("%s section size pointer is NULL\n", section_name);
   248			return false;
   249		}
   250	
   251		*heap_section_size = 0;
   252	
 > 253		if ((u64)heap_section > heap_end || heap_end - (u64)heap_section < 8) {
   254			pr_err("%s size field exceeds heap boundary\n", section_name);
   255			return false;
   256		}
   257	
   258		/* Read the size of the current TXT Heap section */
   259		*heap_section_size = *(u64 __force *)heap_section;
   260	
   261		if (*heap_section_size < 8) {
   262			pr_err("%s size is too small\n", section_name);
   263			return false;
   264		}
   265	
   266		if (*heap_section_size > heap_end - (u64)heap_section) {
   267			pr_err("%s exceeds heap boundary\n", section_name);
   268			return false;
   269		}
   270	
   271		return true;
   272	}
   273	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
