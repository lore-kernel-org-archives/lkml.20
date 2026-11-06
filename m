Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932205;
	b=RaYetGB5LFvNLSyZnewwwmgjov3qXVdO2aBIlr4zD1V4ZQ/YqHUNkietSfldQYVTFnwm
	 dTW63AllopgS8Au1lLIYq/0NmX7C0UhHM3HarHGyf+2AMORUb1wlOvcegfJEn4h+UCy69
	 KjLvDHMIZYYScqjgfdzhGT53sAY9Ks/cS/Kv2fvoDKxou0UEy4T1vWvpyx/XlkN6NqLcH
	 MafivaZTDv3mGItEynjPUUAtFoi1i8rYc1i2Oew0eua02CYAZAenT/I1yKQIlda9Bi40n
	 U2307pCF2uXXQhAiMEddqsBDMdwGK44bCmFF5DJFZQHawCBWh+DMETvW/hY0ViEoVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932205;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iz3HkQ8S5G/MQ2i6xDUU1DsVvSdEnv/maZkfcMkgzs8=;
	b=HgzgqV9srFzpRH11Zku6HEFsCM3/BEx+jg0AZdhUFyabty+uE47nTAjHl+4W/XuqsFMi
	 1q1HIZuIK3JkSPtdzlwHp2WuY+oWFCE7yKqAl0XTny+Y4g1DvBkPdu8kjjjG98wOH9M7B
	 2HGMmVxFVcGrOHdW3fC0F/KzmmH+LMVmGEn0sS1q1ppzJuWCT0euQXJr5oLrEgUfF01kI
	 Avg1fRs066l0/9c+UYjR384IlDdkJj9+9W9KmPXsv4Q5oci9Z38ihtAUTW2ypyeoNnQtP
	 k+NE5aDHFTqXLHTFuM7JxwAhCZuLaPptcDMFpCuemveTO9JoDIWKXiEjM5vbCWsaN2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IFBsEjIR;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920DC606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920DC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IFBsEjIR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793932203; x=1825468203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2bnU+hnGrKYfloG+zTnJKn1FMGS0ygPDx+kuky5Yi54=;
  b=IFBsEjIRJnhWf9PYwKqkTrwJKqMjj6GkHzPElXpyP0DR/+0vyrJ7BiNm
   VhE+Jbvax5zf14AGnyWatFqzXVfDqFyIJhejiA2IEz9/5NZhMtaUJb14A
   8A4kP93GT6JUMW3NaShdF3MBdubgVWPYte7kxfr0fATqaGnO9ERoS/Yer
   +hhIWOzzxMT4QbRxCiuQOyt3JBPVWDFm2Bed8ohve9ypX7gGr97MtivJq
   qRUm915YFD9nCZnKijuW9G+XEKPUqfUel4+KYjmCIqWsCwozZw++pkei1
   MQnmC5ic5HrysUsQvOBTIMRdv2X0DLsHHDSHQ86WDfvgjEpcpu1wS26iH
   A==;
X-CSE-ConnectionGUID: Ry6EK4eDSguzgr39qGAXvw==
X-CSE-MsgGUID: l/JtYqfWTLadz5VH2F16Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2640274"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2640274"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 18:30:01 -0800
X-CSE-ConnectionGUID: oR5yJ2edRGelgA0+PDF/Ig==
X-CSE-MsgGUID: q0Qh1rswRDGuNJoMg9CT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6999021"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2026 18:29:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP9i7-00000000nCd-0Cju;
	Fri, 06 Nov 2026 02:29:47 +0000
