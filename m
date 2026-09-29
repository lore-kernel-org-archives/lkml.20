Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3AF393DDC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666397; cv=none; b=Sit+Tunf1gtXtmSyR+3E39mwABAZWQeenqN6g/Xw0KM31uilyJxhxo4XlGrkYkZkJP06g3ZfrzSPxeoH7NCBo8Eoggxj03USh4yJG6QOt1M6o8bgsGnxDJRzIby+PiIUf4JLuo1hXi5nJB2QQ+JyDvQfkNFxZ8tyTlzRJOq5+r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666397; c=relaxed/simple;
	bh=Cibc0qmVxepQBf7qjOiwlYLorjUoHG7A9mz73J9p2a8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F3B0qlPvuyJb1vpx8zlymnezaWsb1akzDESYPRSHN5L+Q3B9nc/DNUxBPcq+MfRoiAMkK6ADWGgAEwcmAf1HdcLZZ5PqrPOmaGIOpywe6HZ8K5ol43HBrrJXDeh1yegmW6c5IJMpJ6YHoTXj9eRmI/4Wrw1JYt3e9e1sk2g9W4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OysEiRgU; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OysEiRgU"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so2552837a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790666396; x=1791271196; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oppeuWMIuYJb2+RCyuh9zePmLDu8NMomw2YlOiRHYbs=;
        b=OysEiRgUJlPXTzHW6HcR9cIE0ErdgemnKt9nvQEcQYO6uBZOanPwFzvY5YuNwQEENB
         btJWbfAPU4oObTb5gPM8X9MyYtIeAvjEdiBkFAim4XMrF+qCwwwQk1pWfRB2bt4S7L9f
         o6vpiDnfiEMk+HfgJ3qbVIsqdmsWEb894E/pALlibvrpNDwIQGiejl21nbthn6AfVpsb
         lfTnTbM1dUr1ctVVUaNm0FqbAKMZ4/JMYZ6bd2UJbDOmTJA6KY/IgjonxO8LuNz84c5L
         XdZU4KJ8613y6Cva788sAoClHHETmX7E+apKeDVVdU67tQpoUC+PlJA2+mmGmiD/ggaf
         SFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666396; x=1791271196;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oppeuWMIuYJb2+RCyuh9zePmLDu8NMomw2YlOiRHYbs=;
        b=2fYjHZ55knq1EWhd7CMqrTZKcU2xnrFoot+14aB9PSdkoxvpxLKRqUhAhLfKqvvnJ3
         h52vBlN7j+93fdCsF98nVpMEjkPDDUJeueP/54ao/yJeAvKeJg4Iywm/A0QpboYGp94t
         8StRsHY7+xRFLfjHHMT2hSHyKzzxPNwHM3/ec7nWOvRbkg8EyCA/lLdozB7hKcTUZghZ
         qaCklQV17T53BBydumvbpID1H3ZnIBbyWd02EofBRN534zGH2FUttR35vBuz01ANztE8
         YD/I/KkWFJE6i0QnsrP9Fd7NLz4DHTknDZJsqE/h1/YNlL3M4NgfUIMVIXthoOb0mpN7
         EZUA==
X-Forwarded-Encrypted: i=1; AKwUvBz6S3apdH3QntY6jTCHEU3biKPdv0YEiJEUoeoYJEPRinJoyPCwJGspFC2q6F5fCmr5SdqV3ySHVUL0IDg=@vger.kernel.org
X-Gm-Message-State: AFuF++lXxypBdubRz61ZOH+lACxyicJhKJ12+vNOp/nbLuEBzHjm4BKd
	Sr7EdZESCoiwrmaU7H76FF+9uradS8VscUcnyttuEWi36u4j8W+cRUQLYQDZcE+k4EeKqwLvc7w
	mxg==
X-Received: from pga22.prod.google.com ([2002:a05:6a02:4f96:b0:cc7:97c8:bb2d])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d1d:b0:3d3:af44:ee12
 with SMTP id adf61e73a8af0-3de0e76eb53mr14711712637.27.1790666395477; Tue, 29
 Sep 2026 00:19:55 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:19:42 +0000
