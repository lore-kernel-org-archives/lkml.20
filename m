Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327CF38330F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334499; cv=none; b=sFH5qCkJVPvuf3HXrginMNnCtR1b4fqDRTj1y/yGxWyEYSlB8tSJ43t5M1xS9tDeM4smTTtmEE0N1vljwXBLaYpe8k0c+ew97o7yhQBvBMUqAKVQaNce6+DfmrNThMuNJ5EcA94ldI5cjihIxtIL9RSBNGeTXOOBGOugZljeTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334499; c=relaxed/simple;
	bh=HdeCUQk+ecGhJfYRWqbSdat+3roKzCrHRSLpkYGjVNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCSG9AWOYLHSLGh4AOgTU/5lDEbBRW88wNidv2Pu50TtAdk9Oobvhf9NrKRObHQzZDOvlbDgaQPrBxdvb4Povnq4DsbaFQukYChAJC4FPtCqBdoPJteetecRd0wK7mL+0uF81VKbsHbUyDbiJgk1QgEHLuImTh3kG9x7+FCIo+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dR98ATwI; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=UXCygE8+; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dR98ATwI";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="UXCygE8+"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKXfQi652189
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=lCAz
	fzDZ4UxiQ0/InC3dh+MEBGzJ4Gj38MBd2fo6ivs=; b=dR98ATwIJ6CwIp9Lxczm
	AjyP+IM3q7qES8EKLD2frMYhJ1G3264boXAJU8JyPVdB/LLEMuv8630SWaQEilS/
	uB80mWJQ47/mKjk97EpGMmjBEVCWI1f3jv9HtSL0F/lo8ljtkuAOo3WLAQM+6BNi
	8QdUvoRvQJpAzYVcfo4W6S15BWOSTDl8ews6zBWva/DIUsI7HZh6ljm73p4rABG8
	UtxJSEPnO+2oPNTPHmrn1zCuPmeSJOwCasUbNXN9qoEAsJI08iv6VwlGZZiQd/dG
	FSYnyRE9OJzao2YTiTbSGRusqYgut7CA3F7SttWAtrp0hciDUrH0IgpZJEl8pYqM
	UQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gp2mjg7ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:33 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-912195e911aso37421696d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334493; x=1789939293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCAzfzDZ4UxiQ0/InC3dh+MEBGzJ4Gj38MBd2fo6ivs=;
        b=UXCygE8+JSkhnwDPLiyJPjoUbqp/de64qWpIj3JKAl1ivqF4J+uS4xW7q0U8WdAUHf
         zZpjNVthfeXtfxz6vEKph0cHSlzCHTYJxT3mFuel2gldVjvhofL4KAGFTIpZL9XJ31yt
         1sm/ZCYzm1r0XgvNBQZ/+w/K75iw4dcYy0Rfot4yjnXxc5l+zro5SQTewc9oAc+KXbU6
         46sExecr5GUptoWvb9h/9SfJ19RnZ9OwR18cz9ypISt+WmCMZBMCxXEpSImxJl0w1Sf4
         8byxnid71oX6MEyxNyozXVnV7SXeV+ZKpYpw6UGkcKAGoR79FH8O9616LV/qV4QKMXLg
         Z65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334493; x=1789939293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCAzfzDZ4UxiQ0/InC3dh+MEBGzJ4Gj38MBd2fo6ivs=;
        b=D826uhcfuKInxO/eNaW7n9EwCgvBM/nXc6sT00/ooI317gFlYsBMhJXknAxVVVg70O
         YSaYla0NBY/X2n05agTVScushp21VdpeHsPrlv9V6xqjXw/kGocb9spevA/3HcYJTOL0
         ECtvF76SJE8+p2edFU79OTPO7d0B5hUwO1sTdE/lHX9LRxnRL+lfUuKFm1mrT22A0X+G
         +lF7ktQBtoUPSNd6UFGmRoqknb2wOnemYOiPtZjJMGJ1AzzX8R+n8sJUBM1UCbjpz6O3
         aIdcxpIXb6W7YjWogTr6uzqFBdlOkn82R66qO3L6ID1SYpCTwZG+L1GSljEsHIMf20S4
         vQXA==
