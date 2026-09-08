Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BFF2DA749
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830412; cv=none; b=ca+X5ni5NvKLLC/OvMp1DP68ssAWXYfMqyD4tJcvrV/hz27Q3CFu/FIOItcZ1DcRVuYcgWQasvhfMUDozy9V2n0nfuZrytIXsfXACvOvpzHVV3RDVT+D9sIrNyu5Upw/VA5/1eR5nEydbSxUC/mh22od/97/8f/1nhmhugUTpY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830412; c=relaxed/simple;
	bh=s/LxtVbEHOVYU4ldcfT6uxuIsoUevA4AeoG9wWw8HQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vD257oHHGN0S98O+oVcD41ERbBY4jlmKBu7tVCk632Fz7LtWtREXynN02jYERZfcPLkWGKcBmFK5kBwIqiT1dDF4D5bidbvFKLMtAh0ZmFBMVVfaTXdDnTA+/Hi5SlzGhtIYHKr/wR4vrABZfVhU7rJVLgAR/rIuaG+9ctJhtM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=pYD6c9Et; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=PRoK9h44; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="pYD6c9Et";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="PRoK9h44"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880uTs0096006
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=l/YP
	Y/lrskj2rohGcIbRXYzqjPjjZ5iVqxwDPnvnGKU=; b=pYD6c9EtKYnTj9nXe0Na
	9YZJZnyW24qrY6yC5DjwNbjHBl9RTd24VeGfItcnxdoaUnnAtv/Peb4tBrns8gUf
	cr42QCf+CGABkjOAAuveh+w5DcBxh49ikCdVWB2NcZl8i9G30V4d4G2loGvIKcO0
	MuGg7XtodF4UMedboRUiZl2+2AfzsQdjXnaER1tTEoV0r+VUFn9Tx1ldZFn4Z5LE
	U7c+GtjSz4Ioj//sCvE8FYBeeZCzaSplpFAi140tTNgC8KFyRC1T1SHEinzxV7vV
	PIYDRodBfwBZ5BraG+4DEdIDlqKOWb4clEgNtckOIgmj9LvFnAqEhP9JEtBERHXu
	8Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghxx236y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:20:01 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91051512080so29056906d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830401; x=1789435201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/YPY/lrskj2rohGcIbRXYzqjPjjZ5iVqxwDPnvnGKU=;
        b=PRoK9h44pIKiPivj8TPWwjneVR+ILgDHOycEE3lW4S3EMR0VEuSnuXL1oBIqFOU3a8
         h/hki7xqStY1tMYDBXZkHW0mSYPWtO/4UEv1ztEGSg77ePZRBTVm2tb16O1/AZrQHmL5
         XSgpnUsgSj7TSmKIelLNnwD34nmR+EhDvxarQRCKssq3mwnoABBG7KNfm+YIyiROth5q
         QqpHpmUMtLCZ8afx5+l60lLtniUyYdFr+J2u0HdfAD+IVEHjdlccZFjxRGrdobvMR5Ic
         l2Yov6t1MSm5dfk7Pon+AKAIpQ6rXPv+CIDISoNC9u8vAHp7N9kn6X6VbN2uPAS6NnDU
         FYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830401; x=1789435201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/YPY/lrskj2rohGcIbRXYzqjPjjZ5iVqxwDPnvnGKU=;
        b=X/UzAlTuSXXzawARgciB6hrSzmxody+evb/h3t2qHOs0NFAHzj4Htys4+IA9NCE0/9
         VfU0xw5xRadCc23o4OdBqz9xoIMViBFT3BfTpklDqaorYQ49xz8F9h1VFbgRFIg/qPCH
         hlaiWrohRFyO5X63Lwvi1j+CBddaxlQNU8PcT2zk/7eN1dCgsRKhG1zXVuC0t+dcpz91
         Q0SyI3DWEqP/ctuUMZTcseo21i3FbZ6C4f5yC19j7RW27ZQYO8E75FFMlts1+qfn2XSK
         1i8RxjUlsaSUrmgCUE2xzxADoem8TRFGpczzZgzkaeuvk9ivCClAPG9I/xCPRhNExaqL
         HPjw==
X-Forwarded-Encrypted: i=1; AKwUvBzu8cXs6EUY8bcazeFzLS8kmJ/C4ckvFWgDpkFZvcWO5BXODl1TTPJKkTcensVcgHMPzKZMDlXWh/JGpXc=@vger.kernel.org
X-Gm-Message-State: AFuF++mlnt1wumYmMA7sBSostTlF3kGbix4P0rP/2cwTfHW+SQ8qjs0L
	OjGQBgFN/Bi3zDNPJvbIDy8zvnucIbeQQA//w+z9fJbdt8UKRyovGrqGPeyPoTc7Xh/mvvnKGTS
	NR0YASSLEddtCoyUp3sVvd+XiIz88Hw0dslCMbHT3e29iE/8vPBuZNgH96N0d+A==
