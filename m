Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571444;
	b=A4TZ4PUD02R2f2DD3I+OkdXg9pE4tfarVApQwVqDay71bC7tQ858n0r1Axjj4gZ2RKRS
	 fL5AZtKT6/oAr+zqrmxwftPaeuK82xt7Wq/6SQxMJmbXsKQwes2PVG4xKSuf+rUiKxMqo
	 ihIviHKIywiC+MzccUN8ChJAz8gerrFWQ81IXdVfVHgG4N0Baph8CpVk1Tr+DYRU1Ir1p
	 85XULli+fYctucni41h2BbA4qZLfyYO+gZ5pXPq6Wrq0Zz7HsmJu75jHKMTVe9hTAckKx
	 illAuLtCU3U3LvNcQMlkn8Vjzh6lNWiXIVxXVNDRO4pi1skJSz2TMODlA5RIGTkDNIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
	b=l7sZ5a8KDENQSP7VIqFAS/dPbXhUeEn/fWSnBNSolletoDT5yv3uoBsjP0/K580YCpmT
	 pjXNA+YnmewriDsar5uS5rL3fNfuc9x9yM4x45lkz+KE1u/wSAx6LTBuJDyP70NP/xxJc
	 pkYYpL3GwfTSicgHLyJYwxfpyZiwFJHEn57DpZ5xm2jGK0FqwZc3ZSb5b0+LDuqzlFrd6
	 /x2HBPK3+qxlkhXPsewsD3JD3wdXNuuY1FF4fYdZ69HjDSrRpIFa7wdcoVfqTMlWnWLLi
	 WusJJx6vK8VxMcXwOetv4n0qwT/jaRRabLb4slGiJSq4EPb9lnyGY2mofkFKoGOywbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dJN8jm8g;
	arc=none smtp.remote-ip=74.125.228.1
Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A583606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A583606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dJN8jm8g
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so54353a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571443; x=1793176243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=dJN8jm8gC6uvtFqcLz2yDxU6q38TRCAdCwzoscnl+PGv70L/XtyT4Xhe7+v2BJ51oU
         AMbaoPGeDta9rp0TrqaOposmKBfxeq62sFIasbhZ1rlBJ2ELa5hebQH8O2p+Sea0q8Mw
         THuo6eJAGtzQAdT5yfWa1Lu+ycbHRqFs0YLltZt9S78hts0IZVeuWyORCkQbR8tczP6u
         ZihoCrQGzJj6UWJU3WLQrIyypfDVghflugwaNpTLDw0k8EycPQHDW12sKpM9WJYn3zYX
         FYEx8JN/tnQi6cWdpVQwxI9OwYph+LKm8Ww2ZehApcwoB5/6KvDATpyxV8xb5CUmUSgp
         p57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571443; x=1793176243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e9/qG3hNPJNIGpwptQDGRFtRM3jaRgB/Z0bZ0bWRF/Y=;
        b=hdJtS2x5q8iKCmHwM87RuHxTbD3BOrOl1vz0NTWwf5jvy+mf27yDU2feEh2W9mCCnA
         NHMax4SeXuvCkGDWD1nS11wh1/bFmLBCKs8Zunh15FDcgQE5RDa6unt9HDLRDo8/+Rl2
         BhfDgPsTdaDWOBnvMS9owp0oQ6zHsJLzON1k1s70jMsYMU8JA6oWRFJV5piSK1yixofi
         sIxOt43NfYWRny4GwFVq7w3Gi54O9Sh4qMZ9P09YYnHVJ20dDcIQQbqiPjA9ILg9RtX9
         xDXRsMpYRZd2f9cLYHlcbAFrJukLkq9L0EWUm5HfS9RRY0TNy2UUVx+xufb8XgOQ0/TO
         x/uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwQXWRqtOldz0Vk4ndCUyZyaZp0fMC2NBEyyisQz7+P4qzKFAMV4OJMjf1XdRXaFqsErF38Ht4cQSdrZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZf/iMiSSEpssBjKyCZUAN9/AaeHsN4Sy3byyL+/t19bK+Dt6o
	r4IIfJeDsgPM5NEKkQ7xyVtVmWqLiRoavFlORbLxDjKSgQrkBvCnTWPK
X-Gm-Gg: AYBFou3m3yjxmcZ8U+zqmVuh4zka24KRMJArZIMdkUI+NzWV2AOYq/n0og4nWubQc+9
	gV97aoIFTiya3diUvxcEDR4AT5XetHVdRo+ZhUMOBrWXDcyqWw08dycfARplVNaopYpzWmvDxuH
	SZi9/y52t+5zJTPTvq1qkCt3mOpDAcRGnZWqbia3A3Y0QnGy+GD6TCIQmb38sMDB+2To8mDVUIa
	LRN4njzeDVSD9DBoS9uZxsi1OvS98NGP9X8co3ZSBv/ZvvKDRwH+jtspttqi+896g/uWQGzoOaQ
	zkRt94rfabYgJJ66/QY3/251wWDwwD2Fit9NVW4ffnU7BOU2leHAFWkYxGiDP8bbmJSNeZxUtAP
	6oQsi/jufcaNf45erEmwxuBXk0kY4pydKStI/pQuzWzL9GgdwWATdwqnxNkcMgRAPGAj3uT0HMH
	QCSKgqMmpCOiuAVMET6DSfWqSJZ3kcQ2T9xnXxvFv1c5ZQImLGdBSUTAJ4zIXPC9yKA0p699azP
	E9Oz69GHdoa0d3Zgyi9Oy0zzwH0As0wrZjcSIC27NThl58Y1ThzORREcL3e8wSfqeX7
X-Received: by 2002:a05:6a00:a204:b0:874:708d:b620 with SMTP id d2e1a72fcca58-8a089d13a97mr1238939b3a.30.1792571443298;
        Wed, 21 Oct 2026 01:30:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:42 -0700 (PDT)
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
Subject: [PATCH v9 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Wed, 21 Oct 2026 16:30:04 +0800
Message-ID: <20261021083011.2170525-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
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
index e7891a2a89da..e21d0bab77ee 100644
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

