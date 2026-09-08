Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92302931DB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830408; cv=none; b=t2K0JXtSNBGxh6bR1Yk2SBB5VbjwDiwX0KtojG3FTqXKBHB2IY3rp1ti4/Oj81Ka3JOkSzETS2IsoxwIF4hRKW3IEJkxEOqGSA4Li2l84wzVDJdQFbWDU85TBiwh7Iq2otW9cCGHfa2K/IWFmeK7subJnUjegBVd/6L05OM4C5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830408; c=relaxed/simple;
	bh=WHBgYoAZXTwZCTC+uPtMCS1zTe/PB6K8lKFf7fwynMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOEQIQWGNuPsw+h3a8EARgUrChYa+W7efrDBB9/IJKlAiJBUuOyurUu1pBpOSj5gThcOvwbs+4UFc0wcY0YImcYkHKx2iQIa/wLC/ZmZ9spQUCrCvoH8ZmYG/Hdcuxj1YZCpehmThklTYMf7unyCJOOgDqL8n5VfqXH3pUYjcqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=HAzrSIqs; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=4dnR6moc; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="HAzrSIqs";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="4dnR6moc"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880vdkY728471
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=b/ru
	/TkXYN6eZiCH1AP2YAl6cjgL8CV/iP5cVwKSpSI=; b=HAzrSIqshd3kUlIxVKjZ
	0Xj9Qe01V4EgliYPF97DIjUUV6HilIMMD5wSkq2xV/wXluHQGi89tJQwqgEfDc4N
	UGo6nhE5c8BJr8tV7iXML6vwO6aoAMOc0WWPnyXpj7U2y5NmNsWK/X8M6/HkbnOt
	uoWw/sGV/HfgzmvNv8SP3BeoqErPJkUcTovKR8kYJrrv8VbHhSlANLddDJotWUZu
	ITLjEfYdezECiUxK5K95n32a5sy63ALyA1shp5knJnqhlnsspXHUVzyJpYrSMbPK
	mP/J61DQRv+lWy0+1GnTpkjYVc3ZONMC59cnkHfBLVe3+vOWb3N9t+2lyzvRfdyN
	+Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d596m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:19:53 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91055aae7f4so26110906d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830393; x=1789435193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/ru/TkXYN6eZiCH1AP2YAl6cjgL8CV/iP5cVwKSpSI=;
        b=4dnR6mocSCx+9maVfQRZrMuzcPvUG57c1OXzn+CmV8HkFLvYuhtV7cc1IsfnDvdklR
         kt+7UYrlApYdkPCOSQxwDJmK2EJtugmQ6gujTrm/cGoFQWXM4vvG03yp8dmTdUNc57IC
         wSGzaMD0E/xhTKszW3T41g1HVve8eFGyUOaWwm3civu9hDMrizdo889r7jIYigSCxdS/
         bvKZGVYb2o8YPPBN6LwRlzjYpxJ7QCpC3ByVpa1saPP6sm3aXg52WRmkmtQwD+HRYd6u
         QoXuw+iduUiM/F1tO6mLAXaY/+ltzSGTkQhHEgNxFkodJpYfth+Hij8xCTGfFs/anLCI
         411Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830393; x=1789435193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/ru/TkXYN6eZiCH1AP2YAl6cjgL8CV/iP5cVwKSpSI=;
        b=DCansMYRfo4jmv8awE+PXvKflOXiPifiBPDfL7DkYhgUBO1qZhDliEY7xZYsGt95MX
         ueE51WiV5QnAVqNYEEytXUiPf7zwY00c1X1nfXcqwtoP7w3SJubGbU0vFUS8plTaMymM
         Y7YckrmRWCrz8oP3zY36X72tmbwX6fAegEpeYzvj5d1kqbrfzC3BssBa0ZIUDgijmgAq
         Cvsn2O+cYhFQmSTylC72GvDjbO+qchoH35u+ozhvDtRgQyvvT2KZedwvUwUX2a0gXSEu
         IfjZ6cPySjTDZ7W2hGiYrn/g2+wAru2C8XCMTpdKatMri/BtNnfobb03rSn6gNiOkjWd
         Yjyg==