In-Reply-To: <20260929071950.2710070-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929071950.2710070-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929071950.2710070-2-praan@google.com>
Subject: [RFC PATCH v1 1/9] iommu/kho: Extend IOMMU KHO ABI for ARM SMMUv3
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Daniel Mentz <danielmentz@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the KHO IOMMU ABI to support state preservation for Arm SMMUv3.

Introduce struct iommu_smmuv3_hw_ser to capture SMMU hardware state,
including the register base, Stream Table config and Live Update state
tokens for the preserved Stream Tables.

Additionally, introduce struct iommu_master_smmuv3_ser to capture per
master state. For now it is used to preserve CD tables for Stage-1
translation.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 include/linux/kho/abi/iommu.h | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/kho/abi/iommu.h b/include/linux/kho/abi/iommu.h
index 308cd83fd3e3..397fdb0449a6 100644
--- a/include/linux/kho/abi/iommu.h
+++ b/include/linux/kho/abi/iommu.h
@@ -82,6 +82,7 @@
 enum iommu_type_ser {
 	IOMMU_INVALID,
 	IOMMU_INTEL,
+	IOMMU_ARM_SMMUV3,
 };
 
 #define IOMMU_SER_FLAG_DELETED	(1 << 0)
@@ -142,6 +143,23 @@ struct iommu_device_intel_ser {
 	u64 max_pasid;
 } __packed;
 
+/**
+ * struct iommu_master_smmuv3_ser - SMMUv3 specific device state
+ * @l1_cdtab_lu_state: Live update state token for the linear/L1 CD table
+ * @num_l2_cdtables: Number of active L2 CD tables preserved
+ * @l2_cdtab_lu_states_phys: Physical pointer to an array of u64 LU state tokens
+ *                           for the active L2 CD tables (0 if linear)
+ *
+ * Note: Currently unused for Stage-2 Live Update. Reserved for future
+ * preservation of Stage-1 per-device Context Descriptor (CD) tables.
+ */
+struct iommu_master_smmuv3_ser {
+	u64 l1_cdtab_lu_state;
+	u32 num_l2_cdtables;
+	u32 padding;
+	u64 l2_cdtab_lu_states_phys;
+} __packed;
+
 /**
  * struct iommu_device_ser - Serialized state of a device
  * @hdr: Common object header
@@ -159,6 +177,7 @@ struct iommu_device_ser {
 	struct iommu_dev_map_ser domain_iommu_ser;
 	union {
 		struct iommu_device_intel_ser intel;
+		struct iommu_master_smmuv3_ser smmuv3;
 	};
 } __packed;
 
@@ -181,6 +200,22 @@ struct iommu_intel_ser {
 	u64 context_tables_bitmap[VTD_PRESERVED_BITMAP_LONGS];
 };
 
+/**
+ * struct iommu_smmuv3_hw_ser - SMMUv3 specific hardware state
+ * @phys_addr: Physical address of the SMMU register base
+ * @strtab_base_cfg: STRTAB_BASE_CFG register value
+ * @l1_strtab_lu_state: Live update state token for the linear table OR the L1 table
+ * @l2_strtab_lu_states_phys: Physical pointer to an array of u64 LU state tokens
+ *                            indexed by L1 index, 0 for L2 tables that aren't
+ *                            preserved (0 if linear)
+ */
+struct iommu_smmuv3_hw_ser {
+	u64 phys_addr;
+	u64 strtab_base_cfg;
+	u64 l1_strtab_lu_state;
+	u64 l2_strtab_lu_states_phys;
+} __packed;
+
 /**
  * struct iommu_hw_ser - Serialized state of an IOMMU instance
  * @hdr: Common object header
@@ -194,6 +229,7 @@ struct iommu_hw_ser {
 	u64 type;
 	union {
 		struct iommu_intel_ser intel;
+		struct iommu_smmuv3_hw_ser smmuv3;
 	};
 } __packed;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

