Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489062;
	b=VmDADmcvrWF2PA4Sy0RqwEmNpHJ8NDsma8uFz3tU+iCyhm+loiH6UrPCVX3C5GZHTcRw
	 ItMqcZcHkrHbQKsa9T7rNjHTEL1TYb10a3EB+ENL8dxjhCt1iV/74Xgszx14IJJYw30/h
	 /hHZJyHQ0Fr6Ref4ABPy1f+n/DO4kcq3koz6Qq19g/Gci80wk55ZJrIIv0YCtY6/CucPh
	 3LMgTZrhpScWQoX9//h58oi5XMZUVQlUOsvWg47WM/w9VjRyAfiH+/xyd7K6opBZmZWFJ
	 Mv9X8v06qA6BBRBL2ZbtbodtOet38md3CzqnZWOwtvAw8UXJfnZaF55GPxFU3S+wOtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489062;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BW+evLCwYzgT0GOJ7iXT+1380LgSCWUXaHPzAnO9hFo=;
	b=vg12BFvGgDzqByXOaS2NRaSJZpvDOKmkrPeU1PgiB4Ciwds8zqgxHIuRpQYi22UJ+UUz
	 pFeSGGGeIP7joabrDr03V86tcN9Epa6Gl/m4NEuylVHpJ0+yBasjCkH9Mc9o5ygDyJf+e
	 sSeGm7Isn950byzFjPyN1RSvWmfpB+JB33LiUvp/7zGYFhn+kOVhtrNj4eGkFi0gLGtGQ
	 2pllN6PdSfRRMX4y82Dq3OHDKohuekjqVVpFxLED3V1YNKkZDqOLkomDwHFBluhnRvlve
	 Y6wD5lxO+q9C2ykK/vQfv1kz3+5OobL+jRBmpPFEyeLtOiTdIq/Qj+UYFPWAzT/6+pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qBQLcaX+;
	arc=none smtp.remote-ip=91.218.175.234
