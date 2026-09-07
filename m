Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E752C37F8A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812435; cv=none; b=gH5ezL2p21uJOi7PUA+HGqrxNd5YQgzlD8ApJb3fVRIzvf0/LUyr4/1cqgh4m26a8s0QDVFTNrZYSQVk8ok6d8HilvmZqHzcDXv/tNDGGvOn7vbUao4275x8+GZy1dim1m7bjUWfJAS2THO9KAmAkYVofwsjB4Q/v6qLP3GCH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812435; c=relaxed/simple;
	bh=RYBxJl93h958FQK8RkWgp+MkOua/aYnCMeTqxN34xTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fg40ijf3Nux2lWwESI3Z9B8X7Imqko3BAiabgbMZdYpgSCxmDq5/QLR74c6mDkoVSQA3do1XFrramlOLvGXVbEf46eKWn54GaL+PGTCbHRelgtL+l7SaTuq0N3jSmJnBAf4c2uEOPhZcqk1QHmeZhIrYmFlqqwKggIMH6Pt/YuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=F4RN1cb8; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=W8zfx/Tw; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="F4RN1cb8";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="W8zfx/Tw"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687IYNpp2798233
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 16:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=w3o/
	sHf38x/eQVx++9WePfix9UGFsLhy3c0Xy3Gsc0g=; b=F4RN1cb8mQLXP7aUaDV7
	yFGepUAn85Mn6TThwnkMl8J7V69TIKaHmqbzI9kxrDSiDhrSD7OLmUEIeWOtH/dF
	AHCYERrCv/9dx2dQLbamSmrq7Iw3ow4cufGWUYewkys3S7Bil0F+L9M+MP6WOutN
	YeLeVjkhmcRo9AA4os4ImoaYgRbWT4cDlefs+PMr6TjUvSRLb+1k34KMU0ePq8rL
	JCmHVn67BoppIJOc8a2O38ogh2Tmf14vN6bC9zbQdut2FDKlR20AgKbR2ihQRxGv
	h7Ni2qXdvACOK4qyzcvS60S9q9MbHXzOaN8dsPmGd6JbjH+2clqD2ooUumH4oGqH
	Zw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4ghwvraek0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:20:30 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ffe24490bso84895781cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788812429; x=1789417229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3o/sHf38x/eQVx++9WePfix9UGFsLhy3c0Xy3Gsc0g=;
        b=W8zfx/Twx0H7+yLTcHQF5WBQR4FgpkjB2Wy6j6qQZXtbXQCPUenGN3Qu+BLg+iaD61
         w8GM29v/Gzg9iNVC0VP6zPa8nK0LiDI6sxczj5zjRS5M3T96/bTMcT9at9qxKwcBSguW
         ObFcJMcPel3yoasjjOrT+NVwjNnPX4l110qXW85G5DXqhJ78RAeRrFaEALpr/3D6S8XB
         biXTBdZC/umDTqtSuaXVCes3xCuC1HAxSL/nNa/qg+yg2b5ppYLA3Vlo8YU3AWIHy0x/
         GMMwtKEYBBebWb1dOGQxyjzOr6RSItjWo6JYNQX+XNRkozgZEm89k3qWp9G6NUxaMV/g
         Hpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812429; x=1789417229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3o/sHf38x/eQVx++9WePfix9UGFsLhy3c0Xy3Gsc0g=;
        b=DXBw9jz53uKq5yAQyhrkpwkBvCedXeZAi3ghf7kZlFXE3UB7HIum9heR+IlLLmB3FE
         2QLjJDYJXBrTMMzIbe66azISmHUI/2sWvcfSrI921JLR8ddwvozlLEM34WtXIfZqbjXY
         pRRIQkA9+t50dfJANCg5k4maG374JYsDZjn+lJ57L2VN2uG7khB3Uw63DuLbmVVwUhYZ
         UA66oBuM89M52KdnANikJ6OMFF5LFIPKiImoGuzpHCBJVnUYbfgefT0kDbeD7MKtnIyT
         gvv/zuMJtvwpQM2dQCArnZuQsGBtFRzlltnmWzrezwcisn/FR7OAysbldPgcdfpoWvqu
         /u5g==
