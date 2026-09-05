Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CACD35F609
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587712; cv=none; b=PE1rErbUKJuJTvlAELc8q4veBN/DGbd66Cl66wSWW1Xjwx+0LQE66I/0yXf6wkqdyz7k31hucJ7wxUPBBhd2X7wmjTSRtoovuvozkXA2CxeQ1J6i/RWKjjTW42LjSOhNFciCM+L77UtSDMS/JsGMzDBNuDGnYiOg57Hf54lXDuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587712; c=relaxed/simple;
	bh=k9OiaJHrxLy/Bhi5fd9rnlQBYuNV9QLvvVD5zvdpm18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rekTVqzu0qeyXId1KnNT2Mk33KedJrjOiBC1ihX4khwrUHnSFB6ZV3HdodOJv1jfxAhOeH7tgVszcdIN1CJcw/KriWYZxHJAb/46nTGasuiYvEhOxJXS4Yj8bb5sWpqRYrIP1mGZW9Ik1Cel/9nmSs5xbL5ZDj8IQnKA0F9RADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkX3n1S2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkX3n1S2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788587710; x=1820123710;
  h=date:from:to:cc:subject:message-id;
  bh=k9OiaJHrxLy/Bhi5fd9rnlQBYuNV9QLvvVD5zvdpm18=;
  b=jkX3n1S29CUPoBQW2qtkdgiS3fl8j4qdbYdEGkmaI5U/knnNadyqrhkw
   2oRAt9rHg0+q5DI8J8mLhpAd88hKv5Un8fJS7YrdX/xbHXtsccTpQcBv8
   1FMwj64PVH7Ps/owsPjwJp/yd+IhhTQdlZSQk+A6rvJqfsf6kyQR3T6Rj
   n5i4mbWZ78rVtz57Sp+Y5H8jyS0CVm+iSsYQJYUyRb0ItcOydBRIBYSBq
   hbLzGjWp9Fi3aIZG1JgLZdXhciD67YqGdim6M8mCBX8ys5Ljjs/u+QsRx
   e/18NtvcF2IITXBK99xzUMMLsTSGKQoP5fk0kdZKVCeiDb0no8YHHOZpL
   Q==;
X-CSE-ConnectionGUID: /sAxHVijSM+8+sJkm4oJWw==
X-CSE-MsgGUID: RAipGKqiSDKifVwDtG+98A==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106600897"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="106600897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 22:55:09 -0700
X-CSE-ConnectionGUID: 4+R/m+zcQfm1NIFMs2jJYw==
X-CSE-MsgGUID: lGsxRG6rTmm+pEVgji1ltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="268916929"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2026 22:55:08 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2jMo-00000000099-11dQ;
	Sat, 05 Sep 2026 05:55:06 +0000
Date: Sat, 05 Sep 2026 13:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.09.02a] BUILD REGRESSION
 02d3dbb63ea80cac75734d77309015f13d5e73c9
Message-ID: <202609051355.F1T2qXnd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.09.02a
branch HEAD: 02d3dbb63ea80cac75734d77309015f13d5e73c9  rcutorture: Disable RCU priority boost testing on non-TREE03 scenarios

Unverified Error/Warning (likely false positive, kindly check if interested):

    kernel/rcu/hazptrtorture.c:465:1: internal compiler error: in final_scan_insn_1, at final.cc:2823

Error/Warning ids grouped by kconfigs:

recent_errors
`-- csky-allmodconfig
    `-- kernel-rcu-hazptrtorture.c:internal-compiler-error:in-final_scan_insn_1-at-final.cc

elapsed time: 2128m

configs tested: 22
configs skipped: 0

tested configs:
alpha       allnoconfig    gcc-16.1.0
arc         allnoconfig    gcc-16.1.0
arm         allnoconfig    clang-17
arm64       allnoconfig    gcc-16.1.0
csky        allnoconfig    gcc-16.1.0
hexagon     allnoconfig    clang-24
i386        allnoconfig    gcc-14
loongarch   allnoconfig    clang-20
m68k        allnoconfig    gcc-16.1.0
microblaze  allnoconfig    gcc-16.1.0
mips        allnoconfig    gcc-16.1.0
nios2       allnoconfig    gcc-11.5.0
openrisc    allnoconfig    gcc-16.1.0
parisc      allnoconfig    gcc-16.1.0
powerpc     allnoconfig    gcc-16.1.0
riscv       allnoconfig    gcc-16.1.0
s390        allnoconfig    clang-24
sh          allnoconfig    gcc-16.1.0
sparc       allnoconfig    gcc-16.1.0
um          allnoconfig    clang-17
x86_64      allnoconfig    clang-22
xtensa      allnoconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
