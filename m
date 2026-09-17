Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21084DAFAF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647570; cv=none; b=sYgzTvSlFFKXYHu0WGDU3qPhYORwpOfBPDJAsxB1qUA9DWYGVbNnR/omDcJx+35Pn+ZJEaj34VChLAVvypOQYrZg24HaLBhX0Ck6tz3TjtmyBOgZavQHVZZ6A4+aPWwijhvGcFWmzRlHRorDg/6eQkhxFeakOdfy+VoxqZWEtJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647570; c=relaxed/simple;
	bh=07ffJ6S132w/uUpfbUZ5srSt9P/6IzCrgGrWCPsPHms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O7M8pfoKrp8wrPn37E0bPtNj+KemUy/cbSw4ZPEF42Dv7jx6epg08iGZ3irYhyrVqWVkoXFXIXXWe6sulxiDXeVUP+4tTDQttsP9qCH5NJAr9WTVqM5TQZiEj1UXif+FSeIrpdMo873YmCeKxrQVDD4Z0Yk+dzNeVtAiqGezOxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fv+0MQUw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fv+0MQUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789647566; x=1821183566;
  h=date:from:to:cc:subject:message-id;
  bh=07ffJ6S132w/uUpfbUZ5srSt9P/6IzCrgGrWCPsPHms=;
  b=fv+0MQUwPhfyqjXKxTgPIfwhtIyflmFijz4Pyx3/3L0XePpGmiUHzyi4
   qqnNO2jpo5JON73mNce9LQRoFENg1/d9bZ84mERJhXrMrxVfi3Gn9fQHb
   XZ2FEsJp7j97QPBdXSbReut174tkICJpsfKkm11UVz8g50Wc1nRmelJos
   r1ShA2ihDVjwe6bTwOSJWOTsdH/qGKNjOs/CYV1d08rnYevqRRStvh0eT
   AEgkBeB9KC3dD9r4MnIFec64u1ZghUYGbtWbqVnjCaANsbLlcJC7gj8yb
   g3z36FlrdyAOKQEx1+bdzqFE7XLGp9puGacCTWUxWUCGUva44Psb+f9+l
   g==;
X-CSE-ConnectionGUID: cM7KLhITScKUkYGAR8MqNw==
X-CSE-MsgGUID: JssjG3ttTUqWM1/h9t6c4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89927775"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89927775"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:19:23 -0700
X-CSE-ConnectionGUID: oHNx7WGbTxipQbFUk/ZvrQ==
X-CSE-MsgGUID: qKjpKVxfQD61fVN9ORZh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2150522"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 05:19:22 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7B5C-000000007kH-3iRn;
	Thu, 17 Sep 2026 12:19:18 +0000
Date: Thu, 17 Sep 2026 20:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Su <sh_def@163.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/sched/core.c:5791:14: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202609172041.ahqSILHp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: f5741d2b34519d387edf6e9798fc7030c20a35f3 sched/core: Call wq_worker_tick() for the execution context
date:   7 days ago
config: x86_64-randconfig-1301-20260917 (https://download.01.org/0day-ci/archive/20260917/202609172041.ahqSILHp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609172041.ahqSILHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f5741d2b3451 ("sched/core: Call wq_worker_tick() for the execution context")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609172041.ahqSILHp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:337:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:337:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:337:56: sparse:    struct task_struct *
   kernel/sched/core.c:843:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:843:33: sparse:     expected struct task_struct *task
   kernel/sched/core.c:843:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1197:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1197:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1197:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1308:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1308:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1308:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2295:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2295:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2295:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2310:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2310:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2310:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3715:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3715:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3715:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3985:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3985:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3985:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:8501:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8501:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:8501:43: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:5791:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5791:14: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5791:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5792:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5792:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5792:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6473:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6473:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6473:32: sparse:    struct task_struct *
   kernel/sched/core.c:6505:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6505:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6505:23: sparse:    struct task_struct *
   kernel/sched/core.c:6513:46: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6513:46: sparse:    struct task_struct *
   kernel/sched/core.c:6513:46: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6571:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:6571:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:6571:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:7124:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7124:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7124:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7195:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev_donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7195:52: sparse:     expected struct task_struct *prev_donor
   kernel/sched/core.c:7195:52: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7210:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7210:31: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7210:31: sparse:    struct task_struct *
   kernel/sched/core.c:7736:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7736:17: sparse:    struct task_struct *
   kernel/sched/core.c:7736:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10651:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10651:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10651:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:10969:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10969:58: sparse:     expected struct task_struct *t
   kernel/sched/core.c:10969:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:11012:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:11012:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:11012:38: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2500:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2500:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2500:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2489:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2489:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2489:25: sparse:    struct task_struct *
   kernel/sched/core.c:2290:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2290:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2290:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2500:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2500:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2500:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2801:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2801:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2801:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2801:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2801:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2801:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2500:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2500:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2500:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2778:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2778:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2778:9: sparse:    struct task_struct *

vim +5791 kernel/sched/core.c

  5770	
  5771	/*
  5772	 * This function gets called by the timer code, with HZ frequency.
  5773	 * We call it with interrupts disabled.
  5774	 */
  5775	void sched_tick(void)
  5776	{
  5777		int cpu = smp_processor_id();
  5778		struct rq *rq = cpu_rq(cpu);
  5779		/* scheduler accounting goes to the donor task */
  5780		struct task_struct *curr, *donor;
  5781		struct rq_flags rf;
  5782		unsigned long hw_pressure;
  5783		u64 resched_latency;
  5784	
  5785		if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
  5786			arch_scale_freq_tick();
  5787	
  5788		sched_clock_tick();
  5789	
  5790		rq_lock(rq, &rf);
> 5791		curr = rq->curr;
  5792		donor = rq->donor;
  5793	
  5794		psi_account_irqtime(rq, donor, NULL);
  5795	
  5796		update_rq_clock(rq);
  5797		hw_pressure = arch_scale_hw_pressure(cpu_of(rq));
  5798		update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure);
  5799	
  5800		if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY))
  5801			resched_curr(rq);
  5802	
  5803		donor->sched_class->task_tick(rq, donor, 0);
  5804		if (sched_feat(LATENCY_WARN))
  5805			resched_latency = cpu_resched_latency(rq);
  5806		calc_global_load_tick(rq);
  5807		sched_core_tick(rq);
  5808		scx_tick(rq);
  5809	
  5810		rq_unlock(rq, &rf);
  5811	
  5812		if (sched_feat(LATENCY_WARN) && resched_latency)
  5813			resched_latency_warn(cpu, resched_latency);
  5814	
  5815		perf_event_task_tick();
  5816	
  5817		if (curr->flags & PF_WQ_WORKER)
  5818			wq_worker_tick(curr);
  5819	
  5820		if (!scx_switched_all()) {
  5821			rq->idle_balance = idle_cpu(cpu);
  5822			sched_balance_trigger(rq);
  5823		}
  5824	}
  5825	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
