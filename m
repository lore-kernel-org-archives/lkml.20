Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2D9378833
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733816; cv=none; b=YpUPbtW//4A1vCC2i2BisVRZu8q6NtvfFUrS6wUZtq2TTlKuGnhkAYOCV90Y6bVSCxamPlG/PBw3Imyno+8mowvDyt94Vz9bIVIDcIhnBZRJMX7WFUXyRkDWmvar2C4QJuZ6sLFfvDolBeCsb0aRnQsL2CRt6pM7VTRAACBdk2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733816; c=relaxed/simple;
	bh=/QNffYJDudwhTwgk+7mzWe6L+UZ5Nd56H+OLx6zVp5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9pNdeRblFPOS7Xxkxw6e3M88QFdL25ZTu0bTQGQ0e+7NrY+pFWzQqVulgc3cI0eFxNA5uuP5rUUA0xR6Byr/+iGDp7cIPT9JJy8Ab8BkgI+b5ZVnZjjdFlxZznPXCy4TeKB6KzaaG3EtWNZkWPMPekS+mH/2bFNDR3btnvlyFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=E25p05j5; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=arS6eemn; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="E25p05j5";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="arS6eemn"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686K0nMi4166001
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=rLUd
	kDWoIrdKRaPoBtEpyUnm9LoP8PFCLJU5R+QIEZE=; b=E25p05j5vucKLj7hmsEI
	QL5Btn3/KE+mF3fGUZVCD1AtM37hihw8C06slisHWeBa15kNtt27nhs8njEUjd8f
	r3vg3etlhGXSJXqggKDiOcmIqUagYsINDr+6OFjWZBwH+Hje56p/swo83pSMlSF3
	KuJP4xF2jvoBVafIwfI/m7tJHXiPYoJAnou2HL64Ez2lvOMkkjyoTcmCaitLbmM/
	zc4+4q+pLRNfEN1DbFpKCPnjjd+uuzWTuQpHeneF2kg1ijQYx6Z1N+mGsuAMGzJh
	JQF1QfUe0PJO3AmZf1qp1Vzjy06IbbDMcxUOzUot3G55fL+jl/or+seAhZZCwQYq
	Tw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gheub0gcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:30:01 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53062ec5b9bso35344651cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788733800; x=1789338600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLUdkDWoIrdKRaPoBtEpyUnm9LoP8PFCLJU5R+QIEZE=;
        b=arS6eemn5LjyWR/NI7fgVee8peurgmPXu0yx6DlI8PkLw1O+RdJTg2n05iCwNl4NlD
         l8RpUVSs29HhLET14Izt07KQ2JFNd3IrtQKHUh4GZ3mNcenXiOPSdpK60XsbfLa6xhDl
         ww94G5kSivspCB3yNefk0ANvh2rmeIFWMbPwc65YZJiX5XnETD0RG9YXqZnKCuFTnMpt
         0STpRdlP5rws7J41Vekzv53tBxY2x0PHXpGFSkTyKB/HIKwk7gE9MUDNGZLX5F7qTLks
         AlYY81+pVTGeXHazhKcN5X4KZJFWxG5U4EBOC6GD712R8Kvp5snaHQ8Sb1s17wNcg2pT
         D98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733800; x=1789338600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLUdkDWoIrdKRaPoBtEpyUnm9LoP8PFCLJU5R+QIEZE=;
        b=O6Bl63QjZdpEX1gW73OSvLRgthPE3wwD3eEf8HboG+xcARKLopdQkFH1VYjRLAWGN0
         SxwKgpwcCnxamExMeVowkDuty2KO+au6bV8e+tmuKgW3i5vwyn3Y285Nfvc0N1lB70SR
         X1r4zLuuV+v56LCD6s1QsfWMI7lZt0beYD3NjbFWH9YpJETCHCe5TNedtHuj1EWwM991
         VAl/s4EfhEmLlYdLBQk2mE+4//tdCfvgDh357nIGxRNXcR1avYn/YE89dh9KIJxoJUtU
         6GmGSVeahghOfQHXC1h0tit032NJhBagFTvXN7HOhQFaxCyDJdkgnxSYSN++DUzn1NTT
         4GAA==
