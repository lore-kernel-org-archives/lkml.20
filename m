Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711879;
	b=EmDb4cyN/PbhY1bvnDnjmDvp98aVgTY3/SAbHK8851U6C+FbpjWXSuDCVYjb28Cod69/
	 oE0D4yC714cUoLJmGRoK1kCjOOm6shD1GvWr88QGZ2J8k8lneQBhB7D7dOEzhoADEbIyX
	 vBYPW5/PMnfPWkLKthQJHLFC/7uVbcbkoWmgi0GXPWHNCPJMqnlY6RiJD9VpH+wthcqeC
	 q2BcuiRAhmjzqapq/vzNMt0Sp0XwUGZk8yj2pdwA+ZKS62Wxenkv4vdHMlSdpRq1GwFor
	 CHr2nqi04G0TqaJl5MUFqq90NZ95alYNkeaGkK10uyvs00fuvgckPRUaCqNgcFmHm7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GspWl3el0L0iNxwEGIIrZOYKGZFd1xiC8sKp3Vtu8dk=;
	b=IU+YftEgXsKh9rCCPFxEPfrFXYa+Xs5klKUqnn/BxKmNsHq0phF/dYwu519ECN0DnPyV
	 o8Z9H8mAHFasKKNpYo/3iHkC7q6D7wnx+Ya67uamufyvHvaDR3w5hJrcbOGs5WGrIf0Oy
	 GrnC8cwe9SWZnKWCrVYvIrt4hhaLavtncTN9vytSNCZfJIdS+6s7xhbnxxTztd8qnPMV8
	 hvYH5FV3+HAeozU4cGYDTIjtj6a2cdVefdnFaqxJYtcqgfsX4imMZcM75X5g2Z+pdhp4W
	 MM5PxXrqMFBuX5cUSKSKLRHSfi3plLNKdA0AIp0pNN6Miw7qSxVmJ2MuzlDd2WNMlZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=D5+szrzf;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Kipo32a3;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CAE6082BCC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CAE6082BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=D5+szrzf;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Kipo32a3
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39Dxr6607244
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=GspW
	l3el0L0iNxwEGIIrZOYKGZFd1xiC8sKp3Vtu8dk=; b=D5+szrzfd9XZ9JTWKXim
	PvhYni/gUlR70Hsx5JzR0mr2pfndcbuGC7f1oAIVRKUwEQvsAUMn2TNJNaJ54Ccc
	z/BjicSIac+lMMSBkl7QOnKw32b9CGkgkc+Y/+ltw4E2qaoMWRsz4b91TscWX+fg
	8fvZH78Xg2ElRalrQfhoWB6WRd2DkOuA1GY4uYrBZd3u1LTJEMT5w9zoenIrPlZz
	5nSCbEZyjWc1plD0/ERF9KwQ6P7R+yQvXXP2WzRVf4klSJEJREzv+DCOFoyGoQzb
	gEJyA4mp7mEbScM9VPen2Ni2VWMt1Bz9FZtGTwywYzluCg6V9jYNQw45TI9tAT1Z
	1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hqcr912ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:57 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9440b27c1feso726179185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711877; x=1794316677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GspWl3el0L0iNxwEGIIrZOYKGZFd1xiC8sKp3Vtu8dk=;
        b=Kipo32a3eM9JJtXAsYHH0LxJSBqbvtV5Me+Qx7zQrOhaOs/ImnO0FAq6O8UvY9oh6m
         kE2kYO5xSC6j2R/ViWuoQt/xoV+XMQyYAm2TPTP6doDT6qdezL7PWpB3RcFI95o0yMmh
         jTgPnHDcxd9Talfmcx8TBZcoFqtMTa9/slLwlS+CyG2kFM9IlXhvrGY3o5fz02TKj5Pf
         NFt5lnqlVad7yZtO786s45qy/rtfLjwdI2eMT5/J6SyNBLqRNzsOFr/F1v/h62wSWQuX
         IIZ8uTxKYNXMIywITvL4IR8drOz9Nia5z6tHgg9DZhjEFsomNwUGgwl/cgaes6PLczo5
         sGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711877; x=1794316677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GspWl3el0L0iNxwEGIIrZOYKGZFd1xiC8sKp3Vtu8dk=;
        b=C+8HVAYFV4i5Kr4Gdi6JzEueYJX4BeUnaiSpKh0fbUYlbvk0lnP/tGT31q3uoE0dDN
         KOI+7Y3Qt9gzIz3cj9WKsKdGzAZQPm+R3WGoDswF7fBNSdA7YbSr95q9ttWqyT8jzrHA
         f7HFSdpeEb/IcQ2mD1Kv3a3gZLA/7UHsBcXmxzOmcL36t2hYGq9QFVfMujl84yFiJFDx
         OoUBbQMfzjHvH4J7miML/kj9IngCcjnmS/hAap6ce7k4YkkjdKpKXlHCkSpdd/fu+lLA
         FxAIMswl56XI4bZCRPe3T/CMXWI5IRi1X8KyYbCHBNhDVkPNVeInEOI8gvWyNsSX/5KI
         D8DA==
