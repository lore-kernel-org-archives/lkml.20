Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36A4B95AC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822533; cv=none; b=V3nlqcQVOGSZSDzyNRM8PxRERFW5tYNiohgAqStN0Fb3XMMzNOLU9Ix6AnkjP6XDaPY8CNKgu80cQWIi6LX7sAcmeyVBDVtlqDynDBL53LRoqf9qMyLP2uaFYEVPQcVSFcE7hQGDvl7fsG+rIZSSQkV0xo7VYwnw7EGjSBJf3dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822533; c=relaxed/simple;
	bh=t/1qXHqPAP/Urz20U/zIZ8LAIlub4sRCOV1AEiPOFxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJc5ovKwB076D7tsfmth+BWDeZIna39xVsCPqC5g387KR/BjrWpK0Ec40H1QIRx+AC5XWr8eyIMBzEfFFu4TJwGNrDTeFBAldW6Rgb6+iefyDKHIOEDFaDNb9jtYtVNRzXIshXwlTCNkppIZU6jLtlCrvcCQWJY2KXMYs65IEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ptiAvaWs; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=3fFseTHL; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ptiAvaWs";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="3fFseTHL"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CF8DHp572780
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=OarH
	MLWkaYP4TAlNUVRIlFRJzmzfQJVnWwIlyBQx2ho=; b=ptiAvaWsS/w9evX43PR2
	a0/y6CPAwXNM/W+j+tlLE99bJKJaYc7EOh+0l9o3ZoA2VdxKtxIqnF3D5gHq57tG
	/BDpJb19I2fVbW22DZngXaUxMjEQq2RT1FSSENM0IYsKSFPbx11UlP7H/lMHK6R1
	93nYebnO6CPBibibxgTsITxU7YkaUgi938hj6IDBX5wQBwBBG5GRiz5fd7LQb0ZU
	smYAUFphd61rMoHJ7cHeo4pgwUXFXF7jsBMLBs7k2bHYkMmM4m/wDXNLTMMrZkBG
	9YcC4cE7/szKpgZ05aahsTcQuUxX86qWvWDEJ2Wnjd5DK8SpqHTWlelTJXO3LekK
	+Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91x6rwd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:50 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104eedb5b0so80339796d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822529; x=1792427329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OarHMLWkaYP4TAlNUVRIlFRJzmzfQJVnWwIlyBQx2ho=;
        b=3fFseTHLmXq/eB3DKn9La2YM2xN9U5BeFtn32kfNyViMM4gDugZjb4XnzXS+48J3+B
         ZHl1YQZktUJrALda6WKlEA/RswBFyRCvLVXeVzMJyatASw3zujiK+caJRlmT4AFFSGra
         pRHU0+KaGYH5iwsU1fwULp5ZPI11zeGkppwk8pAVpRLRXBN+LD/0BmfgFDpjpmH/fuw1
         6OPHcypqjdklis3MbAd/dV1mSSRBiFxipNzScIw8AS+kM4PcFeSM6CPBoSzFMQ6ePZfM
         FGZIPwV9r/h1qw9s7WwdN9QMtJylh+xZ/eawfuKC9WGcaph2EC5WxsYC7sZ5MQKJjjCx
         LJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822529; x=1792427329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OarHMLWkaYP4TAlNUVRIlFRJzmzfQJVnWwIlyBQx2ho=;
        b=DNGz8PX4LX3iLPx+0aSklBSFRMKCL9OMYVO8//VHPVHHhnYq35A+CvpOfxz2B7/eze
         n4TK20b94pyvyp5tgjeSVoeh1+IUUYIqvo1r7OQ1uPmEZpGQH5c5dV6211Aod39JL5NZ
         kbpvBOwUzkbNIZePRevb/V/0yHKoqiIhh+CEzHl9X2ahU/wTfnEWfjpMDpcoWL5T6AAT
         fNdf5gj+xA4zrDv4Odhjju411HvQBjpfkHmWoBdWR85U5tju4x5cFsj7D8D8YrdUyPYJ
         49OLuKFeklEsX7TJQbhBRt1pBRb6V0jh2bs70iXii+vw+GqhJFbekBFvwiKqrprW4C0N
         bYIA==
X-Forwarded-Encrypted: i=1; AKwUvBw7t/7m9LkunqqietD43SWKjwLtGYDKK/Gnq7hpRrHpr09EJBqaQe2ox+6/SgdfrPwOaqMJhQi9rAH9hYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy1X5llgjnMiJeMT+fQL07CtQ4G4FZcU6PZWprVTmgl5AlZYsp
	TX/vHz4wugxSeMmCpJfS0tSP5X3kkvhUpXh46CL8TG8p27OwV8I974GJpOrhMTON01jrJx9fbH2
	S7rlCwvqOrjdC8Gt6FcsJUnHzmUQT3E1wQInCYyRELuZUz6YLN1LSTaZ/Rq0RfQ==
