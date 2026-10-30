Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397010;
	b=wkYT2W7wMZrFw+R7PlP02hLP2k2buknN21lN41C+uwQojiKSTopue9a2lDvjgwhf+tgV
	 BLOfI6PEQiMywM2uNZOeI/Up8g3mPYr/hVf3ChD8Dz4m+e3QUgYmqAfCdyAuO4IPgLvLO
	 7q3hOHQBFaYczZAsYYH6tixAUwj6ux/9lZ6pqiR2yyTLxJWorqxUbLMZ4VWpsyrgY9ni7
	 4wwi7adEZH8AnUP9pLsduUo1P6vw6dC7flbxb5sjDD0Z4DEXFUSh6z/a2g7cXTnYp1hNe
	 8uSEdSIFnVEoSTRDS3Pu1EwGryv2wrV4O9LQ88dyvildHb3gbHKZ34uVW68VdTU330Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397010;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=F70gIwgZ1AIc0esVPNFxexisouK3InPKKs0HU/1v7Rg=;
	b=h0Y88e6sZYu92vl2+hBa4bCKul8aSVEeJ69mrlXIYw9KUBly3hSx/w3x93F1mr3mDtF3
	 y5dYL8RiixDkDUb4J1f5nbv4PXHRiCxkK3Fy0mx7I+kP0JnNSA6ACiC8hAAEbNHiWdyZW
	 jNXWDvfNSSeUiZJSSL66XlC93aImB6wh+eiMB4DqLIKWgFPCUBbQHrGKRsbS81fwkBNmA
	 5u4hx0ZRDfpHoxyNtV/3oIfwX+J1cQT2yM2Jbj8l8KrsLFDJOyok6UNyYXAYQaBdiZVdj
	 2uo73AoxykigD7mJcR5+63W+wOsuKPNLBAo5OKK0haGfkmJc9IgZW1Qf6cPqN2fjDBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZo9dkJY;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E45B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZo9dkJY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793397010; x=1824933010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKLx77do1ym/bkZyNKLZrHNEuYscbJOKYkmhw++EjI0=;
  b=dZo9dkJYn8furJwNLe/W/reSoC7f7zDH810LnrWSN+tcuaiRkUn93Lcx
   Vg2RC55YcZQF+1ykEETsdrEGMb19CkUezrFRqctDdr1B1cZSthi1CyA/s
   fcPe1czDgtT9ErGp24fA8hzehpnlSrai1atZUsGORJ+/fH5vH5tE5k2DV
   X0o5TU/M76khFlOyhiSZcOR/3ajPCD3ssS2/pFT4vxL3o9BuBhY73iTJT
   qDUF7+OBnNh1/iY17h+yCL4YHnWZPQwJ5xoZKILEKQoZFmcZf1FkKukOx
   jo3Xt8rTWgNBpQckPukxy/w2H6vMWWuQpadxlrBBtrted+eedQvbvyo+R
   g==;
X-CSE-ConnectionGUID: UMBcmy9wTmOmiSHnoJK60w==
X-CSE-MsgGUID: jP9fKCGhSoOcDtm4zNKYMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2174843"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2174843"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:50:09 -0700
X-CSE-ConnectionGUID: rE/zM/d2SOaEvZMTDbuwHA==
X-CSE-MsgGUID: mb1n3kecRtCvzzoLquf+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5618458"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2026 14:50:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMuU6-00000000cH0-0Klx;
	Fri, 30 Oct 2026 21:50:02 +0000
Date: Sat, 31 Oct 2026 05:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: vop2: Use
 drm_format_info_min_pitch() for plane offsets
Message-ID: <202610310517.O99iZZoW-lkp@intel.com>
References: <20261029081429.862-2-kernel@airkyi.com>
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
In-Reply-To: <20261029081429.862-2-kernel@airkyi.com>

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on rockchip/for-next linus/master v7.3 next-20261029]
[cannot apply to linux-review/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261022-151735]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261029-161427
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261029081429.862-2-kernel%40airkyi.com
patch subject: [PATCH v2 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261031/202610310517.O99iZZoW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310517.O99iZZoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310517.O99iZZoW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/rockchip/rockchipdrm.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
