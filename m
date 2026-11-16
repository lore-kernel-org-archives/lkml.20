Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802174;
	b=Q+h1mG2xrwjkq4Ze0ucpiimOdLnocit6V+Pl2LLhhTgsoRnEAvsyFXTbpSyNPiiO6Ker
	 32tbCzcDAtbHOk3pzYc039J6XjJbLTOj0gEuUxcubbBTF1vNrS6+cqJaPzV4JzVkzL3FJ
	 h+ITs08UaxcvsR8vu4n1fPOY8AOHyH4623Fn6cmmHhwHc6K/K6vYEo7RdzyK1HPrawHA9
	 8imM/MpSTDi1NXWNl/89AbFfOXh7EJb+UfTCgMwzebeHnmGZQkz3F/FSbcjbDYX/Ujs4/
	 DK5Beco1QP6GZf7QhbYoLdCqQ89cFxDiQQsZBbUhyw4X/IRh2SirNuXQTYUnWQZ7Jew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l/kLLywOSWBBFLTEPiIbk+45w2BLqtK8W3R0cbQbwWA=;
	b=EcN35BoNGXp0jE/9q5i0107h/vKFVUuEuKpi+sveRXqjqsqyETtfVZvUUUq002Bl3dXD
	 M+TquInnDJk5YDSzNvryh1xnl710+GdMCjZc/d9A71OBXEUaQLoLbXLGlSxWv41T6gmpo
	 C3+wluAlW06vsEPWvTPI3ubvqDETTSA9gqBm/ouVULGsRBngvVF6/figE3tqN0BC6GVuC
	 SHpbu01D1nQYulfrpwoLEKGuJ/H9bqh+iUO/nEVmSc2+fOBWbEbcu9A9ZaZfMiahL1V7H
	 H4pM8Xfz9tr73KKWpQLnn+PPc57+ENf1gQcnDezacwFeMvRMrcYogeE4CX59volEH8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFWbf8vq;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60695606A897
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60695606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tFWbf8vq
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1224809a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802173; x=1795406973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/kLLywOSWBBFLTEPiIbk+45w2BLqtK8W3R0cbQbwWA=;
        b=tFWbf8vqs1/9miKrh9PPfbCoGD8YHEuNga5QRA9adsDaBLEtQpCxd4hUQAEMQGpxq3
         n0QkinQEv5h+L3Fg0rwXoy4ajbYaieHWu9PbuaXCKma7E+wApU5PCy8hmjZCW5tBEGmt
         PToknIrr4ZLr0Y87nNxAO6BcQFZJzZVuLXBKKuvRzhgwlG4VXa/2P9X7T8hvwsAZrOxF
         g04VjfVUlkD6TwJ5gI6nT2DAVZ39nnCQy9I/c1MKKg6eU2ptjPstxxsgJlV84gCJAsDD
         YiEtp4oxQcmJm1KPu40QH76C/fIsREBm4JqFfWr6tv93jP4Q+Sc8hEd+T9x+LJmcqVFr
         NnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802173; x=1795406973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/kLLywOSWBBFLTEPiIbk+45w2BLqtK8W3R0cbQbwWA=;
        b=uxFfb3XxxLjOatozEPNTmoxeJnoi3ObGu9P2RSPhEWqb2BTsYx9zkbqm+tse/Fsnmj
         WbrICuCk0cOGONg5gDxJ1EihmTSSvd3aMwW79rPAcrLeCf6hXtmfJf03FeuDlabvkRFL
         nWKSjWCLbPAFc0Q3zZMsKChpZkU0ZYxBOpAE+6XO1PF+5grLlYTPVCxGi3doPqQC+LK5
         So/YP+w4tu90k+xy7QiBzkYys+3RYELXFp+Uy8YOs6vXArAymAJj3oAACEFlDkLrXUuL
         OzWSQKXQ4V8C2s4OmcPi1MQx3TN7vqksO4+AQCAnhSoFuRklPXYlOhidMS5DznGIRws+
         FkwA==
X-Gm-Message-State: APuU4Z83Cxzhv0e+IVByn3gU1Odt+EBRKVgYD8Sxrxjqoxh7BPu3i1NI
	G9fcozXo3rQ8bJ49uSRFEJrYAypbhgFGAHaRPf61w0FBfmjRMmkwvj3fZbyQyg==
X-Gm-Gg: AYBFou0FknmNpNvHmATSUSqLjDp1/LnQlJMrTP18+kUM8eiVb2MaD5jWQ6MnKp2Y27y
	ROI57H4IbTVTDisygZ9Mr0dhQ9tXHBRIzUirLCIShZ0sAQ+SfzQWBBb+Rw8b+6/gt3yal/ULWqU
	1vDJ6FsfFqaoNaqLvKvoik2x0aYbGfmfU1flJmOOt/CGxPkLUqMvCEIic1VweKtRw2dnYA1aHnW
	oo9jmftyPQ2+qvGZGLzhngy0dTse5IslhtkJ/s6YU3daEpUKlbOq8TBuOVFWXJYHC5rCsriITNV
	1hwlQQ8qGdFv9fw3dmZgXqUYxlntCkOKSXoXaduw+GgDSEywGpRZrj8sHbxQ0FiDHm2/JiHxzii
	GgEcTW+2qLMwN+f0ioqMEHE9hEfeaAtKsp8MJUIXfPpBZvIoZ09+6oF1Mj+QPEGdm2T0ghZOHsf
	PcJLpoiuQsVJxKtDhDau3nqn4fbxPUcY/ZRSdUCq9mWCxXTcJyOAekg3SkMG7jsvdmAqsHXx3ur
	yHk7yqmyGlZL10iT8wbG0CcFTCOLo92UASomxBcHVErWQyrOPeiv8FyNS67GWxicI0bMQM0I4PE
	KT5YNI5RElqO+2Qk8qdJFICgmVonO7GG2UU7B9s4CsqdfdGpB6taow1Y9py6vCpi9kO5YFWY/wH
	V7fsHprwUU26bKHf4Je8WZ3FW8vFxgzU5f1ulQk4hefB+za0Wx8dnwpE64KrMlnQ1/YZo
