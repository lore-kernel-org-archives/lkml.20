Received: from mail-pj2-f20.google.com (mail-pj2-f20.google.com [74.125.227.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814AF1DED42
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485721; cv=none; b=Tyi212YzWzO0x/K8v6VCIQ6196KNpPecA+2dnH+bRQY27SIScwnh0cDOTa2XMcjyJMGOUBB7Pgvgw7BfPAmY+WfyLdDTVcgzAVzBJPxQNkmRgNgUDTDNf4dMjT6ErQjm4MKk9eud+ASObRCfXPeQ9pHzR6uXTGHve4v45swZ6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485721; c=relaxed/simple;
	bh=RSKYSQGknATRmanyeSKC/NneJ+yhqYyXKCHd4eWGsSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZsetabxxlCVOcpmkwYj5ec95gewBFChI3xxJ1gQeRpKScY1Un/1hm84NgvsJIw/y8Ty7ECNpxn2qKp5ftl5arOglq1tdnRc7egNcESQulVqVw2v36mtCmViNB2LyzC1GU/y+sdtYZWt1LHGu/oSVuWynY0WN3fQqSCnmFuHAtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJVan8OV; arc=none smtp.client-ip=74.125.227.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJVan8OV"
Received: by mail-pj2-f20.google.com with SMTP id d9443c01a7336-2d747ed9866so14690625ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485719; x=1791090519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aI8Z07ulle1p09D0h3AAhP5cTbAm7LaS+3eeebF14pU=;
        b=XJVan8OVBT/0WCmHQI9oLP08NtLpXxomW8zV0JSdSJHGmgrpD5ayCQeYaQsBor31md
         PtBBN73y7eiWLE5QX6u3aCAmVwlDJxMJH9Ds3S09N90dFfW/fKeUtmcDHLtJLR7kt0ZH
         NvunQDOW1WLoH9NOsFCSfEa3xoJQQfmjCIpLYvTSwnz0QvzJlorAMNTjMFWr5MoRwn4v
         Fyvh8YpSoqsZ/+MeBe8irbFkweufnqc5sLMMt4wByWaJ65dXrmT5O+gXgj8wDQm5sJ+Q
         3xVMB46MC6Sa8xCj+N0wSiZGqZlSfkYMA0+eQRZJOQsMkpHuWuHHQ+8YUhMR9cs7YGBb
         TziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485719; x=1791090519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aI8Z07ulle1p09D0h3AAhP5cTbAm7LaS+3eeebF14pU=;
        b=c9kj+zqjtUbSJ7kxPawM9jPpTElk9pHoZ09MqIKpP6IajrIRyDPYrG+kYneKLTQKGj
         dG16CqH/+41oRsKAtC41gxpzobtAV1nu45AMRBxbMjaS8MlHA9uvcBifynPR6jk4AgFb
         8dmyjMAogantaFwefOwndHPGLeVmzUo61GXL/TLtPQnGWpfszcJieqmavlhV7b1gruOD
         g1lVwZG9+QH4lOYvhK8vKRDXptR3CU8DbaHdFdWZaqK9YNcO1lpytC4wK5e52nfOhlP+
         9KelNHnFBNNO+PZTzkAMlg3Ab0gB7SSB/NBiIRJzUeGdH8goisChuRuFBAroOcGqLMRb
         8PNg==
X-Forwarded-Encrypted: i=1; AKwUvByJW1YR4uZltYMF7xutB4ZY7LR6UlXbhCuzRTcE8YfAGDrtN+Ha12izejE8kNxI7SrQWGgK1VOim8j/jkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLocaHFFofmxcVkugKEpxMYxRQvc3RYrEYtFWDzmzKa82qpw13m
	cFyEmyKderrZjrqLA36wr2oQigSe++fI/Kq9iZYo3Vr++PNa6rTfiR/J
X-Gm-Gg: AYBFou3Md2HW14JujSVoAC+nHnZoG4hb0L/cxxloGxqlnGA/AHb2/eekRomzh5JGULj
	9o2Ecl2fLzquJP3hI4VK+OneinGQjbl/T38YR7G2x0cfWwqyHALYFImEc14azz6N70zTMUzA6Ui
	CSx2/f0NEyrWNE+1hbdB/pvldzObjlWMuVUvskKomyldhp3HJHLCcaR+EphPDx+ysruV4UJqYkX
	SY3PJZzm8Iy63LLMuil/MzKijhMgswXkrJuUnXzVhNlWdlzfGejHaujZRBrry+uoJGd+JnvYFeA
	8gEcxdQHffIiwDWsOeaDPOK9oQYHFRCvTYGVCWAvv/1TDA2lPzvUHZ8UHjsvgNfxK8KbsQSsvWr
	YcpSzGKvkNluQg2p+0C2SnMYcWs0gxTX2SZDbmZVQhfjO2MkfFOYTzq2O8h81k8BpRroImeTGYh
	i+3Dgy+u+eMWe/lXNWM2htmuwvR02q0BkScrCllYLUj6HTU2Y+Jm8bezdct9mkOGKYipmt8Yai/
	1t/uHr/JiG0C3hgiOBurZcRiZbc1aPe7irMiRg1yzuF+BsxXAMBJBnvYxxSEJVmQ41fqxX/PFdL
	GeFL3uIdVZQL88aL4vNNSReSXBRZ17wBYV6mnX4svJXz8yqyiVMivTFeso8=
X-Received: by 2002:a17:902:c408:b0:2dd:c100:a5e5 with SMTP id d9443c01a7336-2df7dd8bb7cmr80809475ad.57.1790485718739;
        Sat, 26 Sep 2026 22:08:38 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:38 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] ntfs: do not map a vcn as a hole when its runlist lookup failed
Date: Sun, 27 Sep 2026 13:08:23 +0800
Message-ID: <20260927050831.2739166-4-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_attr_vcn_to_rl() retries ntfs_map_runlist_nolock() for any lcn up
to LCN_RL_NOT_MAPPED, which includes LCN_ENOENT, but turns a failed
retry into an error only for LCN_RL_NOT_MAPPED.  For LCN_ENOENT the
error is dropped and the read path maps the range as a hole.

An LCN_ENOENT below allocated_size comes from a base extent with a
highest_vcn of 0, which ntfs_mapping_pairs_decompress() takes to map the
whole attribute, so the runlist ends after its last mapping pair.  If
the pairs end early, the retry finds the same extent and fails with
-ENOENT.  On a crafted volume with 4 KiB clusters, a 64-cluster file
whose mapping pairs stop after 16 clusters reads 48 clusters of zeros,
with no error.

The same layout gets a crafted $MFT past the check from "ntfs: fail the
mount when $MFT needs its own extent records".  With 512-byte clusters
and $MFT's mapping pairs ending at vcn 4, an unpatched kernel hangs on
the folio lock reading records 0-3.  With the check alone, the -EIO is
dropped, records 2 and 3 read as zeros and the mount carries on until
check_mft_mirror() finds the zeroed record 2.

Fail the lookup whenever the retry leaves @vcn unmapped, -ENOENT
included.  At or beyond allocated_size nothing is mapped, so do not
retry there: the runlist ends with LCN_ENOENT, or with LCN_RL_NOT_MAPPED
when only the last extent is mapped, as after a write into it, and with
clusters smaller than a page every read of a file's last folio looks up
such vcns.

A failed expansion in ntfs_non_resident_attr_expand() or
ntfs_attrlist_repack() truncates the runlist under the runlist lock but
restores allocated_size only after dropping it.  A lookup in between
would now fail, so restore allocated_size under the lock in both.

The crafted file now fails from vcn 16 on with -EIO, and the crafted
volume fails to mount with the check's message.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c   | 38 +++++++++++++++++++++++++++++++-------
 fs/ntfs/attrlist.c |  8 ++++++--
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index eab4d8d32132f..30d3d2eb5ef3c 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -344,6 +344,23 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 		rl++;
 	*lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
 
+	/*
+	 * Nothing is mapped at or beyond the allocated size: the runlist ends
+	 * there with LCN_ENOENT, or with LCN_RL_NOT_MAPPED if only a later
+	 * extent has been mapped.  Return that end as it is.  Below the
+	 * allocated size, an unmapped vcn is worth a retry.
+	 */
+	if (*lcn <= LCN_RL_NOT_MAPPED && !is_retry) {
+		unsigned long flags;
+		s64 allocated_vcn;
+
+		read_lock_irqsave(&ni->size_lock, flags);
+		allocated_vcn = ntfs_bytes_to_cluster(ni->vol, ni->allocated_size);
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if (vcn >= allocated_vcn)
+			return rl;
+	}
+
 	if (*lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
 		err = ntfs_map_runlist_nolock(ni, vcn, NULL);
@@ -354,11 +371,14 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 	}
 
 	/*
-	 * The runlist fragment containing @vcn could not be mapped, e.g.
-	 * because the extent mft record holding it is corrupt.  Do not hand
-	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
+	 * Neither the runlist nor the retry mapped @vcn, which lies below the
+	 * allocated size, e.g. because the extent mft record holding it is
+	 * corrupt or because the mapping pairs end too soon.
+	 * ntfs_map_runlist_nolock() reports the latter as -ENOENT, as @vcn
+	 * lies past the extent it found.  Callers would treat
+	 * LCN_RL_NOT_MAPPED or LCN_ENOENT here as a hole, so fail instead.
 	 */
-	if (*lcn == LCN_RL_NOT_MAPPED)
+	if (*lcn <= LCN_RL_NOT_MAPPED)
 		return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
 
 	return rl;
@@ -4703,11 +4723,17 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	if (err2)
 		ntfs_debug("Leaking clusters");
 
-	/* Now, truncate the runlist itself. */
+	/*
+	 * Now, truncate the runlist itself.  Restore allocated_size before
+	 * dropping the lock: ntfs_attr_vcn_to_rl() fails a lookup below the
+	 * allocated size that falls past the end of the runlist.
+	 */
 	if (ni != locked_ni)
 		down_write(&ni->runlist.lock);
 	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
 			ntfs_bytes_to_cluster(vol, org_alloc_size));
