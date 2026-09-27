Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B23BED31
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506638; cv=none; b=JWQEke5My8LbVuqjsaEoOrMjo7Meu5r6VGTNnDO1stX6wyyuq/yD6lpSBz4XsVVe0mrwQIADPF8QFE6rusniOJTfGOOXJK64J3fgTmoPDXNZdgd8DSBV8SZvNLdTro7qtN1uuEx71SpfJI5wKFOUuSPqMYJCHNAlJLP5+RHZge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506638; c=relaxed/simple;
	bh=anBpznAiBHOZYVVLdRQG8ojWmyerA7QIN+GG/ul3n/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2NOUAFT8dB4d5oJoxMF9cbjVwbBA2RL75d1+3klh1NEglbo9UEak00f6ta+V7vwbHGCbbyzOmpit2ms6ix+G5mM29QdOCqVRb8AaKQsiBO0dlTbGsrfsdrqZFMa4nWjAbxQfb+XQVO0ld8YOGjWoQ7zoIAMD06mE4L8IF5JFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5JkbxlR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5JkbxlR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so9535625ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506632; x=1791111432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8Z9MR0KdfPZejftAKzmRNamwRbZ6Puylih67+dfFsQ=;
        b=V5JkbxlReFKgcqTOdQoADs+mDrbbsepNRhUfDwGm5vGULAQ6REK6NEwWx/PWSJ0ngE
         DV8ROjEMXys1O0/YOxfNqVs3GoOY8NA277P4HGybJjpwIZl8CLCnAvEB50I6A81u8S52
         QZJx6fYzQzKG3rKR+wmDcI9ViTQbIIu4og8DlkaVCLG+GybyTqA82JuJH9oHsyek4n3S
         NqA6g4vTWOTsckrbihxR7Vf/hNZKRwhJteRGRs0Sz1rzNVKgINk52JgU6VzO/Ysz30um
         SRqFlNielvkh2+96r3YRsOXxKykxtcajdAh4G/1pUjBfMh76kxh7kw6RYU3MCnFNKW31
         wmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506632; x=1791111432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8Z9MR0KdfPZejftAKzmRNamwRbZ6Puylih67+dfFsQ=;
        b=dirGGH5xFa1yHFWdHU03Hire2Hb91wBULjbNf/vAGgFxoTabJEgOARO3v+zjGWOAOm
         ftKUOwObIkPmNrkOBsJChSXSkbBysEAn5LLkyBR1sWRABAKhHNu8nfmhVziWaI4lugy5
         cgagI3hKygPeq5prnADzYtImxFVFAPE4hnxtH4ykj+uAg0MSO+NLWeqIpnWQZKS8Qrh4
         eXRXyWG9R82Mzfre+xp5UtahjSeJQFedpevLl3PwhfUzzNnTmhCZWH8urSNVHtPMiowD
         /DHkTFvMnNCTS4wXPoK7l1rIMOvNCEtbkVR7hFsKb0aYhBnvC3nLa9VYDgZNwi63TUYV
         RxJA==
X-Forwarded-Encrypted: i=1; AKwUvBw/8VzPnGrt+QB1qwDODHZsO8dhmlXrEeC3y2nHV0Ie6GzhRozuvzEw3tj456swYONQjLjTlQLsrmZLL0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQtYKrgmV0q90Zbs/gGOm/HHMoo7r/AJlJE1cvfV/1H1FF27I0
	lR+NZ2FXqbHt8cwhiope5Uhbyk+/QXJt69nlSsl/71idM+mhjhWNPskQyonm88h4K4D8WQ==
X-Gm-Gg: AYBFou3V8vQBSvtH+8TqUL7tSkXx9HYMOcIWDYgWjHNMIZ/0iMe0DC/INx2C4kQidww
	yAcVUWZKo2v/p6I+bA1K5uzT2/i/Xq34oOz+GwMEnM+po5ZcCfHcURlqlm0YrPVVL7+CZn/LhkK
	o2lxCjT6u1tGV9PnFsah2mqFF5A5XdBCjZNJSbFyAakSHYtQDo/psWHzAU7eH9LNF+eaQQI/LXC
	43QsIV2BidaAOpS4QDi2X6xPq+mzh5uYXk9LfAk563tYGKlQEBBlTS0kjFYOj8lvSnNkTQf+iuq
	6xN3kazH6WRNGoru6D3p0ndvWcojT9umnAQUkmZYO5AqSFG/dSu+ebRkn4NeMgOEVna+5B4TUdN
	/4K22Lt9Vuj0xks3gkRBgFINR25Q0IfksYSHjAUmRystQr+gK5t7jwWfTSiuyBYaMWL/oVkoPz7
	eRz2VDVo0hojgt0rZlKykpEAWD16zYYBrmgWggM/NZztrizqXsia/72TzRjZvDill/a0+XnAAcX
	zGVFEYp+mvEkpwpG+tDrx5hTvyyTJT+gYalMc9VI6Hv+ZXoU52aVb1NSyZSQdrzdP7Ox0CFOks6
	U6rLkt8HvnJgzCyVNgZGETqtC66EdCDzNq4samh+XJWof6M+f8GQf8i8pq0=
X-Received: by 2002:a17:903:3202:b0:2dd:c100:b2c2 with SMTP id d9443c01a7336-2df7dc49ac5mr93559505ad.45.1790506632334;
        Sun, 27 Sep 2026 03:57:12 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91442ef4sm28521145ad.55.2026.09.27.03.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:11 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ntfs: balance the $MFT runlist lock in data extension error paths
