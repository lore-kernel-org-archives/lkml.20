Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6536E3B2D0D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075426; cv=none; b=ZvjkFEF5rAbYrOXnpUh/e16Bf7uYkuMLdvxcI2lUESztOVRW2iWn2RJKBk0+QwKU9lGc6iebEztXC9VF8spll7zuYm7rcoa29n5kBiL9mVSH/QVr8jJXREdJOWHdOWZCUSDwpaknVsAIy+GcXXF2+mgIirsAexUL/sGjJvWuk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075426; c=relaxed/simple;
	bh=1G4dl7krOWg30TXJkog4/6kB/GW9Erf8QFwRG6u7HIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqaT9fTtmeD52L8KSX0PkkNJdMGe6nrLkP6Zw4zeMDXieJbH8yp/q2qKRVc/NTtXpjpK39ILAMuS1vPATJjla0BlrAdpn6C3hbjUIvbcT2hNyPD3YaDWuF5yEplcIq3m+DRrwsLQ+d0snYMIBc0L+I5NicaEIo2BAyHU6irlclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=qPuAIwiD; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=xQHS0ple; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="qPuAIwiD";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="xQHS0ple"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYW7Q1622755
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=qv0I
	S5elhCWP4RtfRHTL2aHqZhSGZG1qjkZr0kzFM2E=; b=qPuAIwiDGWNzM3Y/gkva
	07OtWbUtjyTpdNQobIyGOxi6TJmHtFEucfxb4rubIIfeDOVsHnneZrc2GHuxji+3
	b7logI7G2y3jxVY48gnPms6uCwc+ZBezNUezWIIMBv9f/UdgET4btW2dcQOA1GP3
	Djyb0LzuX2DNggVZHPOdpubZj2yWN65ge2T9P/55cP6PTUKOlt3Gyxmv9CvwgtNs
	WIsDgpfD0N/WDuPZocWKz9zArm3osiye4rfLc6M4KGtvi15jxEJfPnN55CihPrkJ
	Wk0mNSK8UnxJBmBnK6zVqCxS+tqDBHBSeS3F2RllmjcSOTKj5A7NR9dNpYbI6/SL
	fw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hah8evwhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:42 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so109342281cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075421; x=1792680221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qv0IS5elhCWP4RtfRHTL2aHqZhSGZG1qjkZr0kzFM2E=;
        b=xQHS0pleBRF2NYQ5wQ7xIA5ofej9o0bU051pucKT7b0v0JN9ovz1f3AVVCr9wimF+u
         Do3abMahI+HRJ/Z/Nyzn40m/OmUQhzDSONqGLHcX8cvyZz/Vkp6MW9waDvIeYzTB1cPh
         Eg4RMIGi9xtZ1FzNlvJ+EpBczROHteHIYkLqlUI+fuLIV3Lp/d/kT0rXmunsZdC5RGwj
         VLqsBsTW6nrEnE9kgj8tlXbewP58pRv7lLF3Tlvpj4ZN+y3niui3cW6dg5CEO/ojx6+T
         G13iQhACMKQtUG5SccjTKgLqMDEjWCf58AWbh+eJgiJt3cQcS1AC5UaHbGU0577XAHn5
         quVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075421; x=1792680221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qv0IS5elhCWP4RtfRHTL2aHqZhSGZG1qjkZr0kzFM2E=;
        b=LhtG5D3KrcIMyeOi8LyKvk4c1YZz2FVQgm4FNlj2dwnPoDnga9kgmUPtvQ7l/GlEEs
         yUDgS7MQiBX35GGi2p4JFRfa9TS0bQ3+CEcK9KCYF+XCLf+0CvSj5XViKIH2IQscsasT
         zY9ccszDs87ttqC1Xvky/RbuHN9x738EDpkRkhWoN9ue61lJ5VbBNFKAxcH/ujmyct39
         BpSzICKZbMomDrwz8NnxpG9coI1mvqqjS2fWUvnP+ctQaRTWtzinjK3h7emYprzt8w8r
         rkBwHSJ7ucfmVytAFdOhFezAqmOK/WdiCCUWJYAZVfvDVyTiqW9IshHWMmbi0im4z/gu
         qZDg==
