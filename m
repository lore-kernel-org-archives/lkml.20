Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F632BFC8F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830413; cv=none; b=ji8gZPIL7M3X80QTHnpJLgjM5EoOlMN+XS0u9/t/taS00BGomEibNFmsfzd1xsEE+yKcgfPqhGR2LT7Ucu7R9PUKs04wm5UZSa468NPAV3NcLCCslmO1WbN8O55fNnHXnhdTUnXcLx+ZJ8hY9H/HDLM/Mt/u6j8LN/SqpHKsJPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830413; c=relaxed/simple;
	bh=uRXhIq8JuDc7ZnZybb1E+rJV/7I+xejnLysvOyYl/2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NuMBYnoI3XcQTHmOdmtz0TWpmqe/3/u7bmT6vBDO2GlyBdWhyQcGxgKDF10SZOdzkzILZgbUAqNeu4Zll/au5sZ3klqGt/4y3KxrYODMv4VBiT/AOycEpqys+Uue8065lywropFWIMMWDWjQUp5lSC7g3ahlFMILz2VIIaLItls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=vDMhrSXY; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=1eQc/NTZ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="vDMhrSXY";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="1eQc/NTZ"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880vPSE3906634
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=go07
	a57UCk9Pq2FzfkEchcYzQG78Zi7m+LRKf7xN4yU=; b=vDMhrSXYOdl58U+gwRWT
	yplTBj/XR8uZFn0G3hjZoJl2V2E33sPgLT68y8mkxOx8ofKA5ymQ7X+MitAskDFX
	FaaXe9UicFqI5KtjZKCTC7l7cj2Ff7ab6M20fkJOYGxbEdTpdGx7vZHAl3ARL4Vq
	dfRrXMSP1KnVxYkgXwjM84lWcJkWmZuLFF/DPu+VC6qoKd6bokjO3q3u1qlhuSsy
	3DS7z1rtah0BB6nW0LrGm1ENcO7HdyTKdKDfHxpqv9ywAoDtJqqVeK8NrIUoMY5R
	3B+X935IgMcwqjK+dNVpLLJbYinFdzKX6B8zwlMJiDIjRQSj6DNxmMJUHmMFT2RT
	eA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4yjryf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:19:58 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90f8b463ea3so44127746d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830398; x=1789435198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=go07a57UCk9Pq2FzfkEchcYzQG78Zi7m+LRKf7xN4yU=;
        b=1eQc/NTZAEGqOiKQN5kOf2nwpBU4mWCeVSmXFbbOoe9sggJHpLXtgqZaiRiL9QPY+N
         1+ah3PJewtrGBo6u9O8aPtQPoGHP+kMe7MN2JU5gvqrxxmbT9JR/GPUNoquc1KOZmKd/
         m+iIAkQPjK+qff/aWl4z/zbETyGFLLEGn5t1LJgkdtKo76cMy+9Y2Q07WlERaA0vaoD9
         7ZafNFTAJQSjun7l1F7WJHlBVeXttvMlzBSGFEBzUCgEche3usT8lRojR1OlHrLe9ByI
         zZ3egna/Xy9GmbBxzbguFdEFk2nPMJpNcarhXVtyzJOusxIFY3Zwgw2ncN/ZwvKHz3/N
         2C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830398; x=1789435198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go07a57UCk9Pq2FzfkEchcYzQG78Zi7m+LRKf7xN4yU=;
        b=Glt760PYUDyb8FLUwiSmV3rlfCG6Z7I2QZNqUzIZKQPiblnPYf46QWgpYO6CT7dIei
         gQYHbeQ5YYfRZ1rcgZM6qHToKTxJZBgxcViypMpHN0u/nKX3jfZbsBpjzJu/VG5TOu4v
         ZMXEea8pmHsEXRV2kECa20nPpVC4kFOUeK1JNFoer7QtqzmkbRNRngorDZ339TFRTz+z
         fVoRtS1l7I1z89lAfcgRrmOyWbhuNNnCX7uVa9ZsW5rNT3MH8AC0X3fvkJ38VnY1vbOG
         6Ip8hR/0KikSiZHzBSyAXOxGhhD7kCPH9Lb+vZh0HgygTjdXDZrYcShRne7kNmK/d/Sx
         B6Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzjukQy6EDlGFU6QVf8x5rsFcnrjMwj5ZfVhIy3uOR5NlABaAzNHJGurTWxASnPTMZO4itsVl1Jn0TmWBw=@vger.kernel.org
X-Gm-Message-State: AFuF++kIV+2DlXmZHPBCGrT+7+oq5Az3ZkIQ0fLGmfb23t0asA9Wvcfe
	wlRCgKqF7FmMtibWjs6Q02hmAQl3tdBQquFJNKPUbmtyssKlIBs5beuskzC4z6qUGzo+vS9KQtw
	/xlQT8XjnpSb6fPR2WT3XYVOaDgJaY4+lqu8PRe7djEWkRbwa+j0bpsR6RyLaUw==