X-Forwarded-Encrypted: i=1; AKwUvBwOaxXfVLPu3kkY3myEGlAY6R3HJRU5UvdFXBcr2GjuhtRLL7s1zTokBl1TQLBpHB1MAACjoDFx6wvWxOc=@vger.kernel.org
X-Gm-Message-State: AFuF++nu3EP9XxXrgU3XQJtHDKEqJnmDrIpkBxNPoQn2H9fuFFFycr86
	AThN0KPhf7VGxw1oxJ2kuHm4u0JzNx8qz6GJEfmJzDLksQBLBlbKbPjQ9OBwOsk0Oqjsw5HCstC
	4njbg4L5Ea8XWSgNKvoGTP15puT9hdh4HilOglHlL57V4SBm/VVkiYduvDpHKsA==
X-Gm-Gg: AYBFou2DqiABZtuZ2DObOYGl94YgT+K8VnAHPiBlyzfvVX1VQp6nfQA05nqxD1UwOuJ
	BykPNvJVOBuK+NBWyuZJQoS3AEQ/Cosm4rpvI6NW0fe7eyVBghzy/LIvHC1o+twgNLltUUUsqyA
	IGby3bpcCSfcfPq1zCKpabmyhdiW1kiuqf7azmbaVIyeFEdv9JRgbrtCV063zoo9A+UNQ0D4/6J
	Ldml0iUw/W/XwLgiwzvqKPpB+oeBLGElj+Tzc4v+SvNayjC4XgLBpVnULMFkquIhZdQBnclThod
	FHzluAeUUdVqx5ic4mJFafdI2MprEk+H2ga+nACyYzA9YgOZk/lZgilAp77Xi8fALELxblcHhz3
	FJ1QKGT6/ZtzZcbsGK3nhuo2vyHKayFWsWaiPNXuxsNze6LTL1zw=
X-Received: by 2002:a05:6214:519d:b0:908:4249:337f with SMTP id 6a1803df08f44-91061f8ebebmr51385516d6.5.1788830392826;
        Mon, 07 Sep 2026 18:19:52 -0700 (PDT)
X-Received: by 2002:a05:6214:519d:b0:908:4249:337f with SMTP id 6a1803df08f44-91061f8ebebmr51385076d6.5.1788830392285;
        Mon, 07 Sep 2026 18:19:52 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:51 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:18 -0400
Subject: [PATCH 03/15] btrfs: remove the free space cache endio workqueue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-3-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=5247;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=WHBgYoAZXTwZCTC+uPtMCS1zTe/PB6K8lKFf7fwynMI=;
 b=KfvF3H0DYALECmAJ7Lr2+u9y8nClqhPe3e9RldNbYCRcSDdoukRBdB+7H5Q1RETwfxaK/+zcT
 cGVGMzx25lCD86yoZMV02JeZIFe14CNXEucc1CcPG6poR/P2kZGj7nk
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX2IbQrnfRpKfj
 1UdKwTmBs6ja4idQw5lyoWKUFyP6dnsG4XP5OkIq+/xnvgCh1oeqhI4wakd49Gw/XOgm5VlDvlg
 9IZ4N1k2nh04yWcPYc+RiwGNfh72KG8TPP79skAIwh5q3oAQPTQ4+goMA2u8wUToMozH8L89eb/
 dROYgJfd5jSXJZ97530D9L45odmRaNammukZRsEMF0YL21qWVKLEmGVldNXpeCaY+Yr1eu9KE0K
 3E1jLTIs4Vxmzr/28yUDqRvM9KjRDV+e+iRAtSV3HPvyMpvJjuC75xeVKN0V80MgwF70FOtlF2a
 DpVXo8cE8pnEdcjOV3O7uYSDfXpu1RidRaME9V/Nycis4S1byaETPsZxv+bJunb1hkw3hl5pWkI
 nmA9+JEkpcMHSSHfq5KxYPPmDNKDPwSPD+J6kf2lHNaBRxSVRMDnG19aZXVfvgPWb+c59gLCqli
 hLcR9DGP5EsJzBi0pKw==
