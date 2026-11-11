Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357809;
	b=cUpT8+wRZOoIYU98I9A0ABg3BCe6QW6OmQFHP7B/0otMMKSOdCTtNd98onWhhu/NZpPc
	 IMD3ur7upStJUD2LIvSyuMG7gG0JZ7vENZ7vM5GLVdA12ugVKfNHnB9E8QnZrQ18a01td
	 QR88VlPtvOov2Kvo+e9sOu6sZI/8h+XKmn6TLnz2HiJM3Avf2E5fsRj6TS7Rn9ajI7FyS
	 XJUR/nTAn9T10JtKS4swYLgc5YcrAC2E58VgCnuw0TejhSU9BtzLDf4/y0ltO54FTTcSR
	 DaaEUH6eC1ZcK53qssAKF0CfY7lYDQUMhh7qnxqLt7NsV66cTzO6BIReMw5i3vou46A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357809;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SymUik+B4qS4RnbOnUpYhdJUY4u98PDY9Ed4+6i7Iz8=;
	b=ptndtmVY63YDSCUyS8WcfYxqNWHcGtTc5gcAo9oD9px8Vzw2YBemEX+Hr+nLTJyeUqG/
	 /JHJ3nsyeK6JDUK9osDOI/z0lXavGnT1dK1S3qXtnsWC/uQF/QAs2MwV+gCPnM5LyKJA/
	 JMBkLPPHJsTyBub0cvIseRzEXMptywi3AzZ4+jHO9MMuLKiT6w2RpcKU2PDviaft0PJVl
	 ml314kxDLkVPX2VaJhOG3i94cY9furTaXbgbsTvKswaWBcm7ZcnajPuP6lb/XiJlTKEtE
	 PInrRLEE1JXCtBQx9oCIxm0DEC9LycI0vCBnelHXn6wpOPoSWaZ0q7dCVSeMdoiky5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bX9+K1N3;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B8860A3816
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B8860A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bX9+K1N3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794357809; x=1825893809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/htquKCf1eyCChQB/2slLNIXBsrm37b2/miGYfgxbpQ=;
  b=bX9+K1N3kj/wx7SaNkr5WLJ/oOwQutn49Lf+/AikW4LpuDVWgv3Ul4dS
   SHO22R+nwZ5vgj5yE2M+nUnRkCz3AsP8gY8mbZysv6Xf+txVZrx5fYnRa
   ayfgMunwlyQZOzk7oiUWvjsfJL/e28jXnlmfYDtl5lrtqUN+Nz+0147p/
   DOCUemRB5u1vtxpdJkDgA9KQnTZs+GntiVorql1MYJ0eS2k1IK6uA8rEE
   VwrXzuiUAX4wf/qOpFOxP1N8b/iQ5/JvsGR8VHO6Eq4ba+VRYtO5Fiz7G
   mEIYczgUJlUG+ptXT4Ei2zKjz0NhfC1g6jKQDd4G4tRKbTxRXfjUK4kyh
   g==;
X-CSE-ConnectionGUID: owamZF8xT8O6+OTsdBsXkQ==
X-CSE-MsgGUID: qFIG9hJsTeO5w8p0SmHC/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3119552"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3119552"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 16:43:28 -0800
X-CSE-ConnectionGUID: f5Zm+GB/RBWKyi+QigIv3g==
X-CSE-MsgGUID: y/T3/qu8SuGzzmy/BBWgxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8713679"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2026 16:43:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQwQs-00000000xmN-0x7I;
	Wed, 11 Nov 2026 00:43:22 +0000
Date: Wed, 11 Nov 2026 08:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nd@arm.com,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 17/28] drm/panthor: Add arbitration scheduler
Message-ID: <202611110840.2W7v6LAR-lkp@intel.com>
References: <20261110153907.3241978-18-karunika.choo@arm.com>
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
In-Reply-To: <20261110153907.3241978-18-karunika.choo@arm.com>

