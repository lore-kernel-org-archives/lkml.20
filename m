Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027743CE64
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065568; cv=none; b=EhmlxuDYy8Md1orByzpuyDkSY5h28UjutKNgw+VTlkw6xk1AWos14MkZ1tB35n/EZgyPzpvTsCPT48SEfIUl7CwEYqWWA89mqKyfAnkd6Sl4IhbOcbosmBh6v42pTcz+CUcwTXeui4ZGaVM08vt3KZBUuvROK4Bo1XP+pwgauuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065568; c=relaxed/simple;
	bh=gDuzCbBWa4i/QzDHVpki1vGVufDbJq3yyqVO9iAFePk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRaJ8/aV+GZGlNIUOBz6zKsl+svJ+i/wqyZUsZ+9ivJzntkf63cNAHkrsJtSDvaHnwyG8yTfZk06KrwTui283t10Qjl21jgpK5g/K0aYqz7w87YfeGicTQTZ8bL2S0kJem+V/A8L9tt0W3YKXeqYnMzhuCtRYQLYkKL/D6pvWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ai9XPhsm; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ai9XPhsm"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso4490778a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790065565; x=1790670365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0brUoJgl363yZ4gkPK7I4CZdxK+wxHx8g/cRElUmljE=;
        b=Ai9XPhsmZkzfxSRvFHu9WuPARKhoryBo8FM4KiJ+v95RMeVhBPnYflIZlbg/u9pAOy
         Djs/WhNQBPL5w4l5loA9dEv6musAclP9aAIk/Wz5F2AkN2VfMjFi3lF2CoxaXzrQdhhz
         vnvTv8QsOXe6OfUVCjqbkk3BxHcHplCgA7XVEIV1VwsmkR90uOqlvTK849bNZZ69z+fN
         Cf8mI1VmT1oD0Wxh1UCLLkQq0lh8Y5pHnnjALtNWmXLzWBDCdAxnGfhodAGkIFzBjdN5
         R3I1e8IHXxqHzLuwltJ5C1wZP6u0f2sFMCFA3+wBl5ZaAgTL7OahkUpk18yhlCRe40NL
         tiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065565; x=1790670365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0brUoJgl363yZ4gkPK7I4CZdxK+wxHx8g/cRElUmljE=;
        b=xR2EKtr3taR7Yupv1Y4P2riOSAzIxp9C0ig45rkl+ovhCB34ONsHB3+nI8C1kM1ZzB
         tUa9nduLtP8HPKQT5iIw66BnsaasR17wW6e0C/shvh1bhE2m79zrvkkB4xtEe5r03XAn
         DfuNc4j7ib/N05hptq+vc5uFRJ06B8XUU89jdJmNWoE2N1gZLw5OhD82Zuio8WyilJvO
         +rVKMF/Y1GS7O72NEK8cuNDiWrEUSWG6bemtCkxWnxP6Nog3Jaq/bQPKNvJYp9Ve6O/g
         gXqo5XnpGugBHqNMt7ezsLdp2AxIbO6vohOth/1OFa1gnFiGHgh2uhqzADV0GZB/4L8E
         kZng==
X-Forwarded-Encrypted: i=1; AKwUvBxE0OeivGotvBmKOIkt+79bpYEdbmgxoNcmS63r47nLHuF1AY3b+rz8/C+TQGl1HlaZpmKGgNBcf9CT280=@vger.kernel.org
X-Gm-Message-State: AFuF++nAI1IG4BgID6vGAiiregko/bQIWYiBLo8Kyr9ITuGyyI2PMliO
	0MP361sK2piv35/R9bJrd9sBd8LfjtilotJmH3Z0JnVNI69b/mw2hr/MbJ3n7Z8rwgA=
