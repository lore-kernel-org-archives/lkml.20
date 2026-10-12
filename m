Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68284AFE0D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822525; cv=none; b=rJvkZd3kQwr86zzlQxWWLZ+mtzIi9imTxzBuCn+6kx9HFfHMlpeDialSC6nSAIzTsh2HVHkNcyZe4KUQ1nEziXBRJdrjEddSW208Ii/vhs0xLIpgDf/zvVcYVFdT4+61uskHKoP1J+WW3DOBW5w+4M3lqZ48hENtbz28P7Ym42g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822525; c=relaxed/simple;
	bh=HM0kG863nALWo2LU7I/5mFusEGvdqK8xeBt9wQky1yM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtbTgqFtKjn83+1rF1xCjFuRfHY7rBFFww3BTRcWbv2isdAC7NhK6mCJy69M35LpVLU3OENw7d6f7sYsbBQpKBBCTCC/BHQAGN5Vp1hOd82BaYgyVIGo4I68vYDbJOqeHnFICYNj1RBQO9wMpsB6ymwBh+SqLfXyUkMgI9Y7nrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=VjsG856W; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Wgbs3PV4; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="VjsG856W";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Wgbs3PV4"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CEgXcU1408507
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=J0hL
	krZWHtyiCOUzvShBFbzxLiya5oHSsSlofEfiEOQ=; b=VjsG856W2tz+mvNQMcUC
	gfYnbK38Kk8YcS5IWob2pMxwVAq8R8P2AEQA4JPtWl3VQQcScqcphMaPCBdDqssg
	M09RV/eRM2usVN8PlTB23pLfotwHeEiCPwEiL++B0uXE+rQp08pEQ+oQg0Lwzl9O
	Ou64wx/Nr6cEvdGhm0ziRlRujPvlNlrsBAX+SCcecWPQg9piaypWMB9kJhWwzKUO
	QkXXJvTXqlmQljP+2WTIE37LmziKqChRKTAikGY1kcEcAEqvza3iPQV4JvfJqTPq
	uLPOoXS5vXYr7yLHM/l13qgC1LOiwFlqcI/1CaqH7EZcKq2KFik9UqgL7UUq6M8r
	Sg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h91hc9738-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:41 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104eedb5b0so80336266d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822521; x=1792427321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0hLkrZWHtyiCOUzvShBFbzxLiya5oHSsSlofEfiEOQ=;
        b=Wgbs3PV4bEW3fhA9JiljynQWPVB38zl0NcEMnaePONfoBtC/PKzUFMxA5wq4FJ+nM1
         Cp+7xtQ0Oa23mJ/WD5aSn2cIhPSxZKAnL+3vWoZkCHEFwmtBSfRUatd+AMIGgIdEikH+
         Vgj8JiB8AqlxLQaFEyC3Je7mN1BN7wMcRH4ApC50scltH5wxsbqeKAMgnSAaO6IDpPJI
         Obkzfgb/rabtTXdpV8NVIEfDL3NZrz8RjzmNOqIym577L9i0oTS8sGFPMeOD0e0oAuzp
         L7AHe6HX9YzmSNstn9/6S2qH2SEWkeWZqsQfjiCYr74qdANgNdzhJzOK6lBojZmETiAo
         +2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822521; x=1792427321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0hLkrZWHtyiCOUzvShBFbzxLiya5oHSsSlofEfiEOQ=;
        b=xw/08JQO0OQgJ1rMxbvln7BK3ed5mMQPd2tDQQJm3OZVHNR3LWDmU1IKbgXxCfM8Zj
         zTRpd8+QXMMG5vkl5wixgvhLVakhD7SyGLPaPQDz2P3vqnlGBLMWgUDnrCQkuAF9j+Cz
         i6eHbfNuRHREfNHSw1mtdRkdPHtSGLam6vYziT+gn2+o2jyhf++UlyOI3U99pTiVVfQ0
         ptZNxhv0KapzH5CyHUFJULyMlx3YOB9AlJFLdXMFQuKiVK/Fqmf8yzGTmIHGOoMTC8jU
         mgum4idT6C/cRnv0hCVtfxKmFOb5S99l/2+rYsJzZbQc4D5ekoQJsRMgdyr8XKwRkOvR
         cgqw==
