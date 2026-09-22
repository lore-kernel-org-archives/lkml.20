Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3BB5304DF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066692; cv=none; b=SQ9ymsYsAna6jfxAG0RFdPpVqMeAFZPdAw2XJ90jep0hVD1NDZONL3fqx84ebkjtDQH/qUJjsG5WtLsUnwUWQIBWJJ4kfc/nTIpi4OKMNSerrMzmff7dHbfxwD87+mQw/DbPwTN3KT6tBNbzAbV9j/0f4jNLQf1UvtOqVUfOh/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066692; c=relaxed/simple;
	bh=vMAX5brBzncYCW3D+6UFt88v8II7ELfiaKipSUvadDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8SKwZ5Hi6kY8QbrCRA9bUGwK+ZKDhQtCLAYLoBFIYoqJdY4fgbKi7C3MI+hj/ezQZybmBX8vHQP/UGslFXnd51p93Oz/+T9zkECQ5DHrhZsvdhBijJbjSJTSKbebZ7eggQITV9RADaPoPGaYkVi7iurNCz9XgohC1ZTHPnNMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/JKfY0Y; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/JKfY0Y"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so1278840a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066690; x=1790671490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=;
        b=K/JKfY0YN7SMNfD9TwUpZDxeEyE48M0YU73DRI4IjUA7tbmdDBgeen708uuransBsy
         HnAz9SaDqWRoQCHOGWO2JEdx2cc6gHh7YYnq1IWmP0h8ZCM2Ub7xcHWbrwSSa/YO8S/S
         +7VzoQCGV2Z4NGoRnr4lVkq5ngPX6mcTs3x9Cfe5Vm4/Y4Ew8MIcYAdZgceOU/Gtz7iN
         x+P3W50Yfu6z/11LjC9jNKBfHhUd2HSeMGS6Kk8QAd28eaK2fipTbFlds79mjQlR4flP
         NXEVYaHLDmlOMRww1UkfkK/2xSV7Cyz5JR19HgLi9kzkZaV9PayC2STzNhYEGDDk/Nj4
         arVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066690; x=1790671490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=;
        b=MnZ1vAm8DC1TqZDLF+F34Qx7mL6rv69jXNjuUfb+kNTWmulJKtWTIG7rsdiXGml3y/
         LxLd6u5z/deuNoxTODEpvKI+294/+bo3wonDfKlVcgDZCSV34mzJoyqSq3gmk6imPt0/
         8lS2W3GiHWga/g+MglO9GUEopPe3F+eY7MuGSdyXVFijefXx+XEmRoCt/WWF4siqgsAu
         8oR4oQRmfYUJJI7b4HlzH3ur4IO8SpvdSttwsj/WNSDtRenU2v4Gno4jS7UApCU3LnHw
         rEXGfTfUaBtf5t9U4PX6w8y5Dpm26H9OomFnhZTgOBtsrNKpD03JPXDd6ks6+Dwt/faK
         SJMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD2NFkS30FOdXUamb4ti2eGrmlZ924fy++/SeatX/NanRpiWAz9duLt5OcOvhTqghUbTrePVog7gZsIv4=@vger.kernel.org
X-Gm-Message-State: AFuF++moeFBAdKEIylso3jCeCRMNOSX+Cek6NxSUG3MA1Ofo7emg2v6I
	jznaKfj0d2ie2r8NIBLCh/AJ9sUKB3hbQpGmegTiVG78b0PRd9cLH6qc
X-Gm-Gg: AYBFou3MRKLbmEA7aiD/ax3CNZo/gBudZXQfzIAZt9eFd9yS5VFlAFpbMlMabe/2jeS
	9ktbwQBV2y2Tb56bhNy1OFAEKKpwbb8gJ/XN8BSEwd3gmOS0fVK0Tnhg+GM+0CVCYLLUj9ZUXlj
	6EQJEq+tT2B7MWaKLrbwCcfVHVag85ALU/TkiWg8Vc5zdZIGjD0PKDOgpkv60XlF9fT/jZcapr5
	YgqbNmy7y07S8yBw3Qgz8Ns0oA4K7vFI335HkvzMse18f08pRUgQy+15KxSjhjwDTJtBvzHiarL
	+zxog9sU+PmlWrhksU1XYpfZwdGuHagEuwDoplNcYfa3VXIrds1f7DqHG1hAWm1TRyTqHSy1ZiR
	7mrSpJ5qrXmmIhAljxy/zU4iyYmti3sQTDr20XLVMa2vDTrI6O5rS8npjYzaZaMlppp1/aPh4G+
	M8Mh+/vEUFZzaFxA2FTaJdq1jRcWr3GHK5bp9ZgwT1fDWnIRjwrdn7Il87fS98MnDMF+dHko7BV
	qYI+Hohc7lGAnIj8Zl03w==
X-Received: by 2002:a17:90b:35c5:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-3a0731f9793mr479077a91.34.1790066690219;
        Tue, 22 Sep 2026 01:44:50 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:49 -0700 (PDT)
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
Subject: [PATCH v7 8/9] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Tue, 22 Sep 2026 16:42:55 +0800
Message-ID: <20260922084256.1515554-9-chenwandun1@gmail.com>
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

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 286fd4db6312..9a727941b5af 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,7 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 	fdt_mark_reserve_mem_nodump();
+	fdt_mark_memreserve_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 505735732c13..6497404ec751 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 void __init fdt_mark_reserve_mem_nodump(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f29a07e8fb23..a42cf6eac55b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+void __init fdt_mark_memreserve_nodump(void)
+{
+	u64 base, size;
+	int n;
+	const void *fdt = initial_boot_params;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		int i;
+
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+
+		for (i = 0; i < reserved_mem_count; i++) {
+			struct reserved_mem *rmem = &reserved_mem[i];
+
+			if (rmem->dumpable &&
+			    base < (u64)rmem->base + (u64)rmem->size &&
+			    (u64)rmem->base < base + size)
+				break;
+		}
+		if (i == reserved_mem_count)
+			memblock_mark_nodump(base, size);
+	}
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
-- 
2.43.0