X-Forwarded-Encrypted: i=1; AKwUvBx4i/+lfeDQdiCyZmlLuYjoKS+BszmgwGFPioSm+RV6dkb4yuxuN9C5cBKdhFEhtu/dp7VKJuDb7mA6SYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRdDCH8aXRUge6Ihszhb4OZvb5+BGyNVKa8RSdxMNBqRd+K+4M
	mlfalY82q8B/QLQdoHcsmnpLyVH6KjU0owdBi7oXetZ9Od4VV/HsmcULuOFd0AXUHWYgVO+qCM6
	u+c0nZjiHuXDXtWNDYKEQIJx4HlMA3hKSks3rXT/BIDdd0WdQvtCGUJEOaDsEoA==
X-Gm-Gg: AYBFou35Vh139TOYiiqKksAKt6EfQkw9zFlM9D7Xs8tEzHscc4du5OFG56Is+9aBj5p
	L1doZ3170/c0slVUhASHT3CRH4VDhSnJEClU5ILYubZA4IUQP8VrXBZek/V+W8tkKX0qFERNbGQ
	N8GQKV6ZJffZnDof0P1sJMCwjWZRbp2kYoW9TcgLcvOU4v+SpqGnsCaUY8db6y4AUCmt7u4DJFI
	TPmjZOllpx3gYTfZ1i48mEWtSWL2HBv2USzQoVoc20DAMX3dakuo/+Jyek9KZOTuP+O+SNMFtxB
	2v5aHKlGKNelpEwO9HhqIy4aqUj5to75Ok0WI8gPywb1AapIsooaEQ2/Wg66ON53m55cqa/k+eB
	357GTmTSNHRdGqOeWPuyzXkfs8B/wq1x7IY17EYVw2WX2
X-Received: by 2002:a05:622a:13d1:b0:535:4428:6baa with SMTP id d75a77b69052e-5359fb27463mr314764101cf.28.1792075421388;
        Thu, 15 Oct 2026 07:43:41 -0700 (PDT)
X-Received: by 2002:a05:622a:13d1:b0:535:4428:6baa with SMTP id d75a77b69052e-5359fb27463mr314763651cf.28.1792075420861;
        Thu, 15 Oct 2026 07:43:40 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:40 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:23 -0400
Subject: [PATCH v5 10/19] btrfs: remove btrfs_disk_cache_state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-10-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=6218;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=1G4dl7krOWg30TXJkog4/6kB/GW9Erf8QFwRG6u7HIg=;
 b=6gMaWYqKJblIWicdL2Tma8Xo7+jMDeJIJBktrW3/LG/hTQFIhrhspzDWsziA1+9ozDVB22WcS
 fmv8fKnAUkuBK46kxR/ol0YgaeozwKCaRvahFyojaiSWvdLyMeIq6Nh
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: K33_l042WYcyrs7RP4jA94740ouDY7ld
X-Proofpoint-ORIG-GUID: K33_l042WYcyrs7RP4jA94740ouDY7ld
X-Authority-Analysis: v=2.4 cv=Ob8NnRTY c=1 sm=1 tr=0 ts=6ad0e69e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=-H6kAsrtDIwNne7E0FYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX7AllnRkf1L11
 g4LtYr3Pi/LPSUabfj/NEhzv6hjy2SsMmY4uYOMokxDu8Or1trYoKyoR4+mBOhe/IW25Li6Nls1
 ZwEuJryEIdqd6081/aUYWAc4bcOG9kp8W3IDKdcGEDk2u7ooufKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX2SHzeQIQEEBo
 A5/e4HNpF3hm1oFyY+3Iv4D4cv3rWNKnwOzwG0ZnMfL+gXimRYMrhCyhxhHZHGkqaLmx5qqmobU
 Uhu5CPg8iIExznO1LUwMRcGRjMXmJiAxtbx2KYbJHlY+k+Su7asuF/xsLcAXG1ix3ZXDX4ZHyFo
 50i3lkh5wrjXUQo3zd0boqWdfAarWD1hfQnpgIF1rLSLdOhly6N7nKjAL2GYYeV/WsE45gGbUGG
 WB2T3uGDIN1wUMGwljJVRwM4g5G7/Os8NQeTaOaNYDgH1C1Lm2XRCNfO+UDJ2PAE7/QcK9qImJJ
 cs9Toxsaku4nmP2xMbP5CGl7rOCS9VOWqVKezlTv+MIwvPXk57SCLshVvn8XhoFTKlQ8u8hxuGA
 opQqF0mTfJU2C1GMfhUq9KgJs5VRWoOu3xCaxX794Howr6DIkn4bD4jtb4HtESE8aVeOoN8TLb1
 HGWmf3StRcMFRwv9vbQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=10 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

