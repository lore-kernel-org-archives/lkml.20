Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA4B2C21C5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830416; cv=none; b=t+BdhbieamcufkLKMKR88zJRruuxxdDPiuQtZJCc1LmSWi0V78BJfL32USsEgyH4sWF3iFwh//EiGA5LBvmMH0vbjkn4NIX9zSV54gVPovETgYpnc05U/37qGah3bqRzL5w+ETelHt1igoiJ+oTKb7eRKrTyZjkXK27TMYdXnkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830416; c=relaxed/simple;
	bh=f7QP8rjkTL/hFBjwJZZfAUG7xOyxTCYpKox4iSRIc30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6sQ2roI3gLgevotQmBThBnenKnxU6Yk8tnTUQrsULwRP1xbr9GyRFkN/bau0V9Uk93t+UStg6pA+spUqddg60zVTrPpfTrxvjBkSkWhHFWXYe6R1nND5pRvx2IJRrzYXwKHrIn1C5U0sDkxyo6IephfuGNpGdHWkozT1HxH0ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=GvDd1bKv; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=w36lcRMK; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="GvDd1bKv";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="w36lcRMK"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880vC3C3797994
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=L5P9
	pth53AeiU9Aso0fVLD2mVQiBr0GVZfhtL06tuN4=; b=GvDd1bKv3XPuSkgEJv7x
	+URXaElAVLWfnGpVrQnmRGgHjMqWvd1eu3GF2B+1RbKfkRUuwdTlRAU1D8Ghmjdx
	McBfWuJnAq6LXfXTQyiKePsHGKHAF4OalcpuPj8Cepob5Br8jFwHWiMmJ6QeGWVx
	5gILUTi2zTlbxokjc1DGrY3J13btTHN5HDlhbkr4kNsf4zqhr2BKSrZZ4bhEiBJx
	flHCIQQnRvL88ZjqQhCIER9JVAIV6AQFXnZtbYYqIWXbe+3YZNqrFDQV5DZGDwOY
	yu5Zp8hZyZkk94zxdyEswJ1CuymFLzVO40yIzmP7YIjhMoHZVRbRUt3xDe7L48qU
	kg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gj52xgxxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:19:59 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso624100785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830399; x=1789435199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5P9pth53AeiU9Aso0fVLD2mVQiBr0GVZfhtL06tuN4=;
        b=w36lcRMKuL1c9KNSSgNZcIa7CpdhvtVKaH6Jv0Fh7E/hrggq8kY2e3uo9PmRB/JrFK
         yKXv/7dPcJQjt7mNbrN/0w+iyqmceij0I60dF7hXT6FcgWKWv4fU6FnCPMw8XY+LIWRM
         T8gat6TFXaf39ONYlHL1Xhnrfn0K+EbzOk0ZA8J6qykL9oyFA/v+HL1L9DwOGqYFS8gF
         tQoP4wEOsdCyioOaVYYkyii3IvYdueKza+16ywhkb2jQuXKwsCtnSIjgopyJC1OMmuOy
         Lge/BcFtzy2sRXYJOfSW8vF6/wI3cOJsD8Jeo4Q4wWuREkKlaomTD2+8j+JJFDvqjCcv
         T6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830399; x=1789435199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5P9pth53AeiU9Aso0fVLD2mVQiBr0GVZfhtL06tuN4=;
        b=B/Iu9tgtQIYanG2E1jSqYAETUnrQJqFt7oZ/nT+SohTNqI1kyptz9XM7930DfpAAFy
         Zk4gP4U/vG8zo0Di1aotg5PvVr1n9EKQ8NXFja1gq0s1DjI8AWCR/0bOIpDN1BKW+Lds
         C7Xsfva5/j3Q3XL3zR7P3f18Ks9eRTrZrGVcAp2wVZxkajHnM0oiSVGlPgvcg1t5wv+p
         c5QWHCNeZLgukBBLxrv3maF3m5L5wbS6eHzFxuJw6HqbzK9Zb533PkkzZneCakxm2KOC
         1G2pQY/+4CrTzFvvJ6lz66yC5UIBYRZwAZityS234QFp+msfzBae15cGBwS8h6ZqsIWr
         qgig==
