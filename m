Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833378;
	b=K/3PwYner6RPbJ/YWGMGzsxuOsu7afojAGNHLzSv8vj2ozEgThfAjw1sK6nWPkCoQtWA
	 Ir4kmtTn8LdbsQ0E8KF4kGdx8lCc8DUHDm3E67RsEH6hEJe0Na3G84zdDr5UE+DoO9gHE
	 OR4krFlalUFHatrLgBm69/5Qj370vhrRVp6ydyfq0brqmXtc5QFZrbUIEwy0wbMdHvRBV
	 yhV3F1fLrRqTL0hCutUXz4tpQ/jIXc6d1UgANhNpqVV2q9C5jPm9cHdQJJ7tWYA1UTRL1
	 tfIu2FH8I2FMoObPpq0FrKnJdfkotXXl7znQvKUd6AvCja75dTQNGxlK4jHpsxv5IaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YiodbiOBXjWvWWEj6Yx21Jb/b8nlmUGIGF+99ROj+mk=;
	b=fXOtbiPMAwCI6O/Wtfg09BibXYfi87Rl3ZvTpeciSiTBIkVLUEdgvap0Dz1qx6A6Zioj
	 R9IBJn+DoUbHpMDvdlQC3W73zc4kfmq7Ai95ShOv+XhcVLCxV9cUdVhbpPuVN4anJ8ebc
	 Lqrmuw4ysgQs8uQORDaSUsSIkU5CLs6dkca3UW11b9ppik2jJsrFd601VNisLAHkQq4Sp
	 o+cQUPTuFjHVH9vCUw8PFM45BM8YGvs+qCTLfOSSqkf5c+VpNu9hvF/zIcRUNQOCrgfsr
	 MarsCRM0O8dAVVdSbvp9Qx2W6RloZYN5600CaOCoU6u+JDOCHtFAhlSGzL4FfT1gVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iH0j/YHI";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769956082BF3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769956082BF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iH0j/YHI
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5378b281aso8064635ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833378; x=1794438178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YiodbiOBXjWvWWEj6Yx21Jb/b8nlmUGIGF+99ROj+mk=;
        b=iH0j/YHI7xOeW4sbafveCovuzSISTrEeoGGkpkbFEuT5sX6nySwBYXOJnQ96sh9q0g
         uAXQB3bGEfiSTbbbAl/Hx9a2TAm8lGE9FTdprK1k7SvHjF8mQMFcBWpdERlx82902fgU
         ZG9YifiredLDr4eB2UBNqAHIwfP34gETfD/GAM/UWQRoGabr8btRZu/iuXG+ICEChd71
         I1T1+lVY5ZQIrvIWv4M57whvrbXOJFW0qfmds4fDN2hxX4pRCZUpt0T3UiazqeCWEscs
         Cks7dOowRFFXs945M1SJvSV5VtID50Eun1G/nb8hIV8YVn9Lbui+5KIn2yRH1VzIIY9r
         A3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833378; x=1794438178;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiodbiOBXjWvWWEj6Yx21Jb/b8nlmUGIGF+99ROj+mk=;
        b=iCcRT0b2/BDEPXSFctgJOYNxwSJ8MqlQlN5enzlRYqbMLe0iHxE4XX8hmmA3Nly6A+
         TpRs3z71/2A6+kj/qzZGi1fj2reDXerRONR3LMOadiUdBoSYtdQRxe5YLcqwrtMtWey1
         xd+btwIqFIFB3L6S+WsjiYmhT7NK/n9qw4AJVjoDz7SVwm3tOPUoNresDmIJdqMYEN49
         APZ557cFP1IjpkZ04+M6BdONASaP0YLNRk30GbMwHxB5wAsnn67+oUekXYlWwSwu0NX8
         ei5OCwVUllE9Yvy0Bp269iOu7hbFi8cvpGf9F/BtC05mAOgQzyt0ZfNzPeQRxoMDOiz7
         24Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxQ+mijc28sGhkwLeezACZBZ/29NOlEi1KfWqKk72FuxRHg95RNe3cI26vLqVZUR+lDGk0pavDDhszaPH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mkmD3a8tTQgkTXLiKklGbWWos4VKhdGKGpyrG9pSl4T3I6NFx
	XKvdM4773Vt/gpC1HXr+a5qVl8LuMMnp6wRlyKl+hpkLTe3r+Dml78+0
