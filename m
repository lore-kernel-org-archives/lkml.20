Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F23BA225
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617639; cv=none; b=ZOt8ASKG1AQAGWeRsOlFUedODMJYcv2K0Ia6exGtdngbEqicyalHn/fpaZor67ePovshvjtv46SrrdxMr9Xk3pS32CXgop0IQZYIwBH6SnW1AONlUCoXY+HXh1RUSW3tJMCzztzN5hEQruuZOiG53jl9Z5l0DefhZZrBu8E/wAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617639; c=relaxed/simple;
	bh=Qw6xRMsVJw4t9/S/x7rsDKrF7fU3/zyJMoJYbzy1IwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6pNepJaPZKpx/p6lkQKSUIzDctfl4e4bsZNVBcCyyCDFysb790H4PoBH/bVwKJ91B3MtJPJIUDRYp8+22EjLptlkd1PYVs+OymW1BpzqnXNGAFL9uCuR6Jd5Sf7oCpOJ9OvSa+L+a6JS421IXBflf2g7gNdkrLkDxC64AySdms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=apSsgkXl; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hIj4kS3l; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="apSsgkXl";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hIj4kS3l"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2ZK7F204163
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=8Wyh
	q5ssihSK9up1ann73uoMasXeNXwKo64Ka9RS2oA=; b=apSsgkXlAh9X2JgCR4ww
	6HmnkALubGLmamzLpdJT/eL679VPyYBV8CbXv+UlWzoKLLaKx3Pw8ov0w2EmEYnT
	3OuarzE+rR2a8zzok66F1sZdZ7dHRF/VkIv1mPdeauxkJd8QJZSA0rh9Mgys2Hv2
	kH5cHsc0WjiDPfiB8AJI0wN3ZCuPXOJP7f231X2VGTwQM85ytw70QN74kR27Xz1/
	agWorIZiWLVRpC/bN3DpkdeGvKHduXRk7CDQWnImvZ94xme5gIKxrb7vVTAhp6+c
	xZUmOO0XFvRdFKZN8MNXvZKbFfpXZNb90YUSvLmtJ2kDGoeDJ5kceZ05T3isTO4o
	qg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr1x6adnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:29 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8135d7eeso6520026d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789617629; x=1790222429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Wyhq5ssihSK9up1ann73uoMasXeNXwKo64Ka9RS2oA=;
        b=hIj4kS3lj9CC20xc2cgPaqTbhMMkdIkx0m3yOrtLDos0o3AoILbIPgGvFisi5nlMwv
         nSUKtwH3LIMMuYjgGTStMzL446Dlld6IOJhsxnOWpxqoKTOGmtPfkk69Nm5aoilTbeCg
         p3tBksSJZqL+7h5eGQYet64CNGwddLZS5bG3azgwa5+qfFLymDe4GTbJ3e2UfWc3ebJ1
         00EDkB6B2WVWiAxJx9SO6eUGQZDU7j0MiI2aQSY9q64dg2jJ54hd2kPWCn/Tv188q7BL
         FVTn3bpal1zSS/YLaVxcrDB5ltbVYV0nCcOhOczb/54MzDEVTWo5kZkgDm7VISJLXxnH
         LuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617629; x=1790222429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Wyhq5ssihSK9up1ann73uoMasXeNXwKo64Ka9RS2oA=;
        b=Qdd5qpsVfw06GT+WrbCG7ab9U8MmofuJlLHzWZq9N8TabISGPeUsEJi1gOfPM8DW/U
         uzSYLSUWcKHQrx3imj39oNeEIbms9MD+3lisgFhzxiL8JBaneMXuBtfSJ4ndskmhY3La
         5fhFXq7LpAuAGh27C+DIYv5R/EG4rc4z/nU8d+hiTvWfCCwTJrvqArf1ax8mqG39PQ4U
         obo2G9leV2HtSvoif97MyKAtAuVElqWQsvPedAdDHUyKL9H+LAkOLo4MQTHnUPo0saUM
         iv8jilICH+/Y/g4L4TxiuviwtCv4RycybxFhceZ1/sihczpr3Inj1DCmt/EiLaUwgQFd
         jrhw==
