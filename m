Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254523C4167
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862056; cv=none; b=V8u3Ary8GdeSD4AGWM+aGsACI+sM3ZO+GXpxO3JcIaOBsxaAiIQDO03tFX7heHuK5mHjOL5ljiwQVQQT/JT5/qlKj+EdHGKNj4bX4YABM8oDEnJpB1iAdY4GmbFhkI/DCVL2RTzRGb7yOh7mQkwNfA5NENc+ZzmFSh9lwVgm3+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862056; c=relaxed/simple;
	bh=cga5org1q/q/bKI3rNh8W1nENCJtKS9JxjUZKRGwvZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PYlhqu/efmzIcFPGrKYCKIX6zWEVm3RfesdUdwQC4/ZndzlhNoehj3Ac806QdSdgxsThlZ05/gE0KJQT3po0ka495UF7m0Z6UPqIXUFsRxf7MeW+NcDIgjUjNKQlbmY8YkJwddIZutkXRmGfvfVQ+HUe+ny7JrsCMgPHvDHRQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=j7fqMIi0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="j7fqMIi0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1DC8497;
	Thu,  1 Oct 2026 06:40:49 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE2523F86F;
	Thu,  1 Oct 2026 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862053; bh=cga5org1q/q/bKI3rNh8W1nENCJtKS9JxjUZKRGwvZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=j7fqMIi012Nvq5XjZD+8SJ8tdPJiz5FYbgsY2BvhEEXkzP1unbFbZEwqy44kRuH+d
	 M91qRGdKfW0FvzsysZrOuMhxRRxCw9uKc8Vi2T2+0GaMaipVLZ3+CPh2f9EgJM3UxB
	 NkZsIp5PBKn70CFj5EXHj6s4Qz/B0VhcMyrMo6ls=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	elif.topuz@arm.com,
	sh@gentwo.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH v2 0/5] sched/eevdf: Keep slice protection boundaries consistent
Date: Thu,  1 Oct 2026 14:40:11 +0100
Message-Id: <20261001134016.3881268-1-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EEVDF slice protection is an absolute virtual-runtime boundary. Several
paths currently treat that boundary inconsistently with the task's current
slice, or with the timer that makes the scheduler reconsider current.

Patch 1 makes fair HRTICK expire at live protection rather than only at the
later virtual deadline. Patch 2 consolidates the fresh and update
protection calculations. The remaining patches cap protection after a
slice change, prevent reweighting from reviving expired protection, and
update protection when sched_setattr() restores the running task.

All workloads below pin every task to CPU1, use SCHED_OTHER, and keep the
controller on another physical core. rt-app's dl-runtime values are in us;
sched_getattr() verified the resulting sched_runtime values. The tests
enable PREEMPT_SHORT, RUN_TO_PARITY and PLACE_REL_DEADLINE, and run with
both HRTICK and NO_HRTICK (except for patch 1).

The HRTICK/deadline mismatch in patch 1 is exposed by two continuously
runnable equal-weight tasks:

  "short": { "cpus": [1], "loop": -1,
             "dl-runtime": 100,  "run": 1000000 },
  "long":  { "cpus": [1], "loop": -1,
             "dl-runtime": 1000, "run": 1000000 }

On the HZ=250 control, the short task's median sched_switch run interval is
1005 us even with HRTICK enabled. With patch 1 it is 101 us. Both tasks
retain approximately half of the CPU in either case. (The error is therefore
the reconsideration time rather than CPU share.)

With RUN_TO_PARITY disabled, vprot instead marks current's minimum progress
quantum. HRTICK must reconsider current at that boundary as well. After an
expired-protection repick it falls back to the deadline without renewing
the quantum.

The oversized fresh protection in patch 3 is exposed by retaining a 100 ms
relative deadline while reducing the request to 100 us:

  "shrink": {
    "cpus": [1], "loop": -1, "dl-runtime": 100000,
    "delay": 700000,
    "phases": {
      "warmup": { "loop": 1,  "dl-runtime": 100000, "run": 20000 },
      "hold":   { "loop": -1, "dl-runtime": 100,    "run": 1000 }
    }
  },
  "peer": { "cpus": [1], "loop": -1,
            "dl-runtime": 1000, "run": 10000 }

