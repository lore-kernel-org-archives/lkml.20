Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F51376A18
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739363; cv=none; b=gFvbSHz09ZQLY+bdHWnLVtb5Ss/hq4yvZycdOMBKeTulxth7sSIPx/Asl8rL8RZYJr94hmn/amQmehyCdVCCEzr987JhJG2if+NQCTNqwffrhiBkk+pwI+NPdxchQUkbhC7xw479g7iGeZAAx7WlGNSU9nsTlfRbUPQIJ6UKpBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739363; c=relaxed/simple;
	bh=5OStTQgnHZV1DZtRb6kMuSMhZ/mECTFdn1VvFgjoNRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pkG4i/TUy6GyXBZIEYXhKSL8F3xkMOaMuCqBKMXgA4UX4zizFDzUIhi9OfU3on/Fk8VoUiL9b3KDeJNxSiJUFBiPJC2Zztkh6Q6RbMr3L1x8uKv6xzfclewQ0gJwy0/neJ/4dGVRL/3uLIDjo/dNAs1/bCdNZzrSzcxzC0yLi2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBebkK2G; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBebkK2G"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so2518831a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739361; x=1791344161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7DN84Uf0UnHnEn383kHKjUxnhv3KtsZpD2PEm882uM=;
        b=kBebkK2GXP+g0I0sZXbl/gbYf5bhWocLg++4qqJlRVdb1fD8fUkxeGlVrZy+VoY3RB
         IWNfKiKlDyvxTC7WVRvPbMA1mLNTlDIsSLXWiP0Oe5J7aWSU/OeKHuN3lNCBKsSa84tQ
         De5h3+zQbwxi6SoQoNI8I6XzlT4SGmQt7wZWEg+/x3hpbTvFHKm42lTaV+NZUsfLRzpj
         7S2JDBh7Pse4ifJ+y8/07e+PUHq6bV6Pd8EZH9XzC6TgyXGT2FXT1s14qoSkolB1qhcN
         C6L44qncwcRJqlJyk/PVeQ8yt0gzHVie9GIY0Hz6jtFluIYO8Cd4/CF0a1CSeKgDyuZ9
         0R7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739361; x=1791344161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7DN84Uf0UnHnEn383kHKjUxnhv3KtsZpD2PEm882uM=;
        b=vegwlh9UG6jLSmSlvCW8JbcqGuyoOsZW2eme0S67oiQiTL+OatDSpkQ1Qh8t0/rZH+
         27O5BjuESs3mG8u1x0GGe66ynUNzuTGyAAOQaAfaOnuyYi/I+FUlxdlTWlGZMIWUvqoX
         xnwxiCKXREBNCW9HXTfKbuk+4VGUUEoqcST9mU4m4i3jBwelUC8f7ZOg/IEqyzIsqS4b
         k4znFTVkRYfuGh4m58r1COJYFLVS4f1RX/Ci4yjdvbOBVB5/EiQZXXPpDhnSY7yVSHkA
         VHAOIBGZ9wXIGiuH8hAq+GeJKODnSvIdw/QF52eEtZGDvE65af0F0Bl3AsGRnRywfZMh
         dPiw==
X-Forwarded-Encrypted: i=1; AKwUvBzAioEcQKLIKRuBaXEPxb2412RpwlOAVedgrU0dE9puOMwulHBa5o9q359/6IPuV18a23oqCrTP2Zmfp6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbTRU3ioNrvmlUjy4c8n/LPlgi+pp9KpDcXG1kW+cazdeJz7Jq
	X1oaRtsJ6Pe8+tUrsfeLPPoADapaeW+GTrpEtiwRdopUoEaXXWd/ACNC
