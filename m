Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571539;
	b=gCoIWD0Us5p75IaGbSJKRuXHqTX+/qdpAH2S53mbmzqkKD0zIbWIySdsrXgKmgIeslfq
	 FhbbNBjOi659Hm+Hu9Rb5W27BrSq+5xVoAg7BGLToeMiBTxmLxmCSlRotTZKFXlochzu3
	 GsuViYelh5K+/2gYAsL5xuHBEJmc+VpG2qPIHAHEmOfUGTPrbBS5D7nEHoljBV6ay9aBK
	 gXDHV6Pr+7pLAMqQFEBn5dThrCq4Q0BFSS3Jw3WH5hkDu55ogZHiprVgIbbmvXZ9QSLWF
	 XOR+YbuuNrWJbyzuYUoYty69cLC5CPXQOMFnHtYvIANq3sSpqnEvyaSTXzFZ7UQBCSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gUG85+B7KqrDZpPXGb0QyiCfKe+tueHmqLD38rgeJ0Q=;
	b=gGqxKB4rBdw8FgnzjTDM+POxKOIQI65XoDHk2xeh9C32EXg5uMZ8Vsm61BMpBFX9kUvF
	 Ft/Z5VRA+szDJk0iOCsdhhdp78VBluX/IbcHQEwx97hsf9IsKkfOqne+XZYBF2VBLqSD+
	 +lYFV8QtHnLpVA7yau+hd99hOwlju1UTxSFSYN1AN/PEgvR9xMBDOxRBBOwasogs6FXtL
	 HqM1MGm1SYGPVk7cWlxYHZhRjG9xTUj5vG1oNIeMOE2HYPVU5ScN0DNFUfjKcnd0JZohD
	 g++oAymwSRM+fK1mAghcNT1hnWMEwBJjguvIaelFNDP6O9u3ceI2vCW5ZOsw4YmNLJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gEL9sIZw;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957D960A2621
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 957D960A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gEL9sIZw
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd65a511e43so163626a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571539; x=1793176339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUG85+B7KqrDZpPXGb0QyiCfKe+tueHmqLD38rgeJ0Q=;
        b=gEL9sIZwgFMUDSnky3+nlBl4QfvJFOrw9F/YXqQhpMXKIXCR96RJS5rnha1nzR7rXC
         U5dV2v/oJ3d+oK0YJ9o/THAyPFsxcfZy7k9XeeGsGqXSchTXTj3Oqiz/6c3jbNH5yO75
         G7olI8qXPIJErYa+oBqUAqhXfCir3dHaP9wW4LOyHeifay9GtuE5DuIAJcQ4OWSF2UyZ
         iimPxA+FIVlhlltjAtJ6sSM4b3BKTnzgiNFL9Z3vduXqg5Qo4AYoMA7m6yU+TOshdQTS
         d6Bvg/1cpBiDvTNQR8YXF0RR6Hvz1Z/vnZpXa2wGCZ6/ECdXyIqhwFmvuYqeMdZbIAvQ
         ec0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571539; x=1793176339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUG85+B7KqrDZpPXGb0QyiCfKe+tueHmqLD38rgeJ0Q=;
        b=IETepMsrBmuii5U5EyFF3HxA4HwaG5E9jOEGE/45HMJi6RrVfqDvS9j90O8xGGAUhb
         dpW7JbYHeEWfz8ZGfwx30YGjRKNV+ZbEXQUwQKc4rOYdASuCABvw6F2lY5vUp7sUEYvy
         WxripictoQ7qLnm6h8ELxC/CXwFyfy863P7PC4Aw12Zcf2pL9LIOdt7PlkgdlbfuM1P9
         pjnYcfr9aYGCLk2CdHjnUORJP48P27vg2QLjmvZpjsvIfg1ZYOSeBYk84Z72tOHonJMy
         h2hauBQB2ZSL3Nc8OHdh5WrWJqFICfzDE5qOQ8IbYvNcxHKMwuMjlJX+3wIDBVyhe4pR
         Mh8A==
X-Forwarded-Encrypted: i=1; AKwUvBxCKMIqugjiLu/BipxXrus80AT0fKaEkf2eIMDWK1qFRvUrkxdMT8FXQvTUZ/oI6KwI7VUQZNL15QDdsmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIta8UEHPX91Jq1psWFMkAVbsSLay9v4iuImawQzcDsTTRuU9AA
	ldH1f3eZfSN/JGFPGvM3WqNwU6hhIORW2lcp9Y3Zpc+mqN7BMpW1R38R
X-Gm-Gg: AYBFou0LIPJjoul0aZEu0Hh7tXAQInKCFdo9DFZv0fWB/lyixViELZmPVo3NwAzVwfR
	WjUYE5OpHpBgmvEIKJeJx6Vit2LNd1Wqm833vGXMWUhaf4+Gle4mlW2VgzYfYfv365Bsyzul47J
	ezZZIfPtaji0PMg8DanwrXf1RQ10+eUoNPC1iix1NBXq+dYHV8j3fyT0kyS54+vu3+RbXefQTr0
	/Y4dMe6AzgxKrZT+4GjzmzZ2VruobWhE/p6onHyzfvpDTS3SdqoksySFemPLWruq41979xJS6Uq
	CuNHSCj53KoXL6CF+CnCY47bCi/t1pLmDaa3p5PvKArj2ptcTYXamEBk+fy90Ru8x1PgB+WwrmR
	UGVYJNtI4SqlOz17tu+HlaBUzGKdmTS09VwOrD0BKFUOlcx+gBr9+uL1Ae1nRcLosuOepEgUGc5
	K94p6/6rHKlJRkRYUPRAQwuv8PUOoFk/u3e2e/ZbZViRlPW58X9YUUpy1h4mhTdJj4urGr3zloX
	BDEi6i/ho20l+YwDDWzN4ClwaDWWJaRqcudipY/NbwKXWmMuu+yIpjY3/eVq2ghtfX3
X-Received: by 2002:a05:6a00:a0e:b0:8a0:1435:fda0 with SMTP id d2e1a72fcca58-8a089d4702cmr1201474b3a.51.1792571538862;
        Wed, 21 Oct 2026 01:32:18 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:09 -0700 (PDT)
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
Subject: [PATCH v9 7/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Wed, 21 Oct 2026 16:30:10 +0800
Message-ID: <20261021083011.2170525-8-chenwandun1@gmail.com>
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

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP and either CONFIG_KEXEC_FILE
or CONFIG_CRASH_HOTPLUG, so kernels that do not build or update crash
ELF headers do not pay the cost of splitting memblock.memory entries
at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ecc923102622..a5f223a74b7e 100644
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
index 8c9d6395d6a3..db2bf76000d2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,24 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
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
+	if (!IS_ENABLED(CONFIG_KEXEC_FILE) && !IS_ENABLED(CONFIG_CRASH_HOTPLUG))
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