X-Gm-Gg: AYBFou2Wz8JT91LXGpfdJTawHVYLNs3R6ullvkXqz9Cy48aW2/uYufFPtwt9tQyTGZ8
	Aomw/uWWpfEsRbi6ioYJbRiwN+ramwfrWFbPdasadPWtH+CjByshmHjP36ijJReQWfBMsWiCUhr
	GwBIOdZxbiQKYS4uVhhVUjCmTo/IU6gYwN0zMvuwutKMvZpcOgYLKuWPX7n3cmDO6gfC5MOnU8/
	cQOmvm79ALlgwszpfZ/PwXIeIa7kqXFPCpgbHegg2rtpAp4nShlckWseZudSVIg/qpTkfhpm00f
	tk1VSfUm/G5vUYytz8mXI67G+yk0kCNMzl5Ohr6KEa9/OFw95g7FRit0fC0Qh67Q4adH/0h/H7e
	MizlAh9L3rKsh+hZTaKJSDBdyaLf1imp8gEPCd7e2MxBZNBsp8WRcxGCeArBOLs7v09S5Rn6D1P
	X28lXLXFkE66dCXxNVhpTHwrMeRsOcSaPdZpNCGpUCyXaV2eNpguM4K5Za1QmoaAeUzMGyiJZr2
	61mwcPEXJ/cQquE8fH6
X-Received: by 2002:a17:90a:da8c:b0:39e:4c81:6c96 with SMTP id 98e67ed59e1d1-3a073128f99mr412576a91.28.1790065564966;
        Tue, 22 Sep 2026 01:26:04 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07385e516sm223056a91.0.2026.09.22.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:26:04 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dax/bus: fix Device DAX range alignment validation
Date: Tue, 22 Sep 2026 16:25:51 +0800
Message-ID: <20260922082551.874901-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922082551.874901-1-songmuchun@bytedance.com>
References: <20260922082551.874901-1-songmuchun@bytedance.com>
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
v2:
- Keep the alloc_is_aligned() name to avoid unrelated helper renaming
  (suggested by Dave Jiang)
- Move this patch after the mapping error reporting fix for independent
  backports (suggested by Dave Jiang)
---
 drivers/dax/bus.c | 134 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 104 insertions(+), 30 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index e40c25401cf0..277c3ce23b83 100644
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
+static inline bool alloc_is_aligned(struct dev_dax *dev_dax, resource_size_t size)
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
@@ -1030,23 +1065,46 @@ static bool adjust_ok(struct dev_dax *dev_dax, struct resource *res)
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
 
@@ -1054,6 +1112,8 @@ static ssize_t dev_dax_resize(struct dax_region *dax_region,
 	if (dev_WARN_ONCE(dev, !alloc_is_aligned(dev_dax, to_alloc),
 			"resize of %pa misaligned\n", &to_alloc))
 		return -ENXIO;
+	if (to_alloc > dax_region_aligned_avail_size(dax_region, dev_dax))
+		return -ENOSPC;
 
 	/*
 	 * Expand the device into the unused portion of the region. This
@@ -1062,37 +1122,51 @@ static ssize_t dev_dax_resize(struct dax_region *dax_region,
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
@@ -1228,9 +1302,9 @@ static ssize_t dev_dax_validate_align(struct dev_dax *dev_dax)
 	int i;
 
 	for (i = 0; i < dev_dax->nr_range; i++) {
-		size_t len = range_len(&dev_dax->ranges[i].range);
+		struct range *range = &dev_dax->ranges[i].range;
 
-		if (!alloc_is_aligned(dev_dax, len)) {
+		if (!range_is_aligned(dev_dax, range->start, range_len(range))) {
 			dev_dbg(dev, "%s: align %u invalid for range %d\n",
 				__func__, dev_dax->align, i);
 			return -EINVAL;
@@ -1468,6 +1542,7 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 		return ERR_PTR(-ENOMEM);
 
 	dev_dax->region = dax_region;
+	dev_dax->align = dax_region->align;
 	if (is_static(dax_region)) {
 		if (dev_WARN_ONCE(parent, data->id < 0,
 				"dynamic id specified to static region\n")) {
@@ -1526,7 +1601,6 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 
 	dev_dax->dax_dev = dax_dev;
 	dev_dax->target_node = dax_region->target_node;
-	dev_dax->align = dax_region->align;
 	ida_init(&dev_dax->ida);
 
 	dev_dax->memmap_on_memory = data->memmap_on_memory;
-- 
2.54.0

