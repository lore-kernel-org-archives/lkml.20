Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2724AA03D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365510; cv=none; b=a8Jx0WfSFJnMfVJ+hG+08EECJt/5sU6lNdqiJxXlsUSkkbSdlackEYxFzNercQt5zCfL/ietQoZTdctUQ2j7s+GSTlwiBn8sktOyj023wzcgCZvoMucbeL3gUm66wADaI/ZakJJmA0KxmRSr2G7/ae1E9oawLg7pm1qlhfujlbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365510; c=relaxed/simple;
	bh=6K8So0zhiUop16OU1SZV0hMFVqYlDNvoFdQhENITqfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FKmO3tMRrGsNdq5ao4HHC0jYSiZfa5GjaK7sIPtCkIOrPgaWDD68ssQdWetRIOR5knasHgSZyaizCDf6V+j0ob+96nFHokLaeJcqJHJ5g1sW2ZFv+78sMO3q99gQkiJLToilidvXY4xEqf6sqTVQEiyPTDfCdfoy0zXB71xFtms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=VQzM7zYU; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=H3UPO2kb; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="VQzM7zYU";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="H3UPO2kb"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPXcI449649
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=9+vj
	1JvoRB8URu7nTUl8whzOblI6NEX6HUmsLA7DRaU=; b=VQzM7zYUgtlfsq5J/nb3
	P7Qnwg7W+edOkq0ZxQqtKRlrHI4POu29oZGnm7ZLTua+wlogYx5xgR0ommtw6eRw
	GXdodYprFDLCcewEI3AD8r7BLf5QPCQtO0B0pMXc35W4zS6bGzxXsV8zkFwE7vDr
	0jHIwhVVGZfBhLV7jvb0so4Azq1zeqxQonsc1FSWlxIdFXBG3OuvPovxLJyE93Nc
	lYqh+b3VLhAhjgGFlvjymYXF49kjNuY2R11EA50S9P42ZTDQzkd7NxP9HP91rZGt
	FUI1s6Vk8XG+h3beVoxH5dvAyKOGYcAOm7hg0wq8OSogKMoYxaQiPl6bmCgScXlZ
	4w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gec25kxa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:44 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e869793d3so23100866d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365504; x=1788970304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+vj1JvoRB8URu7nTUl8whzOblI6NEX6HUmsLA7DRaU=;
        b=H3UPO2kbSQxtdet2pIsnLxrfncinzA6yvbT+bJpEVFBLPvJ+5PLc+g1B2qzKi6lKT4
         PYHJfJouo8GYbu9uH59zpyja/zYGewyarEZKV8bUCaHe+8Ly3z82kQ5S8hj5/KNsR2a8
         IPDEy1JaNe96uk4O2DulDHOxZnQvptWG6fnOOOmQ7joUCBCNCE5c+srrXD1quRilf/nD
         WXn6ZdxuiagZdXEJoERA2PFD5Ju6MmIR+klqeBMsvd0jTHKXULQEM5KKz2Mtv80E2TSN
         vllqC+QNgvpyZBA7Oiaunbod4SMIEFUu8kO9WbCTckN60ZNUigPHIzwMVXAHCnAA4gIR
         LEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365504; x=1788970304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+vj1JvoRB8URu7nTUl8whzOblI6NEX6HUmsLA7DRaU=;
        b=TFqDiAeSTTmQSCD7YKcMU2Q2BVvMzuvoVGWqWB3F7eN+y5GSklYLRimF7OnTPaUfsV
         tNEHJq1Bz82Wg08IONRfVIEOMqfw7TOhI6dtrKQusHdr6sf47FbAVttWmzHDDSfARZax
         Gz6kAsEIw0j1Mw7uTV1lgO/FNr/wp63UuIrW1lc+OV6NafJSA9K4XeaWxjDc6Y1pb6O1
         am8r9iJuPIpmuMa387yioHq40bdpZjAVEUPi0rRMTi4bF2aVkJ5C3DLqSw7DtcRdsMXl
         1n+pOzpdrWixz8Qu8rPQwIvWbMqqazcTaiANMrALOtJDs7UgYOHRQSsUS+Zy3mO3Y4dt
         uwGg==
X-Forwarded-Encrypted: i=1; AKwUvBxVJj1whsJZFZ3AzmRsf/dJ7bkN8lSq917kwLbD95JVJSxiChu13NWCVnTZA3jkLNRUol58DQd8x0nPIWg=@vger.kernel.org
X-Gm-Message-State: AFuF++kbZq4w1ae0F6R4kcKpXJnRyXZWnMmsYE4P9No1t25R267zq5Sx
	hYoZlrXMRnBYsB/dPcdNu+j6yahtpnNxz+gb8M+HyTPvEmQ81amt58YLOhlkL+xfyfnXLWvh7ie
	Mr8QENm2LMywFDhxhG36isKk1qna0AHVm/eVnEvvK3Y3w6Qp9GDa+qAKiP0C0Kg==
