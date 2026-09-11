Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8943101B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105822; cv=none; b=CmOMFfFt47oei27D1491teHj7tzB29aobg06X1gYG3BpekeztLS21wHMxV7f/pbgEvJVQOMVop+sGA8/RKIo/dDJOeZMq5mdwH41s33i4T4z0Y9VGgXg8YUDo8SJQMTpe5ubR6Izp2QRFtKOY2NkfIPS9ZDaCxJ8Kg3CXYtzM+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105822; c=relaxed/simple;
	bh=bz2rgtfciFFI0DYRRKeb619NM2aKGcaGOP2MH1LeWs8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JVKEY8ghmUazh/80EydqEt6ZNbfc3v0FSpfQ16JtquAqw2UrNHamNMk/mlKOStlu7NNC+zkQ/bLtqMAw6RIcp9RpSG99QDnJlg0h1LDFUtkMqT3etSmMyD6k/GHjOy34+19xvvcvb9ZimBMdGiB32G1SKYdUt7WFYVSYOeikY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0RJ8Ev4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0RJ8Ev4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789105820; x=1820641820;
  h=date:from:to:cc:subject:message-id;
  bh=bz2rgtfciFFI0DYRRKeb619NM2aKGcaGOP2MH1LeWs8=;
  b=d0RJ8Ev4i6saAwr0KGEDTj156VU0afcryh2vxbhcsAfFQHZryPA8Pj9A
   NW/d7Szwe0E/2CfNI5YhPXj+XuPs7yOzreGILfvjjMHxzJA8uDemDvrv1
   h66VDdddRYipffvy6Fj3S06SKKDoSVlMBo42xN2734JMvQ07QwybE5yAA
   8tf1Uh3u9/OUijDYlxRvKJeJMFEmZw1zqFiFogjQFEb8nsmfwZ5GGxqr+
   Nh/ezlJa5N3hDxHX7t3NG2aulvhG1kT8GuKOjE6lsGvnb9R75tTHl9eZQ
   zrOyiMaPYrLyA4wTgYdjMy75FibIIznH7SJ2H+ZaEAKL1Z5XkV6ZA1462
   Q==;
X-CSE-ConnectionGUID: UelFsp0mS3uuiJR1Pi7qjA==
X-CSE-MsgGUID: Ct4kbwAaRvOL3f+Ps1mkLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89694857"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89694857"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:50:19 -0700
X-CSE-ConnectionGUID: Uh8H8E2US+qiEla8Jv9kyg==
X-CSE-MsgGUID: 5UdPKH32QeiHo7E+sBFqIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="270459391"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 22:50:16 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4u8l-0000000016q-3LRp;
	Fri, 11 Sep 2026 05:49:45 +0000
Date: Fri, 11 Sep 2026 13:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: kernel/sched/core.c:10574:58: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202609111310.Pj9nrtAS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: fbd0e71dc370af73f6b316e4de9eed273dd90340 sched/mmcid: Provide CID ownership mode fixup functions
date:   10 months ago
config: x86_64-randconfig-121-20260910 (https://download.01.org/0day-ci/archive/20260911/202609111310.Pj9nrtAS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111310.Pj9nrtAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fbd0e71dc370 ("sched/mmcid: Provide CID ownership mode fixup functions")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111310.Pj9nrtAS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:880:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:880:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:880:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1100:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1100:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1100:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2203:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2203:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2203:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2214:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2214:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2214:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3656:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3656:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3656:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3861:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3861:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3861:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:8167:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8167:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:8167:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5585:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5585:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5585:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6799:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6799:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6799:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6865:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6865:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6865:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7372:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7372:17: sparse:    struct task_struct *
   kernel/sched/core.c:7372:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10322:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10322:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10322:25: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:10574:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10574:58: sparse:     expected struct task_struct *t
   kernel/sched/core.c:10574:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:10610:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:10610:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10610:38: sparse:    struct task_struct *
   kernel/sched/core.c:631:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:656:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:680:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1799:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1799:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:880:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1579:13: sparse: sparse: context imbalance in 'uclamp_update_util_min_rt_default' - wrong count at exit
   kernel/sched/core.c:2284:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c:2678:6: sparse: sparse: context imbalance in 'set_cpus_allowed_common' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2474:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2277:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2277:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2277:25: sparse:    struct task_struct *
   kernel/sched/core.c:2167:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2167:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2167:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2497:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2497:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2497:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2497:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2497:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2497:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2474:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2474:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2474:9: sparse:    struct task_struct *
   kernel/sched/core.c:10573:31: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:10573:53: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:10578:30: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:10578:52: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:10579:46: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:10584:35: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:10601:13: sparse: sparse: context imbalance in 'mm_cid_fixup_task_to_cpu' - wrong count at exit

vim +10574 kernel/sched/core.c

 10555	
 10556	static void __maybe_unused mm_cid_fixup_cpus_to_tasks(struct mm_struct *mm)
 10557	{
 10558		unsigned int cpu;
 10559	
 10560		/* Walk the CPUs and fixup all stale CIDs */
 10561		for_each_possible_cpu(cpu) {
 10562			struct mm_cid_pcpu *pcp = per_cpu_ptr(mm->mm_cid.pcpu, cpu);
 10563			struct rq *rq = cpu_rq(cpu);
 10564	
 10565			/* Remote access to mm::mm_cid::pcpu requires rq_lock */
 10566			guard(rq_lock_irq)(rq);
 10567			/* Is the CID still owned by the CPU? */
 10568			if (cid_on_cpu(pcp->cid)) {
 10569				/*
 10570				 * If rq->curr has @mm, transfer it with the
 10571				 * transition bit set. Otherwise drop it.
 10572				 */
 10573				if (rq->curr->mm == mm && rq->curr->mm_cid.active)
 10574					mm_cid_transit_to_task(rq->curr, pcp);
 10575				else
 10576					mm_drop_cid_on_cpu(mm, pcp);
 10577	
 10578			} else if (rq->curr->mm == mm && rq->curr->mm_cid.active) {
 10579				unsigned int cid = rq->curr->mm_cid.cid;
 10580	
 10581				/* Ensure it has the transition bit set */
 10582				if (!cid_in_transit(cid)) {
 10583					cid = cid_to_transit_cid(cid);
 10584					rq->curr->mm_cid.cid = cid;
 10585					pcp->cid = cid;
 10586				}
 10587			}
 10588		}
 10589		/* Clear the transition bit */
 10590		WRITE_ONCE(mm->mm_cid.transit, 0);
 10591	}
 10592	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
