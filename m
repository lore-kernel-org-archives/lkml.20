Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A74A2620
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051968; cv=none; b=Y97MDkBC8EPIa+ntzdxhkPPvITFWthNONB2Ml1ufr++lQIw4KUIWmC+re0b0epabg/Aii0dYJjk5omHXlAMG2NFeKsrkXptsp/xnBTeSe4Kah/6ap79lzyW9aVInkg3a5+ysAlIIqra7PcqBfkVdoKJRQZvB14YSpl6pXLuZcLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051968; c=relaxed/simple;
	bh=uIcW9k3jfMx7Zs5lIQleYAh/1KN+i4Oza1LIgVYNaYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j5eRC0qd1r90L4Rcz9OrPF/C+raqq84OOXsg73b/03lK6v7BEuXsl5xZYsHepPVWf1rVS95kZYM6GmPCG27iMnA8XEceP9YXGyiC4ElFIBaYoJGaDle3/FcgonxL3jPRF8Njs9a9rMupHtvFky8CqqXXOpIS2kI3BNb+jZ96gTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lK8jvhWZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lK8jvhWZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789051966; x=1820587966;
  h=date:from:to:cc:subject:message-id;
  bh=uIcW9k3jfMx7Zs5lIQleYAh/1KN+i4Oza1LIgVYNaYk=;
  b=lK8jvhWZs4al+almbk56K4VwDZrJHFl8a5HxvT0Z8hz/F6G0k7SiV1BX
   EFVgez6m+DcOzrDPLDg7rjVM1J16tYu0gW2x5qAK6CIAJOPK82g2ZfuPe
   osNry9BXE5IZKmmwFpkjQOSIooF6Hl4EXIGhQe9ezR+RETJzHfwOQw0Je
   F1wiY82vgIN5+XEzyVOaJILUX3nQ+in5T72nXOm67z0vWrQ7wiU5DHYij
   587r6oaZ3NZeu3E2Rlq8yRMr3a1H6EAo9PpFpRocVGjPchMVliMM1foGR
   h/sSjCBfge2pSg/sJ/FceP5RCINsCQDLi9i28USu6NgSr6uaBXQhkwGgs
   w==;
X-CSE-ConnectionGUID: cMXDvjt7R1qKWL+g8Xfvhg==
X-CSE-MsgGUID: cf8iyzZzQ9KVMHKyAOhXaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89346272"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89346272"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:52:46 -0700
X-CSE-ConnectionGUID: V6yZnadNTyutWWmiuPcoTg==
X-CSE-MsgGUID: vS0hEAsXRhOHajoxgACiHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269897885"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 10 Sep 2026 07:52:45 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4g8o-0000000009M-0YI2;
	Thu, 10 Sep 2026 14:52:42 +0000
Date: Thu, 10 Sep 2026 22:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/kexec_efi.c:64:22: sparse: sparse:
 cast to restricted __le64
Message-ID: <202609102217.TEHigzNJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 55d990f0084c2b8ab9321dc59fc11dce855b4d61 LoongArch: Add EFI binary support for kexec_file
date:   11 months ago
config: loongarch-randconfig-r121-20260910 (https://download.01.org/0day-ci/archive/20260910/202609102217.TEHigzNJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609102217.TEHigzNJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609102217.TEHigzNJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/kexec_efi.c:64:22: sparse: sparse: cast to restricted __le64
   arch/loongarch/kernel/kexec_efi.c:65:23: sparse: sparse: cast to restricted __le64

vim +64 arch/loongarch/kernel/kexec_efi.c

    37	
    38	static void *efi_kexec_load(struct kimage *image,
    39					char *kernel, unsigned long kernel_len,
    40					char *initrd, unsigned long initrd_len,
    41					char *cmdline, unsigned long cmdline_len)
    42	{
    43		int ret;
    44		unsigned long text_offset, kernel_segment_number;
    45		struct kexec_buf kbuf;
    46		struct kexec_segment *kernel_segment;
    47		struct loongarch_image_header *h;
    48	
    49		h = (struct loongarch_image_header *)kernel;
    50		if (!h->kernel_asize)
    51			return ERR_PTR(-EINVAL);
    52	
    53		/*
    54		 * Load the kernel
    55		 * FIXME: Non-relocatable kernel rejected for kexec_file (require CONFIG_RELOCATABLE)
    56		 */
    57		kbuf.image = image;
    58		kbuf.buf_max = ULONG_MAX;
    59		kbuf.top_down = false;
    60	
    61		kbuf.buffer = kernel;
    62		kbuf.bufsz = kernel_len;
    63		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
  > 64		kbuf.memsz = le64_to_cpu(h->kernel_asize);
    65		text_offset = le64_to_cpu(h->text_offset);
    66		kbuf.buf_min = text_offset;
    67		kbuf.buf_align = SZ_2M;
    68	
    69		kernel_segment_number = image->nr_segments;
    70	
    71		/*
    72		 * The location of the kernel segment may make it impossible to
    73		 * satisfy the other segment requirements, so we try repeatedly
    74		 * to find a location that will work.
    75		 */
    76		while ((ret = kexec_add_buffer(&kbuf)) == 0) {
    77			/* Try to load additional data */
    78			kernel_segment = &image->segment[kernel_segment_number];
    79			ret = load_other_segments(image, kernel_segment->mem,
    80						  kernel_segment->memsz, initrd,
    81						  initrd_len, cmdline, cmdline_len);
    82			if (!ret)
    83				break;
    84	
    85			/*
    86			 * We couldn't find space for the other segments; erase the
    87			 * kernel segment and try the next available hole.
    88			 */
    89			image->nr_segments -= 1;
    90			kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
    91			kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
    92		}
    93	
    94		if (ret < 0) {
    95			pr_err("Could not find any suitable kernel location!");
    96			return ERR_PTR(ret);
    97		}
    98	
    99		kernel_segment = &image->segment[kernel_segment_number];
   100	
   101		/* Make sure the second kernel jumps to the correct "kernel_entry" */
   102		image->start = kernel_segment->mem + h->kernel_entry - text_offset;
   103	
   104		kexec_dprintk("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
   105			      kernel_segment->mem, kbuf.bufsz, kernel_segment->memsz);
   106	
   107		return NULL;
   108	}
   109	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