X-Received: by 2002:a17:90b:3b82:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b1b0815b3fmr9869158a91.8.1794802172703;
        Sun, 15 Nov 2026 20:09:32 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:29 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 16/20] f2fs: preserve inline data in subpage block mode
Date: Sun, 15 Nov 2026 20:08:47 -0800
Message-ID: <20261116040851.2849696-17-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

A write to an inline inode converted it to a regular inode whenever the
folio held multiple blocks, allocating a block even for small files.
Convert only when the write goes beyond MAX_INLINE_DATA; otherwise read
the inline data into the folio and write it back to the inode block in
f2fs_write_cache_folios(). This also applies to an inline inode that
uses large folios when the block size equals PAGE_SIZE: its writeback
now goes through f2fs_write_cache_folios() instead of
f2fs_write_cache_pages().

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 54 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b4f16afccc51..7dd6764a9363 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4804,6 +4804,16 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 			}
 		}
 
+		if (f2fs_has_inline_data(inode)) {
+			err = f2fs_write_inline_data(inode, folio);
+			if (!err) {
+				f2fs_folio_clear_dirty_blocks(folio, true);
+				goto retry_out;
+			}
+			folio_redirty_for_writepage(wbc, folio);
+			goto retry_out;
+		}
+
 		folio_start_writeback(folio);
 
 		/*
@@ -4992,8 +5002,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	account_writeback(inode, true);
 
 	blk_start_plug(&plug);
-	if (f2fs_has_multiblock_folios(inode) &&
-	    !f2fs_has_inline_data(inode))
+	if (f2fs_has_multiblock_folios(inode))
 		ret = f2fs_write_cache_folios(mapping, wbc, io_type);
 	else
 		ret = f2fs_write_cache_pages(mapping, wbc, io_type);
@@ -5060,6 +5069,16 @@ void f2fs_write_failed(struct inode *inode, loff_t to)
 	}
 }
 
+/* Fill @folio from the inline data for a write within the inline area */
+static void prepare_inline_write_begin(struct inode *inode,
+		struct folio *folio, struct f2fs_cached_block *ientry)
+{
+	f2fs_do_read_inline_data(folio, ientry);
+	set_inode_flag(inode, FI_DATA_EXIST);
+	if (inode->i_nlink)
+		f2fs_cache_set_inline(ientry);
+}
+
 static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			struct folio *folio, loff_t pos, unsigned int len,
 			block_t *blk_addr, bool *node_changed)
@@ -5113,10 +5132,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (f2fs_has_inline_data(inode)) {
 		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(folio, ientry);
-			set_inode_flag(inode, FI_DATA_EXIST);
-			if (inode->i_nlink)
-				f2fs_cache_set_inline(ientry);
+			prepare_inline_write_begin(inode, folio, ientry);
 			goto out;
 		}
 		err = f2fs_convert_inline_folio(&dn, folio);
@@ -5535,7 +5551,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * and #0 page. The locking rule for inline_data conversion should be:
 	 * folio_lock(folio #0) -> folio_lock(inode_page)
 	 */
-	if (index != 0 || f2fs_has_subpage_blocks(sbi)) {
+	if (index != 0 || (f2fs_has_subpage_blocks(sbi) &&
+			   pos + len > MAX_INLINE_DATA(inode))) {
 		err = f2fs_convert_inline_inode(inode);
 		if (err)
 			goto fail;
@@ -5592,6 +5609,23 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	blen = min_t(unsigned int, len,
 		     folio_size(folio) - offset_in_folio(folio, pos));
 
+	if (f2fs_has_inline_data(inode) && f2fs_is_multiblock_folio(sbi, folio)) {
+		struct f2fs_lock_context lc;
+		struct f2fs_cached_block *ientry;
+
+		f2fs_map_lock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
+		ientry = f2fs_get_inode_cache(sbi, inode->i_ino);
+		if (IS_ERR(ientry)) {
+			f2fs_map_unlock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
+			err = PTR_ERR(ientry);
+			goto put_folio;
+		}
+		prepare_inline_write_begin(inode, folio, ientry);
+		f2fs_put_cache(ientry, true);
+		f2fs_map_unlock(sbi, &lc, F2FS_GET_BLOCK_PRE_AIO);
+		return 0;
+	}
+
 	/*
 	 * Flush the cached IO of this folio before touching it, especially
 	 * for the large folio prepare below which reads and updates subpage
@@ -5700,7 +5734,8 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	if (!folio_test_uptodate(folio)) {
 		if (unlikely(copied != len)) {
 			copied = 0;
-		} else if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio)) {
+		} else if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio) &&
+			   !f2fs_has_inline_data(inode)) {
 			f2fs_ffs_mark_subrange_uptodate(folio,
 					offset_in_folio(folio, pos), len);
 		} else {
@@ -5727,7 +5762,8 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	if (!copied)
 		goto unlock_out;
 
-	if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio))
+	if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio) &&
+	    !f2fs_has_inline_data(inode))
 		f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio, pos),
 								   copied);
 	f2fs_folio_mark_dirty(folio);
-- 
2.56.0.611.g1030f0b940-goog

