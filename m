Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D21448E0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617635; cv=none; b=PgyXfaPufQTcXu4Py6ksgrx2BfkJcHSp3J3sIgztC5YGZP8I7QLFEH3/nIShk0pyzc7nyHdY/wLPSn9W6kPjtjODpDrGCJhYPR9OgNWhgTdbdV5HWH80yi86ZRXBvcxu+S9XWNVoQxN/npeG/kstOp9lHalURskm2WntpBJT1eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617635; c=relaxed/simple;
	bh=iGFJQPlF6CMeAfd/wkpIJMW7sIb30bKSxGxikRSgXV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8DyTluD1z1+JsGrHVUC2X3cm7p+SzyfdVuMuV0uY6LFmbNMkHtL0rmCr8OQxOxryZVyVCiTqNVBYjSnyWnx39tE5vJb9QWlDYo1O/RRxBPYX6JQJgjSMS9x6++b8gaUS/lV8o9+L98FxAtaUMF99TS5vUXAdWiOAii3o+UBzFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=HwK6lZKx; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NzGBDZ+S; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="HwK6lZKx";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NzGBDZ+S"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2YdPC3509267
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=2RAp
	SXs28qzhddSlvTelDQPBL0qNNmBMwObh+aSPR74=; b=HwK6lZKx7xzG7ipyNKEx
	8sD0dojwkFUUco3h7XHl8vyFtEPWRoYlphXds40Qj8Av22uSm/jRn4B9MP5/RdUs
	M9c/3BdAfG7bD302HRr5QyYnl/gj1aS6WBzeYz1tuuugEUKKs0PlSR1pkhr3EMhU
	3dK5eesgU8iZjbtsyt3zywxPMJHXPUkPoQsuJ2PZ4qaOSIRzT0/D3FxYunFwM40E
	048nii5mCPB8e6CmEhiNIukmJXfQAWiEKT3B+GzGrdHfD+KPtZ4zhJZZqmltpyJI
	CCIFx2Dw8WDuT3mnqdzokHp7mkN55fhW9Y7SII8r5D37eESGr7Jp+CGa3WsB5509
	5g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr3swhcyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:32 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9124b265371so3378726d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789617632; x=1790222432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RApSXs28qzhddSlvTelDQPBL0qNNmBMwObh+aSPR74=;
        b=NzGBDZ+SzEKoOd9gh6fhZRlrR+0QiUm65UxViD9/2+jeh1j0yJAPK3X6rgLpDTzCp/
         xeIR8drZzuKYTaNVm7+bfgWAgAraywkNP3u3TpO8sDZ43jxHZkMwU/a61tFDshFUPQAa
         qx4kOnVqaf/ZIxAl8uVdr8BXsnf2MpjvzeJynDrjyBV8A3tZh2YFBIb048Sf4jUijhXx
         5cL8aDpTBt3Vh5nYHrESzJiB3y1+dYxdlYij11itGGeirA/LDIEe7BAaAHfLZF2JbH2h
         SvRl8BuJIC20daNl0gQlSHdp5jeMVVoU4YeMPpNjQ76CMCTAKcfHB4cMjnvnSGWpzfxv
         zSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617632; x=1790222432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RApSXs28qzhddSlvTelDQPBL0qNNmBMwObh+aSPR74=;
        b=UBpm/TFJq7xzeBfU5FqlXuxm6Xeenbj0BcrD2lNKpJj+y+i/fA8dkA2SnOa3bVCgNJ
         NUOV4E262O7BRVXzOsA+gHuS+Lk9G/sw7FeNPicFYRpTpqll2zh43vxT+924icec6j2u
         3YqUtyuvccAMPrxLd0rRPwnv+u6YCB0V58Xy1umokFhDDWp7iBDpRgBXvzzk5qlkic4h
         0M1lp4khrYIECHuEnj5RoxySEl8j68td+ji5BXxOlQ+I7xW3t7b0TW66Q5j+8rLBx8kh
         t74tDZKZNFFcZ3xhiPAYb/7n5TyT+nQd/+1Wy4igt6jCoAdyCQxuDhIa/Z1ImLd85p14
         UxKw==
