Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18793B71DA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075423; cv=none; b=a0GKwvcZ41O+ZIJx0NABVVo3KV6qqBBjk5Ae3aXUrNn7NVcn4U6MFZ5L8oAyXRlBaLAxohEAx5SfqGeJFb8RUvuZ7rL9XLNRRHzhVNJcvQ4eVgvhGam3qpqtitcDXEZf2ME3d3RgfaxFWaqXCkykq8ejMfq0v2bvjjTGkFGIxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075423; c=relaxed/simple;
	bh=s4JXe3nfNxOs4OgMdiLvJwQwzSACsVnMkxz2zGAQrKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0pTGE5rc+CO1R8IJjiHo/+D5Ej6FRirpHZsPRespc8vv1CgqJGG/D0rDY5vDuzZBxetHm6PPxCInNbpXc1R0tpBmndCH5lYVDSC05X6CH9nU5Z4AOQnIoOvTkvjbtrtU4yhVTwp9vuGjHQ/ofKlSlVnHnQuRffAjMBEK/9mjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=WFwjQ4eF; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=AKvLD+nM; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="WFwjQ4eF";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="AKvLD+nM"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYI9K1943743
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=4SUb
	aO72cEvERWkMDnXb+4Wd91P7EdqYi3wmJ8mBsWU=; b=WFwjQ4eFZtOhEb8fLNwB
	Uo8RSw0F5y3JItbwcEHdQezqPtYiXlwHMjcVQUB61GdUnMnpFRDvaZNGVY/UBdyM
	9tpbG4zguKFdQbfxG5ojwFx2qGHqNwXB10dVJYufFC5g7AsyQDfynVjCGMRKvRel
	u5jorkfI0oXBpldWJcGS6GMYApBtCJ3FrVWjhOnhClPduzGAMDWh6EMzU+aBMQWq
	6ZvrGloDF4X+ihwM31VEBRyY86UB7FCR9u/IYLS0UT1c1MMHS9sjVi1gLz+ZK321
	BpBQjwDpMh+oci6DEbO0rLUNkFN3NDp6O612OZr17RqrmSmE2Vax+N+bJFno2IEk
	qQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hb0dug95f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:40 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535294e0f64so27316681cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075419; x=1792680219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SUbaO72cEvERWkMDnXb+4Wd91P7EdqYi3wmJ8mBsWU=;
        b=AKvLD+nMvDo9KRyJBfAdBrZfpNGwdWFn5NvArmwls2YWRIOb7Rmeg2l1+goIotNKce
         qEWL/C76OB///5RR4xCAGB1qeB24Bfl7+hTbFhDcA1DpqFM6mZj0D2MyZQsjwZe4hEcO
         LgkQLiM9RIW41lKOPWoM7VYtfVr249OAVbDSON7iWxEG2UjSfpLPS0sT6b/xDMvipbsU
         UO/H2zfKh4jHs47Q8Y+KyrRa+5Umpgdj3AXCBK4Edpk3krnFApHj4T4q8YoPxntC5JOm
         /rOUDCN1hsuoFySpUWj7mBzq0UwmgdoOSyc1qbIkbg37pAkQlQ8duBblbMyYr06K7N8k
         dVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075419; x=1792680219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SUbaO72cEvERWkMDnXb+4Wd91P7EdqYi3wmJ8mBsWU=;
        b=rBpAx4YIuQrPJTH/9gdMlGivSf2itrpR1uFcgfvZ9dcRuaRM2fA6UR2+im46df10Zm
         YCYW4R0hekbWddF5wQG7A2gkzg8Eyr6d+LrUdjA7o76G2+Tu9V2GLxST4SBN0hRsvQG+
         hxQJ/cXMZl6oQ6vnWEsJ1LJNCBa70EWO1LcIAX1PXErraYH+qMuLKueru69zbwGGVnpO
         OLhJoCbHD0rNHvAL1KUj6u2troMfZec68SUcA/gaICLTHHv4SACDyJ/QCVp8MP4CyHxm
         LPJ3X8F53HXXJFOaoLkQDsxk0V1L8X8kSgEVWhyefoqL4LwLqnLKW/x7A6T6IajEDWYq
         UBrw==
X-Forwarded-Encrypted: i=1; AKwUvBzMtG3bltlk62/GPNM88jOw8yAGH2cyuWnYQeWPOpZSYgP5yD+INkh3cAPykvTvAkOf+ks6KhDb7E8fJyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvnDuu10nJGpOk28FZo80p2ko0NdS6+o8XVMbxlHlKAEjarA0k
	x/YviiL9NrGMjggcqd7FA9ma9RcwEyGyqGTta3L1X0sSOOCgd6momqNTBROCrPGQ3tZaZunGVdr
	QHKwGSznhNfSvqkvd1SklZlfntaDKN1BrmdJZOxmsCVpRABHo0Dr/j1DK3X+XdQ==