Date: Fri, 6 Nov 2026 10:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Ingo Molnar <mingo@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH 3/7] x86: make CX8 usage unconditional
Message-ID: <202611060951.0UkJ1SVg-lkp@intel.com>
References: <20261105163440.2381661-4-arnd@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105163440.2381661-4-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on uml/next linus/master v7.4-rc1 next-20261105]
[cannot apply to uml/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/x86-remove-AMD-lan-remnants/20261105-173432
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20261105163440.2381661-4-arnd%40kernel.org
patch subject: [PATCH 3/7] x86: make CX8 usage unconditional
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20261106/202611060951.0UkJ1SVg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060951.0UkJ1SVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060951.0UkJ1SVg-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: kernel/fork.o: in function `arch_atomic64_set':
>> arch/x86/include/asm/atomic64_32.h:108:(.text+0x5fd): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: kernel/ksysfs.o: in function `arch_atomic64_read':
>> arch/x86/include/asm/atomic64_32.h:117:(.text+0x58): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: kernel/sched/fair.o: in function `arch_atomic64_add':
>> arch/x86/include/asm/atomic64_32.h:165:(.text+0x1c52): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: kernel/sched/build_policy.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x2790): undefined reference to `atomic64_add_return_cx8'
>> /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:165:(.text+0x5310): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: kernel/printk/printk.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0xf41): undefined reference to `atomic64_set_cx8'
>> /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:108:(.text+0xf57): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: kernel/printk/printk.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x115f): undefined reference to `atomic64_read_cx8'
>> /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x1188): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: kernel/printk/printk.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x1228): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: kernel/printk/printk.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x242a): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x248d): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x2501): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x2560): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: kernel/printk/printk.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x25c3): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:108:(.text+0x25e4): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: kernel/time/timekeeping.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x32d3): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x339e): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: kernel/futex/core.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0xbf9): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: kernel/futex/core.o: in function `arch_atomic64_inc_return':
>> arch/x86/include/asm/atomic64_32.h:144:(.text+0xc13): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: fs/inode.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x4cd): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: fs/inode.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x1df4): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x1f3c): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/ext4/mballoc.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x253a): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: fs/ext4/mballoc.o: in function `arch_atomic64_inc':
   arch/x86/include/asm/atomic64_32.h:181:(.text+0x2ac8): undefined reference to `atomic64_inc_return_cx8'
>> /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0x4d1a): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0x4ee5): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0x4f7b): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0x523a): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: fs/ext4/mballoc.o:arch/x86/include/asm/atomic64_32.h:181: more undefined references to `atomic64_inc_return_cx8' follow
   /usr/bin/ld: fs/ext4/mballoc.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x5454): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x546c): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x5499): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x54be): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x54d9): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/ext4/mballoc.o:arch/x86/include/asm/atomic64_32.h:117: more undefined references to `atomic64_read_cx8' follow
   /usr/bin/ld: fs/ext4/mballoc.o: in function `arch_atomic64_sub':
>> arch/x86/include/asm/atomic64_32.h:173:(.text+0x651f): undefined reference to `atomic64_sub_return_cx8'
   /usr/bin/ld: fs/ext4/mballoc.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x6526): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: fs/ext4/super.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x850): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: fs/ext4/super.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x201a): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/ext4/super.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x87f9): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: fs/ext4/super.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x8a43): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: fs/ext4/sysfs.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x1fc): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: fs/ext4/sysfs.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x4f2): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/ext4/fast_commit.o: in function `arch_atomic64_inc':
   arch/x86/include/asm/atomic64_32.h:181:(.text+0x3b0): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0xefd): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0xf18): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0xf69): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0xfa4): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: fs/ext4/fast_commit.o:arch/x86/include/asm/atomic64_32.h:181: more undefined references to `atomic64_inc_return_cx8' follow
   /usr/bin/ld: fs/ext4/fast_commit.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x12dc): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: fs/ext4/fast_commit.o: in function `arch_atomic64_inc':
   arch/x86/include/asm/atomic64_32.h:181:(.text+0x133c): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0x17f7): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0x1830): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:181:(.text+0x18fe): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: fs/ext4/fast_commit.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x19db): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: fs/ext4/fast_commit.o: in function `arch_atomic64_inc':
   arch/x86/include/asm/atomic64_32.h:181:(.text+0x19e9): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: fs/ext4/fast_commit.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x19fb): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x2bf4): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x2c06): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x2c17): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x2cd0): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/ext4/fast_commit.o:arch/x86/include/asm/atomic64_32.h:117: more undefined references to `atomic64_read_cx8' follow
   /usr/bin/ld: block/genhd.o: in function `arch_atomic64_inc_return':
   arch/x86/include/asm/atomic64_32.h:144:(.text+0x17d5): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:144:(.text+0x18c5): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: net/core/sock_diag.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x4a5): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: net/core/sock_diag.o: in function `arch_atomic64_dec_return':
