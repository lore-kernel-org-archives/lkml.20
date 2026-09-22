Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B50A4B4870
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108635; cv=none; b=XXYGtKxq8rwod4cShy4R1CfDabWBxbBtqdNVj6Km18jJnZ1cUfE0XtKpPrEWg4OIKy+898egvUGtNaiO4/bkcAw2K4RTQA+tRpxGdR95daGT+i2j1QrsiaPsIpS4kSTPp3wrXdrTMj/h8wyAbvEPTXjjNd1HRR5Mn+JOYiq16J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108635; c=relaxed/simple;
	bh=oXR+0JqHfu87eukEokpNsmREiUMPTo8HO88BW1JCCrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HPD9/pkGarZ7ApOySk1VIOHqqEKvgVnzMO6sx6biVGvEiI2xMixfrKTgZA5UM/x7ZoXfvJaEmj5QhtfNSvlf3icWxA6LVGjTdZWPTuDkpghYm+St/XFB6I6D4uvTTm+N1YBHiXmFYqf3/TURjB51lcfA5ZWASQFn4km+8yLfsT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=WvJEkuXY; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="WvJEkuXY"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bf5a1c4d9so206268eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1790108624; x=1790713424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DjzabZ8BjMpxlg7TQnuj38a/x4OpYjoDV9Zo35NcDE=;
        b=WvJEkuXYoefBnCvvQLJBR48QuenO31y8cvB3rFy+0uwcTm5/hspKMD1WIcu1WSybSn
         +JGzln7hK8oe7pAw9faLgx6yrhK5+RGXqJuSaZcmOr9NbvencGxG4kjLtt1BfOIyi3iG
         6JNVHkaUIyT/Ucg8CVcXCn2ze6N+fxw6pwdzcf7j89pIMwt+917iJM07aWes4Sz6WPGW
         56TBzwpDFgltQRrMEv8kXbnDI2bmv0MFCvMefY5H/O646zUcg8SE8w/JQnnvcfHjz5G/
         Qsz6iPe/kNhS2mnzyoeUjYhvczBF/T+bhctrqrCTWBB27VL0jllqmM5cF5NYEqyXeq37
         O7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108624; x=1790713424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DjzabZ8BjMpxlg7TQnuj38a/x4OpYjoDV9Zo35NcDE=;
        b=YZYR8lcW0dFOEl6TPO4iCX1HMH0i+/+3H+5hkMYG0RUCdqsRlelDnm6GHtgSkqtn8J
         V8yStC5gZ1aOaX6CLD4PkfPIfsMXQagAylJVMYspr+Mvfm5jkFAzYabLqRNcLPsdsIo8
         oeYbjWs5t2RQEOalkP50FeNqL0ckEAxX145EfAP93MuuK5/4t+WmTRWy3DjEKlw6DnDk
         cV17ArDQi7uLf0hwyxu5WrOTuLriLimDgJOfunkljLi2EnvCnaQsE9n9srot9OigirXm
         vfkc3c6cnQr38BYDq46eGmX4xnzukQZhpQ39k/Q0QXn2tX9lV/Czsx1Z9y4phoyMZQGZ
         4sCA==
X-Forwarded-Encrypted: i=1; AKwUvBwBtPvoPxTvdxq7XjE8kRWj7497VucmEIKc0RlfJdmpg21TP3Qajyk3wnzMQB69BEQlEfL2VqkAEbYUbh4=@vger.kernel.org
X-Gm-Message-State: AFuF++l4iDkcwE1qznrRAElQyLGhzHzTVzPqIlNDYlEVLCZCgAeflssi
	yzOlcAl9QxcF31DWqBGhzs7nl6VYqaqkoG9ULbtOVb3x7KX+ICRjDo370O9ChEIvaw==
X-Gm-Gg: AYBFou39eDGl4K78NQLBD4VMBnVSAgDgm2PljMMa09Q8IQO6SzmOqmUGFeofkpvpuCM
	2SmvZrka0sY+0lxNQpRQWhDB9PXGKrTU7bLqcVKR/i0AQrOvpfIZy+++qezVIa9FixdqOVgS5ez
	BtPmOUTTwlbeKK7HqXfNzKxn2kuIpnBUOLaWfK2OfAwjH3XFBDAFnasJYJiwirSLeSCndJqfV+S
	W2RiGI+6RRiD1O4+jvXK1uAt3Oe2UYVVPhqDKWN+RlGdd0JcNO940+hCMlDC91sXk5h0qMAXxy9
	VoVQubt/anUf4JA6KMd9YxS/53jN+b0GTR7M65uB2rtK6HpkZ2yhRgvhVAo/kLAZt+tUNX6Rv7h
	wRQ4YmS7HZNz0930GBopOKfqCsnAyMNi0WKhLD5+jvAKfO83k9Bg6mQfi8OT/MLgRfJhkvAPtPc
	N5y4DeiDbVmC/uX6pKwYntqmXYuoVkGRJkflZM8jOAk2KjnwLdZP5aQpUCdofvDige6hCNzZPLV
	D3AuDq0Dd6BvNk4s5I7JvwctFobueADfA==