Received: from mta0.migadu.com (out-234.mta0.migadu.com [91.218.175.234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B20606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B20606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qBQLcaX+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W34IEyxXNHmafjPVCQKPdoBcem/laKBLdON5EZxe8XQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794489059; v=1; x=1795093859;
 b=qBQLcaX+Me9W57ltaRTAIhnjpIRKP+PymHektNYZ4RwLctL4Q2fAArBiRRHG3fZVjj1KXlbU
 kfVL4iOWVueCM0CJ161yJrLgKWMwQLLmXGymHBgkHkmETGRyHW1lMNJdF6NplUYjDUfxAKVbb7C
 msg8OQMVcRDPbRISi1LDi7kg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a55b6c2c48a7caae;
	Thu, 12 Nov 2026 13:10:59 +0000
X-Mizu-Trace-ID: a55b6c2c48a7caae
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	liwanwu@kylinos.cn,
	usama.arif@linux.dev,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 6/6] sched_ext: Clear the built-in idle masks on CPU hotplug transitions
Date: Thu, 12 Nov 2026 21:09:34 +0800
Message-ID: <20261112130934.563321-7-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112130934.563321-1-cui.tao@linux.dev>
References: <20261112130934.563321-1-cui.tao@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

The built-in idle masks are only maintained by __scx_update_idle()
(task driven idle transitions) and reset_idle_masks() (ops load);
nothing clears them when a CPU is hotplugged. If a CPU goes offline
while idle, its bit stays set for the whole offline window:
scx_bpf_pick_idle_cpu() and the other idle kfuncs keep reporting the
offline CPU as an idle candidate, and the built-in select_cpu path may
claim it once before the guard layers bounce the wakeup, costing a
failed pick and a bumped SCX_EV_SELECT_CPU_FALLBACK each time. This is
not the documented racy and self-correcting regime of the idle SMT
handling: the stale bit is a deterministic leftover, and read-only
kfunc consumers never trigger the claim-time self-correction.

handle_hotplug() now drops the CPU from the built-in idle masks on
both transitions like it already does for the cid-form online_cmask.
scx_idle_test_and_clear_cpu() is also gated on cpu_online(): the clear
alone is not sufficient, because a dying CPU keeps re-picking its idle
task until it halts and each re-pick re-sets its bit, which can happen
after the hotplug paths have already run. The claim path is the one
choke point every idle consumer goes through, so an offline CPU is
never handed out as an idle candidate regardless of any stale bits.

Verified in qemu (4 cpus) with an idle-probe scheduler probing
scx_bpf_pick_idle_cpu() every dispatch: 15/15 offline/online cycles
probe zero stale entries with the change. Stock is not A/B-comparable,
as every hotplug transition restarts the scheduler and reinitializes
the masks; the fix rests on the path above.

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/sched/ext/ext.c  |  7 +++++++
 kernel/sched/ext/idle.c | 21 +++++++++++++++++++++
 kernel/sched/ext/idle.h |  1 +
 3 files changed, 29 insertions(+)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 792cf0c1d582..a9612d768986 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -4356,6 +4356,13 @@ static void handle_hotplug(struct rq *rq, bool online)
 	if (scx_enabled())
 		scx_idle_update_selcpu_topology(&sch->ops);
 
+	/*
+	 * Keep the built-in idle masks in sync with the hotplug state: an
+	 * offline CPU must stop being advertised as idle and a CPU coming
+	 * back must not inherit a stale idle bit.
+	 */
+	scx_idle_clear_cpu(cpu);
+
 	/*
 	 * The tables can't be retired while this function is running as the
 	 * retirement is inside cpus_read_lock. However, scx_cpu_arg() is
diff --git a/kernel/sched/ext/idle.c b/kernel/sched/ext/idle.c
index 922fbc3065cc..ff0c5402886e 100644
--- a/kernel/sched/ext/idle.c
+++ b/kernel/sched/ext/idle.c
@@ -107,6 +107,18 @@ static bool scx_idle_test_and_clear_cpu(int cpu)
 			__cpumask_clear_cpu(cpu, idle_smts);
 	}
 
+	/*
+	 * An offline CPU is never an idle candidate, but its bit can
+	 * linger past @cpu going offline: the dying CPU keeps re-picking
+	 * its idle task until it halts, which can happen after the
+	 * hotplug paths have already run. Drop the stale bit and refuse
+	 * the claim.
+	 */
+	if (unlikely(!cpu_online(cpu))) {
+		cpumask_clear_cpu(cpu, idle_cpus);
+		return false;
+	}
+
 	return cpumask_test_and_clear_cpu(cpu, idle_cpus);
 }
 
@@ -743,6 +755,15 @@ static void update_builtin_idle(int cpu, bool idle)
 	}
 }
 
+/*
+ * Drop @cpu from the built-in idle masks; used on hotplug transitions
+ * so an offline CPU stops being advertised as idle.
+ */
+void scx_idle_clear_cpu(s32 cpu)
+{
+	update_builtin_idle(cpu, false);
+}
+
 /*
  * Notify schedulers of an idle transition on @cpu's cid, delivering to every
  * sched that holds %SCX_CAP_BASE on the cid (the root holds every cap). A real
diff --git a/kernel/sched/ext/idle.h b/kernel/sched/ext/idle.h
index 87a0e58f1eb7..89180abbfd21 100644
--- a/kernel/sched/ext/idle.h
+++ b/kernel/sched/ext/idle.h
@@ -21,6 +21,7 @@ extern struct btf_id_set8 scx_kfunc_ids_select_cpu;
 
 void scx_idle_update_selcpu_topology(struct sched_ext_ops *ops);
 void scx_idle_init_masks(void);
+void scx_idle_clear_cpu(s32 cpu);
 
 s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 		       const struct cpumask *cpus_allowed, u64 flags);
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
