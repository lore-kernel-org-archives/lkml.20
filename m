Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9345650AC33
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790379652; cv=none; b=DVqeb3DIaMhshbWnbbnEhZzBi1cf39rH+PlMKi0gu1p2SWZRcS9nPGIjEfu2BQF4OQA2RgE1JksY7h/RacfnaqSfjCDvlfMPfnZpXjNeb327dHge9Ik3mTNn/hCzcScUg841FshemII1D9/U6LMkCPdz7P1Tt+flnsbxI7vNdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790379652; c=relaxed/simple;
	bh=uRR+LIGULq3sIogdrp81ySdpjAgHU0suquUv/eZryA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TDuejPZU1jUy6hPynaW9MjN+xo7qJamzSExV6ncCS0qxareejMgnpoZHh4pU16hhXfIKC+EkTXBFI0JbILEKOk1a3JqGq88MhlQwXMD6MHCgLPyzbXpsrOtgDD35OtUFuiVRB4oZ4PqD/zcWSHaP3lAYy+8h4aezP4ccq+ENIHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huCJUmPp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huCJUmPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790379648; x=1821915648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRR+LIGULq3sIogdrp81ySdpjAgHU0suquUv/eZryA8=;
  b=huCJUmPp614aDbVCO6I/Wrh1R3hpioukLA5IMkrT9uSgKoyBNtLMxg8f
   C/nBQ+YTDdg01aenp5wziJ/kFPeuHXah7V7B9yr4ckEwhvdNhcr0tHYDI
   XUGvZcHBqMsgcI/K8rFOUPXh1vY2y2PfL+DxLJYbVizbD/jGbSs8NuL9f
   Fgsk+W3rlXEKSPEDQaWIQ+yv+6bKdjEWkHBn6CaiZ3Sd4PXAqV8vncm8Q
   OE7EHyA847vWjxJTE/glpLiMNfRNKcwgaDaK/NkFd2eUL58uMahnU3CBO
   UBoNOG2J3MDJqWepyjZ0r9ao/fdmT8/m9mBCBQro0SL/0HA5gmT31bewS
   Q==;
X-CSE-ConnectionGUID: RoFhqJWFR2yL8/xQfzX9WQ==
X-CSE-MsgGUID: Pz+UiIZeQP6Xo030pC5DQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91273149"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="91273149"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 16:40:47 -0700
X-CSE-ConnectionGUID: ctNNDOCaQRmQRbajfM1Gmw==
X-CSE-MsgGUID: djMhQB28Q/CvaZNRsdXG1w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2026 16:40:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAFX1-00000000LL5-0KWu;
	Fri, 25 Sep 2026 23:40:43 +0000
Date: Sat, 26 Sep 2026 07:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <ckoenig.leichtzumerken@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Subject: error: couldn't allocate output register for constraint 'ZB'
Message-ID: <202609260715.renJwQgG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
commit: 4e28aa8f7ee26d67a4addee6e3980f1cbf861b49 drm/drm_exec: avoid indirect goto
date:   3 months ago
config: loongarch-randconfig-r1306-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260715.renJwQgG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260715.renJwQgG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4e28aa8f7ee2 ("drm/drm_exec: avoid indirect goto")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260715.renJwQgG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'mm/kasan/generic.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'mm/kasan/shadow.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   '-d' is not a recognized feature for this target (ignoring feature)
   '-f' is not a recognized feature for this target (ignoring feature)
   '-ual' is not a recognized feature for this target (ignoring feature)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   '-d' is not a recognized feature for this target (ignoring feature)
   '-f' is not a recognized feature for this target (ignoring feature)
   '-ual' is not a recognized feature for this target (ignoring feature)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> <inline asm>:1:2: error: invalid instruction mnemonic 'dbar'
           dbar $16 
           ^~~~
   error: cannot compile inline asm
>> <inline asm>:1:2: error: invalid instruction mnemonic 'dbar'
           dbar $16 
           ^~~~
   error: cannot compile inline asm
>> <inline asm>:1:2: error: invalid instruction mnemonic 'dbar'
           dbar $16 
           ^~~~
   error: cannot compile inline asm
>> <inline asm>:1:2: error: invalid instruction mnemonic 'dbar'
           dbar $16 
           ^~~~
   error: cannot compile inline asm
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> <inline asm>:1:2: error: invalid instruction mnemonic 'dbar'
           dbar $16 
           ^~~~
   error: cannot compile inline asm
>> <inline asm>:1:2: error: invalid instruction mnemonic 'dbar'
           dbar $16 
           ^~~~
   error: cannot compile inline asm
>> <inline asm>:1:2: error: invalid instruction mnemonic 'dbar'
           dbar $16 
           ^~~~
   error: cannot compile inline asm
>> <inline asm>:1:2: error: invalid instruction mnemonic 'dbar'
           dbar $16 
           ^~~~
   error: cannot compile inline asm
   6 warnings and 14 errors generated.
--
   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'mm/kasan/generic.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'mm/kasan/shadow.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   '-d' is not a recognized feature for this target (ignoring feature)
   '-f' is not a recognized feature for this target (ignoring feature)
   '-ual' is not a recognized feature for this target (ignoring feature)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   '-d' is not a recognized feature for this target (ignoring feature)
   '-f' is not a recognized feature for this target (ignoring feature)
   '-ual' is not a recognized feature for this target (ignoring feature)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
   6 warnings and 3 errors generated.
--
   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'mm/kasan/generic.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'mm/kasan/shadow.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'loongarch64-unknown-linux-gnusf' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   '-d' is not a recognized feature for this target (ignoring feature)
   '-f' is not a recognized feature for this target (ignoring feature)
   '-ual' is not a recognized feature for this target (ignoring feature)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
   '-d' is not a recognized feature for this target (ignoring feature)
   '-f' is not a recognized feature for this target (ignoring feature)
   '-ual' is not a recognized feature for this target (ignoring feature)
   'loongarch64' is not a recognized processor for this target (ignoring processor)
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
>> error: couldn't allocate output register for constraint 'ZB'
   note: expanded from here
   6 warnings and 2 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
