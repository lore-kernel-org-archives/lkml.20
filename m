Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEFD3C343A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075433; cv=none; b=FCVhiwuE72jOT+8Hq7qDxeIXO40VhF2/5swC4eDhDNaeNQrfIFPAY0Lq/6JYEesGq058unuXHSud5Xu3Yxi9D5hTRh1Rixa10rXurY3kEZa6x7AHEGGsUB9iDW8+DBHiwhI3HaipJOIq2lIuFn+C9Fb8hRD+ICxbZcr7M9ReqAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075433; c=relaxed/simple;
	bh=rTZzQ2a96A9lf5YW3hyxm+4Hhlv3XhfAOtWqXfOLQK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtMu2FvqIJuo36Ve93AZ43XqxHzTKHZyEh0+4v+DRVDWvE5GCmAJMvVAF/etKx7cB4gj8nBqgyOz/6nvM496plXOPNLdaOIZd8eWvZlGzdIYXkVOtHqeNFlHPdnY0+ttr1CY4aNVRN+ATrRxyY64HPyoHkDWmWwS6cr9YdGEzxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Ns/v8Jhg; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DHEWCTAU; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Ns/v8Jhg";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DHEWCTAU"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYV6v1622695
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=sXpy
	/3ffel3dUUklWIUvdxbmuTLROOFL9w6Ftgsfktg=; b=Ns/v8Jhgcr/gPPEw/oBl
	HF5SgI6WrX+FAZZghAERpCOojypFrouSclu4bB/vBkjwClM3OsbHmj+KUyDhaYVn
	FftbVDzQHSMq1tccx/++8aK9u6Paq3oatzbls4FFQ8DNp46w8jMWJOLqx6p8TJ1V
	QbwJb3ipuIsazlM/WhgZhTSMcmWYvDYNBNhJ/Tt7cV7LUUf9SbQ156al8lh1eXQd
	4aWe60ZtZbfdGBZ8i+VuCoASpb4yFSK04WkII7CTMynoE+DhP+gbIk6hVVJL5iv7
	F9SmX/UpFEjyOnRJg+Z9/gF3OvadQIjoTrO2ZW19u9tLfgB4dzj/cakTkRsiVEqL
	0Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hah8evwkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:50 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91961d4b31bso112325046d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075430; x=1792680230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXpy/3ffel3dUUklWIUvdxbmuTLROOFL9w6Ftgsfktg=;
        b=DHEWCTAUnYh6bSdspLFzdCQ+mStJeWncetEKKBRkp2DgOeaXzLJDTbRwJV2K7qFoo9
         6vEIucbj3qlIEZhJnJSqoPyuoQv4ynRy5U//jVk8jw47vLSbG46BN5wbItHfcK9M0/aj
         JUkfK+QMrEJBGwz16OSXNTPh3lYBymK2i/xyWvAc44r8qodBv5L4nJMax7f3odXmwXaY
         qRo9oXmrJh3wkhwHX4VLQ4rApG4oOOtuRQll22/ybO2r+YCE8q4ygAB+z0WWyXsSJjU/
         mbZd4rW0ttVxPpRBfo9cz36oLQgnphT9qT7YAu8K/YFOfoyFWQs7/NIL2OuyriB5q0lQ
         kn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075430; x=1792680230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXpy/3ffel3dUUklWIUvdxbmuTLROOFL9w6Ftgsfktg=;
        b=njB34r8c4v8gnpy/j3H1YGsR/EV90V6duHSTNBYBbykwAIF0bXK1Q1+AT92MP2FZCy
         7NIfaIYHBWDd5AlOwKmwXOVGFiLBnYWT9Sv5x6nbZ9nf94ERdMo68MXDrho99vajvQuW
         aW0nUVFfZgpjR0Mb0YRZhb3TA6tswMFwyHBN5fBckhNQwRzPF21QRFmBD/ncqeP1KH7i
         G1rZn7WoC92oXMEPzOpaw1crsaPpadiDv08oIsSmeHfzjGasbLWnPB8IqG33DSEioPhQ
         9uJJt/1lvLSJxKIays4d4Y5nVfJl+y/6ePvBMp5VuUDSkFLNB4uZmzqn+b+DBJobBQqZ
         0f5w==
X-Forwarded-Encrypted: i=1; AKwUvBzWddHAWg22blj7xypzrRK0v1/A/c5vjDLMqUcMEHOt1c8lau2CFYhKAM9cZ7mZpTMRPQtxmvamHkNYwuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv1UAdGsNVyfHCGwXqj7fs+/N/iqNojmKJ7EeaHNT3H4YEh9YC
	9jo69/vkvOydkM4LYNI+W5AQSNyX1KHZdCSqbNvDf2J6dOwsXdxxuAGoiRxmyPXRxZY+ios37Z1
	Z3J6wGhdWlN4MhumF6RsTKE1g/s69FmHIK9R1GRdMUAB1e52+lh+RNKAKtn3n+BW0dFEcxw==
