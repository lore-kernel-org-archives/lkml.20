Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351996;
	b=saBhhdQS9Bq7mqHIOsF2W/BPQL/NXhSYefkejL+v3Rb4emQbMQN+UOLTXcbeK+sx8wY5
	 psY9VyrGSnxjHrL8Y7E9AACUtxess3deWkSU//Dx58pYgyvs1FjcxvQ18wpa9MRkqj4Ml
	 2PFc3JZxXZeWuLyHLlUW3Fp8NmYwGxw2VZW/u+qZtyb8+9BE/5w63woj5u4OAGyr2y1uX
	 8LEmZypYHJpgLXQofmGnvnDypOJeG04xNlDu+fgI+E4q/M10AptF3Th3OCTCyHH5VfAoA
	 7Irof2T1KiTZGTHhrN/tqyML8CNtLUQzrCvVr7OKowiAM7s+29t2E02qxDbCgXJzaNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cqe6pvcyAAHgcNWegknb2YOs+KVFaKIqdRqsDQ5tNjo=;
	b=BuAgIsiFYQqTxFB908lDb4NZph59u42OlH4angsztbQctX7aOCVc0rjKGMqIPYTAdHr2
	 fHwG82O59ncT/vTu4E0zs/QbvrGkFxBC9MkpZginRRXKRTiSf8IHxdKNnebma3lzQKmUc
	 VLzWfaDDIgl/44F0R/Z4KSjpFTOW5b5herikAZeA4J5IK3fFiz8V+3GUFcrinT6mRkF+M
	 kV8vhD5LCCwpCh1kRYbbhmxnnMLRmbRoWa24RSMn3V7NHu9OWLaev6FW1E4YH62+PEkK6
	 NqPXrsqdLdC7XvSUuusWTa8enqg60w45Bh09CACOM6Y2szhAFxA8NrPbzVvwVp8bxYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJswx8ge;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2438A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJswx8ge
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad211ad92bso107251a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351995; x=1793956795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqe6pvcyAAHgcNWegknb2YOs+KVFaKIqdRqsDQ5tNjo=;
        b=xJswx8gedU0maE7QfCCvUmeW1/fo40qxFRmpKusCAy3+FvpNXztQ68i8bycMMNVCCd
         99A/PwdfmJp5j9rjqm5hLNjo65jd4JogPIphtMD8UgJIZQjOvOJcWk1BijAXhFXLFMvC
         VHFnfz5WcVaCH2aQauvIO+EsgOOGjBD6HTAy+q1xb9RkatOdLj3ebK/RAGHOYPSYtc+b
         j5l2O3edWjNy7lAQDD5mWlRlQE4w71OYDmbiTf7M6Bz4dkuUCn9Bz6Dt/SAS+6yMieI1
         5k99e6oga64jpjN1wn5RydIsC6DJjotyQqnI63rrtH+f3Khl9pqpdzs7QSYNI5L9vJQ+
         QFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351995; x=1793956795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqe6pvcyAAHgcNWegknb2YOs+KVFaKIqdRqsDQ5tNjo=;
        b=esRwemvV7pR1XOLMYqHvD3dkYl/wlXdolUpUkACmPy5JNEMnbmvVQ9BbFse2mj+84U
         e5JrPoY8a4NeO7wYU8WN8I1DVzluS1/QT1F94DYVbc+5yzNRFmrFVk2zn1C2gHsDkzia
         Iv5MgHQnYWqj0xQXE8nPBUD4Y4sLiPj2wexQ7Xt9LVdhn/JmABs5nkRC6TPj77N+wWGC
         W3thvIjLySnhg5w7mxLOf6M4eBLHY+HEDwjaHOVGlw4AeNXQyJmX10FDMkVcDnqwzM4B
         X4nDC+a4KDo/THfKp32O2ksxevItose3ILY9w5SG3cihzSMDVthCrAT25sAaZtZx5DUs
         8NhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4OcJj7ADw3PjKLZdC8nNuJ21+G29n7yDMCbyoxlVUugRdr0dcCWnw0B6NR40CbgRBziSITXPYcUu3JF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPIl/BdH7UbmVDfR2vI3vt7IVHzMx3ckqgTyuisbFNBQdJmsfb
	8EtzhG76jjGMJjbvo2UXlmQ4DO54tEZSMkKv6/uCPqTm5EpWkQsFIMh7
