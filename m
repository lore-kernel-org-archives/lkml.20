Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A780049DB99
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168177; cv=none; b=st2nubFOLF8DeotWJXO9u584G2EuN5Fns51H5Zyt893l+setkVAjWekmogaVK/+sb9Yot7h1ts55LCjpEzAZGD1tziPigloZ1glYyyPrMlau4QNrkc8itwBQ0C/jFAvrKTA9A8te1EcBiLobZ5IRDXCeXSZpvH/+MvgpGieMua0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168177; c=relaxed/simple;
	bh=c7mWcPKLtNre0eenXU6lpZXrbWDPxSAkAKmeJXyT8Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQSValC2KuUafrp2NYKYyPdQ9d3iEQYKmRN+jen7RKUCxOd64+gCpwEMJGeyT4vXGxksyVI2GI3tV4cPkNOwq/r5FrKZN+R2MHWEpqhSv8kU/RATXiQOv4PAtu7Sf3ZWECi8PpRpOzsa7K6T1pSPAjirjfpxn61oCP/6tOTq7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPAOQh1R; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPAOQh1R"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so6475155e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790168174; x=1790772974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RF8RC7IjE1/9gCOu2HQ6jsvEvLwCTuZHEcAfKn1Gzmk=;
        b=oPAOQh1RhdkMCG8Rf8Asb8REhVqPdA8VhR/X0+76YF90TccMi1/IYSkfAU2Bd78MSW
         O0LjTri+zY+pjBxV3ZBPt3LpU05HF+1NQGqVFzlOgKVvocRNESIBf1cy53j4YDgpUnOr
         umGDFvvX3QzHORrPTbG+ZalFe1ajTCRe+gXqXUfDKQ2xSbHM4MwImFiZICDHEtlExsvs
         m8v2eXiJuIfir0t+Lz8hvcyliMQqTv8a9TaEVZIhi+kGOdUQ7fVXzbvljbpI3ShMAU0v
         H/uGZ8NHxhJWPE/0oeukWyRGhL1LRbutY1bkL1MvToLFXF/WXZUUh5oIbiN+JbV6NBI5
         ppYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168174; x=1790772974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RF8RC7IjE1/9gCOu2HQ6jsvEvLwCTuZHEcAfKn1Gzmk=;
        b=zYAia38QmvWZd0VnTVl+zWnSL1hKgB4iZsUwzf0aM2P4hJo22dUzXH6OdxO6HRBEoL
         wz/fvlozOeuecO3YrBSasbyX+8EAAaymu4hv+s65X8vFI4tSkh5mvoDjLo29Af+1CfpZ
         ZBtth9cTfd/QyuQoBaUH8wBBLRBu+nD1v+JiMeWeyRX03I1smFvxWJxysQshxgBGNd/N
         sfFNt8Qs6gre/svbsFykQ/bPKIMoIuFHKRzjh+qwbXd1lLlkmn4DLTfTTB/U7PI8+xZB
         Eii8FsKWCwy2Rzz6ylJcoIYjBxgpoTPhYeV4KJScVnnHR05FWg6MSjCAE0C6o2PxaIJX
         Hi5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwq+yJKbLbLr30RFKH2WpUr4I4/QogPQAgdlHomCy4QKE0ZkaNM5lkpoBmcrxjItvU73s2awBDYHGBJQ10=@vger.kernel.org
X-Gm-Message-State: AFuF++nyE37oV100jJIZF7Y5I8FYWJjJGm5YuaCeHu2h6oE2T+IKRCYh
	Hq/yaRQINpJOT1A4aWA2yUN1dLBQNygJ3qrR1CHiDKgTP9oH64Ndiauj
X-Gm-Gg: AYBFou1uvJwsS0759ng/L0/p5vwQlWeQ3qaORYPu3fIpw6sSBGBpNQqkgkSDQ3aF9bM
	Qplgr6t0NQHld5B3axn97IQFBb3F2lT2xoOXOtOdb3oubLCebjy7obgEjv7w0NAhetQkRpaWXrk
	KI9AdN+NCHj2UR0YPj2aBmFmV0BBKFB4AXjEiW3pBiagq6jCN5C32oBfxeRnNeIX6RS5f6fkONC
	3Mo6lEA2DfuskUtzUzvMFU5AHPW7wFU4xYyJXqfLeaYXA2+M/m1M14jdu9/MemXEjWUJtBzv5hu
	JCw6pBpbJuECkKnzbiUQSev+DSpW6xc77OewHbErC7Sk4epcFoT1AUScu1EyYXv3H/diysWYKtb
	0RewAp/kfFyumrbIvYdW1diAVj4OGziBAfJiPmBgO8TIKjwOI7GLTM0EGcsNNPBmkDXZkzgxxH1
	sxBkWmFxqmbjlRy6NJ0ZokZ0MmGJ2LhlcedlZ+aJDpT11lzO84UX94s/qrxfJZUGF7wynFy8hcp
	V+IriU+ig==
X-Received: by 2002:a05:600c:3511:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49fdf101c26mr33109085e9.13.1790168173666;
        Wed, 23 Sep 2026 05:56:13 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde18093csm86935825e9.3.2026.09.23.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:56:13 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	linux-pm@vger.kernel.org
Subject: [PATCH v6] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed, 23 Sep 2026 14:56:04 +0200
Message-ID: <20260923125604.2482-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Shift the u64 product and narrow only at the return.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
Changes in v6:
- Drop the cap_scale() change. As a u64 static inline in a shared
  header it would cost future 32-bit callers a 64-bit multiply that the
  macro did not (Will); the truncation is the unsigned int temporary, so
  drop that and leave kernel/sched untouched. Will's Ack on v5 not
  carried since the arm64 hunk changed.
- v5: https://lore.kernel.org/all/20260917182059.2851-1-okerixx@gmail.com/

Changes in v5:
- cap_scale() as a static inline taking u64 in <linux/sched/topology.h>.
- Patch 2/2 of v4 dropped in favour of Ananthu C V's series.

 arch/arm64/kernel/topology.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 55bd8fa3e95c..928079332fe6 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -186,7 +186,6 @@ int arch_freq_get_on_cpu(int cpu)
 	struct amu_cntr_sample *amu_sample;
 	unsigned int start_cpu = cpu;
 	unsigned long last_update;
-	unsigned int freq = 0;
 	u64 scale;
 
 	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
@@ -245,9 +244,8 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
-	return freq;
+
+	return (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
 }
 
 static void amu_fie_setup(const struct cpumask *cpus)

base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
-- 
2.55.0

