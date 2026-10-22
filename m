Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655665;
	b=JAkGLHyxC0ksQZatNEh0zMQbmNC6RcIEkkIxbFfrXL+xFlxbTsaZWAHNKFbMrocbghYe
	 n+eni14xraOpDohZv78/2ximqYdTesH5Hsiw+2u1vCbF+4zMHmGcl/4cmXD4z4M+7rkEV
	 4yFhvFpZ2cyCt5B/1x33nUKI1DItE1S+jm667i3T1vrujBXT7vNeb6okrPELNkEfvGfTP
	 oT3Xx9Y4dauuHjGeS8Rt0aRdokry/Fa/ct5AgZZkIZWTY6x9edPrCWiZYEa5HyvwpU59L
	 6vHdjexeuQhzh3vtNvWg869CrCUBAqpJrpintwLq4rf1ZI8y9FT5VuyrRsLf6oll8qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QauIsZX6JiWa3K6jqc2gJX1n8wzSUPDmLzIwNz1k8Ho=;
	b=bZ0jj8ULPjWXc037wU0iWFb15b5bYhY99zIVRjJHmmyFeL0Er/ftTFzh7J1ncEl/JyXf
	 8f5RLXdO2JfGQNuNW62Y12MMNbKmLQnI+iPbKITbmJXHjGzF+yvFf66sNE6rbCd4O6gW3
	 eyzgQW0/cf2mhC7JpvmbipfWDu4Io40cYOOpK2FJEwSyYp8fCCwX3O9MJI0cyM1hT2ck8
	 UzB+nR/YT2C4IFhOQ/g/aepcgJcq4F2MaocrVkiDfa85rSgnsSU9H2D0QKIaLIhUkgUk9
	 GxpPugeKK7WcE4ODnMWjKkfleFwKljX4tLOtPa6rIssjWsK43VrHc9IcypuKqJ5ISEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=idbay34J;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F06E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F06E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=idbay34J
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so391343a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655664; x=1793260464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QauIsZX6JiWa3K6jqc2gJX1n8wzSUPDmLzIwNz1k8Ho=;
        b=idbay34J+EJjnVNV3o+VYyyMsE2kEGex5wk48TWrCL4pUc/eUJ+SfyJ0eJgRJ+7Jn0
         1P9BxMzrQ/cszfisWMoLBvMRmJIWD9viI4zlTiWD/c8lbROw9zH5EM93sFuj7SWyfvcb
         Ww5R0MV0LOgq9FV3MSqFCGR0fKMkkhtFrXIJB2I6TgSTlSDT69Rrbv4Un1Y7dbgDeQMj
         yVBrXe6FHNoG+RB3pVLjQ/AazajGOxlaQB80gbYGFbIn8WY0v7/Hfrk4kOkbH8V5N+fX
         6//bJG5HY4ph5Q6iSTEhslsPtKwHIyNYgNLGbZZO/Fm90avzW4FR6n8F6O6kJBfqykEE
         CvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655664; x=1793260464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QauIsZX6JiWa3K6jqc2gJX1n8wzSUPDmLzIwNz1k8Ho=;
        b=Hryll9glaYPhUHX/8avcr2KdFllDEu7vAyQIytS4vi2/kSTJtmwyD9unyggMpw5pYO
         k0qQsAOuCLInitpPUESwZoor7SKIA+85ILrrtO2OYClxTK6G38ac9PXmaMLQBuZjTgUR
         HXyNGePJwh4+MT/rECd8ydepPqOHi5htpbRE0WeCUvo6XjqgaePByFy9Ayo08ceJMTDK
         pleuhEztHvxJBvHjfSVbnFAihOrTHB9BcpdJmBUboKNi2u37bFTVeVOVV/GD2H7j/vDm
         RnODPqGQTNRrEW45uhiegxVjLfQOVaxv3Zev9+EqdcoN7LEsaoLsM+JXJ3tI+tK3vOoY
         Oj6g==
X-Forwarded-Encrypted: i=1; AKwUvBxh1ckgr/tEWrplgSmciwycJwGZHgakItz8c5VrXPVat6k/RU1h26GWH/1HVKiOzQCM1D5cZIYv4uNGPxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2p00uJ4YxA6KNVxvxLfBZg3XiVecjnNf2bcsJ4WU6sqF8chyC
	Sy7A2S9JiSLOQ63GeNZKINztx8MNyp+oUO2Smx7IvqiL/bM38yDcd+f4
