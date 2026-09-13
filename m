Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEA238F95B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334506; cv=none; b=rWH5FYAJjWO8THLhTek2rXhzWEU3XcGzBJXrnwayYpFpYGk+ULATEhnErnU3S3FBEsI+TMRGd1xl/x3N9pk3+JfT/IlxOFclpQiwZQQfFomMXG4iy0YjFqcXkB2KNWNaOVud2W4Sy8dUH/ItabeemEShPGNWZX3yKvRDmRz8PWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334506; c=relaxed/simple;
	bh=vKb/gGmZfXP29NVMCIBexCHeMi4FmxmfEWzn7IiL0cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgfNBfZnP5FvPWF6Yb/0ax631vtyp0L2D1pTFZHNHEDwI8tiefzeXyHBc/rfHen6kYR/Jt78F49qpk2md+JOf8+5HTgj5H1aiZgvBPnmqP1744qQ1A99uCRFfvhFBVW6ueV7dhGl240LsMs6zjYhd3xp0MVbzGT8Exbi3XJp0Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=TF5xDUtV; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=K17FmWzF; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="TF5xDUtV";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="K17FmWzF"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKXnmM634633
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=FGtc
	1NLeQBu+kS94gpur8nkzS5KJcdAIY3+s7g2GWMM=; b=TF5xDUtVk7YIBsCZqgQm
	mVbOBpnNaT6o8mvoG5TDRH23HEAsulammU99qtCLL/OJhZm9YyiwX3V2hqVgFyor
	1AP9LIc1DA+AWBVFkOGdcFgzjwKlljaI1dOHxNts5oxk8IG1UbOS+3nVSY2txPVd
	UnqLpgzra0UAr04pOpby7ru5T7sCY/R2F5/4rkkINqjISQ1ZrVDavo0IocpobJLZ
	R7kZZK4mZ3X7NayMBRI0vcHyVXZ0QhWKiGVTLmg4X7Fx3/R0nvGwoBHz7zkQfLCS
	DuGPDi+BkUpaboFCucuWmoCAgsaAisTwBOgypqgfHtqbGWuiX6DizZztO6UWVPJ2
	fg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gnwac9nx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:39 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso418698785a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334499; x=1789939299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGtc1NLeQBu+kS94gpur8nkzS5KJcdAIY3+s7g2GWMM=;
        b=K17FmWzF7o8Xy0uhh6uSdmWeBs0I5oxZCD2oXyytNZsKDC0IgBGQMDArWFRThVCfOF
         gig7Ysota3j7maFzZn+azY19sOUN1HHNuhJSWG3DNejbPLsQ99EpiOEWMEuVAQBZMGiE
         G3k/aBKOzZxSkMJgcQPj0zEDNB6WZ81PnwG8a11YwVwWCjwIY9k3V+uVb49FZePlovAA
         V2cu4JpQMSw3DwPxlHJgWMdrSWIuzA9IEMqkgjLAxpvRZh8lOzajh9roS+DAuDV8lDZz
         uBSaIjl1gqjLEcmj/wA9AaEnnjw+jSZGW4aJG7bsL6gNuSXN7xdGh5pOeeS6NHocyGbo
         3sAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334499; x=1789939299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGtc1NLeQBu+kS94gpur8nkzS5KJcdAIY3+s7g2GWMM=;
        b=Rr3GgN5mD04aqBVZCl02YBNH7yOUqC3w6AbDVa5Rwc35dklg87iDE04wJ5byTUcGCB
         5Yt03G7YaYLQkUx7Aym3SiFMQenvB92qSKfJ6TjC7blkhR5siR4j28hFfMfyidNCTJ+f
         dNnWOB95jh7Ss/tlJ/7Sc6KCzsYHYtocB27fKJ5/dXrTZtzzUv+DWP/Y3BHQT/1DMzUo
         NnRLSURgMO6/uhuy6xC2/rP4zwVYfeaKESeLk3+MzmGdy/Ud8vgDXFPnh+4RZF39C0uw
         AM/dnCM87bqrwyOGwasCf9yoKxFelBJn4CyT6FChz8SxQsZc26xQ0KlFRyDSKyvfvIl6
         NuZA==
X-Forwarded-Encrypted: i=1; AKwUvBxq87dmxL7edWy3jYosZ4GgkxkhjgUDJzLiHkSgXEuuZs9fhSRrR27b5B1cBZj7EZ0EkfMCbiltnQpUxyM=@vger.kernel.org
X-Gm-Message-State: AFuF++l7TwIfOai7hsAVZG3ZHXqppSMwzXtomoCsJPL0rgl0QdtvQyWX
	x1+N5b6Zdrb1iRupAFeiubuVweo8Vdr7xCROTwRaV52FroK0KDazCXe5Lmhjn0wuwHEgZY2eQBV
	kx1uypsmCWyjmv2Y3FbkBk0zlScUiFVoOm695ivMoKCpMDf++1oMVMjHnVVxJKRoYdBZeTi3N
