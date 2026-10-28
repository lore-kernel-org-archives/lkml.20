Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793157043;
	b=vnC1Yuy2gtd9FWuVHx0jsf58CFw00bAjpLYt7Swl2XsqsDAHHsRtozmus6z2mbEM5RX9
	 +x83jEWro7Ny4eUcGvXZRwv5TAUU1TLQmeKHgO/5/E2XOW2qYhwHPUqcv7x5Lr6ehaYhJ
	 R/y0mLHSxFZ92OfQ9JXULgnaz/cfNQIb6c4ImdKPLuUp+V3B1DjwrAQlqeaBG1eHbvanW
	 QovcYH6XRrbsbnCvmZfWuAbF3pYoP1m/N8Z/95xjKMpRYXyr25yFkDH5afJwGZX3LmOQz
	 mqeiYeEbZOmT3acz7WYyuluqSFLUgY+44wSmIcbknoHrI0Gl/o3oSUTQvOfTN0FDAZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fy0HfsUMOjewH2fDLKsY21nLEjTbk/eksQFYtRokMBQ=;
	b=qvgqS8eL4PIg4LJ/x4RuNXEATq4vBVNtvbdRBfGRZoiNjzrz9iUYR7Whq4UljOprVIBF
	 3Xlmbd1NLMz829ODoKqA2dQmPaAJ+12Pqz+o2Sj8UXcdot9QPJuMbpnZWyxZjl8Odq0+0
	 V4tYtK20f1cpo0Q/zNqhS72qLNOsaE15WX23ELvZ5/dIarIvicLsYtuByvKIKFfTfun85
	 /X2dLI1iu6hkcV6jO3747MV3T2CXsbhugCkMD6tkCpLIZ0LP0gBsMt049vMLVIFB+mHLT
	 QruSZDPUjJ6vrazHIJPj+THKJZutM0bBl5V5DPiaiUuppzrHCptMZNmEAA9e4HFrV4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="P9J5thH/";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC8606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EC8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P9J5thH/
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so36205ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793157042; x=1793761842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fy0HfsUMOjewH2fDLKsY21nLEjTbk/eksQFYtRokMBQ=;
        b=P9J5thH/x8btNLogQ9fUEHV7LGlgAo+4lNsFc0wgkLBV5e0/UxT6eNdQGT3Im6vLKq
         0/2ZpWZ712obGuISp4ZItWb/7C71Xbmfn9wkWw+2vRd6JWtzn3xoIwu+VM0rBDapLO/t
         hX5pwznm6Vf6pawuVmIKWA15d2WCJ4Jxg3654tl7R5b7JwGcG3FQ0pVaokNFj0Q6Nhqb
         SBhzHUuMZ2zbWgGtmlYnt+U1aSeDYGFt+gZnevt4DYMmV3qjmidHreCfaTSrAV4DajJk
         acMx2xHoBWZqYvApfn/KVaEOynXFnFbmtyrF0kzyXvcmabmRtdJ0HzZqQltc4RHM4Rpr
         gcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793157042; x=1793761842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fy0HfsUMOjewH2fDLKsY21nLEjTbk/eksQFYtRokMBQ=;
        b=lXCBTB73yC7a5FvB8V4ekh7jXa30LJYNQ5WH/5tpuH8rLSnZWnTeXw1XdpPHv709A9
         DMiAg35FC+L44uUdezw5oBDLCUKo98tJuue8JptPsLw00qZwa6g+pdqKZwEzWIiGh8Tt
         5eN2KaRQKMSd5M//kCe4mB0SFuyWMx2PXZt0N02BHmU/lhP+Suc9T7zcIncFJBh9i02o
         /coh3M37kFbgpOabDuQ/2MqX8jla0ywZFUb47bPh0xGlDgEsJ/SI5Z/HtxhSB9YMNmZc
         W6X/dk3smL3fGbfIbdxm3focg6BqhG+Kq7MKTKYf1GLescQVbfyIZNVNG3Ho72fL9PkU
         pfww==
X-Forwarded-Encrypted: i=1; AKwUvBy/ULlaHrJ9IC7O+FF87X+NYsN1ZoKuAo2sVK6Dn/JdnY2xM2mITVkEk/lLMPMuJADNxaq0IEmMMOFhPMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJumKsQvrmrAdpS1qalG1hfllE2WhUjGaFW6RPUc+SZ7gqnagNa
	WhVPziwRimBRdXwsd+9w1A8BadPcamA6RzEtszCD9TVfxTKa2dI83416NCWJKvPLCQ==
X-Gm-Gg: AYBFou3yWfppger69sPE19vW5TSLOvZu+yieKUkI+uRliQrKnkTgkxf6ef9c/R3GybO
	SCoq/D1HiAfp3fCoGXdz1SItqTduyOdpMuwbUHqjT/7DZb+G1szse2S6ziIH8KvsIn2yT15T7ri
	M8hWAe3ZQUAT+ivvIAtk+Y4Pe1ge8WPcCwfgEd1Z2MwTOuuPu5nIuEDEkVBELZyuAekXyuIdAqu
	uIpsKAnVIUak7NhGFq1rgc7JhgpdNXgZuMuIiJVjG00Gy9kmj6JuAHUck9D5+ttLZ2JHjXK/KdG
	ZeODT5abz2/2tXxuKYTAOgXcTCn4hn8dCSmmbDErI3+4J5QYuC4vifcMnDlPc1F4aJOYylA5Emp
	AFoPVnn2rZ9loFozavnrJdG5FzzJaaTwbKCqki3bryLaDBKk2rlMil3OJAPD7GMBfLamyr0tjPd
	US2bzFSq8xBaOFL6YvRxbaPUdXIZMtqQxCDeK0NdyZka9AB3rVyOHZnruEMKY8t2pNbh3qmILxz
	yK9yYdxFOR/lyPqm/Qyji2Vuf6TZU8FSjpjS4Xog1kQ8h5OeBN5amaFP/742Az1d+ptCzdDpISk
	qW980an2InGalss36J+x/olhS3U5sNgpdBx0Nn4D9eD/vD81aGsGLayvZL4YVN+YIIyIazG7iwn
	GjTxplEiNKjBv3lv/pFB/kw==
