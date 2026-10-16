Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6181395AE9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129198; cv=none; b=P5FXyCtSDd6ozfGE3GD45E2v+/TefgAGBk/+MfQDWeJGEA9L8qkR3DFsvdfc96xGxcJeZbbwlsdAQC+kj5f5qQIq1iR44BUSuPj+LpriT/QBJcSTTNiyAuN/wVbavxjAEkuSg1fSIK4OWJ65cri6ONBuMBHmtxHmukSilMO8F/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129198; c=relaxed/simple;
	bh=2LIrUwpNUkkU4dudMq0Fjr/UIH04OXmByla0vhmIHfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PgRFVP737orHJLehopo1SXoejtiafkjXM+Rvp8Y3ccovrwDH6Ay9lTt5Dkk6xeSIrrpraC4MEiGEqGccl0bniFWafUjR4lg4MQ7LCD6kqXqXzvgKrwSIOt9uqwJ16j3GiuHvF2cS2IFlzvE1GykjIMpwlpLxtUNYQ+2IB+tc6Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RoBalEuR; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RoBalEuR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so4978767a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792129195; x=1792733995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lytsDBTst1exhQP76NkuNPJwTPpZJBfjpgNGjRlsaMM=;
        b=RoBalEuR0j9hQs9OuhIAq7fMmrRd7zPkoUEk07e/nYgyX726PrAH7kUPWgTTh9xLUP
         GeqKoe8pL1pjf7qXL1jQs0yf7mPxr0v+i2dWxzeeAUDbiUoT52lwmMH0mdJBTh6wtldl
         L7sRIBLxDjzkqZtpreAkhKG1v08y86w1wsbuZ025LA1X04ThVOSOWCzIVPRrThypRoHh
         h67cvkMI6MAoFVVHY7S32dU4unMEaVIQ8yTdUMQDksQcSOvYCsKIx3DfYe7IjDzZUc1Y
         KzNA3EKoFn+eop6M6LLGbQ0h0m7PwU0102AtUA4DbPR5vVpIraTm9MxUPo6b0XF0ud5o
         3vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129195; x=1792733995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lytsDBTst1exhQP76NkuNPJwTPpZJBfjpgNGjRlsaMM=;
        b=If3QvDGGv+NlG2/LDtk5+NBMtDh8Fvi+mNLoYYovUJuISv3mIaDuxdRmkSwWqu2ViH
         /KundZcEKbfONgKrW4Hh6kbJ2SF7pOxtiedCaU8gB9VjtCOoykT34U2rjKF39lcPRcbQ
         mf7DUjDrlTLappSLbM38GaHICY3pZ3b3UN5Y/WTFrgCg3QfGyEPRZTU71qj1Flx9EmJb
         CaJHTLwe139MeFmrjhw8r8VA/VSsZtIxJN2lVU1m9tW1i/UiXQuD4j2yTXVm5PRNRtqP
         8A19YT60/Tafp1LeZEQmknU1m+pYS/CW4f97YbG1ENC8dk2DnA0u41MwyXjTl65UMmMc
         5HTA==
X-Forwarded-Encrypted: i=1; AKwUvBze+yqcmvK/ZD+nr29X1GyEZd70b0B4YCoZ6ncDSg/f3eppywsBvmOc754hRXIuMxasXuMV4dChDZJwXcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJc9+kc2RhRiYL+VOi9B0wyX1EhBXI99bqN1YneK0J8CGR9yfz
	5Jd0xrJM3X2F6xoQWLEuJPi1269VGJA7HrEAtqCgOODnHIOkG/MHXSKW1aiLv6shxe8=
X-Gm-Gg: AYBFou1DsZPBOPkCfn0k6Jmr2NePIsDVRi+Z/FtErb1tsQrOUVkEg1PLMzrzFTbzv8L
	PF0Mlt/OBXSvT48FyE5XfB5ZcNwlWsWYP0p+FoufqSb5u643InxMAEII2kLW7MgoIcCED6E04pZ
	DA4DZFvrtQnH3BUztUK9cEgF6uzpODOQBvjsgpQAzpsPeaJwX6vLwsh/2lQTc+ydyG2m717CeSM
	6RQy3jMm925MenkZYls1uYwaOyxFcPlkiaXYYrq6hvpYk1YORx5CxUu1bR7Qc1y8G5mOCRGNh0e
	PCY/y7/gts7VuxnB+NyjL6ll3NMh9zM0YEUyt909gr0VzV/sxdZF3phF+K4OGfmQNr16IRHcG27
	XWFqLUF+94aaFVdyI6Wn8Jfhu+06HQx56J9D9NganwoBYyrMLKLR2Fxx6O+KOFkeXTF+EakHqr3
	/FDV02aLkOYAQZaUK6cPtyPpIi/0fIb2uS3XyZ2RF5kGceEZDmfkPLPO/XMuVH+jV1Mu8N5AIr+
	8AZjyQJ8gOXapmyV+KFFqyTfTstG7m8
