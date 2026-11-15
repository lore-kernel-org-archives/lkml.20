Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768275;
	b=KDGCu+LhMdpdGOyqVT2epwd8Kl3i2W1SrE9dsR7l2jGiobue0yOsY2zmI8jHYKjZb+WK
	 Ee6VYZ77TIM0IObXgayqBI2A9C/a0+e6yf0as1tE1mQQM4I/5EqNYNei0EDCyErH6rF9v
	 bAAMHU/eJV0KrXXOZSB2cYvEDScFhyNdSV1siX0FUYsBgLBr/11LTTC2ADQADCapiwdFD
	 aOqbaaNKMppfhqXedgpOJv4OulcUQFKbpXfrmZCRfS0QK4TwwyswiJvcf11NCS/1OgRIZ
	 vBf48t+h2d6dsKWYy8MCTWD3hYyN8ctLVaMhS8P/IvY5urOQQScm2wDdi47TzyoVY/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768275;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vDvd/D0WBehz+Uc0sz34uFpqBJ93+oPgE4DemO3XkH8=;
	b=Kdf6U58veoZeMyB48ia0E30mRh7KiezdXji/iBR6KH/y3Mn79nYFyMVWAbzTc7YqN7AU
	 z4SsIvUV44IPAzw9AVVGCT1K76nuogviJc5kPLL1MXml6/k3xySblozumtY3lB7ze9KrT
	 QO2j4sk8ulc//LHt/22bNhHhULS9S5agXqlP9aT939vBh3wJAy/11xd+mfQfE/UF4Ye1u
	 StkdcT50t7aE3SDlTRo9E+Z/HRUKYeP5kJ73LVKpm4Zfdk0Z7nWWsA4KOUqChiGZBc6gi
	 rWnsUPpKOl3DNqPSUKLyXLLW4s2Hod41H+EnryUue8VnKHvxV9lweDB2MxpbvPtDrgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B+S0WnkQ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D7F606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D7F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B+S0WnkQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794768275; x=1826304275;
  h=date:from:to:cc:subject:message-id;
  bh=wRTgthEbYYPayNNrAPP4nQ704BH6QsgHS8GeubA6B9E=;
  b=B+S0WnkQADjePV/4h7qdxvadoUN7qoSQQ82T56wZc7nzreaOWG6wGuTf
   SJL4FVeUy1NpJvcr/fc+WrCwhWG/RP9Zb9hYdgoxYv21hMh7cWgQplH/V
   4rAFhPNJlb+FSG1oQpa2iHF2SmIixTxWMSnMRP3ULA5VsVXGw6quBnY7T
   LrSmkdhAI0mp9P3zaI+Olzd7S2bOY1CoSXS49Y8zafLonpi+zsITQJWwR
   ab8MqZ5g2JPLnh8MlGjqvqaYBwzXh2NZP4Nx44lvX8b4cEz6KzFpMvCoy
   Ky4O5MJyNy5ODRKb9LDlBup+qFbA0YIzcwMqe+YnLx7//zGwPSOi/r5IJ
   Q==;
X-CSE-ConnectionGUID: 7Scq58raSZOYYIyE2Sw4dA==
X-CSE-MsgGUID: ENsfi64yQKyqhcBCdyh/ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3403607"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3403607"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 10:44:35 -0800
X-CSE-ConnectionGUID: N+H3zN8aTGqFM3+bKwiBwQ==
X-CSE-MsgGUID: 50dDAKVVSWqWtfk2hqObMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9560589"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Nov 2026 10:44:33 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSfDK-000000002Lh-3Fwp;
	Sun, 15 Nov 2026 18:44:30 +0000
Date: Sun, 15 Nov 2026 19:44:16 +0100
From: kernel test robot <lkp@intel.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: arch/sh/include/asm/uaccess_32.h:204:1: error: impossible
 constraint in 'asm'
Message-ID: <202611151925.SgXid5Fj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 8b5dba9ea4a3f5ed994f03d6ca7686c49491b426 sh: uaccess: Require offsettable operands for 64-bit user access
date:   6 weeks ago
config: sh-randconfig-r2311-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151925.SgXid5Fj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151925.SgXid5Fj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8b5dba9ea4a3 ("sh: uaccess: Require offsettable operands for 64-bit user access")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151925.SgXid5Fj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/drm_property.c:23:
   drivers/gpu/drm/drm_property.c: In function 'drm_mode_getproperty_ioctl':
