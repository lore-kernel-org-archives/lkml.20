Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021826;
	b=gOyqtqimyndCwq8MSmwFehsKKcD4vhkvkzM5q6JVSnIJM27KCeh5XbXbULVoLJaxCJ/s
	 6lfapU1vf8yVENHfOR3dd+dOtbrRCMI7DXCLb1R7p0h/XXNFMekF3sUzTAI7E4y4KiZuA
	 ZIjDJOVBTrBobxf11mqp3kCrcs/3gltwfzJ7IBjIjE8H93k/Cul4ztGvebwVRTaKjqWKG
	 ME36ZJieayE+9s/0jSas74aqNkHopZKzXrNB46cFHupyTdpSTLNW0WWhFRpEmWbJyx3h+
	 v0Iov7p/GVrl2yaK33m9ehButdiBGb4dcDS6GLIXmWfNFVqb1lpOlX5vzHs4ph6A29g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/4ed/RMVrv6O/H4HMl4G3Xz4VIpFThxQX+sYINSnX4Q=;
	b=lHCCCNiAJVXpSuz8bwGHJivejctks7P0CHSRW0Cer74VmH1JXdDsD8PJmQAlGVjY01Hw
	 xwTK7ArnrHTiebUt/Bvn7h1Q5pWtOe+PmHkHhOzSo9eQmPig1JFTmk2B4QPVXXsUog8m0
	 A9zZpDJ52ezG7MN5qkhnSSQUqHuGfzZN2VzPi+9aIjJ6zqxWy/ce43hpUCt/vzubplS27
	 PEoFihfUfe8t+e187hTyhzLnGNsMJP+a6nF14B8MIwyMaP2htmyGHbsls47EVF32Yglfv
	 6EqbxkuEZIqC39oN0sLhjWR6iLiGMiJg/Hcc8ds7i6vP7oiMrnTuehXjEx+7IE0XMFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=snu.ac.kr;
	spf=pass smtp.mailfrom=snu.ac.kr;
	dkim=pass header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=NCTDIcSI;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F95606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F95606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=NCTDIcSI
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f036b17easo8110350eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1793021823; x=1793626623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4ed/RMVrv6O/H4HMl4G3Xz4VIpFThxQX+sYINSnX4Q=;
        b=NCTDIcSIp/qQbuuAsKhDPyilHajdNZXntIojx/ZDrMTRJEN7j9tV2m3XwUaABC5uQq
         024j4gUvZn70Ymwon/ZM3CWUA3HTsiy7MTO5q/2xY97bpwtrX51lDS4QxMM4eK1zzseE
         ZzZkwzauWXr0wG5f25qy/Jq/QVXjxgPZckH4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021823; x=1793626623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4ed/RMVrv6O/H4HMl4G3Xz4VIpFThxQX+sYINSnX4Q=;
        b=JoMt4+ExNHPe3pkmvK1Wy6oZUwOoWXopOHG0b8NBL+ZTh19E8J/5PyjcPzVC5PROi5
         0gKlkufD1I5x8Y8sW2uJO6BpdheB9iZBJ5j0O6+mHi9fHNDtq3E4jwDlknNWQplddRNa
         83pi8GZnnnK/1IC9UTmToLZa2gS06EWeAkiiFcbkcu1QsHQU6kCQcvFYyZdtl2feWb2Z
         aGBkyZ7TU7Y97voN4t92mhPmcb+po3oFiMxjJ1NUlQ7PxnlcSuP/m+ePByyv2Ufpqr/Z
         yWUslhUK8bXaSnGwgpKPTxMGXDemLiLpx+TwQXfMa5HxkKoTZz6aP9am5m+U8jctnae6
         kBzw==
X-Forwarded-Encrypted: i=1; AKwUvByPcBsay6IzKUB/BqCW4lifP0/mCjwc1aR+1tM5IO0eMO0BNCEBFR8LfM7kjgoiNT/IZCuDGXhGZVX81Y4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDUoOVPRhQiMTu7g71wJD5A9uRBVBQbPBG9+ZNRQa7N0ZzzOUO
	3T780p9FCLzbhzKcmxzoHgmACo4vOSIZPg9c9TIMuBmNXa/+36suNWNdEsjJ8d5ouZ4=
