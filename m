Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833382;
	b=uxY10/0DbwXZtXSepNa00C5uo6Ud35ydu7S6BI8xot38QDZQh6Ek/1Kc0Hh++zOoTfVj
	 A6zfnnwmDCKc1TozPDTdTtdZCFpleboHwd5CqxMOS1hQYdo7ielO67zR5sDJHrdXZt018
	 TLTxofH5cJyq7GjFzJuqQqzxRYS94OuiKdj8OWCUNxZINyyJDaXo084kxOktHfBiRA+3b
	 gorPfn9Yvt4hxNxS3zLOpXONY272Mm1G01Ff0xC0XMSS408KYm/yD0EjsBXn17j/2FeiL
	 9iBBMp+TH1O1QixZbxRtkX8xfdvWX4K28iDAL+Ix8dxdBLvZCUoO0JFiLpCYUIYk/yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mt4NXnFUgai2Xnc1lF4x0zhTMSSIiHVRUW1YIB9DFa0=;
	b=HM8Aumr0TBvRAb9NptQIw8lidX8iprRC9+tYIh1rcKxbKtPA0LG+JMXryijw5Vng8LWs
	 UmBpltA2aKC0dK9Uh7N0yLBagrngFrHnqINaDCoyWbFxC8L0a5Na9CwpisMhEWbnVTQJx
	 DaxgWAFJh9Qwm4jlV70imsP2MNGWGJQwhSPSlgPIzKZN/05E8UD8pTtBtbYHuMUNzT+G/
	 62OJh0+1kjv8mWo8ADS+Aidgj11EK+s+5U+iEKrVmWnXfqlz1IZFN8Crv+PJKC1hZILP7
	 zVGiqFuupS9S/eLdq+erxv5b6SGgm4xROxyhQMSIwzgwqktVffBpR+6thnsfD1xWlvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxdpbMGE;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F137B6082BF3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F137B6082BF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxdpbMGE
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed28bac8d7so304865ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833381; x=1794438181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mt4NXnFUgai2Xnc1lF4x0zhTMSSIiHVRUW1YIB9DFa0=;
        b=cxdpbMGE5AVjDZ+LSBz4D3dibrk9J77OyybgnH3wFb2qdZDq9u63NlpvXkIJ0UgY1z
         cd7BhGLs3MRiZQxvoldeao0bOXTYCeB6mGnrAU84PS4KD0pShDEXWR6vjTMVk33PtogQ
         zUcizm8zwXxg+RFYxG3w+Dhv5oPkCGNqfLTKysRJRrvwYsUc1hiKvNFzg1+tk1hplP9A
         f+9EUMSuuuQrQ/G0hTVi+9qpfbB4yPsVqkCXPojoMtfNKF57c5Q8svJblEJ5Rd5TUDci
         Vvtj/gM5UE9XWnF8KOGx7Lq7nbgrFSxM1j7RBkpBHfmJOdQXAkeyTlWvf4DeWZ6j1VQ5
         oYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833381; x=1794438181;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mt4NXnFUgai2Xnc1lF4x0zhTMSSIiHVRUW1YIB9DFa0=;
        b=ciy/PN6QGYQvCqI/ZVYud9zWHXrIAlk9ZIsA+83+AwSsceRfdzqRU2mbKda4u9vByN
         DumsZC/qDenYxYVmLzc7rEFUj5UJDb901cy69OKuyZt0zxgefObJzWtVQ3V1sf3HF4iH
         KA6JWuaCLIockdZ9FQsIrRHg/F+XmQVie55nqUlghwQ5NOlMNdFp2wWBNJQKehRE/7n9
         +5hcw2LlVzbiWgrgWQtwhDzyNbgwTnySN3Wvsc65SI8iEQAXdGiMHznYSPfr/ZHTn/21
         hdB/bYtWQx2WPFbtBNaVXDqCKkgV8n0jQ2p7XPbKqx4NVYADpnu5wcX1qXM/evhLvIiV
         uN0g==
X-Forwarded-Encrypted: i=1; AKwUvBxJdD+s/mLSCH9rv0QKW7gyetgy2c0h/jOuOpBilW8MVhJH1QORNUJeymcJ1EkhMfoG0bOwO9czSLHzPi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z97xuaJx2jPhSq1K10d2uFgZeNZCPuSOaMClQ3LufEpaZnPKiu3
	tJSLwPHiMaHAn9KCHkeSXeJW9Mgq4WIBA7FHIf+yNTKLPnuR76n0sdZ8suQb2psW
