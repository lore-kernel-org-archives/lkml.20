Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A48E4BB5DE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822538; cv=none; b=aXC4r0ARbG/Sa7wbndCJvLFX5KLxEOpZCdktbiq+o+rvDeiMmekXoOyfFMI9nvwIlnDV9A6FnAe+MoBZDSpPz6GH+2/ZA5K0d7O6WTbbsA2XaW7KUtItp/rImYI848vPbg6mFt+1FKtligHzYDD2t/yWM/52PjaYsjFVgaXV1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822538; c=relaxed/simple;
	bh=ntgtmQwOR/1gGUXFgL2raQZ0p7fFOeh+HmbNiYdaCi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAdOHaQvFuGxhr1fDMC7mZWUxnddodLcnuuVUdwzgMv8cBzHZdkTk99yvX9kYmfyUDHW8rvCKmDf59pwWA1Q/Zfu2tT+UixWcQ0Wz1JXay+u/OXaf25knLuC5JhhFLHdcvChzrqDLbO7QY/y22VIfgpAHRudgqH/XJna1IQYU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nhVWus0l; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=3qI3yiBi; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nhVWus0l";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="3qI3yiBi"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CExac9915697
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=2jwb
	ccsJz6WrPoqWzLm66RWjEqeiDyrW5BNsZPM1E/4=; b=nhVWus0lxJuI5dOPZHs0
	lIvjXRjiOb0VTRNBTFACSfW8fYe8upfSVD+GPqaxfZGO3cULOQMCgAv4BzN16dST
	hUIEHS/Vdzm7/9D3gPylrov4yBAtrmonO8zPoXfHlPHQ/6qmOnh5oNMZCsJn8flh
	zqjU/UKbABW9xYVrlDBuYJ3m7ySbh37MYmhrDM86G4zkP+SowfxcF8vWkGKAU9Jf
	LhEmwwuMBj5+ZhfyJggxpg69C/6NLJ1yoqy5we4fMiqmpCP6VYmbg2DlOQ1ZEh4A
	cDVQlWQq5linVAJ7tZnpylhypxpbCcM0rBp/sIsj9dQ+00DpF++DiqMQA8tkBkQc
	Kg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91sy9113-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:54 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5345ded3f6dso58593431cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822533; x=1792427333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jwbccsJz6WrPoqWzLm66RWjEqeiDyrW5BNsZPM1E/4=;
        b=3qI3yiBi0sYeVrEVc24Dx7hLpXxQeBvyXiKsbhSs27MN9U5boHCj+ZJLKEzz4ZXTqx
         YMg8hiAFEdqDRqb7w+QVClrmbqPQInyf5qMjfUnqZ/pYYko5lrqD4bgfCEa0B0KxfriU
         wH6IfRvGqXIxsvhgM1IqMPK5rT61pEZy9YuDYAzVBT4pPbuh2nRrXXZM/9E5ios4Orcm
         13KAW/d6q7q4ejVfBV5jgr35WYU1+VxbCETNb3hdwQsUNeHrNwejFupQjgmpOSykcu4y
         rE9iuVMtRckMzIF4M6IXxQyadJo4kdAdFmzPA7+f/KodUwjJb0Dnil4lmcrtVdgKneMZ
         5xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822533; x=1792427333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jwbccsJz6WrPoqWzLm66RWjEqeiDyrW5BNsZPM1E/4=;
        b=twoMHqMebhPqmC876FNFS1gJVYyh6S0DPQx1LS/nTtJt1YW1oWvLok+cW7lH/Vo46p
         8CndP08DCJ/E3HLQtmWrrJtR7bDbLX6tqMF704Q7uvtOs27fISTQC8SCV/hrqycgPgz3
         uM5gOgXvWL46PZ/a0eYgDk0gtpRdh5iewXCMH9c5bMvCVqZDvCAGjXufbo1cOm3/y8qJ
         qx0oChJF6OyTs+vLWTi9jzFzeL1NuokR6R/7Ofwmtnp5vjnyVNzjNXIRuHnEe7BfpXDH
         WcZeGKS/PjXbG7M4F0sVGXo5MEr/cBmy5mFAcNfCS9uN6Gw1jUlRUUn3OkJ8vGV0mqmH
         9Xew==
X-Forwarded-Encrypted: i=1; AKwUvBxcErNRGD9VuCpQORiyMYc94Ug+aE7mNS5FzSffU3qMTKhJsFi94IFccWFiBQG/EWPL/8UJuJ0kMSEpFwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKmZQ5lPy/acCOwKT15vn5YGEk2vc+02d572DBZ8sQfIof8jZS
	WAoWCscSI71NGF6uxAjPXYUxzEWdx+ESa7aQWE+ByJku3rGntTIPDHOdM4qAuLvhbZQSq0rmrmd
	kHFJ9rJ8J2nf5Dh3lQpeVe7AuFU37DUkfHrkFEQeTpitTioUWi3DpMQLVbbjKJQ==
