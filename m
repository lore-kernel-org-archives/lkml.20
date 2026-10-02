Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6A35C193
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915714; cv=none; b=XYlVcneqB8waqHg2NG+MPyRSHRqE18GZYeQKAQtQ62+hOU02vCqMwFNl6YewS3JB2oo+u2BVDMCJ9s4CdW77Mp5dzD7F5kdbaQ6lmtJrz2mmjBe/60s1UYECVdHszo+VPHVkK4zFVnPzlJxpT9TW4ywB4mP/X7OM4PnvHjBjfF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915714; c=relaxed/simple;
	bh=HVRHOXuO/9++v5H8Rg9v6xTeqCjVL63Ax292SNlO308=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrFYNnM9N7i0w8td4gJLcW1oubKbNd5N0s+mCgzOAWOfL5JZxZ41vpSnolup4ggg1fHtujWFgkTfRpTB97v6thFXfyExYyk1wMUaEXKmhgjnz+PGhWcz/T7AWCNH15pBUmfNZLILolX35ED43gdX1qd5So+cuYkUW+x5z2smxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1RZ2WEz; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1RZ2WEz"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-888148d08d3so1161983b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915712; x=1791520512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1/BmCVKCCC5KU+7BUHsA6XB9ZAPAKahVbUM7pjQU84=;
        b=l1RZ2WEzyJPrh+KRewf5O6vmiC1jpsEm+U+q6WnIs2iKZvvGg04IJBrxxok0+shIs0
         JyRFdHGWxHEVz29nlYfuZZsjkYqsGI+qwngE08HQGBatBJUwRKxo3nqlEY4E02RbV43q
         Nopn5jYAg61fHCYH5hhlxb9CW5WDsBBs/k0NhxYE8Xf4NV+mIcMoYlKIn3crhzgmh11x
         jTAqdUF6B4VEbN3UaB4s7eA1LNVZ2JyestmJ1leEqx2wi4T532xvcuM7obQhIAQ2bAqW
         rzWAd0wN/aBj92PLoqACijHoEEOULSG4ul5+lVHDGaj3oO+o2N2WRwtb7UHqTttVNroR
         X8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915712; x=1791520512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1/BmCVKCCC5KU+7BUHsA6XB9ZAPAKahVbUM7pjQU84=;
        b=SZuvvaq+V5yiLutQaNNSM2n1L6s3hN58FApU8bOnkJQePmj3v6x59sGWL0rsGIEB2e
         zCOILN6ey1kVVcGn0ar34yAzbsxw+A2nEQ30Utxx0FM/9GkT1BTAmi0gnznyKMa8KbJe
         6TSo8agSfuWJnSIHh2tC7LsQ/qGtYJ7kARyTeBmzv2dqhgfB94a1mYhoo9q5CZ2JjmtU
         98gzpX014jIba4FD2esz3YfA73QPo7iX6LFZ6CkO1O4M9/9vmigIo5BFhxYEgNnB5VVb
         rOM1dC1WwCsGfs14PZfeR/RViNtIHTd+XCZHDMYMB/x5yXzOp4c9uicLmgkcW8lCyyMA
         o4YA==
X-Forwarded-Encrypted: i=1; AKwUvBxGUL+17QtIrC8OU66DBUjUDWHOHpC+yhJvgUJx0x6ktKYeY5mD3ZM6br8U6QIrA+LPuWVFzmegvZnX6y8=@vger.kernel.org
X-Gm-Message-State: AFuF++mNXFkNUTW+HlCNzsAP0f8ykJBxXQ4VTUq5nfaj0gKJVq7RaBR2
	d90BcnNIb1bijbRF9zp3cmBwRws4pcYZtMH/HelJqL4qeJdeSlevHk0e