X-Gm-Gg: AYBFou2gmoobmghlEJ2cSVkwzmyEAzZ6+CdcdkBBV8YN0GlHdcl9KPJH6iyZoQQLTBO
	XO7AJoYYFLaeOiyqImY3lp4Hmt7zKiY1YgbSwpWJBOW97bw9X2Vl5JVU28qwi68WCjq1GVK18n7
	81YdrmePsUuvXmYs49dalsjndTXlFyci/U/uiFgC9x6nglWtlxaGJhpMzTYN79oQhif2ldF0aHo
	JW4sZT6Zia9jcp1Rn4QZbP7WLePJg/btCDSBtw5/hJ2OUzkLwEu32edCrWY5dtbW8Cl1IwQCA8P
	vioyzLAlmZ7xja331y4NTpC7Q/6XA3sCu1cb/MQHh5+qMQV1gIfWMmEgkSkt31f+EZJf3hGz/SQ
	0DmGetKuONNMQQMkbkPkSerHAED7HGz3jDQLmMr5NzlI3
X-Received: by 2002:a05:622a:190a:b0:535:8483:cd9c with SMTP id d75a77b69052e-5359fb715bfmr342509431cf.38.1792075419112;
        Thu, 15 Oct 2026 07:43:39 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:535:8483:cd9c with SMTP id d75a77b69052e-5359fb715bfmr342508901cf.38.1792075418438;
        Thu, 15 Oct 2026 07:43:38 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:37 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:20 -0400
Subject: [PATCH v5 07/19] btrfs: rename cache_write_mutex to
 dirty_bgs_update_mutex
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-7-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=9136;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=s4JXe3nfNxOs4OgMdiLvJwQwzSACsVnMkxz2zGAQrKs=;
 b=8mmamoxrryNUMxpclyg7Kycyh5GUdm1kdHKcJ4SZExPNGmlW2iUZRGt3w+VnDFfpe3Tg2iWtF
 2USo9Hocba9CixgWNyzyoCvDj8bKYe8QTbUpGl7aLDQN1CEfzV0M8v1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: jOyiol6ubFzxX-efyVO9F_CbmohRq8PE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX95juiIBf1Y57
 +S7MbWOpXFHWej4nsiUB4rmyqrH5HWbGlyBGBGXTPLnLE+i9oJrBjeTxdZkGxsMoV9pQIU/8Bgq
 vJFFKy/icLW6CziKq2yBwmL/cXiDjIzLvX8gqrAxbkLaJylNgpTq8kluBGdQSwUpmh4F37rBsnX
 d4uI0t6ymQ//Q01vEyp9wrkxN5mbho5nJ/7OXKJKWeimz+zf4pYz4g0xnzdPaKP/mf3BT02gAoO
 Kc70SgtgFGQ3S+DDAF9b6kRYwulN297dJRAQgBONpnAWdFKuhaUkXyfvGTCGhQF6cbVsxMka6jx
 c/BRp5PbOzg7Tvt50MrFRofmik5jrmZhxx2/h9iCn2IKKxHqzEKON9b6RThAqYTzhKMRFaBWraH
 gYPMfRe/UH1zwn3VPgkcMHDl3HeTfhj4tnPftCDfYpyY3kztn6uqnjpFwYBYqNFWQtd/eB6Yvld
 RcSdjDgStsy5B96Bstw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX4UWjrbca0qkp
 Y8fnS44ergqgFlmkqZpvtLpT0gpObccXeWPWgKckMAyIbb+jFRcRp3oguLmsDs1YxfNd7tl5L4M
 o4xZWXt1SiiR+A5yPu4yuXw5a44Qa/VIJjIWAUHExtC2LCGhEZtj
X-Authority-Analysis: v=2.4 cv=PPOaavqC c=1 sm=1 tr=0 ts=6ad0e69c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=jjizJtb08lyoHivougYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: jOyiol6ubFzxX-efyVO9F_CbmohRq8PE
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 impostorscore=10 spamscore=0 bulkscore=10 adultscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

The v1 space cache writeout is gone, but the mutex is still needed. It
keeps btrfs_remove_block_group() from deleting a block group item while
btrfs_start_dirty_block_groups() is updating it outside the commit
critical section.

Rename it to reflect what it protects, and update the comments around
the dirty block group writeout that still refer to the space cache.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/block-group.c | 46 +++++++++++++++++++++++++---------------------
 fs/btrfs/transaction.c | 25 ++++++++++---------------
 fs/btrfs/transaction.h |  8 ++++----
 3 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index 896b003e84ce..d812fda5eee8 100644
