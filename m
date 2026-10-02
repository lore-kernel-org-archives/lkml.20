Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8325F4ABBAA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947917; cv=none; b=roIVwCJKCMWLFy+CVLL/fkj7tYdeAiQjv4wWMbGy12w6HUXuD5ir6q+gRz5HXhQKsjtOZKp/AU7kFozfAv5UDmIAnTiP+jQHdfN25qKshm3R4EMe6yxpN3CttWWAo23UOHqv79tGbz13RkOqx3F3jokILrCz7rZ+qhvLwERZWZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947917; c=relaxed/simple;
	bh=brthmMIhFTOepPGDXICFqqrSL14K4+Sr9qndgom0CTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkBE+cc3iTC++y/qUvclGxmJ44GFVNGVAID7chYhxlOZXmBSacRUXUqgnl7qGo6ugGTQCKvcu6sTxeBw8MLuzaG0Y4etJTIaBwjQxHEGWCi4gTDx+4iJEZQAD4sxFRCgq4wnr3aadD8C/2qasOrt/ViZ1sSyDHAEIW3FEbvosGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b=N3kwN3zA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b="N3kwN3zA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so305605e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20251104.gappssmtp.com; s=20251104; t=1790947912; x=1791552712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9Ano9xC6R+jtMAGzXzbGvkWFfYtvDDQfjL8dZJy8z0=;
        b=N3kwN3zA/8IphmcTs28ofAQD2tBhKmnCYz1xqaXZIvRp7725wp1FNZ+RFcuq4OqZ60
         MvhJ8jpLQLlHs6OzzmSQL6Yu79R/wk/r3pnm/HIlB47V6lsS86afk/wFGTOJL+7atoIF
         ZMGzA3X7sqkQXnIsu5zbCoQifOCIYz8fdkAYilr0zq6nuKOOELQc/IUvxC6Xxbdydumz
         Yla2neoy1A5RDvQbuFoFMusK+So/oLSx4fXac8/S8al8/YsRt/tQ8hW/ruphHxmxJEfL
         jY0lJ7lNSUHnDSyGXNXMQ9tPV378Ua7u9qqW3sH74yOKNg+/hnY/nkLEKmxjta8m8nLi
         0uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947912; x=1791552712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9Ano9xC6R+jtMAGzXzbGvkWFfYtvDDQfjL8dZJy8z0=;
        b=i1N/datkJiHWsTCTHtz8IbJ/wu5gAidmkeNnj/MPw4vDlRf6b6AJcSp/WwJVkNoAai
         W69TtWi033VbwmIs0d9EaRhvTCBYxt24o+oNZ62Luy0OymPU5FEfn3IrsDm2Y8EvXD9Y
         Fh39ew92GSR0uzGxWXauhPUrN05Am7wmhdJIj3MYv0kFTbc2AZEizHbcFUfBQoRWGKxf
         6r48o60p7gD66fpDm5Ywpo0bqhmwYVMiigeEZ+jACS50YBcmMM4vyXL7FhdHWsumcfVk
         kl+S7ZKBhTYbEtXDANyDzi5bBv3Us98CF9ObbayQ+Zho0v+Juqm2ykktycsmGD9fmVK5
         P5PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLJhYlwqieN98d8GLxz3qXXCIG3bLP3bMyMOitaZvcurtaxbks/zrmyWp3Th4M71H3rYKVUvoG4DunETw=@vger.kernel.org
X-Gm-Message-State: AFuF++lfg5pNfeNQRm+kBQgjMhlmX4Iobk8kfvBRzCSwPciWTMVdLmZ8
	vNKDaQ48rAlORt7Q14aNPExE557yCWyGtUD3I8ItKJ78R3FIfmsTvZIIRf7dhQPTRGM=
X-Gm-Gg: AYBFou1m6pHNRTghDCX/xfgtmavGy25fz35g86RTMwGJ8htCNd7OTSyTU8vLXsV8O48
	jSy0ZG6m+81arYLp6VnpiqqR5I4BxBMWlCXjwh9U4Jq3nO67D9FUtDgGfdQ6Ky4AThOh6wS45J7
	hOHpo7i2DiE7LUa1eYhY44vR7Gnm4bY16F2J0WE9uGchAp6lFmIIaDS7ddLwc6yRoqYeZTuhfc4
	xKvxIy73zZBiCs30329Ybd0UTIRgNzEkolIdCjPTTYupBrMHyZFlvHxga4bbH72fv1l4+vZ9RZ0
	JV+bakWc4t/aNIdOWR8+bwYNWW/PDdjLzchugcgq1Flr4AM81o69ZP1Evvhr5qYGk2TRoj/C6SI
	BH1+sOg+vOGE9dbvaTBhBVFYMZvzeYMgN3bAH51pz3aBqq+AsWPcg/IkINSZXknVESeKKIjupJe
	dB3sUFv0k6rUsfWvZhVLgT6MV2kWfdxNzsTuJDesg/3yuTEksLhN0M88j2OxrfQHU3I/4M7QZjY
	cl3yxPc/so=
X-Received: by 2002:a05:600c:4e93:b0:4a0:1e68:d28d with SMTP id 5b1f17b1804b1-4a02756715fmr52492915e9.6.1790947911590;
        Fri, 02 Oct 2026 06:31:51 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ebe::178:143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm60543205e9.2.2026.10.02.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:31:51 -0700 (PDT)
From: Matt Fleming <matt@readmodwrite.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Sairaj Kodilkar <sarunkod@amd.com>,
	Baoquan He <bhe@redhat.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH 1/2] iommu/amd: Program device table when kdump reuse fails
Date: Fri,  2 Oct 2026 14:31:42 +0100
Message-ID: <20261002133143.3628181-2-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002133143.3628181-1-matt@readmodwrite.com>
References: <20261002133143.3628181-1-matt@readmodwrite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Fleming <mfleming@cloudflare.com>

Commit 38e5f33ee359 ("iommu/amd: Reuse device table for kdump") made
iommu_set_device_table() return early in every kdump kernel. That is
needed when the previous kernel's device table is reused: the base
register already points at it, and on SNP-enabled systems the register
is locked.

But if reuse isn't possible, early_enable_iommus() falls back to the
freshly allocated table and calls early_enable_iommu(). Because of the
early return, that table is never written to the base register. The
IOMMU keeps using whatever table the register pointed at before, while
the driver writes entries into the new one.

Only skip the write when the previous kernel's table was reused.

Fixes: 38e5f33ee359 ("iommu/amd: Reuse device table for kdump")
Cc: stable@vger.kernel.org
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 drivers/iommu/amd/init.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index c07c3a01b978..0572e1a674f0 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -409,7 +409,13 @@ static void iommu_set_device_table(struct amd_iommu *iommu)
 
 	BUG_ON(iommu->mmio_base == NULL);
 
-	if (is_kdump_kernel())
+	/*
+	 * A kdump kernel that reuses the previous kernel's device table must
+	 * leave the base register alone. It already points at that table, and
+	 * with SNP enabled the register is locked. If reuse failed, program
+	 * the freshly allocated table like a normal boot.
+	 */
+	if (iommu->pci_seg->old_dev_tbl_cpy)
 		return;
 
 	entry = iommu_virt_to_phys(dev_table);
-- 
2.43.0

