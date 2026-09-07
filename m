Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D2435C69D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746637; cv=none; b=uTZLtRL9MDVkU+TS+Iq79w6NbAMLRyu2CCVy+jPlu6H0TXdsq86mPK6LmwwD6OWS14wqGERBBU+JMrB8qrUmIyIL47v8D/zBMgds7UJHlkp6pHU6plRITWEBkjYaGD0OltnyQJ/BebmbSKr8tvE+on7TiBjUhuPTW4SFfMNOIDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746637; c=relaxed/simple;
	bh=8mYksM2jXQSHsHEL7egm+gIm/JXPg7ehRGMPhcW238I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BXVdnCw/FqXn6w0Cu3hEIpH8U0IUaoB3QuS7BwE5jOY/BO9cxsbZprVn6pkSAA6fsyI/KYirD/1B0BoHdqD8m19W7nIjgtuUpZ8bzu10WVaZff81selY28KYrAEMuXwxRGRCmAcklJZZAa0EhGQ4nUK+CbKBtM0LTzRV/rTnuYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVQIG0SL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVQIG0SL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788746634; x=1820282634;
  h=date:from:to:cc:subject:message-id;
  bh=8mYksM2jXQSHsHEL7egm+gIm/JXPg7ehRGMPhcW238I=;
  b=AVQIG0SLZ45zX/Foa+mw/7N9D/Pzo1r7MFdTSzpt1RCpqjhdV80+r6zQ
   0B+DDjdccYOwqy5AWfxeMUq70STOz+J6pe6778Br4ALy6/u4QhVuGT5m2
   RwhpeNHuOwbfLPPZIv3pHOdMFFVkS4NJKpO9j4o3csEzFcFR0eflPymtS
   Klh8itd1U7zg3GzQHJzNlhOplMr6gU94WQuHAGUmVCxPCfBbHU4gZU7j/
   xA/UgkRi2UYv8iwXhSX815xHDqVfSYU4HQlkKckhZ8T25MvYl+9orDftH
   onXgvEF4yz8yzobtKRJQK7lbsbLm3tf/ZngkwqcmuhLjS1H1Fx4X9dyQ2
   w==;
X-CSE-ConnectionGUID: rn9R7wiIRT+0d8XE+VvRgA==
X-CSE-MsgGUID: OAYBVV3DRfyf00Yxf52Jog==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="92846602"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="92846602"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 19:03:53 -0700
X-CSE-ConnectionGUID: m++IHw3RR5yOvIcVQRTVBA==
X-CSE-MsgGUID: yz9sqS/xTMK2o43KMjRxOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="266220270"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Sep 2026 19:03:51 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3Oi4-0000000037d-1naT;
	Mon, 07 Sep 2026 02:03:48 +0000
Date: Mon, 07 Sep 2026 10:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking:urgent] BUILD SUCCESS
 a3b8d46fe401cba3a5c46dea610e6eb3dc15370e
Message-ID: <202609071051.9pAw7z7F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/urgent
branch HEAD: a3b8d46fe401cba3a5c46dea610e6eb3dc15370e  futex: Prevent rcuwait use-after-free during requeue PI

elapsed time: 4037m

configs tested: 43
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc        allnoconfig    clang-24
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
s390          allnoconfig    clang-24
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
