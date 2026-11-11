Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423575;
	b=5Wxc2SPphAPYddfw0hoiQ5bn1RnMVcg84awNo7d0uZinnSu9UoIAAusCRDYveP7OjaDH
	 ejTjrdu03VRgWQGRcSPwr9VWLhjjVWg8MEa0BS1fTrb6uswiShEMjIgv05/CsSLEGwjNc
	 5/L4xxjuPB5/f8WlE3j3DOGT4pUFi9tDmlZMunEq4zf5Be+df+JNnmk1QpXenDPuiYKMN
	 CA1h9xzXKLMbNPZ+lnsn+hdHa5FiyF1uTqdobrzOASZB2JvUdEoXZnjEn0QxkFHaCI/ut
	 o6yltJb1rWGpDzgVJN12cumavtExQCGHu0Up4Ci0ZJ7kbRtiREForceIj66x8fyMkxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dP2oeFHU9BvttHwF7lYu/d5azxjatcg4Ek6ABC7ZmHE=;
	b=bU2Io0zK3aATCcL56g0c0GmWPIq0BGjZfZfMpCTyiDoMXEI7ym6wjM5rxFogG904eeyV
	 VQIjAJeIF+Jp4DH7ranWqmLeLAfQuTuH1HC+7tXiqPD5m5gCCFxL3vPC4vbXF7xo6XF8w
	 f60+1Lz5Byd1EE332OqGt8+sJa6HRlIBrzEJluyDvlxyTFu3iRY5VT21k3gaKuERWLbKL
	 qHOwq6eeiRvLJbxYsdcwiOgxvkeXX+tGjPR1B5xoUvR1kFGH0QvPgUhBV4w28mVn5ooU2
	 iPOoGwA0m1wMPry/xq8FXhHQ/u7/Bq9lHsW2mKzg1UUPMEuKBCBSlynLPPLfjTC5KFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vvkonYD9;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B3606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55B3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vvkonYD9
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so28474345e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423573; x=1795028373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dP2oeFHU9BvttHwF7lYu/d5azxjatcg4Ek6ABC7ZmHE=;
        b=vvkonYD9YM1KYkyIRFQehOzEx1ns5pzxWxr56Z7HDl55SmR/3uYGkqMj/3rXaa9mDI
         8HDrt9yqX++cpHZincdhvW/DhMBxlsdyeavz2ATPwe0ElUgf5BO1EtXD7pOdUWBZF3Km
         v9YHi+j0XuKvVud6XUN82/MZyDTAjFl2YLtpQ7mkK8itGh43L5TWubcO+PN4nkf2wUdU
         Oe7yJbnmuCj7/gGtC9PP9BHLtmLsTHfMqvYbfYJi0sa9x+F9WFQiWS4lA7dxO6VR+Psk
         +581gp9Xf93RZ/UKrMT3r27KOeW103MtajiBiPuQfNCaLseNlwMlP86o1ke6QY+QtNuW
         /fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423573; x=1795028373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dP2oeFHU9BvttHwF7lYu/d5azxjatcg4Ek6ABC7ZmHE=;
        b=OfNgtFZf00Z5UEieryx6WkXVCK5a5zM8vpnTLGKQmW/PCXT+sAkLfoTIMaFcTCQ9Ci
         DLgKcziW0mRnS30qV6sL4POxfMZb1pM37XogEbQCVYZqY6TlVAfToPcik4bayPuS4mK1
         4AY4UGB0/WZNWr7L20syx8t5Otct79T5S2yZVmBrRVOdBYaZ6VcDPN+memKHPvCOpxND
         CBroRuMQRlIq2m4IoJ/xdtvqjFgD01sZpkuFxJOVkaWGyTM2cB2NcxA/48QLS++K0WJw
         fFzQvgY26uaUR2hE6dI2nOEfjgAOD7R4ivQq83h6DXKWf/r+4FKu2BkpANGiA7s09TSR
         UJXA==
X-Forwarded-Encrypted: i=1; AL+hErF0dkSD0q3sn+Hg/UH37vJRGljsiFsPAMpC2iS21lM2YagIMd7UrurkUDMP527pLZU8Qj0IMrc7Y2A3BHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+daWT+mjLC1sijoZffeONOf0QAtQf6IAux6NxmDS2ZjtIC+ZKa
	3Y+e7ZZkt7Ti46qracIp3PAUljkjkfjTTZXL9PfAcL2t4h/0TJcAtBPc
