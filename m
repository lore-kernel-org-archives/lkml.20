Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A623BBFAD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617641; cv=none; b=VTV3in2+aHLCQIGGf0NANvV5c7oMbKeoEdRj87hUtC25BscKiSG1pxiLYPGq6NwtczNtclXoIRbuctGWtYGsW2IJrbNb8k1uTop8mLCgF0AhnQt2xkRYBnx/ka9ConfTC+sHqF7uuvmqAoyzuDNpkQcUoSMlmUNM+rd//OII97g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617641; c=relaxed/simple;
	bh=rulmlM26V12Eg+K7SQZ/FyXPG7ub2C5fYZrfS5dFjSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLPn6J8Ig6GwKVEhjUXE7ApCngp6wj2qL3Zdrw5T18TvzPND2uK57j8u/GLkryoxDZOybq0qBPGzT1CgTif8mhk3f9gW5XSyz9pbW7GyjB+Jsdx5MKVh5TM5cMO8RJt6RYeK8RSzEuJ+Fp8hGapcE8tKNI0UW43f9wWdcF5ZEsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=N4PX21j2; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tjvWHdBq; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="N4PX21j2";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tjvWHdBq"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2YgHI3509288
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=OnlL
	M7eRN8QFBco+RjUrDttkRnm/OziXiXr6FMqlxo4=; b=N4PX21j2obYubWrVPPsB
	zuABRW6ufw2idxmjZtHD29kJjwn8Da3/iy2SvDqVRV2WkBPrgdadEiTwgpx62428
	8px7Csylle//FJnadPCM7y85oAWuCAFFVUzzGhM2jEIngF3MuO5gT4Fa37locJOW
	8X9Ic5M9FoVHdHPhgVmUWBsEOyJ2XcdND92/+OgEFLim5j6zobLh4TKMMAVCNxxt
	40iSN+pSZqIwV3X/FqLfWzeo1NDZh7bth7AfW5OQtpSPDnNR1XVWHnRsgCQZln9i
	y34owBuKr/MFLyTMH+XvVIJZ1ztnTabzgjllnJyVX5dL8r+1oMfsXBGElB7ICtJk
	0Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr3swhcys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:36 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8472ee1eso7683366d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789617635; x=1790222435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnlLM7eRN8QFBco+RjUrDttkRnm/OziXiXr6FMqlxo4=;
        b=tjvWHdBqwNxDij/8D2hZ1P36ZkEug1Zrhkd3cWMIRP8YeEQB7MUQug5XpuQMcL7FzN
         x6eCKINB8FrTiLx+rRAgcq6FMX2m36par2loW2TBwbKOmLrLkQ7FRyWdsuOUQhfQZ6CT
         sIcviMNgJkOA//86/RrVcnBjuX4uK26nVsInv+oNa05P/IiafG28D8gjQvNRy8N1zc4R
         WXObn1/+hTOofBe39dLSxlAv+qS2d94k2cH09hILyzWRWk3i0piq4qhXa6gZcEd5nOpe
         L0KvA3u+OfzNq3vGKxjYjgaytydBBeQ2nWZwcX21XpGnngEGRduX/vp7OjqRT//rWawW
         mCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617635; x=1790222435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnlLM7eRN8QFBco+RjUrDttkRnm/OziXiXr6FMqlxo4=;
        b=z60x3Pu2etdoOly3YBDTBs+SYixrGTcFiFSdwiz+EOfQLRTVPGcNvJAK3ANdu1jonL
         0mS/2b/XkNxqj5MGlMYkohNyMDYDwUnePOj5HTKtYNTnuylEwcaVqCBC/KZJ/6V4zKQy
         IundsrYg14vWBXyr35xas6pQfQ2bOWh49c3dpwcRARNEVcvpt6FMG32lcurXEXdFQ5yE
         9z9XMqJQhYfe+6fBh2H6mz3c6wYf4pG9xjP1TSKmCDQ2DiOTrksontK3+jgXaJTI86eT
         aHFsgpCVdfwlL/OrpJU2o5+rTaS3pNZco9qfdwzkrsEWIQOtIN7pD+FYq0xoQH0HXscb
         cAiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD/V290uCbKAR1cME0JRdSrwSqS6A9NVDSp32yMeEfqwnwvdVkM1o+5U0sVOJVHy4bGTBy/ntjBsLd39U=@vger.kernel.org