X-Gm-Gg: AYBFou3ZCTywiRogWwu8PWaiDsxKMFAWVjgDqUeD++85BsRePjB4fPQ2Y29VMoCkSrV
	vnGuKohH3aH/0OX8gY8P3taHmFgXYHaq8XmBNVHXN//8AZtPJ3YgZget/MJlrgUFo0eD78j5AuA
	TtEwxy+wPIcMidNVOUJm0wqSJ/dRvR5PaM7+ZXvnglZxhxIh0wJtyk2tLjUQc8OUYByJSMRoRoL
	omey1s3fnaQX1ORgXteRvABzFI37phulLy8bXXWSnHuaqZ0ubyNWpiOmDKecx8LzCoRkCKrtBeJ
	VHYmaZ0XP1LUuZeBcVC8u/ybljxYn7ECOzxLHzN3EYbIlo1J5Wmo6gKkZOu9v7oPIgX1OrudNoy
	QNB5gE1OnSP1O+zDglQh/1dqCGxYHkwV4/Db4QhC+JMFqmfNkge8wLvDKrOQ3vzCuglriuzkvTN
	uMwD/L9XklYvf/JNX0Jemw25BcgODPx3iQ4VCwPpxeRCHhuyt8PStwFmFOdhcMKbP/YGK+R25aQ
	np94YJs37vOIRZ6Jc7Sd/lxoWM0rDqE5MboUDAxc3EhgiV6kariUi2JxoEXED3EyUUsfvXQLCHr
	suBJVPqIsGhosVMQUnKB8W95tcz8yrWj2FeBh9mLswYnNq+75Vk=
X-Received: by 2002:a17:902:ce02:b0:2e6:2023:29fb with SMTP id d9443c01a7336-2ed244dcbe3mr5438885ad.29.1793833381225;
        Wed, 04 Nov 2026 15:03:01 -0800 (PST)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0908587dsm10999175ad.36.2026.11.04.15.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:03:00 -0800 (PST)
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
Subject: [PATCH v1 09/14] cxl/mem: Enforce tag-group semantics
Date: Thu,  5 Nov 2026 08:02:33 +0900
Message-ID: <20261104230445.66625-10-anisa.su@samsung.com>
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

The previous commits added validation for individual extents.  Add
two group-level checks to cxl_validate_group():

  - Sequence integrity (cxl_check_group_seq): sharability is taken from
    the group's DC partition attribute (cxl_group_is_shareable).

    For a sharable partition, extents have a shared_extn_seq number,
    which must be 0..n-1 for a tag. Any gaps or duplicate values are an
    error.

    The field is reserved for non-sharable extents, and
    cxl_validate_extent() rejects a non-zero value there when the group
    is realized.  Therefore, cxl_check_group_seq only applies to
    sharable groups.

  - cxl_check_group_partition: verify tagged allocations
    don't span DC partitions.

Each check drops the whole group on violation.

Tag uniqueness checks land in a subsequent commit.

Based on patches by John Groves.

Co-developed-by: John Groves <John@Groves.net>
Signed-off-by: John Groves <John@Groves.net>
Signed-off-by: Anisa Su <anisa.su@samsung.com>
Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>
---
 drivers/cxl/core/mbox.c | 138 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 133 insertions(+), 5 deletions(-)

diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index a605ffc4c64f..a1d3e04a1e1b 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -1452,6 +1452,119 @@ static void extract_tag_group(struct list_head *pending,
 	}
 }
 