X-Gm-Gg: AYBFou3TEBJQabN6U0OwYItuf2JCsMbKcf7AD/rKb/tCLwqzdJSzAuF/AU1OooH4GOD
	gK7ez2J9sK+jnrjm6BsRi9x4a6hewf7STQJDFU3tgl/8B7Kwkxs2KMDiF5OK6P2XjkhVPEXmzDq
	yZqDSixNK8l1GzI3WAg2VpkbQ0tNi9G+rwg+asoJ/pvZWYiSLTr4G3t5s595xwqnpEqyqE81Xp3
	X7B7oDy32yoPxmNu1uUVbELGtMUU4wTYB6DSWm6LIRI/wy31xQXy0nAj1HS8YJ8vsp0Vd5pFpvo
	n4ro23WFz4dclnctT3vXkxn7VXBifWw7ILE4qa/voIExpYIHAP8zxcJDRs62T7Ufxt2kIp5AUp9
	tsyAOe9OCVPOy2az8aZhP/IWWkCFtk8lQTq/UapUirMF+WFmsNucNNV0JHjVbQJPeGZOT/5SqMx
	b1Tw9NNY66lf4v/2SPUK9SypGuRN8qOLB+qEEuiLKAHfg1wYOshpxav4eRrqTh/TvwL/6JeBZ3O
	SsHzYvB6TAPiWfNZmPF13b8CL6q302CHJeflYWJ6W1RqN/SuHjtRezrsx2mR8/IZBPQg6tyw9da
	XtGNq0hqLBFlIW7pu4rReNXRpEPXRS3Zh6S6Q/zGikZlwUlMjZwZ5AUz
X-Received: by 2002:a17:90a:e7c7:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3ae8953618amr1313086a91.1.1793351995351;
        Fri, 30 Oct 2026 02:19:55 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm3365754a91.7.2026.10.30.02.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:19:54 -0700 (PDT)
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
Subject: [PATCH v4] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Fri, 30 Oct 2026 17:19:46 +0800
Message-Id: <20261030091946.2498870-1-wangqing7171@gmail.com>
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
newidle_balance attempts according to the success rate. This can be
replaced with a Bresenham accumulator.

Replace the random dice with a Bresenham accumulator. Each step does
the following:
  - Accumulate (1 + newidle_ratio) into newidle_window_pos(accumulator).
  - If the accumulator reaches 1024, allow the balance attempt and
    subtract 1024.

Why Bresenham:
1. It is deterministic and reproducible. For a given ratio, the
   balance frequency is exact and not subject to random variance,
   which makes the behavior predictable when debugging or tracing.
2. Bresenham spaces the attempts evenly; the random dice can go for
   a long stretch without balancing or fire several times in a row,
   especially at low ratios.

A quick simulation where the ratio jumps to a random value in
[0, 1023] every 512 calls (20000 windows):

                      Bresenham      random dice
max per-window error  0.5 attempts   41 attempts

The max per-window error is the max difference between the actual
and expected number of attempts within a window; Bresenham's error
is much smaller.

Signed-off-by: Qing Wang <wangqing7171@gmail.com>
---
v1: https://lore.kernel.org/all/20260506024455.2799069-1-wangqing7171@gmail.com/

v2: https://lore.kernel.org/all/20260602054619.637201-1-wangqing7171@gmail.com/
Removed sched_rnd_state and sched_rng() since they are no longer used.

v3: https://lore.kernel.org/all/20261028034449.2368071-1-wangqing7171@gmail.com/
Corrected the code comments.

v4:
Recovered sched_rnd_state and sched_rng().

 include/linux/sched/topology.h |  1 +
 kernel/sched/fair.c            | 18 +++++++++++++-----
 kernel/sched/topology.c        |  1 +
 3 files changed, 15 insertions(+), 5 deletions(-)

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
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98..b2661448759c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14931,16 +14931,24 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 
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
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 919d0fb00bd9..79c477b47510 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2002,6 +2002,7 @@ sd_init(struct sched_domain_topology_level *tl,
 		.newidle_call		= 512,
 		.newidle_success	= 256,
 		.newidle_ratio		= 512,
+		.newidle_window_pos	= 0,
 		.newidle_stamp		= now,
 
 		.max_newidle_lb_cost	= 0,
-- 
2.34.1

