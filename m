Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C931DA60D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791164663; cv=none; b=CCLX5sNpbQ1zbogQ7KmeXIMKMMbt6CewOKLizJA4ZzCgoNootGgSCRh7jvY2urQA54YQuvka90ANWKkITlWG7QVeYsNSpf5rDvY2R2bBNIdysbDvgLXLo41+TP3leBaHBWLibH3so0nB5UOQYiOSOuozEskS8ZWqmj9ahAXOoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791164663; c=relaxed/simple;
	bh=gdcAc9kU2f37oDPTEaIu3SvgwjNkPW9z3uOTiZijXHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fk176Yv0DmK3iKLK9D9Ny2INYsCXsOR6zxHTSaosb1+cY/1ZnYaqTEBoGuRRwQz+oYm6N4Fbfzqig+OqgZhl1azdbAf0d3yAGm2XcoFuOs7eJ3nKChkNF6l21T2lfLizxqx4zquNS2k3afGOwiX4IXoVLhvTjWXN4rh6QzyZ0us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrTa2yYY; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrTa2yYY"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e62211987so1795031eec.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 18:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791164660; x=1791769460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/itbrKvCQTn61vdC6fFvWPbqCrllMkc+xUXFtCNvMmc=;
        b=YrTa2yYYoP3o5yMC8j3kMKPcz5uNPEYsPisUC9Lf1NbqvWiivY+R/ByODc2LfO2NkQ
         qmla/8NdIWAnmOTWICM2KdEF0bu6FrjoGNPVGxHRRvQsjyvLtYc2FzvgG7iISbkMuLWd
         0RxkpGjKSzOnh5/9hJdHPfj50OPSDX3UxUsVVbBfy1lnkAzML/twP8MlBcZhqlTXHRRi
         YCnRxjnk0ZFe1QPRO0bpxxdZcZ40nDRGaU/jeb6a8p2KpYZkfNI1zTl+LnM46KmL1Qg5
         Il0UoJYTvQRp+jU2bVhtLttUqtGZll/uN5JOi5NBK4YrvcgKcewFO3LKz0yITN+Gnpdm
         gnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791164660; x=1791769460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/itbrKvCQTn61vdC6fFvWPbqCrllMkc+xUXFtCNvMmc=;
        b=DX0TWdpJsvEZ39Xs/ZNWeXy9qosG6bt88BQZN/KJTQnA/cCvkaubMo7rFn/o5S2DP3
         KXkd4jdCmNgF8ziDfHuE1m4HAyJqaAh7IXT8uN9XiYmBwqJv6l2Lpz/JcVHxkuyymHTI
         eLwqLmvQ8Sz/RloLd3zB+SXhk/1qhQyrj1Yxzd8An22egNghQJrF74KTnUuciA2XkAmN
         DAvuN4UBXlxdShiwUiv5VIjdUhj3prgdaFgpNDsWiOJQJgUxkUQnKUxBgrVa5uR8mE9U
         Ljvz1iw6Ygmvrj9fDHSPvj8mQSUe/5Z8SSOGSGMudYO8rkJIyOxGvc1cGYXxGW4hcaWk
         EbcA==
X-Forwarded-Encrypted: i=1; AKwUvBydvoDDfE1V9KSclGsEBEZgN6YFUZt5wpjqbJd7iq63HwMPVDEMd5REQ5tINBwL3RnAXFRdVpvJBJypaX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrDrD+vAtyUTtlDiCdu12ivvx4tUv1RuwLMFfAcV3sJSMn+3bB
	tTHullA967waxEgCOBTkf9+JnJ78pCZLMV7TwD9XvlzdtlfHBcQhrOyK
