Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA33B2FC2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075420; cv=none; b=FFoKevZkI20jGAbaV4n7DYOH4FhcCsCeXncH2UQZo4D/YwTszTVxz5rP2fm66/d+0Te4FazzU68kjv+/2RAkrHtAzPB4xaGCmJ8GsrDXsHhC5j1KM60z+QaDnlkYukxElbvop3/uEJD4Z/V31LvAUJDsxE4KABjBxwsv9SDXTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075420; c=relaxed/simple;
	bh=E4COQQDg9vZWBwsk35ZCQVIuOCq0S+iSgePUi1LEW18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKYbD7/m2jyJEkL+/Z45jFU3CA1/am4YSZB1jfwdFAfxphWek+XB3NYZl9cJkSfn0c37ou7VVhuiMt8o5QWp/gUTC/sniD33TSGNHSgHwDn+8A8iwSk5T2m+aQfUVGzslr6tIec4wKD96Tm4ZJjI5l9qcwxRrRKjXUkf2P5s97g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=jFCSOBLp; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=mcOnPOVk; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="jFCSOBLp";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="mcOnPOVk"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEY8qP854718
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=BNUa
	Spc2JodDw9rxR4GGGW7OdG06pyMgZoFfby1Mvnw=; b=jFCSOBLpdH7xtzsKvzmF
	Z3SWoKtC/JrQHRB2OOmmSDxqYHJInOx19QNeup7MrvN1nHq+tcA0v2dSzTsEtmpD
	S1In7McHO8rQlPUlsCD4II+zgTCv5UhawZGtTx8GZ53t2VjEAtl2UOEegge28ml1
	M+RMT/PzpPPijV8UrJhPeueOeOBR5Kb6RDEwQihz3DbTI+DhYXCF7ly7zd0JjWij
	w7ca/+gmL3S29yvmJbqP+8LoskVhKEGuYcdGHqMYbyi29zDvq9lQ9KhYFvoIHrMS
	cV+F3LiqhHsKSSv1bQr++h9ywPhsdLmJYC4XUOtrlafRrqEdVE/1D+fB7Ke6zw5e
	dA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hatthjcad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:37 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-919879b09b7so116984146d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075417; x=1792680217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNUaSpc2JodDw9rxR4GGGW7OdG06pyMgZoFfby1Mvnw=;
        b=mcOnPOVkP8d7iHn7U5o3gTK8RVgxnRfDv40bKcDJ2NYTEpJfPLVpONXDkDGJHeI5pL
         hLt5tsrClt9Do3wrZ/0saP21r4L5+faor2S9llzae9D07CVfyvgSaOfaoACwK0q8rUuE
         NJSehfZsUgaDK0bZ5OpYjMKtdrWJ//vTi183Q1g4YQbkESh9AFoIU4ne51dz1X54YoAP
         lymMAg/gnq6xFmziutFToMW3SX+BaJdzziTOSJDbetGDEn2rF9fhhBYtG/LGDH6nHhuU
         wuP+rAxAbzp0UVfscT9K70vZq6n8+cCo087HRrdaZ77ocz5miNAqVKpwbqiWft1s9eEH
         JMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075417; x=1792680217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNUaSpc2JodDw9rxR4GGGW7OdG06pyMgZoFfby1Mvnw=;
        b=cxGhv0NmjqmISfOgUccvaufKp+Sr8ytat669VF75axmG/fXVEbXtmwEcS5eC8Ty1a0
         wmuwY3DncgC1X+N+DFeGy+9m3NtNJ5gq+LWUCM+4rDl1swroHcrtO2e+vWpxYfJL1k4a
         2LSFJO+JmaiVPF1ySkOPjJhH59ywVVkFvgRNuWQFous3/pQHyu7zCt6Eavb+H3qVjp8x
         0HldVbK17bh8+DqhQUImeJzLB2iBdHRT/41cnGiC700u/fuhsI9i/cObG8unIE8uCm3V
         Sr3Js/U/as8IV3mxtNjrh5foQYsaqwc5iK3JlgGLLbR1mjSlkKuXCwakHTHtpv55Zfd/
         SPYg==
X-Forwarded-Encrypted: i=1; AKwUvBxiQ21/6yZZotqxu9DkRza7et58Qo1y+zaUyeV/hhO79pVfKQYPOyD6NwTegC9+js4LHXvq/XxmZNVpv6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaOPYX9XGbpi+ELH0cHrmuCMt7gLHmomUFv3QvE0R49vrdhoLr
	oMnFlSfq7j5kGDb0WykScwiL42e0Bb4iW6Uh5YXSlCWYuKZG3iCRFMYqUnvlQ+oWeAs2coL8g7g
	pulseVeBaDHgP2vjSGKwLrMvEohwiDRib6bE8unZNe5Th/d+QUAqXLU4edQ4wEQ==
