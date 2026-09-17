Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915B3C5DBA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617654; cv=none; b=CMLOzM1AQaJLnydVUit6MpwE4hz74qtR9A2WAWp/aURlC1u+abIyDMG9DXhUWq2gQWbOxoeiwBAgEdnFJqvV6cFwgbFlhyRE1cBNsZWrGNLUM5HegpzLmv5bj9b7LbTiDdY7X/1A0lhB16XBs5aqa6nfaw9npbxfbb6f7cPszLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617654; c=relaxed/simple;
	bh=vKb/gGmZfXP29NVMCIBexCHeMi4FmxmfEWzn7IiL0cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Or8V5gSxXrzsl8kxw6voHuubtFH5JbIeAfdv1bPps19hDvP37+lfugREL917lywBbTK8udi7Wr+wEA4d4SzpJrLZX8S/FGULaNnR7nvmpnDd6BP+YWGhJk2tshHiT/uEGiyLxeiWdS1eoiGwemaa4/lIuL5QYu1UdIrerGlhCSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=IPs6Hh9o; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=3ZRVdTVA; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="IPs6Hh9o";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="3ZRVdTVA"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2YIVi2149668
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=FGtc
	1NLeQBu+kS94gpur8nkzS5KJcdAIY3+s7g2GWMM=; b=IPs6Hh9oUk1kjhoFvM+s
	OoXXRezjo1j+KH3GPGYh/VL+t7jNjA6d4cUUaLvswdK2L8aXwboqSmgkTzIYm/3l
	Hxv2PYzNw/7WsoGKOvYUnkgEyy9CdrY82ddWnta1jlWrJ89xEdiZjpmo24APF4Uf
	CartuFNapCu2dGzgGuRpbP05QgkYjcqbqOA1Xxd06VwUsH46pHYCAtg+D/5dL8oG
	/zslXMgO+0VGCrdvJh4aD++Eq1uHeln3Pr0WkjrVYdp37TGdsJNHvO85GH+rTmRf
	7C/VotIgGzYlN1MfXZIr6G2dMGnVgfQ9jVRJfqI350KYnrgzX9VAMLuKaeK+yTCm
	kw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr0kqb9n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:43 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-912348a0ffbso4183376d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789617642; x=1790222442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGtc1NLeQBu+kS94gpur8nkzS5KJcdAIY3+s7g2GWMM=;
        b=3ZRVdTVAOofZXO0vQ8iNNbK1kMb46/fWNSYunYJV7IvOMAAPprTtkLVeSfcmfXK0DD
         jmgE/93v94u83AJdmG0ji7dwd3P4IsBXeTUhwF/zyIS3D3zRoRxlVo2ROL0TM4bwaq6y
         UyiptV3M28/fxPGSiSmKX8HeHOasuANxeN/bQfZeRQSZXONX5cpiiXZQ60pd/LVmtc9G
         L0dgANB/ZuMYulN+JK7KhUY/QBf9kKU54QouWqnUaO0VvAl+DDjaMBQinGcUL9VHpg3o
         VkIL+YVRGz+385jydLF3MawNZ/YBeZj3paAw5tedRpXUyZ9+5zSCd7tmeNTZ1ahK0PuD
         7VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617642; x=1790222442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGtc1NLeQBu+kS94gpur8nkzS5KJcdAIY3+s7g2GWMM=;
        b=Un1x2kFxa/v3DC3z+RLE9XAhABLnULedexCscgWOrjE1kEmb1TMJyodCuqoPSDfSoh
         EuVuw38S5+W++X28Ztb2wR7GVTNgzsTXDxTa74i5NdT4wrcIVF+7N0eGzYeFx9FX1mrg
         lqycXYi1hfJ8+47bkfm1CS9nM1XIQHB9MSj1z4hAYVVBucAQTNL28OxQrYL2w9WLY8sM
         Y+4TErw8wOISCA9yk6hp23LjORE+mufEFCT09FhHh3pHW1L5IRzD52OvBbK4O+KCPvoT
         G5uyMeUbWYxnRek9LyOeWazyF9PXd+6JhqJEdkmktvVlmanrEB3zOZAuJsBfosdfe+UG
         2EiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMvlHp4rHrcMVvVfwljx28y8l6ToHfF5qdnwe84pU59x48tuM10rgLYEY86129claSV/OLjrFZC39MyuM=@vger.kernel.org