+	if (!err2)
+		ni->allocated_size = org_alloc_size;
 	if (ni != locked_ni)
 		up_write(&ni->runlist.lock);
 	if (err2) {
@@ -4719,8 +4745,6 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		ni->runlist.rl = NULL;
 		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
 	} else {
-		/* Prepare to mapping pairs update. */
-		ni->allocated_size = org_alloc_size;
 		/* Restore mapping pairs. */
 		if (ni != locked_ni)
 			down_read(&ni->runlist.lock);
diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 1bbd2bc62c582..3660e7fd24b13 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -168,14 +168,18 @@ static int ntfs_attrlist_repack(struct inode *attr_vi,
 	return 0;
 
 restore_old_runlist:
+	/*
+	 * Restore allocated_size before dropping the runlist lock:
+	 * ntfs_attr_vcn_to_rl() fails a lookup below the allocated size that
+	 * falls past the end of the runlist.
+	 */
 	down_write(&attr_ni->runlist.lock);
 	attr_ni->runlist.rl = old_rl;
 	attr_ni->runlist.count = old_rl_count;
-	up_write(&attr_ni->runlist.lock);
-
 	write_lock_irqsave(&attr_ni->size_lock, flags);
 	attr_ni->allocated_size = old_alloc_size;
 	write_unlock_irqrestore(&attr_ni->size_lock, flags);
+	up_write(&attr_ni->runlist.lock);
 
 	restore_err = ntfs_attr_update_mapping_pairs_locked(
 			attr_ni, 0, locked_ni);
-- 
2.55.0

