Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E300D486408
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466195; cv=none; b=thobT1TWPbZUaZnxkxzCkGzLA2oXwM6T/wBIuQXQi02xo5YbcbdKqkPlWsazKo4xpy2TalihdSi50m/ZD4hfafGudFSb9Ki8+gGpLdm2Bz0LS09MZYeCgJTjROjG96wf4pFrqHjJmDZU6S2OvAqX1WRjTQWJIsr0MdO85vPE0xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466195; c=relaxed/simple;
	bh=AcstOBvb2zgYrUaU2ey2gWpUK/KtSEJyzr51yPayYIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKnEpxRNhiGQYHit+rFo/8iA9XuSXCGRKLH68RYeZM7nc6uTk9f1iBLIEPEfN8K6wIzttdizrUs/JU9qEEOi9DZLHvg0MBwrYh8zWBnrILYnUB41rdnStKc76SEyBqFRnA+nxAowlE5nZdxiNCifLg/jJoc8SopASL3KORj9nFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PVBqWXJi; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PVBqWXJi"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so2933702a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789466191; x=1790070991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb8xpF2uVFMsN/uZzMazcJ5VUr9qagRKypQQ3GwIW+4=;
        b=PVBqWXJitNQ83Q2yZvMmBxWo4Y9AjIOyTueEVfqd3Rz1GLLUb1GkWXn7UVBSRTFGfp
         hcq3ZxaLmP+oTQ/5ok7MIARfxySDluDF7t5OYiIHkytxfktIDg2UE/UhDk0Cu4iatzCr
         ycfB6ygQg90ACybvEHOSj9/aQXyQy3w47QhWC+FEaa90QOEtZ/EJCYEdstCSRzfCcdf8
         84WxAWH3QwR8zXADDUz5AVZRnwZoj3oO/LrNt1OrgGtblEno6BhPRPX0frAny9Xri1+X
         Ix34fOsCTREM5Rcu9IihVMQ2iWESqqFoiiqWy0Cnq5siPNutgTvq1Vh1PH5OID+oLcj9
         fy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466191; x=1790070991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mb8xpF2uVFMsN/uZzMazcJ5VUr9qagRKypQQ3GwIW+4=;
        b=l3ibteC9XdRihbVZ+GIuQ7dwGZnJrcAg32IbPMsqCx8jvIeM54SQeKZWFeU9BZqDHT
         16SpNJIKVF5O63k2+eI/xOj/wdtB4PcW/G8+i/S8sbo28bQ69W7LQ20pGxA7fyuu0i0z
         vNrrdelouDV01FoCwL8oElTpwcCEyMPo68HsX6N3QsUuzFx4TcLOhVECPRl0KNYHKTeE
         jDFE33PZQCN0R+6T/YNGU8WVW9d/ElJvZCGzor44nSFK+Fx88AIMFEL5/RobfTQ9vX2z
         LPbigiAeYoia/Od4bExS33nmkCmEHFgunfK1KBNlKM2tdgJF0vjBJkJdln2L9eRcKPez
         FYRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZHIct237ozQ6ZTepw1E6nvUJ/yQ6nkuqtW/0f390cnROwNAh470aJljDY59OiFKaU89n8lOs+q35x/Ec=@vger.kernel.org
X-Gm-Message-State: AFuF++lOjwByAQObYA/OyqZZgh+dfKdwgJ891VXRmoQpVfGgXpTZUzFg
	dKrbe84DKntfVvYy84epb7j3X6XW15RF8AYzsBOGl7LEfYqwdUOP42zD/uysIr+cAf9OWZkbn64
	xg4FLwSA=