>> arch/sh/include/asm/uaccess_32.h:204:1: error: impossible constraint in 'asm'
     203 | ({ \
         | ~~~~
     204 | __asm__ __volatile__( \
         | ^~~~~~~~~~~~~~~~~~~~~~~
     205 |  "1:\n\t" \
         |  ~~~~~~~~~~
     206 |  "mov.l %S1,%2\n\t" \
         |  ~~~~~~~~~~~~~~~~~~~~
     207 |  "mov.l %R1,%T2\n\t" \
         |  ~~~~~~~~~~~~~~~~~~~~~
     208 |  "2:\n" \
         |  ~~~~~~~~
     209 |  ".section .fixup,\"ax\"\n" \
         |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     210 |  "3:\n\t" \
         |  ~~~~~~~~~~
     211 |  "mov.l 4f,%0\n\t" \
         |  ~~~~~~~~~~~~~~~~~~~
     212 |  "jmp @%0\n\t" \
         |  ~~~~~~~~~~~~~~~
     213 |  " mov %3,%0\n\t" \
         |  ~~~~~~~~~~~~~~~~~~
     214 |  ".balign 4\n" \
         |  ~~~~~~~~~~~~~~~
     215 |  "4: .long 2b\n\t" \
         |  ~~~~~~~~~~~~~~~~~~~
     216 |  ".previous\n" \
         |  ~~~~~~~~~~~~~~~
     217 |  ".section __ex_table,\"a\"\n\t" \
         |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     218 |  ".long 1b, 3b\n\t" \
         |  ~~~~~~~~~~~~~~~~~~~~
     219 |  ".previous" \
         |  ~~~~~~~~~~~~~
     220 |  : "=r" (retval) \
         |  ~~~~~~~~~~~~~~~~~
     221 |  : "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
         |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     222 |         : "memory"); })
         |         ~~~~~~~~~~~~~~~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
      68 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_property.c:484:3: note: in expansion of macro 'if'
     484 |   if (i < out_resp->count_values &&
         |   ^~
   arch/sh/include/asm/uaccess_32.h:136:3: note: in expansion of macro '__put_user_u64'
     136 |   __put_user_u64(x, ptr, retval);  \
         |   ^~~~~~~~~~~~~~
   arch/sh/include/asm/uaccess.h:72:3: note: in expansion of macro '__put_user_size'
      72 |   __put_user_size(__pu_val, __pu_addr, (size), \
         |   ^~~~~~~~~~~~~~~
   arch/sh/include/asm/uaccess.h:20:26: note: in expansion of macro '__put_user_check'
      20 | #define put_user(x,ptr)  __put_user_check((x), (ptr), sizeof(*(ptr)))
         |                          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_property.c:485:7: note: in expansion of macro 'put_user'
     485 |       put_user(property->values[i], values_ptr + i)) {
         |       ^~~~~~~~


vim +/asm +204 arch/sh/include/asm/uaccess_32.h

9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  178  
0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  179  #if defined(CONFIG_CPU_LITTLE_ENDIAN)
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  180  #define __put_user_u64(val,addr,retval) \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  181  ({ \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  182  __asm__ __volatile__( \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  183  	"1:\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  184  	"mov.l	%R1,%2\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  185  	"mov.l	%S1,%T2\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  186  	"2:\n" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  187  	".section	.fixup,\"ax\"\n" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  188  	"3:\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  189  	"mov.l	4f,%0\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  190  	"jmp	@%0\n\t" \
0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  191  	" mov	%3,%0\n\t" \
0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  192  	".balign	4\n" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  193  	"4:	.long	2b\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  194  	".previous\n" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  195  	".section	__ex_table,\"a\"\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  196  	".long	1b, 3b\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  197  	".previous" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  198  	: "=r" (retval) \
8b5dba9ea4a3f5 arch/sh/include/asm/uaccess_32.h Florian Fuchs 2026-07-16  199  	: "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  200          : "memory"); })
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  201  #else
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  202  #define __put_user_u64(val,addr,retval) \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  203  ({ \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10 @204  __asm__ __volatile__( \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  205  	"1:\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  206  	"mov.l	%S1,%2\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  207  	"mov.l	%R1,%T2\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  208  	"2:\n" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  209  	".section	.fixup,\"ax\"\n" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  210  	"3:\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  211  	"mov.l	4f,%0\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  212  	"jmp	@%0\n\t" \
0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  213  	" mov	%3,%0\n\t" \
0fb19dcb64ec4b include/asm-sh/uaccess_32.h      Stuart Menefy 2007-11-30  214  	".balign	4\n" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  215  	"4:	.long	2b\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  216  	".previous\n" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  217  	".section	__ex_table,\"a\"\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  218  	".long	1b, 3b\n\t" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  219  	".previous" \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  220  	: "=r" (retval) \
8b5dba9ea4a3f5 arch/sh/include/asm/uaccess_32.h Florian Fuchs 2026-07-16  221  	: "r" (val), "o" (__m(addr)), "i" (-EFAULT), "0" (retval) \
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  222          : "memory"); })
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  223  #endif
9b01bd9ee64088 include/asm-sh/uaccess_32.h      Paul Mundt    2007-11-10  224  

:::::: The code at line 204 was first introduced by commit
:::::: 9b01bd9ee6408846c0553c03fb4b864353a845c9 sh: Split out uaccess.h in to _32 and _64 variants.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
