Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568527;
	b=q4iRMdAOEx5KH7cElVVAuKtb81SIzs+w2HtnvuZPF6FjwpK+lVVpgLqRWZAiv2G1TXTQ
	 udXyq2+OE85wVHwk/Mn3zBjB/qht/VuvX6Dy+Jmxxtl/+hvRxtzlfMVEQ7ENgCRiO8YFi
	 rH3i7hJFyWz4iTfrauC1/+viT4X0smLLJdT2OFYlf+N7YuxYbfe7CB6czCx3wZOxMJHO0
	 m//V4llFyaG6+27bFMb+VU8+IwR6reMI92bKqi0XCJKe88b9jqRi8d7/OgeHLKZ5IfBKW
	 c7d1ImfYpqxSj2v7uPEd5nta9yT1oIipUw138tE1aloBGTuGwEmxbCes6X/zpETkxEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568527;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RGi14GFRYI30G0NJsm1BUhv71kMQcZIB0wrkrGWixoo=;
	b=LFgstvhsf/s4M2OEqRcpk65B55qaS9vWL2ugkdnvNm5d9HBoTBQyaPFLwC7ZUKQeX63O
	 EmKMRKuV0EV74OXSiSHgIjZD2YW3/WvAuNDg+09f6Pa8/yZoRiH58wkzw3BkeyyuSm1GC
	 SjQuucuh8PRlPdzcoP4d4YAJfjHZal+YJb5mztBdY409v840qVnu9aIUxI/fgcKHERMKI
	 vz7xLezHeiXR253SAJfCbaDFV2fqOkZkjVR4aWN4juuepQYs4fsvausZgE1TPKeRHWEC+
	 U00FcQrh/gIe5c3s8C+9Hd5FBFOviN4B5utYya8SKLbHYRBDHlcqJzuDdu5lI8DvsFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWOlMyMM;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558DA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mWOlMyMM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792568526; x=1824104526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sF+EXOjWoRjHwSXrYrKIrkJdnKQAkyJ2jM7+RYSypqs=;
  b=mWOlMyMMFUTmNNyfca5cVl5qr9EuhDO+S7t4Z8kYkyo8mTGWatnvr5JK
   4AEeDmmUm6oP/7k/aG0E5TL8lRqmmGeA8955a3NtdbdU7WSi4gyTm5oeA
   WrdtTl8uZVHIbEEH8sM8TAX63fA8fZgObwzpgyMDgY6Tm/8v2QgldnbJF
   ApfwlVnh4GqCE03qlwgLG50dC0cDx9U9MsPCwaVlNO5iVZhN3T9zH2B9T
   yEYH1BHRFedHfkRV2kSWWauSYNScmXpAdcR4AsA6UPfr6uCkuhVjcIU4h
   sn+6I/6MLnLHxp/I4NYkwxKH0W1TIRhnTZgYbwvD2xYoGdYzeecWztTJb
   Q==;
X-CSE-ConnectionGUID: 1qpyqf6KSri7GVEx0Kssqg==
X-CSE-MsgGUID: ULO5uqFIRni3dfmHZxzkyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1174050"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1174050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 00:42:06 -0700
X-CSE-ConnectionGUID: MrrJJTUUTlyi6yexrGtAqA==
X-CSE-MsgGUID: riQy9ryIROu1V9qc4P6mbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2965686"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2026 00:42:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJQxT-00000000P8c-3o2G;
	Wed, 21 Oct 2026 07:41:59 +0000
Date: Wed, 21 Oct 2026 15:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>, Jann Horn <jannh@google.com>,
	Kees Cook <kees@kernel.org>, Breno Leitao <leitao@debian.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH] kthread: Teach lockdep about kthread_flush_work()
 dependencies
Message-ID: <202610211501.YBj5GUfA-lkp@intel.com>
References: <6dee36e290c2a3b85dcd7cdba2cab72fe57b25c4.camel@infradead.org>
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
In-Reply-To: <6dee36e290c2a3b85dcd7cdba2cab72fe57b25c4.camel@infradead.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chrome-platform/for-next]
[also build test WARNING on chrome-platform/for-firmware-next linus/master v7.3 next-20261019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/kthread-Teach-lockdep-about-kthread_flush_work-dependencies/20261020-160400
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/6dee36e290c2a3b85dcd7cdba2cab72fe57b25c4.camel%40infradead.org
patch subject: [PATCH] kthread: Teach lockdep about kthread_flush_work() dependencies
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261021/202610211501.YBj5GUfA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610211501.YBj5GUfA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610211501.YBj5GUfA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:45:
   kernel/rcu/tree_exp.h: In function 'sync_rcu_exp_select_cpus_queue_work':
>> include/linux/kthread.h:219:46: warning: unused variable '__work_key' [-Wunused-variable]
     219 |                 static struct lock_class_key __work_key;                \
         |                                              ^~~~~~~~~~
   kernel/rcu/tree_exp.h:470:9: note: in expansion of macro 'kthread_init_work'
     470 |         kthread_init_work(&rnp->rew.rew_work, sync_rcu_exp_select_node_cpus);
         |         ^~~~~~~~~~~~~~~~~
   kernel/rcu/tree_exp.h: In function 'synchronize_rcu_expedited_queue_work':
>> include/linux/kthread.h:219:46: warning: unused variable '__work_key' [-Wunused-variable]
     219 |                 static struct lock_class_key __work_key;                \
         |                                              ^~~~~~~~~~
   kernel/rcu/tree_exp.h:497:9: note: in expansion of macro 'kthread_init_work'
     497 |         kthread_init_work(&rew->rew_work, wait_rcu_exp_gp);
         |         ^~~~~~~~~~~~~~~~~


vim +/__work_key +219 include/linux/kthread.h

   216	
   217	#define kthread_init_work(work, fn)					\
   218		do {								\
 > 219			static struct lock_class_key __work_key;		\
   220			memset((work), 0, sizeof(struct kthread_work));		\
   221			INIT_LIST_HEAD(&(work)->node);				\
   222			(work)->func = (fn);					\
   223			__kthread_init_work_lockdep_map((work), &__work_key);	\
   224		} while (0)
   225	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
