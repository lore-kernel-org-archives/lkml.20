Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52906386C18
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334494; cv=none; b=M8INyVSXf7mP0WrGIcrw0Q4RTEOgU+jlVB1uKsEfJK7sEEJZSyuElpdksZy4mi+155g4Y3rKCRok9KhXQe4Qhl3Qe0ukewxRSR1ESrbPHd7v7uqF+0KVxCH+EtS3HOe1MEB0BwD+KT7VYxcGFJBi7pA/7aoLU0Pn70TOiUjvzvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334494; c=relaxed/simple;
	bh=Qw6xRMsVJw4t9/S/x7rsDKrF7fU3/zyJMoJYbzy1IwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gu1nWA/Aa+iIpl+S9uwFwi4FKx01FQCtCnOEHFbIkXxtllrCasttV0RlSam5SpjGhkARAOGeVo2Cg+k8j2rtHP16AIy7pWOLiX/pe+O0ugBffcjt5dWCVeStUsX8vlEam1yCzLl7DoxzNQXJOvuDPHr2eNbDh156R5e+qufKqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Hv3lmAbS; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=wCin/d/4; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Hv3lmAbS";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="wCin/d/4"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKXjPa652269
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=8Wyh
	q5ssihSK9up1ann73uoMasXeNXwKo64Ka9RS2oA=; b=Hv3lmAbSlYoNgDU1tJP2
	RPzwjcgSE8v8B2pyvCdwxqFGx+WiVHGDqNneEqqnczeHZB1C8TQZe6+XbHa1EWss
	bFcOwC6YTO3QgraY/NMh1R6PeggYaVb5k864u9kGwfyV/CsYcfFO55EBA1pTfCOR
	Y5Zb7Lyc5a26yNZp94/7FD5AnIvt1PxjWCpJLUemnHC/Ps5tNNsw0EqPw7jtp3Y/
	qcWd+sLKqz8jERzc1yK2Rw4fmb3MiB6qCPQu09Iv56PhCJOvmgeu886UVEW0jk1G
	d068qUovcAcIWNhzOu50WHb1zN72QJmpJ5v2uRpmCfc+M2sOrJL6WdKZK8z67VSB
	bw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gp2mjg7wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:30 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530ef845909so26650041cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334489; x=1789939289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Wyhq5ssihSK9up1ann73uoMasXeNXwKo64Ka9RS2oA=;
        b=wCin/d/42++bHfby+wlc9z/U4646qUU5os22adlZKnFDXrlPLIHyzB96ssIQXSEbFS
         XhaYOEbmHc2iLB+8N/vuhrOyUm3KCDRduGGNEu6Se0zrDKV262yhQaVP4f8a6lrsb0n3
         MV+oAaVzEcJT6EBST68Jc4Uhcn+VBhalB40WgNfEL/eWrvt89b3Jzh5uxX9hCojH5pR/
         KS51X9mqzMaTQSrn7sHY2d2ubVJ7P2RAGHgOa5BDY5Xf43zR/6kouH1QNkFge+bEd+lV
         GpXX9ilAfiE410nq5R64WDrPBP36zZYkMnRkH0N/pA1yr9dR+aaYkU41VD0iwB8kgK1R
         II3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334489; x=1789939289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Wyhq5ssihSK9up1ann73uoMasXeNXwKo64Ka9RS2oA=;
        b=PnA6HJInJF0t921LqzD/qILmfGT6tx0lbUHcGSw8ctRI2GkDRwuVnIihwi0/B/sA4b
         MxAClnoh+IRfiOskac6kuaSfuxaMPCHGPoxyfJU7g5XYAVu3mGOPpLsW30llxrkSYe2n
         RuSMpylh0wLccSz2JDxrZzA1DFfe3kPquZN8CX82BKdKHuTfYaxh0JT2VOPBds80R5S/
         cTICmlfVmStQiKa46E/4MA0JI52B5W2FNPLvJD05XXIP57e+VWkoQaR3slJf0sQS/XEv
         LH7utVUU0kID50snJ54DgKCDKRMAwgyk8cMtPyDNdftNyVMAExe+bm04J0Z18o401kiE
         7ylw==
X-Forwarded-Encrypted: i=1; AKwUvBzZlt98g+5ABX7V6mnj94fgavqDqlPMGVDtEA1pFYLLvIkcUqywU0/QNm1LAuRdhUgM5u68QHWHAk2mN1E=@vger.kernel.org
X-Gm-Message-State: AFuF++nhLnyxkrVGRlhOXr1rhGlfwKKxPsMGgiHwbSgJk229QLahlgWm
	7EACfyhJNGZkXHmW4U+6+Ki9Nsu2N3tLNGaMVERKR/KvrQzzvERLPgK4t3sxkj0TEX7ubc2ysyo
	Ymn3shyjdH/CJqQ4L20WL75H09OWfqyNtOTOlSarTXGlGsITvAe2oZJtD4UIMPwEeRvnTw9Qm
