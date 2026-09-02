Received: from mail-pz2-f11.google.com (mail-pz2-f11.google.com [74.125.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CA03EC81F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334412; cv=none; b=o2uX2tUYw1oQKPaw9NBxdaiEp8SdTeb9yPWtKT392P5LYF28782+QDda/UuaSrZFUuEzHrzy9vnemp2PmpeQ8+NMZVcXZInhCccyZD+jReoeNDLpWBTixW4r/zKvM+62+a7YIgYSaTQdyl7U/pPj9GESONs7Ye/SwK+hEZ5II5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334412; c=relaxed/simple;
	bh=rOduSQdWEUvuONTVSGKgP+5LCjrhss6DGwsRFOyVRP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgv/uCsRvJLAAIsZqOPWoXpfGI4jyL1pLW0FPI6zsUTzfqSo4oR27jfpy0C88aWphL4A996IQN94NkGvSjWOkPXBeDgrSNC8TwGi8bIa7Tr7Kw0RJlQPJan1EyYFcpAbn/+sevsquZ0DeQe/oUGMc1k2uN12BrVJO4ytHwVgack=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ucw+UQ8J; arc=none smtp.client-ip=74.125.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ucw+UQ8J"
Received: by mail-pz2-f11.google.com with SMTP id 41be03b00d2f7-cc1c2963c92so225102a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334410; x=1788939210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=;
        b=Ucw+UQ8J2qvYv5RHQdpyzP0QCqBRIGM7bK/tIaVDFK4ewVkCnxIK3RCqOWMN6TpQ6r
         Srt7V5l/jmw68tJ3tbP3QHejGvV/2msYtOPVXPiO/xuVXJCc6KouVNMWMgZ3v9vuA7Nb
         YxHuGf4lQ2QOWRFtw7J3kJ/TINUOPMhfZhMZKKYzbPzQpCyASxT1SEuWtdf02WL6EF2e
         aiGLUpbDJGOPRuuqLC+IWbnGFdw5gxwa7FZBDEUwmu9OPvQWEn4r1zIRmjuwIRcGZTwN
         bsYBV0+BhPFJfK5aZZEnLlijUammx+YmG5HUVVH/SKNU8GJuqjpjock6GRog/X2CPYl+
         u5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334410; x=1788939210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlegJqwkFPej4fFKCV2MAr7wlJV+QNtxUfZHapDGJcw=;
        b=WSwVWdeeeGPhMw5T843NNwyUgeXjGeXvOKwd3Ez99vfvcYuh/l+XVPxWVxMWablxA0
         Zpu0wDwYpoSzFC2C6LLMQEvb8odrSVPiiiICDZjbjdp8PMgLTqx8rMQf/44EWk84x2sC
         dQCPLU0K57uzvlV1CwXbl0wbYHa6nyfz9N6Y0mbUiyz29K2qXX8QJe+89A8XDroz+pQJ
         HmRpGZj2NsPhT0KEW606rgLEg3sgNLF647/h61eoLnpWt8s2GXncSzdyBMp6K7yfM9iV
         9UOGTst6+PDcwNq0WIsIXt61hzpWBiZANBFnfmMC58UmM8SJZPGqapXMzmG/Ubm0Q7xF
         4V3w==
X-Forwarded-Encrypted: i=1; AKwUvByppgDWbkjqAErc+1U8pGyEA0fMk5VmenyetJZ+71GSzs/qhRPodZryEQP0siYO+qlHss0/XGoBoWptARc=@vger.kernel.org
X-Gm-Message-State: AFuF++mkYjJ5ffUeAfuoxnk8RvjCWAAcef4so131/GyFUTqtJ3MHh3mW
	vqNHomTr0nvjHu9WFZxSPNNWKL+b3crI4U+ENWldZCjgrSKestMFWWrj
X-Gm-Gg: AYBFou0vyXv77jhq5wKJ0BnM1cJdeF4fny4BTWlPG1FTXvovPurKlIktvDQlL16V0dr
	K/mDqAYXxyKp407UitUlkMttfXgdXct36CBOMKo2C9pfh61DQo6bBWjNYKq5NX1+zlvDL7Lk0Tv
	YONA1d6XRoOUyYB4LO3DJmuGcA4+lkS+DDuD5U1sJwfIs/IZoKOtBlF1VFvb5lTUyPuYSQKcNAg
	K42i+c/jGKdfhjRFGrlEc36E98aMfdqQOUN1FGRTfgyjHRaYcyPtxvg5bldNWjj6XdAgk1p8Tcz
	YIHWsSuqJn0JJiI2UzcdQhYRe9gpuNg3Ai3i2DYzxZBoKMknxaBnEtS1FTfk99JLoMQoCOBCP+T
	UOkYa3a9UlRdc1FWnU17rFETcL699Q6dtSa9AQMBv3rioqNRawAJLyEkAIA+d7lTEWzK02/jAxO
	ESGe2/stFz7bjwNehSOALGmmX/dPUxv1ILltgQ3T5+SFstuLJlDrRUgFumnQhAWzLG0aVmoJBH
X-Received: by 2002:a05:6a00:4408:b0:857:4dea:e2fe with SMTP id d2e1a72fcca58-85ed8ed8414mr5132871b3a.13.1788334410213;
        Wed, 02 Sep 2026 00:33:30 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:28 -0700 (PDT)
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
Subject: [PATCH v6 09/10] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Wed,  2 Sep 2026 15:31:15 +0800
Message-ID: <20260902073116.802752-10-chenwandun1@gmail.com>
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

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
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