X-Gm-Gg: AYBFou2I+4nwJ2GYo+clV+6j1om8/PlsROIRMWUjrp18yUzyivJGz5fTnBbKyVGOdjr
	asMFHR+jX/8eYeL7Cy2oEkEsi+ECrNNj3gmM9ciG5J8fp5Rt/wtcymxCaAmsoBKnq7YmmHICZ9Z
	4JGT9wLqhv4HWt27qJf+QkX0ZwvlZ/eIwvA8h+634vuFUPgU2MZMGNk54vKW7gEc9d+tBofh4Aw
	UYoL3EMiY1/E1RGi9kMd4GlQtrh5hKz3pAv+G8Xjy1nuuj6wElti+/mLYvgwk3xKf9z1PKYiu+f
	env9zrFkZlT8pOv6Ezl7WtDp4lanuCm79A/blF8HWPec2HoFSnlN7WHMfmnRoNcBCvJCqQUeMTT
	pvjM+if2u9UUsuwCnQoLQrUOuTI+Z28A43pjaBMFip1Z8nKCVN9g=
X-Received: by 2002:a05:6214:2d44:b0:910:3179:733d with SMTP id 6a1803df08f44-9103efa0f2dmr347751616d6.25.1788830400985;
        Mon, 07 Sep 2026 18:20:00 -0700 (PDT)
X-Received: by 2002:a05:6214:2d44:b0:910:3179:733d with SMTP id 6a1803df08f44-9103efa0f2dmr347751096d6.25.1788830400465;
        Mon, 07 Sep 2026 18:20:00 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:59 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:27 -0400
Subject: [PATCH 12/15] btrfs: remove the free space inode ordered extent
 special cases
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-12-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=8736;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=s/LxtVbEHOVYU4ldcfT6uxuIsoUevA4AeoG9wWw8HQM=;
 b=kFlzncNEXuP05FmgxaKPgQZYgjbI2ohfym11arl5rQVpOk7ZvF2RKvdixZKmKJkVWAlWbjb8R
 QzP2rF1uk0cCxPjOUXmhIduFSpH1Xl6EPC2n8Tdoaz70PB5JRXLjJBB
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=YcyNIQRf c=1 sm=1 tr=0 ts=6a9f62c1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=m-LKR5TgjiErI9wjomMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: pv1n3KJVT_1vPsH7hvgkM69ZTQKUkGkf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMiBTYWx0ZWRfX52EblHephRnL
 ut1FI9jS3vROXRWF1ZIII2omm0x0EtqiQu5+68iMxl7OjsWDHDG/XsCY/2u4MtbJTlREtX3nUx8
 XtIDj8DR2z5sGYtQDBlrC8RCOhhByAK8+lX98JbojHOMvnX/14Qn
X-Proofpoint-GUID: pv1n3KJVT_1vPsH7hvgkM69ZTQKUkGkf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMiBTYWx0ZWRfX37ZokLUkp1Zd
 CkKpNffwNiWg6ExT6qrdsnOI9zkbA3qm3ocuiSCqoEVoC32CRPZiz5FARoyMD1RuuOUQWUnn9gm
 gtxviFjsHjK2936skKORUIGfEwjocMzbYHaq/R2WnLa9/w17EyLFrcmIMZw632OKMQGn1dDHdQo
 ASsnD3emrYdizQGyunVPx8T9akk5E8D8ypHxhUCgHy7xiYv2YSDQ/ePBT4cwAOcsjD15HoSlX0O
 QKC1KmWxRe723kwREaSvodTgqg+M+hSZ5L7Xoum4JCfli9n/Dyvnu8G2fr42xgbYIc5DVo7eCE2
 gv/eJIKxzKQ/tqxidpYdUBbBpbFSpYk9Hp3gUcIi3iCWna591NbFvBcK9ZounwUCzqWwoOseHni
 SzXk+Q8fpUycuWCa1z8RFeqNuxL0pN9GXSqxKEWuBAHNWhhqDpmBDi6DkdUEjiXvEqtK69Ls8H6
 DuQKH2fO8ddnKK817sw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=10 bulkscore=10
 malwarescore=0 impostorscore=10 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080012

Free space inodes never have ordered extents any more. Drop the lockdep
exceptions for them and btrfs_join_transaction_spacecache(), which was
only used to finish their ordered extents during a commit, along with
TRANS_JOIN_NOLOCK.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c        | 20 +++-----------------
 fs/btrfs/ordered-data.c | 20 ++------------------
 fs/btrfs/transaction.c  | 23 +----------------------
 fs/btrfs/transaction.h  |  3 ---
 4 files changed, 6 insertions(+), 60 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 699a321fc43b..5e4ecd1fe194 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -3203,7 +3203,6 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 	int compress_type = 0;
 	int ret = 0;
 	u64 logical_len = ordered_extent->num_bytes;
-	bool freespace_inode;
 	bool truncated = false;
 	bool clear_reserved_extent = true;
 	unsigned int clear_bits = 0;