X-Gm-Gg: AYBFou356bWNODiIzk8P2/Ylnr+u2c+MsYkCus75TRZUoAYj80PLjQ5DGqm68jhJ3VP
	68CI86GdIUQkpt6f2NXkkI1iXf37PP8eFqpKUVYas3IiMcWBm6gY35h1arC78loY3x1Lik77ZKn
	uz+Uk/0UN3BZKMAA8wg6MAbmKnU7eKN64LYwtnzDmqf6VlYzgl14JS8sbsPvDMAspFkfvYDdwHd
	BkseG03lUilTsLDwWmFcQsGGU3gyxFJ6Dx+r67+s59ZJqDCBqme4KqLOH3Br0FkiawXYIpW7JTh
	SCPZ0aWx9fzsyCq3xoqrF8W6RWw2p+ZERkcD4bespijuMEAP8GU/hsmxiZrApI25ab6katDnMV2
	zOhlXV1GAKt8ebUDFF1QbeRh2M4cpFTDJfROeBem2X9WtOmpWSxPOpIJ6RjJd5UpRziVfzsQDi+
	JINtvhNPJ98wiGjmz8Aut3fig5mFHjBxN28Sa197IX9w5WL0ymRi2EgiEYYBu3LPZf2+ki3TV0T
	A4Ou3xdUAxWicGZbGZ/MNb/w03/bT11fms7yjiujOQN4Ts7PfW9BhTxwCIXMpVpb6+krS4=
X-Received: by 2002:a05:701b:2085:10b0:190:d0d9:3110 with SMTP id a92af1059eb24-199406385f5mr9674399c88.45.1793021823146;
        Mon, 26 Oct 2026 06:37:03 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm22432520c88.8.2026.10.26.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:02 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Date: Mon, 26 Oct 2026 13:36:44 +0000
Subject: [PATCH 2/2] iommu/io-pgtable-arm: invalidate iotlb on dirty pte
 read_and_clear
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-iommu-arm-fix-missing-dirty-pages-v1-2-115b6b1cc0f5@snu.ac.kr>
References: <20261026-iommu-arm-fix-missing-dirty-pages-v1-0-115b6b1cc0f5@snu.ac.kr>
In-Reply-To: <20261026-iommu-arm-fix-missing-dirty-pages-v1-0-115b6b1cc0f5@snu.ac.kr>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Tian <kevin.tian@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Seongjun Hong <hsj0512@snu.ac.kr>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Use io_pgtable_tlb_add_page() instead of iommu_iotlb_gather_add_range()
to prevent the undesirable case where iotlb invalidation cannot be executed
because gather->pgsize is not updated before arm_smmu_iotlb_sync().

io_pgtable_tlb_add_page() leads to iommu_iotlb_gather_add_page(), which
updates gather->pgsize. It prevents missing iotlb invalidation because
arm_smmu_iotlb_sync() invalidates iotlb only when gather->pgsize is not
zero.

Update gather iova range only when IOMMU_DIRTY_NO_CLEAR flag is not set,
as record_dirty() does.

Since iommu_dirty_bitmap_record() becomes stale, discard it.

Fixes: 4fe88fd8b4ae ("iommu/io-pgtable-arm: Add read_and_clear_dirty() support")
Cc: stable@vger.kernel.org
Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 drivers/iommu/io-pgtable-arm.c | 11 +++++++++--
 include/linux/iommu.h          | 17 -----------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 01c3f9cd5d9c..6513dac26e79 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -870,9 +870,16 @@ static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
 	if (iopte_writeable_dirty(*ptep)) {
 		u64 iova = ALIGN_DOWN(walk_data->addr, size);
 
-		iommu_dirty_bitmap_record(dirty, iova, size);
-		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
+		if (dirty->bitmap)
+			iova_bitmap_set(dirty->bitmap, iova, size);
+
+		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR)) {
 			iopte_set_writeable_clean(ptep);
+			if (dirty->gather)
+				io_pgtable_tlb_add_page(walk_data->iop,
+							dirty->gather, iova,
+							size);
+		}
 	}
 
 	return 0;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef5043752a36..df57ead2cc3c 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1106,17 +1106,6 @@ static inline void iommu_dirty_bitmap_init(struct iommu_dirty_bitmap *dirty,
 	dirty->gather = gather;
 }
 
-static inline void iommu_dirty_bitmap_record(struct iommu_dirty_bitmap *dirty,
-					     unsigned long iova,
-					     unsigned long length)
-{
-	if (dirty->bitmap)
-		iova_bitmap_set(dirty->bitmap, iova, length);
-
-	if (dirty->gather)
-		iommu_iotlb_gather_add_range(dirty->gather, iova, length);
-}
-
 /* PCI device grouping function */
 extern struct iommu_group *pci_device_group(struct device *dev);
 /* Generic device grouping function */
@@ -1449,12 +1438,6 @@ static inline void iommu_dirty_bitmap_init(struct iommu_dirty_bitmap *dirty,
 {
 }
 
-static inline void iommu_dirty_bitmap_record(struct iommu_dirty_bitmap *dirty,
-					     unsigned long iova,
-					     unsigned long length)
-{
-}
-
 static inline void iommu_device_unregister(struct iommu_device *iommu)
 {
 }

-- 
2.43.0

