Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0E346E51
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129764; cv=none; b=n+PJuvP5FITKAy0MzrXr/0/72OashAesYJ5L9WKP1XdOxi/6GH1N89gW0mlp5kGBTYdGTq8Amjwih1/iCGUoDIJeWVZJ1aOyjPFkhuQeVdIrTkPAe9IXtAKeoe1XTfrtQwB/cpPLTjp4Wzd8ovv58TJ1DIx7XnexytwS5m+Lccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129764; c=relaxed/simple;
	bh=rCTBXZWsA+DFjYHLb8u5Oa7Bvqyi+ouM5tudHnnjwtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foeUxTF/u/z1Nrq8YtaaeAYpJkhvMuzp1y+lPpXiqIIXkxNaaCtHpUGc2NAJOE/N0RhJp/GGaUjauE+WREm2dn8JejQneyQot0G+HBwt2/8nbD6cbMva7X899H5eEtd8RgdM64f1hXQGMViSOlnFcYz6bwUrQ+XPlwzBkn40p2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=d2XQTzi9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="d2XQTzi9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8fe8e343fso25922785ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792129762; x=1792734562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z5sNEdkVrvo7sH9ZJvBOJJZb8XmvxfiMz5rU6UHY+Ek=;
        b=d2XQTzi94gWL5bPrnej0TQLZ6cSFRh/+4KyRVkXIZpmehGuKz8TLkxYAApU8LFHGo9
         04OkzblTr02VxpRoNrYBpB3T2KrcfTgCQqenwMklyuZwSCk2KoClphHhk6w/SN/2K5FJ
         O5GN7D4mSX/z00OYGk8LIRM7Dt59P4JM7ifQBxOQUF6HcyEPFIM3ffQh0qlOq5pHH2Ri
         RgUVkPkIgcy1oVlIIFuVSRvKzdYUDIeQXWSCtLZSlMjrbUT3AEMT3lLbMJ5YV5qJUJoL
         iMUc+JVh8p1IsJWpZl3qqqv0TP7QJ6HV0RwGbYxdZjVwr7fAR2wKVjQOwALpDUxwy783
         a8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129762; x=1792734562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5sNEdkVrvo7sH9ZJvBOJJZb8XmvxfiMz5rU6UHY+Ek=;
        b=Os4v3y3WV/L4eOy2YWqy6xXLb9aoXeMC+3wQYaPXxXweU53e7p2Fr8H4+3ffaJjdYK
         UBd4c//YQ3nkQWoriaUSAgU5GeYaK22So90zhXWI0MvMJrp+729oARzfFMES9mxmqiL5
         xG2ZqtosOYuCmrLyLr09/XSG1IhCLTTWxLf75irRb48tiL/5HoJRHk5gM7JRTKCFcE46
         MgYrpvA8y5T0UgqIRcLqmp4W3yU/uqzv2JE+nZtocDGcDUIoLPJHrlRGekwFjoORQU0T
         Wg9+jt0oZurKzDfksfeHgUOsPoDeRBn14bIL6bxyL5Qrm5tlIdTxYLxr52AoSSwac5KI
         89yA==
X-Forwarded-Encrypted: i=1; AKwUvBxeTt3whgQJ/TyncNdyVx0KmWktkVdI/O186tNDbT3vjqkfauTJ7+ta3sNUFfp4hQHP2nSpLI/kfR/HRq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK55EPDC6uOfnnMtyI829GCBklQipEQZsxbEpZb8lysQT4ycybO
	ZU8vHb538w7HHkDaOlVG7qAeRmICzX1amAW5j0dIKJknUOinfrjEpKjwYLCXguLvQbU=
