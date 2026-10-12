Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF764ACC94
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822531; cv=none; b=TXZr2ymuKBI+gd8XuqtN6rszVlHlnuQpYi6MzTOy5dM9s4e9sQwhCXcU4C7BNw6Zs4S5Y4mh9TU3yvi0zXsQg0WAZ8MAvMqS3qisyWw1SAurcXwTIyUr5qaG6yamWiI4TBeTSuQkIImKIq/TLEXU88vyjQ2hl/PkKzna+gKp39o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822531; c=relaxed/simple;
	bh=xz/eUxWSLQGEF7yMwwilbqy52E3ccetaEbs7sL8iTZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kct/lfa89w9ffG72XJuDzBtsZG8NBx8UEJ4qfHMIjtGJVDfdkWglD7V5YvGKEmEV7+4i9makgkEX9xPD1zQDQJqhPxrMKb9I+9eKCQXbamw+FjO5D3Xak14EAvyhPiCVdZsUDs8YDKFv/Yj7jbTolfgejh1s6mudHJhn/wpOv+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=gGZdTUTZ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hIuG0d5a; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="gGZdTUTZ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hIuG0d5a"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFpg4u778707
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=x5Ba
	yiKUccbl9P0IWxyeRBSPHnBzDZBuckkhjQQW+fE=; b=gGZdTUTZMoJWL6Lp/Io3
	cjEjFwOMk9uXIIjlc65dMbn206FB4DAUA5ii/Wnyas57He2wx0vf0HicwgqYglcd
	/q3K/hbDjFSo+A8n56ONFtjm/nlCDuRBPZJNfOIY+znHkhDDmI0o7WptIKPuwEaa
	JNYKoT+lwyb3j5LTVKLrvTa+3/T3L1ajP6YwC8M7n8neKMxt+UzIqDNeaL25rWkV
	zW9IHML2jPMZWHI/nwRNbkMxsKG1YHEijQqpGPwuJqKiY2fJcAwyFNsHuG4V/fqB
	N7kZwNEgz4b428D7b5AviiHzphwg3jKsL28usBzjZEC1IvvoCm0/6zdIi8I1IMrd
	EA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h92jh0cpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:47 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a7c17166so41864236d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822526; x=1792427326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5BayiKUccbl9P0IWxyeRBSPHnBzDZBuckkhjQQW+fE=;
        b=hIuG0d5a+kdMJsC5h1EzzHaMka4VPEohADGPTwn6hXUIJGwCFvuHaVKDuHjCDkItEm
         GsiWpPMEHtXFMQABREnkhwHYEfiC4+SA7+6/2twpjZYUeQsVuurj7Z+5FgL9KUKpE8LN
         oi4s8Asyi7U6RzR2LWGX27g3Zxv9FdA9AOOs/O15CES7QA8P3HJR9jnr3R6xZMWJVyO4
         OSxY64GR04Uif1A7gVZZEFijhzAM3Ff9Hy47BWeHDJ/8pR0q1rCr+wGYkpKhsD1zuOEz
         0BwPD0hNDEDNXVy2AulsMWfaWod/Dd2/KRfJA2UIg1rnjnEc32FbqEVoxzPHkNrB2gwp
         y88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822526; x=1792427326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5BayiKUccbl9P0IWxyeRBSPHnBzDZBuckkhjQQW+fE=;
        b=XnqD0h42KBLdv8Q3ct8bCHXhnbQzAktW1CdGzBf38Ut/O8MF2w+8nJ1Q32NiR6MXcj
         TSOIjNU2EflaDl4QPwCbjxB/SLtZlaxkcHoht0IBcoICAvFGPYR2vOhpg+dGvAbAp2Xn
         XkrNnCcH63JEWWkXtSUyY8PipI06UnzQ9JXRng7ihP8aGnLFZPtmUfhoNFo6UZy0yP+Z
         lUN9LXP5hHhtgFcxsH0b6nHtAvwksrqDybIOKBN31iRKfw2+BWRHv51PnjEiVPBk4fmh
         sYu/T8I0yVsad7cxRr6NidSOTL32c7+6ekj4rtBFmgLNyslSmOt2m+iNDJud6fdt3sts
         Vyvg==