X-Gm-Message-State: AFuF++nO0msmPtRUVcaJXlWm72mKmubMl6AlJi5ccZP6XVWzVrfPiTlW
	jiUmpUvFyX2xWWNMtt8GQ/NByOoBCxmKjiZfM2yCONViNRrmw3Nk+w3yYK9z7I4Jd6xdUOUAbWb
	g8rz5W1JaQUtJ8bm4o+Dgn704m2aSKWqw0OABmr9F5i9VycrtYjS3yKySdQHyNb3AOsYuyA==
X-Gm-Gg: AYBFou3DeJwpm2+3xygDvTg9+t9QQJSC3TghzVLCXUMVaPOhK88BNmwp2lp6FJbwO+l
	/ksg8eHBHNmc6CWyiloKQ/6jf2gzWjw8v5gw7oWDDicJvsFF5ngJAqqt8fj9l7WugLjpeB5s2G/
	pm6mAmsToX38BD/D+lkFmNTk7tLOhr3jkRx/Fn5/iNNgoKYh5+7hvxbG2nWqDNkf6oM2iXtPvqk
	ItJkaJamxXR81I1RYds32IufzZoLCu4ku9uXfpCUasUaIaBFtwR1oHG2rlIpoQkIG24etDBghYX
	h+nAZmuBjbMOR1RP06bRi5+SpXV5dMqxft7jRP7f3FWFfJMDe/AEIFYUKSUBeXHG5e2Oo/VTSO0
	fcIrsJwfz77G+f5NC9ltBoeG6YaD1/hB37HE+4URU2RNpzg==
X-Received: by 2002:a05:6214:5d05:b0:912:127c:d7fc with SMTP id 6a1803df08f44-9123d7dbe02mr118184096d6.37.1789617635371;
        Wed, 16 Sep 2026 21:00:35 -0700 (PDT)
X-Received: by 2002:a05:6214:5d05:b0:912:127c:d7fc with SMTP id 6a1803df08f44-9123d7dbe02mr118183726d6.37.1789617634866;
        Wed, 16 Sep 2026 21:00:34 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm41748766d6.35.2026.09.16.21.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:00:34 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 17 Sep 2026 00:00:04 -0400
Subject: [PATCH v3 08/17] btrfs: remove btrfs_disk_cache_state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-btrfs-remove-v1-space-cache-v3-8-10ebde03b96f@columbia.edu>
References: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
In-Reply-To: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789617622; l=6238;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rulmlM26V12Eg+K7SQZ/FyXPG7ub2C5fYZrfS5dFjSk=;
 b=l7I3D8GkAZG1CegWVZXzayXMbxr6vC/8EhbT2Z6HLIO+0T0PevIIqJL7/ypJgaMLOlN7VypN4
 g//yYoyRUMOANUnzbBoVUARDPoqDJoHHtzvo6UQoZtq6IvuWCm4BHvh
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: WjzgRcbKgZ3bpZ_ffaRZuVmFEEsKvQ8Y
X-Proofpoint-ORIG-GUID: WjzgRcbKgZ3bpZ_ffaRZuVmFEEsKvQ8Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfXz9nPf5NpsDVz
 QTqVPs8Z59ch0rGjXlBeTHh99HK+YcdshmC2PH8XetxKrCChNbq6NBGLUznX4xZmqPi1ZX2sN26
 +8fp9efrXk4o9B1+mwSJb+WLJ2PCmt6Shjl6QcviGKE/aZPoa1PC
