Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159100;
	b=SBc4VrHVyxJbyX4YVvre+mHUAzJMPe918pp/9n8kUYOo80qw8X0eIOfW8lzQykhiWkcU
	 xea928MMLbgefSKNXBRau8pNnwGq3wFXI5xmf+FGyuJ37ZxDZB3UGej1kaBoyPK3eU6Q5
	 ViQblQtV/vkuaUTLzMfCWkz6T74gErRvw9Q/1gp+/W4wX9kIbE//8hPU8PGLEkINpa7Mk
	 mEwsT5sMgsuLG+JlHyGyYqwlW1RDgHiryhxVcfBszCBiDcn/bVFGCGeDKe+VRtOzVKmI8
	 Gc+NECY5GDhl4+uA8/tuqyhgahHDY9MFxk/iyYs2+zbYQ3LtTVMQ4/f0kqTcdFtnZzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k+xK/w7aCVwQprlABhmhOUHTvUMPNGr8ujEJYPDg5jI=;
	b=Hiy98TUd64yHVnVLQ9/AYou2VovA09pzLfTIdLCWIZ60DvYeSaxRIsCaNJR+3yC2ii/i
	 U/BhHVIf+Qk6ae0rh2VTsgR+9VMPAwcHJFPpkKa5+1ds7LsiLiOReK3IKtKqHF8rSMdp9
	 D0aqi9+os0/ce27axbbAy8bpc7u7EYEOMs0FnPriA90rf4GBzqd1bxaLwocTA6mZaUDGj
	 8HctE4BlBtNuBqoDOsDkmuUDXE1nvKZB9xtX1kSwgO0spolHraqvxl/C6Ti/wykASNygJ
	 zO0R8jUqnSjQswbAsQvsU9luW6F1D0cvDnBAyHeKb8GKLMJeeCavcMpgpsBuREv+NTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDFUJsm9;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDFUJsm9
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e613f813b0so1401825ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159099; x=1793763899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k+xK/w7aCVwQprlABhmhOUHTvUMPNGr8ujEJYPDg5jI=;
        b=fDFUJsm9sTh2tgCVt5IQT7H35HgdS1Zq8ejvqSV4j1olQ00FECulMSBCPtx9AIqnSW
         Je7NisXGuP/FAN9r7yxyv3wN7yvc9p5mOcnCyZF3FGM5F4I9xstDpxG4LbWGfkMdgLyl
         OcEU1XlVIpgFrFdgoatXx98ss70zISfh6uV22BPcnv5uozNBufgnmmZmnuVR3OGCwirQ
         gGHAd/DkJs7qGrKki6VlAa6SKhtRLYI6wxDC5UZp34Dtwz2KrpJGOFzsXAhkzHBpPZeQ
         5pqSB5zj2KiatGD60mAaVjKsHMe+hVavxsreWugiQYzYn1XLZKvrU5iYtX5KTW+yynrW
         cTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159099; x=1793763899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+xK/w7aCVwQprlABhmhOUHTvUMPNGr8ujEJYPDg5jI=;
        b=sdtBZcl0Dx1K8X5RMVU7F6Exo14TQ0UQe/9qBZUp4xtjSgUWftOFuYPnIXndie9Gkp
         rUAhioPQ0HsOnYpbuaoHYIO8TMWZkm/RnvLvWs2XVaJohVDAJj4Tk/1CfJqTYcG8+3r/
         IscZlujP/fBj6Xkv6hHzgPEgamYUv8OYblIJX0sD2f1D/XWc1of2MYBNetIAAYJxbDfO
         CSsOm9U4uaZsSjrqxqx5uW+k8YzOazKMJgQTCBnMcK17ktQ3j2DzzVVG11SivjweDWbV
         Fznnqqo0N2aK6kWs24sVeKXbCnDo97yoPciLWLyS5K3x+mL7j7rbukVGagNzcnZ3+weM
         OQoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8WVsvjz2044aYG2OBnovZtx/2zzdSAg1354rB1udTtRU2C1dakq+APBU+N6TWvU0GxbZ3cni8TG0gB1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn7jLYGlF9WHFEx+YN2H3/uv08zlrIJez/UfBhq3Sk67ON3wOr
	VAkRjV/Z7ZT1zTo1Zg8Xp7+1mwM1/BYnWZqGYDSUQoguj52NhqFjqB3M
