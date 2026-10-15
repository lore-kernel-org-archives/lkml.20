Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8703D25D2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075435; cv=none; b=L/QEOOTUuPdp3rsJr4DwRCHS7qv4CiJOEJa6tTZBF9NqR1t7BV5FLX5ZOfPAbz58FDk3AvcPuDAhpkP+JDjkWpxa5NxPmoExnjbThStj1CyRVGCftYBcQklc9apa8xNZ/Lr2xE4BecDuqvXp1Sp179ETQuSTmBe452um/tsaCU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075435; c=relaxed/simple;
	bh=b1JLyQ8BOvVG9vOrwvJTX0JNFgK/leL8WzkauoJYhUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQtua6GUpWjuCPJcGdbA9Hq7KpDtboV3xNuGY4ysegNXPFX9VRZHQ5syqOYXk2eHPKvRk5PLf3xxiWDjuIqmwiZyE8raq9KxkMU52pVpt/561I0rfA2D9F/FrNZlGVnZ3dyfmMYYAUTnex1NS3OcJgp0mKsnpC/C+1blP89da0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DOifiygF; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=WdJzQfQR; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DOifiygF";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="WdJzQfQR"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYBdX2220713
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=4Pbk
	qIlbVWj5KeWfSo28e79+E8Lnjxmm2fHaLsON9s0=; b=DOifiygF6/YKOlOUGD6h
	XENRM3iylQLYhy/Z5CMvB6ZiO8ca36BQsCL9uahRGEf3tKMhqq8bPs/Dybz1yYPf
	jCshT7sj1PGUWpTkwnbh/1nxYemf3PPcz6qsT6AD53e9ziXmj8rGh4I08kl/QnmD
	rHaUuJGQ/UuLp72D+0OsflWtHZM6WfQKRnhay0uFg1+QHI7ET9bDQV6C/BCAMjJf
	oLbi2Gvgcz4N7M+vm0uzD/R1vDaPm2AjsLuFiI0Yz97geCCzqrudqcQBRwr4gacW
	lJ5RIser9x/m8pryL1tApIv5i6pYaS+AjOiecRO9V89zxT/ttS6x1O91IyMxKIS4
	bw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4havrsjaj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:52 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so1197084685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075431; x=1792680231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PbkqIlbVWj5KeWfSo28e79+E8Lnjxmm2fHaLsON9s0=;
        b=WdJzQfQR9lUK/WOOqoJY5+7BCK79gOXBYbcN+Tx3yl949OyP6Xcob7XcWy7ycq7YRK
         7fVJd3L2Z55gUh6Dhbysy3K4iSw3GFM1AdbXaD4ueoCgkHeXT5+QwEVhdQc/Se/zubam
         8uWy/h2WJpmrXfusND0Js0JunMLZwF929/dqYFhtXujSI1MoUtYUr64UxV2olYDyqGzA
         gQUVVvdR5n3PNq0UAAQRJ8ksFfPewmieO+fwooYKsGmijQiA0GsVc120vmGiaslbUKJ1
         0TRQvdVecKNvUEzRTci5NI+sjA0Uxdmk+IdVksrCqWJVLraXfWVIH0XMW/SMWc1ODkz9
         lc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075431; x=1792680231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PbkqIlbVWj5KeWfSo28e79+E8Lnjxmm2fHaLsON9s0=;
        b=HgCsTN55l/NPjEv/onQad1PWPEha6g1ig5wWId6yaKa27+NefcX/c76f359YIuzi2C
         k/mgh7IJGridtYfAYZET8uZkOdZne7jWtFbO0HHcR+A1Q7mlz9i0LylZnHAY8tgenGtk
         d/qXmyNDvGfReNVxr7xQPGR6l2FZ6YGBRnIxJYq4se9+2rBhom57xnJ/p9p+mDHpq3J4
         oCbVgOY0DqQbdetyT8wU0H3l/VoZqAgn0UcJBe6JW1cW58jMgLWq3XSR3nA3cvtE5C/7
         ztVYTOYWQ+9AS4lPkWA+iOkzOOYYUsJ8Hz0wnKJFkITdJ25COCy4AnFb4/bQRlBi7s98
         hl2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzq4K+YnhexYsuYJR5Ld5WHx8qvN5GeW1xhVXoSH0WsQSbsi7FOZaLW8/sSt26aXNSlk4yfo7p4rEXxkQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOVS2v4FN3Uy6aVBFh9Zh1nV3CiDTlpdU2DIqUzNu85/8EYR+v
	AanpZpn7pDECbycjMK8nOkV9pFSnMwJjn+vbjExBSl0ST4T1tI3WI4JD2O2hLgFW+R96znaVt3S
	6Q3SJM9cBkZu/u604HbI30RHrA+5VWb/EUzkqDEwl7Jfto44ECciJpWOVnbsNkg==
