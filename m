Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51737E5F3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414970; cv=none; b=ChjM14ImxXvfuNhwD8LoJtVEPLi/KN2PtWyJt6yTd9I/N1IKLVDG9lGpNDdlPENxzXWmgEvQYJ/apxcqlM8D7Z2MePTQyEjZDe4tVM52iLm4mtlc0JVN+vcxEHGJMWW6A4we3/yhowEfC6Jm97hewyt9QWYZxqK86kEcq7OJu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414970; c=relaxed/simple;
	bh=vR6y/lYOnE9heGA1cbB/g37raXbZZpurA6xfPoOlzhA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i0ztisY/g1/eMe21uaVijlghEx8asAFRB2X7B2f5Uuerl4FTrDzPggZJApq/6vQGsHeV1T0a9sNzGY1JVWsUuUqvokTMGQwNDshTVw8hTmaCsXSlcRZXNJgAmoA8HXyMD9qgd7h/7TLNIFRrDn5nQeo0rSgM0WXZEl+g+Cgms4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FZFDgef0; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FZFDgef0"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c41f85ee4a3so153225666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792414967; x=1793019767; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tfewtHe0RF/RFkGE9CYlrvaqKRem/t1cV4TMGTUJaIU=;
        b=FZFDgef0LAUqX2jUsy7oo0eH0Aoj6ELK6N1Fr730+oSJPwfDs5+1nhP30vfMFKUOa0
         HUGjhkpgE8NyqYn1b7DQ5Et6aiioAv+f6JGIfKt/FMVYY6tcV0JhSZEXcryXBCnnSRFj
         ToZX3A+04UTFHRYp1XPyVneg+mP+yI9aplENg+nz2e5Ry2bDLUrhTuaX9VnzdH3Vz5X5
         G4lxS5R8mH3cMdRz/CoQnepcnYOEhqQr1irjgN0Efhir4C2c+IVHncrq5KTFps6DjGTY
         FoxgUUzLSNZl99OQXQyijaCkQxtm7mtruEBUBV7CPB78+uC8p5Mt5OzG4r7SA+N7faIT
         JZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414967; x=1793019767;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfewtHe0RF/RFkGE9CYlrvaqKRem/t1cV4TMGTUJaIU=;
        b=yhFWsHJxyTDWIZC5q6Rk4aE8pg25ZK0MeLPFuSLABwrSi79MdNGtXtLigzAXXd2dWJ
         7tJ9i76WUhegw6wXIinTCLT2GiNtfgM8lZAihN2fAuy6Smib5NTu4vADdf/ghLRS4yiF
         L4wr2C6EIE4GtX9tJgtDXXQduA4yykIQosR419lrY60nQHv/CBbuL0qfixyVpEfF7Q9k
         aRYok1qJIFimZj9gR69VTpiHW3VYPGoYeGoycFfl3yQLXWBcRCLqVdxw4e2+ZzY6uKoD
         pf0HdHGQ2J3BvZ/lWnokgTBNoLy/IEsmKEA8m2o1OzW0kn7V7A3SpcIEhFa2FZTRPggK
         cPPw==
X-Forwarded-Encrypted: i=1; AKwUvBzxwgp+suerFZlmrwRzMfmAmKx3I/zUswZ4AJrznKYDqhVgIHUwGEHzs6JjiOkxOJqKHl/ZjwqeMY9ij5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEU7BWGzTWJ025AfqyKnM0H/oOECLh7mXJiCpYFcINBLnPlmXT
	r6TnoQYxSYeK/0SJ3Mwp1Bm7f6Fdw67PT507K9WvhcQJP5VL6s/pE6iO//A6Wd51uJmLIhFMZu1
	7T4jmht/4BVOOjvqonsXi2ZkyNhdBKg==
X-Received: from ejblu20.prod.google.com ([2002:a17:906:fad4:b0:c34:dd5f:126c])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d92:b0:c29:4490:50d6 with SMTP id a640c23a62f3a-c41a08e6a7fmr555511566b.47.1792414967175;
 Mon, 19 Oct 2026 06:02:47 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:02:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261019130241.3751829-1-jprusakowski@google.com>
Subject: [PATCH] f2fs: fix stale extent cache in inode page after truncation
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>
Content-Type: text/plain; charset="UTF-8"