X-Gm-Gg: AYBFou1J/tKcwC1DWpRnkdHrfMZ87qJd7/ur2Y1j2m10od4tfcrE4CF/79jb2isH4Ah
	neDqVyioKXPRBEAkmU3s2N6wbfzVwHD/Sg3T9s6z3i66EBOgkInjY9e23tmfPbIL8YdanmteZNN
	OEZR48YDYy2XWfajYcD4iqFKTRX4wgqcvfY3qgM/s0nuRIcnBAM7qUxrD8Y1sYlj8anOyhSB6xT
	omuLIMa+XIF+h50/6zwW0nzMpyD13s9mjZ0jGrC+ykroo3XaaD+hctjU1BIqkTmVrspmrUyvhpc
	iYEcAsPbahcU2/U8cVTC6COkGNPRM8hpzr6YMANrsGGHcqRKdOVW6ApIh+b8siHXgSTAJl6Pcf6
	JOSxHMycuWF9zrcDGnaBXHOMlxmiD5BtFUzpMVud6WG574MtUvuA/7SE7XJfpXtDC4smpzjyC+Y
	lW333EbeVuJB3POY/I0hA0XpyhzMQDEwAgoqYkYtZFFMFDcguCAnZYOtVy6F3mcDp+reYbq2Eob
	MpxTsmc63Dp0orQpRv3V2J47BCOmCz0zKd2gcb1K+JF5c3Wnyv2vEcSOxFsrB/1o5NvyI7uK9VZ
	PJ43+4F5SlkLcdaM2uer8iTKLOv0/8Dq3YOyixmsi4V3DTlYiLbNEsAtsorzMxvMK5peuvruwfp
	vnSBVt0NoH+E58MRLzdt6NaN08q+xHKUGxOBsU1RC9VhAg1uwczceRPWH2eg6RRu2r5PmnQ4B7a
	9KB0oIUHWYN6nS
X-Received: by 2002:a05:600c:4f12:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ba09365bc4mr65500225e9.17.1794423573100;
        Wed, 11 Nov 2026 10:59:33 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm9161435e9.9.2026.11.11.10.59.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:59:32 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Guanghui Feng <guanghuifeng@linux.alibaba.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	nh-open-source@amazon.com
Subject: [PATCH 1/3] iommupt: Add iommu_unmap_sparse()
Date: Wed, 11 Nov 2026 18:59:29 +0000
Message-ID: <20261111185931.94882-2-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111185931.94882-1-griffoul@gmail.com>
References: <20261111185931.94882-1-griffoul@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

iommu_unmap() stops at the first IOVA that is not mapped, and it does
not report what it removed. A caller that needs the physical addresses
has to look up each page with iommu_iova_to_phys() first, then walk the
page table again to unmap.

Add iommu_unmap_sparse() for domains that use the generic page table
(iommupt), which steps over holes. An optional record function receives
the IOVA, physical address and size of each mapping before it is
cleared, and can stop the walk by returning false, for example when the
caller's storage is full. The walk also stops before a mapping that
extends past the end of the range, and the function returns the number
of bytes processed so the caller can resume from there. The device can
still reach the memory until the IOTLB is flushed at the end of the
call, so the record function must not free or unpin it.

With iommu.debug_pagealloc, account for each mapping as it is removed,
not for the whole range up front, because the walk can stop before the
end of the range.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 drivers/iommu/generic_pt/iommu_pt.h       |  61 ++++++++-
 drivers/iommu/generic_pt/kunit_iommu_pt.h | 144 ++++++++++++++++++++++
 drivers/iommu/iommu-debug-pagealloc.c     |  13 ++
 drivers/iommu/iommu-priv.h                |  24 ++++
 drivers/iommu/iommu.c                     |  76 ++++++++++++
 include/linux/generic_pt/iommu.h          |  24 ++++
 include/linux/iommu.h                     |  22 ++++
 7 files changed, 363 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
