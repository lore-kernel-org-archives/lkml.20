Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908982DBF75
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444913; cv=none; b=Ibg+b7gRagF2nILtxgJmgKjHTJX/Tz4fKXaWiH2wKdqLDM4hEkJ4LTK5SpzoQEHbF1dGdRf0bH57flinGm1FYzyCXVZTWw8TumNEI+fldUpwrSO1rSfKheHO0swi+zd4mfzBEcjP4n7Nohw4If/71d+WTZKt+8aXdRYTfrF9Y+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444913; c=relaxed/simple;
	bh=qg59zweW/qYQIlNV4hHJp3fSt8DWVtx3lIIJhxBNt5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gDU8SeEum0VN1Ptt/O8yBM7CsABc/fqQiDOuYnT003kYxIuRTa5N3hmSAz2aSNBnp0QKkF2mClqMpiCyyyPd991G5nMeNJOMXi2gDtH/VPkfpMnS4owWMqBxu30WKnewWxjAUoTC4p5wS8NXNC5ewKCwimslchoW4rp2o0LAdBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QncVIr3V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QncVIr3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790444911; x=1821980911;
  h=date:from:to:cc:subject:message-id;
  bh=qg59zweW/qYQIlNV4hHJp3fSt8DWVtx3lIIJhxBNt5Q=;
  b=QncVIr3VXLr6Qb1eRobN6uue6ND+zGT2ICqZTA7vGccIW1TmR0eHdq2B
   +JX131K/AWDmOtcgLHViUCvInOPTDYjUbaGfhxpbggsQvtpuBLVETr9O+
   EhKtDtqc3s3/viNbXO4v7ermDbL74kK++SZR1hMCEshraRzezrDWTNb3t
   S4Al1BgbjIDnzTrRT5U3Scoa54IQrA58NdW7dbi1PPDyF6wmUQTUW86ag
   PmOCGVJ2SA/xN8qzp5hNRcuttgEPdXyH84e6pO/QXlIKa8s3YunJ1adlF
   1iDwUB1/vnE9IxHGd0dm2utHY8dHDtJcERQUe8ZyqF5Ew7Ib5dJV8miOQ
   Q==;
X-CSE-ConnectionGUID: PM8LWEb9SDWGK02Enmtjqw==
X-CSE-MsgGUID: kiSN4U1qRIKRgDDDrloUuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90420601"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="90420601"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 10:48:31 -0700
X-CSE-ConnectionGUID: wSks79oHRqqE6B8qAB9FIA==
X-CSE-MsgGUID: +4WazN6hTeGd9tbpeSAY5A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2026 10:48:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAWVe-00000000M4H-2Hhj;
	Sat, 26 Sep 2026 17:48:26 +0000
Date: Sun, 27 Sep 2026 01:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>
Subject: arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202609270142.G035NbNx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6812ce4e4379ffc99c52401ec28f0d7ffbc36206
commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650 RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
date:   6 weeks ago
config: riscv-randconfig-r1308-20260926 (https://download.01.org/0day-ci/archive/20260927/202609270142.G035NbNx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270142.G035NbNx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270142.G035NbNx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse:    void ( [noderef] __rcu * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse:    void ( * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:30:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/riscv/kernel/kernel_mode_vector.c:30:9: sparse:    void ( [noderef] __rcu * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:30:9: sparse:    void ( * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:36:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/riscv/kernel/kernel_mode_vector.c:36:9: sparse:    void ( [noderef] __rcu * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:36:9: sparse:    void ( * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:111:41: sparse: sparse: cast removes address space '__rcu' of expression
   arch/riscv/kernel/kernel_mode_vector.c:111:41: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/riscv/kernel/kernel_mode_vector.c:111:41: sparse:    void ( [noderef] __rcu * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:111:41: sparse:    void ( * )( ... )

vim +27 arch/riscv/kernel/kernel_mode_vector.c

    24	
    25	void kvm_riscv_register_vctx_callback(void (*func)(void))
    26	{
  > 27		if (WARN_ON_ONCE(rcu_access_pointer(kvm_flush_vector_ctx_callback)))
    28			return;
    29	
    30		rcu_assign_pointer(kvm_flush_vector_ctx_callback, func);
    31	}
    32	EXPORT_SYMBOL_GPL(kvm_riscv_register_vctx_callback);
    33	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
