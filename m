Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84847F3D6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909165; cv=none; b=L4DVlnKcNsBZrP9P/6j14b3vvQKqlyKp57mNFzlKERBnh5U36DBdqLDr0BLdbOu6Vq0vAoohQr4cx4OUnIKTnc6pUofL1yFM3GtGwrQnPvVSGrKwePGetIGI351ZYtKZJs9AI+9vLxD7nS8A1VYb3DIZ3AUCg0t736Pu+XrN6lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909165; c=relaxed/simple;
	bh=DSiDOpMmUquduDsSMu4tk44x34aO8DCH49/is1LzedU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K3O71Mc3rrVAOdTjpaCWf/OueKHKU68ayyOB2ScN+iwI/DXvNWUP4+YJxgHuKay7ynIIi+jUiS9P6qxzdQq9dxslwa4KHnIC+52BNk56QTDiU9n6Klhtx2CuPw76vmQL/dJopxFsZ3D/KdbfEnOgKUs8wvfNc2vRyWhpTeCHDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPM5Wvxy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPM5Wvxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791909163; x=1823445163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DSiDOpMmUquduDsSMu4tk44x34aO8DCH49/is1LzedU=;
  b=BPM5WvxyF93Y+J/0xsUKfDT7GdKSFiW4l5kxbF9NP+MPTaFEC0lLhA3D
   W6bb2A7rqQqxpLd3k4cMUqhiEepzEbejszwslFqgXgTXUZLJzrSMHTIp3
   511aX6gTwC9/x7TreOs8HX5JXTChHs+vtfLjqFyBEskPSNXZTDNIrMFex
   v34XnknmNXd7kcwuOeAz1FOTyjbcJ/oTGC5KHnnkZkIhcxkQSluSVtu6Z
   Vz2Fs5MhV3VFM47SmZ6kBLpeKjNLnAz5vrZQb3qII4+ZMn1mYrOWm6Lsg
   NRTY+5C4v54WfO9T87EQAjgX/7oSiUYYmWPxXuTle77zi7RHkXyIMPy+l
   A==;
X-CSE-ConnectionGUID: UX8/Yl+kTeSrDt9uCcoGOA==
X-CSE-MsgGUID: XU1Rk7BqRXic8Comu9mGbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="649471"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="649471"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:32:43 -0700
X-CSE-ConnectionGUID: bDygvZD6StWpZPaXFgngig==
X-CSE-MsgGUID: HNIQ0jwSTtmMd5Lyt8947Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1168987"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 13 Oct 2026 09:32:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGfQa-00000000AaP-3IGG;
	Tue, 13 Oct 2026 16:32:36 +0000
Date: Tue, 13 Oct 2026 18:32:32 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: arch/riscv/kernel/alternative.c:208:6: error: use of
 undeclared identifier 'compat__vdso_alternatives_start_offset'; did you mean
 '__vdso_alternatives_start_cfi_offset'?
Message-ID: <202610131828.0hZsGdvF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
commit: 42cd1e1fc8995ec7ed5cc61957fc503eb065e0eb riscv: alternative: Also patch the compat vDSO
date:   10 weeks ago
config: riscv-randconfig-r2104-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131828.0hZsGdvF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131828.0hZsGdvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 42cd1e1fc899 ("riscv: alternative: Also patch the compat vDSO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131828.0hZsGdvF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/alternative.c:198:6: error: use of undeclared identifier '__vdso_alternatives_start_offset'; did you mean '__vdso_alternatives_start_cfi_offset'?
     198 |                                         __vdso_alternatives_start_offset,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         __vdso_alternatives_start_cfi_offset
   arch/riscv/include/asm/vdso.h:29:15: note: '__vdso_alternatives_start_cfi_offset' declared here
      29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
         |               ^
   arch/riscv/kernel/alternative.c:199:6: error: use of undeclared identifier '__vdso_alternatives_end_offset'; did you mean '__vdso_alternatives_end_cfi_offset'?
     199 |                                         __vdso_alternatives_end_offset);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         __vdso_alternatives_end_cfi_offset
   arch/riscv/include/asm/vdso.h:29:53: note: '__vdso_alternatives_end_cfi_offset' declared here
      29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
         |                                                     ^
>> arch/riscv/kernel/alternative.c:208:6: error: use of undeclared identifier 'compat__vdso_alternatives_start_offset'; did you mean '__vdso_alternatives_start_cfi_offset'?
     208 |                                         compat__vdso_alternatives_start_offset,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         __vdso_alternatives_start_cfi_offset
   arch/riscv/include/asm/vdso.h:29:15: note: '__vdso_alternatives_start_cfi_offset' declared here
      29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
         |               ^
>> arch/riscv/kernel/alternative.c:209:6: error: use of undeclared identifier 'compat__vdso_alternatives_end_offset'; did you mean '__vdso_alternatives_end_cfi_offset'?
     209 |                                         compat__vdso_alternatives_end_offset);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         __vdso_alternatives_end_cfi_offset
   arch/riscv/include/asm/vdso.h:29:53: note: '__vdso_alternatives_end_cfi_offset' declared here
      29 | extern size_t __vdso_alternatives_start_cfi_offset, __vdso_alternatives_end_cfi_offset;
         |                                                     ^
   4 errors generated.


vim +208 arch/riscv/kernel/alternative.c

   186	
   187	void __init apply_boot_alternatives(void)
   188	{
   189		/* If called on non-boot cpu things could go wrong */
   190		WARN_ON(smp_processor_id() != 0);
   191	
   192		_apply_alternatives((struct alt_entry *)__alt_start,
   193				    (struct alt_entry *)__alt_end,
   194				    RISCV_ALTERNATIVES_BOOT);
   195	
   196		if (IS_ENABLED(CONFIG_MMU))
   197			apply_vdso_alternatives(vdso_start,
   198						__vdso_alternatives_start_offset,
   199						__vdso_alternatives_end_offset);
   200	
   201		if (IS_ENABLED(CONFIG_RISCV_USER_CFI))
   202			apply_vdso_alternatives(vdso_cfi_start,
   203						__vdso_alternatives_start_cfi_offset,
   204						__vdso_alternatives_end_cfi_offset);
   205	
   206		if (IS_ENABLED(CONFIG_COMPAT))
   207			apply_vdso_alternatives(compat_vdso_start,
 > 208						compat__vdso_alternatives_start_offset,
 > 209						compat__vdso_alternatives_end_offset);
   210	}
   211	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
