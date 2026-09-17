Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311389475
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620890; cv=none; b=rE2obObLQ7oYKxDV6/FywXd/4+8Q9QX2aEIURbGSOx0WqIdjwoMsihwpv4LmNZAm2LQRvSE4CqEeuqJLG938O2OkJahJXfo7nl3bCRQBvBrpHrwKCg7ilvTq2zQNLb/TS9Ucsi+JraP1FHR2sMWCggCjvD4QcGjwoB8w5ie0SQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620890; c=relaxed/simple;
	bh=lzYrEHBuQrVP49JR12BRoYyX3JgIKo+lxD+ndlTF19g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XHhVRw/S9c/Sik6LD/mCtLmYQ/6BWU4iiXMCnNDd7+065y4TTJMcbsemXiIUcyS82Flg/Ug8SfZ4TRtpRLSTxXwOYoFqDk+OuVVbOb1T3pPey1MD91x2eLIjKcGnrZtYkgEHtXkPXFhe9aO6+2oyJi5tZ0yDPve2nPf8Uii73q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC828OZu; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC828OZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789620888; x=1821156888;
  h=date:from:to:cc:subject:message-id;
  bh=lzYrEHBuQrVP49JR12BRoYyX3JgIKo+lxD+ndlTF19g=;
  b=KC828OZux+J6ynC1+Qr6LROSObjlYevBcOWAV7xy2tYj0dx7Hcrpsazg
   44KpNa95rX5Qsm4ommV7eWxLZWC/xWI9NC5LGzmKgYmHs0xvrESl3DaVO
   RxmAIG1VkVPXivuNWk/cnkyHTPfu8YOB+d8KIsDumCJd+h59AoU0An2yg
   lYs4s8zwAjfGDEA84g/JqGnv1nRRzikg3oRrJ6ykkRWrIjXDdzmCGoi1f
   /lfZvzywz28eG+KCG0UH/lZ/V6HB/pjJpAfAaqJqozH+Oe8r+1fGoTOy8
   +rVo0tMmEwZpC4jpCJjbhaGbr6ThwACf8wmL5i4ues/7u5n9vncOQrv2g
   A==;
X-CSE-ConnectionGUID: J4bOdjI3QAShbdMls57bwg==
X-CSE-MsgGUID: SoBzcz4TRGuMZ9MVsfEulQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="511805"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="511805"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 21:54:46 -0700
X-CSE-ConnectionGUID: hCxJGnB7Qa+Lwnz2MlPEfw==
X-CSE-MsgGUID: QCMxEv+mTMunQ55uaVhWrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267344303"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2026 21:54:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x748v-0000000077b-07mL;
	Thu, 17 Sep 2026 04:54:41 +0000