X-Gm-Gg: AYBFou2D3nqqVdupJYjSGSmYuIUOF4kSKZgsceroKRloji1exddV6t73jlJDdT/C8ab
	r18i5LG2+/bn2CHvHsZQIQOE/ok6ea0teyR+YZzd47nsVp0d2SVXY4VWnoFVmOxzJJ1fp8mAZdq
	nYusX+W2C+53FD+B/9GfHj6kDQvpTSjGmyf9LrC6K9htAc5y/OwMpLI3FfESauV1Pu8FLIFVIjh
	Sfj7zpaZbXWuJfaF54nksV4h1bEpWn9JkVa1eQFlKusekaH4EETfIccg0eH9g3G/HTaPqVwfLp+
	g7B2S4W8MxHPYF/+kPeqQOISujCRVX4K6Vuli5EZawy4ZjbXP98Bmfd48bvK8cL03ezp4ZyoIyp
	RkObY7RgAljnE0I3kv5kRc/ME+QuLWaUv5Nxgd15oirze
X-Received: by 2002:a05:6214:2dc9:b0:91b:5004:58d with SMTP id 6a1803df08f44-91b55578d63mr340314626d6.14.1792075416718;
        Thu, 15 Oct 2026 07:43:36 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc9:b0:91b:5004:58d with SMTP id 6a1803df08f44-91b55578d63mr340314226d6.14.1792075416276;
        Thu, 15 Oct 2026 07:43:36 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:35 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:18 -0400
Subject: [PATCH v5 05/19] btrfs: remove the free space cache endio
 workqueue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-5-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=5227;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=E4COQQDg9vZWBwsk35ZCQVIuOCq0S+iSgePUi1LEW18=;
 b=BAbyDK/wH5blDQ2jv94gGkx/Mmktj3kCZs7xKWnykLMCSTvaixzhmcnwn4rB6q+sF3onRLd3/
 BhCKFp5IGM7AkmKS/1NbGqgP3KJhihBKBZK8PtCRMbyZY+jfdnz0OuM
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: bjPlN5Pclj4du_RGqFCqPvNFB79nTlbi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX7A9dTHPDUrM4
 JzTmV1QyJOl3pgvi52KJFtVusaNcWNKCvi4sn0amLqcC7eMbbjZ72uz792CjtwM7fMrRvCgFbET
 l6H5uGXD6uh4dflun76hrnzm9wGe68MbUAch8PDpOVdfNpyoCEtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX7vIgnEsJtdWJ
 GVZDENvzl/KPJo979a7EuGq3/n6SPc430lhXOCrXafn12DaNizR63Ts3gzHLXy7qkQwvaM2JRXU
 Bg++bAr0hZRviXtzThpzda7yK7M9QteYMzft5Qdr7P7D4N2GhimlK4/DdJAHGd7b6gLjdCe7dxr
 8C4VBdFr8Ez20ElXhqblwGIAYwjjxOO6szrkLqqnFIaebSFzGXVfJz0QbXFI3HXoXhtwQrN2+i1
 xohVMeTzdbciqyad6ADy/S6IMqOAGefSrYcnN4XUAgW07h+pHFpTwqCqdvtGtTwc14UHIibGnA8
 4S5XQKzaPkjVay41jaGToFD6IysulCsixS2i59nVPaml59kChMCVXivBp/SkkDrtvo7X0r/nrLq
 ljz9Ffl0hlPcUdquoyVcqdYT2XxF8ABB7Wv8TjQhuA14CflSx2/zcCa7QB7NP7bC26TmMTAfiJc
 kMjWNiHOS/tXRmsgfDg==
X-Authority-Analysis: v=2.4 cv=WJvqzXsR c=1 sm=1 tr=0 ts=6ad0e699 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=MjXS7SgsmouH5g4WD6EA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: bjPlN5Pclj4du_RGqFCqPvNFB79nTlbi
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=10 lowpriorityscore=10
 bulkscore=10 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057

Free space inodes are no longer written to, so nothing queues ordered
extent completion on endio_freespace_worker. Remove it and always use
endio_write_workers in btrfs_queue_ordered_fn().

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/disk-io.c      | 14 +++-----------
 fs/btrfs/fs.h           |  1 -
 fs/btrfs/ordered-data.c |  7 ++-----
 fs/btrfs/super.c        |  1 -
 4 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index bca0b573fbf8..4056ad1ab728 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -1780,7 +1780,6 @@ static void btrfs_stop_all_workers(struct btrfs_fs_info *fs_info)
 	if (fs_info->rmw_workers)
 		destroy_workqueue(fs_info->rmw_workers);
 	btrfs_destroy_workqueue(fs_info->endio_write_workers);
-	btrfs_destroy_workqueue(fs_info->endio_freespace_worker);
 	btrfs_destroy_workqueue(fs_info->delayed_workers);
 	btrfs_destroy_workqueue(fs_info->caching_workers);
 	btrfs_destroy_workqueue(fs_info->flush_workers);
