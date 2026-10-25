Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917049;
	b=VztdsrhLdOQs9c9VeJPHXhfJEcwuZSRiHwpI3Fn6aAZR/GEdIN15gOwnC7uQ95cFE1My
	 p4RCAIAj+6WUxv9BN5qR78iICJ1nOxux/Lyf/98qLwgdVrB8tBAHOhJV1HZmeTiBKVXC9
	 fC5Nsn7ygIgc+U4kasHWZrw1vUO538EAlTzLis8+XLXMX/gFfOQsziUGLlr3jy16EQAB+
	 41/3R1U9BiuULgK08NLbE9BozQn9oPd4J5Yem65E+dsY+l+FiK2txb8/t5CkTmhCbYSt1
	 RNGUF/LUmS+bU8E3jbyUo6m1452xMieeO7RJQb3nLMF87HNYL5SIwbELli7XZVUPnBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917049;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0WK118/ERZBXhtRec53rvDOkL0U2G2NqsQCMpV8RWVA=;
	b=BmvzN/p9OvJBomSoPD1XiG3z4wbM6ELpsfbBqsLz1azCFvfQivlmpMi0ODarEugrZBLd
	 PU2ELYodaZsV7ZqFtC4Axhv9rI9tWLPj92sKwK8mljnNKPvRCGE8CLFZ1/iSdUS/8WSH6
	 8eAMzhicbUeXg5Ik1W+dFKtjMYDGVKgEv+wVom/zXenVBF20z2m3MTfzu/a5oJwstsJjp
	 yh1MDgpPBLlQaLfXCXD90IIUAD2rDOBEzyIabsCrs49XEFrwEEBbCrioLtbb61c9RKmY1
	 iHnonTr6BgCKg2rEiA7NMDTM1Sc0ySzroZDosFdPpwmMQkkh2+dEaPRTbA+ixPQ+V0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPtbxR0+;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0430A606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0430A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPtbxR0+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792917048; x=1824453048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2SPM72OVgIiZbPxG8Ns2E3PVKC34lOWa7p8uiRZQ3AA=;
  b=fPtbxR0+z4LalkRe6HYhV7waVthwnXwvgG9muCMC+XsWYmK3eQCdOoaC
   FJ7+FiJfbSrM+hXmAA1YfbnKZqq7N3pNlHs22THicG3MtNJdWnyjUFb65
   pNX77hE8tRMtRQej30Bp2IWKWYQ6V5w7GdC/2h3/M24ZrwavGj7A5waxj
   KFhqzg8jg7m2iNjy7UamfNfGSA0JOo0QpQOVpbjNckXh1/yLRlDxw2mps
   W7nyzWasRet7AM1HKAh31N6tRBLFdCmdTukUPiQyTybI9V4vPz4ayspOA
   BLVHpDhz60ptOlKmsi+4qdkGO99vbg4rhfg9LW9v5ndGSoNbNNGJDhpwo
   g==;
X-CSE-ConnectionGUID: vDl1XY6NTxyT591uY/ciSQ==
X-CSE-MsgGUID: 6AuuL/qgSYi1ok0Y68MIvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1635997"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1635997"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 01:30:47 -0700
X-CSE-ConnectionGUID: gNGyz2D4RjunjEKhSdA8zw==
X-CSE-MsgGUID: 9q2/t7SiR9qcQK0UFb17Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4361351"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2026 01:30:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKtcn-00000000Ug4-1JV0;
	Sun, 25 Oct 2026 08:30:41 +0000
Date: Sun, 25 Oct 2026 16:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>, Wei Wang <wvw@google.com>
Subject: Re: [PATCH] sched/uclamp: Fix race condition leading to imbalanced
 uclamp_rq
Message-ID: <202610251831.6qMLJiPR-lkp@intel.com>
References: <20261024233945.74794-1-qyousef@layalina.io>
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
In-Reply-To: <20261024233945.74794-1-qyousef@layalina.io>

Hi Qais,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/master peterz-queue/sched/core linus/master v7.3 next-20261023]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qais-Yousef/sched-uclamp-Fix-race-condition-leading-to-imbalanced-uclamp_rq/20261025-003945
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20261024233945.74794-1-qyousef%40layalina.io
patch subject: [PATCH] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20261025/202610251831.6qMLJiPR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251831.6qMLJiPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251831.6qMLJiPR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
>> kernel/sched/sched.h:3833:6: warning: no previous prototype for 'init_uclamp_rq' [-Wmissing-prototypes]
    3833 | void init_uclamp_rq(struct rq *rq) {}
         |      ^~~~~~~~~~~~~~
--
   In file included from kernel/sched/rq-offsets.c:5:
>> kernel/sched/sched.h:3833:6: warning: no previous prototype for 'init_uclamp_rq' [-Wmissing-prototypes]
    3833 | void init_uclamp_rq(struct rq *rq) {}
         |      ^~~~~~~~~~~~~~


vim +/init_uclamp_rq +3833 kernel/sched/sched.h

  3832	
> 3833	void init_uclamp_rq(struct rq *rq) {}
  3834	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