X-Gm-Gg: AYBFou2inGTc8w+juL3gL0tb6SOtRsKYQB4EiQV1TMhMWwGOI1V3A/rd9HBKH26klwn
	v/Zhel4hiPdQYtZvHEJceBo2TE3LRz3PcxC8l3/897Byv5/aN4wLE2FEkMcCfgoQsUz1vg2XL5x
	9g1+qttm1olKnWRkD/5edi4e0LjOXwln32LXtveunY4RzQf7VYt5ln8qEvrIWn3YjpFEfL+/DMv
	fuy3YEsRceTTyoVaOAeuj8chwK38a4f85WO6Rnov2SPsAPGqK1D4A9DJIGFMCVSoNRpABeJqWh8
	J0He9Tmu4gq8aYUac1EmmB54fauVjpmaxjVnDduONxFVqJDCNZJNJFW5X0XKX/FEXI5dIdi1Sp3
	BTRWCp9dNA7jNozMhDklqVMhB5J17/+WfaPT87WIjQ0YbOQMCYhJ0OkCHc8zugbdCnmXloniTMS
	VVEZgWVcKz4PQ57oUUAplhjbrKSachYgQCosI9kHHm8TK3I7Evc/lr5jNMfPjFMoh+Sk+t0v29E
	NQvv0cMP574skFELGkBA18s7zfvzEwRipw5NqHtMR/5Rp7MOu5CfkPbUuhS1ZqC4I8zlKMSpJL2
	6x3q5+5t/AZTxQkGHleLHZILdiSVHg==
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr158916125ad.60.1793833377799;
        Wed, 04 Nov 2026 15:02:57 -0800 (PST)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0908587dsm10999175ad.36.2026.11.04.15.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:02:57 -0800 (PST)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>,
	Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>,
	Anisa Su <anisa.su@samsung.com>
Subject: [PATCH v1 08/14] cxl/extent: Validate DC extent partition
Date: Thu,  5 Nov 2026 08:02:32 +0900
Message-ID: <20261104230445.66625-9-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104230445.66625-1-anisa.su@samsung.com>
References: <20261104230445.66625-1-anisa.su@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ira Weiny <iweiny@kernel.org>

Extend cxl_validate_extent() — the per-extent check of the add pipeline
to check partition membership.

Resolves an extent's DPA to its containing DC partition.  Sharability is
a property of the partition (part->shareable), taken from its CDAT DSMAS
entry.

An extent from a sharable partition must carry a non-null tag, since hosts
sharing the allocation key on that tag.  A null tag there is a device
firmware bug; reject the extent.

A non-sharable extent must carry 0 in shared_extn_seq (CXL r4.0 Table
8-230); a non-zero value is rejected the same way.  The dense 0..n-1
check for sharable groups follows in the next commit, once the whole
tag group is collected.

Based on patches by John Groves.

Signed-off-by: Ira Weiny <iweiny@kernel.org>
Co-developed-by: John Groves <John@Groves.net>
Signed-off-by: John Groves <John@Groves.net>
Co-developed-by: Anisa Su <anisa.su@samsung.com>
Signed-off-by: Anisa Su <anisa.su@samsung.com>
Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>
---
 drivers/cxl/core/core.h   | 12 +++++++
 drivers/cxl/core/extent.c | 70 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/cxl/core/core.h b/drivers/cxl/core/core.h
index 759f2c47d765..528eec2a1cc3 100644
--- a/drivers/cxl/core/core.h
+++ b/drivers/cxl/core/core.h
@@ -83,6 +83,10 @@ int online_tag_group(struct cxl_dc_tag_group *group);
 bool rm_tag_group(struct cxl_dc_tag_group *group);
 void discard_tag_group(struct cxl_dc_tag_group *group);
 int cxl_dax_untagged_add(struct cxl_dax_region *cxlr_dax);
+const struct cxl_dpa_partition *
+cxl_extent_dc_partition(struct cxl_memdev_state *mds,
+			struct cxl_extent *extent,
+			struct range *ext_range);
 #else
 static inline u64 cxl_dpa_to_hpa(struct cxl_region *cxlr,
 				 const struct cxl_memdev *cxlmd, u64 dpa)
@@ -144,6 +148,14 @@ static inline void kill_regions(struct cxl_root_decoder *cxlrd) { };
 #define SET_CXL_REGION_ATTR(x)
 #define CXL_PMEM_REGION_TYPE(x) NULL
 #define CXL_DAX_REGION_TYPE(x) NULL
