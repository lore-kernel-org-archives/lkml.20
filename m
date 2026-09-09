Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F6759574B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989449; cv=none; b=N4DXYMXox6l8bp4Tk25eckNKWruK+CBrniF8JNcDSIFakVJPhAiLwmck59JxQL5LivPbB2w8+eJXWFOFDWB//qP4IdBiL0xkNG46ZQjQbNGoLbn/Fd2f+TH3jZGWYsyrc1KSkiT9FbKfbQnmcpoKW41RDqNdX9wFSsSNNYtZWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989449; c=relaxed/simple;
	bh=JlB3epDNkYuRu77ShtvE8KAnaQZhj6gdzdWXG9fRPU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hic68Vo1QngHmI3U8d0CuVqKqNsDCYpj5OlOtMZlrQJLn4o37KsyiGbGQEjDETcF5sV/oWj4pcCmW1GflwXDFmmsbErZtBsNIZedTktRGBBbPlxVqfL4GPDaWirs+pLOmhC9qQfuYJfdv4+SVmzzpwsyb4WIaaXednyFsZgPk1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TR0JFn0s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TR0JFn0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788989438; x=1820525438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JlB3epDNkYuRu77ShtvE8KAnaQZhj6gdzdWXG9fRPU0=;
  b=TR0JFn0sMi2Zw+E8JrJpIKfEVaI8idg6pt48FOZc7Gl0w0eFmaDwJ3pB
   6dPQas4T9fRC8zrrxy78xSyRt5D3hcROkCBVaZ5S2X/5I9kRSYyXpGhol
   jpS/uYphrNT/sm6zSsFSsLbJUu2P1IFIsVqPXECLyivwHUCZiYwzzEQxz
   yh+1Z5AtevdI45QsTnzwDha8dpMhdQFCl+mi3ii3oqNU4uJxW4oDo+1IM
   YxrQJCz8Gb+kh0490ZNrPkYzd2HklbRrxa3xiaW0qRu+jV+yPe07Uq5Mt
   wi8TZLA+P83Hyy14ceJT2jNlg8hOr6zUPN8qKPNiPLFZRjTk9JnTWYYGZ
   Q==;
X-CSE-ConnectionGUID: EgkslpkZQZO4Vu8U6VUcyQ==
X-CSE-MsgGUID: O5mk0wqpSSysjaTUphpheQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100088562"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="100088562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 14:30:36 -0700
X-CSE-ConnectionGUID: 3GHb/vWtSmaPylVHsJVXoQ==
X-CSE-MsgGUID: boGQXGgZRRWdDtxkaJ8RNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="265236508"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2026 14:30:33 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4PsE-000000000y8-08by;
	Wed, 09 Sep 2026 21:30:30 +0000
Date: Thu, 10 Sep 2026 05:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rui Qi <qirui.001@bytedance.com>, palmer@dabbelt.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: oe-kbuild-all@lists.linux.dev, Rui Qi <qirui.001@bytedance.com>,
	Deepak Gupta <debug@rivosinc.com>, Kees Cook <kees@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>,
	Drew Fustini <fustini@kernel.org>, Martin Kaiser <martin@kaiser.cx>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: crash: Add crash hotplug support
Message-ID: <202609100553.E6HUYviI-lkp@intel.com>
References: <20260908125155.1777895-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908125155.1777895-1-qirui.001@bytedance.com>

