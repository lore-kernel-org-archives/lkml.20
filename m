Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574603FD12A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763254; cv=none; b=kdTV3/8ENsh5jQF2nNeCUrv/otUCO/pcmtI0AXPhLD659aapVqhMJyv7WK5SkonEP4XDxmnbgPxpXsLfqVZnmz+lI3lNQo/vw4nh3CoA7Sd7c+AkVn8HakPFwR5VCdJ9xPKEXRJn86R7Hn5rDtoGVcpDsvQU/iuwYdBRYCtqej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763254; c=relaxed/simple;
	bh=zECSL8mnlm24myrmAvLalG+mV0LLL/8FWL+o1Vt9amA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qLNtR7cWWe5tNZ3za9F8816KiBY2vY0i6+9E6xtgGwkMtaZwdZCkNCK0Vv0poH8kgIDelt5Faopfx3lo7NgKBa9euM+RskHfmB0D3+izmB02UNBkKWyM3AnspalseBU7LhAADA8bit8pg/937SSkNS8omsr56LHjEbUVRzNb1iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF6qOaSc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF6qOaSc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2485415a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763253; x=1789368053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzhAqXJ9vWQk0Vlafubd998WTycCm4mOzi94WOJ1k/U=;
        b=bF6qOaScE1cOWWpDDRthBmN0e1HGSBO7yXejvGGTdhLqJ4idLkWYhHT4RBooANz81W
         TU0F+PMKgeXFLnYWa13LxU6i/GxIhX+MjfIkhHtYhxOB5RRJo+hmh3ti9Lfl/Z4F+ot/
         7yWAMpW3yPDzeYUfDIp8KwATPWfDwcvwL14WmOFn7oIffQy4J70/h2YwRG3zioxEQ2Ae
         AMN1GREuE08JCvXOVlSV0bD3gu0K27ymT4kmLixo9jdAeyLn8Rw6YAoAfKVRTJ71Ilcl
         HmwXE0lCa7adf4vbbSgK2ONRxVUgz3X5l4qWOg0zrNaA+J82st95/Mgi9/GLXwdDHRYo
         j7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763253; x=1789368053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzhAqXJ9vWQk0Vlafubd998WTycCm4mOzi94WOJ1k/U=;
        b=QJo5lRrbiZHwelgeIAiP+ICj5kS+saDIBgIms7/TInggGHYIsvVYlUugQvIVwVMosA
         1EuiL5aFGbrNnGF8NWk+KLX8cH0rPXXZDWL+7cQytD6wH/tGpJQmYgboT0tVWiXY71pI
         mFfQ04Zam3BKweAaYQ0DWRU64jw+cVIeVIjGpxbMYSYt/+dYO6TBj5NQhruJTPx971ZB
         p51VJVHGsWOuY8UJdmSkrkHTjZTligQyGEI7Tf/I+xrvjBUj01GXvmt8UiGcqJ8YF+Rx
         wwrMD7HGmyka7ORleJu3LrLLljGNwlBb34XNrbCqB9j69KVtHIdxlLTNliv5/AEwHiQD
         Mo0Q==
X-Forwarded-Encrypted: i=1; AKwUvByawDt4m18pu+vHk99Nfu26BkuXBzA309daBvv+w+8m1x02deWGbjMLonzi4rwCmNegTBhcGVDz/oBfgaw=@vger.kernel.org
X-Gm-Message-State: AFuF++mcS2QQEs9+eG/3yXq9fv2saPwquUxkFshmOAzQnRryX41yLfle
	lqHzTTjo/dDLGST3wd9VRuoGA592b7AKvqU9E73nFrljsw/2zxW1snZg
X-Gm-Gg: AYBFou07i3owOAz+rplm3oULJXrRPAPJJMqOsHmqTVJWXrB9aftxM6fhLZ5d2tj8hyc
	w1KJGM/MIHLK/RPbP4yqQ3eaV9jgWV+/DE3vb3QBWBuyKbyjQ0SzU23BoA0qswnLQYY3wmL0+7o
	zwVB5oV91L6n52CsdvjtNGYuao4uPGe02iAzmHujoBe/GE1RqFin7KYm7mlnEaM9qKos26xPmsj
	Y0gLHusCXcmbdy/71dVullC/1ROrqDWlPYzST6hLKwJrqrYyqK901kcQ0VkaIS2jsoW0MoJRv9j
	FncG4JTy70cstAfxA6Vw3ZTuAhJbaMVbqKdhz+lvxwBwIx0r3Gl5Jb5XDHdkqdmPdnGEBEIkz2O
	u/075hezBwiKGSS8RxRDL4H8s+UzZBAr4PNVXRiE9nwY6bKfdDuYtIENQJa4NCCMgQ5LSuXv2/t
	4GV3ByZhnZYc2KW+BXzHVSdiwYiHsZWKDDyd5DTNV+6ex8CXfdj1eOG1KhfmvJnLci758XeOFk5
	IicHo/RX9g77g==
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr33393164a91.24.1788763252559;
        Sun, 06 Sep 2026 23:40:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24475545eec.22.2026.09.06.23.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:40:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Jan Kara <jack@suse.cz>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ext4: fix typos in comments
