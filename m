Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648438;
	b=BX8iOtBEW8xj9sp6spwdLOyAKz9Lw/DH7Ymga2l6zXMaB4Z7YyRFOr22rdyK8OB6AwYT
	 6u4eWS5Of+D4cJZ+im8D4DjBk5UpefPKVbE+bVUnoIOLjs31NEGHSf3D9yNPL2stdofmq
	 J/Pb9tKs8uG+qKW3BJ/zIIOg5YtVkqsciI727QKSRuhp4Y7NGQSO39dlURcgOLHoUNhGj
	 /sR6d0mvF8JCFc9YOzuMyqIft49qN/wYMmJDSn3BzyUwHKbCJ6rr51qPpcJ2UIGejG/tB
	 PBBQesksVxZOe95XZmUJJdVNG7t5nEcytLYq27t/FMDpcm9TeZSuvo+5O0PUN3bvenQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/OMHA/5duEqXXG8e2OhiyICgmgVvLKQ6iYWKm0v5+Lk=;
	b=awtT/XEzN8cYQgXMWsI/k2ZOKuYilIlX3fWIa3Xq6ZGg+fQYm/2M8avSeZaHtGdJeol0
	 5/8BoJ0pbt67lBeKp5lRT/mbCqFKSVgp10DbA258RA3arZQIFvDmd86n1c6eCDNFgaqa0
	 FgEIP+HllhHXlPOMPR8bist4Vp+nZ8MGu4LZYNDFSqFqwick/u6hD8cIiCa7Mw276o3rZ
	 Nf9YocABRr0YpYVUKPLIX5u2R8wEpsl5VlAmhZEPrnWYzCp8PKLIfdBGmXNXZB8bVt142
	 xEmBoiPvW1x/Oa9x4kxiANMp1lo2AX2D5gURfjT6QHB6goSvxstT1Tdw4u1R1o2S5VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVtxKiiv;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E8606D80E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165E8606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVtxKiiv
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1431699a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648437; x=1794253237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/OMHA/5duEqXXG8e2OhiyICgmgVvLKQ6iYWKm0v5+Lk=;
        b=WVtxKiivhYY0y/nj23Cw3HkDHwebSNDuhlrvJYJuLhMN2tiZrYr2SMneUKgfZYzoWc
         zUferboAt+3Bzl7MWCP7yeOM8AmUZtuLaGDC1f0qq5fLmUdQJTlFzcArxKUHQUsWFfnn
         n1Z93KIGoSQ0cMbaDNdy1Q3N5ScTKlBGP9HhiyydIGiIPcsMDj8hxZBx7/6WppklMlic
         +xx/cLsT2lAKjX9WXE7yDQ2Y3lIj04pQ1outkJm0h/awoWoNtA/vybj/E0ljTPEeXX7V
         nWWPMfKJmfHY1Tvjop0leIUHvbcE077F0LyD+tkIVvxC/vTdNaFCkJzNwdBaUpXw+gW8
         80tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648437; x=1794253237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/OMHA/5duEqXXG8e2OhiyICgmgVvLKQ6iYWKm0v5+Lk=;
        b=PBkKsZJ1yO5UgQv8+Y94JUsD5QRFePzIl6bIIVh5wpup5Bmi0uZmH4rn2c9kVflMeq
         PHSKxL8vdMl8nL5uS9lx6iLIGVUgxikqOkw0tsMaWleIDj0iDVZTYWKtKNB3QgdSpnZj
         NfGHvqiMEPbmXKprTqHun4yyR/cG+GNlSjx/9YSbQgK4oaIGsxR0OAGF8k3uLyJU7usK
         DRCoq5OPgBtY0evSnJaF1HxqBzqFw3gVGe9mxRgYteIzuhOGk+hqNJUoDI2m1+Eedr6i
         NxH9O7rjMHSsvX3L/UCx+pBxjz4IPI5EHUjNznsvOFZYi0vDxNWRjFotFDf4Km7gbKAs
         23OA==
X-Gm-Message-State: AFq9FYKxDcj1O/MW3d1DpCDu/eB6iBnRw7x0UbCB6Minn6m8dmdiyiHT
	YAx7yzPTBWsqFN1bLuUzhtkPYZqqU7I/pW7lKBtb1FH919vg3EGgeSl6tZHSB4Kb
