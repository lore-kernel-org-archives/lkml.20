Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3BB37E5EB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756490; cv=none; b=LXW/XfYU+c7lRAGdvce8jW+EKSXYiz5tYLBBpilsxaGzD0pZY7py28bhV93w99491XtoxuS33N+i6Inlrhrs8t7tCCCuw5HX+aJYIWeq6+g7UvcfO1PiQATWLcxiOV2EWZjv9yZK0w+o8Luh3ZFYxuBvWh5jMlVcJ2fl2wtrCCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756490; c=relaxed/simple;
	bh=yE73HYjIWFsMgXM5M9g2jmcIxbPu6z7OKfJu9nuOozk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlSUt42TfLkDRi+HHWJA0j7TU3pC9qd4lvCZphUem0i/xTRrqhOCHf1MdvHbxyHAt5M9gmaNy9TM8jqLaPivRNjp2DW8iSSaUK+zVoSwOIR78QsbBDRs8sP1Z/Esvg8ZvbDvup1XLDuxYhvLhj6JKhAIOjlYEKORNuOCQ2Xh/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0WUNjw/; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0WUNjw/"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b1bcd9e00bso2506560eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756487; x=1789361287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dp9p5ajTef11aSUbLM0CCYywOKyybhsy5AMpH775xoI=;
        b=Q0WUNjw/LK2t9ncf/DIpD844w4xsx0Akbi9b8Phnh2BD2N1G2shu8/RAx9q69mtcn+
         ZRybUkJrm5PeDcwOzt/SohY/yedtNpEsi28AwknyES6iNLxN1XeaM61v/F7Ye2Qk2P+l
         mW7wzZaGhkpdtKYNdpoZQyq2l5UxtbYSIMBcNWwN4INXkEhAxDxFgmIyKfAoGiFCsRyt
         x/RLSq3zpdKllv9HouH2waeo2wbFxRLkD6mF2g4qPxK3Bhyl8TfZcw9X+sF5aElTFvt/
         3AiBDRJAvZ0A3AnWLTkVd/gwKDUlliBIwyFePJOiEI/3GFQGpToT6FG2WW9fX0Q+47OO
         SN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756487; x=1789361287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dp9p5ajTef11aSUbLM0CCYywOKyybhsy5AMpH775xoI=;
        b=FgHzH3djNixBqvZdjV8dTtLPGGOQdmHo1y0Q5S1b2kTI9+Cge9Q4oM6rNQIzTa5rRF
         WoevvcWaengwhksKbUyv9Ve+rduzDQeObBE1YZdYyAoZCOyuLaC9SG9dvdr1tT2Hl0SM
         krtnB2IrwVZxANXpapu3S288bcAJY52YXUcoCVdTh+dnkD4EiMT1BvrgNs/6lJ7kE72n
         DxBbZpMlgx9rzdjhqfJTAqnYTXJBbUyRqnistnL2qalMIfunY6gatp8flyROO4+w26Z9
         v7F6dAX5+VGVzg6lsZQ8ejvt2V1naLUxfj9QXf+E3tOSbfd9d6Mek25v8BRUXCv2IduN
         nT8A==
X-Forwarded-Encrypted: i=1; AKwUvBzw4lp+TnfExEb47hvXPN3kEs5BlyAUqJ4rJ4xqsHztlE2Ggjl2owZPqS1CJb++zySQ8/+0Q3teB7A7ljk=@vger.kernel.org
X-Gm-Message-State: AFuF++mCapAvIXHm1Kd+kGRc1EbPTSxXgYmgHWdMMv3p8SUqe/reoP8d
	Ehu2qlLSYXa7d/Onan1BCveT/ijSZyuP0rNUQvTTlClRaIoaR8xuewp5
X-Gm-Gg: AYBFou3JoQ7I+Mw1G2uib0tsj9Lq2W4BfJrRedj4C9zbx6ydiQIxIr2sE3zeghRU4XV
	QvZD/3S5ndqjvZEsrUuzXOmU/UU81GA/nlxcrv++jSJqeAcEA4j3pjD1fLS3RHhGmhHeETmYhM/
	DPUqdS+E3mB1cCMt9tdLIHNWpGjGhy7HR3k4u1VQ+chvu7swIZWkhzt0YoiEWsq7l0Ot0Ixx/Im
	URqoxWZrOfawJmcxHzumPBZHdjbGfbg8rK+waZBxaOCE/HphZ1nviW8U0z8zm6KPW3iH5yU0gJl
	cUy4TEPdFub4WUrtFqZlOC/2C1lKRmK5ZcupPKU+t1Bq4xQKZZiSjHkYjU+OWX2fLq/0bxwKI/4
	kAsxjWkEztRzD8vsHTu8RODj4PnQkSUJuESbkrtf5fghpoyP8hfvrx0vpEz/0y5pvcYMzG0cvYp
	Dv2QF7hCT1AfUhbHGsD6x+sbgTJcTgyMnzKPsc1R67ljDLe9oDMm23vUTztxXmkyzWPKFQJWgul
	LrF/xTIDcjOC8s=