X-Gm-Gg: AYBFou1WpILouFfnkxl9V0r28viNl9u8gLJSOsEipyXjvRbmgajWLCQwDidYUfm1hmU
	df1UiQsbLDoDaWSo6b6VwUJVFiFBCXQtU8Jc/uFwFpQGzABlleWiVeShYF+B8HajlyJ5R5FhM2+
	2Qftdq10rVpK0RKds9J4r88fkmc0gzbNlCXkrWuxERr177j09tMox2qAmkDaqQHu6KVI2L14Nmu
	WwTe1TIEuApPtmNPGeV2FOT/CXs11pCNFI9uKHA1J5iHLScwDvd/Rhl82FXBylpVxcBoxVsMBdq
	jILa8fBVsPONCTADx+5mrSwOI68K1LDBJjl7/nf8OPoHl1HHjy6xgpdh+JHsZD0M2nO48Au+wjK
	Y5pD8uiwaMHBI6D2dK85ZuJfce6kd8rdAb2SIiCLYhqNpxHhzdSsqkry1KyTwaE7qADN703k+1j
	WNtgfq03mb43w+rORhwUxJ1POTtqoKiVhpiwdl4YlHljesCctIkMCdmho9x7bu2odgL+dVEjSnH
	ztwoUgWxJ594Q7nmdw=
X-Received: by 2002:a17:903:1b4f:b0:2e9:7ff5:544c with SMTP id d9443c01a7336-2e97ff55897mr13235965ad.25.1792129762374;
        Thu, 15 Oct 2026 22:49:22 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804d7csm4697445ad.15.2026.10.15.22.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:49:21 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Muchun Song <muchun.song@linux.dev>,
	stable@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH] dax/pmem: fix unaligned compound devmap initialization
Date: Fri, 16 Oct 2026 13:49:14 +0800
Message-ID: <20261016054914.2601510-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static pmem Device DAX namespaces reserve space for namespace metadata
before the user-visible data range, and may also include padding needed
to satisfy the Device DAX alignment. __dax_pmem_probe() adjusts the
dax_region range to start at the data range, but the dev_pagemap range
still starts at the beginning of the namespace.

That is not valid for compound devmap mappings whose memmap is stored in
system RAM. Compound page initialization requires the start PFN to be
naturally aligned to the compound page size, because the head and tail
struct pages are initialized according to that geometry. If the pgmap
starts before the aligned data range, memmap_init_zone_device() can build
compound page metadata from an unaligned PFN.

The resulting struct page layout is inconsistent with the Device DAX
mapping. A later mmap fault can then resolve the user-visible PFN through
invalid compound page metadata and hit a kernel panic while inserting the
DAX folio.

Fix this by advancing the pgmap start to the aligned Device DAX data
range for non-altmap compound mappings. Leave base-page namespaces
unchanged, and leave the altmap path unchanged because
memmap_init_zone_device() already skips the altmap reservation itself.

Fixes: 14606001efb4 ("device-dax: compound devmap support")
Cc: <stable@vger.kernel.org>
Reported-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Closes: https://lore.kernel.org/r/wlrkqqvg.ritesh.list@gmail.com
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/dax/pmem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dax/pmem.c b/drivers/dax/pmem.c
index bee93066a849..d3a9b85107b0 100644
--- a/drivers/dax/pmem.c
+++ b/drivers/dax/pmem.c
@@ -51,6 +51,13 @@ static struct dev_dax *__dax_pmem_probe(struct device *dev)
 	/* adjust the dax_region range to the start of data */
 	range = pgmap.range;
 	range.start += offset;
+	/*
+	 * When the memmap is stored in RAM, exclude metadata and alignment
+	 * padding from compound page initialization.  Otherwise, the pgmap
+	 * may start before the naturally aligned Device DAX data range.
+	 */
+	if (!pgmap_altmap(&pgmap) && le32_to_cpu(pfn_sb->align) > PAGE_SIZE)
+		pgmap.range.start = range.start;
 	dax_region = alloc_dax_region(dev, region_id, &range,
 			nd_region->target_node, le32_to_cpu(pfn_sb->align),
 			IORESOURCE_DAX_STATIC);

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.54.0