X-Gm-Message-State: AFuF++llShlEGZHJk5wyWVx+9GXzUdXplviS+LtiwJub3Ix1o1bvlj6/
	h0lN+mjI2dNSUjMOraaRg4X4keCXEz+umMonK91wEX2Xaurw3tYFREkxcRWCiiR43o384AgGGuA
	xt/VqC7MrwecW8oc2lp0brTE6f9AMh+gDUQIeunubtwdpkoM3OApirrkoj0AdxZWP6v6lzA==
X-Gm-Gg: AYBFou1cGk4sZDsqd9dtdAq7oz+va2Uqdy3akQpU3uA8CDzghKLMsHFGZ/jjCwOwH6o
	xQHo1I7wsxKcYP0fMLWfJYczpfwQDgBi9iQCHznsLCG6tflnClMZvWzrwFUTo4x/DgUU3YRAaCt
	zcXp6o63VJLSXXdGQHIn5mak2zU3aQj/nb1WM1Ftyo1iJlJeOVPy1m5him6hhCeFPt6LOpV7gMG
	vJszN+5zgKrrpOVWfWt3lwmIi54bJ0C7RcaEJ1Pihnh5guF7FX+YMhEpkztWKPmo7z109yvD7BJ
	J6fMO2B9xf+vXrMvceTeOsJkryeiPFPk6K1GlsxPAmVrKlwb/RZ9daOx1I7N88WdxEJ7bGrVgWB
	GJfasT2beo2mevOAVFbwNOsZxeDh7coos576tRfcSNZPEjQ==
X-Received: by 2002:a05:6214:5d82:b0:910:4954:7992 with SMTP id 6a1803df08f44-9123d62eb5bmr100997886d6.0.1789617641820;
        Wed, 16 Sep 2026 21:00:41 -0700 (PDT)
X-Received: by 2002:a05:6214:5d82:b0:910:4954:7992 with SMTP id 6a1803df08f44-9123d62eb5bmr100997186d6.0.1789617641282;
        Wed, 16 Sep 2026 21:00:41 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm41748766d6.35.2026.09.16.21.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:00:40 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 17 Sep 2026 00:00:10 -0400
Subject: [PATCH v3 14/17] btrfs: remove the free space inode special cases
 from the COW paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-btrfs-remove-v1-space-cache-v3-14-10ebde03b96f@columbia.edu>
References: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
In-Reply-To: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789617622; l=5995;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=vKb/gGmZfXP29NVMCIBexCHeMi4FmxmfEWzn7IiL0cs=;
 b=vfPdwZEzVjmRUbyCBqWNioCxb5vsagNpbfCKMM+j/XKWvAaEJjeaSwMXR4d38wIucdwb4OVBt
 XjkqCyz+wRyAb78zq68DRWevjofRkmBwH0lpE7rbtJYkCdHToKdNFOr
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfX/V9PjrcsJOum
 IwAleG6tcFFBclJGRj7iTch0Wback2h/kdtnTu3XhQ6ZHji7Z1N34vvmeyj4i2QsxuiB5Cx04LD
 5iewXIhqPzYkzoyas4uUnhTKk79an8cSHIl2WEnt5mWD2TenTZB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfXxq4sD4lAkGw/
 6CL//sDcnVw3lmsl7JRtLDE48x9CaS4NoijaomfE7/ZAmVocDUl+YFSo26yiQX7BZmPL4nDTRb4
 MoQl2psWDzBZJ8B2DlWxS2kzrg/luQPJyblR7g9wA9p2doY9qvqlJicmDCn4+FVnWFJeQaVuNBn
 cb5C1bW5emK9gMlISFfiziCind7rYSfWNh6HqBp6hJvSZqVE0TcqmMl2yVLaEsRUBu6RR6TM069
 c/G/1Lcg13Db4hH7ZYtWqWMyWKwhBZzQuo+lFXgQGsvREnClw2oCw0EDceSzzN3xTzPJL2a3Fbh
 KcU19p0CuW+jYZS2/sBBMtUCdif+s86yQRIG5M9CMN6m57pBbPzXiF5rg9UAG7F7OrHAjcPRCRw
 ewi0EK/dnMr5iG0fO8/7G2VzlqhbGg576S2xYp0zVeIU4007LNucKO7Chqy1/PAvjRUqtr0Zjk+
 QibY0GYPOF9WWUtAtyA==
X-Proofpoint-GUID: jnzDvpe0O4PG5rKb67pUfN8pb8cVOWRj
X-Authority-Analysis: v=2.4 cv=ZbqIpcVA c=1 sm=1 tr=0 ts=6aab65eb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=2oXXyLKhFp2WroVMdz4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: jnzDvpe0O4PG5rKb67pUfN8pb8cVOWRj
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=10 malwarescore=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170047

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