X-Forwarded-Encrypted: i=1; AKwUvBzSkDoyZe77uCBCi+2Hx+ZMaL7bZdAQMbBuDUyEdn2FXQuYiDXJfagxSrlFTGCJCJlZA2u565iHbAFJVKo=@vger.kernel.org
X-Gm-Message-State: AFuF++mD6qMpfst+EncMD8Actdr4FgDKglcLxgZ1owDcSCgbaPY/9Atb
	oI6Pz/tyYyA8jPXnnIXhM1ZRJ1YOVM92mMmK+cEfRkKW1wEuVQvHDO7TM/Z9cBRGu0lsXob9kq0
	DUEjhLSMDsXCI3oMWR13NKUHCto0hOZNjx2rTEUdO4JrPqD5xI8OmtrN8PwtzYQ==
X-Gm-Gg: AYBFou3Ap3D/ntJyn1/VU8HZJ4ooE437AhweD1/qgAc81bBxMgnyX2xjZ+3mriuhhPt
	TaaLzzC2gRO/iWS9NvhrtSmB9g9RXvOnUguFsoVVX90lfJwVO01gLrugDg/LQ7eyS9obJ+Kh1Hk
	ybNfkLGBkmkGHItY4oj/qizlj3DaTATlTwTnhnYfkbVZbg0042XcQztwkKhKhODTp1WYqj+gPVu
	9CKLQZzcaMl+IT8+dSP6jFy2Fp9xO853eVIDkWhrDg1t9ziDFbepMrUzvQg2/nk9Ohen2u1kDJw
	+a/ksiz7Sm9AXi60NdhliKdkXVJNu/p+24oIp2SuMXh4MUEp2zqs1U4Ghaklb2LEv/JFO3xBV2f
	HoGls5EB0whpWw2+shRMHbWpqe4UNG6BRMRKw1QN/c8M=
X-Received: by 2002:a05:622a:c84:b0:51b:f40b:2fb5 with SMTP id d75a77b69052e-5305482a9fcmr267886251cf.17.1788812429138;
        Mon, 07 Sep 2026 13:20:29 -0700 (PDT)
X-Received: by 2002:a05:622a:c84:b0:51b:f40b:2fb5 with SMTP id d75a77b69052e-5305482a9fcmr267885621cf.17.1788812428647;
        Mon, 07 Sep 2026 13:20:28 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm95062351cf.11.2026.09.07.13.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:20:28 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 16:20:01 -0400
Subject: [PATCH v2 7/7] btrfs: use folios for reading super blocks from the
 block device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-folio-conversions-v2-7-b5fe79f7607b@columbia.edu>
References: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
In-Reply-To: <20260907-btrfs-folio-conversions-v2-0-b5fe79f7607b@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812420; l=3888;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=RYBxJl93h958FQK8RkWgp+MkOua/aYnCMeTqxN34xTw=;
 b=hz3WxTt80OAC0IjpP7autduLptHKjPXS6RtlplpD91GKIqF8ntxt0EezJrokIwP4pHx+TjdKF
 vcNcXO8TVCGCMVQmGB5C6brWo9z13UFaVIMOM92ZfrvsDK6DaaYlwF0
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: DvZRr6AzvloIL-v-KnRw2VIb8JeKIr_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX8fD2lJm60Hqh
 BhteA8d4V3Tku2cKddNmf1+kp/gbkWNAdVrXPbibyWUAys20/gOMS/vs13l4OwXfLxmzAZNI47k
 2vfRvS/6bEoOWwRYaHvgtcnJYwLLGigLV7aCFYhKB1e7BK3dpYCg2s+s7CPdRInsxTDwA+m7g8B
 JT+9MjsRdzM0e+Ez+rawKu6u3JfgXwuoRRCNXbyhIUiaQZJW6AbhSQzGPGNqzgEkUDNEH9fH3Rq
 GyS0p2aAxX+BqLHe1bV7b+WUQIsAvHm9/RDqXVK2iULnFRAju6dZaHAb0PsZFRHQ23+YPrmPTvf
 Fo80U0zrjHSkXZnvRTLCmB4LukkY8jJ0Pf7LXUuiO87bMti40mZNfpw0K/CTC1RJfXyp/D3Uvh5
 OPUaMat+z8XzY4rCKiYOFu6yNAoBk7dRb5/v18w9sQql/NKNwh7QIKA6FHlbNRoswFaxzI/Ziy7
 vlYI2eus/mXpAAOEyvw==
X-Authority-Analysis: v=2.4 cv=RP2D2Yi+ c=1 sm=1 tr=0 ts=6a9f1c8e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=iox4zFpeAAAA:8 a=C-EEzzuqgLcvSd4iXwIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: DvZRr6AzvloIL-v-KnRw2VIb8JeKIr_j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX4rNd5spxQlNv
 V0UP9j/QZ67U3yDipbpzz1Let0gPsMlZ1qxh632KfainJlaO1sxCgRvMOC3RY4sCtWInWTwQYNq
 a9PmhAArv4g8FrgtbOzryNuXklEybAbrsPjZ3A+UhG0kHsj4BnM+
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=10
 bulkscore=10 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

