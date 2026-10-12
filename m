Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2804B4BB27A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822537; cv=none; b=i4d0eyCoZ8sl6QbNPpSpzJk4Ytxc2jIU+RY7OyIcuYE9upSn59j5C3vxW3ODLK3J/3qr6deSwngVURQojrjckH90qfIlKYRirfWJ62n+Qz27jJzVq3r0TwL6IJ/hk5AbMPX48D8d+07yZQN18A1+UNE5GgMyUMD/nOiGRY2xxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822537; c=relaxed/simple;
	bh=vcfdwh8928N7AJ8OJX7T6ODIHv74IvAzDqY2dwbULRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkxN3UctZyCeUJOXHBRzJVR//CfuUty/DDP4Isr8WThSd3WNKlY8KRB1EY11nNrJkirqOfvGuEfDjmRX4GsFSGxzndSrojgcNikH8stv7noIPhC9QPQ41ozc6FZL90z6TZ1jD2GORzJ7cF6fjDRkUmbbenW4gisjDm3nOCbltM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DS5TiXbF; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Z3DCVvf4; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DS5TiXbF";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Z3DCVvf4"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CF8GpV572832
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=riLc
	WAKe/f2bulWl4scTnDqlU80/Qe69wij85eamdZM=; b=DS5TiXbFSbI3oTDrhvbi
	swo93Eav6cUh6U4IAXBVJM5X5V9HVwve6/9lSHe5HttFlpY0C1puNWb9zjDD5v7w
	a/zquNVKSsPCW1Lb5cQi+RUz9SPEmSx2nsrL9YrPbNUES1m+lA1ZUzQ+Ip4fODff
	/pQjgWmcz3+VRaDjenMxMC36WurF7tc1fB/+yWoxm7aScsuOL09UzNkMRgZq5M1z
	AIScbRm1Sy8OH+1G0FEkRiw3GsoqhpTw3qsZat9EdnU8miCO42KjFkFeNKv2l3zQ
	q8MGyf9bnNhXAX2qj0mQF4iGVWZBB0USGDUXND91Tn/ps49F7VYoRkeoqjqluz6R
	pw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91x6rwdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:52 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91961d4b31bso47211936d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822532; x=1792427332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riLcWAKe/f2bulWl4scTnDqlU80/Qe69wij85eamdZM=;
        b=Z3DCVvf4wHRPcAoOkCpWnbSGpfd9wJTAeYimAfqDdtxOrSkyFDj+T6137o2MnNooGI
         2v/DDXdWx+D0vfB6VyWF5TCWRcFKpxxdYZhcT4ygt7KrxoAczPtUNhwzBSznYEXvxLhw
         PrKLI36JrC1Z38LLLVFzUCdhlSnbQ6mDnBTT22zrUZIobBBGVk8XhTN0RF8OTZ30ji4I
         rdc1ar9WBTUvemm967h/J1hg5W70PjJDar7Py5VXJoDsH5fGhKHqewanpaGnyKczROxh
         7c5h/OjATw8VtCQEJIkzwl8+vjH0VpIiMcP5snPoXC7epkJyhcajK8cYHVLgCSEkxOK1
         y0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822532; x=1792427332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riLcWAKe/f2bulWl4scTnDqlU80/Qe69wij85eamdZM=;
        b=rWslobOtYWwniWiGa66WANQG7JvnGD/EXeqpZRCPb1D7DUc/tNPkqB8QR3H2VffeFm
         X3wLkYImmkdGzWiWvsmOshxMWySNgAK50CuJvGEG5AJvU87HqEOHBHK64PJBTcKiDUni
         sqCWi7bOYvvaU7P0G1jj74Hx4tLdElCrzWbHB6QQUDjuM8XkGKb3mSRCcLk6OUfDnnhU
         wUQyQVqn5A9ENZHT3EHx9S+Rgxbg7+VOTn6A6r80l3c+5ugr6uGFt77qvaGGiFVLOxW3
         66LGoGHcYgqPx+iRysoJDVGJYuNwIKoBXzj2VR0IvgCuXUL9gqDfLiXAvR11+UFpmp44
         qJlQ==
