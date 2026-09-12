Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8E30F819
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176302; cv=none; b=ggOLLuzIN6JPlYTjx3xBRN8+gUZqAOwQenQRNjtsgl5KEshJKhp7PHSP+s0IRRzZq6i2zqcgUzwk8jneSW7DNtJGmN1N4TLAs0YhPBLKNiA+BIHHiXoqqWb/0bxLhoa+9bmUnEZa3TV85br0/Qguqp/f1vu7V8iNJy7kan3BkAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176302; c=relaxed/simple;
	bh=YOk3cxlanGIdTmLtQtPKJDwT6LnOdcC7uVqrLVzgVRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fq1n5M56ubM30bIFVLq3G79wuSLHTlHHf1EOI5tEFcwz55gUh2Keu9bsxwWEgBHEf+nf6JvNOc3VLa+A7HQJ6pirAO8O/sutAQK6XALQlH3avY96KIVtDQPuYzZIUhIApqt3ODvl6GRkfP0/yBlQhqdmOx7HzyCP7oXvk+dnuWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FImGN4y1; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FImGN4y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789176301; x=1820712301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YOk3cxlanGIdTmLtQtPKJDwT6LnOdcC7uVqrLVzgVRU=;
  b=FImGN4y1Uta77wW6PCA0JhUBxCV5Q8W1VzNCjPxoNK9tpVaZMg08rt+i
   ofwjtNNDlKlefUnTaFsTZTiN5XK+v920jtaZ68OLciQYGc17hFUlNClUo
   6p5Fc9GWSM7iSGiAYk7DTrqYYeF8dghkXCAyDUJ4vh5uDPVCYNN8AmEjF
   BuDrhodkzGQ6yb7G9rhAEC+VZNdyUfp+dM+TOFjwEiQxhy7/N2h8PYekC
   gBXsr7oGBYvMu78WuJb0ISc9Rw8IZ0k0ePHhSqvEm4klSjqxEUUhjo2ia
   sdXJEt/+MuRcnJ5+xZWiAm2N4yZh5od+FHsQ2O0rex3utVmDNynqxsPon
   Q==;
X-CSE-ConnectionGUID: qDWb88ePRSayRkrnIWoziQ==
X-CSE-MsgGUID: LD1NfeQcSli427SQ/oDZHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="148702"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="148702"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 18:25:00 -0700
X-CSE-ConnectionGUID: 9W4u8baaQ/CzWlAcKyP6gg==
X-CSE-MsgGUID: iuQBu0n/Twu1nungr6zV7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="272047984"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Sep 2026 18:24:56 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5CU2-000000002VF-0PA5;
	Sat, 12 Sep 2026 01:24:49 +0000
Date: Sat, 12 Sep 2026 09:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Ingo Molnar <mingo@redhat.com>, Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] x86/mm/pat: use pr_warn() for early W^X warnings
Message-ID: <202609120931.Bo3Gyiqu-lkp@intel.com>
References: <20260911-fixes-verify-rwx-v2-1-e2cde39b6693@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-fixes-verify-rwx-v2-1-e2cde39b6693@kernel.org>

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on ebaf7c9bbb1e16523d7036e7e1225ad2dfcc6482]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport-Microsoft/x86-mm-pat-use-pr_warn-for-early-W-X-warnings/20260911-142843
base:   ebaf7c9bbb1e16523d7036e7e1225ad2dfcc6482
patch link:    https://lore.kernel.org/r/20260911-fixes-verify-rwx-v2-1-e2cde39b6693%40kernel.org
patch subject: [PATCH v2] x86/mm/pat: use pr_warn() for early W^X warnings
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260912/202609120931.Bo3Gyiqu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120931.Bo3Gyiqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120931.Bo3Gyiqu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from arch/x86/mm/pat/set_memory.c:6:
   arch/x86/mm/pat/set_memory.c: In function 'verify_rwx':
>> arch/x86/mm/pat/set_memory.c:708:30: error: expected ')' before numeric constant
     708 |                 pr_warn_once(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
         |                              ^
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:650:9: note: in expansion of macro 'DO_ONCE_LITE'
     650 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:669:9: note: in expansion of macro 'printk_once'
     669 |         printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/linux/printk.h:669:34: note: in expansion of macro 'pr_fmt'
     669 |         printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                  ^~~~~~
   arch/x86/mm/pat/set_memory.c:708:17: note: in expansion of macro 'pr_warn_once'
     708 |                 pr_warn_once(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
         |                 ^~~~~~~~~~~~
   include/linux/printk.h:483:24: note: to match this '('
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                        ^
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:650:9: note: in expansion of macro 'DO_ONCE_LITE'
     650 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:669:9: note: in expansion of macro 'printk_once'
     669 |         printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   arch/x86/mm/pat/set_memory.c:708:17: note: in expansion of macro 'pr_warn_once'
     708 |                 pr_warn_once(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
         |                 ^~~~~~~~~~~~


vim +708 arch/x86/mm/pat/set_memory.c

   667	
   668	/*
   669	 * Validate strict W^X semantics.
   670	 */
   671	static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long start,
   672					  unsigned long pfn, unsigned long npg,
   673					  bool nx, bool rw)
   674	{
   675		unsigned long end;
   676	
   677		/*
   678		 * 32-bit has some unfixable W+X issues, like EFI code
   679		 * and writeable data being in the same page.  Disable
   680		 * detection and enforcement there.
   681		 */
   682		if (IS_ENABLED(CONFIG_X86_32))
   683			return new;
   684	
   685		/* Only verify when NX is supported: */
   686		if (!(__supported_pte_mask & _PAGE_NX))
   687			return new;
   688	
   689		if (!((pgprot_val(old) ^ pgprot_val(new)) & (_PAGE_RW | _PAGE_NX)))
   690			return new;
   691	
   692		if ((pgprot_val(new) & (_PAGE_RW | _PAGE_NX)) != _PAGE_RW)
   693			return new;
   694	
   695		/* Non-leaf translation entries can disable writing or execution. */
   696		if (!rw || nx)
   697			return new;
   698	
   699		end = start + npg * PAGE_SIZE - 1;
   700	
   701		/*
   702		 * If the kernel text is still RWX, gently complain, this could be a
   703		 * false positive.
   704		 * Once debug_checkwx() becomes mandatory for CONFIG_STRICT_KERNEL_RWX,
   705		 * the warning can be removed completely.
   706		 */
   707		if (!kernel_set_to_readonly) {
 > 708			pr_warn_once(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
   709			  (unsigned long long)pgprot_val(old),
   710			  (unsigned long long)pgprot_val(new),
   711			  start, end, pfn);
   712			return new;
   713		}
   714	
   715		WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
   716			  (unsigned long long)pgprot_val(old),
   717			  (unsigned long long)pgprot_val(new),
   718			  start, end, pfn);
   719	
   720		/*
   721		 * For now, allow all permission change attempts by returning the
   722		 * attempted permissions.  This can 'return old' to actively
   723		 * refuse the permission change at a later time.
   724		 */
   725		return new;
   726	}
   727	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