Date: Thu, 17 Sep 2026 12:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Bradley Morgan <include@grrlz.net>
Subject: kernel/time/posix-cpu-timers.c:1307:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202609171217.MtVzUgWO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: a73d7f98e41a96d6e1bcb0e731ab185d9d67878e posix-cpu-timers: Don't abuse lock_task_sighand() in handle_posix_cpu_timers()
date:   2 months ago
config: x86_64-randconfig-1300-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171217.MtVzUgWO-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171217.MtVzUgWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a73d7f98e41a ("posix-cpu-timers: Don't abuse lock_task_sighand() in handle_posix_cpu_timers()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171217.MtVzUgWO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/posix-cpu-timers.c:1307:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-cpu-timers.c:1307:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-cpu-timers.c:1307:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-cpu-timers.c:1367:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-cpu-timers.c:1367:36: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-cpu-timers.c:1367:36: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-cpu-timers.c: note: in included file:
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:749:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:749:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:749:37: sparse:     got struct spinlock [noderef] __rcu *

vim +1307 kernel/time/posix-cpu-timers.c

  1296	
  1297	static void handle_posix_cpu_timers(struct task_struct *tsk)
  1298	{
  1299		struct k_itimer *timer, *next;
  1300		unsigned long flags, start;
  1301		LIST_HEAD(firing);
  1302	
  1303		/*
  1304		 * tsk is current and ->sighand is stable, see the
  1305		 * tsk->exit_state check in run_posix_cpu_timers()
  1306		 */
> 1307		spin_lock_irqsave(&tsk->sighand->siglock, flags);
  1308	
  1309		do {
  1310			/*
  1311			 * On RT locking sighand lock does not disable interrupts,
  1312			 * so this needs to be careful vs. ticks. Store the current
  1313			 * jiffies value.
  1314			 */
  1315			start = READ_ONCE(jiffies);
  1316			barrier();
  1317	
  1318			/*
  1319			 * Here we take off tsk->signal->cpu_timers[N] and
  1320			 * tsk->cpu_timers[N] all the timers that are firing, and
  1321			 * put them on the firing list.
  1322			 */
  1323			check_thread_timers(tsk, &firing);
  1324	
  1325			check_process_timers(tsk, &firing);
  1326	
  1327			/*
  1328			 * The above timer checks have updated the expiry cache and
  1329			 * because nothing can have queued or modified timers after
  1330			 * sighand lock was taken above it is guaranteed to be
  1331			 * consistent. So the next timer interrupt fastpath check
  1332			 * will find valid data.
  1333			 *
  1334			 * If timer expiry runs in the timer interrupt context then
  1335			 * the loop is not relevant as timers will be directly
  1336			 * expired in interrupt context. The stub function below
  1337			 * returns always true which allows the compiler to
  1338			 * optimize the loop out.
  1339			 *
  1340			 * If timer expiry is deferred to task work context then
  1341			 * the following rules apply:
  1342			 *
  1343			 * - On !RT kernels no tick can have happened on this CPU
  1344			 *   after sighand lock was acquired because interrupts are
  1345			 *   disabled. So reenabling task work before dropping
  1346			 *   sighand lock and reenabling interrupts is race free.
  1347			 *
  1348			 * - On RT kernels ticks might have happened but the tick
  1349			 *   work ignored posix CPU timer handling because the
  1350			 *   CPUTIMERS_WORK_SCHEDULED bit is set. Reenabling work
  1351			 *   must be done very carefully including a check whether
  1352			 *   ticks have happened since the start of the timer
  1353			 *   expiry checks. posix_cpu_timers_enable_work() takes
  1354			 *   care of that and eventually lets the expiry checks
  1355			 *   run again.
  1356			 */
  1357		} while (!posix_cpu_timers_enable_work(tsk, start));
  1358	
  1359		/*
  1360		 * We must release sighand lock before taking any timer's lock.
  1361		 * There is a potential race with timer deletion here, as the
  1362		 * siglock now protects our private firing list.  We have set
  1363		 * the firing flag in each timer, so that a deletion attempt
  1364		 * that gets the timer lock before we do will give it up and
  1365		 * spin until we've taken care of that timer below.
  1366		 */
  1367		spin_unlock_irqrestore(&tsk->sighand->siglock, flags);
  1368	
  1369		/*
  1370		 * Now that all the timers on our list have the firing flag,
  1371		 * no one will touch their list entries but us.  We'll take
  1372		 * each timer's lock before clearing its firing flag, so no
  1373		 * timer call will interfere.
  1374		 */
  1375		list_for_each_entry_safe(timer, next, &firing, it.cpu.elist) {
  1376			bool cpu_firing;
  1377	
  1378			/*
  1379			 * spin_lock() is sufficient here even independent of the
  1380			 * expiry context. If expiry happens in hard interrupt
  1381			 * context it's obvious. For task work context it's safe
  1382			 * because all other operations on timer::it_lock happen in
  1383			 * task context (syscall or exit).
  1384			 */
  1385			spin_lock(&timer->it_lock);
  1386			list_del_init(&timer->it.cpu.elist);
  1387			cpu_firing = timer->it.cpu.firing;
  1388			timer->it.cpu.firing = false;
  1389			/*
  1390			 * If the firing flag is cleared then this raced with a
  1391			 * timer rearm/delete operation. So don't generate an
  1392			 * event.
  1393			 */
  1394			if (likely(cpu_firing))
  1395				cpu_timer_fire(timer);
  1396			/* See posix_cpu_timer_wait_running() */
  1397			rcu_assign_pointer(timer->it.cpu.handling, NULL);
  1398			spin_unlock(&timer->it_lock);
  1399		}
  1400	}
  1401	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