X-Forwarded-Encrypted: i=1; AKwUvBzdPThnjyJqRY6ghpawuZLhYQt53Ob4CMWaV7d0v7YGLwYDEiKxk+yCEu2dCjkbERhtcVUvnM+irei3XmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nbdMp25N+pPCpeeMu1RE5TO5gnyloK1jrY+lUIn+u8IUmTUdaK
	B2ZZuYu0z0zHxJIHMDcoAfpKy+pyztACemDVKNSn78pMkAoAahIydPZQGNxTYTk6AaewyZjJyu3
	rX09DZ+sXEDnXAb21U0J0husU3oHcIu/xj8lv6TB0pzHVPOyIOjvp9jfqR4S/Auy2RGHqgQ==
X-Gm-Gg: AYBFou02jLEixdf+uaj1Nyjuh5hE1Qd4iVGqGzag7vEh50W6gQGXup5A2hi1nz1HY2m
	jxnFct/Rce6XGDA4IOOsA4yVVWWzk7vgPPYfhUz9IYePNd8EHohDrgL/4MD9Ri9tE0OY2/bRIIK
	rL9kHOZC4ksyN2gxcaF+Fnve1IP+kBR5S+B6nUgvxWLpnpMy9lBCCtUtHxksG8imgUDiTx0Qq5z
	S4vFk9ztrW+AoDK/9J1YEH9ahTOSqwRZjQ/OdbzK+wR2XWQiwFs+m7C9VMCMSLZs3FJC/6+mnxJ
	FzIaFr8y9i58g1aBG/p/HwwbXBpWqL/R4eKYWdD18yEuO7QmRjeV0WmB6Lg5sc6oszwY01Ke/MQ
	LIx5bOOhYs6nEyroFE1UdJgadp6bPLvvH//LGEe1e4hdl8A==
X-Received: by 2002:a05:6214:b6b:b0:910:314d:7cbf with SMTP id 6a1803df08f44-9123d7b2e0cmr89801656d6.28.1789617628641;
        Wed, 16 Sep 2026 21:00:28 -0700 (PDT)
X-Received: by 2002:a05:6214:b6b:b0:910:314d:7cbf with SMTP id 6a1803df08f44-9123d7b2e0cmr89801366d6.28.1789617627992;
        Wed, 16 Sep 2026 21:00:27 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm41748766d6.35.2026.09.16.21.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:00:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 16 Sep 2026 23:59:59 -0400
Subject: [PATCH v3 03/17] btrfs: remove the free space cache endio
 workqueue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-btrfs-remove-v1-space-cache-v3-3-10ebde03b96f@columbia.edu>
References: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
In-Reply-To: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789617622; l=5247;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Qw6xRMsVJw4t9/S/x7rsDKrF7fU3/zyJMoJYbzy1IwE=;
 b=lEwhxP/guWCrFpcpCXoP7Vk7fZplOhYRwkkIXJ0zPlDOtvHXM5rw17xJbZrlFOePnHaECdYFy
 WEQ9Qu+5qWyCQBz+ctEDUc5mO+g9vsbxIcih79xm7wsL2pn8UcnJkYn
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfX2tBPKDtDbPrG
 UV1aqgccUhri9g5pSqQ2hKhHN7gnUXf4vR2e51gKhfZ5OV4Fcxi3/KuAmkqGGjE6pRnWrSrwrko
 rM37114AXEWc+hAs+WSF6uhLgBZoGRORBmFFONn3vVrWT9Q33l+p
X-Proofpoint-ORIG-GUID: h2hcI_f6OHclauEYj24gc5IIOTUkmns5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfX9vNAyJOhqRLe
 zG0HELOcsWaDzZbqF5ouwgAmuo+7FJkEKoMVjBOXwIgVc6z97A+zFrF/iZyprCRQMTPezmgtVkJ
 89f80wqlw0uB/S/CBRBR8TRR42ntX87UtJWw5pFDRFWNRQidDICTtc81LSuNqFEa5U4Kb/RXGHt
 EBiERrxWCZaz4496jmO58PsQNJA+oUUFl+iGOOjQmQnAZj0jxtpdsPo2gbfRBJeehfiNFkVC3wA
 9iMe2yg6h2+4NOjvLxpYHStlXMZaY5LewPMSJTZD/yfO2hpvt+QIk0pt55igpXNNYLFmyNZdMXN
 BJkogTMT8VUdtEELm1C5rWqlZBu7oy1qYxDPhxEqVo/IXt7/1QUxbUtB8hiHQngNg6pi20Nemdf
 /338mFw9u+z/wiJMZoG3qH34UW+wwhp2maUu+ALHp8o0sIiuEgF0ZzU0WBBB/9Xt1sBvcAoGBOX
 GNII5j/aJ3NevQDXsoA==
