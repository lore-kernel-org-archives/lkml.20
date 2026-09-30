Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115B3750CF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761419; cv=none; b=J2fiRLzy/Hqy+At4riuuCLERvI7vkJIiXRWR/h2PKzHEg/jgKO6u2nV3wtPB4KWUc0kR5MI2QovE/9ZXYJfMl6VNGcMFTRrY5Qv0vYVugnBOpsjRqUBTVRJaznvHEZeHG9VatL6RXSDK2oHT6RG+O0BbJBfqNOBUetK+FhwlbTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761419; c=relaxed/simple;
	bh=tg0+jrG2dZ8i5WKQVNuFE04ElQp+55EguWUduCtYADc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U8lC9EAsDB+uiWg31LTnQUxOdg/eiIgoOaqjuz+7CBYBxlV6Hs7XwhP8QHOg8YDlgli5cMNQSsSlWcPRO9zzGwRNeKNKnGhzjwCRAtFmNfewk+dAR6F8Dr5PYjmtFHG8JHkJoW3tMBQK/+g5YDXZ7aRf4JY7cmT0qytDHFDl27I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vu6aB2iv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vu6aB2iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790761418; x=1822297418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tg0+jrG2dZ8i5WKQVNuFE04ElQp+55EguWUduCtYADc=;
  b=Vu6aB2iv5KRaIyQM0gQIlAYg0RZOBFPN188QfILkeVH4x7DuPaZSF/J1
   Ya2FiIpFPEkIEWiDc9Xoo9KAXnTgCiLqwJR4/xR1O7tf8cfGalOIWIFfd
   p9Q00PMrwgs0fSuUl7VFw1DsCN8G800XXDGP7QPAtOeQ1zQfhrB0v6zLo
   PRzV6PRlUBziT4OFc3E0Cz7+xNU4+WYNdJuG7n4a+qgzKCsbEzXuKPQ9I
   ztvkEgYdLTIcAR53tZ+t7oFW7g/+PMmFFSp9AqEdDY6wlwU2MkS+SL5td
   ty3Wy6Vq4jxVFISmOrWUs0DBA7rPguMrIiiFB2BaH07OdA19akZRs9JB8
   A==;
X-CSE-ConnectionGUID: FzopJ+K6TriChBofBgCErg==
X-CSE-MsgGUID: aG0uTxBGRhCWOsboyWCizQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93980814"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="93980814"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:43:37 -0700
X-CSE-ConnectionGUID: YlULOb9FSFOmIwn1Dc0Aqw==
X-CSE-MsgGUID: DygcuhkkTVOBL8FLTeqkLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="272104166"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Sep 2026 02:43:35 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBqqY-000000001oT-4BGG;
	Wed, 30 Sep 2026 09:43:30 +0000
Date: Wed, 30 Sep 2026 11:42:39 +0200
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [tip:timers/vdso 4/4]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:288:24: error:
 call to undeclared function 'BITS_PER_TYPE'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202609301144.zm2ko38t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   ca46a07c4b68246c4e400ce3649ab7228a878d8f
commit: ca46a07c4b68246c4e400ce3649ab7228a878d8f [4/4] vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask
config: sparc64-randconfig-r2304-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301144.zm2ko38t-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301144.zm2ko38t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301144.zm2ko38t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/vdso/vclock_gettime.c:22:
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:288:24: error: call to undeclared function 'BITS_PER_TYPE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |                               ^
   1 error generated.


vim +/BITS_PER_TYPE +288 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c

   273	
   274	static __always_inline bool
   275	__cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
   276				     struct __kernel_timespec *ts)
   277	{
   278		const struct vdso_clock *vc = vd->clock_data;
   279		u32 msk;
   280	
   281		if (!vdso_clockid_valid(clock))
   282			return false;
   283	
   284		/*
   285		 * Convert the clockid to a bitmask and use it to check which
   286		 * clocks are handled in the VDSO directly.
   287		 */
 > 288		BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
   289		msk = 1U << clock;
   290		if (likely(msk & VDSO_HRES))
   291			vc = &vc[CS_HRES_COARSE];
   292		else if (msk & VDSO_COARSE)
   293			return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
   294		else if (msk & VDSO_RAW)
   295			vc = &vc[CS_RAW];
   296		else if (msk & VDSO_AUX)
   297			return do_aux(vd, clock, ts);
   298		else
   299			return false;
   300	
   301		return do_hres(vd, vc, clock, ts);
   302	}
   303	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