>> arch/x86/include/asm/atomic64_32.h:155:(.text+0x4e7): undefined reference to `atomic64_dec_return_cx8'
   /usr/bin/ld: net/core/sock_diag.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x50d): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: lib/kobject_uevent.o: in function `arch_atomic64_inc_return':
   arch/x86/include/asm/atomic64_32.h:144:(.text+0x1d0): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:144:(.text+0x75e): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: fs/ext4/inline.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x1faf): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: io_uring/rsrc.o: in function `arch_atomic64_sub':
   arch/x86/include/asm/atomic64_32.h:173:(.text+0x480): undefined reference to `atomic64_sub_return_cx8'
   /usr/bin/ld: io_uring/rsrc.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x5ac): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: kernel/nstree.o: in function `arch_atomic64_inc_return':
   arch/x86/include/asm/atomic64_32.h:144:(.text+0x962): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: kernel/time/posix-cpu-timers.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x129): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x137): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x145): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x1b7): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: kernel/bpf/core.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x260b): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: kernel/bpf/core.o: in function `arch_atomic64_xchg':
>> arch/x86/include/asm/atomic64_32.h:96:(.text+0x2ba8): undefined reference to `atomic64_xchg_cx8'
   /usr/bin/ld: kernel/bpf/core.o: in function `arch_atomic64_dec':
   arch/x86/include/asm/atomic64_32.h:190:(.text+0x46dd): undefined reference to `atomic64_dec_return_cx8'
   /usr/bin/ld: fs/libfs.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x275): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x293): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x303): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/proc/task_mmu.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x272c): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/ext4/balloc.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x95): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/ext4/dir.o:arch/x86/include/asm/atomic64_32.h:117: more undefined references to `atomic64_read_cx8' follow
   /usr/bin/ld: fs/ext4/inode.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x5221): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: fs/ext4/ioctl.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x1746): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: fs/ext4/resize.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x1adf): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: fs/ext4/xattr.o: in function `arch_atomic64_read':
>> arch/x86/include/asm/atomic64_32.h:117:(.text+0x58): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: fs/ext4/xattr.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x9eb): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: block/blk-cgroup.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x1f9): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x254): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: block/blk-cgroup.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x2d2): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: block/blk-cgroup.o: in function `arch_atomic64_sub':
   arch/x86/include/asm/atomic64_32.h:173:(.text+0x2e6): undefined reference to `atomic64_sub_return_cx8'
   /usr/bin/ld: block/blk-cgroup.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x10dc): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:117:(.text+0x1a77): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: block/blk-cgroup.o: in function `arch_atomic64_add':
   arch/x86/include/asm/atomic64_32.h:165:(.text+0x1f64): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: block/blk-cgroup-rwstat.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x22): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:108:(.text+0x2a): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:108:(.text+0x32): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:108:(.text+0x3a): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: arch/x86/include/asm/atomic64_32.h:108:(.text+0x42): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: block/blk-cgroup-rwstat.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x1b7): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: net/ipv4/inet_timewait_sock.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x254): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: net/ipv4/inet_timewait_sock.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x265): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: net/ipv4/inet_connection_sock.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x112b): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: net/ipv4/inet_connection_sock.o: in function `arch_atomic64_read':
   arch/x86/include/asm/atomic64_32.h:117:(.text+0x17e9): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: net/ipv4/inet_connection_sock.o: in function `arch_atomic64_set':
   arch/x86/include/asm/atomic64_32.h:108:(.text+0x17fa): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_read_cx8':