X-Gm-Gg: AYBFou3TdlrjdbJ+t/KdTvp+PI3IZMyD3Mec/zWnIGsi0hea7Qr2qB4vFHQDK8K4oj2
	LRVnaUBoC0PJY65T/JcGm8ACwZJfEXLwnFcEpBRaHjd/ltHkM4P4ze+S7Y/JjCEoKzkNV+JvwuK
	7NSCh3DtF3fp410lWOo2dScr38L26Dl7QuYxLfJ0SGmJ4a1FuF63ZmiCa1UgEWJUZ1t/W6vL6TQ
	J0B9Mmdlq9bebMLAoTOYtRolVY+o3wZIbsCGbrFkv7OpCyq/Q5bG/LHxaymrrFgQaEkB0xh8ZWq
	aXnnH89q9pcW+3Jp0F3tkJga5h5ZMxvCJR0NgRsZ/fIk0CBlksXvTSBkAhU7PcIXiRXeo6i5PSA
	SEA5BHRtcMAubKLQarbKhNavMP78X0x422uMH2l8TJ28C
X-Received: by 2002:a05:620a:2681:b0:93f:c7d:1340 with SMTP id af79cd13be357-93f0c7d36ddmr559523085a.79.1792075431385;
        Thu, 15 Oct 2026 07:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2681:b0:93f:c7d:1340 with SMTP id af79cd13be357-93f0c7d36ddmr559518885a.79.1792075430821;
        Thu, 15 Oct 2026 07:43:50 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:29 -0400
Subject: [PATCH v5 16/19] btrfs: remove the free space inode special cases
 from the COW paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-16-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=5927;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=b1JLyQ8BOvVG9vOrwvJTX0JNFgK/leL8WzkauoJYhUw=;
 b=tzVrbvv/x1GiqHGECcO5bRIg8HQUrVpYDaTzT6encnzIVnmP5y0cGTt0Z5Di8W/nsoDmZnPBi
 msLy3sxyZ94DcgaCB4s51sceHqggjTDoZdOs4dojnbGnt/aigbGZrdb
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: wrUn1pgUXB6yfj1AyoCctvCCjIibjojJ
X-Authority-Analysis: v=2.4 cv=L/KI0OT8 c=1 sm=1 tr=0 ts=6ad0e6a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=2oXXyLKhFp2WroVMdz4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wrUn1pgUXB6yfj1AyoCctvCCjIibjojJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXzO0xgJx0Q5gV
 Obo4rwzYqHpU2lUOnpmRNg+ZwkJo1Eux81ngSerV2OKsvWim0U9SzDTluej+kgBo+eg6c5bzT8T
 YHF4UuwvHnlIpaKT49W069BPiFdkLqUyihbYzDtLw0lHj5elkWbTNcAeTrcVPkbo3L9fhGq0zLH
 hpjkdXR9C5urAwLginHLV9PyAWkBwrmMXXM2gx5VaKr93eT9lX/WaI0DSBJmQrWl48A+wrktcp+
 wvBJxgN25DNFP54TfJ5cwXP0cCuhm0dSFkM14zG/frkB84iTHdYTk95JqgUWpd9ze24Puy7s7Wc
 3VEXej/DwRm25iPeZvmAa9jI6Ivb/xUvCDay0HcLhafw0yx8Dh/SZNENrW/7Lzok/fuIc546/uo
 ELH7y6guJtHq7IJiCYR2cCYqnblBD+2vd/Mat24y1yp4GK4g3uD7IVqbdsrq0FuoaeGumUvheXv
 gWY9YDG8TPIW5lCaVAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXwm05s51A53Rf
 hPbzkhtmANyHZfMFCP/WR5djTAn8co7/7b9qwHm9WbvgqRGW/yalGhJLsPVhggval0r6A75KkGx
 XNwfqUvWZfpLd2EPqwxr3/HVkzoS0Ojbqs6dDlWbeACYKsp1g2iN
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=10 adultscore=0
 spamscore=0 bulkscore=10 lowpriorityscore=10 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

