Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D63B05AB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131405; cv=none; b=ojHJEwjlPIdiltBesz+zjPeqwYh1gHaJ30nPiTFpzlMehph2UzpzugeCCVj5SjHv5b3aHMYJ2BgYseJFN3+vmJXT5CAejL2wdLtlI57T6W+4eExB1OeU3WIHH/W/q2LH4ydEVaOKPKr2eBGR1Fl087auwfX+2ikAQuaM8WZAthw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131405; c=relaxed/simple;
	bh=zTdr4+6jkFuMQZOXbyFEnwK8Laq/5ftS584CszA5hkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQnklt+RJDsvCV2Dg97EX7mDelEDYvwTaPwCM5QNUqwKgxBzqChDZwMrssZidvKvxaEFHONshnRLv9i4BQDxxMwx4CBaM1SgS917TBV4lh7q4dc509K07aBM1bzb75BJGxeN9gOfPNFZ3KmlAihmekKoEIezyesFXwAzBj5GDDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJMXsrdL; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJMXsrdL"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-ccb794ce92fso507503a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131403; x=1792736203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=JJMXsrdLto5mE0dbf9vxWQRtWCrqEopCJLZnmsjBKZuvGbciaTGbwIH0qDB0fgxc2Q
         +G8+NFQe4PFYN3iGg8NjBwmz5O26a9Srbu5Ymek8lnONO9mSYAPozwa67b53/N4LeNsW
         lddiFF6m1ChEhonujoHYzNKz9TMpwB+zQtP/+AzgY3wsPHfRZNHtxbxmBFwZ2Y/rXnXY
         HjQ3YvnpdtAnR8oCe4P1z5wfbB9MLWFm3BXTwDub0ZkxbVxNxkOUww8LzF21pwHLzVn/
         FHEZ1gjuEwvAWeiVH8YSas58nMXMwXP4J9uYhKDcE0BsNpXRJFla40APoJJUTfuwD4by
         1Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131403; x=1792736203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=t9wzNew1A5gwZBOjBjcArLKt2Jfmb8xHmlYYBytiUqwjqSV/09dxRn6r4i/BFg7GeR
         YmV7F8KvsKGuHg5cfBiV8g/hC3obedWCKtvtsNqm4tmQf4x3jRSRpWU3xLOAfiNSc7+M
         NK8VxtaMZHzhF80dL6rX0aI+lVqFz7KIVT+17/mqQ0RTiKnibLX9TXQFMlU3zJO1t8GI
         YXRTUKnSRpvIbm96LbTaySzMSdcl4fBu3RLvhem8OA/+3AGpQVEnu8bfEWeA6UzVULOa
         Ddw1H+CHHfXk+u4fj4IMIS9hAeUWZqe2PQEclOTAOZqi0HHPa4OlheLAssuGp+IBtkAb
         cRCQ==
X-Forwarded-Encrypted: i=1; AKwUvBycbhdNRIaCNwjMdNi87lIb+wnpPwJ9BMKhXLnm12L9/2IeHpautqH2pVORkxdgRJpzybW1cXnar76dyqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJULP0Zr/Qxg3PFzt2NH5zxp3FH2dAmC48nnzXHxLy+n2mnBe3J
	J7FCoo/FbiMzxXkJ8K7Ks+GBC/6WMvYeCeA5MMgACE83mij/fiuLX3sH
X-Gm-Gg: AYBFou1525VOreXqSAbXlLhO8pJSfMGOAC3FAYLN+bSDe9MOaue3BUB2m7o2EJ7wm7/
	Gsk1ai5Cq8Bt5mBQqiTCnwBRuHaM+arOJAOLoAttGCfQOfE8SyKXPVw135s0MmSHLHPbiNMJy89
	D2iZmrpZ2qn7dFws7isENpGfrWn2WhuDPi643WvLy7BXinM9RecPlgp85LE8fLX7hPTaTABRsJD
	jsWaaeuHT6CsS5NbuE3zpmtBoG5u/ecNV9O6Zr3r7wPHA8GjCwr4DWCNRynnw+vVldz/sR9e14g
	CtviU76TRCt4+t2B2fzvTEiNb1oDKM29viEUFjOLj+nNCeqmclNh8rMH974zB8N8prAlm+mINYL
	L/6OoGTIHVAPMwL1cHLcT5w7EFL1P7PHmsYzQtoPWBYHlxzCOiu3vtLnBCbXpyA1t9v7ZdPkXNQ
	ihJIxCuSA14B7GhnSS7LxfTxqmKbQ20nM2HbvcOYMjZ35ue81j3gTJe4I/6PXfmzrwSiXPDTget
	WpSLgmlmk8=
X-Received: by 2002:a05:6a00:2e87:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-897c6a340eamr18515355b3a.23.1792131403430;
        Thu, 15 Oct 2026 23:16:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:42 -0700 (PDT)
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
Subject: [RESEND PATCH v8 3/8] crash_core: serialize crash header preparation against hotplug
Date: Fri, 16 Oct 2026 14:15:44 +0800
Message-ID: <20261016061549.4181390-4-chenwandun1@gmail.com>
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

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the same
two-pass operation over system RAM resources. Concurrent memory hotplug
can change range source between the two walks and make the populate
pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86/riscv memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/kernel/crash.c  |  2 +-
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
index fe5a4b306aae..ac8df2edf2a7 100644
--- a/arch/riscv/kernel/crash.c
+++ b/arch/riscv/kernel/crash.c
@@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..bef008a0cb22 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index faa0f22dbb41..8a861a946e26 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0