X-Gm-Gg: AYBFou0imXWFwSYWetOaYiAyGAEx2m0NHZj/rBKRajVFp66NC/vS795dM3Q3D6a4PBZ
	ThV4ebuxzj5DdjoyBlwSKJqcmZ2Y+NjchdVnIgnI2y7IODFY9XEE/tODlx/RvibM/irMMq7W+Em
	ynuECM1AkJKcajv7S7WSbFPqp8Rf61tvR8q9cB5o8x7dxW4lHTuiCmWH3ICJ/6iTBVgYQfRZLvq
	TwaTK//gJ21mewrrqUEkbZCn8vq7GiLbbLZ+hZ5BE/VoG9R/5gtMOpQyZzdns3v3RxlP66dHGuG
	rIrY5qg9hKHnqNt075RyjTlXlgooL/cID4CP8yDhB7nOqiOChPQW+3YmVDuvR0GW7oQDYa00ZZQ
	ZTzVik2cG52IPGBKO/dWFQaxp7moorpcppKWRth5jx8/7NdlmmbKgHw==
X-Received: by 2002:a05:620a:40d2:b0:92e:d7c7:7de9 with SMTP id af79cd13be357-93a035f329fmr1127896685a.8.1789334499300;
        Sun, 13 Sep 2026 14:21:39 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:92e:d7c7:7de9 with SMTP id af79cd13be357-93a035f329fmr1127894485a.8.1789334498875;
        Sun, 13 Sep 2026 14:21:38 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:38 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:21:25 -0400
Subject: [PATCH v2 13/16] btrfs: remove the free space inode special cases
 from the COW paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-13-186767a7e106@columbia.edu>
References: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
In-Reply-To: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=5995;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=vKb/gGmZfXP29NVMCIBexCHeMi4FmxmfEWzn7IiL0cs=;
 b=6dmXrOeyfpj8q4IcK508wpbKAGr0yK8joC2pHxGAD2oZtkgGX2G74qloxg7K1oSdmNW32p3+T
 e3N+l50hiMXDcdhb0SA69qp1cepL2GtjjrlcNkRaON4q14ipY2pC3rC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=BqQIUoX5 c=1 sm=1 tr=0 ts=6aa713e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=2oXXyLKhFp2WroVMdz4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 73iw_QtuojgAEgwiKkFRssZkWWr21h0h
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX2aCGVyZNjWXt
 OjradmO6F921ll11Az4cKp6Q4Nxw4Pw20nnO7GaD0C2CFUH0vtZopgQNO+34faWI3JMZ9GWSLaU
 TIMXRX0hO/9Vl57c4uIw3E/32jphWqGWMC9rrwLWnFYEg2VZh6la
X-Proofpoint-GUID: 73iw_QtuojgAEgwiKkFRssZkWWr21h0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfXwtMsyafHufyD
 TDbpSuGZL0JkVTfxkd2xhpmAZ1d7n3Itb7ncGhy7pMy66NZTwJmryngtEE/090cPdm6LuCRd4xV
 yFsi7mLhBF5zwQmGsEQwTfnuzD7hgXbWsCRiULX4wsiLM5zBL9QVdYnWIsFHjR/q5rctim8Cw0s
 K7Ydn3Fd/GZIS6vFagY38UMLPZNU00rRJ33sWlOz/q2C0Abk2/yVXUyPa5pJ3LllEtDqG4qKM8a
 SgdQI4a3phlK2VJSp6TOnNJOZGQmesu64j0zN33opcMWb/vwH8bevkAlsNATrdK4W3OG59iAUV1
 PgAXTVNdpi69aQvHSTvqcuhgqp5L831sRDFuV6XFU3KhPcXbVusgLcGn4uyVHVxpGxYVXj03tl1
 1V0mOUAndmG93BbjPUsQwKhE74pw+t7LPCMsjZhH2eeZBZkOovgA8ZgYH0QZrfrwfbWvD/0JDKf
 7Jgd27sCM4FNuYPxjVQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 impostorscore=10 clxscore=1015 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130304

Free space inodes are never written anymore, so drop the special cases
for them in cow_file_range(), fallback_to_cow(),
can_nocow_file_extent() and btrfs_finish_one_ordered().

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c | 58 +++++++++++++++-----------------------------------------
 1 file changed, 15 insertions(+), 43 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index dec1a848c7ca..c8292174b550 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -1366,11 +1366,6 @@ static noinline int cow_file_range(struct btrfs_inode *inode,
 		goto out_unlock;
 	}
 
