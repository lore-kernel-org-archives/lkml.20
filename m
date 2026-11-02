Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629821;
	b=eoCWNbQ1WuDN+muL7m1v/sYtKlb58Nzvcr0xRaLryQJz3RkQU0ksg76K33tZcMFuBVWl
	 VP2tYJFGQEyU+8KxFeT1vpdkK40k25dc+Khlwo1gaNEB62wT7klruSOAtZGJsDnrWXkuH
	 DUJQn53g6P8/2TuttBS4huzqgrXtLr0qFUMF4nzYHT026w18Esr7War12er/reoCeDSOR
	 Qp1QhcGnpZRl3cpe+n/5EqzNBN4obbFsxl9r4Ng6hf4+PDz2I4T3ejLw2sRLCW3/v8yO1
	 FIXPrKtKdQWnVASyXtoZohnonHAk+4aLc4R5QKr2oB+bNbIZZB61us3/YNCrvW7qUcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mXHogYunGIIHp13OaEAp6oxEyB+S12eFq5Vq8y+h0aU=;
	b=NEYUbqJ9kG5SlMgEv5vn6yYb51HJXwfioJUj78WPUedu5zioKt5+d4dHtMaiDcERh/s+
	 Y77Hz6qlzOG8eqYh8VMK5+NqxEUaRi8/rcJGJxeUFBXubUkBsDBU1/avHV/0yxUqAjWvX
	 ky77795uUZHKSqTRUH3R9zEVeIvbUbfTdw1kaFoFbq6xxhv8DktUod6CNvhdQkU50HB6w
	 bLe5LDxBF+yBXOUrqr7HtWYFnZ8YMTdVsL3ch9bR+f6MgR9lY26BqmCQ3FzaJ6+w/mV7t
	 zrS1QuKn7Aw9VwS4CmTUh676lNjYMQf2hmcY76bentQrwz9LfE4jQZzO7CoHzwFLJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sZXSqb/z";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1960716F7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C1960716F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZXSqb/z
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so18701225e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629819; x=1794234619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXHogYunGIIHp13OaEAp6oxEyB+S12eFq5Vq8y+h0aU=;
        b=sZXSqb/zq/KtwCmum70LI7SsdTCOJhUSRW7CLlkB8I8qrCYZbZharyt10TdSEHjDIV
         PjJuK0Waj81QyKbY8ysdoEcc79TDQvj5fdfvcANR/A75x09VJsGJznFw7RGvot/3u7i0
         7/uWXQRnBTCruuS95FR1eTdRMRCrbdJaXE1XDEtMPArDMlOXQR/0smpsZgBw7vnGn820
         FD8V65XulM/XcuEIn6ZLg2Cc28kTS9bWozjU0HTSJgmYeWpkKK6GZ4hE8fnvP+cUfK2o
         wuwECoRkrktIQYbWb572tG3ieEwykqfb6bBCkJRuBZTTD7kxo6HdPXxh0Dl5BYq6fQjO
         2Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629819; x=1794234619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXHogYunGIIHp13OaEAp6oxEyB+S12eFq5Vq8y+h0aU=;
        b=gle+4J6h1yooEqnFQFyO6GytXfUknv6It4Bu0aOYaHalmC5cWJl4QEiBNYigDsVqzU
         NFOhiwk9DFUR4Wd5r8lQ6A5ttmTaEorWPFannHmJfO0x1HFEnlhiL3XlLcb321YErA4w
         NKs0oLC49yDspIMJkr1LAth6wTNdfjPqOWJdIl7Fxzc1fth9mD8U4Y+zasww+Ge9bxK/
         NiJS7QMn0IMZs3sf1VawAVUcoxLaJdaImCF24wOVjiUArMsUgeldit2mAHgOjLnnIMXl
         xO1lUaCvBrF9PD6BSXBP2Abao19/AnqDpHzzo8gWhKnlVAc2LDvQ5uXxUgCGF2mgJQYW
         qXVw==
X-Gm-Message-State: AFq9FYLm7Q8/3aAfTAlLWIRpyaSxqXLClMzSow0lNuT73Lltba1tBX4p
	JuFkqO8qLgfKb+WoULiAAndXvKHuXyF8mNu6+9SXU/PrNqXf7kr7q2jv