X-Forwarded-Encrypted: i=1; AKwUvBxA806V0xn4d7bPp7QcurK9HkfUf/VqP6hEe8N7YbCVwlyLR/3stmTt12o1vdz1BCswzGsd0bfg9GpU/GA=@vger.kernel.org
X-Gm-Message-State: AFuF++nI1zMezp4iFRItafAjEY6KZtHGTE/Z0IJo2ouLndDCPgJ0U7//
	+QtPJXfZUjsu0pLDFvOtXQ4ok0gA8w3bRUmCed+ixdureN0VvvGwCCZoQuN9tC05Bl7ClMfZ7a2
	L9ZorNXa4O3IfLPf2vru+MD7iziu+L4cJNiwNrxvkxp6swG4xSMw27/eEMBkonA==
X-Gm-Gg: AYBFou2+7NrndWWJxijs1C4xXUdXyBUGJF9j2HAwEIHDfgLicp5EXg5esGqnkA2u043
	rNFwvvPqcP4hxV4jjMgxPaxZmfaJIgQd6PdO9mCN2rTrYKA53btkk+kTSINaE/sQUqc+2QknEPd
	QP7waJvJIALCGfS7i2075rBPwy35nBpY11WcvjJRdpETIGgXclaFB1nAy5BZ78eB89Wa7sgQpi1
	0X3gsJkvxgBmm2J2UAogVr5dsRrvDHYWTepFIvo3zZ/qdXx12Ac9jFNkEINgCx8tjP858kwJ15o
	8qoHTn1x5sc6rHokFc70eXyPNSgh052J52orRo6QB5mWE80tHuGaWk+svDIt4AnnJlXyuu4kHf9
	LTEBJJYQJX/2VrNGTdaAOjCNQ8GMudfQHEQ6toIUuwVdCXrdrgHuPtQ==
X-Received: by 2002:a05:6214:3d99:b0:912:bd1:49f5 with SMTP id 6a1803df08f44-9121d8efdf6mr128349006d6.10.1789334493355;
        Sun, 13 Sep 2026 14:21:33 -0700 (PDT)
X-Received: by 2002:a05:6214:3d99:b0:912:bd1:49f5 with SMTP id 6a1803df08f44-9121d8efdf6mr128348816d6.10.1789334492878;
        Sun, 13 Sep 2026 14:21:32 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:32 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:21:19 -0400
Subject: [PATCH v2 07/16] btrfs: remove btrfs_disk_cache_state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-7-186767a7e106@columbia.edu>
References: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
In-Reply-To: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=5421;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=HdeCUQk+ecGhJfYRWqbSdat+3roKzCrHRSLpkYGjVNg=;
 b=M6LmKrgNlr9shNqT6BX7WO0hUIabaX4460JVgsXyjTkBg7iDXhCj2dGrRzEcXzvI7+c2iob6N
 gdSFc56tizFARWpa6b2XaJRVY4AKtmgZbdjWbjoEfQC1tEZmT0CU/wE
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=NfpzRGD4 c=1 sm=1 tr=0 ts=6aa713de cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=CrexS6knh-isOgJd2j4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX2LW5LJCM1CIH
 kkdVcNQxKclNO8sEyGfNa3jV+W7MW/JjcQYcVl1jfazBd3fzBCVQuuT1cUThUYngD/ed+fE2vus
 gM6WOG74LvoKQfhbI+mfI9Dr1ptMS8i145T1Wl0D3lQaqOzJ+BXWhOZN1K1K+MTx7RSJPkBiIvq
 mxoNsA7umEovfvQoUyJq7bT8jJ03kg9OCuVDtYrNSZGbx3+yAaT8SqepbSmeGYUMjgH4SdActem
 MSjLB/V2jvOI/DPhbPBNU597rx2390iVJ6E47dknmvPljUpgFQuenUq73ygzhRhXkUIcmfvwF/f
 DCIUWyw4C0LCNaZZWHXyhSK4RY+PIzXjqiF0Cmk936+gQPABZ3ILGcMEqdpwRzW9vICVgAK6MkG
 w5G0s77fWB7Mzpx7GtvuSRxiUpKA7Ss8zcgTkM3pprGW9KKJDDDPLv6lhDUexaGjcz8TUy7l84W
 c2bJM+bumtpTrRZyZVw==