@@ -3220,9 +3219,7 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 	if (!test_bit(BTRFS_ORDERED_NOCOW, &ordered_extent->flags))
 		clear_bits |= EXTENT_DEFRAG;
 
-	freespace_inode = btrfs_is_free_space_inode(inode);
-	if (!freespace_inode)
-		btrfs_lockdep_acquire(fs_info, btrfs_ordered_extent);
+	btrfs_lockdep_acquire(fs_info, btrfs_ordered_extent);
 
 	if (unlikely(test_bit(BTRFS_ORDERED_IOERR, &ordered_extent->flags))) {
 		ret = -EIO;
@@ -3257,10 +3254,7 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
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
@@ -8116,7 +8110,6 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
 	struct btrfs_ordered_extent *ordered;
 	struct btrfs_inode *inode = BTRFS_I(vfs_inode);
 	struct btrfs_root *root = inode->root;
-	bool freespace_inode;
 
 	WARN_ON(!hlist_empty(&vfs_inode->i_dentry));
 	WARN_ON(vfs_inode->i_data.nrpages);
@@ -8139,12 +8132,6 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
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
@@ -8154,8 +8141,7 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
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
index d2ff3b568eed..232cfa37d2d8 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -125,17 +125,14 @@ static const unsigned int btrfs_blocked_trans_types[TRANS_STATE_MAX] = {
 	[TRANS_STATE_UNBLOCKED]		= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 	[TRANS_STATE_SUPER_COMMITTED]	= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 	[TRANS_STATE_COMPLETED]		= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 };
 
@@ -310,12 +307,6 @@ static noinline int join_transaction(struct btrfs_fs_info *fs_info,
 	if (type == TRANS_ATTACH || type == TRANS_JOIN_NOSTART)
 		return -ENOENT;
 
-	/*
-	 * JOIN_NOLOCK only happens during the transaction commit, so
-	 * it is impossible that ->running_transaction is NULL
-	 */
-	BUG_ON(type == TRANS_JOIN_NOLOCK);
-
 	cur_trans = kmalloc_obj(*cur_trans, GFP_NOFS);
 	if (!cur_trans)
 		return -ENOMEM;
@@ -708,14 +699,8 @@ start_transaction(struct btrfs_root *root, unsigned int num_items,
 	}
 
 	/*
-	 * If we are JOIN_NOLOCK we're already committing a transaction and
-	 * waiting on this guy, so we don't need to do the sb_start_intwrite
-	 * because we're already holding a ref.  We need this because we could
-	 * have raced in and did an fsync() on a file which can kick a commit
-	 * and then we deadlock with somebody doing a freeze.
-	 *
 	 * If we are ATTACH, it means we just want to catch the current
-	 * transaction and commit it, so we needn't do sb_start_intwrite(). 
+	 * transaction and commit it, so we needn't do sb_start_intwrite().
 	 */
 	if (type & __TRANS_FREEZABLE)
 		sb_start_intwrite(fs_info->sb);
@@ -853,12 +838,6 @@ struct btrfs_trans_handle *btrfs_join_transaction(struct btrfs_root *root)
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
index 889babc76b68..51633af27894 100644
--- a/fs/btrfs/transaction.h
+++ b/fs/btrfs/transaction.h
@@ -100,7 +100,6 @@ enum {
 	ENUM_BIT(__TRANS_START),
 	ENUM_BIT(__TRANS_ATTACH),
 	ENUM_BIT(__TRANS_JOIN),
-	ENUM_BIT(__TRANS_JOIN_NOLOCK),
 	ENUM_BIT(__TRANS_DUMMY),
 	ENUM_BIT(__TRANS_JOIN_NOSTART),
 };
@@ -108,7 +107,6 @@ enum {
 #define TRANS_START		(__TRANS_START | __TRANS_FREEZABLE)
 #define TRANS_ATTACH		(__TRANS_ATTACH)
 #define TRANS_JOIN		(__TRANS_JOIN | __TRANS_FREEZABLE)
-#define TRANS_JOIN_NOLOCK	(__TRANS_JOIN_NOLOCK)
 #define TRANS_JOIN_NOSTART	(__TRANS_JOIN_NOSTART)
 
 #define TRANS_EXTWRITERS	(__TRANS_START | __TRANS_ATTACH)
@@ -288,7 +286,6 @@ struct btrfs_trans_handle *btrfs_start_transaction_fallback_global_rsv(
 					struct btrfs_root *root,
 					unsigned int num_items);
 struct btrfs_trans_handle *btrfs_join_transaction(struct btrfs_root *root);
-struct btrfs_trans_handle *btrfs_join_transaction_spacecache(struct btrfs_root *root);
 struct btrfs_trans_handle *btrfs_join_transaction_nostart(struct btrfs_root *root);
 struct btrfs_trans_handle *btrfs_attach_transaction(struct btrfs_root *root);
 struct btrfs_trans_handle *btrfs_attach_transaction_barrier(

-- 
2.39.5