X-Gm-Gg: AYBFou0bYhFUzpW8mPqhLZ5R91QoZAyZUYcpsLwCYQVGGPSfkbigsF/kTdnzk3dYfZC
	NrsIBUfZdWOiwmxvuSDucYL+3cXynQLxfcCKS4rV30Sq/cV3LhtteV0q358IEi/B0NqPAcREbpa
	hBn5GLDYP5IiMA6EFUcKN1+kkKLzbIFEi02BT1J6zqGneCkt+eXTrDAgX3KI8/uINl+pYDKKHZF
	KRuZ9Wk2otQ+FzLnAmdYEAWQi9ZRdusqN/zYbP3VTorCMMYnNOKVcowyVH7ujEKPxDraxrLw8uF
	1/AT94ZmX4CDKcy38kVn4c7EyaNsb3kvWys6KJgFBVM+b11uy5T1TV3xNHBMRojvCxTDIc4AT1l
	dZN4W00n+rvEK8XvOZhOgUExr4a+95T0594RmI9cnBJMIRk5Bxatr0C0SuExz6PX19rGvgnpEEL
	ifcGkYOigJ2hprUm4b/u9sZjI/nqUdaJGW33fP+m2DqBAqz/RNkiJKsS2rFFsXRAAqxSdfyDDuE
	2pEXsptstkUuEwMi2LNWsJxfj1IvI9FF202gMpCSAU3WdDsOm3bpzgixhEzmN8mrl+edHxqs6dQ
	20is174NKpcIWbMYVgCYYKLWIv+PxTldT9tXSiBM2UY849Fi2YCp72g3aOBL16Zdzu9k+U/45aO
	ZcJY4HYr70a7lGrA9H5do3enDlW8iarVXRLK9OZNdRZURkmHLdXn8moO6+V6fnKJemXWTopbVVV
	rDA1lVRuDGqUAGWI2l7+qyYyvfKC1Vv1Ql8nQNahz9RahBUAduuL4=
X-Received: by 2002:a05:600c:e555:10b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b261e5b38bmr7366625e9.11.1793629818800;
        Mon, 02 Nov 2026 06:30:18 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2640sm344739885e9.6.2026.11.02.06.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:30:18 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
Subject: [PATCH v5] fat: make rename recovery safe after metadata write errors
Date: Mon,  2 Nov 2026 15:30:11 +0100
Message-ID: <20261102143013.492650-1-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2ba329a1-ad8c-4b6a-8dd6-1f93c85224c0@gmail.com>
References: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com> <20260929090029.742579-1-krystianmkaniewski@gmail.com> <87ld8j4161.fsf@mail.parknet.co.jp> <1f18819d20c92960b8b2d6ccc8bc4506d346150e.1790779353.git.krystianmkaniewski@gmail.com> <87bj90m6dq.fsf@mail.parknet.co.jp> <20261014082315.190262-1-krystianmkaniewski@gmail.com> <87qzhqvloo.fsf@mail.parknet.co.jp> <55a1f016-a7a2-469f-b481-37223d695f29@gmail.com> <87cxt921rc.fsf@mail.parknet.co.jp> <f9b27432-4104-4323-8cd7-e2cda73db2f9@gmail.com> <875wz11xfg.fsf@mail.parknet.co.jp> <c820357a-a7cf-4f4b-ab23-91530a12218b@gmail.com> <878q3uhv4h.fsf@mail.parknet.co.jp> <20261019145146.539233-1-krystianmkaniewski@gmail.com> <87wlrdy8ch.fsf@mail.parknet.co.jp> <2ba329a1-ad8c-4b6a-8dd6-1f93c85224c0@gmail.com>
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

A failed synchronous FAT metadata write clears BH_Uptodate. Rename
recovery can then modify and dirty the same retained buffer, which
triggers the !buffer_uptodate warning in mark_buffer_dirty().

Check the retained buffers in the rename error paths and skip only the
recovery step whose buffer is no longer uptodate. The other steps run as
before, including the rollback after a failed source-entry removal,
where only the source-entry buffer failed. VFAT keeps no slot
information for a replaced entry. Resolve its saved position with a
cache-only lookup before dirtying the inode, because FAT inode
writeback would otherwise reread and retry a failed block.

For exchange, do not rewrite the dotdot buffer whose write failed,
restore an earlier dotdot update only while its buffer is uptodate, and
restore both inode positions as before. A skipped step is reported as
filesystem corruption, and the original error is returned.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0aebd03565f5774f7f8
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
Changes in v5:
- Check buffer_uptodate() directly in the rename error paths and drop the
  helper and the buffer lock of v4.
- Skip only the recovery step of a buffer that is no longer uptodate and
  keep the rest of the existing recovery, also after a failed dotdot write
  and in exchange.
- Keep the existing rollback after a failed source-entry removal. The reply
  to v4 proposed stopping there, but fat_remove_entries() fails only when
  the old_sinfo buffer write fails, so the source entry is still in place.
  Stopping left an invalid ".." entry and shared clusters in my tests,
  while the existing rollback leaves the filesystem clean.
- Look up the cached VFAT target entry block from its inode position,
  because that path has no slot information.
- Clarify the recovery-state comments without changing behavior.

v4: https://lore.kernel.org/all/20261019145146.539233-1-krystianmkaniewski@gmail.com/

 fs/fat/namei_msdos.c | 18 ++++++++++++----
 fs/fat/namei_vfat.c  | 50 +++++++++++++++++++++++++++++++-------------
 2 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index d46d1a3851f25f..51d49a3ca93c14 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -562,14 +562,20 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 	return err;
 
 error_dotdot:
-	/* data cluster is shared, serious corruption */
+	/*
+	 * Complete the remaining rollback. Report corruption only if a
+	 * recovery step cannot be completed.
+	 */
 	corrupt = 1;
 