X-Received: by 2002:a17:902:e74d:b0:2e6:1013:ad57 with SMTP id d9443c01a7336-2eb0191f658mr2455145ad.12.1793157041492;
        Tue, 27 Oct 2026 20:10:41 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c90be0sm15672355ad.62.2026.10.27.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:10:40 -0700 (PDT)
Date: Wed, 28 Oct 2026 03:10:36 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, David Woodhouse <dwmw2@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Subject: Re: [PATCH v6 06/18] iommu/vt-d: Implement device and iommu
 preserve/unpreserve ops
Message-ID: <auFnMRfOOZCmU944@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-7-skhawaja@google.com>
 <b35a10e9-e48a-4da5-84d6-caaad693bb3d@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b35a10e9-e48a-4da5-84d6-caaad693bb3d@linux.intel.com>

On Wed, Oct 28, 2026 at 09:51:18AM +0800, Baolu Lu wrote:
>On 10/25/26 10:19, Samiullah Khawaja wrote:
>>Add implementation of the device and iommu preservation in a separate
>>file. Also set the device and iommu preserve/unpreserve ops in the
>>struct iommu_ops.
>>
>>Preservation is refused for devices where ATS is supported. Carrying an
>>active ATS configuration across kexec would require adopting the ATS
>>state in the PCI core and in the context entries, and handling the
>>disable-to-enable, enable-to-disable and STU mismatch cases for a live
>>device.
>>
>>Note that the preserved iommu root table, context table and device pasid
>>table will need cleanup as devices do not go through the release flow
>>during kexec. So the stale entries need to be removed during shutdown.
>>This is done in the next commit.
>>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  MAINTAINERS                      |   8 +
>>  drivers/iommu/intel/Makefile     |   1 +
>>  drivers/iommu/intel/iommu.c      |   9 +-
>>  drivers/iommu/intel/iommu.h      |  13 ++
>>  drivers/iommu/intel/liveupdate.c | 246 +++++++++++++++++++++++++++++++
>>  include/linux/kho/abi/iommu.h    |  27 ++++
>>  6 files changed, 302 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/iommu/intel/liveupdate.c
>>

[snip]

>>+
>>+static int preserve_iommu_context_tables(struct device_domain_info *info)
>>+{
>>+	struct iommu_hw_ser *iommu_ser;
>>+	struct intel_iommu *iommu;
>>+	int ret;
>>+	int i;
>>+
>>+	/* IOMMU for this device should already preserved.*/
>
>... should already be preserved ...

I will fix this in the next revision.
>
>>+	iommu = info->iommu;
>>+	iommu_ser = iommu_preserved_state(&iommu->iommu);
>>+	if (!iommu_ser)
>>+		return -EINVAL;
>>+
>>+	/*
>>+	 * We could do preservation of context tables only for the bus of this
>>+	 * device, but these devices can have PCI aliases, so context tables for
>>+	 * those will also require preservation. Also unpreserve would require
>>+	 * some kind of refcounting where the context table will only be
>>+	 * unpreserved when the last device associated with it is unpreserved.
>>+	 *
>>+	 * This introduces unnecessary complication with minimum benefits as the
>>+	 * unpreserved context tables will probably be recreated by the next
>>+	 * kernel as these are all active devices. We follow simpler approach by
>>+	 * just preserving the currently active context tables.
>>+	 */
>>+	for (i = 0; i < ROOT_ENTRY_NR; i++) {
>>+		ret = preserve_context_table(iommu, iommu_ser, i, 0);
>>+		if (ret)
>>+			return ret;
>>+
>>+		if (!sm_supported(iommu))
>>+			continue;
>>+
>>+		ret = preserve_context_table(iommu, iommu_ser, i, 0x80);
>>+		if (ret)
>>+			return ret;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+

[snip]

>>+/**
>>+ * struct iommu_intel_ser - Serialized state of an Intel IOMMU instance
>>+ * @features: Bitmask of Intel IOMMU specific features
>>+ * @sm_enabled: Whether the IOMMU was used in scalable mode
>>+ * @phys_addr: Physical address of the IOMMU register base
>>+ * @root_table: Physical address of the root entry table
>>+ * @context_tables_bitmap: Bitmap representing the context tables that are
>>+ * preserved.
>>+ */
>>+struct iommu_intel_ser {
>>+	u32 features;
>>+	u8 sm_enabled;
>>+	u8 padding[3];
>>+	u64 phys_addr;
>>+	u64 root_table;
>>+	u64 context_tables_bitmap[VTD_PRESERVED_BITMAP_LONGS];
>>+} __packed;
>>+
>>  /**
>>   * struct iommu_hw_ser - Serialized state of an IOMMU instance
>>   * @hdr: Common object header
>>   * @token: Unique token to identify the IOMMU instance
>>   * @type: IOMMU type serialized state belongs to
>>   * @reserved: Reserved for future common fields.
>>+ * @intel: Intel specific serialization data
>>   */
>>  struct iommu_hw_ser {
>>  	struct iommu_hdr_ser hdr;
>>  	u64 token;
>>  	u64 type;
>>  	u64 reserved[2];
>>+	union {
>>+		struct iommu_intel_ser intel;
>>+	};
>>  } __packed;
>>  /**
>
>This patch looks good to me,
>
>Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks for the review,
Sami