X-Gm-Gg: AYBFou2WZiq90XZVEh80I4kqW6MW9dGH1C5bh1ih+FPo8iW878+1/i7arTyn6REQf/c
	65yXBUtifI9C6fsx7j6MCvXTyWYnbhAX6N25ZC0j2ocF+5+5V2ize6taNx6gO/b62pJB3EQvr4r
	ia0zkSw5rwkQTdD4IV0fvPz77H5qqnvGHX4wVH+WRXyC2JHu4vUok0Fyhb2oddiIuEi3NPJH/dq
	afK5F04/ll/dECQNWopPLxbR2vH/ZbFteuI8VPoUkmXRkJFVgB696hKgZrrk0cC1SPhE9HJP98s
	4oSsJmYXO0mE4POYePLua+T5cwzPdoI2mLEKq3LCo5R3QyFo0kc3ZVeuOqMpyJTcpCmfIQfqGiR
	u4ByevFeV/XJ3m8k5Qpzf9shmXfnWDYSBMUwhTAnQv2yU3udpuQNIFLpgbrbbim4P66fbB6msjY
	Nw3rcfgxNAKSwPcx3LKyjShe3wyCN2bN82j22148ieFbPrNfSPt8vrTIDOEYlUFWLwWvkzW8Clt
	1t2fM65xISPhfyTRx41XzNJsQ9UTSN2rQuiRj+VukQod3yBKY5puberesD6cde2tWiFH50Cia+m
	q25S6n6yvCU48wP7vfiALpF8XGR9Ktz8kpR6t2kpsop+b+E/7IaG57CORy2cbO0u1MRy3i4q2kX
	rLdzTAzO03x6+mS1ok7xgzkidDtSTsZb0+WgKbELdRxInDv9fROVVf8jqMmLB9HrquA==
X-Received: by 2002:a05:693c:8952:20b0:351:207d:bff4 with SMTP id 5a478bee46e88-351207dc13amr5037830eec.4.1791164660342;
        Sun, 04 Oct 2026 18:44:20 -0700 (PDT)
