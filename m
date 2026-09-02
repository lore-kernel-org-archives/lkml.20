Received: from mail-pz2-f10.google.com (mail-pz2-f10.google.com [74.125.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E895B3E171E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334322; cv=none; b=sce5ZioLxzICrRVsPYRo0LvfXPmsHq2lrBTGEGHtI3GgIfHBgkpMjUDy6EZ+dsjlqzk+UKMgJvJvJbmC3YlDBDoTHPdQmut2Yx3jmfQPbDzbFmJAcikF79UmA9kzV2uFSm9kQzkPKB5DrLt3zJEtmMVxYGHn/DPKdkUFXgqgbyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334322; c=relaxed/simple;
	bh=WTLR5meVohzCgam1peUGWMX1J+RDsSRr7L+2QxILnVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCPbpLRqtIOtAmoTkUDW7hTX2AFf4jdftdhx6EKOFEOzq77dVsbm+k4MeMmUJ+ZlFbEiygsb3/rkqDNE0LrinKL5/XtTuMjkpmutdoYL4X0EobOZa/BnhbRPGzcV5teNfTxuCT2NQWlKcCqBx2feMVbhPf9I5hSzpOcBmWnP2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=binadJ73; arc=none smtp.client-ip=74.125.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="binadJ73"
Received: by mail-pz2-f10.google.com with SMTP id 41be03b00d2f7-cc1c753b1bbso175883a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334319; x=1788939119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEYvUbaRHsvrLqexK6TwRNN/GB2ra0YD4DknJvJHsJI=;
        b=binadJ73VCiV2W9HJyPUtyMD9JGMyhJZnthozF1Z74PofW32s6et5JwjpV0jP37qy+
         lMx+zcg39tmBb8hF7ihQ5tfboBZDUdO4E49PLIn/GbMGgwX82exQEE2hmHxWcd1IkTKt
         Wzn+cLMCMJBso4qmLVWy+S7a6kZK0QBCxkc8t5RHt1MXs5PcLY2+2HBMz615FMjqa48D
         2vJeo035hzEsvK6rKOoJl6D5ZcVTYdTJXkW8IKJHXqc7ToX/RIWgIq0aYmcyhnNM2ZVO
         PxtMCb6+FtDfcIR/H4g0I/aJzxyoGEfBYmj+9Yolpnw1GeS6vuWMjQdj88fGn8VfIQkG
         Zgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334319; x=1788939119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEYvUbaRHsvrLqexK6TwRNN/GB2ra0YD4DknJvJHsJI=;
        b=eO4ak6VaSVCZOhEi6CSKwsGBsj/Vbt2s4uFdiNb8ek35uZl/F+vO7/6tNOz2cRpPWq
         /vQuNdwNAvOphPXyun4CoAyJKpW5Ri7ioKxkMoXrIwKvR31gGFGcL85ZAD29ZK59fBcf
         Ln/IKfl23QVkM3qCuN89HkVz5BnjIvQ/fJPe3PGVnJiQKKqN+rp7TWifFACKrcTWbOGk
         qVbujML6rZYLvdTz8CE55PbLn+7QlTq+cE0GmCcYqUrjsnmfOS++T+FnqzvPv5GTi17t
         Af3grW7fh5mVaEpmC2bR/YOXvv/Nb2hAUdecFIrtDh7SVaajFHe4RnheOFZtwhoHAJoB
         72wg==
X-Forwarded-Encrypted: i=1; AKwUvBwEVJONt18AyKVW9zcEf2ivtScLF/lqsV9zR4aQGl50BKuM4khsIwZbDSm1uCxNoM8MpRgTVKuVE6Kc7u0=@vger.kernel.org
X-Gm-Message-State: AFuF++lhgzVmmm25JbVR5YtLH14NBHYzK0OrcCko51xlTtxNjybN8/HF
	BOE4w29qdbAOu8Q2b/CKrjTHX2Mq8yPnn7d/6Mqb+WGz2RJg+rWup8o5
X-Gm-Gg: AYBFou3m/w46Ee984U6lkSc8kCDNNes+OntPmeYwCGrpArDnF6vcVPAYNPwubZftjFc
	wizEQqrqOnm+oOBzJNLsYkykub0tEFswWfMQZij1vTXWHC9U6vlcGGHc99tgVmFYSaCctOm1D8X
	mtShhMFSrt/tu5FealzSTBiq2jPr7Zifl7BQHYJZQl2XZSJzDCnV4Jc1UVRCV2MRmgS3GOXMA9i
	pbHtMWcTVuEdDPHS9mzUXlyjNc+Yis/PZpSKePatzglqiL9ZOxP85+OE21SWy77tKUamstjJLiC
	9woph7wLltQQePvTH864ltJZw44OnR5sAMY8Awo5foBlzjvveaAyvdgrRpdV7gzoIgebehYUuRp
	kLSq094Ab/4oaSRaLJWVQPVOrGpvH3pkxB/sI6Oe1b9nYIUu55CmmxLvHqobAgsG1rBH0UBVIH2
	gWS9za/+WTVwGoYUb+XDqo2NBtzzSb3tnAuinUGJ87bElFAZckRqUUAiNwiR3RqBwtK+LQKfa2
X-Received: by 2002:a05:6a00:4188:b0:857:7384:b5fc with SMTP id d2e1a72fcca58-85ed4d137e7mr5136737b3a.24.1788334319386;
        Wed, 02 Sep 2026 00:31:59 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:31:58 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 02/10] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Wed,  2 Sep 2026 15:31:08 +0800
Message-ID: <20260902073116.802752-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Replace walk_system_ram_res() with for_each_mem_range(). A later patch
introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
memblock.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
to filter reserved memory from the vmcore, so extend its condition
(ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
ARCH_KEEP_MEMBLOCK unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..1de14a2d5aba 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,7 +58,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..808e872f4063 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	u64 i;
+	phys_addr_t start, end;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	u64 i;
+	phys_addr_t start, end;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0