-	if (btrfs_is_free_space_inode(inode)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-
 	num_bytes = ALIGN(end - start + 1, blocksize);
 	num_bytes = max(blocksize,  num_bytes);
 	ASSERT(num_bytes <= btrfs_super_total_bytes(fs_info->super_copy));
@@ -1680,7 +1675,6 @@ static int fallback_to_cow(struct btrfs_inode *inode,
 			   struct folio *locked_folio, const u64 start,
 			   const u64 end)
 {
-	const bool is_space_ino = btrfs_is_free_space_inode(inode);
 	const bool is_reloc_ino = btrfs_is_data_reloc_root(inode->root);
 	const u64 range_bytes = end + 1 - start;
 	struct extent_io_tree *io_tree = &inode->io_tree;
@@ -1713,23 +1707,22 @@ static int fallback_to_cow(struct btrfs_inode *inode,
 	 *    extent_clear_unlock_delalloc()) the bytes_may_use counter of the
 	 *    data space info, which we incremented in the step above.
 	 *
-	 * If we need to fallback to cow and the inode corresponds to a free
-	 * space cache inode or an inode of the data relocation tree, we must
-	 * also increment bytes_may_use of the data space_info for the same
-	 * reason. Space caches and relocated data extents always get a prealloc
-	 * extent for them, however scrub or balance may have set the block
-	 * group that contains that extent to RO mode and therefore force COW
-	 * when starting writeback.
+	 * If we need to fallback to cow and the inode is in the data relocation
+	 * tree, we must also increment bytes_may_use of the data space_info for
+	 * the same reason. Relocated data extents always get a prealloc extent,
+	 * however scrub or balance may have set the block group that contains
+	 * that extent to RO mode and therefore force COW when starting
+	 * writeback.
 	 */
 	btrfs_lock_extent(io_tree, start, end, &cached_state);
 	count = btrfs_count_range_bits(io_tree, &range_start, end, range_bytes,
 				       EXTENT_NORESERVE, false, NULL);
-	if (count > 0 || is_space_ino || is_reloc_ino) {
+	if (count > 0 || is_reloc_ino) {
 		u64 bytes = count;
 		struct btrfs_fs_info *fs_info = inode->root->fs_info;
 		struct btrfs_space_info *sinfo = fs_info->data_sinfo;
 
-		if (is_space_ino || is_reloc_ino)
+		if (is_reloc_ino)
 			bytes = range_bytes;
 
 		spin_lock(&sinfo->lock);
@@ -1794,7 +1787,6 @@ static int can_nocow_file_extent(struct btrfs_path *path,
 				 struct btrfs_inode *inode,
 				 struct can_nocow_file_extent_args *args)
 {
-	const bool is_freespace_inode = btrfs_is_free_space_inode(inode);
 	struct extent_buffer *leaf = path->nodes[0];
 	struct btrfs_root *root = inode->root;
 	struct btrfs_file_extent_item *fi;
@@ -1807,8 +1799,7 @@ static int can_nocow_file_extent(struct btrfs_path *path,
 	bool nowait = path->nowait;
 
 	/* If there are pending snapshots for this root, we must do COW. */
-	if (args->writeback_path && !is_freespace_inode &&
-	    atomic_read(&root->snapshot_force_cow))
+	if (args->writeback_path && atomic_read(&root->snapshot_force_cow))
 		goto out;
 
 	fi = btrfs_item_ptr(leaf, path->slots[0], struct btrfs_file_extent_item);
@@ -1857,7 +1848,6 @@ static int can_nocow_file_extent(struct btrfs_path *path,
 
 	ret = btrfs_cross_ref_exist(inode, key->offset - args->file_extent.offset,
 				    args->file_extent.disk_bytenr, path);
-	WARN_ON_ONCE(ret > 0 && is_freespace_inode);
 	if (ret != 0)
 		goto out;
 
@@ -1892,7 +1882,6 @@ static int can_nocow_file_extent(struct btrfs_path *path,
 	ret = btrfs_lookup_csums_list(csum_root, io_start,
 				      io_start + args->file_extent.num_bytes - 1,
 				      NULL, nowait);
-	WARN_ON_ONCE(ret > 0 && is_freespace_inode);
 	if (ret != 0)
 		goto out;
 
@@ -3203,6 +3192,7 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 	int compress_type = 0;
 	int ret = 0;
 	u64 logical_len = ordered_extent->num_bytes;
+	u64 unwritten_start;
 	bool truncated = false;
 	bool clear_reserved_extent = true;
 	unsigned int clear_bits = 0;
@@ -3364,29 +3354,11 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 		if (ret)
 			btrfs_mark_ordered_extent_error(ordered_extent);
 
-		/*
-		 * Drop extent maps for the part of the extent we didn't write.
-		 *
-		 * We have an exception here for the free_space_inode, this is
-		 * because when we do btrfs_get_extent() on the free space inode
-		 * we will search the commit root.  If this is a new block group
-		 * we won't find anything, and we will trip over the assert in
-		 * writepage where we do ASSERT(em->block_start !=
-		 * EXTENT_MAP_HOLE).
-		 *
-		 * Theoretically we could also skip this for any NOCOW extent as
-		 * we don't mess with the extent map tree in the NOCOW case, but
-		 * for now simply skip this if we are the free space inode.
-		 */
-		if (!btrfs_is_free_space_inode(inode)) {
-			u64 unwritten_start = start;
-
-			if (truncated)
-				unwritten_start += logical_len;
-
-			btrfs_drop_extent_map_range(inode, unwritten_start,
-						    end, false);
-		}
+		/* Drop extent maps for the part of the extent we didn't write. */
+		unwritten_start = start;
+		if (truncated)
+			unwritten_start += logical_len;
+		btrfs_drop_extent_map_range(inode, unwritten_start, end, false);
 
 		/*
 		 * If the ordered extent had an IOERR or something else went

-- 
2.39.5