X-Received: by 2002:a17:90a:d00f:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3ac7556a4ccmr6625530a91.19.1792129194897;
        Thu, 15 Oct 2026 22:39:54 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b16c2asm600703a91.2.2026.10.15.22.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:39:53 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v4] dax/bus: fix Device DAX range alignment validation
Date: Fri, 16 Oct 2026 13:39:44 +0800
Message-ID: <20261016053944.2579541-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only range sizes are currently validated against dev_dax->align. A
dynamic device can therefore select a large-page alignment and allocate a
range whose start is not naturally aligned. The device binds successfully,
but a later write to a userspace mapping may trigger a kernel panic.

The automatic resize path can also split a size-aligned request across
arbitrary free gaps. When devices with different alignments fragment a
region, this can extend a range by less than the device alignment. A later
allocation then fails, leaving the failed resize partially applied.

Initialize the device alignment before its first allocation. Validate both
the start and size of allocated and adjusted ranges, account only for
aligned free space before changing ranges, skip unusable gaps, and
serialize size validation with alignment updates.

Static Device DAX already has a pre-populated pgmap whose full range was
validated against memremap_compat_align(). Its usable data range may begin
after namespace metadata, so require only dev_dax->align for static
devices. Dynamic Device DAX builds its pgmap from the allocated ranges and
must continue to satisfy both alignments.

Fixes: 6d82120f4156 ("device-dax: add an 'align' attribute")
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v4:
- Use dev_dax->align alone for static Device DAX ranges to preserve
  older 4K namespaces (reported by Alison Schofield)
- Condense the commit message to the failure scenarios and required fixes
  (suggested by Alison Schofield)

v3:
- Serialize size alignment validation with alignment updates to avoid a
  partial shrink after a concurrent alignment change (reported by Sashiko)
- Document the size validation serialization in the commit message

v2:
- Keep the alloc_is_aligned() name to avoid unrelated helper renaming
  (suggested by Dave Jiang)
- Move this patch after the mapping error reporting fix for independent
  backports (suggested by Dave Jiang)
---
 drivers/dax/bus.c | 152 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 117 insertions(+), 35 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index b809e1a264af..b2c83a0e4ec5 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -848,6 +848,52 @@ static int devm_register_dax_mapping(struct dev_dax *dev_dax, int range_id)
 	return 0;
 }
 
