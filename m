Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820796;
	b=QnjsFoM5kjIrA1a87vCpyFKeW1P4N5qqeY+v4byat6iD7fNwfiftkInRJZs4aimcBpKR
	 zqX2WwAxW6UFkCNKJxu0VPVqu8qkNOpnW0h54mfHhlDnjEIzLsw0wmFhb0RP0UoFU3wk9
	 QDHT28x50LdVVIdwMd+fWht7HvkOlSZxD2szqHuZDarG6xgAfK3cKH3ekd3TiHv5+PEx/
	 0dtOvbaQhIDDCYO31Vs24aW0ELDlWPaL5Bv39bKOlweTvIpbsbWxnnINL9CDGtFpdOHVr
	 4/+qU40Gzj9qa9T8Y1FuB5s3KozsZIDQmp+/ut37q0OqaMdb7DsbINJ3BAtgHpnpzTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820796;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=d7tiLrfgE+h2HcaTjYkAT+zQXH8wrLQS7Qb0PGzZiMs=;
	b=AKZ7JUAhe4VWr5+wkG+MhwjCOQTw7chhutqcDRmsXo29tKJiRNY3aGbjSJghlnVrNy3B
	 JbDiwhLjthvgS7AtSLn/3+z3lpoM8cWzG4H+zW3UhMPq1xvk6gaTOynNKqYKUtbPYeKmn
	 riJSLgV5y0cUBU9Pum6p6wFYPN7ZFkotuCbTmE2KL1IW8FJ5GCl/tEyA0335IBH2e5vHp
	 yYgu/VzzhrfeZygsDjRB6Y6S3xfaVqjarvwUzTv7YMM2R+5mkX35yj6EQp4lXlBwG4oAk
	 hxHBBQbQJN76QMCNCUBqkwwA+PjNJ/2jraEEdFsb+LO1I0a9cxD9VxElRgrR41146Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I2vO1bWi;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C529606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C529606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I2vO1bWi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792820794; x=1824356794;
  h=date:from:to:cc:subject:message-id;
  bh=T9Va/bYzHJrgy/5ZZIkSOOBgmjumdr5EmYjhGMyYRAw=;
  b=I2vO1bWiyCVxrYBNpH15WXYKlgeo7oUuZG62ZC9Bb2SWsEhVv9naVYze
   xG1pkDkDwrCeLs7AiHVgLysO84+1WQBh6FxbivToHlhOWldcnY6zgqkIY
   b76z6bnlbTjVL/ygyA6nDdzbQT0QdcpoXu3r5rBQO5/ebgzjIUUzD6Qv1
   4nkOEPqCNdU1N8IWw5B0m+vgYH62VuTf/JAi8CpHCTeEPACxQ5Ho+nv2e
   VveN0IyvoY4BBspNd8V0B1DbqZaUnYKEDSmjZjwlA+4OMAswBmBFu91RH
   o+nehr3jA9Aus5eiascL0S2MFoexe0/0ZEX5itehPTykOQ0frnO4Pav5v
   g==;
X-CSE-ConnectionGUID: Z7epE53xRq2R7so28IILKA==
X-CSE-MsgGUID: E6j9L0YGTaujTsvy01zN7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1586480"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1586480"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 22:46:34 -0700
X-CSE-ConnectionGUID: SC7/GrluTP+66+XyjNJWuw==
X-CSE-MsgGUID: a4TttirPTNKvBpcqK+ffgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3872694"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2026 22:46:32 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKUaL-000000003J9-3fnE;
	Sat, 24 Oct 2026 05:46:29 +0000