X-Forwarded-Encrypted: i=1; AKwUvBxDAuzhFC1GIP9LNd+eDPsTQcEJNZHudCz62Y4QSfsEeNhJSCkpbsP3lXnZ9Mo8EJZ1bZ0Sh6ac3gYiYLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOzhTuGMPJiGbnQjw9qP26L6uBra82R56ceHZOXjH2Bj+rHA3C
	iM+xMK6hESM1Tba5RFKeNEy6ibDJYxYlnsEcfE/dk1duwVU/FauK7vRi3oswxWbKRtBjIas1/dX
	qWneiW/sab67G06VIIyxOUxpuk+zXXswjozNyxngTnxx9OoMJb27zh5/tbNXEGw==
X-Gm-Gg: AYBFou0IfSMxD/mERjDErBq4FMXv+e+vnG5Smz6TPL9CiHkDZzjCmCn2CpoBgNozS6+
	8JYwZZUlKU7oMoCv/IrkuZuj0dOE8K0xQ8mNee1lXIkkF5MC+QZ7yraDVNxVvm6nXJGOCGhdMfh
	L+phWD/2mq7R2XcrHpoC2ddDQRr4JR3YOrEUJdp8VMgn7e9vRf6DJSH0OLKv6BrIZG5epm7FOD/
	7fDeV7Z0spjX0oTcKwswZcKd1KKWeZhUSMd5g2FEPeICSdp6dXKnDERG0NTwREy4OKI59qyIFvb
	66jsHpVadn4PP8TBkCZhkgGrthu+zK17nheuUZBqvCFU1c/nMy5riN4d1q2gNjALZrHm73Ubuj3
	/5wOJ3qBBQdQu342bKvgyZ1JanKCkt8loQNfSRHbJcEL+ufg=
X-Received: by 2002:a05:6214:c89:b0:919:8962:5400 with SMTP id 6a1803df08f44-91b5556aa16mr184496106d6.36.1791822520730;
        Mon, 12 Oct 2026 09:28:40 -0700 (PDT)
X-Received: by 2002:a05:6214:c89:b0:919:8962:5400 with SMTP id 6a1803df08f44-91b5556aa16mr184495676d6.36.1791822520290;
        Mon, 12 Oct 2026 09:28:40 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:39 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:16 -0400
Subject: [PATCH v4 04/18] btrfs: remove the free space cache endio
 workqueue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-4-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=5227;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=HM0kG863nALWo2LU7I/5mFusEGvdqK8xeBt9wQky1yM=;
 b=Mn9VMLsexrDYb4AFPbfmhQB00Kyd38L00gzO/b3MgFuJS50K47lP+TtyVKWwm3euXYgaY4xxB
 hjBz50oFPkqCv2rsmaDPf4uD/AnYax1o6Z6JI326RCPEevF9Gtu3gMe
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: MPIBY8bFDrAop5LalC_Isy0KASNptJkn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX5ASD/nCkUtDG
 qZnNaeKN6dm0hReL2PKO28eCCDmm6jiipYA7lKmPtXWgzpB+53PQXPwUevIKBOrUSlMdZeX/bA2
 VAszZWZL3FlJXF1h2ckPYpHl2dpYa2J42BW6In8igk87taDZcUyA
X-Authority-Analysis: v=2.4 cv=Wue+otfv c=1 sm=1 tr=0 ts=6acd0ab9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=MjXS7SgsmouH5g4WD6EA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: MPIBY8bFDrAop5LalC_Isy0KASNptJkn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX1QPumec4w5sP
 HThvlomqulqqxgUHRPmVmsisHjDYwyBnb7cEj1V1MiSY2YhbqCXoiUNK/nlXdaK8xBi1aXdHxIy
 niRgdKsD21dGS6qNEu/9fAcDdGwYmNfNM26kc7v6jb/zi16imyeg5BpA3L8H//L4nQkZR1Za/sW
 L0vC11avID1Qq3M4LN6Mqkxgnn92o7kZWyGbiMcLadaNXdyH2fDoLqZBHHuweocxvJkhJy0oR2G
 shryWzqByghiyAO88pWgfGg4jc8gShrlti0P78V8KAGUzv67w3oi55IWSIz2isz4w8W1W6kN8LB
 mSP4D60mbstZyx6BiFXTEboqx6eggh/r8Tq56ARdT9Q+vc5FAVyOl1eqghSjDvJwmh2iMiI5OZW
 wRT8iMkRH1Vd3KaVELjuYX9KZi/TeC06oZ5gHg24Eclw5h9TMukd6hpkTfWXrjG43LIx7zVNqEZ
 bMmD7fdszpDe02xUPwQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=10 priorityscore=1501 lowpriorityscore=10 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120065

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
index 387ae8f23015..2c53daf5f2ba 100644
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
index 1818b947c528..871747ea5c14 100644
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