X-Received: by 2002:a05:7301:540d:b0:33c:130b:458 with SMTP id 5a478bee46e88-33e8e986d8emr312080eec.41.1790108611306;
        Tue, 22 Sep 2026 13:23:31 -0700 (PDT)
Received: from gio.scai.dhcp.asu.edu (209-147-138-22.nat.asu.edu. [209.147.138.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm627194eec.2.2026.09.22.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:23:30 -0700 (PDT)
From: Giorgi Kobakhia <gkobakhi@asu.edu>
To: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Giorgi Kobakhia <gkobakhi@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] ocfs2: fix array out of bound access in __ocfs2_find_path()
Date: Tue, 22 Sep 2026 13:21:59 -0700
Message-ID: <20260922202159.2421642-1-gkobakhi@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__ocfs2_find_path() walks down the extent tree and records path by calling
find_path_ins(), which appends entry to path->p_node[]. It only has 5
spots.

A corrupted ocfs2 image whose extent block is pointing to itself causes
__ocfs2_find_path() descent endlessly, writing past the end of
path->p_node[] array.

 UBSAN: array-index-out-of-bounds in fs/ocfs2/alloc.c:677:14
 index 5 is out of range for type 'ocfs2_path_item [5]'
 Call Trace:
  <TASK>
  find_path_ins (fs/ocfs2/alloc.c:677 fs/ocfs2/alloc.c:1914)
  __ocfs2_find_path.constprop.0 (fs/ocfs2/alloc.c:1882)
  ocfs2_commit_truncate (fs/ocfs2/alloc.c:1924 fs/ocfs2/alloc.c:7286)
  ocfs2_truncate_file (fs/ocfs2/file.c:515)
  ocfs2_setattr (fs/ocfs2/file.c:1224)
  notify_change (fs/attr.c:556)
  do_truncate (fs/open.c:68)
  do_ftruncate (fs/open.c:194 (discriminator 1))
  ksys_ftruncate (fs/open.c:206)
  __x64_sys_ftruncate (fs/open.c:211 fs/open.c:209 fs/open.c:209)

Commit a406aff8c051 ("ocfs2: validate l_tree_depth to avoid
out-of-bounds access") already restricts el->l_tree_depth to be less than
OCFS2_MAX_PATH_DEPTH, which is equal to 5. However, does not handle the
infinite descent case.

Check if the el->l_tree_depth decreases on each descent. Maximum
descents are restricted to 4 and the path->p_node[] array does not
overflow.

Fixes: dcd0538ff4e8 ("ocfs2: sparse b-tree support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Tested-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Giorgi Kobakhia <gkobakhi@asu.edu>
---
 fs/ocfs2/alloc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index be09e766ac1f..c85a472965d5 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -1817,6 +1817,7 @@ static int __ocfs2_find_path(struct ocfs2_caching_info *ci,
 	int i, ret = 0;
 	u32 range;
 	u64 blkno;
+	u32 prev_depth = OCFS2_MAX_PATH_DEPTH;
 	struct buffer_head *bh = NULL;
 	struct ocfs2_extent_block *eb;
 	struct ocfs2_extent_list *el;
@@ -1824,14 +1825,16 @@ static int __ocfs2_find_path(struct ocfs2_caching_info *ci,
 
 	el = root_el;
 	while (el->l_tree_depth) {
-		if (unlikely(le16_to_cpu(el->l_tree_depth) >= OCFS2_MAX_PATH_DEPTH)) {
+		if (unlikely(le16_to_cpu(el->l_tree_depth) >= prev_depth)) {
 			ocfs2_error(ocfs2_metadata_cache_get_super(ci),
-				    "Owner %llu has invalid tree depth %u in extent list\n",
+				    "Owner %llu has invalid tree depth %u in extent list (max %u)\n",
 				    (unsigned long long)ocfs2_metadata_cache_owner(ci),
-				    le16_to_cpu(el->l_tree_depth));
+				    le16_to_cpu(el->l_tree_depth), prev_depth - 1);
 			ret = -EROFS;
 			goto out;
 		}
+		prev_depth = le16_to_cpu(el->l_tree_depth);
+
 		if (!el->l_next_free_rec || !el->l_count) {
 			ocfs2_error(ocfs2_metadata_cache_get_super(ci),
 				    "Owner %llu has empty extent list at depth %u\n"
-- 
2.43.0