X-Forwarded-Encrypted: i=1; AKwUvBwguf5rwSxj5IDzHOunDWFVbt5xkq6USZ6WCXrGlGGp9H1Gi9zT9wOBzXIQAxmKgIwj7P0oCzq/D0xsYIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6lxjn4k0wgvL3HcqKpUflBZZddZYHEx7H5xrLAMWWxc7ObPlQ
	vfunvL2j8mWpkHF5SRFXg6ZgFB6tpMTxOCDTwFTLnxzm/dJmzGSGAuadVc+mQEvIScOomrencNT
	llUiQcIoHjXcjPvJgV/Yd7E77MCRU9nwm9m1rIKA58qL9z1HaS6m299JjoNOCgg==
X-Gm-Gg: AYBFou2Qmz5b2rl96MlNdTyhBCmcd3ymyGZxUfWdghqwBhXpn4gVmStC9p5tRavhBqF
	2cGT52FMtEPcDMobX/8rronJU7yrtXmcojraO/G30BoZ2uU18YS6kUyVoxJRZzzaGAnHHFYh82k
	sbimYQiZ1Y9g2rapKto1f9Y+X64gWTE9XLBdPa+943BEwhdVe+JM96jIlv5nC6JRPawe69NUptH
	Os/ggAQda3grjNrbZ0y/V3Uf4ZMgyoClBmnH8R8RPg20ivP86qwccucDS0bUCxaiLbOKcx4izfd
	Eteag/iJpmBCm1DEPZCPn3ctb6nUvn2Bb4r3EtWNBEWdKuiJjkhB7VxQtUFSyTn9qQP71czPHEQ
	i3my/bEolfsHbiDnNrph1eYTBaoIYnuSYD7Y4TVYxe5qezck=
X-Received: by 2002:a05:6214:2524:b0:915:bec:310b with SMTP id 6a1803df08f44-91b553124d5mr175697436d6.5.1791822526624;
        Mon, 12 Oct 2026 09:28:46 -0700 (PDT)
X-Received: by 2002:a05:6214:2524:b0:915:bec:310b with SMTP id 6a1803df08f44-91b553124d5mr175697056d6.5.1791822526147;
        Mon, 12 Oct 2026 09:28:46 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:45 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:21 -0400
Subject: [PATCH v4 09/18] btrfs: remove btrfs_disk_cache_state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-9-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=6218;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=xz/eUxWSLQGEF7yMwwilbqy52E3ccetaEbs7sL8iTZs=;
 b=D33OghbuknqpztJVyjO11wRi/9MmBfcJCIBVydKjAyNq5K6RyObGkmb8CzPv/RI0UzfODMUTn
 aPavoRxM4IzC+t2Y2YiG9flYlgoK0RY70nsYLmG98znp6qv2P0HRn3/
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: 1xaEdLeSKC3XTXe0bHaLxzwJlyqnggL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX4InjUWfZ4TJo
 VzluxZzzOdiQEVWT589yhQIuXQHD0Y8NeBgZXcg5EsVJWDybcwkteGVTecvd/t1H9A68h7G47yY
 bPVR/XjtBMxQiI6TL6RzKu9+0ELU8Kf4Zj4Hfl3rY9I5mMCaGT3AGdGfGwSPa5WSnaMibKcAQIq
 HCECxB6smiJhZHXamh/jxNzh/o8DdjMmz+yH/heGxI2tHPDBo6gDMQvJ5NVdyru7jWpqhbz6U6b
 BvaO9gsS+yXv8hHs4b1QA0/gHzDchTBJX187EI3nf2AcxUy+Tb4lg5cpJrqKll04dqmzycLEYuu
 OldAC6O4oOA4goqnT6VH4fNGcFbuRA43WusfNGU1e+g82kNJe8OvsHTNOC9FUSpLlC4QEbzUOq8
 payMz3vfa5Ttd2xkRIklZln1mYyR5BaJUVQFNCU3jXDYCLVmdSUW9P+Jex1iapXbCCpwT+HXDHM
 bre15427HM5H291vMQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfXwPlxUVjSntn9
 xNpEefw/qOiUPGZ3Wy4+D1LOdc4by8tsRKv9UI2ri2Ufs3D1pBfGo1Bu5a0lV5f3EKyaGmFn9aH
 8Kldg9bt7fSqgAWu2u/dCSIFc+s6fWMn6ZuJbFKlUJrGFkKKXdfC