Free space inodes are never written anymore, so drop the special cases
for them in cow_file_range(), fallback_to_cow(),
can_nocow_file_extent() and btrfs_finish_one_ordered().

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c | 54 ++++++++++++++----------------------------------------
 1 file changed, 14 insertions(+), 40 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 0ca4952600c7..3fa632a6c920 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -1369,11 +1369,6 @@ static noinline int cow_file_range(struct btrfs_inode *inode,
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
@@ -1683,7 +1678,6 @@ static int fallback_to_cow(struct btrfs_inode *inode,
 			   struct folio *locked_folio, const u64 start,
 			   const u64 end)
 {
-	const bool is_space_ino = btrfs_is_free_space_inode(inode);
 	const bool is_reloc_ino = btrfs_is_data_reloc_root(inode->root);
 	const u64 range_bytes = end + 1 - start;
 	struct extent_io_tree *io_tree = &inode->io_tree;
@@ -1716,23 +1710,22 @@ static int fallback_to_cow(struct btrfs_inode *inode,
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
@@ -1797,7 +1790,6 @@ static int can_nocow_file_extent(struct btrfs_path *path,
 				 struct btrfs_inode *inode,
 				 struct can_nocow_file_extent_args *args)
 {
-	const bool is_freespace_inode = btrfs_is_free_space_inode(inode);
 	struct extent_buffer *leaf = path->nodes[0];
 	struct btrfs_root *root = inode->root;
 	struct btrfs_file_extent_item *fi;
@@ -1810,8 +1802,7 @@ static int can_nocow_file_extent(struct btrfs_path *path,
 	bool nowait = path->nowait;
 
 	/* If there are pending snapshots for this root, we must do COW. */
-	if (args->writeback_path && !is_freespace_inode &&
-	    atomic_read(&root->snapshot_force_cow))
+	if (args->writeback_path && atomic_read(&root->snapshot_force_cow))
 		goto out;
 
 	fi = btrfs_item_ptr(leaf, path->slots[0], struct btrfs_file_extent_item);
@@ -1860,7 +1851,6 @@ static int can_nocow_file_extent(struct btrfs_path *path,
 
 	ret = btrfs_cross_ref_exist(inode, key->offset - args->file_extent.offset,
 				    args->file_extent.disk_bytenr, path);
-	WARN_ON_ONCE(ret > 0 && is_freespace_inode);
 	if (ret != 0)
 		goto out;
 
@@ -1895,7 +1885,6 @@ static int can_nocow_file_extent(struct btrfs_path *path,
 	ret = btrfs_lookup_csums_list(csum_root, io_start,
 				      io_start + args->file_extent.num_bytes - 1,
 				      NULL, nowait);
-	WARN_ON_ONCE(ret > 0 && is_freespace_inode);
 	if (ret != 0)
 		goto out;
 
@@ -3221,6 +3210,7 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 	int compress_type = 0;
 	int ret = 0;
 	u64 logical_len = ordered_extent->num_bytes;
+	u64 unwritten_start;
 	bool truncated = false;
 	bool clear_reserved_extent = true;
 	unsigned int clear_bits = 0;
@@ -3386,27 +3376,11 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 		 * Drop extent maps for the part of the extent we didn't write.
 		 * On error the written part is freed below as well, so drop
 		 * its maps too.
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
 		 */
-		if (!btrfs_is_free_space_inode(inode)) {
-			u64 unwritten_start = start;
-
-			if (truncated && !ret)
-				unwritten_start += logical_len;
-
-			btrfs_drop_extent_map_range(inode, unwritten_start,
-						    end, false);
-		}
+		unwritten_start = start;
+		if (truncated && !ret)
+			unwritten_start += logical_len;
+		btrfs_drop_extent_map_range(inode, unwritten_start, end, false);
 
 		/*
 		 * If the ordered extent had an IOERR or something else went

-- 
2.39.5