Hi Karunika,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-tip/drm-tip]
[cannot apply to linux-review/Karunika-Choo/drm-panthor-Ignore-EOPNOTSUPP-for-shader-present-nvmem-lookup/20260922-214455 daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v7.4-rc2 next-20261109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karunika-Choo/drm-panthor-Ignore-EOPNOTSUPP-for-shader-present-nvmem-lookup/20261110-153822
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261110153907.3241978-18-karunika.choo%40arm.com
patch subject: [PATCH v2 17/28] drm/panthor: Add arbitration scheduler
config: um-randconfig-1001-20261111 (https://download.01.org/0day-ci/archive/20261111/202611110840.2W7v6LAR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110840.2W7v6LAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110840.2W7v6LAR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:223:3: error: call to undeclared function 'hrtimer_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     223 |                 hrtimer_start(&sched->stop_timer.timer,
         |                 ^
>> drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:224:38: error: use of undeclared identifier 'HRTIMER_MODE_REL'
     224 |                               ms_to_ktime(yield_timeout), HRTIMER_MODE_REL);
         |                                                           ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:249:4: error: call to undeclared function 'hrtimer_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     249 |                         hrtimer_start(&sched->grant_timer.timer,
         |                         ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:251:11: error: use of undeclared identifier 'HRTIMER_MODE_REL'
     251 |                                       HRTIMER_MODE_REL);
         |                                       ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:291:3: error: call to undeclared function 'hrtimer_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     291 |                 hrtimer_start(&sched->close_timer.timer,
         |                 ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:292:38: error: use of undeclared identifier 'HRTIMER_MODE_REL'
     292 |                               ms_to_ktime(yield_timeout), HRTIMER_MODE_REL);
         |                                                           ^
>> drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:458:6: error: call to undeclared function 'hrtimer_is_queued'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     458 |         if (hrtimer_is_queued(timer))
         |             ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:483:6: error: call to undeclared function 'hrtimer_is_queued'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     483 |         if (hrtimer_is_queued(timer))
         |             ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:504:6: error: call to undeclared function 'hrtimer_is_queued'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     504 |         if (hrtimer_is_queued(timer))
         |             ^
>> drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:621:2: error: call to undeclared function 'hrtimer_cancel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     621 |         hrtimer_cancel(&sched->grant_timer.timer);
         |         ^
>> drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:666:2: error: call to undeclared function 'hrtimer_setup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     666 |         hrtimer_setup(&sched->grant_timer.timer,
         |         ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:668:26: error: use of undeclared identifier 'HRTIMER_MODE_REL'
     668 |                       CLOCK_MONOTONIC, HRTIMER_MODE_REL);
         |                                        ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:671:26: error: use of undeclared identifier 'HRTIMER_MODE_REL'
     671 |                       CLOCK_MONOTONIC, HRTIMER_MODE_REL);
         |                                        ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:674:26: error: use of undeclared identifier 'HRTIMER_MODE_REL'
     674 |                       CLOCK_MONOTONIC, HRTIMER_MODE_REL);
         |                                        ^
   drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c:807:2: error: call to undeclared function 'hrtimer_cancel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     807 |         hrtimer_cancel(&sched->grant_timer.timer);
         |         ^
   15 errors generated.


vim +/hrtimer_start +223 drivers/gpu/drm/panthor/arbitration/panthor_arbitration_sched.c

   207	
   208	static void arb_sched_stop_locked(struct panthor_arbitration_sched *sched)
   209	{
   210		int ret;
   211	
   212		lockdep_assert_held(&sched->lock);
   213	
   214		ret = __arb_sched_stop_locked(sched);
   215		if (!ret) {
   216			if (sched->phase != ARB_SCHED_PHASE_STOPPING) {
   217				dev_warn(sched->dev, "%s: Stop ACKED when not yielding",
   218					 sched->name);
   219				return;
   220			}
   221	
   222			sched->stop_timer.epoch = sched->epoch;
 > 223			hrtimer_start(&sched->stop_timer.timer,
 > 224				      ms_to_ktime(yield_timeout), HRTIMER_MODE_REL);
   225		}
   226	}
   227	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
