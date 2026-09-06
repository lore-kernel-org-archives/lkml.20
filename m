Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53D3D0927
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733814; cv=none; b=eoZLIvGxGnmrH61y+zD7VpkmG38K3tWHqgnpfYxvJdBZz7PxCVzygc5fUiVx9uERQJxWj9D4pgkdnxJTAJWdmqKDb3zhZN1yFkZ+eAetEnwNzhnR+yWVj+z4x/pSIzqis5AGdzW002JsTUzie4DDwMigaWl3igZB4GmcxbHyDpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733814; c=relaxed/simple;
	bh=jovNapv+xLpH/I/e/ElKwI9GEREfMqwAcqQebs6v74U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqHfxstiXnIL/0tGVyE/VKDXH8HAmhOs0A+gCi2MovZZh66EOW/k/n/Bnj/ArkC9+RrTl/D7aUrRjSahIQKpt/tJjw5r36iJEZnDi+l7pwwk7MTHIv48MKnnFioQdm06z4eiIGK4ATh2TgJX2Zkb9iWYPV7MxDTGtHAsYjpYiy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=r3m0mlWQ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=2VnXtm9u; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="r3m0mlWQ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="2VnXtm9u"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686LpmwR592569
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Be/E
	qUUFz0kczsRXaJG36N49Hpssj0V063Ft3ehqjSs=; b=r3m0mlWQWVS/E0tFV3o2
	eXrSeAam+CwQoL3sBqT7Zm9DuXI9jxUl02EibB8CPWeb7fOaXli97/irR28rZAOT
	DO+jZgqV/LofKr4zSq3GzwmxWaTgrgeoLCxhGGpIz8LQnR4QOGdSNHRRVwtE4ASm
	14XRAL31VMcI0/gl2hiqRaA5FJ32SGTWF1Ljlkd8JwwaXr2J/+vBrUIvFpekbuBE
	VWpRm+YgBzbIebvNTC9wyWcLPc5ZVWUbrMhg3o9jJXtE25Cr+s9gLAzZBFxRFQSf
	FspZLOSdAIiLVaZLthUyShWBPpPvczwKt+U70UM1NOk7chdHFndtLaU71kgvairI
	jw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghfawrbtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:29:59 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53062ec5b9bso35344451cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788733799; x=1789338599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Be/EqUUFz0kczsRXaJG36N49Hpssj0V063Ft3ehqjSs=;
        b=2VnXtm9un4DGyGR22mEa3M72e/AQTj6wcbvjwj1KPnHA3ywaKfG1/q1FFB3R04bft9
         WcsVaR4OeU6S2qUcdCGmwte/C7iDV6I0YmYhzv8/8w8e3Veijx6+ScJstbSiiHzHQHhG
         8aBVHPFumnGue2ifTEA7zMDflWP2iJATltrnf/2GdV+/IRiMRQpeM7Q2/+faAPHAe1ws
         x4lfELY72P0Bfa8QQcgMgXwA+dM8k0mERu+fa+1vbYmfP0s0kmvq5ZHsDrCJYcSt5VBz
         VoRddj2HTrFwS0kVU1XU287UaLU/45vwOdS0c9AUqnIOBWj0j5Wp5FDBVtNCFvc/81ZY
         d63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733799; x=1789338599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Be/EqUUFz0kczsRXaJG36N49Hpssj0V063Ft3ehqjSs=;
        b=s8obH8huslZqhKlzmEFpEZrKslyIf98imEQsS0oqvrv++VIZ8UZM4IatN4DFs1IiUz
         5bhuXlxvX1f7mEqSsv4RZJ5PgLE58uHOSBI2IzUhnZHqhPKU71iZR3UxFsGNuq+UoOz8
         6UVklgY2V6Gq6dz2qUy2m2MASrfoQjlBWqpFpGTIwhA+RfO2rrPf8sgtx8WtGD57j18L
         Yv/4TWomv2xtUsJJmOy+BqyUhgy2tv15Sst7zUpAgDJu2+fwWXxHk/VppM4nVOLpGPyN
         D+LdnqJZp3fBbCItyUJLCNXehRxU1DUZ1kwAYVNOZatQmkOUxYTKivLj8wWcC7+9wqTm
         Q4bg==
