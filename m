Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F3399011
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334505; cv=none; b=k1owmMw2rmxwu96ggUqH0B9Ts73FqsfN8aBYPBmhG5fFZYhp/5yLmt5cQ2ml9pVzbP29ZMhYKX+H1dHBVzkgQnogmlr/UJEj41Ih3w9JZHeuxLssnNnUQFGvBpSo6Um4SCf2FXM/3AZm+HkIvYwYKPxQcJaFZ4Bktp1bDDdhrek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334505; c=relaxed/simple;
	bh=IxPtZs7YmG0KTAjKIomldxp3suS2xlB2WlerF1Jtwhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViIRDI6ua0bqmsatlfLoPoqJggtIpfr+xZSXOW/WIBrP++o8fwr0YGRDIl+v60seiSXJA6XaNsIKAcNbMCD20cA0JJmvVPgaaCtZ5uytRYXLeIfpFWL27Tvf9+YUrGczuJsEHwZJLVMMFWNpgxawB8DEmWCy+uGWIi0QPS53uX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=p6ojGcLn; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XlTi0WyK; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="p6ojGcLn";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XlTi0WyK"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKYWKV635253
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Jdph
	n3uGMtosHUIIlsCZR+S+zVxJ+iV/LKrDbHMNan8=; b=p6ojGcLnacZaWlqJxM8m
	idUPiStf/5BtKyU95PGAXHmuF9+lzN610mKtM/kNwgDMiEwnscgistSHyAeLRuaL
	eOFvZWCB+79CmS1wNqwqgJhduXz9N4aZPYV/GuvOE+1ppF8DQsUI8KmKpJgOMQrI
	L0AlJVyVNzfnKFkUOhWTuTvnyhofKM9NDCptcTKvGkVNXfwaEnPZLG6jBBtq+Jqs
	qgVNmkXq0l0ZkOyqEuwLXijAB4LePSUMbVJUF3qYK5ZBkoc7c8mEWe7n5eV+UTOv
	Heip/B6j+a3/6eW4RRe26FcrWcEZrJz7mY8aD/YZBh5MkmaNxiG19bH1jmaiwWbp
	Vg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gnwac9nx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:41 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8341cfb4so58078516d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334501; x=1789939301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jdphn3uGMtosHUIIlsCZR+S+zVxJ+iV/LKrDbHMNan8=;
        b=XlTi0WyKr7KJ6YyYVAwqYHbPrtjc2uWgUeZZIUt7L43Ip9617ShTAvgq81acLEXJFX
         lhczWzyJZx73qIC44aS+TYb1QnIxByRNHpjFpK1j/U/pLCKnXQ2V4FvnpVPdn3e+7IHC
         w473JVTEHLslKHl/a1smw9PsZ4VDfxegNlC5QjHfFPTbi9z6S3IeXFDNfn8jU1AP5AHh
         M4EzK+eJpD10xCHFEp7mby3CYT0NDZMSkmHJDUOGYkWJdYh8ZgkvIx0hO4+ZDyWvF56l
         r294shIllc/UwCoXFVTsbpTdB0iNoaH6xbxQKOIjqWcCv56tlblxjn3Fodm7n0BEYudJ
         ScVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334501; x=1789939301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jdphn3uGMtosHUIIlsCZR+S+zVxJ+iV/LKrDbHMNan8=;
        b=eb++eb46ikNG5X49opTB6PvkDV2OyH/oey4Js1TYVrQNYJKcm54QXW9MkM3GVY8baP
         +BAmymsnZGOIcE7s9PTlCy9qNDhF4nfKxMPCWnBU3kg4OwHhimfPLd4luXYFY6LQiMZY
         pTvd9qIOCIxNCz7Xz/7waXtUZiw2T31+KrS+rUEgusyAxnrWiuVicQgEJY5POAqUS7pW
         Gi9ubByX4hQGON8bH19bS21ta6pIe7K6YgL4TRM7BlZ2SqcRjaF1W6pU87pn3yIJKak8
         pg6B3lRiKTNiuM7XNGBuoAX+WOuO26qwCBnCZu/EVeZ9+UVKX5KQXxklvSIb9dbL8sMJ
         6gsg==
X-Forwarded-Encrypted: i=1; AKwUvBw/QF5I0kgMRV8BX6AoX7+udBPpy+3uBV/0tGMuBpXVcSFt/sOE1dkSrNNNrl+vs6ZUwlZ10Y/DIrC3Juc=@vger.kernel.org
X-Gm-Message-State: AFuF++ldtdChitPoaaTxDkWIzOkwPmWPoCAWvii7WE5TB2gye/CTOsS/
	PTIu1mNgQn4irrBOCbuiM/ZQM2zV7+Vpr50oajEmv4fnyq3AHUc7E1zUSBshxZ9zZ5RGixDAEqO
	xkHij6mVvVfaWmJbzcWYLm5rUiSiJQFC4dI2kAoPKNBneo60JcydGEgQwIVz+GQ==
X-Gm-Gg: AYBFou307/rd4SvsmHiliyqKP3xTNAuB2YuYXQsy58V/OuZQRHXTa1shdyV5quP8dVT
	d792OfN3aOK2uNSfd+cwB9OmXkRd0VOzfQumHKjbMOqlNMUNLlLkmdJHI85yvMo1FNepsW/zWfj
	wKlf9Y2Ye957utzVBVpyObZmXdh9vV2a7UYvPL+Gg67K8U6zfWEbisI986fwtSsML1JHAU0eX+k
	0LkjJUBlQJwlNXxlc3S27ULEDVB2QMh0BixUD34Zsdyo1xPmyyaKRwyMHYLAqaWAA6SD2gJfJlV
	34bWngDbbBe2gDyAFZ+yy9qObRek6hTo8xrQb/x4W+mKuLc+NKM85ccAIMLPDmrrwZ7nuRhDAUu
	zO2e8pnm6SzmwFVtLhAvZl6DejPtMaFZ+QgwFBqxOq4fcRFICltwugg==