With neither the writer nor the loader left, nothing acts on
disk_cache_state. Remove it, the need_clear handling when reading block
groups, and the enum. While at it, drop the unused cache_generation
field from struct btrfs_block_group.

lookup_free_space_inode() converted old style space inodes by clearing
disk_cache_state so the cache would be rewritten with the new inode
flags. Without that it only sets flags on the in-memory inode, which
every remaining caller truncates or deletes right after, so drop the
conversion too.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/block-group.c      | 32 ++------------------------------
 fs/btrfs/block-group.h      | 10 ----------
 fs/btrfs/disk-io.c          |  4 ----
 fs/btrfs/free-space-cache.c |  8 --------
 4 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index a11685440e3c..9a98e291769c 100644
--- a/fs/btrfs/block-group.c
+++ b/fs/btrfs/block-group.c
@@ -2496,8 +2496,7 @@ static int check_chunk_block_group_mappings(struct btrfs_fs_info *fs_info)
 
 static int read_one_block_group(struct btrfs_fs_info *info,
 				struct btrfs_block_group_item_v2 *bgi,
-				const struct btrfs_key *key,
-				bool need_clear)
+				const struct btrfs_key *key)
 {
 	struct btrfs_block_group *cache;
 	const bool mixed = btrfs_fs_incompat(info, MIXED_GROUPS);
@@ -2523,20 +2522,6 @@ static int read_one_block_group(struct btrfs_fs_info *info,
 
 	btrfs_set_free_space_tree_thresholds(cache);
 
-	if (need_clear) {
-		/*
-		 * When we mount with old space cache, we need to
-		 * set BTRFS_DC_CLEAR and set dirty flag.
-		 *
-		 * a) Setting 'BTRFS_DC_CLEAR' makes sure that we
-		 *    truncate the old free space cache inode and
-		 *    setup a new one.
-		 * b) Setting 'dirty flag' makes sure that we flush
-		 *    the new space cache info onto disk.
-		 */
-		if (btrfs_test_opt(info, SPACE_CACHE))
-			cache->disk_cache_state = BTRFS_DC_CLEAR;
-	}
 	if (!mixed && ((cache->flags & BTRFS_BLOCK_GROUP_METADATA) &&
 	    (cache->flags & BTRFS_BLOCK_GROUP_DATA))) {
 			btrfs_err(info,
@@ -2677,8 +2662,6 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 	struct btrfs_block_group *cache;
 	struct btrfs_space_info *space_info;
 	struct btrfs_key key;
-	bool need_clear = false;
-	u64 cache_gen;
 
 	/*
 	 * Either no extent root (with ibadroots rescue option) or we have
@@ -2699,13 +2682,6 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 	if (!path)
 		return -ENOMEM;
 
-	cache_gen = btrfs_super_cache_generation(info->super_copy);
-	if (btrfs_test_opt(info, SPACE_CACHE) &&
-	    btrfs_super_generation(info->super_copy) != cache_gen)
-		need_clear = true;
-	if (btrfs_test_opt(info, CLEAR_CACHE))
-		need_clear = true;
-
 	while (1) {
 		struct btrfs_block_group_item_v2 bgi;
 		struct extent_buffer *leaf;
@@ -2734,7 +2710,7 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 
 		btrfs_item_key_to_cpu(leaf, &key, slot);
 		btrfs_release_path(path);
-		ret = read_one_block_group(info, &bgi, &key, need_clear);
+		ret = read_one_block_group(info, &bgi, &key);
 		if (ret < 0)
 			goto error;
 		key.objectid += key.offset;
@@ -3597,10 +3573,6 @@ int btrfs_update_block_group(struct btrfs_trans_handle *trans,
 	spin_lock(&space_info->lock);
 	spin_lock(&cache->lock);
 
-	if (btrfs_test_opt(info, SPACE_CACHE) &&
-	    cache->disk_cache_state < BTRFS_DC_CLEAR)
-		cache->disk_cache_state = BTRFS_DC_CLEAR;
-
 	old_val = cache->used;
 	if (alloc) {
 		old_val += num_bytes;
diff --git a/fs/btrfs/block-group.h b/fs/btrfs/block-group.h
index f7346a0170fc..d567ed822e55 100644
--- a/fs/btrfs/block-group.h
+++ b/fs/btrfs/block-group.h
@@ -20,13 +20,6 @@ struct btrfs_fs_info;
 struct btrfs_inode;
 struct btrfs_trans_handle;
 
-enum btrfs_disk_cache_state {
-	BTRFS_DC_WRITTEN,
-	BTRFS_DC_ERROR,
-	BTRFS_DC_CLEAR,
-	BTRFS_DC_SETUP,
-};
-
 enum btrfs_block_group_size_class {
 	/* Unset */
 	BTRFS_BG_SZ_NONE,
@@ -131,7 +124,6 @@ struct btrfs_block_group {
 	u64 delalloc_bytes;
 	u64 bytes_super;
 	u64 flags;
-	u64 cache_generation;
 	u64 global_root_id;
 	u64 remap_bytes;
 	u32 identity_remap_count;
@@ -171,8 +163,6 @@ struct btrfs_block_group {
 	unsigned long full_stripe_len;
 	unsigned long runtime_flags;
 
-	enum btrfs_disk_cache_state disk_cache_state;
-
 	/* Cache tracking stuff */
 	enum btrfs_caching_type cached;
 	struct btrfs_caching_control *caching_ctl;
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 4056ad1ab728..82b3b4579880 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -4863,10 +4863,6 @@ void btrfs_cleanup_dirty_bgs(struct btrfs_transaction *cur_trans,
 					 dirty_list);
 
 		list_del_init(&cache->dirty_list);
-		spin_lock(&cache->lock);
-		cache->disk_cache_state = BTRFS_DC_ERROR;
-		spin_unlock(&cache->lock);
-
 		spin_unlock(&cur_trans->dirty_bgs_lock);
 		btrfs_put_block_group(cache);
 		btrfs_dec_delayed_refs_rsv_bg_updates(fs_info);
diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index 1e2fc2884d07..e82216ebd5d0 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -124,7 +124,6 @@ struct inode *lookup_free_space_inode(struct btrfs_block_group *block_group,
 {
 	struct btrfs_fs_info *fs_info = block_group->fs_info;
 	struct inode *inode = NULL;
-	u32 flags = BTRFS_INODE_NODATASUM | BTRFS_INODE_NODATACOW;
 
 	spin_lock(&block_group->lock);
 	if (block_group->inode)
@@ -139,13 +138,6 @@ struct inode *lookup_free_space_inode(struct btrfs_block_group *block_group,
 		return inode;
 
 	spin_lock(&block_group->lock);
-	if (!((BTRFS_I(inode)->flags & flags) == flags)) {
-		btrfs_info(fs_info, "Old style space inode found, converting.");
-		BTRFS_I(inode)->flags |= BTRFS_INODE_NODATASUM |
-			BTRFS_INODE_NODATACOW;
-		block_group->disk_cache_state = BTRFS_DC_CLEAR;
-	}
-
 	if (!test_and_set_bit(BLOCK_GROUP_FLAG_IREF, &block_group->runtime_flags))
 		block_group->inode = BTRFS_I(igrab(inode));
 	spin_unlock(&block_group->lock);

-- 
2.39.5