X-Gm-Gg: AYBFou1A5oc/a9Q8o9++MyriVJoU0JMrXGJWyqL+Fzye7TCWEcKcjqCYasctYUGas5d
	ixuhcozdi9SmSVI4cDF2PmJslJpK0tMBLhF4vU3gb119JvbcVrbjAdmY7sM14NIfvZSY8+LY5YJ
	OGc6fxAeG3RfvgORzrFICMkUgsuSW0gV6nRyts7IZ4Vg3pDGzbU3HzIAdOVKRcCFH4m70zTeFAt
	pnXheX6B/EGSEr/Mg5E1AhRvgDFT8amUU2g6kDP5KyjJIxiKWRRQR1qjqwNVvy/VR3mE13yIjCc
	jXJFqCPVntRN9ZfVbz5Gz2uyXDi/3/bh11GXRIrOjAWsQtrOTQvHxxnT2+iybe1KZ++FEqnw8sZ
	024B/aOGkrs7VwJ1Khn4zLhWp/5lQdjDBQEPMsZAWIQTij6Q=
X-Received: by 2002:a05:6214:5712:b0:912:517b:974d with SMTP id 6a1803df08f44-91b5557488emr176338006d6.39.1791822529548;
        Mon, 12 Oct 2026 09:28:49 -0700 (PDT)
X-Received: by 2002:a05:6214:5712:b0:912:517b:974d with SMTP id 6a1803df08f44-91b5557488emr176337696d6.39.1791822529116;
        Mon, 12 Oct 2026 09:28:49 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:48 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:23 -0400
Subject: [PATCH v4 11/18] btrfs: replace
 btrfs_set_free_space_cache_v1_active() with a cleanup helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-11-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=3991;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=t/1qXHqPAP/Urz20U/zIZ8LAIlub4sRCOV1AEiPOFxs=;
 b=yL9uEtTmT2DXy+bWkC+6ARKbVi8ANNoLpF7pxlXjWqrOploCT7kL12lOshU1VnLeQiFHOp+CA
 ngMrXNfDcQ2C81dkY66gVJzh8du5+IuqtfpQiMcC1rHoHJRM0li0vMP
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: 1tA5RSuBVvTcOaMrbe1zTSvXXxiwwvsU
X-Proofpoint-ORIG-GUID: 1tA5RSuBVvTcOaMrbe1zTSvXXxiwwvsU
X-Authority-Analysis: v=2.4 cv=DrDDa2/+ c=1 sm=1 tr=0 ts=6acd0ac2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=UPWLJQKup_2xIvwY5mAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX7lcfZk1MY4DO
 uxS4g7fPaI1q8FpXEnb9OEucAZgx1UIcp5o7RK3DbOGMTcEW16VGgBqZvTbv58f9gd1jmlzZbV6
 n/K00JPoyXU+0nyfZeSRPnVVU5yr2tGxt6FLUMLE8eUqa1wv0YnxVvOLuz3ipEX+T0bAZ8mLgL3
 h0RdP9UnSJFwHJOhUtHg+SayP54hQn24vFivJGe2MeqpNV1G4CdsU6NTsJjrLGWw0KpTM/i4j6B
 QvUJovsb9iVAzxPvG9CiGzB5eDBfaGnOr5HSihepMTheUVnSajiCPWvsKkqQIBp45C4ZNxVEr1s
 4WjI3Dg/SR2eOTIvLhXRUL3VCPLV6PfjuRv1Z3pL72gryvl4sVE9WR3XZkYY7V0UU8E9u6ffgGw
 ilmlex4X4NuLUdZYTr/SLk51lNa7dGyHoCaHTn6QQmP/WYAqAW3YPOkoc9zi7thtKAO0qe7UQXe
 ds8Uw7zVY355gd0KZPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX/77b08GYyvDN
 CgYz9OUTvxzjSVFCNfYQ6zRO68p/2NzPuYxhF9iXG3S5y0lP5wgoWCd6+1VkEk42WVgmySWescW
 kkUq6VMyAfCRzuS8wOw64ufs/FXn33rT8HP/rQdAhheHAepSmu12
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=10 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120065