X-Gm-Gg: AYBFou0NZWrzgQYca+H9QUFFkU3RwhGn8e0/+0UtjSoQf+GWTCuwFNokvmJS9Hqg877
	iMlM7ofqTGigXcYpL2mhJqoYR0eNU4+T4mhksVBav7RinV97RXrEUpSGmNJeiUQI+z0IKKHupW9
	CEGq4EgcBg0m82JfyBYwhwH0meTJf8FUPGRAIDoMV2NTOVUFnJXZUJPAQ6x/S3v5Z+XHggsvAvn
	cT8YfhLkGR6+Do6s7a4l2pvp2ANNTZz/qt2iCjtrt/aWFNSMRYIuF+Nqm6UU+YIqLQcooT7mWsD
	ESbLWcHIlP7bjIf1iaJZC1Qdca0tPiUtpabO4utHfefr45L6Ufcv2QrCtZQ4r9L8TDFU5Vh3Pkt
	eBlmDz2oyU8cOf1uMIYJJ76IRpQ0wOoxO5OqAJaaFUwNCXTmR4N7aMQ==
X-Received: by 2002:a05:622a:2617:b0:530:42e4:f282 with SMTP id d75a77b69052e-530c876f236mr268834061cf.43.1789334489447;
        Sun, 13 Sep 2026 14:21:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2617:b0:530:42e4:f282 with SMTP id d75a77b69052e-530c876f236mr268833671cf.43.1789334488994;
        Sun, 13 Sep 2026 14:21:28 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:28 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:21:15 -0400
Subject: [PATCH v2 03/16] btrfs: remove the free space cache endio
 workqueue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-3-186767a7e106@columbia.edu>
References: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
In-Reply-To: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=5247;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Qw6xRMsVJw4t9/S/x7rsDKrF7fU3/zyJMoJYbzy1IwE=;
 b=qmNOH8C/39Y7ZBnAqLnxFxa0VekU2u+K+Cv8RGX7D0U/nxWC2+AUDko/sizVzUdMDG8WflsvL
 /pp0RPcmnNOBdWed6hk/izV4Bcyo76bUTV6n8vWu5qUhnT3+YAECr7s
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=NfpzRGD4 c=1 sm=1 tr=0 ts=6aa713da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=MjXS7SgsmouH5g4WD6EA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX0H5HB3jvpFf8
 gIdG6bi++jBZwj7AeE7YxK23AzZoybKERX3wjC3PYFyswN38G5LSW93djhMPtyPWuRiQxqTdrjN
 jYrRND06oAJMM09IXHIDxmVupNkDWpFLOLR2m3gnJWeZc1cych7soup+Ymyz1AsuVxDec+IAoEr
 ccW1+BR5lTkOuCVkJ5+YUlYOCHIJ1khQfe7f/2rR3kIfLo1/3JSXFRG3BYoUrR61Jr8GZfDwiYr
 gNxd2YlQTlYrGQKNIT5tCSRBrMp9SxaKX9WYsF/7ixVcTdChXuDnqB2qWfDDg4I7r+p6n8KNFkV
 kQljOAwsR78nuSKqTXRE9B2rv0BFt5Jm84O9fZCm/rg9T3zLhNY8vRNY26pPrNDzsOcTgNWFnNK
 k1q/GRKGPCvlGjZHTRB+K58jj+yXDbVuxPkWAEm6Ay1eLhBvQgCPcv8eDBVXNNhpt0/gsc4pzYy
 /5a5a2gD3NbWiTZPIzA==
X-Proofpoint-GUID: KS0_Y3rlSULU6Y6r2ns4Xhc7iBJd9dtX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX9eSb5CY8FKKd
 kdnUGphK+jN08u1sOdGkQadT73PmuTbXolppVnE1OKteO0ITf3Aj5P5nCIM4pfsqX5P7q0+sISm
 iBgtJpi+aT7BriADAZxr+HfiVYtKirSWMk4JiMGD0mIDj3FP5xMQ
X-Proofpoint-ORIG-GUID: KS0_Y3rlSULU6Y6r2ns4Xhc7iBJd9dtX
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=10
 clxscore=1015 adultscore=0 lowpriorityscore=10 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130304

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