@@ -1991,9 +1990,6 @@ static int btrfs_init_workqueues(struct btrfs_fs_info *fs_info)
 	fs_info->endio_write_workers =
 		btrfs_alloc_workqueue(fs_info, "endio-write", flags,
 				      max_active, 2);
-	fs_info->endio_freespace_worker =
-		btrfs_alloc_workqueue(fs_info, "freespace-write", flags,
-				      max_active, 0);
 	fs_info->delayed_workers =
 		btrfs_alloc_workqueue(fs_info, "delayed-meta", flags,
 				      max_active, 0);
@@ -2006,8 +2002,7 @@ static int btrfs_init_workqueues(struct btrfs_fs_info *fs_info)
 	if (!(fs_info->workers &&
 	      fs_info->delalloc_workers && fs_info->flush_workers &&
 	      fs_info->endio_workers && fs_info->endio_meta_workers &&
-	      fs_info->endio_write_workers &&
-	      fs_info->endio_freespace_worker && fs_info->rmw_workers &&
+	      fs_info->endio_write_workers && fs_info->rmw_workers &&
 	      fs_info->caching_workers && fs_info->fixup_workers &&
 	      fs_info->delayed_workers && fs_info->qgroup_rescan_workers &&
 	      fs_info->discard_ctl.discard_workers)) {
@@ -4441,9 +4436,8 @@ void __cold close_ctree(struct btrfs_fs_info *fs_info)
 	 * to finish an ordered extent - end_bbio_compressed_write()
 	 * calls btrfs_finish_ordered_extent() which in turns does a call to
 	 * btrfs_queue_ordered_fn(), and that queues the ordered extent
-	 * completion either in the endio_write_workers work queue or in the
-	 * fs_info->endio_freespace_worker work queue. We flush those queues
-	 * below, so before we flush them we must flush this queue for the
+	 * completion in the endio_write_workers work queue. We flush that
+	 * queue below, so before we flush it we must flush this queue for the
 	 * workers of compressed writes.
 	 */
 	flush_workqueue(fs_info->endio_workers);
@@ -4469,8 +4463,6 @@ void __cold close_ctree(struct btrfs_fs_info *fs_info)
 	 * btrfs_finish_ordered_io() when we are unmounting).
 	 */
 	btrfs_flush_workqueue(fs_info->endio_write_workers);
-	/* Ordered extents for free space inodes. */
-	btrfs_flush_workqueue(fs_info->endio_freespace_worker);
 	/*
 	 * Run delayed iputs in case an async reclaim worker is waiting for them
 	 * to be run as mentioned above.
diff --git a/fs/btrfs/fs.h b/fs/btrfs/fs.h
index 649623c603e8..f1bb6c56c76c 100644
--- a/fs/btrfs/fs.h
+++ b/fs/btrfs/fs.h
@@ -712,7 +712,6 @@ struct btrfs_fs_info {
 	struct workqueue_struct *endio_meta_workers;
 	struct workqueue_struct *rmw_workers;
 	struct btrfs_workqueue *endio_write_workers;
-	struct btrfs_workqueue *endio_freespace_worker;
 	struct btrfs_workqueue *caching_workers;
 
 	struct workqueue_struct *fixup_workers;
diff --git a/fs/btrfs/ordered-data.c b/fs/btrfs/ordered-data.c
index b32d4eabe0ab..e9f1cbeb555a 100644
--- a/fs/btrfs/ordered-data.c
+++ b/fs/btrfs/ordered-data.c
@@ -417,13 +417,10 @@ static bool can_finish_ordered_extent(struct btrfs_ordered_extent *ordered,
 
 static void btrfs_queue_ordered_fn(struct btrfs_ordered_extent *ordered)
 {
-	struct btrfs_inode *inode = ordered->inode;
-	struct btrfs_fs_info *fs_info = inode->root->fs_info;
-	struct btrfs_workqueue *wq = btrfs_is_free_space_inode(inode) ?
-		fs_info->endio_freespace_worker : fs_info->endio_write_workers;
+	struct btrfs_fs_info *fs_info = ordered->inode->root->fs_info;
 
 	btrfs_init_work(&ordered->work, finish_ordered_fn, NULL);
-	btrfs_queue_work(wq, &ordered->work);
+	btrfs_queue_work(fs_info->endio_write_workers, &ordered->work);
 }
 
 void btrfs_finish_ordered_extent(struct btrfs_ordered_extent *ordered,
diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index af7aa9adbfc3..2b99c6400f92 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1264,7 +1264,6 @@ static void btrfs_resize_thread_pool(struct btrfs_fs_info *fs_info,
 	workqueue_set_max_active(fs_info->endio_workers, new_pool_size);
 	workqueue_set_max_active(fs_info->endio_meta_workers, new_pool_size);
 	btrfs_workqueue_set_max(fs_info->endio_write_workers, new_pool_size);
-	btrfs_workqueue_set_max(fs_info->endio_freespace_worker, new_pool_size);
 	btrfs_workqueue_set_max(fs_info->delayed_workers, new_pool_size);
 }
 

-- 
2.39.5