X-Proofpoint-GUID: h2hcI_f6OHclauEYj24gc5IIOTUkmns5
X-Authority-Analysis: v=2.4 cv=CLS/zhrD c=1 sm=1 tr=0 ts=6aab65dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=MjXS7SgsmouH5g4WD6EA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 malwarescore=0 impostorscore=10 spamscore=0 suspectscore=0
 lowpriorityscore=10 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170047

Free space inodes are no longer written to, so nothing queues ordered
extent completion on endio_freespace_worker. Remove it and always use
endio_write_workers in btrfs_queue_ordered_fn().

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/disk-io.c      | 14 +++-----------
 fs/btrfs/fs.h           |  1 -
 fs/btrfs/ordered-data.c |  7 ++-----
 fs/btrfs/super.c        |  1 -
 4 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index f544c457d4ab..f256a91f58b4 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -1769,7 +1769,6 @@ static void btrfs_stop_all_workers(struct btrfs_fs_info *fs_info)
 	if (fs_info->rmw_workers)
 		destroy_workqueue(fs_info->rmw_workers);
 	btrfs_destroy_workqueue(fs_info->endio_write_workers);
-	btrfs_destroy_workqueue(fs_info->endio_freespace_worker);
 	btrfs_destroy_workqueue(fs_info->delayed_workers);
 	btrfs_destroy_workqueue(fs_info->caching_workers);
 	btrfs_destroy_workqueue(fs_info->flush_workers);
@@ -1980,9 +1979,6 @@ static int btrfs_init_workqueues(struct btrfs_fs_info *fs_info)
 	fs_info->endio_write_workers =
 		btrfs_alloc_workqueue(fs_info, "endio-write", flags,
 				      max_active, 2);
-	fs_info->endio_freespace_worker =
-		btrfs_alloc_workqueue(fs_info, "freespace-write", flags,
-				      max_active, 0);
 	fs_info->delayed_workers =
 		btrfs_alloc_workqueue(fs_info, "delayed-meta", flags,
 				      max_active, 0);
@@ -1995,8 +1991,7 @@ static int btrfs_init_workqueues(struct btrfs_fs_info *fs_info)
 	if (!(fs_info->workers &&
 	      fs_info->delalloc_workers && fs_info->flush_workers &&
 	      fs_info->endio_workers && fs_info->endio_meta_workers &&
-	      fs_info->endio_write_workers &&
-	      fs_info->endio_freespace_worker && fs_info->rmw_workers &&
+	      fs_info->endio_write_workers && fs_info->rmw_workers &&
 	      fs_info->caching_workers && fs_info->fixup_workers &&
 	      fs_info->delayed_workers && fs_info->qgroup_rescan_workers &&
 	      fs_info->discard_ctl.discard_workers)) {
@@ -4442,9 +4437,8 @@ void __cold close_ctree(struct btrfs_fs_info *fs_info)
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
@@ -4470,8 +4464,6 @@ void __cold close_ctree(struct btrfs_fs_info *fs_info)
 	 * btrfs_finish_ordered_io() when we are unmounting).
 	 */
 	btrfs_flush_workqueue(fs_info->endio_write_workers);
-	/* Ordered extents for free space inodes. */
-	btrfs_flush_workqueue(fs_info->endio_freespace_worker);
 	/*
 	 * Run delayed iputs in case an async reclaim worker is waiting for them
 	 * to be run as mentioned above.
diff --git a/fs/btrfs/fs.h b/fs/btrfs/fs.h
index 10e15a319b93..96cc8c50af82 100644
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
index 77443ded6db3..b44b16970a62 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1243,7 +1243,6 @@ static void btrfs_resize_thread_pool(struct btrfs_fs_info *fs_info,
 	workqueue_set_max_active(fs_info->endio_workers, new_pool_size);
 	workqueue_set_max_active(fs_info->endio_meta_workers, new_pool_size);
 	btrfs_workqueue_set_max(fs_info->endio_write_workers, new_pool_size);
-	btrfs_workqueue_set_max(fs_info->endio_freespace_worker, new_pool_size);
 	btrfs_workqueue_set_max(fs_info->delayed_workers, new_pool_size);
 }
 

-- 
2.39.5