X-Gm-Gg: AYBFou3VZGw0bT86iet3AdqkDV/7jw4V0y213rXlAWkXXhm517KtaiIGMpJlh17rqWI
	HCM4fm35Fc/mGAVtyL/QooCT5+TPwzBI7IDxFOafgkeFxwmyAwu26Rc9RFACkYF8R77Cf0G6iDd
	VHUOQn6TSiOneOsQdiIwt+yqiKv3Sr+XFngEJ24hqC7SE1Xv0reo/iBSTRvWSkml2UFjUEzTwKp
	NsWAjKh/k6CyTPhZx4sjNly8dA7NjpWlnIePQ3o0knCz7u2TE7aLl6h2ptkDFXKUEQvaSFU0u3B
	GQxkniWUBrJe0LO7uKfYfpu8y5XxTqLiXyVlYsZzY9qaCLRNEwJMn+ZPTrJsAgP9jpP08nlY84L
	Z4MYxcn//6WpoCsR5HyiKuSixCSKQgDKqHlRt0BcHEgBHnvQifbVKwyyNe3zgby9LhmJ52oIWEx
	krNSC3GxYrq/dMOdIW00oLJGLW0Z14czfbO9KPMZbuvd708USctk1FNB5LuwoIJaVIcbHGhB+/w
	B1DmIaZ7CVWIQMPP+07Ycp5LFLs5NUzKb4t7xJYtpJoacYKnYvwlIUMMG0YiGVBcBhG+TZbpDb/
	313ptk/UpQXXgafzSMrb4M9wpWAO3Bri3r7f6GxqfHfKQHuVifDvPfGn
X-Received: by 2002:a17:90b:2ec7:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3ae5c6c4568mr198110a91.7.1793159099300;
        Tue, 27 Oct 2026 20:44:59 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a4a9264sm879884a91.0.2026.10.27.20.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:44:58 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Davi Chaves Azevedo <davichazbh@gmail.com>,
	linux-kernel@vger.kernel.org,
	Qing Wang <wangqing7171@gmail.com>
Subject: [PATCH v3] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Wed, 28 Oct 2026 11:44:49 +0800
Message-Id: <20261028034449.2368071-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The current NI_RANDOM implementation uses a random dice roll to allow
newidle_balance attempts according to the success rate. There is a better
way to implement it.

Replace the random dice with a Bresenham accumulator that distributes the
allowed attempts uniformly across a 1024-step window:

Each step does the following:
  - Accumulate (1 + newidle_ratio) into newidle_window_pos.
  - If the accumulator reaches 1024, allow the balance attempt and
    subtract 1024.

This guarantees exactly (1 + newidle_ratio) newidle_balance operations per
1024 steps, uniformly spaced for any ratio in [0, 1023].

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Qing Wang <wangqing7171@gmail.com>
---
v2:
Removed sched_rnd_state and sched_rng() since they are no longer used.

v3:
Corrected the code comments.

Performance testing results from Prateek using tbench
(most sensitive workload for newidle balance):

    Clients:        tip                  bresenham_accm
        1      321.65 (0.00 pct)       313.97 (-2.38 pct)
        2      641.92 (0.00 pct)       638.74 (-0.49 pct)
        4     1245.65 (0.00 pct)      1237.26 (-0.67 pct)
        8     2435.80 (0.00 pct)      2442.23 ( 0.26 pct)
       16     4717.66 (0.00 pct)      4688.19 (-0.62 pct)
       32     9303.53 (0.00 pct)      9390.71 ( 0.93 pct)
       64    18002.57 (0.00 pct)     17911.56 (-0.50 pct)
      128    27729.26 (0.00 pct)     27621.95 (-0.38 pct)
      256    47134.77 (0.00 pct)     46137.36 (-2.11 pct)
      512    43179.41 (0.00 pct)     43277.53 ( 0.22 pct)
     1024    40339.30 (0.00 pct)     40176.49 (-0.40 pct)

