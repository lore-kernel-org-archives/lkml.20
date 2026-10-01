Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F21E3AE1A8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877746; cv=none; b=r7CcPz/jJaqDZrZmjuAMo9CJrF++TUJjr+6Z987LtiNI1s2mTc1tgFjohTUKi5rwylTwkTGHDPBANwa9w0H1EjqiT0IZubG5/ostF8KJ+Dc2DvQbr8Xe7kr8pxtNHoCwH548G95dG8Gc08JY5M4m02ymaDBm6B2B0FvYaUiM12o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877746; c=relaxed/simple;
	bh=2PAOzND5QRX8jB/dy9XVVUwe9E76np9GGsUQj1BvjDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kEEg/nkgjrszBxI8cLXsedP3t3BhoebM4iIdckSqYGpXz/hOY2PGUGragvyPYHMMLg/przwb6vSl5fLgWYwUrpHs5riQ5WbiGHZ1wBElwzitFti0PS/ZaNtNBgsIUCFd7cRI4ibBFvUT+9kwrfTFi4Y+DeoTXXkhawa2e/3hadA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej9NLY9d; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej9NLY9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790877742; x=1822413742;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2PAOzND5QRX8jB/dy9XVVUwe9E76np9GGsUQj1BvjDo=;
  b=ej9NLY9d6RZNmTqeqBC5Aii4AceC6jXugYN5869Xg8ba7iwW7mPr9tnO
   JJiCiGNYynxyo7WYVJZdB+SQVcIAcbPDqGwUI2/1KwkbF5wyz0H4i+r65
   +1sVygjtgVYWtkFGDG4ziL1q3cIiibVLwqZ4FJMTIIKbX2+ZqidRj1cK1
   QQfarvVeMFykvj/dtJlYV3cdM7Q2LoTf78wq8BlmYjf88jnwedLx6M4Ci
   OIeUSNPhw6xygatw9iMuph0Wkykf/4yrRWUB3T86sJZWyQnyD+o8bo0XM
   PCwL7sqss8ybkSnF3TNuWMGekWSur/wKTjjfm4yiQbKA6c5VZudGkO3Wc
   A==;
X-CSE-ConnectionGUID: lNQTU5EiT6mMADHbOu1wOQ==
X-CSE-MsgGUID: EfGdpAd8S0SxqxNtzl9FSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90597787"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90597787"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:02:18 -0700
X-CSE-ConnectionGUID: Qrh/ocx2S5unBTxc8PDjfg==
X-CSE-MsgGUID: 4AT0QDQlTy+z5nliqXu33w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="135440"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 01 Oct 2026 11:02:16 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCL6j-000000000AR-357q;
	Thu, 01 Oct 2026 18:02:13 +0000
Date: Thu, 01 Oct 2026 20:02:13 +0200
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: /bin/bash: line 1: 1074947 Killed                  clang
 -Wp,-MMD,drivers/net/ethernet/intel/ice/.ice_common.o.d -nostdinc
 -Iarch/um/include -I./arch/um/include/generated -Iinclude -I./include
 -Iarch/um/include/uapi -I./arch/um/include/generated/uapi -Iin...
Message-ID: <202610011945.L7nGf9kD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   551c722f40809618230001baccf219193e22fc5a
commit: dc4305be467a6f84f66005cfc58557d56b5ab107 ice: use <linux/packing.h>=
 for Tx and Rx queue context data
date:   1 year, 10 months ago
config: um-randconfig-r2201-20260927 (https://download.01.org/0day-ci/archi=
ve/20261001/202610011945.L7nGf9kD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 761=
5da10b75c57286a4032eac8bb43c1b8d2ba46)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261001/202610011945.L7nGf9kD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: dc4305be467a ("ice: use <linux/packing.h> for Tx and Rx queue cont=
ext data")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011945.L7nGf9kD-lkp@i=
ntel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val =3D __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IO=
BASE + addr));
         |                                                         ~~~~~~~~=
