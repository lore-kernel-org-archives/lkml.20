Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B123B0AD0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131417; cv=none; b=bg8T6XsaR72wkx3hZLuc64tR8KlBUVlQG9T7TAPUS598KsLekwi663FeDJI8d2vFw845Dtsghq7wxQrRoXkknTho8SZCUTZ6BnL0rYL/+MxHAfEhT6ydmxfLL5FK3JrSPrmqsOnXo+Nea229mI+s5/QESS2yNgmEkbAue/R8CdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131417; c=relaxed/simple;
	bh=EtNWhbSSACfAtj7n0OC8kGNnI/X08sTb/SdHGhlyA3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lf1lfcasRLK3ZfTFsqjWrX+oeDI+JcleNhy9ISn4Zlz5Bar/i/Jxol3POfRx38QvaLUDQ2cjlj4pO0MNeleK6qqrVhEX2lDnHXfgLuhFKLtR7CnLE/aoxtyKZ4YzF+qzGl0bIFI8/CMerddnV40CA3+UpCf7e2C5NYBJD4aCxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drezNX/s; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drezNX/s"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1161816a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131416; x=1792736216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=drezNX/sspA84NsGjRYGPLQwxF0yBASB5AULaVi4deGZE8B6eFEgb3Az+hvyjL5BYw
         ErOKkKLvRXL9W+UOtLKPoX97IH2uTpyL1RSJtxsBBCwuH6k3P+i5Z6Q5wiJLWnWKytYP
         2r1QupFd4sCnAx90RcFB9Ccim0aW9wjFOo2LdrT4VF4lPgp0I7i/A4eO6IB7n1/D6DRn
         PKjwxlHgR1Kjj0RZzXVnZXjYv6U2ENqCIdYx3gz0xXszEDHWIg/2ts3Auo8TkkP2fd+B
         7+kMHgS+Es08QWBWjvniqIL7BLLa/kfWewXGl7AokbBX2TPnjX/Rjxx2G/qRNJ/cjo5k
         Nw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131416; x=1792736216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=ENue0RR7VUnlbuujb+SdwhYYKNnuvIqELCIASTzu/aqELAqJDBPeQr56g6gHcWM/ZI
         HsEbadTGipgADoh7jLOkwSGR/kO31eFkJEhTOvk3EXtIccUwhRL99H75AcDk+vXsIp4c
         tflMDscVKYgMj+OcZzbRf/d+klG3v9yIFvMk6Gytufue4uZPAXet8Zw8E46TTF1BXrgv
         WOUXtqU+3LDBb3Zr5lrpgE91TXYj8UCg1jUI8Mj5adJQwhLDf6YLMKWtlTQA7zOFTZYF
         PUy/o6De3qy+KwEgD1tDL2r3/y+4KOK9afFPzfH4pnZ8VDuHiqPfMtXIv+Z2zIlD8h0C
         uCPA==
X-Forwarded-Encrypted: i=1; AKwUvBxkGaZAoaQJsZtAuEx3U3BDrtoNfECrfg5oDi9rfR4cxYHKWsib3qXElfLdHA1slgeHfKzwg6nyxZarp2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa4WxFChVi6NlMYUDh+WastqWAD51eUBOh4VV5XQ4ekn7nm/Y3
	N+zt5kuWcoTeI8c7LYQ5Zpl4TWey379DFPbrRpdddbns8uZwuREAHtRV
X-Gm-Gg: AYBFou2/XW1Ej+JA6WYWjuTKmKi0/cXtkMGnheBCKdJDXrc47NVwW5YN7tIGOPkDlm2
	2F0zBddR1ANTdPohrlA8HtiJRGcwqS18ylsJbeQQA5v4YC+CJZjHfk8rj72ySx4n4E4JuogcqOe
	54pEq1Ggbkca1QqrRyL2V8MVTarsVwKURUzipaPo8K6WfuzQrAm7l7Noxfj+nJe7WN03iChcOKv
	NlMaFV4XfYocQEIHvw670mXIZPMree/+CqZ7a8onUfgDWtyjy/H8EI/7agolHO+49MQJvSQupZi
	J0ruS2lvNAj9Lr2q5Jo2bxBZUzVs5w9Td7Pv2J3LEMBPUdUBqSRJbQvRyvo0JHdBLNk60NhBmmk
	A3eYt0OjrzM3pRhScIVQTVayx1XFSWOGWa+AlY7OoTGDXnumQcQmVoS0D7sxrWE5/wkGfqQYmKq
	wDQu7nlgcMTgz4yr+wcDqo6s225iMafkLfiZ70M0AdD54zL40Q53CqBBu9JytUW/w1ikX9fhzM4
	ZnNE0y3410=
X-Received: by 2002:a05:6a00:b8d:b0:89d:ec58:ce47 with SMTP id d2e1a72fcca58-89dec58cf9dmr5849396b3a.55.1792131415787;
        Thu, 15 Oct 2026 23:16:55 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:55 -0700 (PDT)
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
Subject: [RESEND PATCH v8 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 16 Oct 2026 14:15:45 +0800
Message-ID: <20261016061549.4181390-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
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

