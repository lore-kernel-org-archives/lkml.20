Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83F94C225E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331388; cv=none; b=crNnsARI6bJ9UVIvI2rI/tlv8kpRvcm0FvA6OHPZ2DiaTxDHl2d+wH4Ff3ALPHv04ffJ886olL1mi4Eeq2sn/tnBkuio0LB5A2EKnh1vmwBr/RUv8mV/ESM0lMGbIc7OiPuigxU/rFymZqmpyHLIYdugfqg49j12Eqb8Usls6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331388; c=relaxed/simple;
	bh=MI5rNeMwhZ43wprmCG+DEgAxLuM2IMPTCnPCyH9xbeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqgMatEo4NKf0sNJzzAeWw8j8d33gPltsNh7LZ57dfKpdlWOkd6R3qyOCWBounomEfLnaICE8Wyhv0bd87zqlg8Lu1H/jt5fq/rGhy3UZUBCQLijH3RXhgCkGAJBu95SNB/sK/Cu8ilIUwN5NRAkYU32gCyf9pazeJn7BW93JpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqzmN5Zg; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqzmN5Zg"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4086e892a4so151695266b.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331383; x=1792936183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0iP+m3EX5ucikvDp402dsq76Smx73BsFN2IxwK6/bU=;
        b=EqzmN5ZguXXrxRgfMiQuvwrgNp3aYl+s7JPYNRhp2TEmQvuz6/5VSkk5ZRmeRO3gFw
         ErsDvtsdDTrunOsyotzqPXmQSJRiFqbUIS+vHISuVi0DUQlNvx0SkEbdqlmuptYGU9K1
         LOY+8wRkHo9x0g0azzBrWqOyaJvHRkz58vGvihPYW8ne8cTmGmDclJQYmGBbXJS32MmR
         mubntJ+S6eIsd7EID55y8+1j2XLedAbYmbzbpG2Gc0lGcLXQ4R71f0l/6yiUBpc6HUCC
         Y+2YgsDKxAbTnJbhjvlaZMaaPInTn7g82H6OjosOV1Kf9tSSgfDtS48FIzsyKKRlXUfZ
         wu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331383; x=1792936183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j0iP+m3EX5ucikvDp402dsq76Smx73BsFN2IxwK6/bU=;
        b=cc8AJoqKWt90UfCvyQSZP+TBmTDYPyrUIoAyMutqUbbafsNMhlG50mUJl7jQOx4RcN
         unS+Vtdyz3F7D7cH+gYCQd0jeDKj0simhSSHG3V184T+8cBjsN4r5HnWTzM1dl+4Uttx
         swng8SNx8swt2Arn5VPznQXGbyVLcSBgMr1VA8ER0T9UmYnVm/wjJoiXCklhuCAAz/Ju
         NF5GN5U78+56coVXNRtHFtTWWUTLuZZ+Bevu2LAgfMIU9uR/kC+AXwPQqWX+j0F+Coj2
         li/sMWlihofcoBQHhLZFRJV1yByGtLa8/ve3XLZLFH1PjghduglbrQ2wrFv/H65mzTmS
         rJgw==
X-Gm-Message-State: AFq9FYIY4FhD8xcMTrOS3JFGKgr6mmyvzieGJBX2Fn0bTNUnmqgoGYDp
	vLhmCv6/mihGnwcfa3FyA8FgqCyS5rsMkCP2EUxsSWH/Fx2OCfIePwh0
X-Gm-Gg: AYBFou0v/lkUD88ZRmObANcLmAjxVb0WZvuXza/w7pjJXGI0dxH+lzXP//hDpE2ClNq
	H9mtk7kJz5O+UaLO1Uxr2VWYgev2hT8/K2K6+62PnX2P4NAjKzIudilaCy+2s8JiK6M4oDHeEi/
	+aNBDfQUZ2uc4MyJmGzZ3btpGiG/1JTwcTxMfvxSwj07XqkrNAiB3Lba2eS0OY2AmCuizsHDj8T
	upHiIyaTSdTfX96BZaA2f6UGxqH1T4HRSCruJEljNfFqjGRsxoQsF5uhn9yJ7ssggp5A8dediEQ
	alnVsOGHvVJ4a+22pgnkw7ciC+RvDRZm7V+MZCFrSWphtpDpkosOJMRW6499dvvLJcS1zZN8CDQ
	FCXV9h4MEcaCoyezJlOc/fU3o127IyWQszuD76cREetKCtjmdl6NcG7hzuOaFGRZlTQEP7BjM8c
	AAgqiSBdLw5RpIql8dCb6R1S0K7NHoXnP434vzs7hVTWlE5HR5JsVaQ1tyaJosQdbTVKfuzlaM4
	L4ath/kNfoZO/oHdW6ElhIjVCF1Reg+8oWtvfUO
X-Received: by 2002:a17:907:c22:b0:c41:1e13:8891 with SMTP id a640c23a62f3a-c419df3e64emr310042766b.9.1792331382777;
        Sun, 18 Oct 2026 06:49:42 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm267678266b.61.2026.10.18.06.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:49:41 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	krzk@kernel.org,
	oleg@redhat.com,
	linmag7@gmail.com
Subject: [PATCH v4 07/10] sparc64: zero newly allocated IOMMU page tables
Date: Sun, 18 Oct 2026 15:45:09 +0200
Message-ID: <20261018134738.1016106-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018134738.1016106-1-linmag7@gmail.com>
References: <20261018134738.1016106-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iopte_make_dummy() replaces only the physical page field, preserving
all attributes. Applying it to an uninitialized table leaves validity,
permissions, context and reserved bits dependent on prior page contents.

Zero the table allocation before installing dummy page addresses. Keep
iopte_make_dummy() unchanged for unmap callers that preserve attributes.

This initialization pattern is already present in the initial Git
import; the Fixes tag identifies its earliest recorded version.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/kernel/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index a23105b64fb9..66aaafbf1621 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -130,7 +130,7 @@ int iommu_table_init(struct iommu *iommu, int tsbsize,
 
 	/* Now allocate and setup the IOMMU page table itself.  */
 	order = get_order(tsbsize);
-	page = alloc_pages_node(numa_node, GFP_KERNEL, order);
+	page = alloc_pages_node(numa_node, GFP_KERNEL | __GFP_ZERO, order);
 	if (!page) {
 		printk(KERN_ERR "IOMMU: Error, gfp(tsb) failed.\n");
 		goto out_free_dummy_page;
-- 
2.43.0