Hi Rui,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/kspp]
[also build test ERROR on linus/master kees/for-next/pstore v7.3-rc2 next-20260909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rui-Qi/riscv-crash-Add-crash-hotplug-support/20260908-205143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20260908125155.1777895-1-qirui.001%40bytedance.com
patch subject: [PATCH] riscv: crash: Add crash hotplug support
config: riscv-randconfig-r071-20260910 (https://download.01.org/0day-ci/archive/20260910/202609100553.E6HUYviI-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100553.E6HUYviI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100553.E6HUYviI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/crash_reserve.c:12:
   In file included from include/linux/kexec.h:38:
>> arch/riscv/include/asm/kexec.h:79:45: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      79 | void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
         |                                             ^
   arch/riscv/include/asm/kexec.h:82:39: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      82 | int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
         |                                       ^
   2 warnings generated.
--
   In file included from kernel/kexec.c:13:
   In file included from include/linux/kexec.h:38:
>> arch/riscv/include/asm/kexec.h:79:45: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      79 | void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
         |                                             ^
   arch/riscv/include/asm/kexec.h:82:39: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      82 | int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
         |                                       ^
>> kernel/kexec.c:138:61: error: incompatible pointer types passing 'struct kimage *' to parameter of type 'struct kimage *' [-Werror,-Wincompatible-pointer-types]
     138 |         if ((flags & KEXEC_ON_CRASH) && arch_crash_hotplug_support(image, flags))
         |                                                                    ^~~~~
   arch/riscv/include/asm/kexec.h:82:47: note: passing argument to parameter 'image' here
      82 | int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
         |                                               ^
   2 warnings and 1 error generated.
--
   In file included from kernel/crash_core.c:14:
   In file included from include/linux/kexec.h:38:
>> arch/riscv/include/asm/kexec.h:79:45: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      79 | void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
         |                                             ^
   arch/riscv/include/asm/kexec.h:82:39: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      82 | int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
         |                                       ^
>> kernel/crash_core.c:718:34: error: incompatible pointer types passing 'struct kimage *' to parameter of type 'struct kimage *' [-Werror,-Wincompatible-pointer-types]
     718 |         arch_crash_handle_hotplug_event(image, arg);
         |                                         ^~~~~
   arch/riscv/include/asm/kexec.h:79:53: note: passing argument to parameter 'image' here
      79 | void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
         |                                                     ^
   2 warnings and 1 error generated.
--
   In file included from arch/riscv/kernel/crash.c:8:
   In file included from include/linux/kexec.h:38:
>> arch/riscv/include/asm/kexec.h:79:45: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      79 | void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
         |                                             ^
   arch/riscv/include/asm/kexec.h:82:39: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      82 | int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
         |                                       ^
>> arch/riscv/kernel/crash.c:18:5: error: conflicting types for 'arch_crash_hotplug_support'
      18 | int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
         |     ^
   arch/riscv/include/asm/kexec.h:83:36: note: expanded from macro 'arch_crash_hotplug_support'
      83 | #define arch_crash_hotplug_support arch_crash_hotplug_support
         |                                    ^
   arch/riscv/include/asm/kexec.h:82:5: note: previous declaration is here
      82 | int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
         |     ^
>> arch/riscv/kernel/crash.c:53:6: error: conflicting types for 'arch_crash_handle_hotplug_event'
      53 | void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
         |      ^
   arch/riscv/include/asm/kexec.h:80:41: note: expanded from macro 'arch_crash_handle_hotplug_event'
      80 | #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
         |                                         ^
   arch/riscv/include/asm/kexec.h:79:6: note: previous declaration is here
      79 | void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
         |      ^
   2 warnings and 2 errors generated.


vim +/arch_crash_hotplug_support +18 arch/riscv/kernel/crash.c

    17	
  > 18	int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
    19	{
    20	#ifdef CONFIG_KEXEC_FILE
    21		if (image->file_mode)
    22			return 1;
    23	#endif
    24		/*
    25		 * For the kexec_load() syscall path, the user space kexec tool
    26		 * needs to indicate that the elfcorehdr segment is excluded from
    27		 * SHA verification by setting the appropriate flags.
    28		 */
    29		return (kexec_flags & KEXEC_UPDATE_ELFCOREHDR ||
    30			kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT);
    31	}
    32	
    33	unsigned int arch_crash_get_elfcorehdr_size(void)
    34	{
    35		unsigned int sz;
    36	
    37		/* kernel_map, VMCOREINFO and maximum CPUs */
    38		sz = 2 + CONFIG_NR_CPUS;
    39		if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
    40			sz += CONFIG_CRASH_MAX_MEMORY_RANGES;
    41		sz *= sizeof(Elf64_Phdr);
    42		return sz;
    43	}
    44	
    45	/**
    46	 * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
    47	 * @image: a pointer to kexec_crash_image
    48	 * @arg: struct memory_notify handler for memory hotplug case and
    49	 *       NULL for CPU hotplug case.
    50	 *
    51	 * Prepare the new elfcorehdr and replace the existing elfcorehdr.
    52	 */
  > 53	void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
    54	{
    55		void *elfbuf = NULL, *old_elfcorehdr;
    56		unsigned long mem, memsz;
    57		unsigned long elfsz = 0;
    58	
    59		/*
    60		 * As crash_prepare_elf64_headers() has already described all
    61		 * possible CPUs, there is no need to update the elfcorehdr
    62		 * for additional CPU changes.
    63		 */
    64		if ((image->file_mode || image->elfcorehdr_updated) &&
    65			((image->hp_action == KEXEC_CRASH_HP_ADD_CPU) ||
    66			(image->hp_action == KEXEC_CRASH_HP_REMOVE_CPU)))
    67			return;
    68	
    69		/*
    70		 * Create the new elfcorehdr reflecting the changes to CPU and/or
    71		 * memory resources.
    72		 */
    73		if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
    74			pr_err("unable to create new elfcorehdr");
    75			goto out;
    76		}
    77	
    78		/*
    79		 * Obtain address and size of the elfcorehdr segment, and
    80		 * check it against the new elfcorehdr buffer.
    81		 */
    82		mem = image->segment[image->elfcorehdr_index].mem;
    83		memsz = image->segment[image->elfcorehdr_index].memsz;
    84		if (elfsz > memsz) {
    85			pr_err("update elfcorehdr elfsz %lu > memsz %lu",
    86				elfsz, memsz);
    87			goto out;
    88		}
    89	
    90		/*
    91		 * Copy new elfcorehdr over the old elfcorehdr at destination.
    92		 */
    93		old_elfcorehdr = kmap_local_page(pfn_to_page(mem >> PAGE_SHIFT));
    94		if (!old_elfcorehdr) {
    95			pr_err("mapping elfcorehdr segment failed\n");
    96			goto out;
    97		}
    98	
    99		/*
   100		 * Temporarily invalidate the crash image while the
   101		 * elfcorehdr is updated.
   102		 */
   103		xchg(&kexec_crash_image, NULL);
   104		memcpy_flushcache(old_elfcorehdr, elfbuf, elfsz);
   105		xchg(&kexec_crash_image, image);
   106		kunmap_local(old_elfcorehdr);
   107		pr_debug("updated elfcorehdr\n");
   108	
   109	out:
   110		vfree(elfbuf);
   111	}
   112	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