Date: Sun, 27 Sep 2026 18:57:05 +0800
Message-ID: <20260927105706.3111333-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927105706.3111333-1-matthias.goergens@gmail.com>
References: <20260927105706.3111333-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_mft_data_extend_allocation_nolock() drops the $MFT runlist lock
before allocating clusters, and every path into undo_alloc arrives
without it, except a map_mft_record() failure, which takes it first.
undo_alloc never releases it, so the lock leaks and the next $MFT
extension and $MFT writeback hang.  The restore_undo_alloc failure
path, on the other hand, releases the lock without holding it.  And
undo_alloc frees the clusters with ntfs_cluster_free() and truncates
the runlist without the lock, although both require it.

Enter undo_alloc without the lock on every path.  Under the lock, copy
the new runs and truncate the runlist; after dropping it, free the
clusters from the copy with ntfs_cluster_free_from_rl().  That keeps
lcnbmp_lock outside the runlist lock, as the function documents.  Like
the runlist merge failure above, this does not discard the clusters,
which were never written.  If the copy cannot be allocated, the
clusters stay allocated and the volume is marked for chkdsk.

A shorter fix would keep calling ntfs_cluster_free() on the live
runlist without the lock, relying on $MFT's runlist being fully mapped
and changed only by this function under mrec_lock.  That breaks
ntfs_cluster_free()'s documented locking rule on an argument about the
rest of the driver, so this patch does not do that.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Without this patch, a forced map_mft_record() failure gives "WARNING:
lock held when returning to user space" for the $MFT runlist lock, and
the next file create and $MFT writeback block on it.  A forced lookup
failure in restore_undo_alloc gives "bad unlock balance".  With it, the
create fails with EIO, lockdep stays quiet and the volume keeps working,
also when the copy allocation is forced to fail.  $MFT growth on a
fragmented volume behaves as before.

 fs/ntfs/mft.c | 54 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index e01e367a588d9..58676042444b6 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1764,6 +1764,36 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
 	return ret;
 }
 
+/*
+ * ntfs_mft_copy_tail - copy the runs of a runlist from a vcn onwards
+ * @rl:		runlist to copy from
+ * @vcn:	first vcn to copy
+ *
+ * Return a terminated copy of the runs of @rl covering @vcn and everything
+ * after it, NULL if there are none, or ERR_PTR(-ENOMEM).  The caller must
+ * hold the runlist lock and free the copy with kfree().
+ */
+static struct runlist_element *ntfs_mft_copy_tail(struct runlist_element *rl, s64 vcn)
+{
+	struct runlist_element *end, *copy;
+	s64 delta;
+
+	rl = ntfs_rl_find_vcn_nolock(rl, vcn);
+	if (!rl || !rl->length)
+		return NULL;
+	for (end = rl; end->length; end++)
+		;
+	copy = kmemdup(rl, (end - rl + 1) * sizeof(*rl), GFP_NOFS);
+	if (!copy)
+		return ERR_PTR(-ENOMEM);
+	delta = vcn - copy->vcn;
+	copy->vcn = vcn;
+	copy->length -= delta;
+	if (copy->lcn >= 0)
+		copy->lcn += delta;
+	return copy;
+}
+
 /*
  * ntfs_mft_data_extend_allocation_nolock - extend mft data attribute
  * @vol:	volume on which to extend the mft data attribute
@@ -1791,7 +1821,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	s64 min_nr, nr, ll;
 	unsigned long flags;
 	struct ntfs_inode *mft_ni;
-	struct runlist_element *rl, *rl2;
+	struct runlist_element *rl, *rl2, *tail_rl;
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
@@ -1904,7 +1934,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (IS_ERR(mrec)) {
 		ntfs_error(vol->sb, "Failed to map mft record.");
 		ret = PTR_ERR(mrec);
-		down_write(&mft_ni->runlist.lock);
 		goto undo_alloc;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
@@ -2015,7 +2044,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		write_unlock_irqrestore(&mft_ni->size_lock, flags);
 		ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(mft_ni);
-		up_write(&mft_ni->runlist.lock);
 		/*
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
@@ -2026,15 +2054,25 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	ctx->attr->data.non_resident.highest_vcn =
 			cpu_to_le64(old_last_vcn - 1);
 undo_alloc:
-	if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
-		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
-		NVolSetErrors(vol);
-	}
-
+	/*
+	 * Entered without the runlist lock.  Take the new runs off the
+	 * runlist under it, and free their clusters from a copy once it is
+	 * dropped, as lcnbmp_lock nests outside it (see above).  If the copy
+	 * cannot be allocated, the clusters stay allocated until chkdsk.
+	 */
+	down_write(&mft_ni->runlist.lock);
+	tail_rl = ntfs_mft_copy_tail(mft_ni->runlist.rl, old_last_vcn);
 	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
 		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
 		NVolSetErrors(vol);
 	}
+	up_write(&mft_ni->runlist.lock);
+	if (IS_ERR(tail_rl) || ntfs_cluster_free_from_rl(vol, tail_rl)) {
+		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
+		NVolSetErrors(vol);
+	}
+	if (!IS_ERR(tail_rl))
+		kfree(tail_rl);
 	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
 		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
 			   es);
-- 
2.55.0

