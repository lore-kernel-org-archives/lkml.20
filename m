Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AFA43802D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066678; cv=none; b=k5xl6E8KKR3xRnv+5dV/BGsE2ubh2GE2rBPx9uN08v4fcYAFb7/a9A8RCvI0TGSXwb4f5zFM9xFwA3GhGFh7Wk9ExdvRD0WIlhsDWFdIjwRw/i0h2kbLiHNYhfY6MsvHLPZbmHlPFdamqxSmqjPcV4ci/nhBPVeACqhxGnGJzOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066678; c=relaxed/simple;
	bh=A4RBzJL9im7c/Ccl2wKHTfjmKax8oE4qb4M8Jusp82s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5Ml9V1RlYQ3l9/k2JxhzHUkbN9Srd7ZgJldAvaOWfUKf97Yo4bnf4R2cawVakC8T2H9I8AaQ4O9g91qbqA5qpjd92KBfITQXhFCwKSza5YZ4sm0mYWCz4t2dG6yLz85OvgyFB+jIPG9BIoYuWLqyFCJ+e77vP6Imv8HKZ04ix4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVJiMPPg; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVJiMPPg"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-39e0e245eadso1692495a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066676; x=1790671476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=;
        b=pVJiMPPgRz7zhsa7+oRwkwWR9qR7bCdm5R55ODWF4mLzKD3hoEvOQQN9IOBMrO4rQC
         K5BiqV9QLvHinFH4Kq17OsSHz8/XX/WSsPj9g3RuFHnRU7C0KAiPuDr2sO402WcG/wCG
         pyY0p9AWxOh2J0Muj/vpKLzjS0oKp3mBADel4Xxudl01DBs4clv7sbe7Lr2VeSoN0kTl
         +HlX4/I/xc3f7DUKp724D963/TfEowd4Nr3URrbiTtlMhcLaCd4HuK8oVzMM+ILDQinN
         TFmPIPR9czMAnc+0bWteOMNCRIv4Gte7BCn9E2BAyPBB5rYcG32BYnNVGHqqpTJXwJVd
         uIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066676; x=1790671476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=;
        b=c+6tMMQ5qLaRIfaRlzCm+cuHjLlrWQc7ztJlK3q0iutjjUYafKcWSnB2C1puO9awV/
         1LRxRX4e0SB5hmvr7y9bl3WGPGTpuuOZ16lvI01Z6I9T/ByvrxgL7HlbImM916lFkCOq
         fgR7oXg6QWFSWDOC6+HNaz6W/f0svEWeUYcLnFt/K423HQ/AMGrr8c1+EYrFofEioRcH
         JB21BDtmbKBSA56zQRPrfM2Yb6CSB59U+kxW1a7yeAfNJFVCRsEnQzY1nX9VP6OxrARz
         FJaEGJvdykQiqKzmZNmw15XpFfLknAfOJLQBlke11UIUuLjhU8X5b9vcx3WqV6C9hWQj
         JYyg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ6+U0ex5QQ/7fxEDkTi4L7vCB0u7dWczLKZJ+QegZkzLTIb83X055hMOIbeI+eIHNnnY/pinkFrShZYE=@vger.kernel.org
X-Gm-Message-State: AFuF++kPGL7OBybo9xqWM/QmQokq/25YtmUNXLnheZLDDBOCYca9Kyn3
	XbIiruWWfxntWQNmne9IOjv2mYQ4Wof4eZxqb2+kQPTJaUU1WBLiS/uA
X-Gm-Gg: AYBFou1URWWplVLHkuK01X0WtmUHNMFQqaTg7gzJiCbGaRrGMSAUDLfHFYy6JinF7ZV
	HvPuYIQRa7CmirlRstx4H6a2tbR2gtUNywFAuXrlEBOHE8H7HytQ/Y3k7jtiZ8aqh22deOdPlPi
	eaT3nePaiZ7ydEPQZRnv+XTCB8ZpVhh9GDtVyhrTQR3FeKBtO40P325jGOoebL86ZA+osa/3UKk
	34TGG1Zbp+RacxiK3AxnFP4tCYC/ThzeOY3jFpls0K4idJXSUpDnA3XYtAizYh+80yFUxOyTq+j
	Z0cR9Zz6tj7VfqIE3lU7TawhkQdHKH67Xw30pGtf+TUTqfOzsDlkpbTS81tGXzdvG6KPhvYIIWg
	jLp2Q6mGzVidAcMEBVuKeIWUUNFfOMxG4ZM1rnCeU/DX2zc0zfauLe2sMI/pjIunS11qbAVUVeA
	/1bvdC/ElvCRvjK/rOeshsz5ehp/hWw4/D4lwTEjjAvOfkFpeKz4edfOvZZoymAu0iwzI4eNvmF
	x4N4DzWxB4=
X-Received: by 2002:a17:90b:5408:b0:39e:6a81:f34d with SMTP id 98e67ed59e1d1-3a07320077dmr483552a91.39.1790066676289;
        Tue, 22 Sep 2026 01:44:36 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:34 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 7/9] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Tue, 22 Sep 2026 16:42:54 +0800
Message-ID: <20260922084256.1515554-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a64afc3ded3d..286fd4db6312 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f29a07e8fb23 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0