~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from =
macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/intel/ice/ice_common.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IO=
BASE + addr));
         |                                                         ~~~~~~~~=
~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from =
macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/intel/ice/ice_common.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE=
 + addr);
         |                                                       ~~~~~~~~~~=
 ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE=
 + addr);
         |                                                       ~~~~~~~~~~=
 ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/intel/ice/ice_common.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:47:
   include/net/ip.h:481:14: warning: default initialization of an object of=
 type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the obj=
ect uninitialized [-Wdefault-const-init-var-unsafe]
     481 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
     128 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/net/ethernet/intel/ice/ice_common.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:55:
   In file included from include/net/vxlan.h:11:
   In file included from include/net/nexthop.h:17:
   include/net/ip6_fib.h:271:10: warning: default initialization of an obje=
ct of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the o=
bject uninitialized [-Wdefault-const-init-var-unsafe]
     271 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:129:3: note: expanded from macro 'time_after'
     129 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> /bin/bash: line 1: 1074947 Killed                  clang -Wp,-MMD,driver=
s/net/ethernet/intel/ice/.ice_common.o.d -nostdinc -Iarch/um/include -I./ar=
ch/um/include/generated -Iinclude -I./include -Iarch/um/include/uapi -I./ar=
ch/um/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -inc=
lude include/linux/compiler-version.h -include include/linux/kconfig.h -inc=
lude include/linux/compiler_types.h -D__KERNEL__ --target=3Dx86_64-linux-gn=
u -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimi=
zation-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argu=
ment -m64 -Iarch/x86/um -Iarch/x86/include -Iarch/x86/include/uapi -I./arch=
/x86/include/generated -I./arch/x86/include/generated/uapi -fmacro-prefix-m=
ap=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned=
-char -fno-common -fno-PIE -fno-strict-aliasing -mcmodel=3Dlarge -mno-sse -=
mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fno-builtin -m64 -fprofile-instr-gen=
erate -fcoverage-mapping -D__arch_um__ -Iarch/um/include/shared -Iarch/x86/=
um/shared -Iarch/um/include/shared/skas -Dvmap=3Dkernel_vmap -Dlongjmp=3Dke=
rnel_longjmp -Dsetjmp=3Dkernel_setjmp -Din6addr_loopback=3Dkernel_in6addr_l=
oopback -Din6addr_any=3Dkernel_in6addr_any -Dstrrchr=3Dkernel_strrchr -D__c=
lose_range=3Dkernel__close_range -D_LARGEFILE64_SOURCE -Derrno=3Dkernel_err=
no -Dsigprocmask=3Dkernel_sigprocmask -Dmktime=3Dkernel_mktime -fno-delete-=
null-pointer-checks -Os -fno-stack-protector -fomit-frame-pointer -ftrivial=
-auto-var-init=3Dzero -fno-stack-clash-protection -fstrict-flex-arrays=3D3 =
-fno-strict-overflow -fno-stack-check -Wall -Wundef -Werror=3Dimplicit-func=
tion-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstr=
ict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-=
address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-g=
nu -Wvla -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Wer=
ror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wex=
tra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-con=
st-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-neg=
ative-value -Wno-sign-compare -Wno-unused-parameter -gsplit-dwarf -g -gdwar=
f-4 -fno-var-tracking -gz=3Dzlib -DRANDSTRUCT -frandomize-layout-seed-file=
=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dretu=
rn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Idriv=
ers/net/ethernet/intel/ice -Idrivers/net/ethernet/intel/ice -Idrivers/net/e=
thernet/intel/ice -DKBUILD_MODFILE=3D'"drivers/net/ethernet/intel/ice/ice"'=
 -DKBUILD_BASENAME=3D'"ice_common"' -DKBUILD_MODNAME=3D'"ice"' -D__KBUILD_M=
ODNAME=3Dkmod_ice -c -o drivers/net/ethernet/intel/ice/ice_common.o drivers=
/net/ethernet/intel/ice/ice_common.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
