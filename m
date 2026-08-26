Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458CD37F303
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787786975; cv=none; b=K+JWQLRrtU6GCxrf6Df4QO92PQWnIoNzZXqbjF3uimjsdxfUBbgqs7L/3WBnK20cHxUt28QghNcSI+OkYj87GNoxlIxzg0J0EiMOrzlboo5GR4EGf097x4AkcjN5/ceZA5tc78/3TZmedSGVbF0+EvvYQ1ieUsFN/woRhfv2ND0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787786975; c=relaxed/simple;
	bh=0snrzMdqYr62sAMeE+FrKxLntR1ewCJyKkWvQG+60jw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CY5rc/zSwfiLmZDGqW5KUevOfrT+6WlwpWH58WFaISk1qIesFj+SjJGcRrCkizYSVELA9a6DpZg1kXTUEZX7XVty8SYNC31lNK8h+NTKcmVL0h36+kzHJyvmXpbx4j4uL2YmAM+pCuQPHPSgXNaR7DODjth96rRFgLxvrSv3Ibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fssNqqCA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fssNqqCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787786973; x=1819322973;
  h=date:from:to:cc:subject:message-id;
  bh=0snrzMdqYr62sAMeE+FrKxLntR1ewCJyKkWvQG+60jw=;
  b=fssNqqCAaBVsvD2DVbhaDrPv+bq2m2j7i9hYwM1m1272TIMrQ4bfauMK
   QBrnYJBOUCx4gz9+bai2qfkKstEZJVBoRZd/LY/2qxYrKEx/KVYSp6hAb
   CptlW1Cd4fupSONSUIgyQL0lsDY58e6XFdW/fR87kjttsIESWoTxKhHvW
   AGzxjadNzpf6Pwp6sdJjeLHrt15FI/oJw3/bbKHblfJ31E704DDKehWVQ
   TcF63cDxkUmFJoAaOpYObpSirJRKMwpysOaN9dqgnnuTTrJKGCYRIXuvh
   M2wcArq2ogxxqVZv9BGTw9lVAYNpC3agD0RfCR4BZ20RELkIWQUhqAc54
   Q==;
X-CSE-ConnectionGUID: PgbZWXhDRX2I0wYP//nYHA==
X-CSE-MsgGUID: e81XQRmRS3SHWz7PN3wMgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88311039"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88311039"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 16:29:33 -0700
X-CSE-ConnectionGUID: qNpw/caiTbit32vl0PPj7g==
X-CSE-MsgGUID: Ogx2zHNjTH2IGK5LmK5EWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="264444032"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Aug 2026 16:29:30 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzN3g-000000000c1-0q0W;
	Wed, 26 Aug 2026 23:29:28 +0000
Date: Thu, 27 Aug 2026 01:29:24 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_WM8731_I2C when selected by SND_SOC_DB1200
Message-ID: <202608270107.XE1EBSGY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b035a8be20ddfb932205beb9a1cbd80ea42e6cfb
commit: 9dc15f81baf273b5aaaa3302ee8faacd78f361fd ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules
date:   4 years, 5 months ago
config: mips-kismet-CONFIG_SND_SOC_WM8731_I2C-CONFIG_SND_SOC_DB1200-0-0 (https://download.01.org/0day-ci/archive/20260827/202608270107.XE1EBSGY-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608270107.XE1EBSGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9dc15f81baf2 ("ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270107.XE1EBSGY-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM8731_I2C when selected by SND_SOC_DB1200
   WARNING: unmet direct dependencies detected for SND_SOC_WM8731_I2C
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_DB1200 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AU1XPSC [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
