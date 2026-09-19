Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB93FC5A5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789816184; cv=none; b=rk/MRpoTgmDOXPlzGflmC5nfJygBExMGCcFQ3cVXrBnx+yplQ+lJRv3mwy2zWIRTFxRzQVQntLAVlMf/jRGLYid6gGIE7ddKWgcCU6zh8OJIpf2oTyfjWFwRzgah+I9wV32Fu4ag4ZtDNGuHGFp3ctVO6SM5gKBLsWubnqIK2D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789816184; c=relaxed/simple;
	bh=4P2aFyZp128S9F0EheZMEykdWrYFj0pDO3Hc9M7VWns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gsQsJGD7+W4Qhu87TXe5vw+rnc03zbss5pdIVsnSOKXNej8yAexksfBD0Yl8hF/5ivdGHqBDAFp35CVOkK15LPwwZ0Q6mw/3sjvLYIvVY9/biZOfArGn8Nob18Af01LsW7eFYLtLGGM62rKyvKRhZBlk/wuaDS8/SYwKwFJqy0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qv1JQrOk; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qv1JQrOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789816181; x=1821352181;
  h=date:from:to:cc:subject:message-id;
  bh=4P2aFyZp128S9F0EheZMEykdWrYFj0pDO3Hc9M7VWns=;
  b=Qv1JQrOkYPsJ8AhxskLXP6ONpZTOWLZYNJ+w1hYWkw2M+6f3Qtx3tuSb
   kZ40S+vw33cJBYdVQtY/voIwNIYYCc79UaeiCET9+uFfqX6lz0nN1poQ5
   H7ZhCYimoa93++0+v10YM8EhrSAHoThKO//lZ44guK/V56jTfIHtWSVNl
   +P0MhTRv3iGLn+hHhWvinsiQ6Yu+qfp7pHR+1wPkKYdVjUQ0FyPaTj2pV
   ursRWtMKS9/p45seKJv9OTYvc8wKTZR5i8rGn6CLm06XWJZbAog7obOXS
   1BVUrDJxw8nEYOA2ustLo7PKLxQ1fE9t6JGlL9qm0M3I6EodrWT1PM+ZP
   Q==;
X-CSE-ConnectionGUID: OA4tCZiyTemKw1G3dDb9uQ==
X-CSE-MsgGUID: kI9cD/9FTieZaPuFBxVlGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="858826"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="858826"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 04:09:40 -0700
X-CSE-ConnectionGUID: 6yY7nOSWTgiRvQGM9dnFGQ==
X-CSE-MsgGUID: thh0N/ndSnmeOXc7CpptyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="272119195"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Sep 2026 04:09:38 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7swq-000000001RE-0xJK;
	Sat, 19 Sep 2026 11:09:36 +0000
Date: Sat, 19 Sep 2026 13:08:58 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/riscv/include/asm/syscall_wrapper.h:39:14: warning:
 '__se_sys_fchroot' alias between functions of incompatible types 'long
 int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long
 int(long unsigned int,  long unsigned int,  long unsigne...
Message-ID: <202609191311.YMMsWkbk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40288c9206c17eb66a603262e06a58d300d0f279
commit: 20370a5f5d9b1549ab3bf10a898b4e024b8841fa fs: add fchroot()
date:   8 weeks ago
config: riscv-randconfig-r2106-20260919 (https://download.01.org/0day-ci/archive/20260919/202609191311.YMMsWkbk-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191311.YMMsWkbk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 20370a5f5d9b ("fs: add fchroot()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191311.YMMsWkbk-lkp@intel.com/

All warnings (new ones prefixed by >>):

     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:736:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:39:14: warning: '__se_sys_fchmodat' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:730:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:45:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:730:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:39:14: warning: '__se_sys_fchmodat2' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:724:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(fchmodat2, int, dfd, const char __user *, filename,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:45:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:724:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(fchmodat2, int, dfd, const char __user *, filename,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:39:14: warning: '__se_sys_fchmod' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:689:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:45:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:689:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
    ^~~~~~~~~~~~~~~
>> arch/riscv/include/asm/syscall_wrapper.h:39:14: warning: '__se_sys_fchroot' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:621:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(fchroot, int, fd, unsigned int, flags)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:45:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:621:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(fchroot, int, fd, unsigned int, flags)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:39:14: warning: '__se_sys_chroot' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:591:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    SYSCALL_DEFINE1(chroot, const char __user *, filename)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:45:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:591:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    SYSCALL_DEFINE1(chroot, const char __user *, filename)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:39:14: warning: '__se_sys_fchdir' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:571:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    SYSCALL_DEFINE1(fchdir, unsigned int, fd)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:45:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/open.c:571:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    SYSCALL_DEFINE1(fchdir, unsigned int, fd)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:39:14: warning: '__se_sys_chdir' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:86:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)


vim +39 arch/riscv/include/asm/syscall_wrapper.h

a9ad73295cc1e3 Sami Tolvanen     2024-03-11  16  
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  17  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  18  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  19  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  20  
08d0ce30e0e4fc Sami Tolvanen     2023-07-10  21  #define SC_RISCV_REGS_TO_ARGS(x, ...)							\
08d0ce30e0e4fc Sami Tolvanen     2023-07-10  22  	__MAP(x,__SC_ARGS								\
08d0ce30e0e4fc Sami Tolvanen     2023-07-10  23  	      ,,regs->orig_a0,,regs->a1,,regs->a2					\
08d0ce30e0e4fc Sami Tolvanen     2023-07-10  24  	      ,,regs->a3,,regs->a4,,regs->a5,,regs->a6)
08d0ce30e0e4fc Sami Tolvanen     2023-07-10  25  
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  26  #else
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  27  /*
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  28   * Use type aliasing to ensure registers a0-a6 are correctly passed to the syscall
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  29   * implementation when >word-size arguments are used.
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  30   */
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  31  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  32  	__diag_push();									\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  33  	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
175db11786bde9 Nathan Chancellor 2026-05-16  34  			"Type aliasing is used to sanitize syscall arguments");		\
175db11786bde9 Nathan Chancellor 2026-05-16  35  	__diag_ignore(clang, 23, "-Wunknown-warning-option",				\
175db11786bde9 Nathan Chancellor 2026-05-16  36  		      "Avoid breaking versions without -Wattribute-alias");		\
175db11786bde9 Nathan Chancellor 2026-05-16  37  	__diag_ignore(clang, 23, "-Wattribute-alias",					\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  38  			"Type aliasing is used to sanitize syscall arguments");		\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11 @39  	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  40  					ulong)						\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  41  			__attribute__((alias(__stringify(___se_##prefix##name))));	\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  42  	__diag_pop();									\
653650c468be21 Sami Tolvanen     2024-03-26  43  	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
653650c468be21 Sami Tolvanen     2024-03-26  44  			__used;								\
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  45  	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3 Sami Tolvanen     2024-03-11  46  

:::::: The code at line 39 was first introduced by commit
:::::: a9ad73295cc1e3af0253eee7d08943b2419444c4 riscv: Fix syscall wrapper for >word-size arguments

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