X-Forwarded-Encrypted: i=1; AKwUvByOhLkPdPOXT58jGIHwTzu427/BdGYMRA2bLEOspTgBNs2XNdQE9Vos07sVsLUAb/tRMxTft8T7uHRzc6A=@vger.kernel.org
X-Gm-Message-State: AFuF++nNIpRGbgHFbipPE8Gz2zdQkndFFi6NcQA8irZRNcv2letXhxyp
	WVI/Dfj49vCGT4rStlEti0IpvvETXgoSixMMwiSDQtt8j9WLol8HAhsH5C/G4batl9xYo27r0Md
	zpgBaPAxvtwiZ9S73fMm38/MNDGwjxPOioQiRJfgQilClYRfmS1Li4LqLY+16Kw==
X-Gm-Gg: AYBFou2JHp6VncQkhtLpJ48igHcwG2WVtfL4PDG6W9jfNwkO4knFPAhhv0bBHn83YCe
	DbZoazxHslL7wKhLxX4S4TORqQ+RG3lBIYk732dJ2IGIlAAYawP2hAnY9g5RhcgEudL9FG9+vCi
	inhOQ9uE0Q0C6Aq8GHDR5QXHpRSDwDI6WYiUBP737ARI6sC8M3jc/XKcmDIOA2SDWn/gMpbUtev
	jS5jnfRw4IuwZSu5XJ95znglCJLMXZFm1vKvo6qWCbnuOzSmFCrr7W302abLZtCMMTvz/bLSA1x
	a2Bwjt5wwpVTJJgYWFk0G0zBYNdHAvgntFpwbpv+tAfFDSxec6kBx8wTPqPBuBNgfCUa4vYR/EO
	ovhTcfDwLUrGADOM9Sv6OoF1H4mKTrgFlkXt0PmlBtZ/Hc1mT01E=
X-Received: by 2002:a05:620a:6ccc:b0:939:4b0a:f0fe with SMTP id af79cd13be357-9398036c003mr2792715585a.14.1788830399061;
        Mon, 07 Sep 2026 18:19:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccc:b0:939:4b0a:f0fe with SMTP id af79cd13be357-9398036c003mr2792711785a.14.1788830398634;
        Mon, 07 Sep 2026 18:19:58 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:58 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:25 -0400
Subject: [PATCH 10/15] btrfs: remove the free space cache trimming ranges
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-10-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=7181;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=f7QP8rjkTL/hFBjwJZZfAUG7xOyxTCYpKox4iSRIc30=;
 b=XXUVBKijr5ekZZbm8bqFdYOgsegz6kZIRkynI4v1R02zi7Uj3ZNmOk5Eqv6ezJCPCJ8cYg1Kl
 xsFnj7Ggxm8CrcWMBN7gKvosal7mVx0CJ4VOAsXZoO4ZZ+mf3bLCRIW
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=MLRQXsZl c=1 sm=1 tr=0 ts=6a9f62bf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=qCNzSPQ7UVaF4CatvjwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfXwxER/d2xRtu4
 Wa2DsRrFmCqsMbpmsUn7uapWxSlE7/xLMeNJt7KU3FTL7PTFGSnMxgLpMQSsQSb2vs+TQI/7g/t
 pH3SglwiUTGNUz3ky162Mu/DEmr/zL//c4L+H21AcMpFKze6QCv0
X-Proofpoint-GUID: uizmoLrRi0VsSdek7VIuixZDZ5wzdFPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX2EkS1FgyJ9p0
 uTKMjgja+OzxLohemN7CIL6HuVQFjoLP9s9KEN9bT6G1oARiuwcrcN75pY+FtjohN0MZFLMzhBo
 rK9qHW64WbGuEhpJGCHBHEkQsXe/WMS85zEtofYMXMBWT3upPyIw55AVMiUlDMfBi/tkUjnI4SP
 VaRG4lnP6NOC2/pQLWdbDSOgdfxZHdEOfXaCNJ0CpiZ6Ils81CuI+ECeetErIzvd2IS/dAzf8/K
 HWYg0WkgZ38E/eJ4ZwW58LtPqWolef+UMz0MvQEBdfD68awp9NC0EZO5ttmZywK7z/aVmJo4l3n
 q0ulGs1XT/aN32W9/bwo8DwjZ0RbGOvIOMOBazoodih0y1iwZU5e7Ka9R1Mk3TOL9dzGWNb7ybU
 MQOf/HPt/shMZAXo0Yo/eFDDmM7IgGUarRDABHtX7MS391i+7mCqQLkWbLg/fKxrBZltubKnSNV
 uzqNI50vBZ60zEwwPxg==
