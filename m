Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48D420ED
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788307441; cv=none; b=DcKrHNOFXiVhUxV+tOa2ZSW3AEZex48Q+YsmB9ZGvNhki+6/2Cm+4eHQIVQnY4MU98lS1bgzxXusrIwyzTuQm8TeCxUcm6O+jEPpe2ArMGAgP9I6fWWJ6JRn1pkhdYrOJoKQIe8py9n7AK57mJSLGAifz2eTUXKs4IJhIjN0hxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788307441; c=relaxed/simple;
	bh=Hd8A6gB5lahNUpw/WDMdphG7dWhWn6ip3TPO4ByWZ/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qsXuZUEYHOX0WtrJY9h5Tl6/a7rw/3gXfqqD+I7J2a758kHn7QjnNsUNuk/cJg4NbD34NhXpbsdjHEClcoqzn8O3UOFgRurw1UWZSjN9zt844zTbxgdtZ8VPBJAqwqC7r8t/Lf9jgKtmxIcXbf0D29R43mpNxin+A2vqIhaMgjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnHnTPCq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnHnTPCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788307439; x=1819843439;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hd8A6gB5lahNUpw/WDMdphG7dWhWn6ip3TPO4ByWZ/c=;
  b=YnHnTPCq+/cWRYJTHZU8QMn+jMmW7ub7QnIT/38/Z4fEP4D+/i/DEvYA
   wJx+bYK2zJYxntdNgdEI3n3qmwcforZXvhWP/E+aTqYFrBPyDmv+l1sJ7
   5xXH+fdkChkLWgRor18cxzcQfCL1tjD7uS+i8gpW38EKbqyevbykyClCb
   g6tOW6Kundp8AYMpKmivDDlyYt4nCMxSZRTD8ZFDKrxZDXbhwIwVxtuyk
   TcxTpNaB0CfXUsEf4zqRX7a16uM45St+jC3zT00fH6c+GQ3xDPy8KjSKV
   Cy1/tWLefiEexPqu7/zrskVcVXfEvD57i1Qvicb4LbZGub/1VUrGbQWuf
   g==;
X-CSE-ConnectionGUID: PE39tHQjTAOhN0tnyHJOgA==
X-CSE-MsgGUID: wbmTyeXLQAaR2TUSnqCq0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106272945"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="106272945"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 17:03:57 -0700
X-CSE-ConnectionGUID: A891lACmSr6vX68K/xTIaQ==
X-CSE-MsgGUID: Jo8/543/RG+x0y6iJGIbUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="265531779"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2026 17:03:31 -0700
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Qais Yousef <qyousef@layalina.io>,
	Aaron Lu <ziqianlu@bytedance.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Vineeth Remanan Pillai <vineethr@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	"chen . yu @ linux . dev" <chen.yu@linux.dev>
Subject: [PATCH 0/2] sched/cache: Fix use after free mm access in account_mm_sched()
Date: Tue,  1 Sep 2026 17:08:54 -0700
Message-Id: <cover.1788305725.git.tim.c.chen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hyunwoo Kim reported a KASAN use-after-free in account_mm_sched():

  https://lore.kernel.org/lkml/apPb-Dr4nPYuHQOK@v4bel/

Cache-aware scheduling keeps its per-address-space statistics inside the
mm:

        struct mm_struct {
                ...
                struct sched_cache_stat sc_stat;
        };

so their lifetime is the mm's lifetime.  mm_alloc_sched() allocates
sc_stat.pcpu_sched from mm_init(), and mm_destroy_sched() frees it from
__mmdrop().

The scheduler, though, reaches that object from contexts that hold no
reference on the mm:

  - account_mm_sched() runs from update_curr() holding only the rq lock,
    and dereferences rq->curr->mm.

  - the load-balance predicates - can_migrate_llc_task() ->
    invalid_llc_nr() / exceed_llc_capacity() - and the task_cache_work()
    LLC occupancy scan read p->mm of *remote* tasks.

Nothing on those paths keeps the mm alive, so an exit, or an exec_mmap()
installing a new mm, can free pcpu_sched underneath a concurrent reader.

Serializing the two sides - taking the rq lock in the mm teardown path -
would put a scheduler lock in the middle of __mmdrop(), which is a lot
of coupling to pay for a statistics object.  Give the object its own
lifetime instead.

Patch 1 lifts sched_cache_stat out of mm_struct, renames it
sched_cache_group, and turns it into a refcounted object freed via
call_rcu(); the mm now merely points at it.

Patch 2 gives every task its own reference in
task_struct->sched_cache_grp - taken in copy_mm() and exec_mmap(),
dropped in exit_mm() - and converts the scheduler to read
p->sched_cache_grp rather than p->mm->sc_stat.  Readers access
the sched_cache_grp without worry that it was freed as it
has a ref count on the object.

The two patches are one fix.  Patch 1 does not stand alone, so they need
to be applied, and backported, as a pair.

A welcome side effect of the decoupling is that the group is no longer
welded to an address space, so a later series can key it on a cgroup, a
core-scheduling cookie or a numa_group instead of on a single mm.

These are the first two patches of the cache-aware prctl RFC series

  https://lore.kernel.org/lkml/cover.1787955777.git.tim.c.chen@linux.intel.com/

reposted on their own with the changelogs rewritten and minor updates around the
use-after-free, so that they can be considered ahead of the rest of that
series.  Hyunwoo confirmed the splat is gone; his Tested-by is on both
patches.

Tim

---

Tim Chen (2):
  sched/cache: Decouple sched_cache_group from mm
  sched/cache: Introduce task_struct->sched_cache_grp

 fs/exec.c                    |  14 +++
 include/linux/mm_types.h     |  15 +--
 include/linux/sched.h        |  11 +-
 kernel/exit.c                |  28 ++++--
 kernel/fork.c                |  23 +++++
 kernel/sched/build_utility.c |   4 +
 kernel/sched/cache_sched.c   |  39 ++++++++
 kernel/sched/fair.c          | 188 ++++++++++++++++++++++-------------
 kernel/sched/sched.h         |   3 +
 9 files changed, 239 insertions(+), 86 deletions(-)
 create mode 100644 kernel/sched/cache_sched.c

-- 
2.32.0