X-Gm-Gg: AYBFou2+00tQCyoaf7N1NK+AqajlcFeAku0+CtZ0pK17Rbn539mkTQ04uFQ2bGOwAKG
	Xff1ZoDOUuhIAsRNOPiHhZCJWjCsXqAxcMbHgxyyqudOdkLbvnHXgJUkY5V7PteQXXr+wbLWWDF
	1anVsCeuufvtu/8FXOnncWW6eZzidvMuGXIIc3aw2W64STXcx52jgSQ++awJ8pdNfYB+JfskdMS
	ikdkBpuKzreJUqvHN+5nNc2vhzRPR6m9vfFbDGNq1GGHjoCR2hkxGF5a//fm5Qh2Sb9H26At3R4
	B20A/lo6Utf952JLeDNCk3Fzew629PQ0GM2kxbiAiv5kQhBMOMTzIr7J5lBSo1Nyw9Jv94zdpHQ
	0Xh8anPPvJYaY6b4X2yIJ8MEIiDpcgyc6RMwxcueuL9QBdFVg8UcJ9+96IppZ5Syjm+crdpb9PQ
	Af+GyQaDyQWgzE2VIxSduTOaqGXq2Sa/3NSaAdQvUbEXb6OVUAT2wEfnnkC/GVFkDrFH9MsSf/P
	0kHRa/LeQHGsonLKATEZoC6Tn4RVv64f+z1HUccUA7P5QOOodjLG00HkzvNl4oVZ7oGn5XDaCQb
	hCOOS970Rs8/DM7PwzY=
X-Received: by 2002:a17:90a:d883:b0:3ac:17c:6e74 with SMTP id 98e67ed59e1d1-3ad86cc2074mr3264666a91.53.1792655663838;
        Thu, 22 Oct 2026 00:54:23 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:23 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v6 08/15] f2fs: make GC migration large-folio aware
Date: Thu, 22 Oct 2026 15:53:35 +0800
Message-ID: <20261022075343.3043003-9-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

GC can operate on a 4K block that is cached inside a large folio.
The data lookup helpers therefore need to test and update uptodate
state for the addressed subpage instead of rejecting large folios or
treating the whole folio as the target block.

Let f2fs_get_read_data_folio() and f2fs_get_lock_data_folio() to use
subpage uptodate state. Submit single-block reads at the requested
folio offset and zero only the addressed 4K range for NEW_ADDR.

Also update `move_data_page` to mark, clear, and restore dirty
state for the target subpage, and submit write I/O with the subpage
offset recorded in f2fs_io_info.

The write_pages_pending reference is taken by f2fs_do_write_data_page()
and dropped from its common error path, so a block that is truncated
concurrently no longer leaks the counter.

Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c    | 63 ++++++++++++++++++++++++++++++++++-------------
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/gc.c      | 29 ++++++++++++++++++----
 fs/f2fs/segment.c |  2 +-
 4 files changed, 72 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f415c3eb4e78..5671395130b2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1679,20 +1679,16 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	struct dnode_of_data dn;
 	struct folio *folio;
 	int err;
-retry:
+
 	folio = f2fs_grab_cache_folio(mapping, index, for_write);
 	if (IS_ERR(folio))
 		return folio;
 
 	if (folio_test_large(folio)) {
-		pgoff_t folio_index = mapping_align_index(mapping, index);
-		unsigned long nr_pages = folio_nr_pages(folio);
-
-		f2fs_folio_put(folio, true);
-		invalidate_inode_pages2_range(mapping, folio_index,
-				folio_index + nr_pages - 1);
-		f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
-		goto retry;
+		if (!f2fs_ffs_find_or_alloc(folio)) {
+			err = -ENOMEM;
+			goto put_err;
+		}
 	}
 
 	if (f2fs_lookup_read_extent_cache_block(inode, index,
@@ -1728,7 +1724,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		goto put_err;
 	}
 got_it:
-	if (folio_test_uptodate(folio)) {
+	if (f2fs_ffs_test_blk_uptodate(folio, index)) {
 		folio_unlock(folio);
 		return folio;
 	}
@@ -1741,9 +1737,11 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	 * f2fs_init_inode_metadata.
 	 */
 	if (dn.data_blkaddr == NEW_ADDR) {
-		folio_zero_segment(folio, 0, folio_size(folio));
-		if (!folio_test_uptodate(folio))
-			folio_mark_uptodate(folio);
+		size_t offset = offset_in_folio(folio,
+						(loff_t)index << PAGE_SHIFT);
+
+		folio_zero_segment(folio, offset, offset + PAGE_SIZE);
+		f2fs_ffs_mark_subrange_uptodate(folio, offset, PAGE_SIZE);
 		folio_unlock(folio);
 		return folio;
 	}
@@ -1803,7 +1801,8 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 
 	/* wait for read completion */
 	folio_lock(folio);
-	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
+	if (unlikely(folio->mapping != mapping ||
+		    !f2fs_ffs_test_blk_uptodate(folio, index))) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
@@ -2952,6 +2951,22 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 		folio_mark_uptodate(folio);
 }
 
+bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int idx, nr_subpages;
+
+	f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
+
+	if (!f2fs_folio_has_ffs(folio))
+		return folio_test_dirty(folio);
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	nr_subpages = folio_nr_pages(folio);
+	idx = index - folio->index;
+	return test_bit(nr_subpages + idx, ffs->state);
+}
+
 static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
 			struct f2fs_folio_state *ffs, size_t offset, size_t len)
 {
@@ -3045,7 +3060,6 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 
 	return dirty;
 }