X-Received: by 2002:a05:6214:2307:b0:910:722f:b8b with SMTP id 6a1803df08f44-9121da7621emr122538056d6.21.1789334501265;
        Sun, 13 Sep 2026 14:21:41 -0700 (PDT)
X-Received: by 2002:a05:6214:2307:b0:910:722f:b8b with SMTP id 6a1803df08f44-9121da7621emr122537846d6.21.1789334500804;
        Sun, 13 Sep 2026 14:21:40 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:40 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:21:27 -0400
Subject: [PATCH v2 15/16] btrfs: stop reading free space inodes from the
 commit root
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-15-186767a7e106@columbia.edu>
References: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
In-Reply-To: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=1999;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=IxPtZs7YmG0KTAjKIomldxp3suS2xlB2WlerF1Jtwhs=;
 b=HwDXp2hZAq0UmkVROrNFPxKx1jq+lektak8Bvum3837X4k8O1P211QiJgEpv+APy4/X0vBUSg
 d5RwEzlZPqZAW32Br8ft6qSbpRkneztdVNIf8DMdNUCeslpHrOHW12G
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=BqQIUoX5 c=1 sm=1 tr=0 ts=6aa713e5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=F-rX_8kjA07mH5tGMmcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: qOR0l0kZPhQYHARfNwqUr0Ojw2E-kXEy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfXxux9gYLaM0os
 YK7LXnXrMoiRwlfTVT9Vi29h6XJqBAigul6cYeVnP39QQT954262J6La3+X+N4a5Ej6B4l/1HgP
 Ml8zCNfs5TxXrY9KN4EuwiwSEhq0En4wsludrQnDo+DhOwgyFZm5
X-Proofpoint-GUID: qOR0l0kZPhQYHARfNwqUr0Ojw2E-kXEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX17Xyuanpnxt6
 gAZTtoB8NfjPZf5a5gmUrXlhVv5s5u9QF1bmAgddG41zbMu8dgf8Cqpyvlpmj2Pkkh36siZWOa1
 PSHsO4DZjNgS3CXGortrpTLykHfInjP7vfA56LcfW3/1CoZ6qgV+i6RtSgDP0Hsf0MdQdfhGJM1
 I2N1Bk5fnCq7mHOnh3cRNQPGg2fpoldgs3DFiBhc2d3CCxgRCQV4gBHA65uyu//3RROOGrIIGYn
 iZNwnz/WfLZwRxvgl33oubG2CnVpr/xozfUtzifNw1L7cc26Z0qDheeAy3/Tb1offFvzCdb8uof
 ednzAydjtdwZUuhQUP1OvYlWeJtPqPAemr8J7Kzv96Kuq3OQW4TUiNqKdc74VDUfBsIbANzTnCu
 xI2sl750/VMm9AiUSqHT1tAq/wGUqMO4tlyUrq/m6jSjgPReYcrBpvJadP790LYftWw1TByDRWd
 s+BInc+X2tpbcL5tlEw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 impostorscore=10 clxscore=1015 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130304

Free space inode data was only read when loading the v1 cache, which is
gone, so btrfs_get_extent() and btrfs_lookup_bio_sums() no longer need
to search the commit root for them.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/file-item.c | 11 -----------
 fs/btrfs/inode.c     | 10 ----------
 2 files changed, 21 deletions(-)

diff --git a/fs/btrfs/file-item.c b/fs/btrfs/file-item.c
index cf50fd623f41..484c04de1af5 100644
--- a/fs/btrfs/file-item.c
+++ b/fs/btrfs/file-item.c
@@ -396,17 +396,6 @@ int btrfs_lookup_bio_sums(struct btrfs_bio *bbio)
 	if (nblocks > fs_info->csums_per_leaf)
 		path->reada = READA_FORWARD;
 
-	/*
-	 * the free space stuff is only read when it hasn't been
-	 * updated in the current transaction.  So, we can safely
-	 * read from the commit root and sidestep a nasty deadlock
-	 * between reading the free space cache and updating the csum tree.
-	 */
-	if (btrfs_is_free_space_inode(inode)) {
-		path->search_commit_root = true;
-		path->skip_locking = true;
-	}
-
 	/*
 	 * If we are searching for a csum of an extent from a past
 	 * transaction, we can search in the commit root and reduce
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 89b50d4e0400..163f26fe36e7 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7230,16 +7230,6 @@ struct extent_map *btrfs_get_extent(struct btrfs_inode *inode,
 	/* Chances are we'll be called again, so go ahead and do readahead */
 	path->reada = READA_FORWARD;
 
-	/*
-	 * The same explanation in load_free_space_cache applies here as well,
-	 * we only read when we're loading the free space cache, and at that
-	 * point the commit_root has everything we need.
-	 */
-	if (btrfs_is_free_space_inode(inode)) {
-		path->search_commit_root = true;
-		path->skip_locking = true;
-	}
-
 	ret = btrfs_lookup_file_extent(NULL, root, path, objectid, start, 0);
 	if (ret < 0) {
 		goto out;

-- 
2.39.5