X-Gm-Gg: AYBFou3FQ6R36Cv65EWiF3pDV/YTc7qcloxJoDPdz6/uRIE3qEpF3aUQeVwny0xT1c7
	VvWb7VgImlTfghi6ndcLSl+tcGY8upXnCchwXzGLb5dMtubsPEw9yHQ9k6y3LTqRNbqDz6jhg6b
	fjEcCp/luwSKrHwj89HDBzweJ6lf7durq+/coRY0+j9lECDs9WyQFk1FCivlFzc8vT2Y3D6NVlx
	xAnfdxQDKcXzkUXYKLUGW9we+Ff1Cy8lgBvOz7YbyXcF1MYpmAr7iOZHR/oLV6pC3YIpxE8vTMH
	2TgRJfguSMiwNjENTDKLOd4yBl+4MGHYeJoHzxQa/xJVCKBu21hxdNx+Ac00lk9JLBPl4wP3Jkd
	5ruFomg8VlX/HPjehPD+cutGBuJNZd/be/Q9lFKH6Mp6AWbZuuAMucL1RrMoS5fkdfISRt/vRMw
	EUljNQofhC9b/j4v/45EA4KJRXVTn/0U2isTdeGQsCfBWZiVIhGHb8v11jbo3NfQUM0I14sglMS
	vtEO9xsoFo6aOudbpA=
X-Received: by 2002:a17:90b:1c90:b0:39d:f660:fa9c with SMTP id 98e67ed59e1d1-39df660fademr9376581a91.10.1789466190789;
        Tue, 15 Sep 2026 02:56:30 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6b9687sm4477827a91.0.2026.09.15.02.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:56:30 -0700 (PDT)
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
Subject: [PATCH 1/2] dax/bus: fix Device DAX range alignment validation
Date: Tue, 15 Sep 2026 17:56:20 +0800
Message-ID: <20260915095621.3744167-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915095621.3744167-1-songmuchun@bytedance.com>
References: <20260915095621.3744167-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_dax->align describes the page size used by a Device DAX mapping.
Both the start and size of every range must therefore be aligned to it;
otherwise the starting PFN cannot represent a naturally aligned page of
that size.

Only range sizes are currently validated. A dynamic device can therefore
select a large-page alignment and allocate a range whose start is not
naturally aligned to that page size. The device binds successfully, but a
subsequent write to a userspace mapping may trigger a kernel panic.

The automatic resize path can also split a size-aligned request across
arbitrary free gaps. When devices with different alignments fragment a
region, this can extend a range by less than its alignment. A later
allocation then fails, leaving the failed resize partially applied.

Validate both the start and size of allocated and adjusted ranges. Make
the resize path account only for usable aligned space before changing any
ranges, and skip gaps that cannot satisfy the device alignment. Initialize
the device alignment before allocating its initial range so that all
allocations use the same validation.

A mapping with an unaligned start is now rejected with -EINVAL, while a
naturally aligned mapping still binds successfully.

Fixes: 6d82120f4156 ("device-dax: add an 'align' attribute")
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/dax/bus.c | 143 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 109 insertions(+), 34 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index b809e1a264af..54e4bbc98218 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -848,6 +848,44 @@ static int devm_register_dax_mapping(struct dev_dax *dev_dax, int range_id)
 	return 0;
 }
 
