Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391CA1A682B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373815; cv=none; b=cnTvEnjrKgSbi+JE9Atz78QAP36rOpTMH7zF+8anaqWI3y+NRPDSss7Y+TRLksRKOHJuUt6eL/UyzPtiGf+NDNBoYfIr5biUS+ByEX4JclRAa1ofLlnaKx+wq9wqZsFLaQxMbQyag1guricJDdd8wLYIxcuKoeI0gM2ChXx4Mww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373815; c=relaxed/simple;
	bh=gg1Eg3grSOXqtPPw/A55ylEO03zJxiB6MeqK2htP9Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f8pOk1TTdHBjr8azsIyGglzfAL9E6j1tRaU7iRQZrLvo5GnDD/qxUYjdsTESnFeQEAehbwX4D0q8SkRHZ8vghRDsPWwM0oDJ5/nkxHqpQVtyVD9fv/KFuC2v75Y4J8pT5hevnU5A/F4r6yDloUTYpgT5+BApxgs+lVSPqPJRh5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lexfz9BF; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lexfz9BF"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eab5aa12cfso21585e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792373813; x=1792978613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCYDjUky7P1HlkzA/7ybKt6L8LweVSenXoz8RSv4Bks=;
        b=lexfz9BFTOV8OJUA6kZRbEBhJWAUUxLhHvfSohJEIGUnyNIvju6x0Ni/pPjUxpthIZ
         rHykD9eblQUIbSYwfU0PM2YViCtQ1lHreapOD361Hf2Gu5jFp/k434LOm7zCBZGQj5qE
         05hNVifXIObq4kcbg0xPlXgQcikXV4EthOyeBjIhhRSb2wNG2jTmtTvPtLdaMU1TAcRU
         8JyM+Zsw5c/1Pw2whvqIHhBRpQwceC1gV606MpSLYLWTIxJObYc5xVPZdPpnHBU0R/ky
         Eo8VtwDIj10eEOAPlouCJZb6kES0xRHuQfw9MwFRPpjLtlBb5WoNsF+D3JpQ1aH06+jZ
         jeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792373813; x=1792978613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCYDjUky7P1HlkzA/7ybKt6L8LweVSenXoz8RSv4Bks=;
        b=zuIUM9yvxh4cdgjm/yrHjfMKA4MYKgmfg6pJ5d2wryeQRBM+A/R9VgvuEK3M/AyUTF
         VzX0cFZIq06IyqmQGTGAjdnYahhYTlOVw2/Ph/KGXp3se72AnpCNhWXnaz4QTUQUeFij
         07QizKtmniDhYp2jkLJzXW6AhusDecMmOnv7/bG1mNxCF0S3JCFGeYMBCDBYAcWvnTzz
         ZMIBtd2SFe/HgsOR1hYiEIQmATHbp+Pu0iYxlPVk/cKoSObuUVMBFYtCvtS22V9Df5Nu
         pFAja723Kh4c3+sorCw/7g4S7VL+Ei6T0PyIYNpyzUHL6SbmsIF8E1Kf+RRsEHF+zkOk
         2QDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1vDGApbp+iRSCuigFtTMbTOnppj2kw3ScILGmRUarWrx6kchdMsuGGDv/K9X9686Mm5OyvGswWH7Dz4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKalvG0Kra7FtOs+j3VhXgXR/uuMt9we17j0rKAPSrg8S/mlsAx
	QayIbLHXNIBQVHdscXFQCG5dzq+inx6JVSIAD3oK1TaUWXJOwQp1jW/i1XZa1jKH5eQ=
X-Gm-Gg: AYBFou1hlXl+ZNnpGLKeZQUFcU4uCcAR31RYwtLyyt9mgzTJpip3IRHAcwm3stAIbgf
	ttAanT1GomHMSOVBQYO+lZbEglGCEa2EuvP/uD9XVPlsG+RJ9ldYfyHDWfu+19aXhYP+9iz2aA0
	MZZks7lP9t6knn+Xic4dWJgmCzAcD04x9wAnEJFMceLoV8SxYBtr0E3UQuHn2h9A8ltFawSshS2
	nO0SwmRn8RQFxlYJrjwxUT9KQ83gmK7JsANPgttjB1BbnXWsnhdwEzbfNKm4uNv2jKZN8LweON+
	X1z4q3JqJyzMpjUf61L/v6MoShxmm6DwVqYoCYoYJrBxMUz0aRcHz74xwpogbF65OpLU78ucweO
	BJrItt2Ri18pdvpZ+HPPeJIxMZBF2k/18TyqVLgYsd/GKDgkl9emRmscMZZQoPoj/iisRxaSOuM
	nNk3n4EQ2xqt1/a1K8r+nFrx/VXEwWdznrO4pHaJyZnjb4yfz60ag9dBSAXDW8zXnBHeq1Np5IN
	bzL8CjpMSTN937Z8uReW7M7ofD4F3B/Fag1zNt9CpfDQ5sN3m2Xtj1j44Z73IAUnrrF2l3wxFfL
	6bC4b4eN6Ayc4JoozVk=
