Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CC938F92F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334501; cv=none; b=YiHNwTL08K0usCjalD+/4cOkdZWtZC0ExD1RE9VUD2PD/WWd09ZQHeSSL6k2lRgFC8t1UfBAG4IFrHuo8dbV0MPFMUcXM7wUkuznw5XRMPz2dt+Q/7Bcsffdab+QyTyXFIg+U+QU6h5F672zEsa+0gBRbu6V3Ge9z2laJt7gWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334501; c=relaxed/simple;
	bh=f7QP8rjkTL/hFBjwJZZfAUG7xOyxTCYpKox4iSRIc30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLqQMs2WWWK1SaJCryBz6ALU+XIrYbSDr2foArIGYyAV8xmbiTZ7J1cfam4RV0bLCZFKy5ja8R8IavA9IiCqy8JzSIAJhWXr9XymT/XO26D+Kh5Rw2Y1E1BTaBk49n/JSzC3RgmsuJCRQMPHFEzxAfolvDnAVBWWhr//kGGdalE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=UJDB89TV; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=eNDdgQA/; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="UJDB89TV";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="eNDdgQA/"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKXta3557467
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=L5P9
	pth53AeiU9Aso0fVLD2mVQiBr0GVZfhtL06tuN4=; b=UJDB89TVwt6uvHfyvH1K
	tToQt2DNqBGHFfZOHeO+Gv1VGPONEI9YpZcKSygjh7XIZ/YhQv2vbxpaaVJijAhm
	x0twoubcRRPHm5P7rcABxHMf5x2W3QoTC6flYjsSinfuawzb5THMTtufXf3HKTAP
	mce7MFEk5CU/QO7QZbpY9PdzY4ijdfftI8Z4Uh1Fnp61uZCMzMhV8MP/pjS1r7jw
	BhR1dIx3TWHFTGub5oQgbBlkgXba9BRBieZFw+qpCseKn4G0XA1dDKdgQyDXr7jD
	LuikjVq6zD/BdWIvRKCOAAQAfdQXPCuJlB4nFX3/K4L1nf0DZsbe3yadr7qEMs5W
	6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gp2yv05qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:36 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so556853185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334496; x=1789939296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5P9pth53AeiU9Aso0fVLD2mVQiBr0GVZfhtL06tuN4=;
        b=eNDdgQA/rVlIy3YCU1BeDI12gNxWfTIu6LIoWFLPMCCl+2lLneN5vkYTOCX36b1I2e
         H8aywG1Dm2lDj0M7iAspRVQNrrQ72LdhEJgSSwzQ2pv3ctp4WPBVW2RBxBOAl8LIWkrQ
         sG9GHkjmjj4lR9lpjWDgw5zMM13TUbno8TokdtsB+p2wpWt2LbL6bPfGJgIBa29CgrZx
         KHKRaH1HYgBVMdPtmdZUoydKtf3gevwsgeNxTpBFC1e17KCLNlSCgU2NMScTBttdmkao
         zdoHRPu5jHkX/cGM57dGwECSeiiGd0/Eo8KOAdb/qXT0cIh6jJzneMfI8S5LsVS5rQKC
         YeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334496; x=1789939296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5P9pth53AeiU9Aso0fVLD2mVQiBr0GVZfhtL06tuN4=;
        b=E8oz6eWSrLi2I/RD97JQK2cw4UQtemWOf10X0rMj7Vk1YAQHgCK7P9yZyuqLjGSfpN
         Ppfc+/fy8h9whxpj+k+YOLVNMCi2OGmEzLEq75aIteXxHQr0iZ9ENfWpJEg9NWbMt6lK
         LMrK3KjHNako76/N/rr+GEC7oxePs71ZIrMrDRsnB1erUhQ664CxtpmLuN2fsEXt+4fW
         W5XP4IZLd6mq4BL7cIY3mfw0lTHmdo7kCcbaijG/Fr9JJn6H7urfioABrc6zHHFo0e/D
         g8TdZ48ihURJFkC7WJQo/XJNtkv0gqgr8mkyZQGezvA4Uu2cBL+2emaynSnlyRsNubAJ
         sGIw==
