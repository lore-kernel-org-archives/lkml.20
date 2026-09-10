Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2357D210
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063915; cv=none; b=SOq6omJVdyWeqAei1xn1JUMYCcOSoCnstB1OVATLON4Ec7SynzALcLIwa9F7dem9gopKHcxguwNp/Sxwtv4cPNRGpUdCMXg8lkFJMNskFEEgMGn2/s60rY923t9r9PbdyXsarTZ5S8X4mQibWZ2piCN4E3H3B8W40O5vUatXOGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063915; c=relaxed/simple;
	bh=GMYqENYUi5Z1Mq0Ec8HyYKlWE6vsuVBvqwAIr3y/ZVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U6lmjypLnaHcLw5ExV6I0i6JDYUXc38oYPBctq00CAoxSJey+P7r9JdrnwGDlrnVx0WDMNObCgTzgLw5nIREeA3NIMRDt+TqbjvojoT/+tPwSDqxTXB732PCtaoUIRIi5N6wnEsX2LUqknETak+XrsUT2DVNDt6phSHkgvg509g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5vfzCCV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5vfzCCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789063913; x=1820599913;
  h=date:from:to:cc:subject:message-id;
  bh=GMYqENYUi5Z1Mq0Ec8HyYKlWE6vsuVBvqwAIr3y/ZVQ=;
  b=V5vfzCCVSL7iQVD9dBBO7fQ9mgfQ7Jn77n/+wPfrU4Elxh1Qi/ZaDL5q
   goBlbKjW8ZijTBnW/AHBEd7MqdGvXOp3QyD6mjYLkd0RXX/h9LtULAiQf
   ZlOn9IehSGAF98VMXs101lzGgCQ9wmOMktnmw1rFuMb1+YY/G/wZuSfkL
   Qtl3nxAq7kV7lxM3hgi586fGNg7MERhS7cfJnmocCJX+KmSBnosYKzGi/
   DebY1qJlKXm6HkPZL7XgC2QHYpkvJB0Le2KZ5Zossbfc/m02yTNOCQEdt
   4efXdR+OeJU+GxT3zWm7LWSUK0y6Gdthl2GATLkFEfzdYRmIAa5GuXauM
   Q==;
X-CSE-ConnectionGUID: 1CNO3C0+S/KXjpH8Zv5ZYQ==
X-CSE-MsgGUID: ju3z1snLQs6bFIO5b30+Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89562943"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89562943"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 11:11:52 -0700
X-CSE-ConnectionGUID: ludtwnqPSDecs8xhHlliqQ==
X-CSE-MsgGUID: Qg1aMXVKSNKnQz+5DJskVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="270347127"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 11:11:51 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4jFU-000000000OL-1dVn;
	Thu, 10 Sep 2026 18:11:48 +0000
Date: Fri, 11 Sep 2026 02:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu:next] BUILD SUCCESS WITH UNVERIFIED
 WARNING 9d7a5ab4d4dfb32cd8638d544a5bc47f51f3a9f7
Message-ID: <202609110250.IFsYXPrU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: 9d7a5ab4d4dfb32cd8638d544a5bc47f51f3a9f7  Merge branches 'csd-lock.2026.09.03a', 'hazptr.2026.09.03a' and 'hrtimer_sleeper.2026.09.03a' into HEAD

Unverified Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202609110217.JyIWm88m-lkp@intel.com

    drivers/hid/hid-steam.c:557 steam_send_report_id() warn: check sign expansion for '__UNIQUE_ID_x__463'

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20260910
    `-- drivers-hid-hid-steam.c-steam_send_report_id()-warn:check-sign-expansion-for-__UNIQUE_ID_x__463

elapsed time: 1468m

configs tested: 71
configs skipped: 0

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    clang-17
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
