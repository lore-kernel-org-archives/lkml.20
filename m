Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF86B361657
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120205; cv=none; b=Rz+ZYBbpBZ7Ee0pEuGOOXs9PJXEYjwjAzwg+7sDS79Uk5/FIpaDHgt/0ntaauc9Zo0msuEGHS+GPGxwuGLiO55PxTSzTRsgO0OyNaPVMPxIkzIjK3fy9KnMkKiqSKRfmy8295QtNpZS/RaIQZC5MqXYUytNBX0+Y29e3dz29N4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120205; c=relaxed/simple;
	bh=EtNWhbSSACfAtj7n0OC8kGNnI/X08sTb/SdHGhlyA3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AadOPzxHZQ4kB6340dqg5HPu+DIAjk4rrYRCAvjYdrU0Wu8FbHXCT7crKvCZEhWA2MpZLyuxv5pXlcjCWKXASl5RSVAl4IiGA8l+amuk/0jp+YYfn3sH/REljgRw8LFGGttypeb2m9EQHxjyaBBpUctF80msffDMoN7dazGmQCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pnm/IsK6; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pnm/IsK6"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so1267854a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120203; x=1792725003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=Pnm/IsK63nOrOtI3yvB6F3zljRt7tfZ6cHYchZuNgFNK3Z4eZrQ9b64Ygad0WhmPu8
         /+EEff5uxwWyXW/r2UFzF6pVkDmdRQjKGD7e+RHURmdYuyCbAEeWMUgU76QsEdJCqI2w
         vWDsQicZWcishYCVXnQyPlXyVOwh5w7rQoahjHFn5RTbrA1duO9TBf4vLHy9XUcEq3JR
         h3FXNT1gWwJX96m0vfw937gu7lGh7PiUfT8iYdLhgS6fQM40pMFqjABCtaL//Bzj19u0
         jJtRQGoVjtosN7demSa4Zu0IBexa7sg3h4y0/Q9grcmuPItTNkkTyRDQRUL6VXQXFBe7
         ZGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120203; x=1792725003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=wAjJhGO92yFLVMaOH3FN6tKJx/wnoeSqavafIPpvJCV3nzgDLnN4R4szIc810jl3GE
         fTTxoGBRbzMeClDQ2AWRWZoVCxUu9jdyqf2PJg+D/mXDMX5oX4qcApqL40phCIrNcCqW
         +xiMR2IPV5XyJLmv3xVQKcDdy8PrTAmB8z6H2a0bP2ml1yrz28nsRmpKGcP2ugbFbseg
         U+KiiJQzW8NrB9CMR5C3/gBi7Dpz4C/TbtquMOxCdb/ZJrqYLw43AVW7gmp9+FnBs0+a
         losBPeSm3DaQ1Cl6tr8qf+INO2FSDqhR2e8cYuJeC/puVuIXuv7gsU0/ipmbywPlCKDw
         YoBg==
X-Forwarded-Encrypted: i=1; AKwUvBx9jnRftgusfcAGhOGyQJJYRV/icewyFdMR/dCVcuIE0kxv/z+a4rWuOy+xWVrCUuFZiuzVXJriE986VoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeQAlPzYYm75qobQ4fkxkoNn+Ti9NGQnSrWHQJqtbcXJZaUyyO
	qyPBHpxfE/osbLqPgL0rIiPfUlhbVt+hEdAGcAIKhWT884dMkFOzPPwH
X-Gm-Gg: AYBFou2OVtVq4W3hPINrKHe8bE9ahZVZzTZKVGbpUoYazGwBdmGU1/PZnL2eOZL/K4x
	cfoeDIxwJ4lR5PhPjkMNJXYbpsp40y9pZPbI+GLdhDGyHMarORCQDjDCUSdQhLXYHdGFaANgbaS
	nBgcbAisfWNmx2Jom8q1GcDHxqUp0Ce9qGNQ6DM3p4pGgPeWDKEooOpRBTVR7R0GltI8wzFIMqs
	g2pKeBc739ZqXorhKQVhvGN6CgTGQuckNumm1rHUpv1IsyJAN2Ql7z1T34Z/gdvLpWWd4lSuboj
	JD01mp7QnwaKh76iab69FY/R2T+LXCugx88SR6MqkGE3KCkVXiPiYcoZAEIPgVh5ZTd+6LEBfuZ
	BXJ6fUXc4hcjU9pC84HaU7RlCrmO/TMdZNlu2YLUaALToZfyt5OPX3dfEyZu1pG4Jmyo1O2xO9R
	PwIrMDmpBW4BjMYGv/mzp3vgMBbXPhXKmtt37hdA3aaa42793vmkaQCxK8OIzAWKzs0CMitwoi9
	3GtupZEy14=
X-Received: by 2002:a17:90b:35c2:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ac7c52fe5amr6152592a91.50.1792120203082;
        Thu, 15 Oct 2026 20:10:03 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:10:02 -0700 (PDT)
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
Subject: [PATCH v8 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 16 Oct 2026 11:08:51 +0800
Message-ID: <20261016030855.4062882-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016030855.4062882-1-chenwandun1@gmail.com>
References: <20261016030855.4062882-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0

