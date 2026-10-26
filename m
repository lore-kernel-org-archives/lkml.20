Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021823;
	b=1QotBN7UHXLMtDfQWuZ5/OrWXoFM9ti6HbhiFKw80e5NI8b0s/SimaG+ErwCsuLjk8Ek
	 CF38/ojO+sReJ5lTs2qT3W6GAFd0+RuwPQOR0GAbYF0NxPvdHy5sw5sPgi16GX3tAoVlb
	 amUqYbppLBFmiMvMpyoT0ARtjCBBj48L/nYSHCiIEB00oF72bQ7ljY8I8Xq8uZUj/eka/
	 mcbKDxa+tBArV8o6UqHSyL2Dh6eElahRtjj+E9l4BYQ8jiShv6eh4HCHHNid4CcLOrpVH
	 6qDEsSAYRVWOJw1d2F+4vwEK8TNeSC96Yo3sgp6YpGmwl2vJl/dfXnSLb7d/elL5j1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=u8dEoOvFyttOe/BrdbS9Lckh8vPBq/eJHO5XvvUziD0=;
	b=ywJzoNo9g9xuYduwQXKxVhvygYZjFEeedJmfnKdA1CJXzHd+vf7JbNHip1emkRgmKlc7
	 UTKSdBYYqB8ORvTF7zp+ywW5Z3htQfm4pKIIko8w3H/o1z+oOKWbRQUeXjPMT/rA8ujaI
	 wqfM4NoanXaU7Ls+pg5CoQglqLvhE8pNIBbAiTmKJ34J7MN0GDhNtmn4LNVRzc8B9yBtU
	 B9+4JG+fv8TKDYeRy0lnI3hsqbnLBiQI6CXqFBLI1nCP18TSNMK5xoQTUSxqBjWhcbQJ4
	 uMiVGJ8bwg7yU32syM4vsZODzTjQ74hTL6yx8p/khymJXw0y2Obq3Qr7pL2aZCkekqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=snu.ac.kr;
	spf=pass smtp.mailfrom=snu.ac.kr;
	dkim=pass header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=r1D23Vnb;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E3606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C17E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=r1D23Vnb
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-19305bcb72cso2068721c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1793021820; x=1793626620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8dEoOvFyttOe/BrdbS9Lckh8vPBq/eJHO5XvvUziD0=;
        b=r1D23VnbbDdUGzSg9SzRtXtenXM4+aoiMq/RQ8WNr8Erl4gTu4vpizT/KD0/4ssWoE
         b8Rxheen0/j5U7l9cDhnKB89i5xz+pTwAeo5EUUFauyW9yNUpjtTDUlItXx/z+st4TRh
         XXsF5A1YA6ljV/pkPIwIj8qpDO7MtAOnFAb4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021820; x=1793626620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8dEoOvFyttOe/BrdbS9Lckh8vPBq/eJHO5XvvUziD0=;
        b=NHeBNS6EVckNaza/jFfTdA+air7+PIPr576HbVDHy+jdPbNJToTqNnjW47cxffq7Q6
         Szyr8tXMb6SUnDLVYbcEvCWjAT74OGfBDJdFj7IcFjMDrUkbFEIs2yBGFESwIoAzVO9l
         nphNWITAvKMMQI3GmVubRgzXz02D4+AflXxx4beYe3t9hl1oZMayo2mY6YX1ZZyg6T5k
         eQK3+V21vv7WGo9ovKzQ+7vcf4wbmwD3qDVOE/No1Q2tbwhIiwIVFAEoqAgvrM2dlSCc
         t4aVjS7vnBU8alSS/cNwokgSi+AdDX0knbQSUwqPva7filDBH+Yj62DpEuLa2HsyK62t
         OauA==
X-Forwarded-Encrypted: i=1; AKwUvBwAYNKqhEGKRKLRQhlRe+blLVF/A2Jgcf9z+WnBmFfKmpMHCH/6I+Io9KQRy1nJuYIZzh76CCwCtDSYY7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWwxBIk2RA1QiC3me5noYP7aCs7Syb+PDYjfTg1BCwFZccAIl3
	j6EpKinFsAIvNOFyUlUzoEDBoSa4tw64Uuo/QGudbtVw2akpHl3v6ykGGszqL0ua4RA=
X-Gm-Gg: AYBFou1sHz3ehicmCC0xqEDYIfndBCnDe/NcFib7op/IOU2Z9oFLSvOfknYuL2STRFm
	9z10mB/pi+LDk7g5OnHSVyD+FvwvdEZGexojRPSEvmVUB+ZlHc+LkTivwl8VyCmQ0R6eXqb6pH5
	aidoBvgRtvEgQF81x+GsVNTQrc7xxjmb+jcSny47bwEYW2gY9IMriZ3cgY9fLIqSTr4q3Xe2dY1
	24YdZB7WHEnWt/pqQAdd+srRF45we2iIbRuUcGpUNZd30OcOce8zq1RAobC5ysNO6qSpd584djt
	WB+QjvA8c6sxxnZYYaZAEHXPAtzaJojwio7azXZzm15o8/3OJqGylv7zVyUUSPk17gwQ4YhcGpm
	wgSN1N69qN5GbqlJA5bvEWPHIgzt1kcK2zHxbfOYpT22bRlFYE1iAinN+dzoE113Dha3H5iBff3
	9/6jGOVwf14U/EcEZm+5yQ8PC7+H59ddOUO5c4mYUiV5LBP6lBmByuKVt3oBm15on7++dGYH6YR
	FkQX6wmVnn4lyfFm3YgA88UBewqbKEivvl6U8JE2Ja2q0w5/w==
X-Received: by 2002:a05:7022:150c:b0:191:ac4:55a7 with SMTP id a92af1059eb24-19934a96e58mr10119771c88.23.1793021819831;
        Mon, 26 Oct 2026 06:36:59 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm22432520c88.8.2026.10.26.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:36:59 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Date: Mon, 26 Oct 2026 13:36:43 +0000
Subject: [PATCH 1/2] iommu/io-pgtable-arm: align next walk address to large
 page size
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
Message-Id: <20261026-iommu-arm-fix-missing-dirty-pages-v1-1-115b6b1cc0f5@snu.ac.kr>
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

Align down walk_data->addr before the increment by page size to prevent
the missing dirty pages on IOMMU_HWPT_GET_DIRTY_BITMAP ioctl.

As Commit e21952d72b47 ("iommufd/iova_bitmap: Ensure that iova_bitmap_set()
handles the full IOVA") mentioned, the requested iova range can begin in
the middle of the large page (e.g., 2MB page block). So incrementing walk
address by large page size (e.g., 2M) could bypass next dirty'd small pages.

Fixes: 4fe88fd8b4ae ("iommu/io-pgtable-arm: Add read_and_clear_dirty() support")
Cc: stable@vger.kernel.org
Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 drivers/iommu/io-pgtable-arm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631a..01c3f9cd5d9c 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -821,7 +821,7 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return ret;
 
 	if (iopte_leaf(pte, lvl, iop->fmt)) {
-		walk_data->addr += size;
+		walk_data->addr = ALIGN_DOWN(walk_data->addr, size) + size;
 		return 0;
 	}
 
@@ -868,7 +868,9 @@ static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
 		return 0;
 
 	if (iopte_writeable_dirty(*ptep)) {
-		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
+		u64 iova = ALIGN_DOWN(walk_data->addr, size);
+
+		iommu_dirty_bitmap_record(dirty, iova, size);
 		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
 			iopte_set_writeable_clean(ptep);
 	}

-- 
2.43.0