X-Proofpoint-ORIG-GUID: Occ6xp-h6sWUr-aQztY4koSdDRT4Pu7T
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX/81e3uhz0AQP
 yk/8TRS7eW4CWl6idms91M+TBc2DRO/55d342upLbBMgNuq88gktLl9Z7seGhxl4mYJQzExjt03
 TjSbtOwV8UfZwcvlQYtirig/Ko4CG0ui31vZMz7/4xCJz7S5ZP4D
X-Proofpoint-GUID: Occ6xp-h6sWUr-aQztY4koSdDRT4Pu7T
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6a9f62b9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=MjXS7SgsmouH5g4WD6EA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080011

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
index 28c0a4a8d008..1cd44a5c193f 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -1782,7 +1782,6 @@ static void btrfs_stop_all_workers(struct btrfs_fs_info *fs_info)
 	if (fs_info->rmw_workers)
 		destroy_workqueue(fs_info->rmw_workers);
 	btrfs_destroy_workqueue(fs_info->endio_write_workers);
-	btrfs_destroy_workqueue(fs_info->endio_freespace_worker);
 	btrfs_destroy_workqueue(fs_info->delayed_workers);
 	btrfs_destroy_workqueue(fs_info->caching_workers);
 	btrfs_destroy_workqueue(fs_info->flush_workers);
@@ -1993,9 +1992,6 @@ static int btrfs_init_workqueues(struct btrfs_fs_info *fs_info)
 	fs_info->endio_write_workers =
 		btrfs_alloc_workqueue(fs_info, "endio-write", flags,
 				      max_active, 2);
-	fs_info->endio_freespace_worker =
-		btrfs_alloc_workqueue(fs_info, "freespace-write", flags,
-				      max_active, 0);
 	fs_info->delayed_workers =
 		btrfs_alloc_workqueue(fs_info, "delayed-meta", flags,
 				      max_active, 0);
@@ -2008,8 +2004,7 @@ static int btrfs_init_workqueues(struct btrfs_fs_info *fs_info)
 	if (!(fs_info->workers &&
 	      fs_info->delalloc_workers && fs_info->flush_workers &&
 	      fs_info->endio_workers && fs_info->endio_meta_workers &&
-	      fs_info->endio_write_workers &&
-	      fs_info->endio_freespace_worker && fs_info->rmw_workers &&
+	      fs_info->endio_write_workers && fs_info->rmw_workers &&
 	      fs_info->caching_workers && fs_info->fixup_workers &&
 	      fs_info->delayed_workers && fs_info->qgroup_rescan_workers &&
 	      fs_info->discard_ctl.discard_workers)) {
@@ -4455,9 +4450,8 @@ void __cold close_ctree(struct btrfs_fs_info *fs_info)
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
@@ -4483,8 +4477,6 @@ void __cold close_ctree(struct btrfs_fs_info *fs_info)
 	 * btrfs_finish_ordered_io() when we are unmounting).
 	 */
 	btrfs_flush_workqueue(fs_info->endio_write_workers);
-	/* Ordered extents for free space inodes. */
-	btrfs_flush_workqueue(fs_info->endio_freespace_worker);
 	/*
 	 * Run delayed iputs in case an async reclaim worker is waiting for them
 	 * to be run as mentioned above.
diff --git a/fs/btrfs/fs.h b/fs/btrfs/fs.h
index 3eba8438593c..441b315e8a98 100644
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