X-Gm-Gg: AYBFou3lP7aAybG9Hzs7zAjG5OqfnGnRFD1KFNCxLZIXzVztzH5oGGXInFmUAZr+SjH
	ajn/oIsU8Tl/ncPO8uwc2Sf5KBB12jLgzI+TzwxHESYSbjP0WAuEOoG3aNvkbYbdsPWQ0qSr8KC
	JZ+iCSBoHtomF1NiqklSdu199CjO+NnnOI3p+5xrecbIOjq/wdb3zxFUW6UL1udvJ/UV7pMqFLA
	Cov7UwmQsUlHHIcbUuHYxwSJf7R718gbP9z40IShkzLk+M47ne8X3qswC1gfB/ZzdkmvVwSOU0/
	7fRXlFRxJCOcWrunJ0dPqs3o/ixQAs27q8JaaoCcRRpsdPfrJ7FfTUnJet6edUt+hK0CWtiF25R
	vTZg/DXMH8EeiKHciscHVJIsptEkzAa2fH1ROI833SsymsxE=
X-Received: by 2002:a05:622a:1244:b0:535:baa:a78a with SMTP id d75a77b69052e-5359fb5eb12mr140725361cf.39.1791822533507;
        Mon, 12 Oct 2026 09:28:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1244:b0:535:baa:a78a with SMTP id d75a77b69052e-5359fb5eb12mr140725051cf.39.1791822532988;
        Mon, 12 Oct 2026 09:28:52 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:51 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:27 -0400
Subject: [PATCH v4 15/18] btrfs: remove the free space inode special cases
 from the COW paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-15-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=5975;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=ntgtmQwOR/1gGUXFgL2raQZ0p7fFOeh+HmbNiYdaCi8=;
 b=f6H+TrWKzJ96Uv7RZPOfxdnwHyTY2iksxKTwFilJc2q6vU9HoR82m/qEThwaGldAKkK4lvfb9
 c+TghikPlEVA+jxm3LS3jBt9PR/auEPGSQMhY1aZtsJOe3068q4Qlai
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX5wqmmboCmiWR
 ycfbMM/eBwzMnwca5u26UgNq3NSZofMkFz5NIs2PAOAqhdLcBByexGJYz/LybMMWnkrnPFW9rbo
 yEROyNYdg/Qv/pirIP8TTal4jE5hkEXODZoRYoB4Kc8mdkDsMAsu
X-Authority-Analysis: v=2.4 cv=JMSuIMKb c=1 sm=1 tr=0 ts=6acd0ac6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=2oXXyLKhFp2WroVMdz4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: C3f1YsZA4LB9YEeCNlUGLxz1tD96uLLt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX6lUcYvfZeEiP
 bBNKPg8rR+u4G6KF6fk5Gov0pnow0vFFsLjUhuUp7+Tlyus+NCFtA7G7e+Ij/lIYGG72sBSki+u
 EsSupIFt5BElcb2P+Y/j1lKCXh0G9K52+9vz6AwuF4UbDuCGMmhqd5dR3wmJRTDfPA8wvQkYHn3
 ro0uVdhVxtlbkajj1XEhAKESMOTx7F1gfQGt7fYTylQ3bekg7nRI9Ncf5Ikn2/qOd6MS1YBYfrs
 zEaTc6Zue7akCQ9lsYRPhR0enSatGqSwuvQMydNgLnkSsf+sNn92uRzFj6cfo7vHt2M0gsbRVOn
 udqDf0ifI7Np+zLG812PEd+RNHVUyvLvH32MkawU6VOlIMfsyWfmtnjuFpKhGMxXfls5ybsOmj5
 EMUE5fg4ffXlskZC3P0cAIp0KBT5LWutyvdWsI2xlBlZHP5UD36ZJDrKjuyIemejx6JqgUYFoHG
 iwVpp80+IxZr5bbr/BA==
X-Proofpoint-ORIG-GUID: C3f1YsZA4LB9YEeCNlUGLxz1tD96uLLt
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=10 lowpriorityscore=10 adultscore=0 bulkscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120065

Free space inodes are never written anymore, so drop the special cases
for them in cow_file_range(), fallback_to_cow(),
can_nocow_file_extent() and btrfs_finish_one_ordered().

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c | 58 +++++++++++++++-----------------------------------------
 1 file changed, 15 insertions(+), 43 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index b7e8a17d3861..5a8f028b2a7d 100644
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
@@ -3382,29 +3372,11 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
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