The %diff is within the noise range, indicating no performance regression.


 include/linux/sched/topology.h |  1 +
 kernel/sched/core.c            |  3 ---
 kernel/sched/fair.c            | 19 ++++++++++++++-----
 kernel/sched/sched.h           |  6 ------
 kernel/sched/topology.c        |  1 +
 5 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index f96812d71c51..e951d6f3fb0d 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -113,6 +113,7 @@ struct sched_domain {
 	unsigned int newidle_call;
 	unsigned int newidle_success;
 	unsigned int newidle_ratio;
+	unsigned int newidle_window_pos;
 	u64 newidle_stamp;
 	u64 max_newidle_lb_cost;
 	unsigned long last_decay_max_lb_cost;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1754d9f95f2c..4d764e68897c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -128,7 +128,6 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_dl_server_start_tp);
 EXPORT_TRACEPOINT_SYMBOL_GPL(sched_dl_server_stop_tp);
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
-DEFINE_PER_CPU(struct rnd_state, sched_rnd_state);
 
 #ifdef CONFIG_SCHED_PROXY_EXEC
 DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
@@ -8927,8 +8926,6 @@ void __init sched_init_smp(void)
 {
 	sched_init_numa(NUMA_NO_NODE);
 
-	prandom_init_once(&sched_rnd_state);
-
 	/*
 	 * There's no userspace yet to cause hotplug operations; hence all the
 	 * CPU masks are stable and all blatant races in the below code cannot
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0f2364479f9d..172c4b53c11a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14198,6 +14198,7 @@ static inline void update_newidle_stats(struct sched_domain *sd, unsigned int su
 		ratio += sd->newidle_success;
 
 		sd->newidle_ratio = min(1024, ratio);
+		sd->newidle_window_pos = 0;
 		sd->newidle_call /= 2;
 		sd->newidle_success /= 2;
 	}
@@ -14928,16 +14929,24 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 
 			if (sched_feat(NI_RANDOM) && sd->newidle_ratio < 1024) {
 				/*
-				 * Throw a 1k sided dice; and only run
-				 * newidle_balance according to the success
-				 * rate.
+				 * Bresenham's line algorithm based accumulator
+				 *
+				 * At each invocation, the ratio is added to an
+				 * accumulator. A balance is triggered whenever
+				 * the sum >= 1024.
+				 *
+				 * This guarantees exactly 'ratio' balance
+				 * operations per 1024 calls, distributing them
+				 * as uniformly as possible across the interval.
 				 */
-				u32 d1k = sched_rng() % 1024;
 				weight = 1 + sd->newidle_ratio;
-				if (d1k > weight) {
+
+				sd->newidle_window_pos += weight;
+				if (sd->newidle_window_pos < 1024) {
 					update_newidle_stats(sd, 0);
 					continue;
 				}
+				sd->newidle_window_pos -= 1024;
 				weight = (1024 + weight/2) / weight;
 			}
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4c25fbe84fb5..210aa35b5720 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1424,12 +1424,6 @@ static inline bool is_migration_disabled(struct task_struct *p)
 }
 
 DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
-DECLARE_PER_CPU(struct rnd_state, sched_rnd_state);
-
-static inline u32 sched_rng(void)
-{
-	return prandom_u32_state(this_cpu_ptr(&sched_rnd_state));
-}
 
 static __always_inline struct rq *__this_rq(void)
 {
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 3dab0253976f..8cc5315a6945 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1984,6 +1984,7 @@ sd_init(struct sched_domain_topology_level *tl,
 		.newidle_call		= 512,
 		.newidle_success	= 256,
 		.newidle_ratio		= 512,
+		.newidle_window_pos	= 0,
 		.newidle_stamp		= now,
 
 		.max_newidle_lb_cost	= 0,
-- 
2.34.1