X-Forwarded-Encrypted: i=1; AKwUvByG3e2BoEv77BusjBfBsLoITPF1nztD8E8e71HaA765bVp9UkysB3RiGcIbfNTCocF7bZ+Q28JzFXRRN+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk9PYLKpFhMlIUE/stb4Xi9XZvtQB0GPuk7Mj2g58bJDMh2zL7
	jccsrIIutgew/6QUCbrG17E38aj1NyQif2VFLt4T2uZ+J927gl3XgjkHRKvDDy/D9qM+s/yTS5K
	KrK840+vO88Y5CWhdhVIaILsBnV7LCNY87GCNRlFhUdm8WMCI8bTWfgerO/P84yW2P52sRA==
X-Gm-Gg: AYBFou1BH7yflqfBMEiZYl3amIOzJ855oTHjmoo3iz2gCLGLemYL791EpN1iUfSQR8v
	A8d/YibM//l76UNXsgJPVyowSBWTOkBjQVMi2gc1IM0m02xchTZ5myJe3CI3m8nsw4jcFsI+qLw
	L5bkKg+CY/9U7Wt1LgkgwrDzpxVpbEY8me8lLnHcYq4LWvI7GYSEImiN+wX5H4uhFygJ15A9KeD
	GjB5eSZhOhLdgBY0pMSOSpcrbsmUaE69Rjbg3QrEJ4lOUdysK2ngGWFL0M6sO6pU3QgDgx/YVHx
	YKQzvYEyPKJqY7xWTNudjKLwbm2FHb8WuKUpcMZilspTIpHCMUNGJlW/xvTZ4XAJDBxwTgv+iSV
	3e3ovqeM8fSE1FU9zrkVbMAzU9bexkWInGRZVPlYR8cClE9w=
X-Received: by 2002:ad4:5aee:0:b0:917:9ce0:b6d6 with SMTP id 6a1803df08f44-91b557bf438mr182206916d6.42.1791822532276;
        Mon, 12 Oct 2026 09:28:52 -0700 (PDT)
X-Received: by 2002:ad4:5aee:0:b0:917:9ce0:b6d6 with SMTP id 6a1803df08f44-91b557bf438mr182206376d6.42.1791822531616;
        Mon, 12 Oct 2026 09:28:51 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:50 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:26 -0400
Subject: [PATCH v4 14/18] btrfs: remove the free space inode ordered extent
 special cases
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-14-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=6320;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=vcfdwh8928N7AJ8OJX7T6ODIHv74IvAzDqY2dwbULRw=;
 b=gVvOe2y5gGGfLGuDqsNPX+OmVjER2F5WQvVgdOwTU4jD7aMyaSeeyNNcmWR8zBoeRCQQ/8oG9
 ntM/CqwGVXOBzOrMiTQ/RzSmPjZvyjmbR2QikqeEQlD0N+FiQxRNg3B
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: mI8NhlYgu0ZK2V-rBGzkgPjkRNaDKlx_
X-Proofpoint-ORIG-GUID: mI8NhlYgu0ZK2V-rBGzkgPjkRNaDKlx_
X-Authority-Analysis: v=2.4 cv=DrDDa2/+ c=1 sm=1 tr=0 ts=6acd0ac4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=OXerOaSWGyOIk54xot4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfXyphuspZtZnCx
 0U/3F3MuLg7VV9m1kRsE/hS9DFJ0MZFikF3Kc6VZA0utyVkEMuTjZ1JeVl3XINBWjbWys4ePQUh
 qtHIesYOfcIy1yH8uPU/t9wg4wh2ytA4KW0AxcmLlWaGWb+InKfyDGwA5FDpxDf6wkN2cm2KT9d
 fyTzSwjDbD15bPvr0hDHAHzk9x9Cmq+Nkbvq6JZ4P4hk7bWd5SJf+YO/5i4rvC3QmmzzJJCcKm2
 2IiwuYN4d5/pKVgGdXc2h/wvpN2abeeaSbITd5wC7KjYnEnRRZqYd/dAYUPEcVMPfqhLKILGErJ
 8RF1NtEh0v1BSjCo2UtJzkyv9US3LFtRFLDYFqEXZy2AxawXTGhVsFgIvNM3ANNOZZ2O+DfGG9f
 T0j1muoXvTfq3sVN/QQiZED9D6k4SF24oYbBEPCXID4jmUVYIjUQXpjxRMA3ZJwL43IbOXjD/dP
 C2gH+bHqzRUqK0UEgTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX6My2XvBTe0IM
 /tK1YyRNSy26cQnohMz5HA89kiWJFzp4GOweI7Y2gWsjb2OeUEQLigN52fSPY/PW8pGdxKiXkeu
 HhxvYC8KFkMc/HFmKxExtoEgBA+/vHKfraqONUU8tHCvLnQ8noWV
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=10 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120065