X-Forwarded-Encrypted: i=1; AKwUvBxS8rGNzlWUzejVnICo703pkmbVghmBqx104BZ5xwZY0YYbvhi+yZuQuqzac/U6ip7H7HqQDxjPURbAdsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CZQkMU1TQAVns/FOc4E0+e09K1aQ18+QiDnKAAX7Y+7TABpAP
	BM/bsZAcNz+GY8MiTSl8zeLb8aDheQ3BQeDEIMsWJrSOECEAmzEBqMKuZ6mFA80VlUIkc9x3gSu
	7fWWKUJArKa6nLFV7yjanLn8f9Thv6iKnekzpYltychwr5GX+wHY3DemNL3pCcw==
X-Gm-Gg: AYBFou2Gpbe2rt1Ev8zml+nApa9xIe4h8GLJui2Iz+P8ehLnYEvFQIgEhwu8KcUtVhH
	4/EsI1wmsbpUczWqjDZ4xjw/hem3xoopVlaXolvmamM7+8fwBWrW4ZoQ3GviqqdDInCDLIlaxfW
	X0QEcijBVBlwh92OmJv42vxyOxi02Rku1SrzAB26BNAvbH6H82qa3szJ/E5sP65AbTO6qeHrHVL
	TuX/dV4LrQ+jzAXx3Y+xYvnd6lMd540H/AXsKUeN4sUYIaPcCNW4PI72CY/uVe7FOWxNy2plrmt
	BxQIHUajedntoACfB6YKWkF8hRgGDr0KF6fGj1BPqAs1MIqZAfjCSMH4HHtXOWpvgTM4laYJw9B
	kIy2pW2Wobu8Fz0djJXOqCgREFUDUr2vzXaHWhrVv+EjJKJWFFCMsQERH0Zo=
X-Received: by 2002:a05:620a:400a:b0:93f:54e4:6d46 with SMTP id af79cd13be357-944217a2e21mr2177073685a.54.1793711877166;
        Tue, 03 Nov 2026 05:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:400a:b0:93f:54e4:6d46 with SMTP id af79cd13be357-944217a2e21mr2177070285a.54.1793711876759;
        Tue, 03 Nov 2026 05:17:56 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:55 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:09 -0500
Subject: [PATCH 11/16] squashfs: zero the tail of the last folio up to
 folio_size()
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
Message-Id: <20261103-squashfs-folio-v1-11-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=4345;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=HUlIUJcY9qmXLcIufuctIZh9i0pmJqPBVNkXZLtsndQ=;
 b=vF+GsYoAplAuL/ZPngt2mVmGbTP7VNhnXaSb9SI05r9pWupIrUcFZzjhvuV7wyr9wIvJ3/t3Q
 YI+LiOPk5zABIH2vTfv1TdfvZI8lBXa/HCinawRvUlTiLsIlXlGWfVE
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX7dWFUfB6cy4V
 VqKV+POyNkg94VYsfcXneNVCYpYd3vsHy+faLIWsh6dIsAcgxfAHcQCAbsGCtwI0G7SVrSqhCrl
 nXrIsg2C1ta6KSmPH2WF48W5LfUazXOba5JrawTAil/MkhS8xHxq
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ae9df05 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=FXvPX3liAAAA:8 a=-GyvGuukF2difeu2tBIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXyraNlDNMrC5c
 Rd+buKvL+lkO8JTxOKFQO8JMMq5OTFQUw6zfbuAZNwXSdAdUz50hC3bk6n2xmWnwwIJlZNKB+um
 K55Ie+gBETyL27GfdJtZEacSWHQ1JmzkT4JR1RtjkHafZ1PUOmR4pIg7CGMUz1FsliFeyBmFDic
 +MvdkrWGXuRvj5lRR+7Kf8/glWGpXffRMRJF2vQaoa4QLowYi0JgfXp/Ngk6lLUTX5khE7XfNjR
 YshnNDMfJr6XSMeiKgo7a/oQyKfY5YGjTUbkpzhD7biXIcDIhA8tcnVLTUY553KYgudt6UrAEhc
 mQ69JL9BsXNKsgGLcK0B5CrP2az55niBu1ThWLBvwK+6BrCSl0F9pntON5Ktbw7FLcEhIKDbO7D
 O5DzDtH1HdD49Md0rkXyqYZ9+wQ47V1cqReu5GolZcJJxKlcl2epxYXcqVw97piFZ27kEFPiDgx
 2lrAkJZcXBt4Kwqsiyw==
X-Proofpoint-ORIG-GUID: FM4NHh6heYo9iiNRU_trd54bb_KjmONn
X-Proofpoint-GUID: FM4NHh6heYo9iiNRU_trd54bb_KjmONn
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=10 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