X-Proofpoint-GUID: UNQTDcV13NQ_b6uNqnaZRks6Q8PrER1E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX59+5fh/60DxP
 yGXpGf8yivNMiBruq/IAZgfPu0zau2qGvVE+GLjTB6fwMo1FkNrOVAPnwNsXW8kv0i4ar3beyTx
 vJVc5OR4jd3Rw10Fbx8ABrOxsbn3ZONy6YB8AK2ykWCl5G0bi7Pl
X-Proofpoint-ORIG-GUID: UNQTDcV13NQ_b6uNqnaZRks6Q8PrER1E
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=10
 clxscore=1015 adultscore=0 lowpriorityscore=10 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130304

With neither the writer nor the loader left, nothing acts on
disk_cache_state. Remove it, the need_clear handling when reading block
groups, and the enum. While at it, drop the unused cache_generation
field from struct btrfs_block_group.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/block-group.c      | 32 ++------------------------------
 fs/btrfs/block-group.h      | 10 ----------
 fs/btrfs/disk-io.c          |  4 ----
 fs/btrfs/free-space-cache.c |  1 -
 4 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index 47d48b4abf17..cc8207b028fa 100644
--- a/fs/btrfs/block-group.c
+++ b/fs/btrfs/block-group.c
@@ -2448,8 +2448,7 @@ static int check_chunk_block_group_mappings(struct btrfs_fs_info *fs_info)
 
 static int read_one_block_group(struct btrfs_fs_info *info,
 				struct btrfs_block_group_item_v2 *bgi,
-				const struct btrfs_key *key,
-				bool need_clear)
+				const struct btrfs_key *key)
 {
 	struct btrfs_block_group *cache;
 	const bool mixed = btrfs_fs_incompat(info, MIXED_GROUPS);
@@ -2475,20 +2474,6 @@ static int read_one_block_group(struct btrfs_fs_info *info,
 
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
@@ -2629,8 +2614,6 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 	struct btrfs_block_group *cache;
 	struct btrfs_space_info *space_info;
 	struct btrfs_key key;
-	bool need_clear = false;
-	u64 cache_gen;
 
 	/*
 	 * Either no extent root (with ibadroots rescue option) or we have
@@ -2651,13 +2634,6 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
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
@@ -2686,7 +2662,7 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 
 		btrfs_item_key_to_cpu(leaf, &key, slot);
 		btrfs_release_path(path);
-		ret = read_one_block_group(info, &bgi, &key, need_clear);
+		ret = read_one_block_group(info, &bgi, &key);
 		if (ret < 0)
 			goto error;
 		key.objectid += key.offset;
@@ -3539,10 +3515,6 @@ int btrfs_update_block_group(struct btrfs_trans_handle *trans,
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
index 939d4bfbd4b4..eac794a053cd 100644
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
index f256a91f58b4..881d95080709 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -4864,10 +4864,6 @@ void btrfs_cleanup_dirty_bgs(struct btrfs_transaction *cur_trans,
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
index a25c4db561b4..57991a413f82 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -143,7 +143,6 @@ struct inode *lookup_free_space_inode(struct btrfs_block_group *block_group,
 		btrfs_info(fs_info, "Old style space inode found, converting.");
 		BTRFS_I(inode)->flags |= BTRFS_INODE_NODATASUM |
 			BTRFS_INODE_NODATACOW;
-		block_group->disk_cache_state = BTRFS_DC_CLEAR;
 	}
 
 	if (!test_and_set_bit(BLOCK_GROUP_FLAG_IREF, &block_group->runtime_flags))

-- 
2.39.5