Date: Sat, 24 Oct 2026 07:46:18 +0200
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/ext/ext.c:6823:19: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202610240742.zGIUIQt7-lkp@intel.com>
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
head:   17bb0e2f6c8043f70a693a5f3797471cbed354c8
commit: db87a8f530b62d43033ff41172d479d2ccd6fee3 sched_ext: Merge branch 'for-7.3-fixes' into for-7.4
date:   7 days ago
config: sparc64-randconfig-r2307-20261023 (https://download.01.org/0day-ci/archive/20261024/202610240742.zGIUIQt7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240742.zGIUIQt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: db87a8f530b6 ("sched_ext: Merge branch 'for-7.3-fixes' into for-7.4")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240742.zGIUIQt7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1579:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1579:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1605:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1605:35: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1605:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1627:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1627:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1627:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1653:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1653:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1653:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2006:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2006:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2006:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2029:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2029:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2029:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2380:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2380:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2380:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2382:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2382:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2382:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2382:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2382:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2382:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:3157:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3157:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3157:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3167:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3167:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:3167:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3273:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3273:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3273:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2737:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2737:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2737:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2757:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2757:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2757:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1189:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1189:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1189:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1189:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1189:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1189:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1287:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1287:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1287:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1816:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1816:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1816:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1816:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1816:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1816:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2131:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2131:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2131:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2979:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2979:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2979:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2619:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2619:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2619:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2620:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2620:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2620:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2694:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2694:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2694:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2714:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2714:35: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2714:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3318:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3318:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3318:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3320:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3320:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3320:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3322:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3322:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3322:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3584:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3584:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3584:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3637:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/ext.c:454:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:1547:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:1751:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1751:15: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:1751:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:2559:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2573:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:3477:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:3824:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:5018:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:5019:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
>> kernel/sched/ext/ext.c:6823:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:7601:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7602:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7605:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:7606:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:9161:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:9207:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:9570:18: sparse: sparse: symbol 'scx_bpf_dsq_insert___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9592:18: sparse: sparse: symbol 'scx_bpf_dsq_insert' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9652:1: sparse: sparse: symbol '__scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9671:18: sparse: sparse: symbol 'scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9832:17: sparse: sparse: symbol 'scx_bpf_dispatch_nr_slots' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9852:18: sparse: sparse: symbol 'scx_bpf_dispatch_cancel' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9896:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9939:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9953:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9972:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10006:18: sparse: sparse: symbol 'scx_bpf_dsq_move' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10031:18: sparse: sparse: symbol 'scx_bpf_dsq_move_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10072:17: sparse: sparse: symbol 'scx_bpf_reenqueue_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10111:17: sparse: sparse: symbol 'scx_bpf_create_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10198:18: sparse: sparse: symbol 'scx_bpf_task_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10254:18: sparse: sparse: symbol 'scx_bpf_task_set_dsq_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10391:18: sparse: sparse: symbol 'scx_bpf_kick_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10414:18: sparse: sparse: symbol 'scx_bpf_kick_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10441:17: sparse: sparse: symbol 'scx_bpf_dsq_nr_queued' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10488:18: sparse: sparse: symbol 'scx_bpf_destroy_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10514:17: sparse: sparse: symbol 'bpf_iter_scx_dsq_new' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10558:32: sparse: sparse: symbol 'bpf_iter_scx_dsq_next' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10576:18: sparse: sparse: symbol 'bpf_iter_scx_dsq_destroy' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10605:32: sparse: sparse: symbol 'scx_bpf_dsq_peek' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10649:18: sparse: sparse: symbol 'scx_bpf_dsq_reenq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10689:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10782:18: sparse: sparse: symbol 'scx_bpf_exit_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10807:18: sparse: sparse: symbol 'scx_bpf_error_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10834:18: sparse: sparse: symbol 'scx_bpf_dump_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10889:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10909:17: sparse: sparse: symbol 'scx_bpf_cidperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10940:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10960:17: sparse: sparse: symbol 'scx_bpf_cidperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11047:18: sparse: sparse: symbol 'scx_bpf_cpuperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11074:17: sparse: sparse: symbol 'scx_bpf_cidperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11101:17: sparse: sparse: symbol 'scx_bpf_nr_node_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11111:17: sparse: sparse: symbol 'scx_bpf_nr_cpu_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11121:17: sparse: sparse: symbol 'scx_bpf_nr_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11136:17: sparse: sparse: symbol 'scx_bpf_nr_online_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11154:24: sparse: sparse: symbol 'scx_bpf_online_cmask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11178:17: sparse: sparse: symbol 'scx_bpf_this_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11193:34: sparse: sparse: symbol 'scx_bpf_get_possible_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11201:34: sparse: sparse: symbol 'scx_bpf_get_online_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11210:18: sparse: sparse: symbol 'scx_bpf_put_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11238:17: sparse: sparse: symbol 'scx_bpf_task_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11251:17: sparse: sparse: symbol 'scx_bpf_task_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11271:23: sparse: sparse: symbol 'scx_bpf_locked_rq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11303:32: sparse: sparse: symbol 'scx_bpf_cpu_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11327:32: sparse: sparse: symbol 'scx_bpf_cid_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11352:32: sparse: sparse: symbol 'scx_bpf_tid_to_task' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11420:17: sparse: sparse: symbol 'scx_bpf_now' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11455:18: sparse: sparse: symbol 'scx_bpf_events' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/cid.c:492:18: sparse: sparse: symbol 'scx_bpf_cid_override' was not declared. Should it be static?
   kernel/sched/ext/cid.c:656:17: sparse: sparse: symbol 'scx_bpf_cid_to_cpu' was not declared. Should it be static?
   kernel/sched/ext/cid.c:701:17: sparse: sparse: symbol 'scx_bpf_cpu_to_cid' was not declared. Should it be static?
   kernel/sched/ext/cid.c:975:18: sparse: sparse: symbol 'scx_bpf_cid_topo' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:1067:17: sparse: sparse: symbol 'scx_bpf_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1150:1: sparse: sparse: symbol '__scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1169:17: sparse: sparse: symbol 'scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1212:34: sparse: sparse: symbol 'scx_bpf_get_idle_cpumask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1270:34: sparse: sparse: symbol 'scx_bpf_get_idle_smtmask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1389:17: sparse: sparse: symbol 'scx_bpf_pick_idle_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1475:17: sparse: sparse: symbol 'scx_bpf_pick_any_cpu_node' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/sub.c:2846:17: sparse: sparse: symbol 'scx_bpf_sub_grant' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2854:18: sparse: sparse: symbol 'scx_bpf_sub_revoke' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2860:17: sparse: sparse: symbol 'scx_bpf_sub_caps' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2866:17: sparse: sparse: symbol 'scx_bpf_sub_kill_bstr' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:202:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:202:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:202:48: sparse:    struct task_struct *
   kernel/sched/syscalls.c:1420:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/syscalls.c:1420:22: sparse:     expected struct task_struct *curr
   kernel/sched/syscalls.c:1420:22: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2505:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2505:25: sparse:    struct task_struct [noderef] __rcu *

vim +6823 kernel/sched/ext/ext.c

  6693	
  6694	/**
  6695	 * scx_bypass - [Un]bypass scx_ops and guarantee forward progress
  6696	 * @sch: sched to bypass
  6697	 * @bypass: true for bypass, false for unbypass
  6698	 *
  6699	 * Bypassing guarantees that all runnable tasks make forward progress without
  6700	 * trusting the BPF scheduler. We can't grab any mutexes or rwsems as they might
  6701	 * be held by tasks that the BPF scheduler is forgetting to run, which
  6702	 * unfortunately also excludes toggling the static branches.
  6703	 *
  6704	 * Let's work around by overriding a couple ops and modifying behaviors based on
  6705	 * the DISABLING state and then cycling the queued tasks through dequeue/enqueue
  6706	 * to force global FIFO scheduling.
  6707	 *
  6708	 * - ops.select_cpu() is ignored and the default select_cpu() is used.
  6709	 *
  6710	 * - ops.enqueue() is ignored and tasks are queued in simple global FIFO order.
  6711	 *   %SCX_OPS_ENQ_LAST is also ignored.
  6712	 *
  6713	 * - ops.dispatch() is ignored.
  6714	 *
  6715	 * - dispatch_one() does not report %SCX_DSP_PREV on non-zero slice as slice
  6716	 *   can't be trusted. Whenever a tick triggers, the running task is rotated to
  6717	 *   the tail of the queue.
  6718	 *
  6719	 * - pick_next_task() suppresses zero slice warning.
  6720	 *
  6721	 * - scx_kick_cpu() is disabled to avoid irq_work malfunction during PM
  6722	 *   operations.
  6723	 *
  6724	 * - scx_prio_less() reverts to the default runnable_at order.
  6725	 */
  6726	void scx_bypass(struct scx_sched *sch, bool bypass)
  6727	{
  6728		struct scx_sched *pos;
  6729		unsigned long flags;
  6730		int cpu;
  6731		bool changed;
  6732	
  6733		raw_spin_lock_irqsave(&scx_bypass_lock, flags);
  6734	
  6735		if (bypass) {
  6736			changed = inc_bypass_depth(sch);
  6737			if (changed)
  6738				enable_bypass_dsp(sch);
  6739		} else {
  6740			changed = dec_bypass_depth(sch);
  6741		}
  6742	
  6743		/*
  6744		 * Bypass state is propagated to all descendants - an scx_sched bypasses
  6745		 * if itself or any of its ancestors are in bypass mode. A descendant's
  6746		 * depth is the sum of its own bypasses and its ancestors', so every
  6747		 * call propagates whether or not @sch changed state. The descendants'
  6748		 * claims are released below with @sch's, after their tasks have moved.
  6749		 */
  6750		raw_spin_lock(&scx_sched_lock);
  6751		scx_for_each_descendant_pre(pos, sch) {
  6752			if (pos == sch)
  6753				continue;
  6754			if (bypass) {
  6755				if (inc_bypass_depth(pos))
  6756					enable_bypass_dsp(pos);
  6757			} else {
  6758				dec_bypass_depth(pos);
  6759			}
  6760		}
  6761		raw_spin_unlock(&scx_sched_lock);
  6762	
  6763		/*
  6764		 * A descendant's depth is at least @sch's, so no bypass state changed
  6765		 * unless @sch's did.
  6766		 */
  6767		if (!changed)
  6768			goto unlock;
  6769	
  6770		/*
  6771		 * No task property is changing. We just need to make sure all currently
  6772		 * queued tasks are re-queued according to the new scx_bypassing()
  6773		 * state. As an optimization, walk each rq's runnable_list instead of
  6774		 * the scx_tasks list.
  6775		 *
  6776		 * This function can't trust the scheduler and thus can't use
  6777		 * cpus_read_lock(). Walk all possible CPUs instead of online.
  6778		 */
  6779		for_each_possible_cpu(cpu) {
  6780			struct rq *rq = cpu_rq(cpu);
  6781			struct task_struct *p, *n;
  6782	
  6783			raw_spin_rq_lock(rq);
  6784			raw_spin_lock(&scx_sched_lock);
  6785	
  6786			scx_for_each_descendant_pre(pos, sch) {
  6787				struct scx_sched_pcpu *pcpu = per_cpu_ptr(pos->pcpu, cpu);
  6788				bool was_bypassing = pcpu->flags & SCX_SCHED_PCPU_BYPASSING;
  6789	
  6790				if (pos->bypass_depth) {
  6791					pcpu->flags |= SCX_SCHED_PCPU_BYPASSING;
  6792				} else {
  6793					pcpu->flags &= ~SCX_SCHED_PCPU_BYPASSING;
  6794					if (was_bypassing) {
  6795						unbypass_renotify_idle(rq, pos, pcpu);
  6796						scx_unbypass_replay_ecaps(rq, pos);
  6797					}
  6798				}
  6799			}
  6800	
  6801			raw_spin_unlock(&scx_sched_lock);
  6802	
  6803			/*
  6804			 * We need to guarantee that no tasks are on the BPF scheduler
  6805			 * while bypassing. Either we see enabled or the enable path
  6806			 * sees scx_bypassing() before moving tasks to SCX.
  6807			 */
  6808			if (!scx_enabled()) {
  6809				scx_rq_lock_drop(rq);
  6810				raw_spin_rq_unlock(rq);
  6811				continue;
  6812			}
  6813	
  6814			/*
  6815			 * Bypass trumps protection. Cycling the queued tasks below
  6816			 * clears theirs. The current donor isn't on the runnable list,
  6817			 * so strip its protection here.
  6818			 *
  6819			 * When bypass lifts, the current donor keeps running on its
  6820			 * slice without a cap check. Evict it if it can't stay on the
  6821			 * cpu.
  6822			 */
> 6823			p = rq->donor;
  6824			if (p->sched_class == &ext_sched_class &&
  6825			    scx_is_descendant(scx_task_sched(p), sch)) {
  6826				if (bypass)
  6827					scx_task_slice_ended(rq, p);
  6828				else if (!scx_task_can_stay_on_cpu(rq, p))
  6829					scx_set_task_slice(p, 0);
  6830			}
  6831	
  6832			/*
  6833			 * The use of list_for_each_entry_safe_reverse() is required
  6834			 * because each task is going to be removed from and added back
  6835			 * to the runnable_list during iteration. Because they're added
  6836			 * to the tail of the list, safe reverse iteration can still
  6837			 * visit all nodes.
  6838			 */
  6839			list_for_each_entry_safe_reverse(p, n, &rq->scx.runnable_list,
  6840							 scx.runnable_node) {
  6841				if (!scx_is_descendant(scx_task_sched(p), sch))
  6842					continue;
  6843	
  6844				/* cycling deq/enq is enough, see the function comment */
  6845				scoped_guard (sched_change, p, DEQUEUE_SAVE | DEQUEUE_MOVE) {
  6846					/* nothing */ ;
  6847				}
  6848			}
  6849	
  6850			/* resched to restore ticks and idle state */
  6851			if (cpu_online(cpu) || cpu == smp_processor_id())
  6852				resched_curr(rq);
  6853	
  6854			scx_rq_lock_drop(rq);
  6855			raw_spin_rq_unlock(rq);
  6856		}
  6857	
  6858		/* disarming must come after moving all tasks out of the bypass DSQs */
  6859		if (!bypass) {
  6860			guard(raw_spinlock)(&scx_sched_lock);
  6861			scx_for_each_descendant_pre(pos, sch)
  6862				if (!pos->bypass_depth)
  6863					scx_disable_bypass_dsp(pos);
  6864		}
  6865	unlock:
  6866		raw_spin_unlock_irqrestore(&scx_bypass_lock, flags);
  6867	}
  6868	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