Received: from FT6N242TWK ([223.181.113.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35128156e6esm9000016eec.20.2026.10.04.18.44.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 18:44:19 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Tal Gilboa <talgi@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] lib/dim: fix 32-bit overflow of epms in dim_calc_stats()
Date: Mon,  5 Oct 2026 07:14:11 +0530
Message-ID: <20261005014411.78626-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0843b2389064 ("lib/dim: fix 32-bit overflow in dim_calc_stats()
rates") moved the packet, byte and completion rates in dim_calc_stats()
to 64-bit arithmetic, but left the event rate as

	DIV_ROUND_UP(DIM_NEVENTS * USEC_PER_MSEC, delta_us)

DIV_ROUND_UP() computes (64000 + delta_us - 1) / delta_us. On 32-bit
architectures that sum is done in a 32-bit unsigned long and wraps for
delta_us >= 4294903297, the last 64 ms of the u32 microsecond range
that the function is meant to cover ("u32 holds up to 71 minutes").
epms then becomes 0 instead of 1.

net_dim() and rdma_dim() only wait for DIM_NEVENTS events before they
call dim_calc_stats(), with no time limit, so on an almost idle
interface a window can last that long. With epms == 0, cpe_ratio is
set to 0, net_dim_stats_compare() returns DIM_STATS_BETTER instead of
DIM_STATS_SAME when bpms and ppms did not change significantly, and
rdma_dim_stats_compare() compares a cpe_ratio of 0. The algorithm can
then step to another moderation profile based on a wrong rate.

Compute epms with DIV_ROUND_UP_ULL() as well. The result does not
change on 64-bit, or on 32-bit for windows shorter than 4294903297 us.

The issue was found by the Sashiko AI review of the original patch
(see the Closes: link). The fix and the test were written with an LLM
assistant. The dim KUnit suite computed the expected epms with the same
DIV_ROUND_UP() expression as dim_calc_stats(), so it could not catch
this; it now uses explicit expected values and gains two cases with
delta_us of 4294903297 and U32_MAX. Without the fix both new cases fail
on UML i386 and on qemu i386 (epms 0, expected 1) and pass on UML and
qemu x86_64; with the fix all 10 dim cases pass on all four.

Fixes: 0843b2389064 ("lib/dim: fix 32-bit overflow in dim_calc_stats() rates")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927051743.71460-1-jain.sm@gmail.com
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5), which checked the Sashiko report against the code and
wrote the fix, the test changes and this changelog.

Tested on net.git main 6dc989ea46b9 with
./tools/testing/kunit/kunit.py run --kunitconfig (CONFIG_NET=y,
CONFIG_DIMLIB_KUNIT_TEST=y) on UML x86_64, UML i386 (SUBARCH=i386),
qemu x86_64 (--arch=x86_64) and qemu i386 (--arch=i386), with and
without the lib/dim/dim.c hunk. W=1 builds of lib/dim/ for i386 and
UML i386 are clean, and the i386 kernels link, so no 64-bit division
helper is pulled in.
Not tested: 32-bit ARM or MIPS builds, and no run on 32-bit hardware
with a NIC; I did not wait 71 minutes on an idle link to see the wrong
profile step happen, the effect on net_dim() follows from the code.

 lib/dim/dim.c       |  9 ++++++---
 lib/dim/dim_kunit.c | 40 +++++++++++++++++++++++++++++-----------
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/lib/dim/dim.c b/lib/dim/dim.c
index 7f3eebae73cb..138589fc9048 100644
--- a/lib/dim/dim.c
+++ b/lib/dim/dim.c
@@ -69,13 +69,16 @@ bool dim_calc_stats(const struct dim_sample *start,
 	if (!delta_us)
 		return false;
 
-	/* u32 * USEC_PER_MSEC overflows a 32-bit long */
+	/*
+	 * u32 * USEC_PER_MSEC overflows a 32-bit long, and so does the
+	 * rounded-up epms dividend 64000 + delta_us - 1 for large delta_us
+	 */
 	curr_stats->ppms = DIV_ROUND_UP_ULL((u64)npkts * USEC_PER_MSEC,
 					    delta_us);
 	curr_stats->bpms = DIV_ROUND_UP_ULL((u64)nbytes * USEC_PER_MSEC,
 					    delta_us);
-	curr_stats->epms = DIV_ROUND_UP(DIM_NEVENTS * USEC_PER_MSEC,
-					delta_us);
+	curr_stats->epms = DIV_ROUND_UP_ULL((u64)DIM_NEVENTS * USEC_PER_MSEC,
+					    delta_us);
 	curr_stats->cpms = DIV_ROUND_UP_ULL((u64)ncomps * USEC_PER_MSEC,
 					    delta_us);
 	if (curr_stats->epms != 0)
diff --git a/lib/dim/dim_kunit.c b/lib/dim/dim_kunit.c
index 2e984f6b9fe4..8aa8df78bd3c 100644
--- a/lib/dim/dim_kunit.c
+++ b/lib/dim/dim_kunit.c
@@ -14,7 +14,7 @@ struct dim_calc_stats_case {
 	u32 start_pkts, end_pkts;
 	u32 start_bytes, end_bytes;
 	u32 start_comps, end_comps;
-	int ppms, bpms, cpms;
+	int ppms, bpms, epms, cpms;
 };
 
 static const struct dim_calc_stats_case dim_calc_stats_cases[] = {
@@ -22,13 +22,13 @@ static const struct dim_calc_stats_case dim_calc_stats_cases[] = {
 		.name = "small",
 		.delta_us = 1000,
 		.end_pkts = 640, .end_bytes = 640 * 1500, .end_comps = 64,
-		.ppms = 640, .bpms = 960000, .cpms = 64,
+		.ppms = 640, .bpms = 960000, .epms = 64, .cpms = 64,
 	},
 	{
 		.name = "round_up",
 		.delta_us = 3000,
 		.end_pkts = 10, .end_bytes = 10, .end_comps = 1,
-		.ppms = 4, .bpms = 4, .cpms = 1,
+		.ppms = 4, .bpms = 4, .epms = 22, .cpms = 1,
 	},
 	{
 		.name = "counter_wrap",
@@ -36,35 +36,55 @@ static const struct dim_calc_stats_case dim_calc_stats_cases[] = {
 		.start_pkts = 0xffffff00, .end_pkts = 0x100,
 		.start_bytes = 0xfffff000, .end_bytes = 0x1000,
 		.start_comps = 0xfffffff0, .end_comps = 0x10,
-		.ppms = 0x200, .bpms = 0x2000, .cpms = 0x20,
+		.ppms = 0x200, .bpms = 0x2000, .epms = 64, .cpms = 0x20,
 	},
 	{
 		/* 30 MB in 10 ms (24 Gbit/s): nbytes * 1000 exceeds 32 bits */
 		.name = "many_bytes",
 		.delta_us = 10000,
 		.end_pkts = 20000, .end_bytes = 30000000, .end_comps = 64,
-		.ppms = 2000, .bpms = 3000000, .cpms = 7,
+		.ppms = 2000, .bpms = 3000000, .epms = 7, .cpms = 7,
 	},
 	{
 		/* 4.3 MB in 16 ms (2.15 Gbit/s), just above the 32-bit limit */
 		.name = "bytes_32bit_limit",
 		.delta_us = 16000,
 		.end_pkts = 2900, .end_bytes = 4300000, .end_comps = 64,
-		.ppms = 182, .bpms = 268750, .cpms = 4,
+		.ppms = 182, .bpms = 268750, .epms = 4, .cpms = 4,
 	},
 	{
 		/* 5 MB in 40 ms: a 1 Gbit/s link at line rate */
 		.name = "gigabit",
 		.delta_us = 40000,
 		.end_pkts = 3300, .end_bytes = 5000000, .end_comps = 64,
-		.ppms = 83, .bpms = 125000, .cpms = 2,
+		.ppms = 83, .bpms = 125000, .epms = 2, .cpms = 2,
 	},
 	{
 		/* 5 million packets and completions in 2 s */
 		.name = "many_packets",
 		.delta_us = 2000000,
 		.end_pkts = 5000000, .end_bytes = 5000000, .end_comps = 5000000,
-		.ppms = 2500, .bpms = 2500, .cpms = 2500,
+		.ppms = 2500, .bpms = 2500, .epms = 1, .cpms = 2500,
+	},
+	{
+		/*
+		 * 64 events in 71.6 minutes, the longest window delta_us can
+		 * hold: 64000 + delta_us - 1 exceeds 32 bits
+		 */
+		.name = "long_window",
+		.delta_us = U32_MAX,
+		.end_pkts = 64, .end_bytes = 64 * 1500, .end_comps = 64,
+		.ppms = 1, .bpms = 1, .epms = 1, .cpms = 1,
+	},
+	{
+		/*
+		 * the shortest window for which 64000 + delta_us - 1
+		 * exceeds 32 bits
+		 */
+		.name = "events_32bit_limit",
+		.delta_us = 4294903297U,
+		.end_pkts = 64, .end_bytes = 64 * 1500, .end_comps = 64,
+		.ppms = 1, .bpms = 1, .epms = 1, .cpms = 1,
 	},
 };
 
@@ -95,9 +115,7 @@ static void dim_calc_stats_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, stats.ppms, t->ppms);
 	KUNIT_EXPECT_EQ(test, stats.bpms, t->bpms);
 	KUNIT_EXPECT_EQ(test, stats.cpms, t->cpms);
-	KUNIT_EXPECT_EQ(test, stats.epms,
-			(int)DIV_ROUND_UP(DIM_NEVENTS * USEC_PER_MSEC,
-					  t->delta_us));
+	KUNIT_EXPECT_EQ(test, stats.epms, t->epms);
 }
 
 static void dim_calc_stats_no_time_test(struct kunit *test)
-- 
2.43.0

