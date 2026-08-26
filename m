Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C363B38B5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787774195; cv=none; b=oQf4ccxiiO1XULqpVE8Mciu+T8MckZuz83UCbWi87iBbFDptNDwIGkRlSFjUqFfdPINUL1GR1fCkKjBV9wcftCO4brpAeMko5gBNJ/JAPKRp2uh+6FphQeZEtWXn5d5RWbdFieUsTntz7e0FxZXpINOkCnI6FZrvPTijGj591G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787774195; c=relaxed/simple;
	bh=W29ShjR2CAAz/o+uwPUudgGPaWc6sIfDhpZn7RbMcn0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pk2PpZ9rnWPx8/sMCj7BmwjLM89o8RDfwkuSgUZH5ozaQde1gC41VElflKjS6EExq0mwDupXT2+InH2c9enUh05BMeDE+QGqcwB9OWSHFD00zERL62slOj0WH1vkBayrjipRPKrBFAcAIDmQbm8V1/nLyAzDie6kaFanzqpcubY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjNDduT3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjNDduT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787774191; x=1819310191;
  h=date:from:to:cc:subject:message-id;
  bh=W29ShjR2CAAz/o+uwPUudgGPaWc6sIfDhpZn7RbMcn0=;
  b=hjNDduT3xZfLfy60bySOJ23T51ZB+sRa/WLR0EUe+av8jUpjEAH77Ahv
   ysqefqWFRZ9l01AjCJnklK1d/nzIenBulpxehh+KUJF7cySYlbQenGOFt
   QxZNBfvp4QqBpGKJf81TC82Xj2dRc9e/7d3+YEa4SVwnKDmjffyJNPP5h
   X4P3/++pksrF5KW2WCt/GlYgXy9lOp3SW++9HkZ+TdW4A47j5o4/5ZCGV
   OPJfcZhR98caJvsvCRwlm8kP0V1HUKh0+9CPFEBeUtWFZLssuO1wnGhxQ
   tknfUxSM5XnQj991FsAkVlhAE6zb5CUW8VRjJFdygFY3dM9wZ9AXv+s5E
   w==;
X-CSE-ConnectionGUID: wLLBCe4pT2yaLbGfoVtQ1g==
X-CSE-MsgGUID: 0hS1DF4mTLyzrHepxKfTBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="75807519"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="75807519"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 12:56:30 -0700
X-CSE-ConnectionGUID: fsCYzjBRSSKq3Ovm8lXh5A==
X-CSE-MsgGUID: OZkxblfQRQaMCo249TnOaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="271177124"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 26 Aug 2026 12:56:27 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzJjV-000000000ZR-2IDn;
	Wed, 26 Aug 2026 19:56:25 +0000
Date: Wed, 26 Aug 2026 21:55:56 +0200
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_SDCA_HID when selected by SND_SOC_RT766_SDCA_SDW
Message-ID: <202608262153.rOQYkmOr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: b50ecf5873df1ce6ff34f3e3421ebb33750e61f6 ASoC: rt766: add RT766/RT767 SDCA driver
date:   3 weeks ago
config: x86_64-kismet-CONFIG_SND_SOC_SDCA_HID-CONFIG_SND_SOC_RT766_SDCA_SDW-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262153.rOQYkmOr-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262153.rOQYkmOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b50ecf5873df ("ASoC: rt766: add RT766/RT767 SDCA driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262153.rOQYkmOr-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID when selected by SND_SOC_RT766_SDCA_SDW
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y] && (HID [=n]=y [=y] || HID [=n]=SND_SOC_SDCA [=y])
     Selected by [y]:
     - SND_SOC_RT766_SDCA_SDW [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=y] && SND_SOC_SDCA [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