During generic/475 (fsstress with dm-error), orphan inode recovery on
remount can fail in sanity_check_extent_cache() with a stale on-disk
extent (ri->i_ext) whose blocks have already been invalidated in the SIT
bitmap:

  F2FS-fs (dm-0): Inconsistent error blkaddr:212341, sit bitmap:0
  F2FS-fs (dm-0): sanity_check_extent_cache: inode (ino=14f2) extent info
                  [212341, 109, 1] is incorrect, run fsck to fix

This happens for two reasons:

1. In f2fs_drop_inode(), when an unlinked inode has I_SYNC set by a
   concurrent __writeback_single_inode(), f2fs_destroy_extent_node() only
   frees the rbtree nodes while leaving et->largest intact and without
   setting FI_NO_EXTENT. Concurrent writeback in f2fs_write_inode() ->
   f2fs_update_inode_page() can race with f2fs_truncate() and write a
   stale et->largest into ri->i_ext after blocks have been invalidated in
   the SIT bitmap. Call f2fs_drop_extent_tree() instead so FI_NO_EXTENT
   is set and et->largest.len is zeroed before truncation.

2. During truncation (including f2fs_evict_inode() -> f2fs_delete_inode()
   -> f2fs_truncate() where I_FREEING is set and f2fs_pre_evict_inode()
   has already destroyed the in-memory extent_tree),
   f2fs_truncate_data_blocks_range() clears ri->i_addr[] directly in the
   inode cached block (marking ientry dirty) and invalidates the blocks
   in the SIT bitmap, but does not call f2fs_update_inode() to
   synchronize ri->i_ext in ientry. Because igrab() returns NULL for an
   I_FREEING inode, both f2fs_sync_inode_meta() and flush_dirty_inode()
   skip the inode if a checkpoint or node writeback occurs before
   f2fs_remove_inode_page() completes, persisting ientry with truncated
   ri->i_addr[] and a stale ri->i_ext.

Fix this by:
- Calling f2fs_drop_extent_tree() instead of f2fs_destroy_extent_node()
  in f2fs_drop_inode().
- Updating the inode cached block via f2fs_update_inode() in
  f2fs_truncate_data_blocks_range() when truncating blocks in the inode
  cached block, as well as in f2fs_do_truncate_blocks() and
  f2fs_truncate_inode_blocks() when FI_DIRTY_INODE is set.

Fixes: 3e72f721390d ("f2fs: use extent_cache by default")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/file.c  | 4 ++++
 fs/f2fs/node.c  | 5 +++++
 fs/f2fs/super.c | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3b5ad281b518..b7a404d0efc6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -796,6 +796,8 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		f2fs_update_read_extent_cache_range(dn, fofs, 0, len);
 		f2fs_update_age_extent_cache_range(dn, fofs, len);
 		dec_valid_block_count(sbi, dn->inode, nr_free);
+		if (IS_INODE(sbi, dn->node_entry))
+			f2fs_update_inode(dn->inode, dn->node_entry);
 	}
 	dn->ofs_in_node = ofs;
 
@@ -885,6 +887,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		f2fs_update_time(sbi, REQ_TIME);
 
 		f2fs_drop_extent_tree(inode);
+		f2fs_update_inode(inode, ientry);
 
 		f2fs_put_cache(ientry, true);
 		goto out;
@@ -892,6 +895,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 
 	if (f2fs_has_inline_data(inode)) {
 		f2fs_truncate_inline_inode(inode, ientry, from);
+		f2fs_update_inode(inode, ientry);
 		f2fs_put_cache(ientry, true);
 		truncate_page = true;
 		goto out;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 424e95ca5878..27ccc175c282 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1315,6 +1315,11 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		nofs += err;
 	}
 fail:
+	if (is_inode_flag_set(inode, FI_DIRTY_INODE)) {
+		f2fs_lock_cache(entry);
+		f2fs_update_inode(inode, entry);
+		f2fs_unlock_cache(entry);
+	}
 	f2fs_put_cache(entry, false);
 	trace_f2fs_truncate_inode_blocks_exit(inode, err);
 	return err > 0 ? 0 : err;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 773b12ea29c0..acefc1378a6a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1888,7 +1888,7 @@ static int f2fs_drop_inode(struct inode *inode)
 			spin_unlock(&inode->i_lock);
 
 			/* should remain fi->extent_tree for writepage */
-			f2fs_destroy_extent_node(inode);
+			f2fs_drop_extent_tree(inode);
 
 			sb_start_intwrite(inode->i_sb);
 			f2fs_i_size_write(inode, 0);
-- 
2.56.0.176.g3575e65682-goog