X-Proofpoint-ORIG-GUID: 1xaEdLeSKC3XTXe0bHaLxzwJlyqnggL-
X-Authority-Analysis: v=2.4 cv=T8YZ3PKQ c=1 sm=1 tr=0 ts=6acd0abf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=-H6kAsrtDIwNne7E0FYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=10 clxscore=1015 malwarescore=0
 bulkscore=10 priorityscore=1501 spamscore=0 impostorscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120065

With neither the writer nor the loader left, nothing acts on
disk_cache_state. Remove it, the need_clear handling when reading block
groups, and the enum. While at it, drop the unused cache_generation
field from struct btrfs_block_group.

lookup_free_space_inode() converted old style space inodes by clearing
disk_cache_state so the cache would be rewritten with the new inode
flags. Without that it only sets flags on the in-memory inode, which
every remaining caller truncates or deletes right after, so drop the
conversion too.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/block-group.c      | 32 ++------------------------------
 fs/btrfs/block-group.h      | 10 ----------
 fs/btrfs/disk-io.c          |  4 ----
 fs/btrfs/free-space-cache.c |  8 --------
 4 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index a11685440e3c..9a98e291769c 100644
--- a/fs/btrfs/block-group.c
+++ b/fs/btrfs/block-group.c
@@ -2496,8 +2496,7 @@ static int check_chunk_block_group_mappings(struct btrfs_fs_info *fs_info)
 
 static int read_one_block_group(struct btrfs_fs_info *info,
 				struct btrfs_block_group_item_v2 *bgi,
-				const struct btrfs_key *key,
-				bool need_clear)
+				const struct btrfs_key *key)
 {
 	struct btrfs_block_group *cache;
 	const bool mixed = btrfs_fs_incompat(info, MIXED_GROUPS);
@@ -2523,20 +2522,6 @@ static int read_one_block_group(struct btrfs_fs_info *info,
 
 	btrfs_set_free_space_tree_thresholds(cache);
 
-	if (need_clear) {
-		/*
-		 * When we mount with old space cache, we need to
-		 * set BTRFS_DC_CLEAR and set dirty flag.
-		 *
-		 * a) Setting 'BTRFS_DC_CLEAR' makes sure that we
-		 *    truncate the old free space cache inode and
-		 *    setup a new one.
-		 * b) Setting 'dirty flag' makes sure that we flush
-		 *    the new space cache info onto disk.
-		 */
-		if (btrfs_test_opt(info, SPACE_CACHE))
-			cache->disk_cache_state = BTRFS_DC_CLEAR;
-	}
 	if (!mixed && ((cache->flags & BTRFS_BLOCK_GROUP_METADATA) &&
 	    (cache->flags & BTRFS_BLOCK_GROUP_DATA))) {
 			btrfs_err(info,
@@ -2677,8 +2662,6 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 	struct btrfs_block_group *cache;
 	struct btrfs_space_info *space_info;
 	struct btrfs_key key;
-	bool need_clear = false;
-	u64 cache_gen;
 
 	/*
 	 * Either no extent root (with ibadroots rescue option) or we have
@@ -2699,13 +2682,6 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 	if (!path)
 		return -ENOMEM;
 
-	cache_gen = btrfs_super_cache_generation(info->super_copy);
-	if (btrfs_test_opt(info, SPACE_CACHE) &&
-	    btrfs_super_generation(info->super_copy) != cache_gen)
-		need_clear = true;
-	if (btrfs_test_opt(info, CLEAR_CACHE))
-		need_clear = true;
-
 	while (1) {
 		struct btrfs_block_group_item_v2 bgi;
 		struct extent_buffer *leaf;
@@ -2734,7 +2710,7 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 
 		btrfs_item_key_to_cpu(leaf, &key, slot);
 		btrfs_release_path(path);
-		ret = read_one_block_group(info, &bgi, &key, need_clear);
+		ret = read_one_block_group(info, &bgi, &key);
 		if (ret < 0)
 			goto error;
 		key.objectid += key.offset;
@@ -3597,10 +3573,6 @@ int btrfs_update_block_group(struct btrfs_trans_handle *trans,
 	spin_lock(&space_info->lock);
 	spin_lock(&cache->lock);
 
-	if (btrfs_test_opt(info, SPACE_CACHE) &&
-	    cache->disk_cache_state < BTRFS_DC_CLEAR)
-		cache->disk_cache_state = BTRFS_DC_CLEAR;
-
 	old_val = cache->used;
 	if (alloc) {
 		old_val += num_bytes;
diff --git a/fs/btrfs/block-group.h b/fs/btrfs/block-group.h
index f7346a0170fc..d567ed822e55 100644
--- a/fs/btrfs/block-group.h
+++ b/fs/btrfs/block-group.h
@@ -20,13 +20,6 @@ struct btrfs_fs_info;
 struct btrfs_inode;
 struct btrfs_trans_handle;
 
-enum btrfs_disk_cache_state {
-	BTRFS_DC_WRITTEN,
-	BTRFS_DC_ERROR,
-	BTRFS_DC_CLEAR,
-	BTRFS_DC_SETUP,
-};
-
 enum btrfs_block_group_size_class {
 	/* Unset */
 	BTRFS_BG_SZ_NONE,
@@ -131,7 +124,6 @@ struct btrfs_block_group {
 	u64 delalloc_bytes;
 	u64 bytes_super;
 	u64 flags;
-	u64 cache_generation;
 	u64 global_root_id;
 	u64 remap_bytes;
 	u32 identity_remap_count;
@@ -171,8 +163,6 @@ struct btrfs_block_group {
 	unsigned long full_stripe_len;
 	unsigned long runtime_flags;
 
-	enum btrfs_disk_cache_state disk_cache_state;
-
 	/* Cache tracking stuff */
 	enum btrfs_caching_type cached;
 	struct btrfs_caching_control *caching_ctl;
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 2c53daf5f2ba..05ce3c7996fc 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -4863,10 +4863,6 @@ void btrfs_cleanup_dirty_bgs(struct btrfs_transaction *cur_trans,
 					 dirty_list);
 
 		list_del_init(&cache->dirty_list);
-		spin_lock(&cache->lock);
-		cache->disk_cache_state = BTRFS_DC_ERROR;
-		spin_unlock(&cache->lock);
-
 		spin_unlock(&cur_trans->dirty_bgs_lock);
 		btrfs_put_block_group(cache);
 		btrfs_dec_delayed_refs_rsv_bg_updates(fs_info);
diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index 1e2fc2884d07..e82216ebd5d0 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -124,7 +124,6 @@ struct inode *lookup_free_space_inode(struct btrfs_block_group *block_group,
 {
 	struct btrfs_fs_info *fs_info = block_group->fs_info;
 	struct inode *inode = NULL;
-	u32 flags = BTRFS_INODE_NODATASUM | BTRFS_INODE_NODATACOW;
 
 	spin_lock(&block_group->lock);
 	if (block_group->inode)
@@ -139,13 +138,6 @@ struct inode *lookup_free_space_inode(struct btrfs_block_group *block_group,
 		return inode;
 
 	spin_lock(&block_group->lock);
-	if (!((BTRFS_I(inode)->flags & flags) == flags)) {
-		btrfs_info(fs_info, "Old style space inode found, converting.");
-		BTRFS_I(inode)->flags |= BTRFS_INODE_NODATASUM |
-			BTRFS_INODE_NODATACOW;
-		block_group->disk_cache_state = BTRFS_DC_CLEAR;
-	}
-
 	if (!test_and_set_bit(BLOCK_GROUP_FLAG_IREF, &block_group->runtime_flags))
 		block_group->inode = BTRFS_I(igrab(inode));
 	spin_unlock(&block_group->lock);

-- 
2.39.5