Add squashfs_actor_zero_tail(), which zeroes from the end of the data
in the last folio to folio_size(), and use it in the three places that
zeroed from the data length modulo PAGE_SIZE.

squashfs only uses order-0 folios, so no functional change. This is a
step towards enabling large folios.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file.c        | 13 +++++--------
 fs/squashfs/file_direct.c | 10 +++++-----
 fs/squashfs/page_actor.h  | 16 ++++++++++++++++
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index e024d2e21246..b34f2ac75e16 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -549,9 +549,8 @@ static int squashfs_readahead_fragment(struct inode *inode,
 	ok = copied == expected && !IS_ERR(last_folio);
 
 	/* Last folio (if present) may have trailing bytes not filled */
-	bytes = copied % PAGE_SIZE;
-	if (ok && last_folio && bytes)
-		folio_zero_segment(last_folio, bytes, PAGE_SIZE);
+	if (ok && last_folio)
+		squashfs_actor_zero_tail(last_folio, start, copied);
 
 	for (i = 0; i < nr_folios; i++) {
 		if (ok)
@@ -591,7 +590,7 @@ static void squashfs_readahead(struct readahead_control *ractl)
 		return;
 
 	for (;;) {
-		int res, bsize, bytes;
+		int res, bsize;
 		u64 index, block = 0;
 		unsigned int expected;
 		struct folio *last_folio;
@@ -641,10 +640,8 @@ static void squashfs_readahead(struct readahead_control *ractl)
 		ok = res == expected && !IS_ERR(last_folio);
 
 		/* Last folio (if present) may have trailing bytes not filled */
-		bytes = res % PAGE_SIZE;
-		if (ok && index == file_end && last_folio &&
-				bytes)
-			folio_zero_segment(last_folio, bytes, PAGE_SIZE);
+		if (ok && index == file_end && last_folio)
+			squashfs_actor_zero_tail(last_folio, start, res);
 
 		for (i = 0; i < nr_folios; i++) {
 			if (ok)
diff --git a/fs/squashfs/file_direct.c b/fs/squashfs/file_direct.c
index 266b5fdea67a..ef522923e6a9 100644
--- a/fs/squashfs/file_direct.c
+++ b/fs/squashfs/file_direct.c
@@ -28,8 +28,9 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 	unsigned int nr = squashfs_pages_per_block(msblk);
 	loff_t start_index = squashfs_block_first_index(msblk, folio->index);
 	loff_t end_index = start_index + nr - 1;
+	loff_t start = start_index << PAGE_SHIFT;
 	loff_t index;
-	int i, nr_folios, bytes, res = -ENOMEM;
+	int i, nr_folios, res = -ENOMEM;
 	struct folio **folios, *last_folio;
 	struct squashfs_page_actor *actor;
 
@@ -72,7 +73,7 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 	 * page cache folios appropriately within the decompressor.
 	 */
 	actor = squashfs_page_actor_init_folios(msblk, folios, nr_folios,
-					expected, start_index << PAGE_SHIFT);
+					expected, start);
 	if (actor == NULL)
 		goto mark_errored;
 
@@ -90,9 +91,8 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 	}
 
 	/* Last folio (if present) may have trailing bytes not filled */
-	bytes = res % PAGE_SIZE;
-	if (end_index == file_end && last_folio && bytes)
-		folio_zero_segment(last_folio, bytes, PAGE_SIZE);
+	if (end_index == file_end && last_folio)
+		squashfs_actor_zero_tail(last_folio, start, res);
 
 	/* Mark folios as uptodate, unlock and release */
 	for (i = 0; i < nr_folios; i++) {
diff --git a/fs/squashfs/page_actor.h b/fs/squashfs/page_actor.h
index e188e807350b..6d8cf7798f69 100644
--- a/fs/squashfs/page_actor.h
+++ b/fs/squashfs/page_actor.h
@@ -6,6 +6,9 @@
  * Phillip Lougher <phillip@squashfs.org.uk>
  */
 
+#include <linux/highmem.h>
+#include <linux/pagemap.h>
+
 struct squashfs_page_actor {
 	union {
 		void		**buffer;
@@ -58,4 +61,17 @@ static inline void squashfs_actor_nobuff(struct squashfs_page_actor *actor)
 {
 	actor->alloc_buffer = 0;
 }
+
+/*
+ * Zero whatever is left of @folio past the data, which starts at @start and
+ * is @length bytes long. Meant for the last folio the actor filled.
+ */
+static inline void squashfs_actor_zero_tail(struct folio *folio, loff_t start,
+				size_t length)
+{
+	size_t end = length - (folio_pos(folio) - start);
+
+	if (end < folio_size(folio))
+		folio_zero_segment(folio, end, folio_size(folio));
+}
 #endif

-- 
2.39.5

