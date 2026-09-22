Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7538E52BE2F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066606; cv=none; b=hMzGRXL2QCPnmbws/KR4bXrpDXgaYsCdMedFQmq+p6YYCQ/aCMpDoWoZH+RfPCT5dRN1ZUQ+ELgvB3ymlsK81NsFe9btSchpHbazBxNxApcI10J1LiqNBg+yHVjI8pyAPxMO7L3+aL8IIR6ePVav2Aupun++t3QG2tELXP4At+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066606; c=relaxed/simple;
	bh=DHg+Xu+RM/RWOTApV60B7AmLnhatRTbyWK/RynXlXLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMwFWVQA6GgBszOm9YDc2gZ66AuBXafYSfgPLRXDbO7huF2/GatuPjNoTuh0PfpcRCjmeBHuzR/NMpnbFaqN5JdbIf2eKIhiKDpZVOQVQleRXF1akqM2KvctGzQdliP88f0E/gacymTO30ueUQrHZgBYyneVg84TXpK4ttuI+ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoLsyiCW; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoLsyiCW"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so2418324a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066604; x=1790671404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=;
        b=QoLsyiCWMw8Sv83kmyqjvhoUjsJHUXf/QkWg9gVQwUXJ9kiO3I9Xmzj1ynLiB7hgxx
         fkUvYjoJkcpOm31tQolCZoQXvpl2eN0rhzeBmSd3Q5e7yunUQxMe5VtAzs6ILfEW7WA4
         CHiCto2jcm9HIuJDrCOJtCrjPajNxwXew11eq8Ns/B4SRpLfrTnT64N8RzOdC/Dj1dcJ
         klpP4N+I+NuV8MHv2Jr4V2kfOObop/sT64nvDfHxXG4/+FiROa8VUd/2/SPJ+THuwFTK
         P9MDSZxnDh4RpEerLwqmlHBL2ai/l4IJWJ454Sp0XWwR8I+6601lRfGh8EVbeNPlKPq/
         U+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066604; x=1790671404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1ZOEGC6NTnorBW1vtDJTTSNUXHaycEwYALUJLCTDV4=;
        b=zB3YLenCPMcC0KHqTbBDe+y14Q8Hgoxmz/FFlA9FsHdo71qmCmoHkZI8LndcrKmTeu
         T2LOUiPMdMynu1Lzfn8vMvcd0noELTfo5lX5Ks9EUkBplQAhMEVYInQTu587e8yCY95q
         h78Sq59gRlgiW15cnYO8GhPPvJ5JPauYYGNlaXOWZRPaFQc5OHR3HLa06MJq49W5EHRx
         Xw1WVl6V2Zpt2ccJv2Wv9oe/F7wTBSYVADxRXXXKtkDgxO0tFLXo0+FgGHFWgoLWD/u9
         LXcSufVo7WPCDoUaocTZRUsuhvu/nmxiZ47m78tIzq4+BToCZCfruyyKyWKqfgZFy7ze
         zM1A==
X-Forwarded-Encrypted: i=1; AKwUvByFAB307eFsqSTueK4Tbh/63ulgI19LFOCcTVfy8IwjqcmRfIZZBPrO5ltU0Q07ZOGC7cskU85f+FXnuGE=@vger.kernel.org
X-Gm-Message-State: AFuF++mvWXF8Dqlg4fc6P1+bG92ljbmOxIB0xGRhBIuGCaohBVmxYiLp
	NvKBNPjDTouyuEd7i6lBZ4uUDltuiI7DRjhqUpPv4cnBJahoHbdWvWFZ
X-Gm-Gg: AYBFou107oo2LzfSR8bfUpiAnkYqSxv2iJLVoovIqbyedKuQAfRJgABG7P+UATj5RUG
	77cGxjJEiT/Wo+GgftelxL7BNsSeTI9+QAIrryGEx2Ubhi0cJi3oltSs9GkjAcOOeDff97LUBjP
	lRgRBCitxq7O8kYb5PywKPOAZ+DFsa4KBPpBe60eB/hvQXwUMLh2tw80m/2m2rGaLmjL7prl75M
	uOcZugf4OLSn/d9SUGBvYx6kN19ClByBw5Pi/hC1oUsPRWazYDA4BTGGOkJwCrFI0xWtJJVCBBS
	o07zeY87OHsAqKc4J82z8Y3B62R4xkNiYUY3McmrDWig97xQ9xS8YSVmnpOyfx6O3DUs2hWYwAU
	RUlEj0JTKnXktlaoY1yBIBamBDSYAeGd/hDVGEwM5XeB30P9YpggOKVVS5NUWCTtY/DuV7GO4b/
	28Sdhtv2NQwTsgZbqhmwcQPZojbW3iZTSniVZ+d61d37IE1CghiRwsPkZy8CVK6jBJF4GR1l5rY
	rL+0Tx9QME=
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr482494a91.19.1790066603666;
        Tue, 22 Sep 2026 01:43:23 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:23 -0700 (PDT)
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
Subject: [PATCH v7 1/9] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Tue, 22 Sep 2026 16:42:48 +0800
Message-ID: <20260922084256.1515554-2-chenwandun1@gmail.com>
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
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a590db7687c8..991657b2465f 100644
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

