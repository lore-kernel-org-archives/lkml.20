Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783743644C5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005057; cv=none; b=sBufwn0tvA6ijTrXQVXGDUQ5Dn0V98YTNk89iH4p2bPUd/7HH3Saa+vLz3eza8aUL/mE5GnR5GJlz8H0rnpLWrFs8B2FJ+UdJyhzDVdqK0Oi9AkehGjpqp5ff4bjpeoMUpQq9457YBo6OIJu2BdXcffFMwd8NYK4A0S/xVsGnPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005057; c=relaxed/simple;
	bh=B63td0T0Yo8U9nw3AiUjGWFsRf5Z4SvKDepmKxjXXQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N5f8FHpjiwv7tAZ3ZgGjLcm9Vnp+OrY8la69R3aX7EXD4yXuxvcCKotv0iSQ8lG+E84eXjG0hf1gGe215iAE+d5p48P1q4+rZmPRxw2yihLmh5EgBHqxDnpxMPf4QBh0XE2I6GDb7IMgHvlrPm8hL/XocCMngn7NMVhKRTYDmow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be8lwjjw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be8lwjjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789005055; x=1820541055;
  h=date:from:to:cc:subject:message-id;
  bh=B63td0T0Yo8U9nw3AiUjGWFsRf5Z4SvKDepmKxjXXQQ=;
  b=Be8lwjjwjSa6djSdurXjO0wpGYQyGVUYeVoO1PrH+HZLQPsuPl1kBu/w
   +LeL3gH6W7dcbUGPOiZSMroe6Ljc0+Ga4AQ4uFpvgIT16sFlml0xcKAIe
   2QwgCHT7KuzOn6fxTyZjGM7yDjwLWcsVBylYRbFkDsVe3tFvHwmjxXJsa
   K20D5dUcLCExjbAgV8ye4Nu/AEzozYt6ehlh0DeX40b/QYcCplkvYB+bG
   y/YInFpaPpH0tx6XVxLPbuelL0meNUsbwv5HrDuZunx1uVo42+M8yQBrZ
   fAFipYD6m/bxC4P20YGB7TKWbHpukSdiSaH7Eio3WOHqjOHp3eesujfli
   g==;
X-CSE-ConnectionGUID: S6CIb5mWQuGpCJiz9BliIg==
X-CSE-MsgGUID: Erg5B8CwQXO9H6Hzex6idA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="112218036"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="112218036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:50:53 -0700
X-CSE-ConnectionGUID: 6OIZ2vafRkiRq1fiffkl4A==
X-CSE-MsgGUID: kKlvfaJaS8WrrLLxKxYpng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="276724306"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Sep 2026 18:50:51 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Tw8-000000001Ea-3MO5;
	Thu, 10 Sep 2026 01:50:48 +0000
Date: Thu, 10 Sep 2026 09:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.09.03a 43/55]
 drivers/usb/mtu3/./mtu3_trace.h:239:55: error: invalid type argument of '->'
 (have 'struct mtu3_gpd_ring')
Message-ID: <202609100921.vDOlHS7p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.09.03a
head:   6c5c244f4b239bc4d284e58a2f79a143648557cb
commit: afda2321e6e93a5bcc28bfb4717fbc3a1768446c [43/55] EXP drivers/usb/mtu3: Work around mtu3_log_ep double-indirection issue
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609100921.vDOlHS7p-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100921.vDOlHS7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100921.vDOlHS7p-lkp@intel.com/

Note: the paulmck-rcu/dev.2026.09.03a HEAD 6c5c244f4b239bc4d284e58a2f79a143648557cb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from drivers/usb/mtu3/mtu3_trace.h:279,
                    from drivers/usb/mtu3/mtu3_trace.c:12:
   drivers/usb/mtu3/./mtu3_trace.h: In function 'do_trace_event_raw_event_mtu3_log_ep':
>> drivers/usb/mtu3/./mtu3_trace.h:239:55: error: invalid type argument of '->' (have 'struct mtu3_gpd_ring')
     239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
         |                                                       ^~
   include/trace/trace_events.h:448:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
     448 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:456:23: note: in expansion of macro 'PARAMS'
     456 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   drivers/usb/mtu3/./mtu3_trace.h:214:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
     214 | DECLARE_EVENT_CLASS(mtu3_log_ep,
         | ^~~~~~~~~~~~~~~~~~~
   drivers/usb/mtu3/./mtu3_trace.h:229:9: note: in expansion of macro 'TP_fast_assign'
     229 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:133:
   drivers/usb/mtu3/./mtu3_trace.h: In function 'do_perf_trace_mtu3_log_ep':
>> drivers/usb/mtu3/./mtu3_trace.h:239:55: error: invalid type argument of '->' (have 'struct mtu3_gpd_ring')
     239 |                 __entry->gpd_ring_dma = &mep->gpd_ring->dma;
         |                                                       ^~
   include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
      67 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   drivers/usb/mtu3/./mtu3_trace.h:214:1: note: in expansion of macro 'DECLARE_EVENT_CLASS'
     214 | DECLARE_EVENT_CLASS(mtu3_log_ep,
         | ^~~~~~~~~~~~~~~~~~~
   drivers/usb/mtu3/./mtu3_trace.h:229:9: note: in expansion of macro 'TP_fast_assign'
     229 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +239 drivers/usb/mtu3/./mtu3_trace.h

   213	
   214	DECLARE_EVENT_CLASS(mtu3_log_ep,
   215		TP_PROTO(struct mtu3_ep *mep),
   216		TP_ARGS(mep),
   217		TP_STRUCT__entry(
   218			__string(name, mep->name)
   219			__field(unsigned int, type)
   220			__field(unsigned int, slot)
   221			__field(unsigned int, maxp)
   222			__field(unsigned int, mult)
   223			__field(unsigned int, maxburst)
   224			__field(unsigned int, flags)
   225			__field(unsigned int, direction)
   226			__field(struct mtu3_gpd_ring *, gpd_ring)
   227			__field(dma_addr_t *, gpd_ring_dma)
   228		),
   229		TP_fast_assign(
   230			__assign_str(name);
   231			__entry->type = mep->type;
   232			__entry->slot = mep->slot;
   233			__entry->maxp = mep->ep.maxpacket;
   234			__entry->mult = mep->ep.mult;
   235			__entry->maxburst = mep->ep.maxburst;
   236			__entry->flags = mep->flags;
   237			__entry->direction = mep->is_in;
   238			__entry->gpd_ring = &mep->gpd_ring;
 > 239			__entry->gpd_ring_dma = &mep->gpd_ring->dma;
   240		),
   241		TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
   242			__get_str(name), usb_ep_type_string(__entry->type),
   243			__entry->maxp, __entry->slot,
   244			__entry->mult, __entry->maxburst,
   245			__entry->gpd_ring, __entry->gpd_ring_dma,
   246			__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
   247			__entry->flags & MTU3_EP_STALL ? 'S' : 's',
   248			__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
   249			__entry->flags & MTU3_EP_BUSY ? 'B' : 'b',
   250			__entry->direction ? '<' : '>'
   251		)
   252	);
   253	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