X-Forwarded-Encrypted: i=1; AKwUvBxGAXSspovl4BlaDvAX96Yd9yjqp4T6SjRhd5rmqpTCI67RpqQysFLUIahOAsz50WexzwWfEApRyJuT/FY=@vger.kernel.org
X-Gm-Message-State: AFuF++lgglMqWD9m5As3Mlxp3YA1Rc99kF3fErJLKNTp8SuaFME+Yv4R
	UrRgAQb53JG7wAkkR9qk6F5x9mNIyIjuYXymZTLSAgD1HfjNiZchxzYXSCCnuu50dKtNJQ97N6X
	BfEH1dss8bRajwut2GYdwU18f38FVe+NbY9zOVh0tbsscDvEOOPte1pS1E5UCwqf5JPcA/Q==
X-Gm-Gg: AYBFou201wAhyw4GRyKp6qhP3yINhbmBTtIBm+++t+TSjCMIwWCImOaI00GnmBONK+K
	Mf1fMG5uSNskTwB18zC/EGJ9md1s3+3bwyTgIVDmFLJ8VjaDk8pnWFoMWx6oEdrGyYCBJs0O7cu
	uQ4+5Po21f8Pykal2q5lkXsga2pnEuy0IuPGwHI/+9V88GnHWEqHjKN78F8gk8Nl2aNoYDbL78B
	OjWy/7MH7vq8Ku8pmsZr1PMzcofaMzLhArzA+3OyolsbgmBJE5ixUM0DJ3rHXVR9K60fHbf+0Iq
	WU+/CiVQN36tPzCHBpN3rV3YVNJEkHhcApoq0u6haveRVhsdsvsFCIIstd27MFTI+y3L1I+BjX5
	UfIldDuoc30yLm31I8Tcq8xIebUUN0ihJqjne/aJvXhphkQ==
X-Received: by 2002:a05:6214:21ac:b0:8db:5f:c588 with SMTP id 6a1803df08f44-9123d708e65mr90275986d6.3.1789617631420;
        Wed, 16 Sep 2026 21:00:31 -0700 (PDT)
X-Received: by 2002:a05:6214:21ac:b0:8db:5f:c588 with SMTP id 6a1803df08f44-9123d708e65mr90275496d6.3.1789617630916;
        Wed, 16 Sep 2026 21:00:30 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm41748766d6.35.2026.09.16.21.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:00:29 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 17 Sep 2026 00:00:01 -0400
Subject: [PATCH v3 05/17] btrfs: rename cache_write_mutex to
 dirty_bgs_update_mutex
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-btrfs-remove-v1-space-cache-v3-5-10ebde03b96f@columbia.edu>
References: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
In-Reply-To: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789617622; l=9156;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=iGFJQPlF6CMeAfd/wkpIJMW7sIb30bKSxGxikRSgXV4=;
 b=Q3KS2QTzeic7HyvS3DPTTwTBluuIwlOmA8TYn1Qf+/Cjr6U1djgA14acC8F8YtkR0F6b/lx0r
 3rAtZVpTxq1DvHH+L5ciWhFYyd8q3TQFdCEovCrPpMUvxgSKhn6FVjw
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: kucAid2ySmmX77FWRAgVxwZ_Rk_rRunT
X-Proofpoint-ORIG-GUID: kucAid2ySmmX77FWRAgVxwZ_Rk_rRunT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfX6o04VUFhFX9G
 oWensPuOsSGa9py6CYgKFW+FMQvmbKO7Bacx4UilfMllgwzEfpMEW0+qXRGDiEYQlB1bdvWoudc
 3ExUgJm4nrbMO0mtr+islfTeVfqueh7q8mFAmZvvMPJksVE1i0et