X-Received: by 2002:a4a:ec49:0:b0:6b8:d957:2803 with SMTP id 006d021491bc7-6b8d9572e0bmr6372376eaf.20.1788756485966;
        Sun, 06 Sep 2026 21:48:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm21615763c88.0.2026.09.06.21.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:48:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] btrfs: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 10:18:01 +0530
Message-ID: <20260907044801.9088-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings and repeated words in comments, found with
scripts/checkpatch.pl and codespell.  Only touches comments, no code
changes.

Changes since v1:
 - the typo and repeated-word patches are folded into one, as they only
   touch comments
 - rebased onto btrfs for-next
 - picked up the further typos codespell found, which David Sterba
   listed: Temporarilly, Checksume, coresponding, caclulated, wheather
   and cannnot ("commited" in block-group.h was already fixed by v1)

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/btrfs/block-group.h          | 2 +-
 fs/btrfs/extent-io-tree.c       | 2 +-
 fs/btrfs/fs.c                   | 2 +-
 fs/btrfs/raid56.c               | 8 ++++----
 fs/btrfs/send.c                 | 2 +-
 fs/btrfs/transaction.h          | 2 +-
 fs/btrfs/tree-checker.c         | 2 +-
 include/uapi/linux/btrfs_tree.h | 4 ++--
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/btrfs/block-group.h b/fs/btrfs/block-group.h
index 69d56864d4ba..b349f94cf929 100644
--- a/fs/btrfs/block-group.h
+++ b/fs/btrfs/block-group.h
@@ -135,7 +135,7 @@ struct btrfs_block_group {
 	u64 global_root_id;
 	u64 remap_bytes;
 	u32 identity_remap_count;
-	/* The last commited identity_remap_count value of this block group. */
+	/* The last committed identity_remap_count value of this block group. */
 	u32 last_identity_remap_count;
 	/*
 	 * The last committed used bytes of this block group, if the above @used
diff --git a/fs/btrfs/extent-io-tree.c b/fs/btrfs/extent-io-tree.c
index d6df11f6088c..992b8b42bdb4 100644
--- a/fs/btrfs/extent-io-tree.c
+++ b/fs/btrfs/extent-io-tree.c
@@ -751,7 +751,7 @@ int btrfs_clear_extent_bit_changeset(struct extent_io_tree *tree, u64 start, u64
 				btrfs_split_delalloc_extent(tree->inode, state, start);
 
 			/*
-			 * Temporarilly ajdust this state's range to match the
+			 * Temporarily ajdust this state's range to match the
 			 * range for which we are clearing bits.
 			 */
 			state->start = start;
diff --git a/fs/btrfs/fs.c b/fs/btrfs/fs.c
index de160d29dde8..75a1217727a7 100644
--- a/fs/btrfs/fs.c
+++ b/fs/btrfs/fs.c
@@ -79,7 +79,7 @@ void btrfs_csum_init(struct btrfs_csum_ctx *ctx, u16 csum_type)
 		blake2b_init(&ctx->blake2b, 32);
 		break;
 	default:
-		/* Checksume type is validated at mount time. */
+		/* Checksum type is validated at mount time. */
 		BUG();
 	}
 }
diff --git a/fs/btrfs/raid56.c b/fs/btrfs/raid56.c
index a5d0ef09d92a..4f702dbf581b 100644
--- a/fs/btrfs/raid56.c
+++ b/fs/btrfs/raid56.c
@@ -953,7 +953,7 @@ static void rbio_orig_end_io(struct btrfs_raid_bio *rbio, blk_status_t status)
 
 	/*
 	 * Clear the data bitmap, as the rbio may be cached for later usage.
-	 * do this before before unlock_stripe() so there will be no new bio
+	 * do this before unlock_stripe() so there will be no new bio
 	 * for this bio.
 	 */
 	bitmap_clear(&rbio->dbitmap, 0, rbio->stripe_nsectors);