X-Forwarded-Encrypted: i=1; AKwUvBw81lGqbiGa3uqd1BBXGn0lLDaUFIEoi/kliX/w0cQyqsV+Kz2Wv/kOsBwze78NyKNkPANPHtayETEraRY=@vger.kernel.org
X-Gm-Message-State: AFuF++mQrUlCTwcLCyH/ZdfsqqSaK4Vv4hNgxhnqykIUUdx+ywiAgoME
	9pUuxC7vV3S+2fq9gTOwPcTzcrLH/ie2qkBS8XbXycAuil2JEg9PqrSBpsKco4DkCx4mvp9+N3k
	RtJoJmXeNtCpLRMBO9F7pGDB9JxOfKsXMGHV1+/9o9rfuPg3T4ZMLKzNJx0fEcQ==
X-Gm-Gg: AYBFou3Z++1zGEmDzO7L9sJEr7dGPG/5UnQc3FoA2gip/usKoSxrf15rhMD6BaKmQWR
	mj+46Hm36cC8Y8XiI+IP3/RVspfswal1A9NDlwBlXZKgclJJOw+LHEXljc5PRYGCK0wIQsqdxX9
	KemwSwJf4u/1JLGdWuXtyHoCyetUuxlhmUrwXaRCSkMck/hVfi4GYi+q8ido1PT8AX7A4DgvnAP
	xlVnMHBGPOZx0/QLQohbDE5vnWF4A9CrjG2FgYSMg7rJ69TUqdT588NMbPQ2kYiPakJWHrkvHgI
	ad8TCRKl0Dqn6BfQlqJFfqnDe+EGP9iOiPgZ3gxsr/Nz8Opg1fS8jYlQbaQoRPgQj0Cb+GyVgxa
	j6DIZi31hobWJV7lP16bpfJ0KotlMhabmoKcApI01/8KFujQM4bkXvA==
X-Received: by 2002:a05:620a:468b:b0:930:9585:e08e with SMTP id af79cd13be357-939ea037950mr2081633185a.10.1789334496400;
        Sun, 13 Sep 2026 14:21:36 -0700 (PDT)
X-Received: by 2002:a05:620a:468b:b0:930:9585:e08e with SMTP id af79cd13be357-939ea037950mr2081629785a.10.1789334495883;
        Sun, 13 Sep 2026 14:21:35 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:35 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:21:22 -0400
Subject: [PATCH v2 10/16] btrfs: remove the free space cache trimming
 ranges
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-10-186767a7e106@columbia.edu>
References: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
In-Reply-To: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=7181;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=f7QP8rjkTL/hFBjwJZZfAUG7xOyxTCYpKox4iSRIc30=;
 b=MAgnTbCS0pwIMf78vilctT03yYx45aNf1mhvlopyN1t8opGmaoCx4RLY43InsXG37uPYA05A+
 Iew0FURXcG9CtIUUMuuyj/w7rb9FsgdkPwzeVjQX/tOOTUUqLzsqP7o
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6aa713e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=qCNzSPQ7UVaF4CatvjwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9iL9pbZV9aav9orejzyFPnnJzYFZgY3k
X-Proofpoint-GUID: 9iL9pbZV9aav9orejzyFPnnJzYFZgY3k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNSBTYWx0ZWRfXzBkxuo1+VGOG
 OFOd6GBe8UeSOTc+rkQlIZJdA9UipIwgD1Rm+0FZrUo8tWjBL/1jcy3zJWrN5PokrPUCS8Pmsqe
 npRqBmjBwBBp2tE19xTbT88GJYDfNDHD+kWq2KplKNdUf2BE1cWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNSBTYWx0ZWRfX5bNSoFwG38FQ
 AOuKmzs09wPSaUQx0pno1Py/XbwybYsxRGb+oTdzsPMlRfms0iqxwcPXn+lbP3Qk/KmZJFNaHQD
 owzc6S6+I8rWeKoL+qUMemAAl66ZEbX3YShpvb9LSFyZoRiyEcwokSjKmyLKHfA9RWQOBIujDs2
 Jd7PQnPQuxiBoydp9yNQYxvGnXoFGNn6oupPxwRovRqKSeAaz08euQ5xvVvll4arFlQNsiSRbVe
 GLq1WXtVosNpr5uexDUXWCMhWVAYewqswUKiA0Tb9fmJYadbQp+c5dwbfbZ8cwooF+kXGQS30Eh
 AsKvcNx/McBF709srwTp7aQsXCFytT7WjlTDFDds1hz0wBemwai3WD7DxhGn7LfksS1/wCQiUiN
 ble0ITqPvs0V3KT4P8txn7AtUbdt+G2OcADfqU+391ldjNaYmkBAmXp9ERbjMO4kG+FeuDYKXie
 jr53M1Sq6ixXAyhIfFA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 impostorscore=10 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130305

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