-	if (update_dotdot) {
+	/* A failed sync write clears BH_Uptodate, leave that buffer alone. */
+	if (update_dotdot && buffer_uptodate(dotdot_bh)) {
 		fat_set_start(dotdot_de, MSDOS_I(old_dir)->i_logstart);
 		mmb_mark_buffer_dirty(dotdot_bh,
 				      &MSDOS_I(old_inode)->i_metadata_bhs);
 		corrupt |= sync_dirty_buffer(dotdot_bh);
+	} else if (update_dotdot) {
+		corrupt = err;
 	}
 error_inode:
 	fat_detach(old_inode);
@@ -577,11 +583,13 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 	MSDOS_I(old_inode)->i_attrs = old_attrs;
 	if (new_inode) {
 		fat_attach(new_inode, new_i_pos);
-		if (corrupt) {
+		if (corrupt && buffer_uptodate(sinfo.bh)) {
 			mark_inode_dirty(new_inode);
 			corrupt |= sync_inode_metadata(new_inode, 1);
+		} else if (corrupt) {
+			corrupt = err;
 		}
-	} else {
+	} else if (buffer_uptodate(sinfo.bh)) {
 		/*
 		 * If new entry was not sharing the data cluster, it
 		 * shouldn't be serious corruption.
@@ -590,6 +598,8 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 		if (corrupt)
 			corrupt |= err2;
 		sinfo.bh = NULL;
+	} else {
+		corrupt = err;
 	}
 	if (corrupt < 0) {
 		fat_fs_error(new_dir->i_sb,
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index da3e89c0b16ac8..31f9882f0a9ffe 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -1010,12 +1010,18 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 	return err;
 
 error_dotdot:
-	/* data cluster is shared, serious corruption */
+	/*
+	 * Complete the remaining rollback. Report corruption only if a
+	 * recovery step cannot be completed.
+	 */
 	corrupt = 1;
 
-	if (dotdot_de) {
+	/* A failed sync write clears BH_Uptodate, leave that buffer alone. */
+	if (dotdot_de && buffer_uptodate(dotdot_bh)) {
 		corrupt |= vfat_update_dotdot_de(old_dir, old_inode, dotdot_bh,
 						 dotdot_de);
+	} else if (dotdot_de) {
+		corrupt = err;
 	}
 error_inode:
 	fat_detach(old_inode);
@@ -1023,10 +1029,27 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (new_inode) {
 		fat_attach(new_inode, new_i_pos);
 		if (corrupt) {
-			mark_inode_dirty(new_inode);
-			corrupt |= sync_inode_metadata(new_inode, 1);
+			struct buffer_head *target_bh;
+			sector_t blocknr;
+			int offset;
+
+			/*
+			 * A replaced entry has no slot info. Use its saved
+			 * position for a cache-only lookup so recovery does
+			 * not reread a failed block.
+			 */
+			fat_get_blknr_offset(MSDOS_SB(sb), new_i_pos,
+					     &blocknr, &offset);
+			target_bh = sb_find_get_block_nonatomic(sb, blocknr);
+			if (target_bh && buffer_uptodate(target_bh)) {
+				mark_inode_dirty(new_inode);
+				corrupt |= sync_inode_metadata(new_inode, 1);
+			} else {
+				corrupt = err;
+			}
+			brelse(target_bh);
 		}
-	} else {
+	} else if (buffer_uptodate(sinfo.bh)) {
 		/*
 		 * If new entry was not sharing the data cluster, it
 		 * shouldn't be serious corruption.
@@ -1035,6 +1058,8 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 		if (corrupt)
 			corrupt |= err2;
 		sinfo.bh = NULL;
+	} else {
+		corrupt = err;
 	}
 	if (corrupt < 0) {
 		fat_fs_error(new_dir->i_sb,
@@ -1106,13 +1131,13 @@ static int vfat_rename_exchange(struct inode *old_dir, struct dentry *old_dentry
 		err = vfat_update_dotdot_de(new_dir, old_inode, old_dotdot_bh,
 					    old_dotdot_de);
 		if (err)
-			goto error_old_dotdot;
+			goto error_dotdot;
 	}
 	if (new_dotdot_de) {
 		err = vfat_update_dotdot_de(old_dir, new_inode, new_dotdot_bh,
 					    new_dotdot_de);
 		if (err)
-			goto error_new_dotdot;
+			goto error_dotdot;
 	}
 
 	/* if cross directory and only one is a directory, adjust nlink */
@@ -1135,14 +1160,9 @@ static int vfat_rename_exchange(struct inode *old_dir, struct dentry *old_dentry
 
 	return err;
 
-error_new_dotdot:
-	if (new_dotdot_de) {
-		corrupt |= vfat_update_dotdot_de(new_dir, new_inode,
-						 new_dotdot_bh, new_dotdot_de);
-	}
-
-error_old_dotdot:
-	if (old_dotdot_de) {
+error_dotdot:
+	corrupt = err;
+	if (old_dotdot_de && buffer_uptodate(old_dotdot_bh)) {
 		corrupt |= vfat_update_dotdot_de(old_dir, old_inode,
 						 old_dotdot_bh, old_dotdot_de);
 	}

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

