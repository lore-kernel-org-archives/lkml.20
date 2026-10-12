Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FF64B1D0E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822527; cv=none; b=SbRCsXnIRkrU5KuCECOZWsogwsSuTHW2wDLAQKWPrff1MgRRWS80zshSg2QJwsdz/oq9PfzbqUcMTtGNmQlIzHwpkIYUSaG0Z1VDI4IMMWhPpWW+h1c5vyVb9ZoCT77S2jivz1lGFsKxafxg7y24WHKvL5UJkqnHUwo+zYYmf50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822527; c=relaxed/simple;
	bh=s4JXe3nfNxOs4OgMdiLvJwQwzSACsVnMkxz2zGAQrKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jIJse5UmjdRiBHKtzoTyha/HhNO8ygij884atQ0r+nApUIuo7mhFBdWmcHZviCdAAkomUHFkME8Q3Oh2sgtq8qsVulCuGxUfiUqNJ9SSE6zE0I/iBDl0fNptDG6qmXI9htCiYP96gtd+E0D3sXxlAEXJJ9XMzO4g+rop0ZL9/Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZcIccKoM; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=e+zahicQ; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZcIccKoM";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="e+zahicQ"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CEgXE8684629
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=4SUb
	aO72cEvERWkMDnXb+4Wd91P7EdqYi3wmJ8mBsWU=; b=ZcIccKoM1ut2KayUzlce
	IQHCiOGEIY/Qo7ozx+B4FOOETBsJapoVBUsrfw7f0E9vDNBTd639b6wxv5vGlJNi
	tEQfBPXkr6Ltw1k7uvUmeE8o4RFDFoqtEwY09+l4KkVP08fDhiLS5bssQ+MvxZmq
	aVRN/lIUx3SIG43Q4I8/kW1GXlKld2Jm3oCPWMxdQx7olmUFVRtgKl1c4Bc93J/l
	Q3XoacGDv5mN04GRcA8svPhC4EaFjVAhTiduvSOQO+XHM7kBlFkttNiUMCTklzSh
	W+uABYDVD5f3LN0wWfPI0PGI+e4y2MjJ8F7aS1ycdkI90lYh+pGyILZI5Nk0SX8x
	mQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h8w933dby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:44 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a7c17166so41863406d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822523; x=1792427323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SUbaO72cEvERWkMDnXb+4Wd91P7EdqYi3wmJ8mBsWU=;
        b=e+zahicQ02plTxBGhuu5pFAZC7t9924W41VP8USbHH7bnmd6WmI+nhFYprmO8TlYvH
         XXskh/h3rw6RTZK2pXbxm3tAtPWig+q6woJI+nGU+uEEmNap6oyS5ojXpePl/KwUeBYS
         20DJFb8q2iBPPU47azUoM/xPypQyu1xQtbVyZZd5RqxmBY0vfW9vKNOsM1bLto1xz5Hs
         Rwqi4uQ6X/sGCh+mwO5emZQM6Wp3199+PJq7A78bHjZK6gdHKif8+qTpFLTPqn+to+BV
         mx8U+kv8fPifmz+b5z8tth9beRJ9lvfPFITQICqmw0Ou6QH9NB/867DVlNauSEBPe8Jl
         WVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822523; x=1792427323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SUbaO72cEvERWkMDnXb+4Wd91P7EdqYi3wmJ8mBsWU=;
        b=Pf4v+AXgwxXsW2RhTgDV3TNAHoX+NcL/HhrmIwnTrrl+ngBW6Wd2doAbc2iAojs+8k
         iyMZpXy+FwjU65T0/F9rSAm5gl1n96L0inRynwALIcFilZmvd1iwUsqTSiA6BSBd4FoA
         ivr+C8Wlqr5efY5sWfXUenY5Z2P2PeGSr9TvXriv4XaMz+XXEs5c2UaQ72g9vASaBV/6
         ZnL+g8lUwlNIqKoeMERpwhq9/DFKN7ZbYFa7eXpf+igiBk8+QEY+3J0aA9z0xNPdkeAD
         vTBYF8B7+GTGFvcWr8339QQbgi+5A27qwApxuyHR+Yt54RVI/Z6UQn/fEvz4KJlU3MH0
         1wcw==