@@ -988,7 +988,7 @@ static void rbio_orig_end_io(struct btrfs_raid_bio *rbio, blk_status_t status)
  * as possible, and only use stripe_sectors as fallback.
  *
  * Return NULL if bio_list_only is set but the specified sector has no
- * coresponding bio.
+ * corresponding bio.
  */
 static phys_addr_t *sector_paddrs_in_rbio(struct btrfs_raid_bio *rbio,
 					  int stripe_nr, int sector_nr,
@@ -1451,7 +1451,7 @@ static int rmw_assemble_write_bios(struct btrfs_raid_bio *rbio,
 	ASSERT(bitmap_weight(&rbio->dbitmap, rbio->stripe_nsectors));
 
 	/*
-	 * Reset errors, as we may have errors inherited from from degraded
+	 * Reset errors, as we may have errors inherited from degraded
 	 * write.
 	 */
 	bitmap_clear(rbio->error_bitmap, 0, rbio->nr_sectors);
@@ -2632,7 +2632,7 @@ static int alloc_rbio_essential_pages(struct btrfs_raid_bio *rbio)
 	return 0;
 }
 
-/* Return true if the content of the step matches the caclulated one. */
+/* Return true if the content of the step matches the calculated one. */
 static bool verify_one_parity_step(struct btrfs_raid_bio *rbio,
 				   void *pointers[], unsigned int sector_nr,
 				   unsigned int step_nr)
diff --git a/fs/btrfs/send.c b/fs/btrfs/send.c
index 5c59b9abedcd..c523bf950c89 100644
--- a/fs/btrfs/send.c
+++ b/fs/btrfs/send.c
@@ -7023,7 +7023,7 @@ static int changed_extent(struct send_ctx *sctx,
 	 * get modified or replaced with a new one). Note that deduplication
 	 * updates the inode item, but it only changes the iversion (sequence
 	 * field in the inode item) of the inode, so if a file is deduplicated
-	 * the same amount of times in both the parent and send snapshots, its
+	 * the same number of times in both the parent and send snapshots, its
 	 * iversion becomes the same in both snapshots, whence the inode item is
 	 * the same on both snapshots.
 	 */
diff --git a/fs/btrfs/transaction.h b/fs/btrfs/transaction.h
index 3a57f227b5ed..89153cd22596 100644
--- a/fs/btrfs/transaction.h
+++ b/fs/btrfs/transaction.h
@@ -288,7 +288,7 @@ do {										\
  * Call btrfs_abort_transaction() as early as possible when an error condition
  * is detected, that way the exact stack trace is reported for some errors.
  *
- * Error number must be negative as it encodes wheather it's the first abort.
+ * Error number must be negative as it encodes whether it's the first abort.
  */
 #define btrfs_abort_transaction(trans, error)		\
 do {								\
diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index 401fd40ec7b2..b8ca9980e1dd 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -228,7 +228,7 @@ static bool can_have_extent_data(struct extent_buffer *leaf,
 	}
 
 	/*
-	 * The rest are special files, e.g. block/FIFO files, which cannnot
+	 * The rest are special files, e.g. block/FIFO files, which cannot
 	 * have any file extent.
 	 */
 	return false;
diff --git a/include/uapi/linux/btrfs_tree.h b/include/uapi/linux/btrfs_tree.h
index b6ccaf848e4b..47ee52859b45 100644
--- a/include/uapi/linux/btrfs_tree.h
+++ b/include/uapi/linux/btrfs_tree.h
@@ -230,7 +230,7 @@
  *
  * Stored as an inline ref rather to avoid wasting space on a separate item on
  * top of the existing extent item. However, unlike the other inline refs,
- * there is one one owner ref per extent rather than one per extent.
+ * there is one owner ref per extent rather than one per extent.
  *
  * Because of this, it goes at the front of the list of inline refs, and thus
  * must have a lower type value than any other inline ref type (to satisfy the
@@ -243,7 +243,7 @@
 #define BTRFS_EXTENT_DATA_REF_KEY	178
 
 /*
- * Obsolete key. Defintion removed in 6.6, value may be reused in the future.
+ * Obsolete key. Definition removed in 6.6, value may be reused in the future.
  *
  * #define BTRFS_EXTENT_REF_V0_KEY	180
  */