X-Gm-Gg: AYBFou0cvRFgf68foXb7AW2wRnqZ6P174nOUCmHN0hKz0E0XFBrRqfXtzUF24cBvnG7
	X4hfSMhL+XjZGTf+7ODFcpnJyD3tkOWkNQsg4xURDKPBwZSawLeTt0cPRe1nJRKxfWLBOM4tHhf
	QnAXiA0BnoIauwPfhFxDoOZW9rsWbRBYciyilDKC1YyKMaxJUTDFHZH4HsRnrL/ojBlH+a1lrMY
	mvzc2UXHrvG1KtiBnGa60+xbKjy7sBMwE7RSdn6rgjLhfF6DjdrnHh+R2fCiaCglC+yY8dt7ZR2
	LyNwWKUvg+roLKP7BsScJBv11i4kNCl5tA4HhiVFB6QL7N3f9HTc69WGnpMmXltB1xuYSsE4XUh
	fYvQqiNL2gvclnG5WX62gqfZgcgvXU3EYAJIvVQu42yJgqeveg9FcW1y4wsJyqxnF5tNApodj27
	YoHXcQLwKHYdvNInnV5YJKXAR8ChuG9xTp0N05XnDNhqMzjQqvLctE3DPtTvTgDTRHBGAmX8tiT
	bMUuZZpYyOglscjnMhq0OLV8IQbQKDwqGP7guZ6w7qd5ln97yXsxe0sDoCw3XmuO9QXmt0pMytP
	hNrmwB3q9xXEaMqBvVPLlzmSJslbeDMsemVkqRwI3GBpihw0eoYmSju0UbfdCrKSSLp8NJAyeGH
	45P+0scTrLBcyRV+I4us6uXlqWOzU5jVBZjSTZLBqzCGQhnnCDjfNqolMrQjXN77O0G8=
X-Received: by 2002:a05:6a21:6190:b0:3e2:6825:beec with SMTP id adf61e73a8af0-3e928df4bbamr9908575637.19.1793648437422;
        Mon, 02 Nov 2026 11:40:37 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:35 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 16/20] f2fs: preserve inline data in subpage block mode
Date: Mon,  2 Nov 2026 11:39:48 -0800
Message-ID: <20261102193952.3002018-17-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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
f2fs_write_cache_folios().

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 59 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4e4d1b0d6004..a7cc7231b572 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4732,6 +4732,21 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 			}
 		}
 
+		if (f2fs_has_inline_data(inode)) {
+			err = f2fs_write_inline_data(inode, folio);
+			if (!err) {
+				f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+							folio_size(folio));
+				inode_sub_dirty_blocks(inode, f2fs_blocks_per_folio(sbi, folio));
+				goto retry_out;
+			}
+			if (err != -EAGAIN) {
+				folio_redirty_for_writepage(wbc, folio);
+				goto retry_out;
+			}
+			err = 0;
+		}
+
 		folio_start_writeback(folio);
 
 		/*
@@ -4913,8 +4928,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	account_writeback(inode, true);
 
 	blk_start_plug(&plug);
-	if (f2fs_has_multiblock_folios(inode) &&
-	    !f2fs_has_inline_data(inode))
+	if (f2fs_has_multiblock_folios(inode))
 		ret = f2fs_write_cache_folios(mapping, wbc, io_type);
 	else
 		ret = f2fs_write_cache_pages(mapping, wbc, io_type);
@@ -4981,6 +4995,16 @@ void f2fs_write_failed(struct inode *inode, loff_t to)
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
@@ -5034,10 +5058,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
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
@@ -5454,7 +5475,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * and #0 page. The locking rule for inline_data conversion should be:
 	 * folio_lock(folio #0) -> folio_lock(inode_page)
 	 */
-	if (index != 0 || f2fs_has_subpage_blocks(sbi)) {
+	if (index != 0 || (f2fs_has_subpage_blocks(sbi) &&
+			   pos + len > MAX_INLINE_DATA(inode))) {
 		err = f2fs_convert_inline_inode(inode);
 		if (err)
 			goto fail;
@@ -5510,6 +5532,23 @@ static int f2fs_write_begin(const struct kiocb *iocb,
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
@@ -5618,7 +5657,8 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	if (!folio_test_uptodate(folio)) {
 		if (unlikely(copied != len)) {
 			copied = 0;
-		} else if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio)) {
+		} else if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio) &&
+			   !f2fs_has_inline_data(inode)) {
 			f2fs_ffs_mark_subrange_uptodate(folio,
 					offset_in_folio(folio, pos), len);
 		} else {
@@ -5645,7 +5685,8 @@ static int f2fs_write_end(const struct kiocb *iocb,
 	if (!copied)
 		goto unlock_out;
 
-	if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio))
+	if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio) &&
+	    !f2fs_has_inline_data(inode))
 		f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio, pos),
 								   copied);
 	folio_mark_dirty(folio);
-- 
2.56.0.317.g454f8302e1-goog

