Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9753E0241
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334398; cv=none; b=gI+xQmPujc7FkiU3Cj13EphyjBqAWkV0wqI9/c+ylrTsV6YUxvnOnLcTcbxqS8jPT825Zx6Ed74lmXQZPipu1QFAsoRmPYk7TJLHsdQB1Xb3ZH548JaMkAsgCoT2aXAHFtydDeCRxXYBiiSUDeTsFLeHugPS3Lh0aF/CE0tM+Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334398; c=relaxed/simple;
	bh=LdiDKcxoqOK6v7YCmPqCiMeNyxA1ek7PYiNAuO0m/sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xz+rzbxm98aKNBs4m0AynJzb5tHMwCSAaAhjrr3Yu+H57GwWdtEY3DlMVSQAzhUIoKy5AcDpCbl9WjjsIDlqT1HGtQ261YMCYimJrLpVvQhLsODboEMxZMHtJ6068Ya74CKCicjfiZn2xu0opKboiED/+orkGXIP2BuIxpseO1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1Uu0CaT; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1Uu0CaT"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso440133a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334397; x=1788939197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTBZpbSvsidLVDHHiShy9f+wnGid6sRS2qRO19KqwKw=;
        b=k1Uu0CaTQQoNIKgE107gAXwujbBTJeuT6Ry5xh985OJF2njz5Zhxr3/0XAMn9Uw0SM
         LWEb07ukzcB1d1KewKWd8ppvsi+FyjRphUz1ZRa4c81LB7dnEN7+Ll2FGuFt3l4Yak0n
         57lfBI9pEpIH1ZuEdH4uL3oN09GEg1sg7zo9xHO0uCG/iEwE1U+nsVeNDu2GF+qsJaLJ
         jZrtAy+JxQ3LDe+sHZa7Oqp7tWirdBAsJs1Td28y0V4e+vbXO2A6NwFPbvGdBa9rfJfq
         ddnBLuIFF5JwwnrP/UvC6aMLg4uE7p6EFflWn86mvuyFeNs1PHNoNXdq6TcF3sBWLKy5
         SotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334397; x=1788939197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTBZpbSvsidLVDHHiShy9f+wnGid6sRS2qRO19KqwKw=;
        b=crVZGGFnynlFTsJzZeisktpvzeonVIkfAleAuFbFGHGKoW9C0/rVxMxn5tqvF54FjE
         WxXJes0CZCOlRqA8bL1TVjOoEtwCEaSCcaZZOjG7G1r0ppOSdgaN+jzS7s8zHNcyOYv+
         UcQDWKYYPYAbgrOcmw+l0IQR4igjHbeqXZ86VX6oxcR+Z0ehSMk+KOhfHkP8jwIOfaxi
         g0E5OV6HVZ43h/kF4KRNnCWkMTXJTMSVBkUyIFFCvmqAs+ZuFiGG1LdHF1iz6jFB/ZLT
         HQMX9HQtMn8GKBp+NqOwIHfCCW5L3dvG8mQkECaOGIUNPHcnIAsj8abFT7z5xBp7jzEr
         /bAA==
X-Forwarded-Encrypted: i=1; AKwUvByD71zt8sJDb6ZCo4JEPCV5E1ZxiinAhFV4FpOz2NmL0I4/dH6dt+82n1/VBKKE1JaoVx7n/HqkEyNZxVU=@vger.kernel.org
X-Gm-Message-State: AFuF++ndO0HhscO2x+QVJzpzXjtEJFnfzCjSbcR2MwrRL3gKL9B/gwc0
	NgEiECuAF4uIuSydErCqqykGZVxrEhgZehurzOGG3bf8/i/FqYHct3dN
X-Gm-Gg: AYBFou3WlpV7GmMyW6bu8YUA/QF8bL4/EueOg7YW+hc6TFK7pbczklWKEeuKmKzIYNh
	kR9bCrMC12BrMEdTV940zkMc8L8Ugod3jr3aKvi4T/AfmIEN57J/FGo22QevBPr0teQmYXcAXru
	WXb0DroM9css7/bLI2czSFXolQJGpZfFx3GwZziORoj9Co+cYmTU56NQPiGLoj7q4Z9w62YkZ3O
	Rcmnhmi/AHVItB5+bTMiF7Fm1m7DgD3RVB9+RJvvywErl9Dx4wdEJP8lnMFJ2aO+JmeToI/zqLX
	1pVRpo6dAu50pvuf//BwMPeAB/+WOvIPVAa3WmkOSlaUnUNnsk5JDryEarluBS7m8JeLV0jhbmv
	k37QmwIwqYZAczFJkoX8k2OELxmCkDkbrq9q5OMBLCVJLHQyw+yqjjcFX4v5r57tsn27L2KUBtO
	WQZ49mki1/gEyydz/+08l6C0gFBMqGDoyCTbYYmo+WdsJ+J/Ao5AER6B+q/edhZrQMFZ+dcCOcc
	r0LUpyGBqM=
X-Received: by 2002:a05:6a00:4f83:b0:857:72f8:dc99 with SMTP id d2e1a72fcca58-85ed8fd714cmr4354975b3a.26.1788334396619;
        Wed, 02 Sep 2026 00:33:16 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:14 -0700 (PDT)
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
Subject: [PATCH v6 08/10] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Wed,  2 Sep 2026 15:31:14 +0800
Message-ID: <20260902073116.802752-9-chenwandun1@gmail.com>
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

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
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