X-Forwarded-Encrypted: i=1; AKwUvByR9buEGWWnZvsrY2KNn2ohqZhV8X0mZjcZ2CBq6LsOlTXsrhccmsLPFycVlQC0sbvAPM+20oZbE8Z65fk=@vger.kernel.org
X-Gm-Message-State: AFuF++mjipg6Ypyvbr9JSIhB1M/C6UZUH3CTDlAOuE4pwmYAYnbXc5OB
	LzrsmMY8XRkGRhmunuQ11ZEiH0ejgmGwIhM6Qzp0xgf/xneHeHDMnoikxG4VGQjh1Ir3lXNRFri
	TMtze5eprCIx7FKnpyaTTxK03kF1kso8pbY+bXW1lkvzbZTiGu9EYxA2m5SAmJQ==
X-Gm-Gg: AYBFou3WXXCMivjyYqwowU7y0xt4OFazl7G9et81C7hLT95O6FyFtO/RJywE+96XAR9
	4wXaMNz7vnPiMGDB9C0FbdajyHa6qZ3pXEdnNdCExWpo56b9CbnaUPmYWqpEaeru2XFAXj1UyEB
	ycY8L2Ibq8lQ4bc+nTktyRqBhV3Yvp3o/FNkGpJV+PfRvS4OK1IkMW31XbyG1SInhrAGp8z8YH8
	C/qrc9HzmDlMSVlM0JROXyaSwxH5dvFQoKkBW6ttTN1v03BjyKT005DVd4l5HuBxI5kEGPNr8ct
	J8HhjX3rfjOZdhHu/HTSiujKx86G4PdVtgZ0Ldzi56ZfW3a3hP4w6DWm/wcq0WIzZWvcPaLNZSm
	l/nHq6kqIv1WZViD0YgWZE6JE54lUrBc4/IUvQjgMOyh2FvmS
X-Received: by 2002:a05:622a:4c14:b0:530:178a:9dc2 with SMTP id d75a77b69052e-53054849698mr219990791cf.16.1788733798706;
        Sun, 06 Sep 2026 15:29:58 -0700 (PDT)
X-Received: by 2002:a05:622a:4c14:b0:530:178a:9dc2 with SMTP id d75a77b69052e-53054849698mr219990391cf.16.1788733798221;
        Sun, 06 Sep 2026 15:29:58 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a7b7sm73048541cf.3.2026.09.06.15.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:29:57 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 06 Sep 2026 18:29:34 -0400
Subject: [PATCH 07/10] btrfs: use folios for reading super blocks from the
 block device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-btrfs-folio-conversions-v1-7-834b9d7b06f5@columbia.edu>
References: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
In-Reply-To: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788733791; l=3849;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=jovNapv+xLpH/I/e/ElKwI9GEREfMqwAcqQebs6v74U=;
 b=TlxjpbOD8hVpMicJRhhniWV303IHsd1usWSpxmpkraDVVbMQgZenazgdO5TnhegUe94wo98vP
 5FRSFgxDaJ+DYvreByiDxMFLAJCWihNYuoYNOciT/Mpea+HUXGVkt3I
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: LkFFa6_BFA4qYN0wVpuhkX9oBUWrEtko
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX4MrV5t/ufpqI
 10XDLW+Q93pYWcTyeDrklFjD+Eu8EubPcBIkK5oVgZVQ1UkPhCSl96fF+L1ARmquVXDcvxQAxa+
 G5cRCsLzps6fxnxP6ifKNBaWgUhuxmkSZoz6SDUt54mTDU8bC6qd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX9eibDRm6O3Mf
 ia0ybtuszPXejV5AYXp8fzAo6EiBLGAGLFlmJdK40NwJdM0qF/vyXMFe0KgiApaAL2zJjrwuLot
 vSM6CTUPpkZ30+J/6qfWu3qc88/jqY2kNMJtI87uoP8B0s83DGbRv6wj9SWtgK1BaEt2UT/w6AQ
 0e8Gmdx9/ZxaB0CcuDQ0IYJZxP7/fcUL4i+eAqULcqrHpkARwRntYEYKj1AKxdXBFhdx9rFHGYJ
 UAbU1eYuzKxRZ1KkBEMvqZOnpYQ8fbZCH4E40sZwlNrmVLi4sQYPh6jO1raXEBQsPRxOG+cfxPt
 Kn3rQ7nwUHkwwzr6/uhQ1WiY1yUhSfymXGUHA0FSCUHoNJjYBoFHWUrswRcfaYI5Kf6Fa+Hr3fE
 riI8ChPYlgpFc3XRlN4kFeL2dyDw0H+zBjXgfOFewuzjEpLCYxjfX5c00wm5bIyLXsiHe60vrS3
 IerEO2knHTq38+d4mXg==
X-Proofpoint-ORIG-GUID: LkFFa6_BFA4qYN0wVpuhkX9oBUWrEtko
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=6a9de967 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=C-EEzzuqgLcvSd4iXwIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 malwarescore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=10 phishscore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060252

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