X-Received: by 2002:a05:6122:8116:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5eac3bcc86bmr270069e0c.1.1792373813100;
        Sun, 18 Oct 2026 18:36:53 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9908362f359sm7368186241.10.2026.10.18.18.36.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 18:36:52 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sanan Hasanov <sanan.hasanov@ucf.edu>,
	syzbot+e353ad4408c4f9fac965@syzkaller.appspotmail.com
Subject: [PATCH] minix: restore uptodate on bitmap buffers before redirtying them
Date: Sun, 18 Oct 2026 21:36:45 -0400
Message-ID: <20261019013645.40834-1-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

The inode and zone bitmap buffers are read once at mount time and stay
pinned in sbi->s_imap[] and sbi->s_zmap[] until unmount. Their in-memory
contents are the authoritative copy of the allocation state.

If writeback of one of these buffers fails, the buffer write completion
handler marks a write I/O error and clears BH_Uptodate. The next bitmap
update then calls mark_buffer_dirty() on a buffer that is no longer
uptodate and trips:

  WARNING: fs/buffer.c:991 at mark_buffer_dirty+0x299/0x410
  ...
   minix_free_block fs/minix/bitmap.c
   free_data fs/minix/itree_common.c:272 [inline]
   truncate fs/minix/itree_common.c:321 [inline]
   V1_minix_truncate+0x310/0x10c0 fs/minix/itree_v1.c:61
   minix_evict_inode+0x1c9/0x260 fs/minix/inode.c:52
   evict+0x624/0xb50 fs/inode.c:822
   minix_mkdir+0xdc/0x120 fs/minix/namei.c:136

syzbot hits this by shrinking the loop device under a mounted minix
filesystem so that bitmap writeback fails, then letting a failed mkdir
evict the new inode and free its blocks.

Since the buffer data is still valid, do what ext2 and ext4 do for their
long-lived superblock buffers: clear the write I/O error and set the
buffer uptodate again before dirtying it, so the bitmap is written out
again on the next writeback. Do this under the buffer lock so it cannot
interleave with a write that is still in flight and about to fail. The
original failure has already been logged and recorded in the block
device mapping by mark_buffer_write_io_error(), so clearing the per-buffer
flag does not hide it.

Reported-by: syzbot+e353ad4408c4f9fac965@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e353ad4408c4f9fac965
Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>
---
 fs/minix/bitmap.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/minix/bitmap.c b/fs/minix/bitmap.c
index abec43833..0ac96c88e 100644
--- a/fs/minix/bitmap.c
+++ b/fs/minix/bitmap.c
@@ -39,6 +39,24 @@ static __u32 count_free(struct buffer_head *map[], unsigned blocksize, __u32 num
 	return sum;
 }
 
+/*
+ * The bitmap buffers stay pinned for the lifetime of the mount and their
+ * in-memory contents are authoritative.  A failed writeback clears
+ * BH_Uptodate on them, so restore it before redirtying the buffer instead
+ * of tripping the warning in mark_buffer_dirty().  The buffer lock keeps
+ * this from racing with a write that is still in flight.
+ */
+static void minix_mark_bitmap_dirty(struct buffer_head *bh)
+{
+	lock_buffer(bh);
+	if (!buffer_uptodate(bh)) {
+		clear_buffer_write_io_error(bh);
+		set_buffer_uptodate(bh);
+	}
+	mark_buffer_dirty(bh);
+	unlock_buffer(bh);
+}
+
 void minix_free_block(struct inode *inode, unsigned long block)
 {
 	struct super_block *sb = inode->i_sb;
@@ -64,7 +82,7 @@ void minix_free_block(struct inode *inode, unsigned long block)
 		printk("minix_free_block (%s:%lu): bit already cleared\n",
 		       sb->s_id, block);
 	spin_unlock(&bitmap_lock);
-	mark_buffer_dirty(bh);
+	minix_mark_bitmap_dirty(bh);
 	return;
 }
 
@@ -83,7 +101,7 @@ int minix_new_block(struct inode * inode)
 		if (j < bits_per_zone) {
 			minix_set_bit(j, bh->b_data);
 			spin_unlock(&bitmap_lock);
-			mark_buffer_dirty(bh);
+			minix_mark_bitmap_dirty(bh);
 			j += i * bits_per_zone + sbi->s_firstdatazone-1;
 			if (j < sbi->s_firstdatazone || j >= sbi->s_nzones)
 				break;
@@ -207,7 +225,7 @@ void minix_free_inode(struct inode * inode)
 	if (!minix_test_and_clear_bit(bit, bh->b_data))
 		printk("minix_free_inode: bit %lu already cleared\n", bit);
 	spin_unlock(&bitmap_lock);
-	mark_buffer_dirty(bh);
+	minix_mark_bitmap_dirty(bh);
 }
 
 struct inode *minix_new_inode(const struct inode *dir, umode_t mode)
@@ -243,7 +261,7 @@ struct inode *minix_new_inode(const struct inode *dir, umode_t mode)
 		return ERR_PTR(-ENOSPC);
 	}
 	spin_unlock(&bitmap_lock);
-	mark_buffer_dirty(bh);
+	minix_mark_bitmap_dirty(bh);
 	j += i * bits_per_zone;
 	if (!j || j > sbi->s_ninodes) {
 		iput(inode);
-- 
2.48.1