Free space inodes never have ordered extents anymore. Drop the lockdep
exceptions for them and btrfs_join_transaction_spacecache(), which was
only used to finish their ordered extents during a commit.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c        | 20 +++-----------------
 fs/btrfs/ordered-data.c | 20 ++------------------
 fs/btrfs/transaction.c  |  6 ------
 fs/btrfs/transaction.h  |  1 -
 4 files changed, 5 insertions(+), 42 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index c20cdc4e6a89..b7e8a17d3861 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -3221,7 +3221,6 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 	int compress_type = 0;
 	int ret = 0;
 	u64 logical_len = ordered_extent->num_bytes;
-	bool freespace_inode;
 	bool truncated = false;
 	bool clear_reserved_extent = true;
 	unsigned int clear_bits = 0;
@@ -3238,9 +3237,7 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 	if (!test_bit(BTRFS_ORDERED_NOCOW, &ordered_extent->flags))
 		clear_bits |= EXTENT_DEFRAG;
 
-	freespace_inode = btrfs_is_free_space_inode(inode);
-	if (!freespace_inode)
-		btrfs_lockdep_acquire(fs_info, btrfs_ordered_extent);
+	btrfs_lockdep_acquire(fs_info, btrfs_ordered_extent);
 
 	if (unlikely(test_bit(BTRFS_ORDERED_IOERR, &ordered_extent->flags))) {
 		ret = -EIO;
@@ -3275,10 +3272,7 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 				       &cached_state);
 	}
 
-	if (freespace_inode)
-		trans = btrfs_join_transaction_spacecache(root);
-	else
-		trans = btrfs_join_transaction(root);
+	trans = btrfs_join_transaction(root);
 	if (IS_ERR(trans)) {
 		ret = PTR_ERR(trans);
 		trans = NULL;
@@ -8135,7 +8129,6 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
 	struct btrfs_ordered_extent *ordered;
 	struct btrfs_inode *inode = BTRFS_I(vfs_inode);
 	struct btrfs_root *root = inode->root;
-	bool freespace_inode;
 
 	WARN_ON(!hlist_empty(&vfs_inode->i_dentry));
 	WARN_ON(vfs_inode->i_data.nrpages);
@@ -8158,12 +8151,6 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
 	if (!root)
 		return;
 
-	/*
-	 * If this is a free space inode do not take the ordered extents lockdep
-	 * map.
-	 */
-	freespace_inode = btrfs_is_free_space_inode(inode);
-
 	while (1) {
 		ordered = btrfs_lookup_first_ordered_extent(inode, (u64)-1);
 		if (!ordered)
@@ -8173,8 +8160,7 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
 				  "found ordered extent %llu %llu on inode cleanup",
 				  ordered->file_offset, ordered->num_bytes);
 
-			if (!freespace_inode)
-				btrfs_lockdep_acquire(root->fs_info, btrfs_ordered_extent);
+			btrfs_lockdep_acquire(root->fs_info, btrfs_ordered_extent);
 
 			btrfs_remove_ordered_extent(ordered);
 			btrfs_put_ordered_extent(ordered);
diff --git a/fs/btrfs/ordered-data.c b/fs/btrfs/ordered-data.c
index e9f1cbeb555a..df74c75d6c29 100644
--- a/fs/btrfs/ordered-data.c
+++ b/fs/btrfs/ordered-data.c
@@ -654,13 +654,6 @@ void btrfs_remove_ordered_extent(struct btrfs_ordered_extent *entry)
 	struct btrfs_fs_info *fs_info = root->fs_info;
 	struct rb_node *node;
 	bool pending;
-	bool freespace_inode;
-
-	/*
-	 * If this is a free space inode the thread has not acquired the ordered
-	 * extents lockdep map.
-	 */
-	freespace_inode = btrfs_is_free_space_inode(btrfs_inode);
 
 	btrfs_lockdep_acquire(fs_info, btrfs_trans_pending_ordered);
 	/* This is paired with alloc_ordered_extent(). */
@@ -735,8 +728,7 @@ void btrfs_remove_ordered_extent(struct btrfs_ordered_extent *entry)
 	}
 	spin_unlock(&root->ordered_extent_lock);
 	wake_up(&entry->wait);