--- a/fs/btrfs/block-group.c
+++ b/fs/btrfs/block-group.c
@@ -1196,7 +1196,11 @@ int btrfs_remove_block_group(struct btrfs_trans_handle *trans,
 
 	inode = lookup_free_space_inode(block_group, path);
 
-	mutex_lock(&trans->transaction->cache_write_mutex);
+	/*
+	 * Do not delete the block group item while
+	 * btrfs_start_dirty_block_groups() is updating it.
+	 */
+	mutex_lock(&trans->transaction->dirty_bgs_update_mutex);
 	spin_lock(&trans->transaction->dirty_bgs_lock);
 	if (!list_empty(&block_group->dirty_list)) {
 		list_del_init(&block_group->dirty_list);
@@ -1204,7 +1208,7 @@ int btrfs_remove_block_group(struct btrfs_trans_handle *trans,
 		btrfs_put_block_group(block_group);
 	}
 	spin_unlock(&trans->transaction->dirty_bgs_lock);
-	mutex_unlock(&trans->transaction->cache_write_mutex);
+	mutex_unlock(&trans->transaction->dirty_bgs_update_mutex);
 
 	ret = btrfs_remove_free_space_inode(trans, inode, block_group);
 	if (unlikely(ret)) {
@@ -3395,15 +3399,15 @@ static int update_block_group_item(struct btrfs_trans_handle *trans,
 }
 
 /*
- * Transaction commit does final block group cache writeback during a critical
+ * Transaction commit does the final block group item updates during a critical
  * section where nothing is allowed to change the FS.  This is required in
- * order for the cache to actually match the block group, but can introduce a
+ * order for the items to actually match the block groups, but can introduce a
  * lot of latency into the commit.
  *
- * So, btrfs_start_dirty_block_groups is here to kick off block group cache IO.
- * There's a chance we'll have to redo some of it if the block group changes
- * again during the commit, but it greatly reduces the commit latency by
- * getting rid of the easy block groups while we're still allowing others to
+ * So, btrfs_start_dirty_block_groups is here to update the block group items
+ * early.  There's a chance we'll have to redo some of it if the block group
+ * changes again during the commit, but it greatly reduces the commit latency
+ * by getting rid of the easy block groups while we're still allowing others to
  * join the commit.
  */
 int btrfs_start_dirty_block_groups(struct btrfs_trans_handle *trans)
@@ -3437,11 +3441,11 @@ int btrfs_start_dirty_block_groups(struct btrfs_trans_handle *trans)
 	}
 
 	/*
-	 * cache_write_mutex is here only to save us from balance or automatic
-	 * removal of empty block groups deleting this block group while we are
-	 * updating its item
+	 * dirty_bgs_update_mutex is here only to save us from balance or
+	 * automatic removal of empty block groups deleting this block group
+	 * while we are updating its item
 	 */
-	mutex_lock(&trans->transaction->cache_write_mutex);
+	mutex_lock(&trans->transaction->dirty_bgs_update_mutex);
 	while (!list_empty(&dirty)) {
 		bool drop_reserve = true;
 
@@ -3483,12 +3487,12 @@ int btrfs_start_dirty_block_groups(struct btrfs_trans_handle *trans)
 		if (drop_reserve)
 			btrfs_dec_delayed_refs_rsv_bg_updates(fs_info);
 		/* Avoid blocking other tasks for too long. */
-		mutex_unlock(&trans->transaction->cache_write_mutex);
+		mutex_unlock(&trans->transaction->dirty_bgs_update_mutex);
 		if (ret)
 			goto out;
-		mutex_lock(&trans->transaction->cache_write_mutex);
+		mutex_lock(&trans->transaction->dirty_bgs_update_mutex);
 	}
-	mutex_unlock(&trans->transaction->cache_write_mutex);
+	mutex_unlock(&trans->transaction->dirty_bgs_update_mutex);
 
 	/*
 	 * Go through delayed refs for all the stuff we've just kicked off
@@ -3502,7 +3506,7 @@ int btrfs_start_dirty_block_groups(struct btrfs_trans_handle *trans)
 		list_splice_init(&cur_trans->dirty_bgs, &dirty);
 		/*
 		 * dirty_bgs_lock protects us from concurrent block group
-		 * deletes too (not just cache_write_mutex).
+		 * deletes too (not just dirty_bgs_update_mutex).
 		 */
 		if (!list_empty(&dirty)) {
 			spin_unlock(&cur_trans->dirty_bgs_lock);
@@ -3598,10 +3602,10 @@ int btrfs_update_block_group(struct btrfs_trans_handle *trans,
 	factor = btrfs_bg_type_to_factor(cache->flags);
 
 	/*
-	 * If this block group has free space cache written out, we need to make
-	 * sure to load it if we are removing space.  This is because we need
-	 * the unpinning stage to actually add the space back to the block group,
-	 * otherwise we will leak space.
+	 * Make sure the free space of this block group is loaded if we are
+	 * removing space.  This is because we need the unpinning stage to
+	 * actually add the space back to the block group, otherwise we will
+	 * leak space.
 	 */
 	if (!alloc && !btrfs_block_group_done(cache))
 		btrfs_cache_block_group(cache, true);
@@ -3657,7 +3661,7 @@ int btrfs_update_block_group(struct btrfs_trans_handle *trans,
 	/*
 	 * No longer have used bytes in this block group, queue it for deletion.
 	 * We do this after adding the block group to the dirty list to avoid
-	 * races between cleaner kthread and space cache writeout.
+	 * races between the cleaner kthread and the dirty block group writeout.
 	 */
 	if (!alloc && old_val == 0) {
 		if (!btrfs_test_opt(info, DISCARD_ASYNC))
diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index 3d3639e4d352..3d7bc667eb03 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -412,7 +412,7 @@ static noinline int join_transaction(struct btrfs_fs_info *fs_info,
 	INIT_LIST_HEAD(&cur_trans->switch_commits);
 	INIT_LIST_HEAD(&cur_trans->dirty_bgs);
 	INIT_LIST_HEAD(&cur_trans->dropped_roots);
-	mutex_init(&cur_trans->cache_write_mutex);
+	mutex_init(&cur_trans->dirty_bgs_update_mutex);
 	spin_lock_init(&cur_trans->dirty_bgs_lock);
 	INIT_LIST_HEAD(&cur_trans->deleted_bgs);
 	spin_lock_init(&cur_trans->dropped_roots_lock);
@@ -2314,18 +2314,16 @@ int btrfs_commit_transaction(struct btrfs_trans_handle *trans)
 	if (!test_bit(BTRFS_TRANS_DIRTY_BG_RUN, &cur_trans->flags)) {
 		bool run_it = false;
 
-		/* this mutex is also taken before trying to set
-		 * block groups readonly.  We need to make sure
-		 * that nobody has set a block group readonly
-		 * after a extents from that block group have been
-		 * allocated for cache files.  btrfs_set_block_group_ro
-		 * will wait for the transaction to commit if it
-		 * finds BTRFS_TRANS_DIRTY_BG_RUN set.
+		/*
+		 * This mutex is also taken before trying to set block groups
+		 * readonly.  btrfs_inc_block_group_ro() will wait for the
+		 * transaction to commit if it finds BTRFS_TRANS_DIRTY_BG_RUN
+		 * set.
 		 *
 		 * The BTRFS_TRANS_DIRTY_BG_RUN flag is also used to make sure
-		 * only one process starts all the block group IO.  It wouldn't
-		 * hurt to have more than one go through, but there's no
-		 * real advantage to it either.
+		 * only one process starts all the block group item updates.  It
+		 * wouldn't hurt to have more than one go through, but there's
+		 * no real advantage to it either.
 		 */
 		mutex_lock(&fs_info->ro_block_group_mutex);
 		if (!test_and_set_bit(BTRFS_TRANS_DIRTY_BG_RUN,
@@ -2559,10 +2557,7 @@ int btrfs_commit_transaction(struct btrfs_trans_handle *trans)
 	if (unlikely(ret))
 		goto unlock_reloc;
 
-	/*
-	 * The tasks which save the space cache and inode cache may also
-	 * update ->aborted, check it.
-	 */
+	/* Other tasks may also have updated ->aborted, check it. */
 	if (TRANS_ABORTED(cur_trans)) {
 		ret = cur_trans->aborted;
 		goto unlock_reloc;
diff --git a/fs/btrfs/transaction.h b/fs/btrfs/transaction.h
index d4bbe44f9556..aa57c64a955d 100644
--- a/fs/btrfs/transaction.h
+++ b/fs/btrfs/transaction.h
@@ -81,11 +81,11 @@ struct btrfs_transaction {
 	struct extent_io_tree pinned_extents;
 
 	/*
-	 * we need to make sure block group deletion doesn't race with
-	 * free space cache writeout.  This mutex keeps them from stomping
-	 * on each other
+	 * We need to make sure block group deletion doesn't race with the
+	 * dirty block group item updates done outside the commit critical
+	 * section. This mutex keeps them from stomping on each other.
 	 */
-	struct mutex cache_write_mutex;
+	struct mutex dirty_bgs_update_mutex;
 	spinlock_t dirty_bgs_lock;
 	/* Protected by spin lock fs_info->unused_bgs_lock. */
 	struct list_head deleted_bgs;

-- 
2.39.5