Date: Mon,  7 Sep 2026 12:10:46 +0530
Message-ID: <20260907064046.36515-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/ext4/extents.c | 2 +-
 fs/ext4/inode.c   | 2 +-
 fs/ext4/mballoc.c | 8 ++++----
 fs/ext4/mballoc.h | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 76038b6c3655..d5d7ee229e4a 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -3186,7 +3186,7 @@ int ext4_ext_zeroout(struct inode *inode, struct ext4_extent *ex)
  * @handle: the journal handle
  * @inode: the file inode
  * @path: the path to the extent
- * @split: the logical block where the extent is splitted.
+ * @split: the logical block where the extent is split.
  * @flags: flags used to insert new extent to extent tree.
  *
  *
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bd4b778df9eb..e719fa3cbaaf 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2163,7 +2163,7 @@ static bool mpage_add_bh_to_extent(struct mpage_da_data *mpd, ext4_lblk_t lblk,
  * @bh - buffer we should start processing from
  * @lblk - logical number of the block in the file corresponding to @bh
  *
- * Walk through page buffers from @bh upto @head (exclusive) and either submit
+ * Walk through page buffers from @bh up to @head (exclusive) and either submit
  * the page for IO if all buffers in this page were mapped and there's no
  * accumulated extent of buffers to map or add buffers in the page to the
  * extent of buffers to map. The function returns 1 if the caller can continue
diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 06171a11db12..47156ce9e5c0 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -234,7 +234,7 @@
  *
  * there are two types of preallocations:
  *  - inode
- *    assiged to specific inode and can be used for this inode only.
+ *    assigned to specific inode and can be used for this inode only.
  *    it describes part of inode's space preallocated to specific
  *    physical blocks. any block from that preallocated can be used
  *    independent. the descriptor just tracks number of blocks left
@@ -2326,11 +2326,11 @@ static void ext4_mb_check_limits(struct ext4_allocation_context *ac,
  *   stop the scan and use it immediately
  *
  * * If free extent found is smaller than goal, then keep retrying
- *   upto a max of sbi->s_mb_max_to_scan times (default 200). After
+ *   up to a max of sbi->s_mb_max_to_scan times (default 200). After
  *   that stop scanning and use whatever we have.
  *
  * * If free extent found is bigger than goal, then keep retrying
- *   upto a max of sbi->s_mb_min_to_scan times (default 10) before
+ *   up to a max of sbi->s_mb_min_to_scan times (default 10) before
  *   stopping the scan and using the extent.
  *
  *
@@ -3029,7 +3029,7 @@ ext4_mb_regular_allocator(struct ext4_allocation_context *ac)
 	 * is greater than equal to the sbi_s_mb_order2_reqs
 	 * You can tune it via /sys/fs/ext4/<partition>/mb_order2_req
 	 * We also support searching for power-of-two requests only for
-	 * requests upto maximum buddy size we have constructed.
+	 * requests up to maximum buddy size we have constructed.
 	 */
 	if (i >= sbi->s_mb_order2_reqs && i <= MB_NUM_ORDERS(sb)) {
 		if (is_power_of_2(ac->ac_g_ex.fe_len))
diff --git a/fs/ext4/mballoc.h b/fs/ext4/mballoc.h
index 39333ce72cbd..571d9bd93810 100644
--- a/fs/ext4/mballoc.h
+++ b/fs/ext4/mballoc.h
@@ -86,9 +86,9 @@
 #define MB_DEFAULT_LINEAR_SCAN_THRESHOLD	16
 
 /*
- * The maximum order upto which CR_BEST_AVAIL_LEN can trim a particular
+ * The maximum order up to which CR_BEST_AVAIL_LEN can trim a particular
  * allocation request. Example, if we have an order 7 request and max trim order
- * of 3, we can trim this request upto order 4.
+ * of 3, we can trim this request up to order 4.
  */
 #define MB_DEFAULT_BEST_AVAIL_TRIM_ORDER	3
 
-- 
2.48.1