+
+static inline const struct cxl_dpa_partition *
+cxl_extent_dc_partition(struct cxl_memdev_state *mds,
+			struct cxl_extent *extent,
+			struct range *ext_range)
+{
+	return NULL;
+}
 #endif
 
 struct cxl_send_command;
diff --git a/drivers/cxl/core/extent.c b/drivers/cxl/core/extent.c
index 8afb18e7ae5a..334a97ab583d 100644
--- a/drivers/cxl/core/extent.c
+++ b/drivers/cxl/core/extent.c
@@ -115,6 +115,51 @@ alloc_tag_group(struct cxl_dax_region *cxlr_dax, uuid_t *uuid)
 	return no_free_ptr(group);
 }
 
+/*
+ * Find the DC (Dynamic Capacity) partition that fully contains @ext_range,
+ * or NULL if the extent falls outside every DC partition on this memdev.
+ * The returned pointer is owned by mds->cxlds.part[] and lives for the
+ * lifetime of the memdev.
+ */
+const struct cxl_dpa_partition *
+cxl_extent_dc_partition(struct cxl_memdev_state *mds,
+			struct cxl_extent *extent,
+			struct range *ext_range)
+{
+	struct cxl_dev_state *cxlds = &mds->cxlds;
+	struct device *dev = mds->cxlds.dev;
+
+	/*
+	 * A device-side error could cause end < start, which range_contains()
+	 * would treat as contained in any partition.
+	 */
+	if (ext_range->end < ext_range->start) {
+		dev_err_ratelimited(dev,
+				    "DC extent DPA %pra (%pU) has invalid length (firmware bug)\n",
+				    ext_range, extent->uuid);
+		return NULL;
+	}
+
+	for (int i = 0; i < cxlds->nr_partitions; i++) {
+		struct cxl_dpa_partition *part = &cxlds->part[i];
+		struct range partition_range = {
+			.start = part->res.start,
+			.end = part->res.end,
+		};
+
+		if (part->mode != CXL_PARTMODE_DYNAMIC_RAM)
+			continue;
+
+		if (range_contains(&partition_range, ext_range))
+			return part;
+	}
+
+	dev_err_ratelimited(dev,
+			    "DC extent DPA %pra (%pU) is not in a valid DC partition\n",
+			    ext_range, extent->uuid);
+	return NULL;
+}
+
 /*
  * Stage 1 of the add pipeline: pure, no allocation.  Resolve the extent
  * to its region/endpoint decoder and ext_range, and verify the range
@@ -133,6 +178,8 @@ static int cxl_validate_extent(struct cxl_memdev_state *mds,
 {
 	u64 start_dpa = le64_to_cpu(extent->start_dpa);
 	struct cxl_memdev *cxlmd = mds->cxlds.cxlmd;
+	struct device *dev = mds->cxlds.dev;
+	const struct cxl_dpa_partition *part;
 	struct cxl_endpoint_decoder *cxled;
 	struct cxl_region *cxlr;
 	struct range ext_range = (struct range) {
@@ -140,6 +187,29 @@ static int cxl_validate_extent(struct cxl_memdev_state *mds,
 		.end = start_dpa + le64_to_cpu(extent->length) - 1,
 	};
 	struct range ed_range;
+	uuid_t uuid;
+
+	import_uuid(&uuid, extent->uuid);
+
+	part = cxl_extent_dc_partition(mds, extent, &ext_range);
+	if (!part)
+		return -ENXIO;
+	dev_dbg(dev, "DC extent DPA %pra (DCR:%pR)(%pU)\n", &ext_range,
+		&part->res, &uuid);
+
+	if (part->shareable) {
+		if (uuid_is_null(&uuid)) {
+			dev_err_ratelimited(dev,
+					    "DC extent DPA %pra: sharable-partition extent has null tag (firmware bug)\n",
+					    &ext_range);
+			return -ENXIO;
+		}
+	} else if (le16_to_cpu(extent->shared_extn_seq)) {
+		dev_err_ratelimited(dev,
+				    "DC extent DPA %pra (%pU): non-sharable partition but shared_extn_seq=%u (firmware bug)\n",
+				    &ext_range, &uuid, le16_to_cpu(extent->shared_extn_seq));
+		return -ENXIO;
+	}
 
 	cxlr = cxl_dpa_to_region(cxlmd, start_dpa, &cxled);
 	if (!cxlr || !cxlr->cxlr_dax)
-- 
2.43.0