X-Forwarded-Encrypted: i=1; AKwUvBxZjvps3T1510ArovdUVvb77FUxRGDNH3sp2lD7INaorzPBGz+kymnxOO894CTZlvfW94IWxExcRotHoIs=@vger.kernel.org
X-Gm-Message-State: AFuF++lAGQR9N/FBwvayU+Yr8BGaAxOpzBg6FqudJiFYeQV9BWqmXwY6
	VCs0ZrZ8YxPuTXdz2alSdkHHsv+fusYj7jty+BgW/OrsMGVVB9+/6vhqeOSU+yuYIlhwk0X3iTr
	oKBGfp7eDRY6WLwvk+rWE7SruXVv/qb/Mwe6ytRVAJpV0B6xMLU9Sk3mJGE765g==
X-Gm-Gg: AYBFou0oiC0op+3sXnoYXpcOZCoPt6e7X563AtH4DqYm0OkPZY314MhzCT/8EthB9Ty
	Rq2fRavCylyGDPxipsQb3d0SBjm4ixTbLfgi8G17H9NFH5ydEBycq3SwHT+czSYAs3SyJDDbyLJ
	Ie6F3Ruh62yNAUDnNiF3Cp0B3CtqDktoBMCpt8w9Miq1KDtl2uUEh5gCvK40QcqeXkFoRxbsGs3
	JfSTksXTHRzjEjogtajmWrZX2p05mPlkR44jFPt3LDMYvM5PXBiDx3wL/cIj2cXZMzXl/ovhgvU
	ggaZgTpZkteyvUldLc13HkdVvqnQicypn2f/N1BfXegl4Z10/jL6IX0T9K47RwRYJDm+oeGqxxI
	9V5vpyPTECIJziPitQlvJatpyBPUVh0OyGRRx+VVvs5RUx3s+
X-Received: by 2002:ac8:5d02:0:b0:52e:2d4e:8ef4 with SMTP id d75a77b69052e-530549cf159mr217749011cf.37.1788733800409;
        Sun, 06 Sep 2026 15:30:00 -0700 (PDT)
X-Received: by 2002:ac8:5d02:0:b0:52e:2d4e:8ef4 with SMTP id d75a77b69052e-530549cf159mr217748511cf.37.1788733799826;
        Sun, 06 Sep 2026 15:29:59 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a7b7sm73048541cf.3.2026.09.06.15.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:29:59 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 06 Sep 2026 18:29:36 -0400
Subject: [PATCH 09/10] btrfs: convert struct btrfs_io_ctl to use folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-btrfs-folio-conversions-v1-9-834b9d7b06f5@columbia.edu>
References: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
In-Reply-To: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788733791; l=8944;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=/QNffYJDudwhTwgk+7mzWe6L+UZ5Nd56H+OLx6zVp5c=;
 b=qrSknlVwZY2gaYpBTn6berUM45Um1O6B0HBCE2uCacR/JWQnSx2jqNfsL6eidcuD1ifOeGSZc
 bVCoJa2MZElBAL9ASF/01MUWKnixd2VxCAfSbYWJmz30F8QFwktGpwj
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: ZaVA_Q37iV43UKhyDIJGHYESJyIfpLeI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX2gkgwDUoa3FN
 Ev8IFkN7FqNLB6g97PHbJ9f0tvELBnMMVvSMZ3crOU4GbDfSM1199BewCXMJ6jPD8Axy9bDx8m2
 rfnMmWp9uNxrXOWlVIdep5UZsLujfij/QWvhshRgn62if+N9Kwzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfXw4z32UTmYfoH
 SNzhVVPc93ybMBDvmLbdBsXuxVsSplvKIVjAXPrwiuHssZkEjKXZqr00uwksu2H2k0OWZKIJ7fc
 yDHW9V/Lf3rV1vk+itdM8+9AtN+1BPNsN313ZJe8Avc1W8RsHBMJuALyV+0Uz5w8N+jbskb/zsb
 RajCPPRIvWfT9hJkc5kxki8wP0RotQM5Gs41m60cHYTGDgiRrmL/2ax03Zm4j4iU8ESF3ktCAn+
 24J+ZLo/FH2lDx2O1tkoT3Ws4yRf2IXbyfzoZhlsch6JssQI6qdJaGKcCq9Z0kWIff4vHLjTG4k
 SmYT6OTUSV8v1Y9lIa1OOGHNrzg2J+IzXpIcmhlOcrK7o5saB2gguVY+7UAP6lthSEqdmTj1kla
 R1jhTNr3lp8XAGQWjFtF2DM9nHjIhpkr2HtRb5zL/aaMGELZufciCbKXuPceKAfdpeWbTQOnDfr
 shOrXnlD8SxCDHQcBSg==