After the change, inspect the next fresh SNT_PICK of shrink. The control
grants between 13 and 28 ms of protection to the 100 us task because its
own slice is the runqueue minimum. Patch 3 caps that fresh boundary to the
current request. In the trace-free companion test, the control's complete
post-change run intervals reached 69--83 ms with HRTICK enabled; the
isolated fix reduced the maximum to 3--4 ms. Wall time includes interrupts
and legitimate repicks, so the vprot observation is the correctness
criterion.

The expired-protection reweighting bug in patch 4 is exposed by three
continuously runnable tasks in separate cgroup-v2 CPU groups:

  group a, weight 10000:
    "long":  { "cpus": [1], "loop": -1,
               "dl-runtime": 100000, "run": 10000 }
  group b, weight 100:
    "short": { "cpus": [1], "loop": -1,
               "dl-runtime": 100, "run": 10000 }
  group c, weight 100:
    "mid":   { "cpus": [1], "loop": -1,
               "dl-runtime": 1000, "run": 10000 }

While rt-app runs, change group a's cpu.weight every 400 ms through:

  10000, 1, 100, 1, 10000, 100, 1, 10000

On the control this produced 32 expired-to-live vprot transitions in 16
captures and seven selections of current over a runnable, eligible peer
with an earlier deadline. With patch 4, 181 captures containing 441920
queued current weight changes produced no revival and no such wrong
selection.

Kayra Cizmeci reported the same invariant failure when
sched_change_begin() temporarily dequeues current. This rt-app phase loop
makes the weight change after running beyond a 100 us request:

  "change": {
    "cpus": [1], "loop": -1, "priority": -10, "dl-runtime": 100,
    "phases": {
      "heavy": { "loop": 1, "priority": -10,
                 "dl-runtime": 100, "run": 117 },
      "light": { "loop": 1, "priority": 10,
                 "dl-runtime": 100, "run": 173 }
    }
  },
  "peer": { "cpus": [1], "loop": -1,
            "dl-runtime": 1000, "run": 10000 }

The diagnostic trace records vprot <= vruntime at __setparam_fair() entry
and checks that the following SNT_NORMAL restore does not make vprot live
again.

The restore bug in patch 5 is exposed at the phase boundary itself. Use a
long-slice peer so the task being changed owns the minimum after the
change:

  "change": {
    "cpus": [1], "loop": -1, "dl-runtime": 100000,
    "delay": 700000,
    "phases": {
      "warmup": { "loop": 1,  "dl-runtime": 100000, "run": 20000 },
      "hold":   { "loop": -1, "dl-runtime": 100,    "run": 1000 }
    }
  },
  "peer": { "cpus": [1], "loop": -1,
            "dl-runtime": 100000, "run": 10000 }

---
Changes since v1:
- Expand the standalone HRTICK fix into a series covering related
  protection-boundary inconsistencies found during testing.
- Share the fresh and update protection calculation.
- Fix protection after slice changes, reweighting and SNT_NORMAL restores.
- Request lazy rescheduling when an SNT_NORMAL update expires protection.
- Add HZ=250/HZ=1000 and HRTICK/NO_HRTICK regression testing.

Link: https://lore.kernel.org/r/20260929194711.2689811-1-christian.loehle@arm.com/

Christian Loehle (5):
  sched/fair: Take slice protection into account when arming HRTICK
  sched/eevdf: Share the slice protection calculation
  sched/eevdf: Cap protection when current has the shortest slice
  sched/eevdf: Keep expired protection expired across reweighting
  sched/eevdf: Update protection after restoring current

 kernel/sched/fair.c | 72 +++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 28 deletions(-)


base-commit: 01d1f30564aac8d53c4ba2de2bfc81fcef206721
-- 
2.34.1
