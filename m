Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E337B370AE3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792336649; cv=none; b=KpKFNmyYEhCUa+BZ0wXbD1paLQI0cN+yGvJCakXxXqbfH5ymFVleZ+3UJtwkiiy4n5G5GkFl/cD9GXPJXiMgwLU4gak/wnAorXvwydEZYj+I+2JdeuFchzxJyZE8NfdBwhFmxC5tF11FmuY/Oc/oUcx7RMUi5zDs/IwRoL1+6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792336649; c=relaxed/simple;
	bh=/74jK33fOqw/cOdR6zE+IM5rPMS2awzsSNjxf/ICu8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yk5Ci+vdBhG21XwJdL6H0VZs2wdGBcgPe9WPU2KeKh2azAU/w9p44IUbVHlmBwwDDqsSjOFDhuJ1pIeXX/twErK5sqWJU7s5cNG3+ZkcoWHpCIl1U48Pn52/8tGW7Lzl5O6RNnj4AB3qkTHruho031/lzporJXeEd+8Y/rjTnuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qe8qEt3i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qe8qEt3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792336648; x=1823872648;
  h=date:from:to:cc:subject:message-id;
  bh=/74jK33fOqw/cOdR6zE+IM5rPMS2awzsSNjxf/ICu8c=;
  b=Qe8qEt3i5Wzw2LktcQmnZMbavy/yyY03UWz11HMEKNFGwSCIHztCc+AH
   tL+cYh69LbsBYTYXG+Kz0/AZwzJvRlDxoPrK/tnPQUikaPeaCMZhcrGCN
   dTlsaMqLg456FF0DJnTk9G8rX64w5W/O/FZXHEldv6Xsr873qoJkEHQoT
   hhaZT4kCM2otON4hzkll0zWb5rZIBKfTCHsZKwAjSXn+29Mh9MKM817T4
   47i+87e+CeGQWVjUKC9b7o6702ehVR0dXNSee/Yn2+DI82dK4GylGghwu
   L6ReAvP+HkvDojxaHNzNnaL7FQkoFtN9uQUFmuzxJeLLhZ3P6U5x+Gk27
   A==;
X-CSE-ConnectionGUID: XrtoEuAUReygetb+9rLLvw==
X-CSE-MsgGUID: UckG1tv+S1GGFq3lhwHs2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1062217"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="1062217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 08:17:27 -0700
X-CSE-ConnectionGUID: MlIQJDgkSaOy4lRthZW3xg==
X-CSE-MsgGUID: WBIoBi44SZyuOlGxYZZb5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2677756"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2026 08:17:25 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xISdW-0000000059T-2OXi;
	Sun, 18 Oct 2026 15:17:22 +0000
Date: Sun, 18 Oct 2026 17:17:02 +0200
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/events/core.c:5424:21: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202610181712.Iwovwyoc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   32c52ec87d6245ee2d12ed5dd509e40062939b50
commit: 4960626f956d63dce57f099016c2ecbe637a8229 perf/core: Fix slow perf_event_task_exit() with LBR callstacks
date:   9 months ago
config: riscv-randconfig-r2302-20261018 (https://download.01.org/0day-ci/archive/20261018/202610181712.Iwovwyoc-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181712.Iwovwyoc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4960626f956d ("perf/core: Fix slow perf_event_task_exit() with LBR callstacks")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181712.Iwovwyoc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   kernel/events/core.c:1585:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1585:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1585:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1598:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1598:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1598:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3776:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3776:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3776:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3780:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3780:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3780:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3781:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3781:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3781:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3834:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3834:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3834:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3835:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3835:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3835:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4252:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4252:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4252:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4660:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4660:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4660:15: sparse:    struct perf_event_context *
   kernel/events/core.c:5149:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5149:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:5149:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6927:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6927:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6927:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5424:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
   kernel/events/core.c:5424:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu *__new @@     got struct perf_ctx_data *[assigned] cd @@
>> kernel/events/core.c:5424:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/events/core.c:5435:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_ctx_data [noderef] __rcu **___op @@     got struct perf_ctx_data **__ai_oldp @@
   kernel/events/core.c:5435:37: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/events/core.c:6310:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:6678:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6678:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6678:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6802:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6802:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6802:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6835:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6835:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6835:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6948:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6948:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6948:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6964:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6964:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6964:14: sparse:    struct perf_buffer *
   kernel/events/core.c:8946:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8946:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8946:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9034:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9034:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:9034:13: sparse:    struct perf_buffer *
   kernel/events/core.c:9138:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:9138:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:9138:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9140:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:9140:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:9140:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9876:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9876:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9876:15: sparse:    struct perf_event_context *
   kernel/events/core.c:11071:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11071:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11071:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:11110:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11110:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11110:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11385:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11385:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:11385:23: sparse:    struct perf_event_context *
   kernel/events/core.c:12462:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:14496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14496:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:14496:9: sparse:    struct perf_event_context *
   kernel/events/core.c:15016:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:15016:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:15016:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:197:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:213:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1632:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:3106:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:5123:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:204:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *src @@
   kernel/events/core.c:10924:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10924:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10924:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10944:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10944:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10944:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11060:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:11060:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:11060:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11060:16: sparse:    struct swevent_hlist *

vim +/__rcu +5424 kernel/events/core.c

  5412	
  5413	static int
  5414	attach_task_ctx_data(struct task_struct *task, struct kmem_cache *ctx_cache,
  5415			     bool global)
  5416	{
  5417		struct perf_ctx_data *cd, *old = NULL;
  5418	
  5419		cd = alloc_perf_ctx_data(ctx_cache, global);
  5420		if (!cd)
  5421			return -ENOMEM;
  5422	
  5423		for (;;) {
> 5424			if (try_cmpxchg(&task->perf_ctx_data, &old, cd)) {
  5425				if (old)
  5426					perf_free_ctx_data_rcu(old);
  5427				/*
  5428				 * Above try_cmpxchg() pairs with try_cmpxchg() from
  5429				 * detach_task_ctx_data() such that
  5430				 * if we race with perf_event_exit_task(), we must
  5431				 * observe PF_EXITING.
  5432				 */
  5433				if (task->flags & PF_EXITING) {
  5434					/* detach_task_ctx_data() may free it already */
  5435					if (try_cmpxchg(&task->perf_ctx_data, &cd, NULL))
  5436						perf_free_ctx_data_rcu(cd);
  5437				}
  5438				return 0;
  5439			}
  5440	
  5441			if (!old) {
  5442				/*
  5443				 * After seeing a dead @old, we raced with
  5444				 * removal and lost, try again to install @cd.
  5445				 */
  5446				continue;
  5447			}
  5448	
  5449			if (refcount_inc_not_zero(&old->refcount)) {
  5450				free_perf_ctx_data(cd); /* unused */
  5451				return 0;
  5452			}
  5453	
  5454			/*
  5455			 * @old is a dead object, refcount==0 is stable, try and
  5456			 * replace it with @cd.
  5457			 */
  5458		}
  5459		return 0;
  5460	}
  5461	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