X-Authority-Analysis: v=2.4 cv=ac30Dhot c=1 sm=1 tr=0 ts=6aab65e0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=jjizJtb08lyoHivougYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfXzo2zekoJPfsP
 oojpwE/lBedF18PRFSX9rFtqz0ifkTiJ+sDMAqHeaTu8H8WQByr25k9qZytxMfeSsoqc2cJjHta
 mlGZ4ooblNZOheLgxg8XfSB7Wc1DhbPJov/hQXnCKrGbIxmQHefGyJ9WVeZ6xKdQXaA5qSN/3xj
 AlV8BHAbTRWA5JAU/1LwDW/Tj7XgRxsVBq3wmogRIXEjqSFgJyQlWDnG23lHZ+VMTZd5lB7DkuS
 Gj20EcYewyzEZEbfGoUinIIMFsg4URwpY+lRG2wJ3Jlj/EFxdHfXsO6OTayMPuKrWrbnIX3uA9M
 D3uLT036I3Ng4V8MEm1GlRVcxw/O/kHHyAA9zQYkOssyfzvJbrg4ZV8mEOPI7IpMI4G/vvda5an
 KIp3oUTzi8EMPZuu7yCaxkdC/jUTDTPrSvKtE6CPM4QtcPE3BBQOlaToFSDzZoYFu5YtMXCjRFw
 e5WW8dFxY+K+pBTCkLw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=10 clxscore=1015 adultscore=0
 lowpriorityscore=10 phishscore=0 impostorscore=10 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170047

The v1 space cache writeout is gone, but the mutex is still needed. It
keeps btrfs_remove_block_group() from deleting a block group item while
btrfs_start_dirty_block_groups() is updating it outside the commit
critical section.

Rename it to reflect what it protects, and update the comments around
the dirty block group writeout that still refer to the space cache.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/block-group.c | 46 +++++++++++++++++++++++++---------------------
 fs/btrfs/transaction.c | 25 ++++++++++---------------
 fs/btrfs/transaction.h |  8 ++++----
 3 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index 5c2a57243de5..34f2cc0ef33b 100644
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
@@ -3353,15 +3357,15 @@ static int update_block_group_item(struct btrfs_trans_handle *trans,
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
@@ -3395,11 +3399,11 @@ int btrfs_start_dirty_block_groups(struct btrfs_trans_handle *trans)
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
 
@@ -3441,12 +3445,12 @@ int btrfs_start_dirty_block_groups(struct btrfs_trans_handle *trans)
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
@@ -3460,7 +3464,7 @@ int btrfs_start_dirty_block_groups(struct btrfs_trans_handle *trans)
 		list_splice_init(&cur_trans->dirty_bgs, &dirty);
 		/*
 		 * dirty_bgs_lock protects us from concurrent block group
-		 * deletes too (not just cache_write_mutex).
+		 * deletes too (not just dirty_bgs_update_mutex).
 		 */
 		if (!list_empty(&dirty)) {
 			spin_unlock(&cur_trans->dirty_bgs_lock);
@@ -3556,10 +3560,10 @@ int btrfs_update_block_group(struct btrfs_trans_handle *trans,
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
@@ -3615,7 +3619,7 @@ int btrfs_update_block_group(struct btrfs_trans_handle *trans,
 	/*
 	 * No longer have used bytes in this block group, queue it for deletion.
 	 * We do this after adding the block group to the dirty list to avoid
-	 * races between cleaner kthread and space cache writeout.
+	 * races between the cleaner kthread and the dirty block group writeout.
 	 */
 	if (!alloc && old_val == 0) {
 		if (!btrfs_test_opt(info, DISCARD_ASYNC))
diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index 6a36d29406c3..6a7f33ac87f2 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -380,7 +380,7 @@ static noinline int join_transaction(struct btrfs_fs_info *fs_info,
 	INIT_LIST_HEAD(&cur_trans->switch_commits);
 	INIT_LIST_HEAD(&cur_trans->dirty_bgs);
 	INIT_LIST_HEAD(&cur_trans->dropped_roots);
-	mutex_init(&cur_trans->cache_write_mutex);
+	mutex_init(&cur_trans->dirty_bgs_update_mutex);
 	spin_lock_init(&cur_trans->dirty_bgs_lock);
 	INIT_LIST_HEAD(&cur_trans->deleted_bgs);
 	spin_lock_init(&cur_trans->dropped_roots_lock);
@@ -2268,18 +2268,16 @@ int btrfs_commit_transaction(struct btrfs_trans_handle *trans)
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
@@ -2513,10 +2511,7 @@ int btrfs_commit_transaction(struct btrfs_trans_handle *trans)
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
index 8245a58587c0..33a1884c5765 100644
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