X-Gm-Gg: AYBFou2VX2Bf++wyDo2q4nGj75GyfceLSkZlipz3p27M05Q9LyIVTnK4GXOoPbMVUBL
	0sW6U/OmKxe3TMHEKNmB2ezsxTu/Y88Wfh6y60U9bgW58gmKPsTGBqbEkgsigwKu4OGfrFnVbE1
	Of17jbexpCDU1yzrb9WScz8yQLmpFN1c7mUmD98yMRY487H3hhdNvS7LcX6vncew25NhsbEbJZL
	/kEcX+1rIaiMEo5eA3Rm/scAvpcXJfUoPI+6Zc1SMiQXIT5C5a1/6UY7VS1yZnm8JQfX2J5zTbh
	NHt1hzI3Ob0TuJw0EqK6a8IPfZfQbC5Fqzd8ULeKrYici7b3vjNT+VMzkM2bVO0688Xc7CB6lop
	LTgltk6+exwyG2NNTEPjCimuK0PBif58ib9rojCOVQqlLfetZ2tW3ZLP+7CZXHJdfM/NX99CeyZ
	wkpJe+aIu+Y/t7bhsq9x00QOxagJYqhrcx/vr14oA2Kv9ZvOtf2AqoHQXTA/01UH5MBxlt1h/kh
	w0oabdWHy/36mBsh0T8t1rG5btXRrFIEwQHPPaxSG41lpBwhVHZtsFFJr6SNSACDGk5sQBnYGZB
	uORybCkHSp93sBr0dZYAzvjxUlCadorGZxtEU4LVL8rbql1eDOgkZnNBdZE=
X-Received: by 2002:a05:6a20:7d8b:b0:3de:b04b:55a2 with SMTP id adf61e73a8af0-3e0bcfbd56bmr1732809637.22.1790915712245;
        Thu, 01 Oct 2026 21:35:12 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm436432a12.17.2026.10.01.21.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:35:11 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] ntfs: balance the $MFT runlist lock in data extension error paths
Date: Fri,  2 Oct 2026 12:34:59 +0800
Message-ID: <20261002043459.1695429-4-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261002043459.1695429-1-matthias.goergens@gmail.com>
References: <20261002043459.1695429-1-matthias.goergens@gmail.com>
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

Enter undo_alloc without the lock on every path.  Merge the new clusters
with ntfs_runlists_merge_keep_src() and keep the runlist that
ntfs_cluster_alloc() returned until the extension is complete.  On
failure, undo_alloc truncates $MFT's runlist under the lock and, after
dropping it, frees the clusters from the kept runlist with
ntfs_cluster_free_from_rl().  That keeps lcnbmp_lock outside the runlist
lock, the order given by the comment before the cluster allocation.
Unlike ntfs_cluster_free() on a volume mounted with -o discard, this
does not issue discards for the clusters, which were never written; the
runlist merge failure path already frees them the same way.  If the
truncation fails, the runlist may still reference the clusters, so they
stay allocated and the volume is marked for chkdsk; at this call site
the truncation only shrinks the runlist and cannot fail today.

A shorter fix would keep calling ntfs_cluster_free() on the live
runlist without the lock, relying on $MFT's runlist being fully mapped
and changed only by this function under mrec_lock.  That breaks
ntfs_cluster_free()'s documented locking rule on an argument about the
rest of the driver, so this patch does not do that.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v3: free the clusters from the runlist that ntfs_cluster_alloc()
returned, kept intact by the merge from patch 2, instead of from a copy
of the new runs made with ntfs_mft_copy_tail() in undo_alloc (Hyunchul
Lee).  The undo path no longer allocates, so the case where the copy
failed and the clusters stayed allocated is gone.  A copy made before
the merge would also have worked, but would add an allocation to every
$MFT extension.

v2: do not free the clusters if ntfs_rl_truncate_nolock() fails
(Hyunchul Lee).

Without this patch, a forced map_mft_record() failure gives "WARNING:
lock held when returning to user space" for the $MFT runlist lock, and
the next file create and $MFT writeback block on it.  A forced lookup
failure in restore_undo_alloc gives "bad unlock balance".  With it, the
create fails with the injected error, lockdep stays quiet and the
volume keeps working, also when the merge is forced to fail.  With the
truncation forced to fail, nothing is freed that $MFT's runlist still
maps.  A debug check in undo_alloc found, in every undo of these runs,
that the kept runlist describes exactly the runs taken off $MFT's
runlist.  $MFT growth on a nearly full, fragmented volume behaves as
before.

 fs/ntfs/mft.c | 50 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index c2339acc6319..89288b794348 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1791,7 +1791,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	s64 min_nr, nr, ll;
 	unsigned long flags;
 	struct ntfs_inode *mft_ni;
