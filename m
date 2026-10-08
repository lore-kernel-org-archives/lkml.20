Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194642F1FF4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499665; cv=none; b=lGM9YoDpkMajnhY+0xjYgkuCILFPm/fuTtT2+nODtwHs6mmURxPW9o0554DAcTeqNQpA3WSqujVTwZEpdY3cFwaCoc/QyaucwWAL/segO4d+hbDTw8minuu16EHBqEReO35myKXQR8r2XENByGd3GItJ3bD8g9TrHmNOUtJy21g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499665; c=relaxed/simple;
	bh=Pku5Ac1DXWlNJhdy6w9IT+HgRz9qatrx4E0StzmJG8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T8egPN8x4/uSkNzIo81MavBuiCN+EsWyTb8l9XyQ9cSaUlXHlQYyAqJ1sIRcv5sGBEyyRldrMKYk4pBdZG2NNg28oqGigl5bA3PH1IowGPV1UZ6cy87O/I2HR5qXl41cp6SHQX0PLmKIWhqGYufXFgHXutd0c4u93GtUqndOz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=PpRCzJVq; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="PpRCzJVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1791498158;
	bh=Pku5Ac1DXWlNJhdy6w9IT+HgRz9qatrx4E0StzmJG8M=;
	h=From:Date:Subject:To:Cc:From;
	b=PpRCzJVqOtAjGAukWI+haEMuK5+G7yT58HHNYTS/CMTB7ZGgoZo1KDYSCkpV0xXXq
	 9gdixHLDQ0GdsbeVpWa4wzz+DPv7AbSy/4vsh+3H29FNhkumCpBe2Ew7F7KwlHFC9T
	 CH05D5Jhee4eiFRQJyashVZRUV4xF5Oye5UC+wyM=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 9F4B240577;
	Thu, 08 Oct 2026 15:22:37 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Thu, 08 Oct 2026 15:22:37 -0700
Subject: [PATCH v5] sched/fair: Preserve wake-affine CPU for non-SMT
 reciprocal sync wakeups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-sched-sync-wakeup-v5-1-1af9fab48965@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAKwXyGoC/4XNzarCMBCG4VuRrM0hM5n+ufI+5CyaZNIGoS2JV
 kV67ye6OYoUl+8H88xdJI6Bk9ht7iLyHFIYhxzFdiNs3w4dy+ByC1RYqgpBGpLJ9uxkug1WXto
 jnyepyJGyhg24VuTTKbIP1yd7+M3dh3Qa4+35ZYbH+gWcQYJ0tiEPNTFWft/xcLqMP2PsxEOc8
 VXBFQWz4gFKKkplkMyHol+VakXRWWmU9VSDM64uPhT6V2qlVxTKSoFaa5MpUzVvyrIsf+WoI7e
 LAQAA
X-Change-ID: 20260721-b4-sched-sync-wakeup-04d40cbeb1da
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 linux-kernel@vger.kernel.org, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791498157; l=5499;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=Pku5Ac1DXWlNJhdy6w9IT+HgRz9qatrx4E0StzmJG8M=;
 b=8vnhliyeKMfSA9qfr5gQYimzz7qKphyXEFsECzalkL17hHZVXq1VU8+ke1L8NfINlsrI1VkRJ
 xrJmVn13wZcAxTLFadfPnlJfwy0ZwEGabXgF+k/StO7E598bKKdWTQe
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

For WF_SYNC wakeups, wake_affine() may select the waker CPU, but the CFS
wakeup path still passes that target to select_idle_sibling(). The idle
CPU search can then move the wakee away from the wake-affine target.

Pipe-style ping-pong workloads expose this because the wakee is handed
back and forth between two tasks. In that case, moving the wakee to
another idle CPU can cost more than preserving the wake-affine waker CPU.

Use the existing last_wakee and wake_wide() state to identify narrow
reciprocal WF_SYNC wakeups:

  A wakes B
  B wakes A
  A wakes B
  ...

Handle only this narrow reciprocal case on non-SMT systems. Once the
wake-affine path has selected or kept the waker CPU, preserve that target
when the waker rq has no other runnable task. Return the waker CPU
before select_idle_sibling() so the idle CPU search does not move this
handoff away from the wake-affine target.

This does not define a generic WF_SYNC placement rule. Generic WF_SYNC
wakeups continue through the existing wake_affine() and
select_idle_sibling() behavior. SMT systems also continue through
select_idle_sibling(), where idle sibling/core placement can be handled
with SMT topology visible.