index 837d835e4fad8..780b813be3b31 100644
--- a/drivers/iommu/generic_pt/iommu_pt.h
+++ b/drivers/iommu/generic_pt/iommu_pt.h
@@ -993,7 +993,13 @@ static int NS(map_range)(struct pt_iommu *iommu_table, dma_addr_t iova,
 
 struct pt_unmap_args {
 	struct iommupt_pending_gather pending;
+	iommu_unmap_record_t record;
+	void *priv;
+	/* With sparse, the IOVA of the entry that stopped the walk */
+	pt_vaddr_t stopped;
 	pt_vaddr_t unmapped;
+	/* Step over entries that are not present instead of stopping */
+	bool sparse;
 };
 
 static __maybe_unused int __unmap_range(struct pt_range *range, void *arg,
@@ -1030,7 +1036,9 @@ static __maybe_unused int __unmap_range(struct pt_range *range, void *arg,
 	}
 
 	do {
-		if (pts.type != PT_ENTRY_OA) {
+		if (pts.type == PT_ENTRY_EMPTY && unmap->sparse) {
+			pts.index++;
+		} else if (pts.type != PT_ENTRY_OA) {
 			bool fully_covered;
 
 			if (pts.type != PT_ENTRY_TABLE) {
@@ -1072,6 +1080,26 @@ static __maybe_unused int __unmap_range(struct pt_range *range, void *arg,
 			 * the length returned will be larger than requested.
 			 */
 			num_contig_lg2 = pt_entry_num_contig_lg2(&pts);
+			if (unmap->sparse) {
+				unsigned int oasz_lg2 = pt_entry_oa_lg2sz(&pts);
+
+				if (pts.index != start_index)
+					pt_index_to_va(&pts);
+				/*
+				 * Stop before an entry that ends past the range
+				 * or that @record does not take. The error only
+				 * ends the walk, at unmap->stopped.
+				 */
+				if (!pt_entry_fully_covered(&pts, oasz_lg2) ||
+				    (unmap->record &&
+				     !unmap->record(unmap->priv, range->va,
+						    pt_entry_oa(&pts),
+						    log2_to_int(oasz_lg2)))) {
+					unmap->stopped = range->va;
+					ret = -ENOSPC;
+					break;
+				}
+			}
 			pt_clear_entries(&pts, num_contig_lg2);
 			gather_add_leaf(&unmap->pending, &pts);
 			num_oas += log2_to_int(num_contig_lg2);
@@ -1115,6 +1143,36 @@ static size_t NS(unmap_range)(struct pt_iommu *iommu_table, dma_addr_t iova,
 	return unmap.unmapped;
 }
 
+static size_t
+NS(unmap_range_sparse)(struct pt_iommu *iommu_table, dma_addr_t iova,
+		       dma_addr_t len, iommu_unmap_record_t record, void *priv,
+		       struct iommu_iotlb_gather *iotlb_gather)
+{
+	struct pt_unmap_args unmap = {
+		.pending.iotlb_gather = iotlb_gather,
+		.pending.free_list =
+			IOMMU_PAGES_LIST_INIT(unmap.pending.free_list),
+		.record = record,
+		.priv = priv,
+		.stopped = iova,
+		.sparse = true,
+	};
+	struct pt_range range;
+	size_t processed;
+	int ret;
+
+	ret = make_range(common_from_iommu(iommu_table), &range, iova, len);
+	if (ret)
+		return 0;
+
+	ret = pt_walk_range(&range, __unmap_range, &unmap);
+	processed = ret ? unmap.stopped - (pt_vaddr_t)iova : len;
+
+	/* One invalidation for the processed range, holes included */
+	gather_range_pending(&unmap.pending, iommu_table, iova, processed);
+	return processed;
+}
+
 static void NS(get_info)(struct pt_iommu *iommu_table,
 			 struct pt_iommu_info *info)
 {
@@ -1168,6 +1226,7 @@ static void NS(deinit)(struct pt_iommu *iommu_table)
 static const struct pt_iommu_ops NS(ops) = {
 	.map_range = NS(map_range),
 	.unmap_range = NS(unmap_range),
+	.unmap_range_sparse = NS(unmap_range_sparse),
 #if IS_ENABLED(CONFIG_IOMMUFD_DRIVER) && defined(pt_entry_is_write_dirty) && \
 	IS_ENABLED(CONFIG_IOMMUFD_TEST) && defined(pt_entry_make_write_dirty)
 	.set_dirty = NS(set_dirty),
diff --git a/drivers/iommu/generic_pt/kunit_iommu_pt.h b/drivers/iommu/generic_pt/kunit_iommu_pt.h
index 9fc71db74234d..8a52a6af87eda 100644
--- a/drivers/iommu/generic_pt/kunit_iommu_pt.h
+++ b/drivers/iommu/generic_pt/kunit_iommu_pt.h
@@ -83,6 +83,14 @@ static void do_unmap(struct kunit *test, pt_vaddr_t va, pt_vaddr_t len)
 	KUNIT_ASSERT_EQ(test, ret, len);
 }
 
+static size_t do_unmap_sparse(struct kunit *test, pt_vaddr_t va,
+			      pt_vaddr_t len)
+{
+	struct kunit_iommu_priv *priv = test->priv;
+
+	return iommu_unmap_sparse(&priv->domain, va, len, NULL, NULL);
+}
+
 static void check_iova(struct kunit *test, pt_vaddr_t va, pt_oaddr_t pa,
 		       pt_vaddr_t len)
 {
@@ -427,11 +435,147 @@ static void test_mixed(struct kunit *test)
 	check_iova(test, start, oa, len);
 }
 
+struct unmap_record_entry {
+	unsigned long iova;
+	phys_addr_t paddr;
+	size_t size;
+};
+
+struct unmap_record_test {
+	struct unmap_record_entry entries[4];
+	unsigned int nr;
+	unsigned int max;
+};
+
+static bool record_unmapped(void *priv, unsigned long iova,
+			    phys_addr_t paddr, size_t size)
+{
+	struct unmap_record_test *collect = priv;
+
+	if (collect->nr == collect->max)
+		return false;
+	collect->entries[collect->nr++] = (struct unmap_record_entry){
+		.iova = iova,
+		.paddr = paddr,
+		.size = size,
+	};
+	return true;
+}
+
+/*
+ * Return physical ranges while unmapping, and stop before an entry when the
+ * caller's output storage is full.
+ */
+static void test_unmap_sparse_record(struct kunit *test)
+{
+	struct kunit_iommu_priv *priv = test->priv;
+	struct pt_range range = pt_top_range(priv->common);
+	pt_vaddr_t small = priv->smallest_pgsz;
+	pt_vaddr_t va = range.va + small * 256;
+	pt_oaddr_t oa = log2_set_mod(priv->test_oa, 0,
+				     priv->smallest_pgsz_lg2);
+	struct unmap_record_test collect = { .max = 1 };
+	size_t processed;
+
+	do_map(test, va, 0, small);
+	do_map(test, va + 2 * small, oa, small);
+
+	processed = iommu_unmap_sparse(&priv->domain, va, 3 * small,
+				       record_unmapped, &collect);
+	KUNIT_ASSERT_EQ(test, processed, 2 * small);
+	KUNIT_ASSERT_EQ(test, collect.nr, 1);
+	KUNIT_EXPECT_EQ(test, collect.entries[0].iova, va);
+	KUNIT_EXPECT_EQ(test, collect.entries[0].paddr, 0);
+	KUNIT_EXPECT_EQ(test, collect.entries[0].size, small);
+	KUNIT_EXPECT_EQ(test, count_valids(test), 1);
+	check_iova(test, va + 2 * small, oa, small);
+
+	collect.nr = 0;
+	collect.max = ARRAY_SIZE(collect.entries);
+	processed = iommu_unmap_sparse(&priv->domain, va + processed,
+				       3 * small - processed,
+				       record_unmapped, &collect);
+	KUNIT_ASSERT_EQ(test, processed, small);
+	KUNIT_ASSERT_EQ(test, collect.nr, 1);
+	KUNIT_EXPECT_EQ(test, collect.entries[0].iova, va + 2 * small);
+	KUNIT_EXPECT_EQ(test, collect.entries[0].paddr, oa);
+	KUNIT_EXPECT_EQ(test, collect.entries[0].size, small);
+	KUNIT_EXPECT_EQ(test, count_valids(test), 0);
+}
+
+/*
+ * A large entry followed by small pages with holes is unmapped in one call, and
+ * a range that starts or ends inside a large entry leaves it mapped.
+ */
+static void test_unmap_sparse_large(struct kunit *test)
+{
+	struct kunit_iommu_priv *priv = test->priv;
+	struct pt_range range = pt_top_range(priv->common);
+	pt_vaddr_t small = priv->smallest_pgsz;
+	pt_vaddr_t sizes = priv->safe_pgsize_bitmap & (SZ_2G - 1) &
+			   ~(small * 2 - 1);
+	pt_vaddr_t big, va;
+	pt_oaddr_t oa;
+	size_t processed;
+
+	if (!sizes)
+		kunit_skip(test, "no page size larger than the smallest");
+	big = 1ULL << __fls(sizes);
+	va = ALIGN(range.va + small * 256, big);
+	oa = log2_set_mod(priv->test_oa, 0, ilog2(big));
+
+	do_map(test, va, oa, big);
+	do_map(test, va + big + small, oa + big + small, small);
+	do_map(test, va + big + 3 * small, oa + big + 3 * small, small);
+	processed = do_unmap_sparse(test, va, big + 4 * small);
+	KUNIT_ASSERT_EQ(test, processed, big + 4 * small);
+	KUNIT_ASSERT_EQ(test, count_valids(test), 0);
+
+	do_map(test, va, oa, big);
+	KUNIT_ASSERT_EQ(test, do_unmap_sparse(test, va + small, small), 0);
+	check_iova(test, va, oa, big);
+	KUNIT_ASSERT_EQ(test, do_unmap_sparse(test, va, small), 0);
+	check_iova(test, va, oa, big);
+	do_unmap(test, va, big);
+}
+
+/*
+ * Map pages with holes in between, and unmap the whole range at once with
+ * iommu_unmap_sparse(), which steps over the holes; iommu_unmap() stops at the
+ * first one.
+ */
+static void test_unmap_sparse(struct kunit *test)
+{
+	struct kunit_iommu_priv *priv = test->priv;
+	struct pt_range range = pt_top_range(priv->common);
+	pt_vaddr_t pgsz = priv->smallest_pgsz;
+	pt_vaddr_t va = range.va + pgsz * 256, i;
+	pt_oaddr_t oa = log2_set_mod(priv->test_oa, 0, priv->smallest_pgsz_lg2);
+
+	/* Pages 0, 2, 3 and 6 of 8, holes elsewhere */
+	for (i = 0; i != 8; i++) {
+		if (i == 1 || i == 4 || i == 5 || i == 7)
+			continue;
+		do_map(test, va + i * pgsz, oa + i * pgsz, pgsz);
+	}
+	KUNIT_ASSERT_EQ(test, iommu_unmap(&priv->domain, va, 8 * pgsz), pgsz);
+	KUNIT_ASSERT_EQ(test, do_unmap_sparse(test, va, 8 * pgsz),
+			8 * pgsz);
+	KUNIT_ASSERT_EQ(test, count_valids(test), 0);
+
+	/* Nothing mapped at all */
+	KUNIT_ASSERT_EQ(test, do_unmap_sparse(test, va, 8 * pgsz),
+			8 * pgsz);
+}
+
 static struct kunit_case iommu_test_cases[] = {
 	KUNIT_CASE_FMT(test_increase_level),
 	KUNIT_CASE_FMT(test_map_simple),
 	KUNIT_CASE_FMT(test_map_table_to_oa),
 	KUNIT_CASE_FMT(test_unmap_split),
+	KUNIT_CASE_FMT(test_unmap_sparse_record),
+	KUNIT_CASE_FMT(test_unmap_sparse_large),
+	KUNIT_CASE_FMT(test_unmap_sparse),
 	KUNIT_CASE_FMT(test_random_map),
 	KUNIT_CASE_FMT(test_pgsize_boundary),
 	KUNIT_CASE_FMT(test_mixed),
diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
index 80164df5bab10..976e7f73ea9b9 100644
--- a/drivers/iommu/iommu-debug-pagealloc.c
+++ b/drivers/iommu/iommu-debug-pagealloc.c
@@ -108,6 +108,19 @@ void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t siz
 		iommu_debug_inc_page(phys + off);
 }
 
+void __iommu_debug_unmap_phys(struct iommu_domain *domain, phys_addr_t phys,
+			      size_t size)
+{
+	size_t off, end;
+	size_t page_size = iommu_debug_page_size(domain);
+
+	if (WARN_ON(!phys || check_add_overflow(phys, size, &end)))
+		return;
+
+	for (off = 0; off < size; off += page_size)
+		iommu_debug_dec_page(phys + off);
+}
+
 static void __iommu_debug_update_iova(struct iommu_domain *domain,
 				      unsigned long iova, size_t size, bool inc)
 {
diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index 1f9f886b2c107..d6ad234637606 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -79,6 +79,13 @@ void __iommu_debug_unmap_begin(struct iommu_domain *domain,
 			       unsigned long iova, size_t size);
 void __iommu_debug_unmap_end(struct iommu_domain *domain,
 			     unsigned long iova, size_t size, size_t unmapped);
+void __iommu_debug_unmap_phys(struct iommu_domain *domain, phys_addr_t phys,
+			      size_t size);
+
+static inline bool iommu_debug_enabled(void)
+{
+	return static_branch_unlikely(&iommu_debug_initialized);
+}
 
 static inline void iommu_debug_map(struct iommu_domain *domain,
 				   phys_addr_t phys, size_t size)
@@ -102,9 +109,26 @@ static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
 		__iommu_debug_unmap_end(domain, iova, size, unmapped);
 }
 
+static inline void iommu_debug_unmap_phys(struct iommu_domain *domain,
+					  phys_addr_t phys, size_t size)
+{
+	if (iommu_debug_enabled())
+		__iommu_debug_unmap_phys(domain, phys, size);
+}
+
 void iommu_debug_init(void);
 
 #else
+static inline bool iommu_debug_enabled(void)
+{
+	return false;
+}
+
+static inline void iommu_debug_unmap_phys(struct iommu_domain *domain,
+					  phys_addr_t phys, size_t size)
+{
+}
+
 static inline void iommu_debug_map(struct iommu_domain *domain,
 				   phys_addr_t phys, size_t size)
 {
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fcd..5b8b55e75a4e9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2828,6 +2828,82 @@ size_t iommu_unmap(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_unmap);
 
+struct iommu_unmap_debug {
+	struct iommu_domain *domain;
+	iommu_unmap_record_t record;
+	void *priv;
+};
+
+/* Accounts for each mapping for iommu.debug_pagealloc as it is removed */
+static bool iommu_unmap_debug_record(void *priv, unsigned long iova,
+				     phys_addr_t paddr, size_t size)
+{
+	struct iommu_unmap_debug *debug = priv;
+
+	if (debug->record && !debug->record(debug->priv, iova, paddr, size))
+		return false;
+	iommu_debug_unmap_phys(debug->domain, paddr, size);
+	return true;
+}
+
+/**
+ * iommu_unmap_sparse() - Remove the mappings of a range of IOVA with holes
+ * @domain: Domain to manipulate
+ * @iova: IO virtual address to start
+ * @size: Length of the range starting from @iova
+ * @record: Optional function called with each mapping before it is removed
+ * @priv: Argument passed to @record
+ *
+ * Like iommu_unmap(), but IOVA in the range that is not mapped is stepped
+ * over, and a mapping that extends past the end of the range is not removed.
+ * When @record returns false, the walk stops before that mapping. The device
+ * can still reach the memory until this function has flushed the IOTLB, so
+ * @record may record the mapping but must not free or unpin its memory.
+ *
+ * Only domains that use the generic page table support this operation.
+ *
+ * Returns: the number of bytes processed, holes included. It is less than
+ * @size when @record stopped the walk or the next mapping extends past the
+ * range. It is 0, with nothing removed, if the domain does not support this
+ * operation, if @size is 0 or @iova + @size overflows, if the range is not
+ * covered by the page table (outside the aperture, or above the current top
+ * level of a table that grows on demand), or if the range starts inside a
+ * mapping.
+ */
+size_t iommu_unmap_sparse(struct iommu_domain *domain, unsigned long iova,
+			  size_t size, iommu_unmap_record_t record, void *priv)
+{
+	struct pt_iommu *pt = iommupt_from_domain(domain);
+	struct iommu_unmap_debug debug = {
+		.domain = domain,
+		.record = record,
+		.priv = priv,
+	};
+	struct iommu_iotlb_gather iotlb_gather;
+	size_t ret;
+
+	if (!pt)
+		return 0;
+
+	/*
+	 * Account for what is removed rather than for the whole range: the walk
+	 * can stop long before @size.
+	 */
+	if (iommu_debug_enabled()) {
+		record = iommu_unmap_debug_record;
+		priv = &debug;
+	}
+
+	iommu_iotlb_gather_init(&iotlb_gather);
+	ret = pt->ops->unmap_range_sparse(pt, iova, size, record, priv,
+					  &iotlb_gather);
+	iommu_iotlb_sync(domain, &iotlb_gather);
+	trace_unmap(iova, size, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_unmap_sparse);
+
 /**
  * iommu_unmap_fast() - Remove mappings from a range of IOVA without IOTLB sync
  * @domain: Domain to manipulate
diff --git a/include/linux/generic_pt/iommu.h b/include/linux/generic_pt/iommu.h
index 13ebb72a67de3..b8d37b12f5307 100644
--- a/include/linux/generic_pt/iommu.h
+++ b/include/linux/generic_pt/iommu.h
@@ -137,6 +137,30 @@ struct pt_iommu_ops {
 			      dma_addr_t len,
 			      struct iommu_iotlb_gather *iotlb_gather);
 
+	/**
+	 * @unmap_range_sparse: Make a range of IOVA that may have holes empty
+	 * @iommu_table: Table to manipulate
+	 * @iova: IO virtual address to start
+	 * @len: Length of the range starting from @iova
+	 * @record: Optional function called with each entry before it is cleared
+	 * @priv: Argument passed to @record
+	 * @iotlb_gather: Gather struct that must be flushed on return
+	 *
+	 * Like unmap_range(), but entries that are not present are stepped
+	 * over, and an entry that extends past the end of the range stops the
+	 * walk instead of being removed. A false return from @record also stops
+	 * the walk before that entry.
+	 *
+	 * Context: The caller must hold a write range lock that includes
+	 * the whole range.
+	 *
+	 * Returns: Number of bytes processed, holes included.
+	 */
+	size_t (*unmap_range_sparse)(struct pt_iommu *iommu_table,
+				     dma_addr_t iova, dma_addr_t len,
+				     iommu_unmap_record_t record, void *priv,
+				     struct iommu_iotlb_gather *iotlb_gather);
+
 	/**
 	 * @set_dirty: Make the iova write dirty
 	 * @iommu_table: Table to manipulate
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef5043752a365..a9a66b2df77c1 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -340,6 +340,18 @@ struct iommu_pages_list {
 #define IOMMU_PAGES_LIST_INIT(name) \
 	((struct iommu_pages_list){ .pages = LIST_HEAD_INIT(name.pages) })
 
+/**
+ * typedef iommu_unmap_record_t - Records a mapping iommu_unmap_sparse() removes
+ * @priv: Argument given to iommu_unmap_sparse()
+ * @iova: IO virtual address of the mapping
+ * @paddr: Physical address of the mapping
+ * @size: Size of the mapping
+ *
+ * Returns: true to continue the walk, false to stop it before this mapping.
+ */
+typedef bool (*iommu_unmap_record_t)(void *priv, unsigned long iova,
+				     phys_addr_t paddr, size_t size);
+
 #ifdef CONFIG_IOMMU_API
 
 /**
@@ -955,6 +967,8 @@ extern size_t iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 extern size_t iommu_unmap_fast(struct iommu_domain *domain,
 			       unsigned long iova, size_t size,
 			       struct iommu_iotlb_gather *iotlb_gather);
+size_t iommu_unmap_sparse(struct iommu_domain *domain, unsigned long iova,
+			  size_t size, iommu_unmap_record_t record, void *priv);
 extern ssize_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			    struct scatterlist *sg, unsigned int nents,
 			    int prot, gfp_t gfp);
@@ -1291,6 +1305,14 @@ static inline size_t iommu_unmap_fast(struct iommu_domain *domain,
 	return 0;
 }
 
+static inline size_t iommu_unmap_sparse(struct iommu_domain *domain,
+					unsigned long iova, size_t size,
+					iommu_unmap_record_t record,
+					void *priv)
+{
+	return 0;
+}
+
 static inline ssize_t iommu_map_sg(struct iommu_domain *domain,
 				   unsigned long iova, struct scatterlist *sg,
 				   unsigned int nents, int prot, gfp_t gfp)
-- 
2.47.3

