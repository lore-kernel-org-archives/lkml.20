Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792556752;
	b=AwjPlrj7CrFRrmssNR0KWgKRJjsgv4vajLZ4Tv7aFds72GILPMZn7v5Qb7paZRwo97p+
	 I9tYm0HM8Vrw3b5AHYYuYQkH1vbFFZ97z4xlfRpbb2sLjW+s/tYYErtd20SA/5wEWT7CF
	 br/lhv+JJY82y5gzldc+wqqgP3aESDLeAdEJ0Brwgr0EQr31DMF5z1KlwhDJ3Zt0RgPkD
	 Yrpvy+J7tSKMUxpeFsdT/0lx/9dAt7dsnBDtKYwBhzjbyrrZV/cQfArahHwS2a3ty44Jy
	 uqd+YpJAV4pMsqsB5NxHxBYv4Mt8qPj751TeGfBKinr51XA6gkIMT1AK9qUN3fK+f0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792556752;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UFSKrAVOLA1wEpTJoIDIGEDNkgB/EG9yWn5pjWxJXkY=;
	b=gXvWip1omLCCtsfX3dZMucxSbB/Ng7c6lWxSQlyNJImIeObIIdv0NAaPNvUstVGSIFip
	 qdocTORxAIw6cB9uVQ0cIqxe6AEq9lyYYEfS7suCH1t3MHZkNoi/zpwvnfwbX4q0OGx6t
	 cguQZMXiEb1MY3q3ULZonsAnJJcN3GkcKshZ/WMUk1jV1LzmWjmJljdq0YZSz25IRpWmW
	 YZR3GFD2meE04gQiD4UqUXFcbs0ATeIiNWkoq0/Hn56jlKjYwwSUzugtuVIfwRXIgLQhi
	 5jO77EIh+3pwso+aUz6laQgrzHSAnxB+Bhy3n/h+zSQ/FaplcN7svQaG6X3YBoPK40Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PYQOK5O+;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D02606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D02606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PYQOK5O+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792556750; x=1824092750;
  h=date:from:to:cc:subject:message-id;
  bh=qf8jMqBzZXTPgY+3Fb5JgnJfv5kG5G8lrQNDMdfR9I4=;
  b=PYQOK5O+aKUxjLyxYgMTmu/H05WDT+/Hr+MnMtn7pvQTYgprMlQ/kcTK
   llaLEyKKLKFwqVvXfzN52PnB+mHjBG6WyljAZ0H2vu4u9mGiTQOz5YmgL
   CvwNOA7QxvpHwfBZSBT+9fiX9EE1sr9P0Z5xZSytFENEGXCAwIsy1My2r
   clkec67ZV+uiCclZSLe6lsjFklPxJ2kHB4lYojRFCBmrDR61GQ1D8O/g1
   jbLfhcWWrz7ZDEKzPNLWfE5QvdN3IibFp0Aks4ADthu8cfnKRiZVhqlp+
   bTuAlMPo91rqm4Pz/1W9+UuU0sfnNcBxG4Q5yw/WTr4ER3h1f9Ugqa5VS
   w==;
X-CSE-ConnectionGUID: YhsLLKt2TdKcuOQrTGMv1A==
X-CSE-MsgGUID: nH6GskAYRbSJ19g9sHmSlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1176994"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1176994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 21:25:50 -0700
X-CSE-ConnectionGUID: pjtnv2qdQHeV7YsRiYtyTg==
X-CSE-MsgGUID: lmst17+kRHO4o8jb6HDGpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2929807"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Oct 2026 21:25:49 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJNta-000000006dP-0xdS;
	Wed, 21 Oct 2026 04:25:46 +0000
Date: Wed, 21 Oct 2026 06:25:25 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Rhodes <sean@starlabs.systems>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Tzung-Bi Shih" <tzungbi@kernel.org>
Subject: drivers/firmware/coreboot/coreboot-cfr.c:343:5-11:
 inconsistent IS_ERR and PTR_ERR on line 344.
Message-ID: <202610210637.LiJ3U0ob-lkp@intel.com>
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
head:   72a16bcff25e9f4a1d6d42a243301b1b76db2f32
commit: f2e05ce9763feb1dd7da15afd2cc61df227ee85a firmware: coreboot: Add CFR firmware attributes driver
date:   3 weeks ago
config: i386-randconfig-r2106-20261021 (https://download.01.org/0day-ci/archive/20261021/202610210637.LiJ3U0ob-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f2e05ce9763f ("firmware: coreboot: Add CFR firmware attributes driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210637.LiJ3U0ob-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/coreboot/coreboot-cfr.c:343:5-11: inconsistent IS_ERR and PTR_ERR on line 344.

vim +343 drivers/firmware/coreboot/coreboot-cfr.c

   335	
   336	static int coreboot_cfr_read_value(const struct coreboot_cfr_setting *setting,
   337					   u32 *value, u32 *attrs)
   338	{
   339		efi_char16_t *efi_name __free(kfree) =
   340			coreboot_cfr_efi_name(setting->name);
   341		int ret;
   342	
 > 343		if (IS_ERR(efi_name))
 > 344			return PTR_ERR(no_free_ptr(efi_name));
   345	
   346		ret = efivar_lock();
   347		if (ret)
   348			return ret;
   349	
   350		ret = coreboot_cfr_read_efi_value(efi_name, value, attrs);
   351		efivar_unlock();
   352	
   353		return ret;
   354	}
   355	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