X-Gm-Gg: AYBFou0312WYUhqtOL7i7SJL7ahGs4CoC1QLewhP3HXedsKivCy07yaacguvXTtbU7A
	EOlSaNgHG4bFkhwjBB8JfaGap4lj6eSllf2nIQa56E5gEtANiY5FUwQcWmVWl0slAtHAtQFjp/j
	G69QNtYDuc34qT3oOegVDCcoDks8uDL5k6iBL3Do1s/gGJA7go/+8YrVWSa0lQlifpF0WwVNWj+
	GYSTL2vptuB8Juoa+H+ReVSnvG4JGEtGJjfw61W8cg/lWXA20wGjNJiWBpMd3dbeMZZAaC5Ziqz
	GzgAU79W+eVtVIZDOwuLu9YCCyCZrKW97F0E59ThQeiJIyinaXujlYXd4Ykiuw96HOFGl2qSk3i
	9gFQctCciP9yXVRgSc7U6OOgZPmrBXuowwf7EVFn86d+LXkj5a2V/WA==
X-Received: by 2002:a05:6214:202c:b0:90d:af11:89fa with SMTP id 6a1803df08f44-90e9f20411bmr93549556d6.2.1788365503798;
        Wed, 02 Sep 2026 09:11:43 -0700 (PDT)
X-Received: by 2002:a05:6214:202c:b0:90d:af11:89fa with SMTP id 6a1803df08f44-90e9f20411bmr93548246d6.2.1788365502907;
        Wed, 02 Sep 2026 09:11:42 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:42 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:29 -0400
Subject: [PATCH v5 05/10] ceph: convert get_writepages_data_length() to
 folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-5-0b512e77e75b@columbia.edu>
References: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
In-Reply-To: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Zi Yan <ziy@nvidia.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=4666;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=6K8So0zhiUop16OU1SZV0hMFVqYlDNvoFdQhENITqfA=;
 b=JKXesfZIXTjBUNRG2Pk1JTEoygoduPU/zW8UFIh8uwhpdqqLpACWjRIm4wT51NRFd/M/FBHGx
 iWAT9m9xyTkCSBNHk4MINOQRqPMDSCfJDcgbEngShrNqgRcWDydMh1W
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX9a1ygLFKhGQR
 AXsORh1esXyRZ02/yWwbJafZnCiulcmxizZCYScSDbWSI+4MnuMdlpLUr9DNiPbSE4JrcRW5SwX
 0bt7fp3DxsyXqq90caMyZ3YoHWESsrg7VelNg3PIivhlRaaHjz84
X-Proofpoint-GUID: yJVR08GKBTn672oa2lXMQb5oKeoBnJ0V
X-Proofpoint-ORIG-GUID: yJVR08GKBTn672oa2lXMQb5oKeoBnJ0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfXyZ1EGqOIL5kP
 ZtlTX0oht8rGw4uDxY+av6uGT4cDQ7+rzJ+X2txtBNg2Z/R5LX436JLemFXjzYoyspjv2ULDQDE
 fumGiANTv+RKWxrysri/QLSI5Qa6JoOTWsW9fc9ngljYLq0bIyrpQmFotb2jCa2K4hJcF7qH93a
 b9DW4h1nw3cwUPok6WeGmKI/awJSNq89BErIKtZe1FHHBz5dqEqH4aIsO67vhy2ZuaFjuEFETnd
 MKK4HgVze2gFiJ7bJ9qw5F2cUGpwCLAY57yfpjZYsBgJ/d8LppKduY6qzWeyWxlKwQVyKjtUcoO
 OQC89RM440ETOSqmyABwZCMK1Z99pUPw8N8QmrCeG1bYempY1vMlmc3TqDPOXH1OIWh3TEXyWMJ
 uLpXOq37rA+xe/BXNIl9Y3ULowSQlbaWlQBL0vAF2po9mh545GmpDGq9TnM7tn3w2pRHKxVVhBc
 oYO1XxxOa71m39UTQ+w==
X-Authority-Analysis: v=2.4 cv=BpWtB4X5 c=1 sm=1 tr=0 ts=6a984ac0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=4S3DF5rXG3rfafK4-1MA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=10
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=10 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020143

Introduce ceph_fscrypt_pagecache_folio() and ceph_fscrypt_folio_offset(),
folio equivalents of ceph_fscrypt_pagecache_page() and
ceph_fscrypt_page_offset(), and use them to convert
get_writepages_data_length() to folios.

