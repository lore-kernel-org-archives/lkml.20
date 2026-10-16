Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB2382F08
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120179; cv=none; b=jCWzDCp4xgucv2yEUCtBdDsyEGpJDqHYmgUnUd4Xbq9wowlXqThr6LNrPOID72ikkzPixlSQHuISQRsByR5zoPGf/syjz7fnPGyO3CrJg8Q/cHLvV5sTaSXKBf3NIziUeeR+NZ3uuCmm2jqXy2Hhh4k5POd+/v8iPqqWaqKM8zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120179; c=relaxed/simple;
	bh=XLWTvyCPrvBH6IrX2SQmS/lbWi/l2CNUS/x21NzD+5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEV9yA2Ocb07P/QAhWQExvDTkTDQ/p7XllurzHmpomIX3MBnsEns81fbXp+FxNGgtOc9N/BSoMnNwqMSfvGa4WtL0gu7UK/Z+eBicf3l/8B1a+nIyma9S+a0z3061Eb++S0DX3GI4xMsMIp2O2TS/X53reQnp6fuosHBFFn9xsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihnwX++U; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihnwX++U"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so2657610a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120177; x=1792724977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=ihnwX++UakwOqrARHN/+OMyJhdokfBpbCerYDy/AUM2PQQLySqaD+gv5qas9N52eH1
         pTdFJIBbFIdxBfS+6GDpGfa5NuFMaQRqAlu08g2Wo6ujMvdNfFiFO/GEBY0/BrZLBh5v
         jmTQw88Er8TLxJ1I1X6IyVoQYsx63U6gTd/0EEO+jT7l2vn7W0AUS876F8T2wyCOxY2S
         vCNsv0ZpCFJi99Qs4doSOLcxnJk+pT1YYqj2gJMWr0DUSrYSEgE97modVwl4eJ1ijr5G
         0Fx8l5MLDMp1f5F0/2Nf0hhhOidge7Dt6WNt21T1Po/bgvYAHBmOichFCCvpHokf+Krr
         FWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120177; x=1792724977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChIsG9Vgmjf7e0EG0U79egn378mU9W7gdCp3fG4lF2s=;
        b=LzRTNaHZM1EjaYqmNaRfPHYm5q2t94BOjUbpA/BRzdOXDJSU0+w/a/B9B5WxsPitM0
         CrJcfpSA1GWIr4/6Vfm+f0fRxnc4fs9vGUpe6SXdwcrIJMuWynC8eB9LTLsecTuuAvtT
         wsFcmRp8V8p0H1+/ZC5FymcjA0flI9EW9JL9a8duA3UWTeT7jPgzfNwIEqNdG/pSnBEW
         9foaAwkYpnHmI3a9iSNd7maFt2p94DBiplyYPLdZN3Qqt1CvWbiPqo6ltVbQmKksLjxX
         z4WFb5SY9D+kOyMWxLdxY/4f1NvvGDWaDqeUk3oia3lYe3RAMCLfdIVvcXrkY2IzOrWV
         r6Qw==
X-Forwarded-Encrypted: i=1; AKwUvBy1ilgAgFuwCVORE/XtHeSDk5s5Qdr0K1HIA2d5lszVSdqHGOi8egla6qQjsbs+dzcLDvlI2S2I8s6ZsWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBnDser2ZzUIPsICY34CuMrtd6U2TFL3UvCyrQ9Uvwd5LV+mu2
	kwuIB+M4fTeNe2PM/1XV/0SlK87VQAliVJZRc2x52Z4mEUf/4pqTA0Zo
X-Gm-Gg: AYBFou3kxKlGu4WWInJ/+lXVUeylnDbU8zkmoqxzYmdJUeNvCnpvB6hqxRQW2YKvhSN
	+sPplP0igjJ+82JfLNvyAB7zRU1k7L1+xmrDzrSnFG6+PpAwNIwyhYvLohagSWWNITaAbZEKYRU
	TQC9ErjqfTAT4xZytlfJ0FgSRbkE8c89bO+Yn4I4LsKdkCCAuY9dD/Q9LgAhF5Jfo45VPj7r1ns
	CnyasLnKAmPqVX3qq5bty75oi8U3mmBZmEEc/YKuz/HTAzRl/xVMiAKWHmsHjGLkHUR3DdlN7g1
	cXGBrAuXbvzHUUFS7RVkhS+A2n8jnOWXKz61cdxUn0f62zmj71X2usgVfaiIubEJStPW+wGDEs+
	ax00JIwZ0hpyPO2944+O0tJeJidZY+TjG8Lpim2DVs8Hf6jFaruMiScav2xLpiJISSFF9N1UgCs
	qAkTTXyz9CASJwsNUi0nZH9f1kT5lB1tjqkArDCKq0AvbxkD3OWrTs6vbz0Fw0bj7BQQwQvs3/K
	WyIcib4Ueg=
X-Received: by 2002:a17:90b:3c0d:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3abb39f450amr14169913a91.11.1792120177160;
        Thu, 15 Oct 2026 20:09:37 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:09:36 -0700 (PDT)
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
Subject: [PATCH v8 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 16 Oct 2026 11:08:49 +0800
Message-ID: <20261016030855.4062882-3-chenwandun1@gmail.com>
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
 kernel/crash_core.c                        | 27 ++++++++++++++++++++
 4 files changed, 27 insertions(+), 82 deletions(-)

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
index d0bd2d0cf899..faa0f22dbb41 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,35 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
+#ifdef CONFIG_ARCH_KEEP_MEMBLOCK
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
+#else
 unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+#endif
+
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0