btrfs_read_disk_super() and the zoned super block log comparison go
through read_cache_page_gfp() and page_address(), and
btrfs_release_disk_super() recovers the page with virt_to_page(). Use
mapping_read_folio_gfp(), folio_address(), and virt_to_folio() instead.
This removes the last callers of read_cache_page_gfp() and put_page()
in btrfs.

Compute the super block address with offset_in_folio() as
write_dev_supers() does, rather than assuming it is at the start of
the page.

Assisted-by: Claude:claude-fable-5-1
Reviewed-by: Qu Wenruo <wqu@suse.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/volumes.c | 16 +++++++---------
 fs/btrfs/zoned.c   | 12 ++++++------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 949e40baff33..4ddabadc9188 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -1327,16 +1327,14 @@ int btrfs_open_devices(struct btrfs_fs_devices *fs_devices,
 
 void btrfs_release_disk_super(struct btrfs_super_block *super)
 {
-	struct page *page = virt_to_page(super);
-
-	put_page(page);
+	folio_put(virt_to_folio(super));
 }
 
 struct btrfs_super_block *btrfs_read_disk_super(struct block_device *bdev,
 						int copy_num, bool drop_cache)
 {
 	struct btrfs_super_block *super;
-	struct page *page;
+	struct folio *folio;
 	u64 bytenr, bytenr_orig;
 	struct address_space *mapping = bdev->bd_mapping;
 	int ret;
@@ -1357,7 +1355,7 @@ struct btrfs_super_block *btrfs_read_disk_super(struct block_device *bdev,
 		ASSERT(copy_num == 0);
 
 		/*
-		 * Drop the page of the primary superblock, so later read will
+		 * Drop the folio of the primary superblock, so later read will
 		 * always read from the device.
 		 */
 		invalidate_inode_pages2_range(mapping, bytenr >> PAGE_SHIFT,
@@ -1365,12 +1363,12 @@ struct btrfs_super_block *btrfs_read_disk_super(struct block_device *bdev,
 	}
 
 	filemap_invalidate_lock_shared(mapping);
-	page = read_cache_page_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
+	folio = mapping_read_folio_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
 	filemap_invalidate_unlock_shared(mapping);
-	if (IS_ERR(page))
-		return ERR_CAST(page);
+	if (IS_ERR(folio))
+		return ERR_CAST(folio);
 
-	super = page_address(page);
+	super = folio_address(folio) + offset_in_folio(folio, bytenr);
 	if (btrfs_super_magic(super) != BTRFS_MAGIC ||
 	    btrfs_super_bytenr(super) != bytenr_orig) {
 		btrfs_release_disk_super(super);
diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 08a15465a087..a1ef8caaacda 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -123,24 +123,24 @@ static int sb_write_pointer(struct block_device *bdev, struct blk_zone *zones,
 	} else if (full[0] && full[1]) {
 		/* Compare two super blocks */
 		struct address_space *mapping = bdev->bd_mapping;
-		struct page *page[BTRFS_NR_SB_LOG_ZONES];
 		struct btrfs_super_block *super[BTRFS_NR_SB_LOG_ZONES];
 
 		for (int i = 0; i < BTRFS_NR_SB_LOG_ZONES; i++) {
 			u64 zone_end = (zones[i].start + zones[i].capacity) << SECTOR_SHIFT;
 			u64 bytenr = ALIGN_DOWN(zone_end, BTRFS_SUPER_INFO_SIZE) -
 						BTRFS_SUPER_INFO_SIZE;
+			struct folio *folio;
 
 			filemap_invalidate_lock_shared(mapping);
-			page[i] = read_cache_page_gfp(mapping,
-					bytenr >> PAGE_SHIFT, GFP_NOFS);
+			folio = mapping_read_folio_gfp(mapping, bytenr >> PAGE_SHIFT,
+						       GFP_NOFS);
 			filemap_invalidate_unlock_shared(mapping);
-			if (IS_ERR(page[i])) {
+			if (IS_ERR(folio)) {
 				if (i == 1)
 					btrfs_release_disk_super(super[0]);
-				return PTR_ERR(page[i]);
+				return PTR_ERR(folio);
 			}
-			super[i] = page_address(page[i]);
+			super[i] = folio_address(folio) + offset_in_folio(folio, bytenr);
 		}
 
 		if (btrfs_super_generation(super[0]) >

-- 
2.39.5