X-Gm-Gg: AYBFou2ydi2F8AGnavFepQ7zwnvTJe4xQKUt41ByQ9xW/3rxyoc0FCMo7/8+HTPpTkS
	yGhYEfuaG18vdnebS2ZRPXDVz39XD+3zuBv5PSlQJsLhtJHy2jO/77VAcKKXIF6OvOYWJRPsbdf
	Mzac+H5sNr2RJqjaIqBaB3v0nlPtl7cSrNuSgCJlLHwBNz8rTj3b2zPFXqf8HaG0mNkqofgypPE
	VDHX+ozE8v7S/RRSVNmnrHWdTwlUsn6VJy0lhcCJtKAxphUBFmB7h+mADjiyBBHl6QfSMi2gvYU
	Nan2eDLdUx9ACKIat6jFWavl6zKCPIin4IDmqpLvsAzaJgB/c2hCYhjhuXc3057+mY7G4AJInmL
	Lqht7+90K7wY2+VqcZLrcAENBpNcSBPBHN+fxOzMdQ+UrSRn7SPI=
X-Received: by 2002:a05:6214:1c09:b0:908:23fd:813f with SMTP id 6a1803df08f44-9103ef9fa90mr353340736d6.15.1788830398243;
        Mon, 07 Sep 2026 18:19:58 -0700 (PDT)
X-Received: by 2002:a05:6214:1c09:b0:908:23fd:813f with SMTP id 6a1803df08f44-9103ef9fa90mr353340186d6.15.1788830397796;
        Mon, 07 Sep 2026 18:19:57 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:57 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:24 -0400
Subject: [PATCH 09/15] btrfs: replace
 btrfs_set_free_space_cache_v1_active() with a cleanup helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-9-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=4011;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=uRXhIq8JuDc7ZnZybb1E+rJV/7I+xejnLysvOyYl/2k=;
 b=YODK7yZhL0cLUSPhiNY+Dz6+ZXmm2SbO1tTVO4HGUKvrKSzeX7/45JzgbqGlqk8X2DXMcHtjF
 co/jilrKuRrBAGYiHqblaKYsaZmwwOOixMiiOQZEA88GVUtuOeZy+su
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMiBTYWx0ZWRfX8SXTmExyeU7y
 RoqpBh6jD9AWgBj3iw9ORiuFnkvGyqLgy8TXEtBfoix2nTiDJGYK3cYD7k1c3K0Cabc2VnMd7oc
 nNCndwUEQr8IAyK/zp4kP4JP5sczQYpyDAB86PxqV3Y7xlbopHThKQrEF1AYW7u7mtZzgFfULGe
 xPwldPvCAR2r1SZq9YKPsHYi64YpaeVBipc3p/iKVgKCtNTofQXCE/3sroNekRHdz+U1MnyNaJp
 XQM9Ho6kM0SYacrW7xPCIAd7WHjk2+GCAPN4BYXX55G/HfAtCQ0yiEfa7a/Yn4GNRTHw+bhA+WV
 MwPS28AHSIv3w33dTdK51SET+foqZielIA3sm5joS+RTcRh5Bxf0KgOYHvZlOUC0GQ8kX5g5rF0
 WnrBLLlkXkACfSRpSKBA0A7BLZJUmiVyKjVA+2iDIBbOYmC7EgKVWOijLbS+Pogqxww7rBWB47V
 ZjYWvpnHmzP1teWMydw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMiBTYWx0ZWRfX3U0Vf7KJtnom
 dstdSrHabFTOenS3r9hMasBM7kX8JmwUY13oF1at1oLOmYxSzKCaOiwtNsOtO7rGKimdZvv5UhG
 6dYZJIVPpIt0kjgGSrmNFvOrzSUoO9rLPYv3ii7IWyBaQrzMdrZH
X-Proofpoint-GUID: tVSfNDfuMJEimVydS1YdY9AtjNebB143
X-Proofpoint-ORIG-GUID: tVSfNDfuMJEimVydS1YdY9AtjNebB143
X-Authority-Analysis: v=2.4 cv=K/QS2SWI c=1 sm=1 tr=0 ts=6a9f62be cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=UPWLJQKup_2xIvwY5mAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080012

The only caller passes active = false. Turn it into
btrfs_cleanup_free_space_cache_v1() and fold the block group loop into
it.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/disk-io.c          |  2 +-
 fs/btrfs/free-space-cache.c | 42 ++++++++++++------------------------------
 fs/btrfs/free-space-cache.h |  2 +-
 3 files changed, 14 insertions(+), 32 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 99824a25057c..bfd7815a461e 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3162,7 +3162,7 @@ int btrfs_start_pre_rw_mount(struct btrfs_fs_info *fs_info)
 	}
 
 	if (btrfs_free_space_cache_v1_active(fs_info)) {
-		ret = btrfs_set_free_space_cache_v1_active(fs_info, false);
+		ret = btrfs_cleanup_free_space_cache_v1(fs_info);
 		if (ret)
 			return ret;
 	}
diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index 57991a413f82..a36d0465510d 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -2898,47 +2898,29 @@ bool btrfs_free_space_cache_v1_active(struct btrfs_fs_info *fs_info)
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