+/*
+ * Validate shared_extn_seq across a tag group from a sharable partition,
+ * already sorted ascending.  Per CXL r4.0 Table 8-230 the device stamps
+ * each extent of an n-extent sharable allocation with a unique value in
+ * 0..n-1, so the sorted group must be exactly 0, 1, ..., n-1.  A gap,
+ * duplicate, or out-of-range value is a device firmware bug.
+ *
+ * Non-sharable extents must carry 0 here, which cxl_validate_extent()
+ * enforces per extent when the group is realized, so only sharable
+ * groups are checked; sharability comes from the partition, not the
+ * seq value.
+ */
+static int cxl_check_group_seq(struct device *dev,
+			       const uuid_t *tag,
+			       const struct list_head *group,
+			       bool shareable)
+{
+	struct cxl_extent_list_node *pos;
+	u16 expected = 0;
+
+	if (!shareable)
+		return 0;
+
+	list_for_each_entry(pos, group, list) {
+		u16 s = le16_to_cpu(pos->extent->shared_extn_seq);
+
+		if (s != expected) {
+			dev_warn_ratelimited(dev,
+					     "Tag %pUb: sharable shared_extn_seq must be dense 0..n-1: expected %u got %u (firmware bug)\n",
+					     tag, expected, s);
+			return -EINVAL;
+		}
+		expected++;
+	}
+	return 0;
+}
+
+/*
+ * A tag group's sharability is a property of the DC partition holding its
+ * extents (cxl_check_group_partition() separately enforces that the group
+ * does not span partitions).  Resolve it from the first extent; an empty
+ * group or an extent outside any DC partition is treated as non-sharable.
+ */
+static bool cxl_group_is_shareable(struct cxl_memdev_state *mds,
+				   const struct list_head *group)
+{
+	const struct cxl_dpa_partition *part;
+	struct cxl_extent_list_node *first;
+	struct cxl_extent *extent;
+	struct range ext_range;
+
+	if (list_empty(group))
+		return false;
+
+	first = list_first_entry(group, struct cxl_extent_list_node, list);
+	extent = first->extent;
+	ext_range = (struct range) {
+		.start = le64_to_cpu(extent->start_dpa),
+		.end = le64_to_cpu(extent->start_dpa) +
+			le64_to_cpu(extent->length) - 1,
+	};
+	part = cxl_extent_dc_partition(mds, extent, &ext_range);
+	return part && part->shareable;
+}
+
+/*
+ * For tagged groups, reject allocations that span DC partitions.  A tag
+ * is an allocation identity; the partition's CDAT DSMAS entry is what
+ * tells the host which attributes (sharable, writable, coherency)
+ * apply.  Untagged groups are skipped — the spec does not define a
+ * cross-chain identity for them.
+ */
+static int cxl_check_group_partition(struct cxl_memdev_state *mds,
+				     const uuid_t *tag,
+				     const struct list_head *group)
+{
+	struct device *dev = mds->cxlds.dev;
+	const struct cxl_dpa_partition *first_part = NULL;
+	u64 first_dpa = 0;
+	struct cxl_extent_list_node *pos;
+
+	if (uuid_is_null(tag) || list_empty(group))
+		return 0;
+
+	list_for_each_entry(pos, group, list) {
+		struct cxl_extent *extent = pos->extent;
+		struct range ext_range = (struct range) {
+			.start = le64_to_cpu(extent->start_dpa),
+			.end = le64_to_cpu(extent->start_dpa) +
+				le64_to_cpu(extent->length) - 1,
+		};
+		const struct cxl_dpa_partition *part;
+
+		part = cxl_extent_dc_partition(mds, extent, &ext_range);
+		if (!part)
+			return -ENXIO;
+
+		if (!first_part) {
+			first_part = part;
+			first_dpa = ext_range.start;
+			continue;
+		}
+
+		if (part != first_part) {
+			dev_warn_ratelimited(dev,
+					     "Tag %pUb: extents span DC partitions (DPA:%#llx and DPA:%#llx), firmware bug\n",
+					     tag, first_dpa, ext_range.start);
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 /*
  * Realize a tag @group: assign each extent its dax-side @seq_num and add it
  * via cxl_add_extent(), then online the resulting tag group.  Returns the
@@ -1460,7 +1573,7 @@ static void extract_tag_group(struct list_head *pending,
  * the caller to drop.
  */
 static int cxl_realize_group(struct cxl_memdev_state *mds, const uuid_t *tag,
-			     struct list_head *group)
+			     struct list_head *group, bool shareable)
 {
 	struct device *dev = mds->cxlds.dev;
 	struct cxl_extent_list_node *pos;
@@ -1475,7 +1588,12 @@ static int cxl_realize_group(struct cxl_memdev_state *mds, const uuid_t *tag,
 	/* Each extent gets a dense dax-side seq_num, 0..n-1 */
 	seq_num = -1;
 	list_for_each_entry(pos, group, list) {
-		seq_num++;
+		/* Sharable: device-assigned dense 0..n-1; otherwise by arrival */
+		if (shareable)
+			seq_num = le16_to_cpu(pos->extent->shared_extn_seq);
+		else
+			seq_num++;
+
 		rc = cxl_add_extent(mds, pos->extent, seq_num);
 		if (rc < 0) {
 			dev_dbg(dev,
@@ -1517,11 +1635,19 @@ static int cxl_realize_group(struct cxl_memdev_state *mds, const uuid_t *tag,
  * added, or a negative errno if it must be dropped.
  */
 static int cxl_validate_group(struct cxl_memdev_state *mds, const uuid_t *tag,
-			      struct list_head *group)
+			      struct list_head *group, bool shareable)
 {
 	struct device *dev = mds->cxlds.dev;
 	struct cxl_extent_list_node *pos;
 
+	/* Sequence-number integrity */
+	if (cxl_check_group_seq(dev, tag, group, shareable))
+		return -EINVAL;
+
+	/* Partition equality (skipped for null UUID) */
+	if (cxl_check_group_partition(mds, tag, group))
+		return -EINVAL;
+
 	/* Alignment gate — drop the group if any member fails */
 	list_for_each_entry(pos, group, list) {
 		if (!cxl_extent_dcd_aligned(pos->extent)) {
@@ -1559,6 +1685,7 @@ static int cxl_add_pending(struct cxl_memdev_state *mds,
 	while (!list_empty(pending)) {
 		struct cxl_extent_list_node *first;
 		LIST_HEAD(group);
+		bool shareable;
 		uuid_t tag;
 		int cnt;
 
@@ -1581,13 +1708,14 @@ static int cxl_add_pending(struct cxl_memdev_state *mds,
 		 * the stable sort maintains arrival order.
 		 */
 		list_sort(NULL, &group, extent_seq_compare);
+		shareable = cxl_group_is_shareable(mds, &group);
 
-		if (cxl_validate_group(mds, &tag, &group)) {
+		if (cxl_validate_group(mds, &tag, &group, shareable)) {
 			drop_extent_group(&group);
 			continue;
 		}
 
-		cnt = cxl_realize_group(mds, &tag, &group);
+		cnt = cxl_realize_group(mds, &tag, &group, shareable);
 		if (cnt < 0) {
 			drop_extent_group(&group);
 			continue;
-- 
2.43.0