-	if (!freespace_inode)
-		btrfs_lockdep_release(fs_info, btrfs_ordered_extent);
+	btrfs_lockdep_release(fs_info, btrfs_ordered_extent);
 }
 
 static void btrfs_run_ordered_extent_work(struct btrfs_work *work)
@@ -867,16 +859,9 @@ void btrfs_start_ordered_extent_nowriteback(struct btrfs_ordered_extent *entry,
 	u64 start = entry->file_offset;
 	u64 end = start + entry->num_bytes - 1;
 	struct btrfs_inode *inode = entry->inode;
-	bool freespace_inode;
 
 	trace_btrfs_ordered_extent_start(inode, entry);
 
-	/*
-	 * If this is a free space inode do not take the ordered extents lockdep
-	 * map.
-	 */
-	freespace_inode = btrfs_is_free_space_inode(inode);
-
 	/*
 	 * pages in the range can be dirty, clean or writeback.  We
 	 * start IO on any dirty ones so the wait doesn't stall waiting
@@ -896,8 +881,7 @@ void btrfs_start_ordered_extent_nowriteback(struct btrfs_ordered_extent *entry,
 		}
 	}
 
-	if (!freespace_inode)
-		btrfs_might_wait_for_event(inode->root->fs_info, btrfs_ordered_extent);
+	btrfs_might_wait_for_event(inode->root->fs_info, btrfs_ordered_extent);
 	wait_event(entry->wait, test_bit(BTRFS_ORDERED_COMPLETE, &entry->flags));
 }
 
diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index 93bc829881d1..7431a06f168d 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -895,12 +895,6 @@ struct btrfs_trans_handle *btrfs_join_transaction(struct btrfs_root *root)
 				 true);
 }
 
-struct btrfs_trans_handle *btrfs_join_transaction_spacecache(struct btrfs_root *root)
-{
-	return start_transaction(root, 0, TRANS_JOIN_NOLOCK,
-				 BTRFS_RESERVE_NO_FLUSH, true);
-}
-
 /*
  * Similar to regular join but it never starts a transaction when none is
  * running or when there's a running one at a state >= TRANS_STATE_UNBLOCKED.
diff --git a/fs/btrfs/transaction.h b/fs/btrfs/transaction.h
index aa57c64a955d..684b46e5f2e9 100644
--- a/fs/btrfs/transaction.h
+++ b/fs/btrfs/transaction.h
@@ -287,7 +287,6 @@ struct btrfs_trans_handle *btrfs_start_transaction_fallback_global_rsv(
 					struct btrfs_root *root,
 					unsigned int num_items);
 struct btrfs_trans_handle *btrfs_join_transaction(struct btrfs_root *root);
-struct btrfs_trans_handle *btrfs_join_transaction_spacecache(struct btrfs_root *root);
 struct btrfs_trans_handle *btrfs_join_transaction_nostart(struct btrfs_root *root);
 struct btrfs_trans_handle *btrfs_attach_transaction(struct btrfs_root *root);
 struct btrfs_trans_handle *btrfs_attach_transaction_barrier(

-- 
2.39.5