X-Proofpoint-ORIG-GUID: uizmoLrRi0VsSdek7VIuixZDZ5wzdFPJ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 impostorscore=10 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=10
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080011

cache_writeout_mutex and trimming_ranges let the v1 cache writer see
ranges that were unlinked from the free space tree while being
discarded. Nothing consumes the list anymore, and the tree itself is
protected by tree_lock, so remove them.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/free-space-cache.c | 41 +++--------------------------------------
 fs/btrfs/free-space-cache.h |  2 --
 2 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index a36d0465510d..8a6d896b4108 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -36,12 +36,6 @@
 static struct kmem_cache *btrfs_free_space_cachep;
 static struct kmem_cache *btrfs_free_space_bitmap_cachep;
 
-struct btrfs_trim_range {
-	u64 start;
-	u64 bytes;
-	struct list_head list;
-};
-
 static int link_free_space(struct btrfs_free_space_ctl *ctl,
 			   struct btrfs_free_space *info);
 static void unlink_free_space(struct btrfs_free_space_ctl *ctl,
@@ -1699,8 +1693,6 @@ void btrfs_init_free_space_ctl(struct btrfs_block_group *block_group,
 	spin_lock_init(&ctl->tree_lock);
 	ctl->block_group = block_group;
 	ctl->free_space_bytes = RB_ROOT_CACHED;
-	INIT_LIST_HEAD(&ctl->trimming_ranges);
-	mutex_init(&ctl->cache_writeout_mutex);
 
 	/*
 	 * we only want to have 32k of ram per block group for keeping
@@ -2396,12 +2388,10 @@ void btrfs_init_free_cluster(struct btrfs_free_cluster *cluster)
 static int do_trimming(struct btrfs_block_group *block_group,
 		       u64 *total_trimmed, u64 start, u64 bytes,
 		       u64 reserved_start, u64 reserved_bytes,
-		       enum btrfs_trim_state reserved_trim_state,
-		       struct btrfs_trim_range *trim_entry)
+		       enum btrfs_trim_state reserved_trim_state)
 {
 	struct btrfs_space_info *space_info = block_group->space_info;
 	struct btrfs_fs_info *fs_info = block_group->fs_info;
-	struct btrfs_free_space_ctl *ctl = block_group->free_space_ctl;
 	int ret;
 	bool bg_ro;
 	const u64 end = start + bytes;
@@ -2427,7 +2417,6 @@ static int do_trimming(struct btrfs_block_group *block_group,
 		trim_state = BTRFS_TRIM_STATE_TRIMMED;
 	}
 
-	mutex_lock(&ctl->cache_writeout_mutex);
 	if (reserved_start < start)
 		__btrfs_add_free_space(block_group, reserved_start,
 				       start - reserved_start,
@@ -2436,8 +2425,6 @@ static int do_trimming(struct btrfs_block_group *block_group,
 		__btrfs_add_free_space(block_group, end, reserved_end - end,
 				       reserved_trim_state);
 	__btrfs_add_free_space(block_group, start, bytes, trim_state);
-	list_del(&trim_entry->list);
-	mutex_unlock(&ctl->cache_writeout_mutex);
 
 	if (!bg_ro) {
 		spin_lock(&space_info->lock);
@@ -2475,9 +2462,6 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 	const u64 max_discard_size = READ_ONCE(discard_ctl->max_discard_size);
 
 	while (start < end) {
-		struct btrfs_trim_range trim_entry;
-
-		mutex_lock(&ctl->cache_writeout_mutex);
 		spin_lock(&ctl->tree_lock);
 
 		if (ctl->free_space < minlen)
@@ -2508,7 +2492,6 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 			bytes = entry->bytes;
 			if (bytes < minlen) {
 				spin_unlock(&ctl->tree_lock);
-				mutex_unlock(&ctl->cache_writeout_mutex);
 				goto next;
 			}
 			unlink_free_space(ctl, entry, true);
@@ -2533,7 +2516,6 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 			bytes = min(extent_start + extent_bytes, end) - start;
 			if (bytes < minlen) {
 				spin_unlock(&ctl->tree_lock);
-				mutex_unlock(&ctl->cache_writeout_mutex);
 				goto next;
 			}
 
@@ -2542,14 +2524,9 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 		}
 
 		spin_unlock(&ctl->tree_lock);
-		trim_entry.start = extent_start;
-		trim_entry.bytes = extent_bytes;
-		list_add_tail(&trim_entry.list, &ctl->trimming_ranges);
-		mutex_unlock(&ctl->cache_writeout_mutex);
 
 		ret = do_trimming(block_group, total_trimmed, start, bytes,
-				  extent_start, extent_bytes, extent_trim_state,
-				  &trim_entry);
+				  extent_start, extent_bytes, extent_trim_state);
 		if (ret) {
 			block_group->discard_cursor = start + bytes;
 			break;
@@ -2573,7 +2550,6 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 out_unlock:
 	block_group->discard_cursor = btrfs_block_group_end(block_group);
 	spin_unlock(&ctl->tree_lock);
-	mutex_unlock(&ctl->cache_writeout_mutex);
 
 	return ret;
 }
@@ -2684,16 +2660,13 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 
 	while (offset < end) {
 		bool next_bitmap = false;
-		struct btrfs_trim_range trim_entry;
 
-		mutex_lock(&ctl->cache_writeout_mutex);
 		spin_lock(&ctl->tree_lock);
 
 		if (ctl->free_space < minlen) {
 			block_group->discard_cursor =
 				btrfs_block_group_end(block_group);
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			break;
 		}
 
@@ -2709,7 +2682,6 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 		if (!entry || (async && minlen && start == offset &&
 			       btrfs_free_space_trimmed(entry))) {
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			next_bitmap = true;
 			goto next;
 		}
@@ -2735,7 +2707,6 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 			else
 				entry->trim_state = BTRFS_TRIM_STATE_UNTRIMMED;
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			next_bitmap = true;
 			goto next;
 		}
@@ -2746,14 +2717,12 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 		 */
 		if (async && *total_trimmed) {
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			return ret;
 		}
 
 		bytes = min(bytes, end - start);
 		if (bytes < minlen || (async && maxlen && bytes > maxlen)) {
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			goto next;
 		}
 
@@ -2773,13 +2742,9 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 			free_bitmap(ctl, entry);
 
 		spin_unlock(&ctl->tree_lock);
-		trim_entry.start = start;
-		trim_entry.bytes = bytes;
-		list_add_tail(&trim_entry.list, &ctl->trimming_ranges);
-		mutex_unlock(&ctl->cache_writeout_mutex);
 
 		ret = do_trimming(block_group, total_trimmed, start, bytes,
-				  start, bytes, 0, &trim_entry);
+				  start, bytes, 0);
 		if (ret) {
 			reset_trimming_bitmap(ctl, offset);
 			block_group->discard_cursor =
diff --git a/fs/btrfs/free-space-cache.h b/fs/btrfs/free-space-cache.h
index f5f18e397b13..e22443598b8e 100644
--- a/fs/btrfs/free-space-cache.h
+++ b/fs/btrfs/free-space-cache.h
@@ -83,8 +83,6 @@ struct btrfs_free_space_ctl {
 	s32 discardable_extents[BTRFS_STAT_NR_ENTRIES];
 	s64 discardable_bytes[BTRFS_STAT_NR_ENTRIES];
 	struct btrfs_block_group *block_group;
-	struct mutex cache_writeout_mutex;
-	struct list_head trimming_ranges;
 };
 
 int __init btrfs_free_space_init(void);

-- 
2.39.5