X-Authority-Analysis: v=2.4 cv=ac30Dhot c=1 sm=1 tr=0 ts=6aab65e4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=-H6kAsrtDIwNne7E0FYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfXx9rgHg6goihk
 kYlix+O01RT4t9WcyVWbDkPRG/waBxIaBlcoeWeBZamsTdP/nEgdzl9hD6blBVD5kgPPAj9fMLH
 FeLgZ4sXoo+RcKrthwIghJWVVeUATwi7W7nf1Aw3wMn26v4ZII2znNVMmvPA46y0vmwYeno7/4c
 roidyNK5G8r/X8up8bNifiD4PHTD+5a5x5fBzJkVc5LigfqaKkXRMK9sR99f2VCRXiLF3PILqlg
 CCAIi2x30UDSJjd706ttM6EUPtmydxin8WVhRFK8srdxD5mfASzJ1ZU5MU7yU60+sZ7/vfdUoKx
 E4a3a8tktfxTQGv8UK6QSxRWKRDRoHbTPv/GYjG9O3aK/ug7/nZ/ehsY8vW9Sn0MQK/N2l7vVyz
 XeMbDoBLxpFA/FqlGfrPdQwoT0DM+BFaf9l9gaHL3XIwFMClKXf9YGHG83YYqZLF+2UkRpaq0D+
 0Mu6oMxFzatNmnGQO0w==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=10 clxscore=1015 adultscore=0
 lowpriorityscore=10 phishscore=0 impostorscore=10 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170047

With neither the writer nor the loader left, nothing acts on
disk_cache_state. Remove it, the need_clear handling when reading block
groups, and the enum. While at it, drop the unused cache_generation
field from struct btrfs_block_group.

lookup_free_space_inode() converted old style space inodes by clearing
disk_cache_state so the cache would be rewritten with the new inode
flags. Without that it only sets flags on the in-memory inode, which
every remaining caller truncates or deletes right after, so drop the
conversion too.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/block-group.c      | 32 ++------------------------------
 fs/btrfs/block-group.h      | 10 ----------
 fs/btrfs/disk-io.c          |  4 ----
 fs/btrfs/free-space-cache.c |  8 --------
 4 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index 972909b52a39..7c5f80f4aa79 100644
--- a/fs/btrfs/block-group.c
+++ b/fs/btrfs/block-group.c
@@ -2454,8 +2454,7 @@ static int check_chunk_block_group_mappings(struct btrfs_fs_info *fs_info)
 
 static int read_one_block_group(struct btrfs_fs_info *info,
 				struct btrfs_block_group_item_v2 *bgi,
-				const struct btrfs_key *key,
-				bool need_clear)
+				const struct btrfs_key *key)
 {
 	struct btrfs_block_group *cache;
 	const bool mixed = btrfs_fs_incompat(info, MIXED_GROUPS);
@@ -2481,20 +2480,6 @@ static int read_one_block_group(struct btrfs_fs_info *info,
 
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
@@ -2635,8 +2620,6 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 	struct btrfs_block_group *cache;
 	struct btrfs_space_info *space_info;
 	struct btrfs_key key;
-	bool need_clear = false;
-	u64 cache_gen;
 
 	/*
 	 * Either no extent root (with ibadroots rescue option) or we have
@@ -2657,13 +2640,6 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
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
@@ -2692,7 +2668,7 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 
 		btrfs_item_key_to_cpu(leaf, &key, slot);
 		btrfs_release_path(path);
-		ret = read_one_block_group(info, &bgi, &key, need_clear);
+		ret = read_one_block_group(info, &bgi, &key);
 		if (ret < 0)
 			goto error;
 		key.objectid += key.offset;
@@ -3555,10 +3531,6 @@ int btrfs_update_block_group(struct btrfs_trans_handle *trans,
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
index 939d4bfbd4b4..eac794a053cd 100644
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
index f256a91f58b4..881d95080709 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -4864,10 +4864,6 @@ void btrfs_cleanup_dirty_bgs(struct btrfs_transaction *cur_trans,
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
index a25c4db561b4..3ba9ed4a39d0 100644
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