>> .vmlinux.export.c:(___ksymtab+atomic64_read_cx8+0x0): undefined reference to `atomic64_read_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_set_cx8':
>> .vmlinux.export.c:(___ksymtab+atomic64_set_cx8+0x0): undefined reference to `atomic64_set_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_xchg_cx8':
>> .vmlinux.export.c:(___ksymtab+atomic64_xchg_cx8+0x0): undefined reference to `atomic64_xchg_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_add_return_cx8':
>> .vmlinux.export.c:(___ksymtab+atomic64_add_return_cx8+0x0): undefined reference to `atomic64_add_return_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_sub_return_cx8':
>> .vmlinux.export.c:(___ksymtab+atomic64_sub_return_cx8+0x0): undefined reference to `atomic64_sub_return_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_inc_return_cx8':
>> .vmlinux.export.c:(___ksymtab+atomic64_inc_return_cx8+0x0): undefined reference to `atomic64_inc_return_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_dec_return_cx8':
>> .vmlinux.export.c:(___ksymtab+atomic64_dec_return_cx8+0x0): undefined reference to `atomic64_dec_return_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_dec_if_positive_cx8':
>> .vmlinux.export.c:(___ksymtab+atomic64_dec_if_positive_cx8+0x0): undefined reference to `atomic64_dec_if_positive_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_inc_not_zero_cx8':
   .vmlinux.export.c:(___ksymtab+atomic64_inc_not_zero_cx8+0x0): undefined reference to `atomic64_inc_not_zero_cx8'
   /usr/bin/ld: .vmlinux.export.o: in function `__ksymtab_atomic64_add_unless_cx8':
   .vmlinux.export.c:(___ksymtab+atomic64_add_unless_cx8+0x0): undefined reference to `atomic64_add_unless_cx8'
   collect2: error: ld returned 1 exit status


vim +108 arch/x86/include/asm/atomic64_32.h

276b893049e4cd Uros Bizjak    2024-04-10   90  
7aab7aa4b4bed2 Peter Zijlstra 2023-01-26   91  static __always_inline s64 arch_atomic64_xchg(atomic64_t *v, s64 n)
a7e926abc3adfb Luca Barbieri  2010-02-24   92  {
79c53a83d7a31a Mark Rutland   2019-05-22   93  	s64 o;
a7e926abc3adfb Luca Barbieri  2010-02-24   94  	unsigned high = (unsigned)(n >> 32);
a7e926abc3adfb Luca Barbieri  2010-02-24   95  	unsigned low = (unsigned)n;
224788b63a2e42 Josh Poimboeuf 2025-03-02  @96  	alternative_atomic64(xchg,
224788b63a2e42 Josh Poimboeuf 2025-03-02   97  			     "=&A" (o),
224788b63a2e42 Josh Poimboeuf 2025-03-02   98  			     ASM_INPUT("S" (v), "b" (low), "c" (high)),
224788b63a2e42 Josh Poimboeuf 2025-03-02   99  			     "memory");
a7e926abc3adfb Luca Barbieri  2010-02-24  100  	return o;
a7e926abc3adfb Luca Barbieri  2010-02-24  101  }
37f8173dd84936 Peter Zijlstra 2020-01-24  102  #define arch_atomic64_xchg arch_atomic64_xchg
1a3b1d89eded68 Brian Gerst    2010-01-07  103  
7aab7aa4b4bed2 Peter Zijlstra 2023-01-26  104  static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
a7e926abc3adfb Luca Barbieri  2010-02-24  105  {
a7e926abc3adfb Luca Barbieri  2010-02-24  106  	unsigned high = (unsigned)(i >> 32);
a7e926abc3adfb Luca Barbieri  2010-02-24  107  	unsigned low = (unsigned)i;
224788b63a2e42 Josh Poimboeuf 2025-03-02 @108  	alternative_atomic64(set,
224788b63a2e42 Josh Poimboeuf 2025-03-02  109  			     /* no output */,
224788b63a2e42 Josh Poimboeuf 2025-03-02  110  			     ASM_INPUT("S" (v), "b" (low), "c" (high)),
224788b63a2e42 Josh Poimboeuf 2025-03-02  111  			     "eax", "edx", "memory");
a7e926abc3adfb Luca Barbieri  2010-02-24  112  }
1a3b1d89eded68 Brian Gerst    2010-01-07  113  
7aab7aa4b4bed2 Peter Zijlstra 2023-01-26  114  static __always_inline s64 arch_atomic64_read(const atomic64_t *v)
1a3b1d89eded68 Brian Gerst    2010-01-07  115  {
79c53a83d7a31a Mark Rutland   2019-05-22  116  	s64 r;
224788b63a2e42 Josh Poimboeuf 2025-03-02 @117  	alternative_atomic64(read, "=&A" (r), "c" (v), "memory");
a7e926abc3adfb Luca Barbieri  2010-02-24  118  	return r;
1a3b1d89eded68 Brian Gerst    2010-01-07  119  }
1a3b1d89eded68 Brian Gerst    2010-01-07  120  
7aab7aa4b4bed2 Peter Zijlstra 2023-01-26  121  static __always_inline s64 arch_atomic64_add_return(s64 i, atomic64_t *v)
a7e926abc3adfb Luca Barbieri  2010-02-24  122  {
819165fb34b977 Jan Beulich    2012-01-20  123  	alternative_atomic64(add_return,
224788b63a2e42 Josh Poimboeuf 2025-03-02  124  			     ASM_OUTPUT("+A" (i), "+c" (v)),
224788b63a2e42 Josh Poimboeuf 2025-03-02  125  			     /* no input */,
224788b63a2e42 Josh Poimboeuf 2025-03-02  126  			     "memory");
a7e926abc3adfb Luca Barbieri  2010-02-24  127  	return i;
a7e926abc3adfb Luca Barbieri  2010-02-24  128  }
37f8173dd84936 Peter Zijlstra 2020-01-24  129  #define arch_atomic64_add_return arch_atomic64_add_return
1a3b1d89eded68 Brian Gerst    2010-01-07  130  
7aab7aa4b4bed2 Peter Zijlstra 2023-01-26  131  static __always_inline s64 arch_atomic64_sub_return(s64 i, atomic64_t *v)
a7e926abc3adfb Luca Barbieri  2010-02-24  132  {
819165fb34b977 Jan Beulich    2012-01-20  133  	alternative_atomic64(sub_return,
224788b63a2e42 Josh Poimboeuf 2025-03-02  134  			     ASM_OUTPUT("+A" (i), "+c" (v)),
224788b63a2e42 Josh Poimboeuf 2025-03-02  135  			     /* no input */,
224788b63a2e42 Josh Poimboeuf 2025-03-02  136  			     "memory");
a7e926abc3adfb Luca Barbieri  2010-02-24  137  	return i;
a7e926abc3adfb Luca Barbieri  2010-02-24  138  }
37f8173dd84936 Peter Zijlstra 2020-01-24  139  #define arch_atomic64_sub_return arch_atomic64_sub_return
a7e926abc3adfb Luca Barbieri  2010-02-24  140  
7aab7aa4b4bed2 Peter Zijlstra 2023-01-26  141  static __always_inline s64 arch_atomic64_inc_return(atomic64_t *v)
a7e926abc3adfb Luca Barbieri  2010-02-24  142  {
79c53a83d7a31a Mark Rutland   2019-05-22  143  	s64 a;
224788b63a2e42 Josh Poimboeuf 2025-03-02 @144  	alternative_atomic64(inc_return,
224788b63a2e42 Josh Poimboeuf 2025-03-02  145  			     "=&A" (a),
224788b63a2e42 Josh Poimboeuf 2025-03-02  146  			     "S" (v),
224788b63a2e42 Josh Poimboeuf 2025-03-02  147  			     "memory", "ecx");
a7e926abc3adfb Luca Barbieri  2010-02-24  148  	return a;
a7e926abc3adfb Luca Barbieri  2010-02-24  149  }
9837559d8eb01c Mark Rutland   2018-06-21  150  #define arch_atomic64_inc_return arch_atomic64_inc_return
a7e926abc3adfb Luca Barbieri  2010-02-24  151  
7aab7aa4b4bed2 Peter Zijlstra 2023-01-26  152  static __always_inline s64 arch_atomic64_dec_return(atomic64_t *v)
a7e926abc3adfb Luca Barbieri  2010-02-24  153  {
79c53a83d7a31a Mark Rutland   2019-05-22  154  	s64 a;
224788b63a2e42 Josh Poimboeuf 2025-03-02 @155  	alternative_atomic64(dec_return,
224788b63a2e42 Josh Poimboeuf 2025-03-02  156  			     "=&A" (a),
224788b63a2e42 Josh Poimboeuf 2025-03-02  157  			     "S" (v),
224788b63a2e42 Josh Poimboeuf 2025-03-02  158  			     "memory", "ecx");
a7e926abc3adfb Luca Barbieri  2010-02-24  159  	return a;
a7e926abc3adfb Luca Barbieri  2010-02-24  160  }
9837559d8eb01c Mark Rutland   2018-06-21  161  #define arch_atomic64_dec_return arch_atomic64_dec_return
1a3b1d89eded68 Brian Gerst    2010-01-07  162  
dce2a224763ce9 Uros Bizjak    2024-06-05  163  static __always_inline void arch_atomic64_add(s64 i, atomic64_t *v)
a7e926abc3adfb Luca Barbieri  2010-02-24  164  {
819165fb34b977 Jan Beulich    2012-01-20 @165  	__alternative_atomic64(add, add_return,
224788b63a2e42 Josh Poimboeuf 2025-03-02  166  			       ASM_OUTPUT("+A" (i), "+c" (v)),
224788b63a2e42 Josh Poimboeuf 2025-03-02  167  			       /* no input */,
224788b63a2e42 Josh Poimboeuf 2025-03-02  168  			       "memory");
a7e926abc3adfb Luca Barbieri  2010-02-24  169  }
1a3b1d89eded68 Brian Gerst    2010-01-07  170  
dce2a224763ce9 Uros Bizjak    2024-06-05  171  static __always_inline void arch_atomic64_sub(s64 i, atomic64_t *v)
a7e926abc3adfb Luca Barbieri  2010-02-24  172  {
819165fb34b977 Jan Beulich    2012-01-20 @173  	__alternative_atomic64(sub, sub_return,
224788b63a2e42 Josh Poimboeuf 2025-03-02  174  			       ASM_OUTPUT("+A" (i), "+c" (v)),
224788b63a2e42 Josh Poimboeuf 2025-03-02  175  			       /* no input */,
224788b63a2e42 Josh Poimboeuf 2025-03-02  176  			       "memory");
a7e926abc3adfb Luca Barbieri  2010-02-24  177  }
1a3b1d89eded68 Brian Gerst    2010-01-07  178  
7aab7aa4b4bed2 Peter Zijlstra 2023-01-26  179  static __always_inline void arch_atomic64_inc(atomic64_t *v)
a7e926abc3adfb Luca Barbieri  2010-02-24  180  {
224788b63a2e42 Josh Poimboeuf 2025-03-02 @181  	__alternative_atomic64(inc, inc_return,
224788b63a2e42 Josh Poimboeuf 2025-03-02  182  			       /* no output */,
224788b63a2e42 Josh Poimboeuf 2025-03-02  183  			       "S" (v),
224788b63a2e42 Josh Poimboeuf 2025-03-02  184  			       "memory", "eax", "ecx", "edx");
a7e926abc3adfb Luca Barbieri  2010-02-24  185  }
4331f4d5ada568 Randy Dunlap   2018-09-02  186  #define arch_atomic64_inc arch_atomic64_inc
1a3b1d89eded68 Brian Gerst    2010-01-07  187  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