+static inline unsigned long dev_dax_min_align(struct dev_dax *dev_dax)
+{
+	return max_t(unsigned long, dev_dax->align, memremap_compat_align());
+}
+
+static inline bool size_is_aligned(struct dev_dax *dev_dax, resource_size_t size)
+{
+	/*
+	 * The minimum mapping granularity for a device instance is a
+	 * single subsection, unless the arch says otherwise.
+	 */
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
@@ -870,6 +908,9 @@ static int alloc_dev_dax_range(struct dev_dax *dev_dax, u64 start,
 		return 0;
 	}
 
+	if (!range_is_aligned(dev_dax, start, size))
+		return -EINVAL;
+
 	alloc = __request_region(res, start, size, dev_name(dev), 0);
 	if (!alloc)
 		return -ENOMEM;
@@ -923,6 +964,9 @@ static int adjust_dev_dax_range(struct dev_dax *dev_dax, struct resource *res, r
 	if (dev_WARN_ONCE(dev, !size, "deletion is handled by dev_dax_shrink\n"))
 		return -EINVAL;
 
+	if (!range_is_aligned(dev_dax, range->start, size))
+		return -EINVAL;
+
 	rc = adjust_resource(res, range->start, size);
 	if (rc)
 		return rc;
@@ -955,15 +999,6 @@ static ssize_t size_show(struct device *dev,
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
@@ -1030,30 +1065,55 @@ static bool adjust_ok(struct dev_dax *dev_dax, struct resource *res)
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
 
 	to_alloc = size - dev_size;
-	if (dev_WARN_ONCE(dev, !alloc_is_aligned(dev_dax, to_alloc),
-			"resize of %pa misaligned\n", &to_alloc))
+	if (dev_WARN_ONCE(dev, !size_is_aligned(dev_dax, to_alloc),
+			  "resize of %pa misaligned\n", &to_alloc))
 		return -ENXIO;
+	if (to_alloc > dax_region_aligned_avail_size(dax_region, dev_dax))
+		return -ENOSPC;
 
 	/*
 	 * Expand the device into the unused portion of the region. This
@@ -1062,37 +1122,52 @@ static ssize_t dev_dax_resize(struct dax_region *dax_region,
 	 */
 retry:
 	first = region_res->child;
-	if (!first)
-		return alloc_dev_dax_range(dev_dax, dax_region->res.start, to_alloc);
+	if (!first) {
+		resource_size_t start = region_res->start;
+
+		alloc = aligned_gap_size(dev_dax, &start, region_res->end);
+		return alloc_dev_dax_range(dev_dax, start,
+				min(alloc, to_alloc));
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
@@ -1115,7 +1190,7 @@ static ssize_t size_store(struct device *dev, struct device_attribute *attr,
 	if (rc)
 		return rc;
 
-	if (!alloc_is_aligned(dev_dax, val)) {
+	if (!size_is_aligned(dev_dax, val)) {
 		dev_dbg(dev, "%s: size: %lld misaligned\n", __func__, val);
 		return -EINVAL;
 	}
@@ -1201,7 +1276,7 @@ static ssize_t mapping_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	to_alloc = range_len(&r);
-	if (alloc_is_aligned(dev_dax, to_alloc))
+	if (size_is_aligned(dev_dax, to_alloc))
 		rc = alloc_dev_dax_range(dev_dax, r.start, to_alloc);
 	up_write(&dax_dev_rwsem);
 	up_write(&dax_region_rwsem);
@@ -1224,9 +1299,9 @@ static ssize_t dev_dax_validate_align(struct dev_dax *dev_dax)
 	int i;
 
 	for (i = 0; i < dev_dax->nr_range; i++) {
-		size_t len = range_len(&dev_dax->ranges[i].range);
+		struct range *range = &dev_dax->ranges[i].range;
 
-		if (!alloc_is_aligned(dev_dax, len)) {
+		if (!range_is_aligned(dev_dax, range->start, range_len(range))) {
 			dev_dbg(dev, "%s: align %u invalid for range %d\n",
 				__func__, dev_dax->align, i);
 			return -EINVAL;
@@ -1464,6 +1539,7 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 		return ERR_PTR(-ENOMEM);
 
 	dev_dax->region = dax_region;
+	dev_dax->align = dax_region->align;
 	if (is_static(dax_region)) {
 		if (dev_WARN_ONCE(parent, data->id < 0,
 				"dynamic id specified to static region\n")) {
@@ -1522,7 +1598,6 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 
 	dev_dax->dax_dev = dax_dev;
 	dev_dax->target_node = dax_region->target_node;
-	dev_dax->align = dax_region->align;
 	ida_init(&dev_dax->ida);
 
 	dev_dax->memmap_on_memory = data->memmap_on_memory;
-- 
2.54.0