X-Gm-Gg: AYBFou2GXh2m8h2UfqKL+fSh6cwAF0yU4sdv5DmSUXgUKyc1p7nv1cvhB+xNmcVgSeZ
	v7pn9v2q9SNV40l6GYc0K7GgSPQDaJ92Iu3CCKt2wKRvTJuhoH01QYg2Ib5viuvwqZn8UXlmDIj
	dTkqD6k7npeNGgrgEWl2ktTpsh1T9JMb7bl7DWhcOe+EFiSpUkjGQZ+PmcVs53K2IFdxlVjvPNx
	DcRM9ipM1qLlXPEB7xER2jnNnZlFcEQoPumrT3302C4FF1QBRmV9HpBns5w0xVSZd5YJctEroFS
	H+xfG/8/E34qPgrD6AXbR/nafzCD+VpDggTGfYnARjEX/VybJAf/6D2TUxuS+PcsHF3cvFVPvMv
	kMyUWEhZyDQmWThT3fDGk+EOoFIPSqZUMvWlBhL0p6SMd
X-Received: by 2002:a05:6214:23c5:b0:91b:5480:ee2a with SMTP id 6a1803df08f44-91b557bda3amr304340356d6.41.1792075429753;
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
X-Received: by 2002:a05:6214:23c5:b0:91b:5480:ee2a with SMTP id 6a1803df08f44-91b557bda3amr304339756d6.41.1792075429098;
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:47 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:28 -0400
Subject: [PATCH v5 15/19] btrfs: remove the free space inode ordered extent
 special cases
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-15-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=6320;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rTZzQ2a96A9lf5YW3hyxm+4Hhlv3XhfAOtWqXfOLQK8=;
 b=XyZtSLvX+XD0yufny3eG0W/t8oQZLv9fZx0jP1OLI3szjeIepX79FQxDwwICw6Wyccitos6l+
 GQsDarBZuI2DW9AYNyO0KoFe87Fgsln6HpbQi5Et1Nfd1WkRI56Ymy+
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: nyxa7VJ58BmVMQI0noLTmomlUHTMdZQx
X-Proofpoint-ORIG-GUID: nyxa7VJ58BmVMQI0noLTmomlUHTMdZQx
X-Authority-Analysis: v=2.4 cv=Ob8NnRTY c=1 sm=1 tr=0 ts=6ad0e6a6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=OXerOaSWGyOIk54xot4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX1AxsFvRouc4r
 H10gTgxkzlwjSxgtGD/wc+VpfNZe9OIHPlpTHDlPILb+2CfOf34gEdlCmxyNbNUng6rGs4fqrrq
 gfLKVH6duYieJZ+kKkXwiitk6oRlTosPIwjUThCPpbQGKjPAcboo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX37dkjEUoJ5OT
 M2vCRuC8GaQuQP8pvTeyePSZLwkPIILz8SA3Z+6XHguwEdtnFKsDXEP+G5wO8r7RpmNoSYQ9khv
 aXs9jjM4bisP5xWX3lw42dA7IR8FreaeN0D3RPiqPEQBGNfbZ40W7bJa1RJLRZGPpv+YkX036xH
 e6i8oX5FafIeN0UvYe33zaoJ+HEm1Zj3gMj1HZHrMAMZc3DQlK+TlRHiQLzIrzzPz7WlhvG3pyz
 LCuoPc3vZB1GHq9QzdwmKUPWR0QDcRbp13yUSEphgHHOThmDpReazOChwVdw8ts7OO//4NTq8ds
 mDKl6Ae1sOrn9zWN+mJgF6JVcIJDwoaiU2RwTYWHn7ewW8+QzNIo7p+ecvwlsepayhS4orS0q6t
 BNhrarVkzTzNGfwcnGOF3bKM9BFzDFI9ib4l2yg1yLD481M8DDthpSdW/3q8xCbqax9teP0LItm
 4ftGVMMT/tYRsNlVtTA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=10 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

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
index 95ec6026f08b..0ca4952600c7 100644
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
@@ -8137,7 +8131,6 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
 	struct btrfs_ordered_extent *ordered;
 	struct btrfs_inode *inode = BTRFS_I(vfs_inode);
 	struct btrfs_root *root = inode->root;
-	bool freespace_inode;
 
 	WARN_ON(!hlist_empty(&vfs_inode->i_dentry));
 	WARN_ON(vfs_inode->i_data.nrpages);
@@ -8160,12 +8153,6 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
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
@@ -8175,8 +8162,7 @@ void btrfs_destroy_inode(struct inode *vfs_inode)
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