This removes the last caller of page_snap_context(), so remove it as
well. This also removes a use of page->private and a call to
fscrypt_is_bounce_page().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c   | 25 +++++++++----------------
 fs/ceph/crypto.h | 15 +++++++++++++++
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 5e4b9da5970b..a72efe96e1f8 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -29,9 +29,9 @@
  *
  * There are a few funny things going on here.
  *
- * The page->private field is used to reference a struct
- * ceph_snap_context for _every_ dirty page.  This indicates which
- * snapshot the page was logically dirtied in, and thus which snap
+ * The folio->private field is used to reference a struct
+ * ceph_snap_context for _every_ dirty folio.  This indicates which
+ * snapshot the folio was logically dirtied in, and thus which snap
  * context needs to be associated with the osd write during writeback.
  *
  * Similarly, struct ceph_inode_info maintains a set of counters to
@@ -68,13 +68,6 @@
 static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
 					struct folio **foliop, void **_fsdata);
 
-static inline struct ceph_snap_context *page_snap_context(struct page *page)
-{
-	if (PagePrivate(page))
-		return (void *)page->private;
-	return NULL;
-}
-
 static inline
 struct ceph_snap_context *ceph_folio_snap_context(const struct folio *folio)
 {
@@ -706,7 +699,7 @@ get_oldest_context(struct inode *inode, struct ceph_writeback_ctl *ctl,
 }
 
 static u64 get_writepages_data_length(struct inode *inode,
-				      struct page *page, u64 start)
+				      struct folio *folio, u64 start)
 {
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_snap_context *snapc;
@@ -714,7 +707,7 @@ static u64 get_writepages_data_length(struct inode *inode,
 	u64 end = i_size_read(inode);
 	u64 ret;
 
-	snapc = page_snap_context(ceph_fscrypt_pagecache_page(page));
+	snapc = ceph_folio_snap_context(ceph_fscrypt_pagecache_folio(folio));
 	if (snapc != ci->i_head_snapc) {
 		bool found = false;
 		spin_lock(&ci->i_ceph_lock);
@@ -729,10 +722,10 @@ static u64 get_writepages_data_length(struct inode *inode,
 		spin_unlock(&ci->i_ceph_lock);
 		WARN_ON(!found);
 	}
-	if (end > ceph_fscrypt_page_offset(page) + thp_size(page))
-		end = ceph_fscrypt_page_offset(page) + thp_size(page);
+	if (end > ceph_fscrypt_folio_offset(folio) + folio_size(folio))
+		end = ceph_fscrypt_folio_offset(folio) + folio_size(folio);
 	ret = end > start ? end - start : 0;
-	if (ret && fscrypt_is_bounce_page(page))
+	if (ret && fscrypt_is_bounce_folio(folio))
 		ret = round_up(ret, CEPH_FSCRYPT_BLOCK_SIZE);
 	return ret;
 }
@@ -1601,7 +1594,7 @@ int ceph_submit_write(struct address_space *mapping,
 		 * data length covers all locked pages */
 		u64 min_len = len + 1 - thp_size(page);
 		len = get_writepages_data_length(inode,
-						 ceph_wbc->pages[i - 1],
+						 page_folio(ceph_wbc->pages[i - 1]),
 						 offset);
 		len = max(len, min_len);
 	}
diff --git a/fs/ceph/crypto.h b/fs/ceph/crypto.h
index 79cb563fd887..948c8b5dca06 100644
--- a/fs/ceph/crypto.h
+++ b/fs/ceph/crypto.h
@@ -162,6 +162,11 @@ static inline struct page *ceph_fscrypt_pagecache_page(struct page *page)
 	return fscrypt_is_bounce_page(page) ? fscrypt_pagecache_page(page) : page;
 }
 
+static inline struct folio *ceph_fscrypt_pagecache_folio(struct folio *folio)
+{
+	return fscrypt_is_bounce_folio(folio) ? fscrypt_pagecache_folio(folio) : folio;
+}
+
 #else /* CONFIG_FS_ENCRYPTION */
 
 static inline void ceph_fscrypt_set_ops(struct super_block *sb)
@@ -262,6 +267,11 @@ static inline struct page *ceph_fscrypt_pagecache_page(struct page *page)
 {
 	return page;
 }
+
+static inline struct folio *ceph_fscrypt_pagecache_folio(struct folio *folio)
+{
+	return folio;
+}
 #endif /* CONFIG_FS_ENCRYPTION */
 
 static inline loff_t ceph_fscrypt_page_offset(struct page *page)
@@ -269,4 +279,9 @@ static inline loff_t ceph_fscrypt_page_offset(struct page *page)
 	return page_offset(ceph_fscrypt_pagecache_page(page));
 }
 
+static inline loff_t ceph_fscrypt_folio_offset(struct folio *folio)
+{
+	return folio_pos(ceph_fscrypt_pagecache_folio(folio));
+}
+
 #endif /* _CEPH_CRYPTO_H */

-- 
2.39.5