On asymmetric-capacity systems, still require the wakee to fit on the
waker CPU.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Testing was performed on an 80-core non-SMT Ampere Altra system.

  perf bench sched pipe -l 1000000, 30 runs:

  default:
    3.651 -> 2.204 usec/op mean,   about 39.6% improvement
    3.733 -> 2.200 usec/op median, about 41.1% improvement

  taskset -c 78,79:
    3.820 -> 2.691 usec/op mean,   about 29.6% improvement
    3.887 -> 2.444 usec/op median, about 37.1% improvement

  taskset -c 79:
    2.292 -> 2.113 usec/op mean,   about 7.8% improvement
    2.290 -> 2.112 usec/op median, about 7.8% improvement

Baseline: tip/sched/core at 4a3b51aab6e2

Schbench normal mode at 8/40/80/240 workers and pipe mode at
1/2/4/8 workers showed no material regression over three 15s
runs. Additional pipe mode confirmation at one and two workers used
ten 30s runs; worker transfer medians changed by -0.3% and -2.4%,
respectively, with no material wakeup-latency regression.

Hackbench process and thread pipe cases at 1/2/4/8 groups were also
exercised on both kernels. These short runs were not included in the
performance comparison.
---
Changes in v5:
  - Rebased on current upstream mainline.
  - Refresh perf bench sched pipe results on the rebased kernel.
  - WF_SYNC semantics are now documented as advisory; no placement
    contract or generic WF_SYNC policy is introduced.

Link to v4: https://lore.kernel.org/r/20260803-b4-sched-sync-wakeup-v4-1-52333b0cfb79@gentwo.org

Changes in v4:
  - Preserve the waker CPU only after the wake-affine path selected or
    kept it.
  - Clarify that WF_SYNC remains a hint, not a generic placement rule.
  - Leave SMT systems on the existing select_idle_sibling() path.
  - Refresh testing on tip:sched/core.

Link to v3: https://lore.kernel.org/r/20260727-b4-sched-sync-wakeup-v3-1-90cf481dbd85@gentwo.org

Changes in v3:
  - Limit the direct waker-CPU preference to !sched_smt_active(); SMT
    systems continue through the existing wake_affine() and
    select_idle_sibling() path.
  - Drop the redundant affinity check; want_affine already verifies the
    waker CPU is allowed.
  - Use a plain p->last_wakee read instead of READ_ONCE().
  - Rebase and refresh testing on v7.2-rc5.

Link to v2: https://lore.kernel.org/r/20260722-b4-sched-sync-wakeup-v2-1-f1164560b24b@gentwo.org

Changes in v2:
  - Move the reciprocal handoff preference under the existing
    SD_WAKE_AFFINE domain check.
  - Drop futex from the changelog motivation.
  - Refresh perf bench sched pipe results after rebasing.

Link to v1: https://lore.kernel.org/r/20260721-b4-sched-sync-wakeup-v1-1-dc94f184e27f@gentwo.org
---
 kernel/sched/fair.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4fa66f4cba2cbb53d4e322134504e..ce624fdc1f4480bc6e7ae710950fcaa93ab32a3e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9167,6 +9167,26 @@ static inline bool asym_fits_cpu(unsigned long util,
 	return true;
 }
 
+/*
+ * For reciprocal WF_SYNC handoffs, prefer the waker CPU when it has no
+ * other runnable task.
+ */
+static bool prefer_sync_pair_cpu(struct task_struct *p, int cpu)
+{
+	struct rq *rq = cpu_rq(cpu);
+
+	if ((rq->nr_running - cfs_h_nr_delayed(rq)) != 1)
+		return false;
+
+	if (sched_asym_cpucap_active()) {
+		sync_entity_load_avg(&p->se);
+		if (!task_fits_cpu(p, cpu))
+			return false;
+	}
+
+	return true;
+}
+
 /*
  * Try and locate an idle core/thread in the LLC cache domain.
  */
@@ -9955,6 +9975,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 			if (cpu != prev_cpu)
 				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
 
+			if (sync && !sched_smt_active() &&
+			    new_cpu == cpu &&
+			    p->last_wakee == current &&
+			    prefer_sync_pair_cpu(p, cpu))
+				return cpu;
+
 			sd = NULL; /* Prefer wake_affine over balance flags */
 			break;
 		}

---
base-commit: 69f80fef3153299d9c72c53d1d71eef6354b6926
change-id: 20260721-b4-sched-sync-wakeup-04d40cbeb1da

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

