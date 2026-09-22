Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F952BE5C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066617; cv=none; b=FPjO4CTmSUDb9QWsKIx7623Ccp6MmmK3d2ZovUwr5Fp77sVNd3Gp+Np/bl7hZ5OqOnmNuOt8JCgVDobeSlnFlQIV0V/ebZu5NaS6GLimlrQGiMGrqk6+GaklHSBVxwI1sPs9dOu46ySNo7Ew9ixCdfE1kcMbHZ4N9fc9cquPQmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066617; c=relaxed/simple;
	bh=U5xkLdotgOqJj2n1qVMunZQPDE+jK8kLYOyJiOWwvzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I94hB30iDUnlsrKwSh8qHOM4Sp3z/b15Hd9CVIPB8PW3GNN9ThxvnNVvtJga0zIdjTIbEfkKTUt2pXM3i9RRb27a6l/HD1Jb7vbWRIzBAvreI41QRLYTcYk35VNaJPqsIdszBpHMl1Aaxy7ISdab2mkM1T2n4bUYc5BFany4oQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA9y0Bl0; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA9y0Bl0"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d903e972efso19330985ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066615; x=1790671415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnVDZ+yI4npNCIQQqlxZwSFoW6YUe6LE24tWXfIE9sY=;
        b=MA9y0Bl05TcYEw4+86oxQDDBrdmob72BPiIag/UWGaXu1P1Avrg3Rv3hGHmwyx4CPC
         Z25KcrsQvTj/AY0V/cyUH0z9j+aR8TH9fjuFeeZIxU8OsuYE49gGashBhkMlLuOcTqLD
         ClBfBTq9+Hw9uZPQLdHM/z9M0XYtvDPBu6ssmu79eq92RnbsU09kfYsaZ1BLtqd1Gie4
         JZ4dPhXP2b4uNIdjtNnBPiI2aFzqb1U+wHijm8baDPuDjyjb3Ot8mXtCDQq9cE71AKBc
         aQyiMaGi7GdC9x/Aw5Dmj71nQ31U1jrnMWKPFH+q9+V9JOtjzrzNjfZ4JRhr5tqryQRO
         u94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066615; x=1790671415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnVDZ+yI4npNCIQQqlxZwSFoW6YUe6LE24tWXfIE9sY=;
        b=bB4Q1CZnxhr9a62AnaMjkv7rUCSINM5OaBSVCV5DQiuhJPBUQFRqMnZr7h5NGB6+Rb
         44184vVdPh+lMqWfOz8wN7YXcpM7sfNZJ2fGGcz0jYCxqIG/1PJv836ZMk351Zyxuu5C
         OJX0Un0hIKMm2f+vX0rX33fy1nvI1Q/GcrfkZ2SAn0BgYHuidDatLOl6bHmrV2nFfWiW
         TwsUAmr8BLdhyP+GzDio+H0nbrVFGQ/yOa4l8Njt53ZXRlRuHX7lrOd4/I8Fh1sSc9WD
         cx2CtkrXv/miqqvCNC57bwTLVeB5B2a1ObdJSq9h0PfVXhU6n14NVJ+AHvWhBTZ1hFhh
         jsjw==
X-Forwarded-Encrypted: i=1; AKwUvByKrTIqGUA7IdLB2qnIInVYUrB+3+GVSUGpFNV+as/s6BnMqk0GtrJKjvGQkxwAahseoIMei3M54FwAEcg=@vger.kernel.org
X-Gm-Message-State: AFuF++m/C379l+r/hgYuw+t91AItqvW0+jd7e0Vqoh2GnD+iuaymv6rR
	FX2PQRcM5FPQQ1GQW/4M8B8sEOvrB/6U/d8PqV3CvaLrQu4t9F0WSmPd
X-Gm-Gg: AYBFou38vstK2rgtXVgOIZZoSm4Zo9KsTM5AqZp6uWVr7NuCfSaBVNHuEzLzYbpJvPs
	xEerql2F88LYY4/nqadbena8QtTklo9KgOafdH1let61i3vlpZrRMaRWu2pOflcNSN9czQhOUzr
	CspxNRuBPNzC07gjMMhCAB6dof6ZHWbfcJhQrz2npDsUwSxWk0WYBpgcZ+MPzLaSWfQSZdzqeKf
	UpI1x3ON0gaqPXArDwfJhzTcCD8YXU9jSarrA6XeivHXLY1S9I9zzblDa1ci0nhzvjOWUlumHzZ
	s3SB6T+yW8fESS6gRzWSqyAJl4J67VEWJdILQm5JUn496X/loRNXBbWB9IU2ZJ6OFFTQizvtjFh
	0MhP3Sgt3hMgvcs6qtHPB3QrxcY50AQLrvQVkzaLQiioSWqDaUZG5VmafTpkE5/p/gBec7sIBij
	v01bqzDQ/r0Y4OYSacCnhPj01V1CMYash86SoK/ud5VCoPNotPiZWgrzoAUSZKQLmQJY252BWb6
	YsLiYC+ymsbA3oPTEX2LQ==
X-Received: by 2002:a17:90b:1a88:b0:39e:252:ae4d with SMTP id 98e67ed59e1d1-3a073112d3bmr471304a91.17.1790066615322;
        Tue, 22 Sep 2026 01:43:35 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:34 -0700 (PDT)
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
Subject: [PATCH v7 2/9] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Tue, 22 Sep 2026 16:42:49 +0800
Message-ID: <20260922084256.1515554-3-chenwandun1@gmail.com>
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

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 25 +++++++++++++++++--
 4 files changed, 23 insertions(+), 84 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 854d872dfd0f..34d944d3f22f 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
-#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
@@ -39,34 +38,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-#ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-#endif
-
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
  * valid locations, this function will undo changes to the image and return non
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5412aa9f3568..481b8f906a56 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -13,7 +13,6 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/kexec.h>
-#include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -56,32 +55,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	int nr_ranges = 2; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 /*
  * Add the "mem=size@start" command line parameter to command line, indicating the
  * memory region the new kernel can use to boot into.
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 808e872f4063..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	u64 i;
-	phys_addr_t start, end;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf899..d201638d11f3 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,29 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
-unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
-int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+unsigned int __weak arch_get_system_nr_ranges(void)
+{
+	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
+	return nr_ranges;
+}
+
+int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+	return 0;
+}
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0

