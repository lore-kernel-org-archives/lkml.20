Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FA9490BE2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332012; cv=none; b=oaUbvjcg4jdX1Hch43u40f0kHRj85iFP9Qp6JN5rjkZXsF3DcuLJ8cJV1AoBvhMrWGrpd4HWS5vrMXpTWhwuCRnosShOEJAugmp0579ritgS8gpQY5yp3UjkZ4EZ7srCHYd9IQv9o9wxznWtjLObBiDV5wZQPd+wZJldyqht6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332012; c=relaxed/simple;
	bh=tXND7gkGLshlq2wAn884jqGyw7z8LWmjIH+EF4z0XJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCE+KO6McRLYGvH6/F3GZlhq2WHEb7py32LOXhHda+Zo3rrd41LMHswKAp3DeBc2hhws+jmyalPUZPnKRWfPVSg7Xw20GKxZrif894ebkCAF9+c7Ms7Do0WZUdBDROVFL8QUZMwmoKqM/VisKrmCti4aTlzhEQd454UOibhGtCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWd6s2P3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWd6s2P3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790332011; x=1821868011;
  h=date:from:to:cc:subject:message-id;
  bh=tXND7gkGLshlq2wAn884jqGyw7z8LWmjIH+EF4z0XJM=;
  b=FWd6s2P3tKmA8Mzl3OjdGaFcuuSnzo1A3HEHyQScdv3XKyvV+M+lrUwD
   RddsdJjCdHLzxi3JpwnNwA/KJFr6wqcrOadKKzQpBJEKz5XGpEng3nzk0
   THzXgYG8AtiZFpRBEIWaCWX1PlgB7Fj/gaIEAWSftaPvIKrF1gvOS9Tgz
   QS5zyfHOqR+WoLy9Hlhu9yQGnYNjQIx2OsV15XOwpJQ622iQNhzOBJNpF
   ciPQCxXhz2k+oSUmzZA8pxkGDg6GQfdCZz0+jo2CczIMkrOYiozXcO3Cv
   noBRFK7ANfD5/2q6bcIp99nIMKFTX7PYrZ59JiGE45pxH0KmXindDZcpA
   w==;
X-CSE-ConnectionGUID: U/RxlfQ5QAKdp/lSHxXr0g==
X-CSE-MsgGUID: 6qSHjnN8Q/aZctmI+BRxQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116643959"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116643959"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:26:50 -0700
X-CSE-ConnectionGUID: Rm5BYBTDT6yl1lxSKE7Opg==
X-CSE-MsgGUID: Vnpsu7naQEysuRMKEmzu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="300565311"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2026 03:26:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA38f-00000000KSK-1zSL;
	Fri, 25 Sep 2026 10:26:45 +0000
Date: Fri, 25 Sep 2026 18:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>
Subject: arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202609251807.X3jcxqyP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650 RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
date:   6 weeks ago
config: riscv-randconfig-r1309-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251807.X3jcxqyP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6e714c8d91116794cb699cdf80c26afe9cda3ef3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251807.X3jcxqyP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251807.X3jcxqyP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse: sparse: cast removes address space '__rcu' of expression
   arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
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

vim +/__rcu +27 arch/riscv/kernel/kernel_mode_vector.c

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