X-Authority-Analysis: v=2.4 cv=HrJG3UTS c=1 sm=1 tr=0 ts=6a9de969 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=fqt38Rk-63FNqOG3jyMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ZaVA_Q37iV43UKhyDIJGHYESJyIfpLeI
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 phishscore=0 lowpriorityscore=10 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=10 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060252

io_ctl_prepare_pages() gets folios from __filemap_get_folio() and
immediately converts them to pages. Store folios instead and use the
folio APIs throughout. This removes the last btrfs callers of
unlock_page() and clear_page_dirty_for_io(), and four calls to
compound_head().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/disk-io.c          |  2 +-
 fs/btrfs/free-space-cache.c | 68 ++++++++++++++++++++++-----------------------
 fs/btrfs/free-space-cache.h |  8 +++---
 3 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index a1d83ad9a4c0..1accc2fd17f5 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -4889,7 +4889,7 @@ static void btrfs_cleanup_bg_io(struct btrfs_block_group *cache)
 		cache->io_ctl.inode = NULL;
 		iput(inode);
 	}
-	ASSERT(cache->io_ctl.pages == NULL);
+	ASSERT(cache->io_ctl.folios == NULL);
 	btrfs_put_block_group(cache);
 }
 
diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index e2af75a205ea..ab933ee6f19c 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -378,21 +378,21 @@ static void readahead_cache(struct inode *inode)
 static int io_ctl_init(struct btrfs_io_ctl *io_ctl, struct inode *inode,
 		       int write)
 {
-	int num_pages;
+	int num_folios;
 
-	num_pages = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	num_folios = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 
 	/* Make sure we can fit our crcs and generation into the first page */
-	if (write && (num_pages * sizeof(u32) + sizeof(u64)) > PAGE_SIZE)
+	if (write && (num_folios * sizeof(u32) + sizeof(u64)) > PAGE_SIZE)
 		return -ENOSPC;
 
 	memset(io_ctl, 0, sizeof(struct btrfs_io_ctl));
 
-	io_ctl->pages = kzalloc_objs(struct page *, num_pages, GFP_NOFS);
-	if (!io_ctl->pages)
+	io_ctl->folios = kzalloc_objs(struct folio *, num_folios, GFP_NOFS);
+	if (!io_ctl->folios)
 		return -ENOMEM;
 
-	io_ctl->num_pages = num_pages;
+	io_ctl->num_folios = num_folios;
 	io_ctl->fs_info = inode_to_fs_info(inode);
 	io_ctl->inode = inode;
 
@@ -402,8 +402,8 @@ ALLOW_ERROR_INJECTION(io_ctl_init, ERRNO);
 
 static void io_ctl_free(struct btrfs_io_ctl *io_ctl)
 {
-	kfree(io_ctl->pages);
-	io_ctl->pages = NULL;
+	kfree(io_ctl->folios);
+	io_ctl->folios = NULL;
 }
 
 static void io_ctl_unmap_page(struct btrfs_io_ctl *io_ctl)
@@ -416,9 +416,9 @@ static void io_ctl_unmap_page(struct btrfs_io_ctl *io_ctl)
 
 static void io_ctl_map_page(struct btrfs_io_ctl *io_ctl, int clear)
 {
-	ASSERT(io_ctl->index < io_ctl->num_pages);
-	io_ctl->page = io_ctl->pages[io_ctl->index++];
-	io_ctl->cur = page_address(io_ctl->page);
+	ASSERT(io_ctl->index < io_ctl->num_folios);
+	io_ctl->folio = io_ctl->folios[io_ctl->index++];
+	io_ctl->cur = folio_address(io_ctl->folio);
 	io_ctl->orig = io_ctl->cur;
 	io_ctl->size = PAGE_SIZE;
 	if (clear)
@@ -431,10 +431,10 @@ static void io_ctl_drop_pages(struct btrfs_io_ctl *io_ctl)
 
 	io_ctl_unmap_page(io_ctl);
 
-	for (i = 0; i < io_ctl->num_pages; i++) {
-		if (io_ctl->pages[i]) {
-			unlock_page(io_ctl->pages[i]);
-			put_page(io_ctl->pages[i]);
+	for (i = 0; i < io_ctl->num_folios; i++) {
+		if (io_ctl->folios[i]) {
+			folio_unlock(io_ctl->folios[i]);
+			folio_put(io_ctl->folios[i]);
 		}
 	}
 }
@@ -446,7 +446,7 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
 	gfp_t mask = btrfs_alloc_write_mask(inode->i_mapping);
 	int i;
 
-	for (i = 0; i < io_ctl->num_pages; i++) {
+	for (i = 0; i < io_ctl->num_folios; i++) {
 		int ret;
 
 		folio = __filemap_get_folio(inode->i_mapping, i,
@@ -465,7 +465,7 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
 			return ret;
 		}
 
-		io_ctl->pages[i] = &folio->page;
+		io_ctl->folios[i] = folio;
 		if (uptodate && !folio_test_uptodate(folio)) {
 			btrfs_read_folio(NULL, folio);
 			folio_lock(folio);
@@ -484,8 +484,8 @@ static int io_ctl_prepare_pages(struct btrfs_io_ctl *io_ctl, bool uptodate)
 		}
 	}
 
-	for (i = 0; i < io_ctl->num_pages; i++)
-		clear_page_dirty_for_io(io_ctl->pages[i]);
+	for (i = 0; i < io_ctl->num_folios; i++)
+		folio_clear_dirty_for_io(io_ctl->folios[i]);
 
 	return 0;
 }
@@ -498,8 +498,8 @@ static void io_ctl_set_generation(struct btrfs_io_ctl *io_ctl, u64 generation)
 	 * Skip the csum areas.  If we don't check crcs then we just have a
 	 * 64bit chunk at the front of the first page.
 	 */
-	io_ctl->cur += (sizeof(u32) * io_ctl->num_pages);
-	io_ctl->size -= sizeof(u64) + (sizeof(u32) * io_ctl->num_pages);
+	io_ctl->cur += (sizeof(u32) * io_ctl->num_folios);
+	io_ctl->size -= sizeof(u64) + (sizeof(u32) * io_ctl->num_folios);
 
 	put_unaligned_le64(generation, io_ctl->cur);
 	io_ctl->cur += sizeof(u64);
@@ -513,8 +513,8 @@ static int io_ctl_check_generation(struct btrfs_io_ctl *io_ctl, u64 generation)
 	 * Skip the crc area.  If we don't check crcs then we just have a 64bit
 	 * chunk at the front of the first page.
 	 */
-	io_ctl->cur += sizeof(u32) * io_ctl->num_pages;
-	io_ctl->size -= sizeof(u64) + (sizeof(u32) * io_ctl->num_pages);
+	io_ctl->cur += sizeof(u32) * io_ctl->num_folios;
+	io_ctl->size -= sizeof(u64) + (sizeof(u32) * io_ctl->num_folios);
 
 	cache_gen = get_unaligned_le64(io_ctl->cur);
 	if (cache_gen != generation) {
@@ -535,12 +535,12 @@ static void io_ctl_set_crc(struct btrfs_io_ctl *io_ctl, int index)
 	unsigned offset = 0;
 
 	if (index == 0)
-		offset = sizeof(u32) * io_ctl->num_pages;
+		offset = sizeof(u32) * io_ctl->num_folios;
 
 	crc = crc32c(crc, io_ctl->orig + offset, PAGE_SIZE - offset);
 	btrfs_crc32c_final(crc, (u8 *)&crc);
 	io_ctl_unmap_page(io_ctl);
-	tmp = page_address(io_ctl->pages[0]);
+	tmp = folio_address(io_ctl->folios[0]);
 	tmp += index;
 	*tmp = crc;
 }
@@ -551,13 +551,13 @@ static int io_ctl_check_crc(struct btrfs_io_ctl *io_ctl, int index)
 	u32 crc = ~(u32)0;
 	unsigned offset = 0;
 
-	if (index >= io_ctl->num_pages)
+	if (index >= io_ctl->num_folios)
 		return -EIO;
 
 	if (index == 0)
-		offset = sizeof(u32) * io_ctl->num_pages;
+		offset = sizeof(u32) * io_ctl->num_folios;
 
-	tmp = page_address(io_ctl->pages[0]);
+	tmp = folio_address(io_ctl->folios[0]);
 	tmp += index;
 	val = *tmp;
 
@@ -596,7 +596,7 @@ static int io_ctl_add_entry(struct btrfs_io_ctl *io_ctl, u64 offset, u64 bytes,
 	io_ctl_set_crc(io_ctl, io_ctl->index - 1);
 
 	/* No more pages to map */
-	if (io_ctl->index >= io_ctl->num_pages)
+	if (io_ctl->index >= io_ctl->num_folios)
 		return 0;
 
 	/* map the next page */
@@ -615,14 +615,14 @@ static int io_ctl_add_bitmap(struct btrfs_io_ctl *io_ctl, void *bitmap)
 	 */
 	if (io_ctl->cur != io_ctl->orig) {
 		io_ctl_set_crc(io_ctl, io_ctl->index - 1);
-		if (io_ctl->index >= io_ctl->num_pages)
+		if (io_ctl->index >= io_ctl->num_folios)
 			return -ENOSPC;
 		io_ctl_map_page(io_ctl, 0);
 	}
 
 	copy_page(io_ctl->cur, bitmap);
 	io_ctl_set_crc(io_ctl, io_ctl->index - 1);
-	if (io_ctl->index < io_ctl->num_pages)
+	if (io_ctl->index < io_ctl->num_folios)
 		io_ctl_map_page(io_ctl, 0);
 	return 0;
 }
@@ -638,7 +638,7 @@ static void io_ctl_zero_remaining_pages(struct btrfs_io_ctl *io_ctl)
 	else
 		io_ctl_unmap_page(io_ctl);
 
-	while (io_ctl->index < io_ctl->num_pages) {
+	while (io_ctl->index < io_ctl->num_folios) {
 		io_ctl_map_page(io_ctl, 1);
 		io_ctl_set_crc(io_ctl, io_ctl->index - 1);
 	}
@@ -1382,7 +1382,7 @@ static int __btrfs_write_out_cache(struct inode *inode,
 	if (!i_size_read(inode))
 		return -EIO;
 
-	WARN_ON(io_ctl->pages);
+	WARN_ON(io_ctl->folios);
 	ret = io_ctl_init(io_ctl, inode, 1);
 	if (ret)
 		return ret;
@@ -1452,7 +1452,7 @@ static int __btrfs_write_out_cache(struct inode *inode,
 		u64 dirty_start = i * PAGE_SIZE;
 		u64 dirty_len = min_t(u64, dirty_start + PAGE_SIZE, i_size) - dirty_start;
 
-		ret = btrfs_dirty_folio(BTRFS_I(inode), page_folio(io_ctl->pages[i]),
+		ret = btrfs_dirty_folio(BTRFS_I(inode), io_ctl->folios[i],
 					dirty_start, dirty_len, &cached_state, false);
 		if (ret < 0)
 			goto out_nospc;
diff --git a/fs/btrfs/free-space-cache.h b/fs/btrfs/free-space-cache.h
index 53fe8e293af1..8c9892192af1 100644
--- a/fs/btrfs/free-space-cache.h
+++ b/fs/btrfs/free-space-cache.h
@@ -14,7 +14,7 @@
 #include "fs.h"
 
 struct inode;
-struct page;
+struct folio;
 struct btrfs_fs_info;
 struct btrfs_path;
 struct btrfs_trans_handle;
@@ -90,13 +90,13 @@ struct btrfs_free_space_ctl {
 
 struct btrfs_io_ctl {
 	void *cur, *orig;
-	struct page *page;
-	struct page **pages;
+	struct folio *folio;
+	struct folio **folios;
 	struct btrfs_fs_info *fs_info;
 	struct inode *inode;
 	unsigned long size;
 	int index;
-	int num_pages;
+	int num_folios;
 	int entries;
 	int bitmaps;
 };

-- 
2.39.5