-	struct runlist_element *rl, *rl2;
+	struct runlist_element *rl, *rl2, *alloc_rl;
 	struct ntfs_attr_search_ctx *ctx = NULL;
 	struct mft_record *mrec;
 	struct attr_record *a = NULL;
@@ -1859,15 +1859,15 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	up_write(&mft_ni->runlist.lock);
 
 	do {
-		rl2 = ntfs_cluster_alloc(vol, old_last_vcn, nr, lcn, MFT_ZONE,
-				true, false, false);
-		if (!IS_ERR(rl2))
+		alloc_rl = ntfs_cluster_alloc(vol, old_last_vcn, nr, lcn,
+				MFT_ZONE, true, false, false);
+		if (!IS_ERR(alloc_rl))
 			break;
-		if (PTR_ERR(rl2) != -ENOSPC || nr == min_nr) {
+		if (PTR_ERR(alloc_rl) != -ENOSPC || nr == min_nr) {
 			ntfs_error(vol->sb,
 				"Failed to allocate the minimal number of clusters (%lli) for the mft data attribute.",
 				nr);
-			return PTR_ERR(rl2);
+			return PTR_ERR(alloc_rl);
 		}
 		/*
 		 * There is not enough space to do the allocation, but there
@@ -1878,17 +1878,22 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		ntfs_debug("Retrying mft data allocation with minimal cluster count %lli.", nr);
 	} while (1);
 
+	/*
+	 * Keep @alloc_rl until the extension is complete: it describes exactly
+	 * the new clusters, which undo_alloc frees if a later step fails.
+	 */
 	down_write(&mft_ni->runlist.lock);
-	rl = ntfs_runlists_merge(&mft_ni->runlist, rl2, 0, &new_rl_count);
+	rl = ntfs_runlists_merge_keep_src(&mft_ni->runlist, alloc_rl, 0,
+			&new_rl_count);
 	if (IS_ERR(rl)) {
 		up_write(&mft_ni->runlist.lock);
 		ntfs_error(vol->sb, "Failed to merge runlists for mft data attribute.");
-		if (ntfs_cluster_free_from_rl(vol, rl2)) {
+		if (ntfs_cluster_free_from_rl(vol, alloc_rl)) {
 			ntfs_error(vol->sb,
 				"Failed to deallocate clusters from the mft data attribute.%s", es);
 			NVolSetErrors(vol);
 		}
-		kvfree(rl2);
+		kvfree(alloc_rl);
 		return PTR_ERR(rl);
 	}
 	mft_ni->runlist.rl = rl;
@@ -1904,7 +1909,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (IS_ERR(mrec)) {
 		ntfs_error(vol->sb, "Failed to map mft record.");
 		ret = PTR_ERR(mrec);
-		down_write(&mft_ni->runlist.lock);
 		goto undo_alloc;
 	}
 	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
@@ -2002,6 +2006,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	mark_mft_record_dirty(ctx->ntfs_ino);
 	ntfs_attr_put_search_ctx(ctx);
 	unmap_mft_record(mft_ni);
+	kvfree(alloc_rl);
 	ntfs_debug("Done.");
 	return 0;
 restore_undo_alloc:
@@ -2015,7 +2020,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 		write_unlock_irqrestore(&mft_ni->size_lock, flags);
 		ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(mft_ni);
-		up_write(&mft_ni->runlist.lock);
+		kvfree(alloc_rl);
 		/*
 		 * The only thing that is now wrong is ->allocated_size of the
 		 * base attribute extent which chkdsk should be able to fix.
@@ -2026,15 +2031,28 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
+	 * runlist under it, and free their clusters from @alloc_rl once it
+	 * is dropped, as lcnbmp_lock nests outside it (see above).
+	 */
+	down_write(&mft_ni->runlist.lock);
 	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
 		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
 		NVolSetErrors(vol);
+		/*
+		 * The runlist may still reference the clusters, so leave them
+		 * allocated until chkdsk.
+		 */
+		kvfree(alloc_rl);
+		alloc_rl = NULL;
+	}
+	up_write(&mft_ni->runlist.lock);
+	if (ntfs_cluster_free_from_rl(vol, alloc_rl)) {
+		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
+		NVolSetErrors(vol);
 	}
+	kvfree(alloc_rl);
 	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
 		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
 			   es);
-- 
2.56.0