+static inline unsigned long dev_dax_min_align(struct dev_dax *dev_dax)
+{
+	/*
+	 * A static device has a pre-populated pgmap whose range already
+	 * satisfies memremap_compat_align(). Its data range may start after
+	 * metadata at dev_dax->align granularity.
+	 */
+	if (static_dev_dax(dev_dax))
+		return dev_dax->align;
+
+	/*
+	 * The minimum mapping granularity for a dynamic device instance is a
+	 * single subsection, unless the arch says otherwise.
+	 */
+	return max_t(unsigned long, dev_dax->align, memremap_compat_align());
+}
+
+static inline bool alloc_is_aligned(struct dev_dax *dev_dax, resource_size_t size)
+{
+	return IS_ALIGNED(size, dev_dax_min_align(dev_dax));
+}
+
+static inline bool range_is_aligned(struct dev_dax *dev_dax, u64 start,
+				    resource_size_t size)
+{
+	return IS_ALIGNED(start | size, dev_dax_min_align(dev_dax));
+}
+
+static resource_size_t
+aligned_gap_size(struct dev_dax *dev_dax, resource_size_t *start,
+		 resource_size_t end)
+{
+	resource_size_t aligned_start = ALIGN(*start, dev_dax_min_align(dev_dax));
+	resource_size_t size;
+
+	if (aligned_start < *start || aligned_start > end)
+		return 0;
+
+	size = ALIGN_DOWN(end - aligned_start + 1, dev_dax_min_align(dev_dax));
+	if (!size)
+		return 0;
+
+	*start = aligned_start;
+	return size;
+}
+
 static int alloc_dev_dax_range(struct dev_dax *dev_dax, u64 start,
 		resource_size_t size)
 {
@@ -870,6 +916,9 @@ static int alloc_dev_dax_range(struct dev_dax *dev_dax, u64 start,
 		return 0;
 	}
 
+	if (!range_is_aligned(dev_dax, start, size))
+		return -EINVAL;
+
 	alloc = __request_region(res, start, size, dev_name(dev), 0);
 	if (!alloc)
 		return -ENOMEM;
@@ -923,6 +972,9 @@ static int adjust_dev_dax_range(struct dev_dax *dev_dax, struct resource *res, r
 	if (dev_WARN_ONCE(dev, !size, "deletion is handled by dev_dax_shrink\n"))
 		return -EINVAL;
 
+	if (!range_is_aligned(dev_dax, range->start, size))
+		return -EINVAL;
+
 	rc = adjust_resource(res, range->start, size);
 	if (rc)
 		return rc;
@@ -955,15 +1007,6 @@ static ssize_t size_show(struct device *dev,
 	return sysfs_emit(buf, "%llu\n", size);
 }
 
-static bool alloc_is_aligned(struct dev_dax *dev_dax, resource_size_t size)
-{
-	/*
-	 * The minimum mapping granularity for a device instance is a
-	 * single subsection, unless the arch says otherwise.
-	 */
-	return IS_ALIGNED(size, max_t(unsigned long, dev_dax->align, memremap_compat_align()));
-}
-
 static int dev_dax_shrink(struct dev_dax *dev_dax, resource_size_t size)
 {
 	resource_size_t to_shrink = dev_dax_size(dev_dax) - size;
@@ -1030,23 +1073,46 @@ static bool adjust_ok(struct dev_dax *dev_dax, struct resource *res)
 	return true;
 }
 
+static resource_size_t
+dax_region_aligned_avail_size(struct dax_region *dax_region,
+			      struct dev_dax *dev_dax)
+{
+	struct resource *region_res = &dax_region->res;
+	resource_size_t start = region_res->start;
+	resource_size_t avail = 0;
+	struct resource *res;
+
+	lockdep_assert_held_write(&dax_region_rwsem);
+
+	for_each_dax_region_resource(dax_region, res) {
+		if (res->start > start) {
+			resource_size_t gap_start = start;
+
+			avail += aligned_gap_size(dev_dax, &gap_start,
+					res->start - 1);
+		}
+		start = res->end + 1;
+	}
+	if (start <= region_res->end)
+		avail += aligned_gap_size(dev_dax, &start, region_res->end);
+
+	return avail;
+}
+
 static ssize_t dev_dax_resize(struct dax_region *dax_region,
 		struct dev_dax *dev_dax, resource_size_t size)
 {
-	resource_size_t avail = dax_region_avail_size(dax_region), to_alloc;
 	resource_size_t dev_size = dev_dax_size(dev_dax);
 	struct resource *region_res = &dax_region->res;
 	struct device *dev = &dev_dax->dev;
 	struct resource *res, *first;
-	resource_size_t alloc = 0;
+	resource_size_t alloc, to_alloc;
 	int rc;
 
 	if (dev->driver)
 		return -EBUSY;
 	if (size == dev_size)
 		return 0;
-	if (size > dev_size && size - dev_size > avail)
-		return -ENOSPC;
 	if (size < dev_size)
 		return dev_dax_shrink(dev_dax, size);
 
@@ -1054,6 +1120,8 @@ static ssize_t dev_dax_resize(struct dax_region *dax_region,
 	if (dev_WARN_ONCE(dev, !alloc_is_aligned(dev_dax, to_alloc),
 			"resize of %pa misaligned\n", &to_alloc))
 		return -ENXIO;
+	if (to_alloc > dax_region_aligned_avail_size(dax_region, dev_dax))
+		return -ENOSPC;
 
 	/*
 	 * Expand the device into the unused portion of the region. This
@@ -1062,37 +1130,51 @@ static ssize_t dev_dax_resize(struct dax_region *dax_region,
 	 */
 retry:
 	first = region_res->child;
-	if (!first)
-		return alloc_dev_dax_range(dev_dax, dax_region->res.start, to_alloc);
+	if (!first) {
+		resource_size_t start = region_res->start;
+
+		alloc = aligned_gap_size(dev_dax, &start, region_res->end);
+		return alloc_dev_dax_range(dev_dax, start, min(alloc, to_alloc));
+	}
 
 	rc = -ENOSPC;
 	for (res = first; res; res = res->sibling) {
 		struct resource *next = res->sibling;
+		resource_size_t start, end;
 
 		/* space at the beginning of the region */
 		if (res == first && res->start > dax_region->res.start) {
-			alloc = min(res->start - dax_region->res.start, to_alloc);
-			rc = alloc_dev_dax_range(dev_dax, dax_region->res.start, alloc);
-			break;
+			start = dax_region->res.start;
+			end = res->start - 1;
+			alloc = min(aligned_gap_size(dev_dax, &start, end), to_alloc);
+			if (alloc) {
+				rc = alloc_dev_dax_range(dev_dax, start, alloc);
+				break;
+			}
 		}
 
-		alloc = 0;
 		/* space between allocations */
-		if (next && next->start > res->end + 1)
-			alloc = min(next->start - (res->end + 1), to_alloc);
-
-		/* space at the end of the region */
-		if (!alloc && !next && res->end < region_res->end)
-			alloc = min(region_res->end - res->end, to_alloc);
+		if (next) {
+			if (next->start <= res->end + 1)
+				continue;
+			end = next->start - 1;
+		} else {
+			/* space at the end of the region */
+			if (res->end >= region_res->end)
+				continue;
+			end = region_res->end;
+		}
 
+		start = res->end + 1;
+		alloc = min(aligned_gap_size(dev_dax, &start, end), to_alloc);
 		if (!alloc)
 			continue;
 
-		if (adjust_ok(dev_dax, res)) {
+		if (start == res->end + 1 && adjust_ok(dev_dax, res)) {
 			rc = adjust_dev_dax_range(dev_dax, res, resource_size(res) + alloc);
 			break;
 		}
-		rc = alloc_dev_dax_range(dev_dax, res->end + 1, alloc);
+		rc = alloc_dev_dax_range(dev_dax, start, alloc);
 		break;
 	}
 	if (rc)
@@ -1115,11 +1197,6 @@ static ssize_t size_store(struct device *dev, struct device_attribute *attr,
 	if (rc)
 		return rc;
 
-	if (!alloc_is_aligned(dev_dax, val)) {
-		dev_dbg(dev, "%s: size: %lld misaligned\n", __func__, val);
-		return -EINVAL;
-	}
-
 	rc = down_write_killable(&dax_region_rwsem);
 	if (rc)
 		return rc;
@@ -1130,6 +1207,11 @@ static ssize_t size_store(struct device *dev, struct device_attribute *attr,
 	rc = down_write_killable(&dax_dev_rwsem);
 	if (rc)
 		goto err_dev;
+	if (!alloc_is_aligned(dev_dax, val)) {
+		dev_dbg(dev, "%s: size: %lld misaligned\n", __func__, val);
+		rc = -EINVAL;
+		goto err_dev;
+	}
 
 	rc = dev_dax_resize(dax_region, dev_dax, val);
 
@@ -1224,9 +1306,9 @@ static ssize_t dev_dax_validate_align(struct dev_dax *dev_dax)
 	int i;
 
 	for (i = 0; i < dev_dax->nr_range; i++) {
-		size_t len = range_len(&dev_dax->ranges[i].range);
+		struct range *range = &dev_dax->ranges[i].range;
 
-		if (!alloc_is_aligned(dev_dax, len)) {
+		if (!range_is_aligned(dev_dax, range->start, range_len(range))) {
 			dev_dbg(dev, "%s: align %u invalid for range %d\n",
 				__func__, dev_dax->align, i);
 			return -EINVAL;
@@ -1464,6 +1546,7 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 		return ERR_PTR(-ENOMEM);
 
 	dev_dax->region = dax_region;
+	dev_dax->align = dax_region->align;
 	if (is_static(dax_region)) {
 		if (dev_WARN_ONCE(parent, data->id < 0,
 				"dynamic id specified to static region\n")) {
@@ -1522,7 +1605,6 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 
 	dev_dax->dax_dev = dax_dev;
 	dev_dax->target_node = dax_region->target_node;
-	dev_dax->align = dax_region->align;
 	ida_init(&dev_dax->ida);
 
 	dev_dax->memmap_on_memory = data->memmap_on_memory;

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.54.0