The only caller passes active = false. Turn it into
btrfs_cleanup_free_space_cache_v1() and fold the block group loop into
it.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/disk-io.c          |  2 +-
 fs/btrfs/free-space-cache.c | 42 ++++++++++++------------------------------
 fs/btrfs/free-space-cache.h |  2 +-
 3 files changed, 14 insertions(+), 32 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 760d6c5b6b19..15339de1c186 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3152,7 +3152,7 @@ int btrfs_start_pre_rw_mount(struct btrfs_fs_info *fs_info)
 	}
 
 	if (btrfs_free_space_cache_v1_active(fs_info)) {
-		ret = btrfs_set_free_space_cache_v1_active(fs_info, false);
+		ret = btrfs_cleanup_free_space_cache_v1(fs_info);
 		if (ret)
 			return ret;
 	}
diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index e82216ebd5d0..4dcbefb0bfed 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -2901,47 +2901,29 @@ bool btrfs_free_space_cache_v1_active(struct btrfs_fs_info *fs_info)
 	return btrfs_super_cache_generation(fs_info->super_copy);
 }
 
-static int cleanup_free_space_cache_v1(struct btrfs_fs_info *fs_info,
-				       struct btrfs_trans_handle *trans)
+int btrfs_cleanup_free_space_cache_v1(struct btrfs_fs_info *fs_info)
 {
-	struct btrfs_block_group *block_group;
+	struct btrfs_trans_handle *trans;
 	struct rb_node *node;
+	int ret;
 
 	btrfs_info(fs_info, "cleaning free space cache v1");
 
-	node = rb_first_cached(&fs_info->block_group_cache_tree);
-	while (node) {
-		int ret;
-
-		block_group = rb_entry(node, struct btrfs_block_group, cache_node);
-		ret = btrfs_remove_free_space_inode(trans, NULL, block_group);
-		if (ret)
-			return ret;
-		node = rb_next(node);
-	}
-	return 0;
-}
-
-int btrfs_set_free_space_cache_v1_active(struct btrfs_fs_info *fs_info, bool active)
-{
-	struct btrfs_trans_handle *trans;
-	int ret;
-
 	/*
-	 * update_super_roots will appropriately set or unset
-	 * super_copy->cache_generation based on SPACE_CACHE and
-	 * BTRFS_FS_CLEANUP_SPACE_CACHE_V1. For this reason, we need a
-	 * transaction commit whether we are enabling space cache v1 and don't
-	 * have any other work to do, or are disabling it and removing free
-	 * space inodes.
+	 * update_super_roots() zeroes super_copy->cache_generation while
+	 * BTRFS_FS_CLEANUP_SPACE_CACHE_V1 is set, so this needs a commit.
 	 */
 	trans = btrfs_start_transaction(fs_info->tree_root, 0);
 	if (IS_ERR(trans))
 		return PTR_ERR(trans);
 
-	if (!active) {
-		set_bit(BTRFS_FS_CLEANUP_SPACE_CACHE_V1, &fs_info->flags);
-		ret = cleanup_free_space_cache_v1(fs_info, trans);
+	set_bit(BTRFS_FS_CLEANUP_SPACE_CACHE_V1, &fs_info->flags);
+	for (node = rb_first_cached(&fs_info->block_group_cache_tree); node;
+	     node = rb_next(node)) {
+		struct btrfs_block_group *block_group;
+
+		block_group = rb_entry(node, struct btrfs_block_group, cache_node);
+		ret = btrfs_remove_free_space_inode(trans, NULL, block_group);
 		if (unlikely(ret)) {
 			btrfs_abort_transaction(trans, ret);
 			btrfs_end_transaction(trans);
diff --git a/fs/btrfs/free-space-cache.h b/fs/btrfs/free-space-cache.h
index 29166cc09b90..f5f18e397b13 100644
--- a/fs/btrfs/free-space-cache.h
+++ b/fs/btrfs/free-space-cache.h
@@ -136,7 +136,7 @@ int btrfs_trim_block_group_bitmaps(struct btrfs_block_group *block_group,
 void btrfs_trim_fully_remapped_block_group(struct btrfs_block_group *bg);
 
 bool btrfs_free_space_cache_v1_active(struct btrfs_fs_info *fs_info);
-int btrfs_set_free_space_cache_v1_active(struct btrfs_fs_info *fs_info, bool active);
+int btrfs_cleanup_free_space_cache_v1(struct btrfs_fs_info *fs_info);
 /* Support functions for running our sanity tests */
 #ifdef CONFIG_BTRFS_FS_RUN_SANITY_TESTS
 bool btrfs_use_bitmap(struct btrfs_free_space_ctl *ctl,

-- 
2.39.5