X-Gm-Gg: AYBFou0aZ8p2F5/j8/8wMl+n2ATtgWndynivI35u8VG/GlglLOV/S1x5LElPF0c7Xj4
	upgcg/YAi6gU3mMtpDdQKntGt8J/h+LDUNEZEgFcZNhL93FSP7jyqbs/i74VZgbaLMlgRVRmyNA
	QcD8h29O7QkqwSAEuwX1kLHhNJeGij0xNms4wl/kWoYmceM4i7LmOCUdMNhhTEGD7F8MfXJoYt4
	vr3ArPDbdfL8sCSTAYME1qK+SL/ZFGANQpCYAjsXlvxeod15Qvm0pMlnGA9BD3FoFDh3KCtw/Wz
	USRx1zv6RP5wMeL4rVnw4qCDRNJgZLJhXXyWWCc//qdsnNu8XK7XUtDpN3LEowT9fdsmueol89R
	t2GjpX2NjdzgBhy9S3AF9AyR9gKJ25tvVWGdMRoeWXjPY11n5ob9mbNBbq4NsQMweJtmrfSaSNP
	BN0tl6NuksnPWbYS5xA2W1ofhlvVaC0AXnM5NU2yPpx1+IdS6qymmggggk0ELd9rqIgSyGcTHnD
	iqbN/5x3b3mU6cYQ4DPuzhmXs3ly8vYReKVHp5iU24SrLDATa0f50h3FsxShKhncrm8P9MWRvu/
	pNj9hELgTHqaZs/zErWsUMySXq/DKlIMCZMDnD1HXVpPnCwcbZIh1HdhnxE=
X-Received: by 2002:a17:90b:3b48:b0:39e:4c80:f682 with SMTP id 98e67ed59e1d1-3a4d164adccmr127115a91.33.1790739361328;
        Tue, 29 Sep 2026 20:36:01 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce16abc2sm669108a91.9.2026.09.29.20.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:36:00 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ntfs: balance the $MFT runlist lock in data extension error paths
Date: Wed, 30 Sep 2026 11:35:55 +0800
Message-ID: <20260930033556.169300-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930033556.169300-1-matthias.goergens@gmail.com>
References: <20260930033556.169300-1-matthias.goergens@gmail.com>
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
which were never written.  If the truncation fails, the runlist may
still reference the clusters, so they are not freed.  In that case, and
if the copy cannot be allocated, the clusters stay allocated and the
volume is marked for chkdsk.

A shorter fix would keep calling ntfs_cluster_free() on the live
runlist without the lock, relying on $MFT's runlist being fully mapped
and changed only by this function under mrec_lock.  That breaks
ntfs_cluster_free()'s documented locking rule on an argument about the
rest of the driver, so this patch does not do that.

Fixes: 115380f9a2f9 ("ntfs: update mft operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2: do not free the clusters if ntfs_rl_truncate_nolock() fails
(Hyunchul Lee).

Without this patch, a forced map_mft_record() failure gives "WARNING:
lock held when returning to user space" for the $MFT runlist lock, and
the next file create and $MFT writeback block on it.  A forced lookup
failure in restore_undo_alloc gives "bad unlock balance".  With it, the
create fails with EIO, lockdep stays quiet and the volume keeps working,
also when the copy allocation is forced to fail.  With the truncation
forced to fail, nothing is freed that $MFT's runlist still maps.  $MFT
growth on a fragmented volume behaves as before.

 fs/ntfs/mft.c | 59 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index e01e367a588d..8edc65911aa2 100644
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
@@ -2026,15 +2054,30 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
+	 * dropped, as lcnbmp_lock nests outside it (see above).  If the
+	 * runlist cannot be truncated or the copy cannot be allocated, the
+	 * clusters stay allocated until chkdsk.
+	 */
+	down_write(&mft_ni->runlist.lock);
+	tail_rl = ntfs_mft_copy_tail(mft_ni->runlist.rl, old_last_vcn);
 	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
 		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
 		NVolSetErrors(vol);
+		/* The runlist may still reference the clusters, so keep them. */
+		if (!IS_ERR(tail_rl))
+			kfree(tail_rl);
+		tail_rl = NULL;
+	}
+	up_write(&mft_ni->runlist.lock);
+	if (IS_ERR(tail_rl) || ntfs_cluster_free_from_rl(vol, tail_rl)) {
+		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
+		NVolSetErrors(vol);
 	}
+	if (!IS_ERR(tail_rl))
+		kfree(tail_rl);
 	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
 		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
 			   es);
-- 
2.55.0