-
 static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
 			const struct folio *folio, unsigned int start,
 			unsigned int end)
@@ -3543,7 +3557,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 
 	if (fio) {
-		if (page_private_gcing(fio->page))
+		if (folio_test_f2fs_gcing(fio->folio))
 			return true;
 		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
@@ -3569,8 +3583,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	struct dnode_of_data dn;
 	struct node_info ni;
 	struct f2fs_lock_context lc;
+	struct f2fs_folio_state *ffs;
 	bool ipu_force = false;
 	bool atomic_commit;
+	bool pending_added = false;
+	bool submitted = false;
 	int err = 0;
 
 	/* Use COW inode to make dnode_of_data for atomic write */
@@ -3612,7 +3629,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
 		folio_clear_uptodate(folio);
-		folio_clear_f2fs_gcing(folio);
 		goto out_writepage;
 	}
 got_it:
@@ -3662,6 +3678,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	fio->version = ni.version;
 
 	__folio_start_writeback(folio, folio_test_dirty(folio));
+	if (f2fs_folio_has_ffs(folio)) {
+		ffs = (struct f2fs_folio_state *)folio->private;
+		atomic_inc(&ffs->write_pages_pending);
+		pending_added = true;
+	}
 
 	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
 		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
@@ -3676,6 +3697,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		err = -EIO;
 		goto out_writepage;
 	}
+	submitted = true;
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	if (atomic_commit)
 		folio_clear_f2fs_atomic(folio);
@@ -3684,6 +3706,13 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 out:
 	if (fio->need_lock == LOCK_REQ)
 		f2fs_unlock_op(fio->sbi, &lc);
+	if (!submitted) {
+		if (pending_added) {
+			f2fs_ffs_put_write_pending(folio, 1);
+		} else if (!f2fs_ffs_has_dirty_subpage(folio)) {
+			folio_clear_f2fs_gcing(folio);
+		}
+	}
 	return err;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 915ca72cf276..1b63dd961f15 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4493,6 +4493,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				int compr_blocks, bool allow_balance);
 bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
 struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
+bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
 void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, size_t len);
 bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t offset,
 					    size_t len);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 67a4224a5d75..c3e01f6811b4 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1520,12 +1520,19 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 						unsigned int segno, int off)
 {
 	struct folio *folio;
+	size_t foff = 0;
+	bool large = false;
 	int err = 0;
 
 	folio = f2fs_get_lock_data_folio(inode, bidx, true);
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
+	if (f2fs_folio_has_ffs(folio)) {
+		large = true;
+		foff = offset_in_folio(folio, (loff_t)bidx << PAGE_SHIFT);
+	}
+
 	if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
 		err = -ENOENT;
 		goto out;
@@ -1540,6 +1547,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			err = -EAGAIN;
 			goto out;
 		}
+		if (large)
+			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 		folio_mark_dirty(folio);
 		folio_set_f2fs_gcing(folio);
 	} else {
@@ -1552,33 +1561,43 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			.op_flags = REQ_SYNC,
 			.old_blkaddr = NULL_ADDR,
 			.folio = folio,
+			.folio_offset = bidx - folio->index,
 			.folio_blkcnt = 1,
 			.encrypted_page = NULL,
 			.need_lock = LOCK_REQ,
 			.io_type = FS_GC_DATA_IO,
 		};
-		bool is_dirty = folio_test_dirty(folio);
+		bool is_dirty = f2fs_ffs_test_blk_dirty(folio, bidx);
 
 retry:
 		f2fs_folio_wait_writeback(folio, true, true);
 
+		if (large)
+			f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 		folio_mark_dirty(folio);
 		if (folio_clear_dirty_for_io(folio)) {
-			inode_dec_dirty_block(inode);
-			f2fs_remove_dirty_inode(inode);
+			if (!large) {
+				inode_dec_dirty_block(inode);
+				f2fs_remove_dirty_inode(inode);
+			} else if (f2fs_ffs_clear_subrange_dirty_and_test(folio,
+							foff, PAGE_SIZE)) {
+				folio_mark_dirty(folio);
+			}
 		}
 
 		folio_set_f2fs_gcing(folio);
 
 		err = f2fs_do_write_data_page(&fio);
 		if (err) {
-			folio_clear_f2fs_gcing(folio);
 			if (err == -ENOMEM) {
 				memalloc_retry_wait(GFP_NOFS);
 				goto retry;
 			}
-			if (is_dirty)
+			if (is_dirty) {
+				if (large)
+					f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SIZE);
 				folio_mark_dirty(folio);
+			}
 		}
 	}
 out:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index cbb65e0343c8..e017a5f2a67f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3863,7 +3863,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
 			return CURSEG_COLD_DATA_PINNED;
 
-		if (page_private_gcing(fio->page)) {
+		if (folio_test_f2fs_gcing(fio->folio)) {
 			if (fio->sbi->am.atgc_enabled &&
 				(fio->io_type == FS_DATA_IO) &&
 				(fio->sbi->gc_mode != GC_URGENT_HIGH) &&
-- 
2.43.0