X-Forwarded-Encrypted: i=1; AKwUvBxpI52kUAF2VVyM5iauPHsjEv0CyOJcXAVOo3QtgZ66P/dA0drKk4xgAhcFSxXNi6rrUUuNpgf0gU0nwyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH2htgaXNGo8fHyLXluvFxuQ9CBUIEr6eDRXOvPnEFzNh/Uk0J
	Vihl/MYsdSgOZPjilrX37hmYJ0vvYJt9HA+b7AzIKWhchblg3YJ+agGivEiUoQvxqWiP/qfwfLt
	A+gpTotA0iYd8H8WSBiFFm5nVsTyqSwfCaiRR5ccl3xepxCAqLtu/mzQkoBEYAA==
X-Gm-Gg: AYBFou190zYqJsdFoUTbSUlj6KJ1JuwrZIoG/KsXJJw8wQIj7Llba8w1Mw2IWVD2zPr
	+tXaveNmSTbxLGSjZ1TYtaf2pk41JPsLloFQpVyYLDQ+xt3Aq/yLe9cXShrsFvPa2Ygzkulxd+Q
	3SlEdklbn0TlDd914ITOCQb47FhYsCZtWRmVZuxpjYtpMd58llzM63yZKa+lymU+DF/p9rE9V8T
	ifuRKyHZrSTcoEz3KSEs0/ZtcGoKysxKAhkWuqtv403HAsJuwSfkSRJVBsuBXX5Yn9WbHi3WiCQ
	c9TOTf01oVz2KfDsdTyqlWNtgy/BEYRuw+kmOuFYtHqaPYlbp3cuKZezcC4SHQcLBRxzDic9Bx/
	7AzOaLx8K6OlBy0cODTsgxA5q+6t32NgZtYgBbiJpMVuNXdA=
X-Received: by 2002:a05:620a:6412:b0:93e:94f2:ada5 with SMTP id af79cd13be357-93ebd1e0002mr1700634985a.25.1791822523163;
        Mon, 12 Oct 2026 09:28:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6412:b0:93e:94f2:ada5 with SMTP id af79cd13be357-93ebd1e0002mr1700628685a.25.1791822522479;
        Mon, 12 Oct 2026 09:28:42 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:41 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:18 -0400
Subject: [PATCH v4 06/18] btrfs: rename cache_write_mutex to
 dirty_bgs_update_mutex
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-6-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=9136;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=s4JXe3nfNxOs4OgMdiLvJwQwzSACsVnMkxz2zGAQrKs=;
 b=zd9EBuDnvAhhG2J1KcUBgxNh598QcWGmp9b4nBbdK/ro6owvXRaX2UqRlniLw2btrcMt59xR8
 YYg7SdFlUEMBbuyIstwc5sHGubJgfi1XrSdXDUuuRTWrZVExkiVA/9j
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX2zYzbt+9q6+s
 t63we2fzBrSghVg4n4kdDZK7Z+D5FfoGgqSgbJURMwfqkF6Dj7WuyVuPRdyjoQ6BgypY84BkFBe
 6hZUrSdkZNv04WzEC4saNxE7EN+XuyLXPmvESCgl4rtWOWZi+uBt5rCtOowacJoA/jKH04Hmlly
 qJj8l7u14ePD/AIVajdC1vWZHY4tnh6ej/H4aUtE1jwyWd8yXPl73lRzdR32amw5S73EUjuAckJ
 N1MIrudjeZ+pzV0bzovLF0VusUTF52NUN3vXjUDI6v1db6LbNzuVL78vce9SVeBZu2KvFy+OoCG
 7OQCHAr1qU67s9khFiDjN4qo0oiuT8KKJmVS6Ov/LY8Xt0FtcdFacXslKawtk97fL/TPJLXaJzo
 6swaLiSQDKbF71/tkQKTzGx0qipIi3ZB4y/luPTy9fUEQbq7G2We/ojTVixeYXu0Rz778PvnCKQ
 a+pxQHAV80KX1ECwJ5Q==
X-Proofpoint-ORIG-GUID: pNTU5ONvWzQZgsgsJ5ZlN7Y5byWr11v3
X-Proofpoint-GUID: pNTU5ONvWzQZgsgsJ5ZlN7Y5byWr11v3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX6PFmSCA33mm/
 JroxJcSCfz7/tln00e/CLu7zlx2UAyPuVkuKSRpUOOkhP71AqVsuWPFAMzXRXKb4OwvNIBgVX+n
 E6+AeB/49Floocg2htjs9AEiE9jA+5712UtxZjuInETL7F74ZYwC
X-Authority-Analysis: v=2.4 cv=cYxHPXDM c=1 sm=1 tr=0 ts=6acd0abc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=jjizJtb08lyoHivougYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=10
 clxscore=1015 impostorscore=10 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120065

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

