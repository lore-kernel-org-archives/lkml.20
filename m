Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25BD1E1A17
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740127; cv=none; b=er0feggdOdnRLZLaIQix8F/gD7ceK2GFNq3hxwNr6iX4HVR9mnQLOKZL6mNcUmdh2gX+MOpELBE528qdVV+LMcbniyIz5OlQY1M0JUBFiURjny7v3O7Dd6WZZnyjkpjV9j9rL94pQO3cKnRz4/8BPc6SoW0OTF+ldtuu9l9lvwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740127; c=relaxed/simple;
	bh=ilYJIEFaKeXFHSbhkKu4EF4bAHsuP9d4TPnsAicmIGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TH1sUFtXTDdaGEfK/NV1KLjYK6bMxPq3suXFFBlmNJAehaTacCcQbsgd7WxQ26+jtnrZYgxudj8k9x86FYhjYtYu7/2cGdPRB+ECQFaskMVzhnXuJr1KbHaDNtdLBWofTpWGm+PzZbdNUCMpzRaua5vGez+01wUvSzYgsjetWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r47qygUC; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r47qygUC"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f9bso22842515ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740125; x=1791344925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNTCOzpKxH+d7l2G2l79XMw+UFAGnoXC8Vf1ACPpqxE=;
        b=r47qygUChQz28fKtd2YA6sbMgosaw2jOq0NCxhgY0exz1C/NKeANReKm7182/9vOxM
         dBmcRJz6cFEYgc6EkwtbsK1niKDrs8aUuE8rwlRW9EHwW4Ee/9/ksoplAq1gYG1rkkbd
         wrNX8mCWh/4fuBDd5LEWpdi4BRoys+cS4nnTtel2lsPT1dQ2Tm+lFjRAIpLCASeNSeUL
         gzS+8VQY8kSvur80+bMLSFERhk3A36R5F27ZTyK5PZ4Zqg1X3GtUYn789hv8Bx2wIVAq
         slz04cS/cSGsUX5J9Aw8q8TFY+3q+02JTH3SQ6ZG31E1hwPBUquNkws0F3JN/D38Ku+O
         SVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740125; x=1791344925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNTCOzpKxH+d7l2G2l79XMw+UFAGnoXC8Vf1ACPpqxE=;
        b=t/WQtlMXJOoRIAcSd05HZSGMs+7TiCUXnIfeEAO3axVWolMNGgtmgxjSFafLo2K2o4
         kP7SyZ3Ml/KNiw2JFwHk7tny0kylSKP6a3dmtR7q03+AETukEuCQ7Qm2a+RRguT5Y3xe
         aIz0C3v0elgqvY9iboXibkWTligiTcIQtcB/HBr4Jc6ohgeiS6ii88wpsarDJuy5qa8n
         Ah0riapBhOwwhZJNVWZhWB9AlOcA56YoWW7hCkD4F4Vzq6gw4HFVWcNClkHn01t9upaG
         rxdz3wCdkaEf6vAHApXtYHNZlw/OlGu6nDQDskuSZFB+dYZfk2iNmXtIWalvH177H/L7
         dtLw==
X-Forwarded-Encrypted: i=1; AKwUvBwqM0G1T3Xp8/6anRTwv/NYSm8IBTORzqfeZizJBDrXDUUyzLqlMpD5L/FMmz7aULWB2FKzITKfGIg+JNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLolDeNbzgKhwjQ6V/XKjeumXp5iLwvZNneYG/ApqjFRNq6jDWk
	oB9JGZ2g0J41yVHUC4LiX5vpziIJBGRk/sz//uvMVPbtF23Bdj9GJv99
X-Gm-Gg: AYBFou2/6SA70jQucbrYPKtWnPQRvyPomwDku0UrcnHUpO/R4flVs8XVUb1h0uwui5D
	OWxX2CVSNu0rfiSV325sEvpEBkbn3X5Bn46bXpWnfWws5V/R3klSX5CpghyTHyZccVxDoodtk+u
	1Oz1hYgTop5BD6FlyUzQf9lxWgoOAWtC1l1dlnVsm/xPckQPVOe98/B9XhesANAYuZgWU2I50A6
	lT9+9zxsyF9J7ANFvkK/xaHZKOOzJjIMAKJWuuBewPYNXnTWRJU4hdiMSmVMSOxk7wSWlMrox7f
	dyJOdOSfCjuaBb4NRJC+g2GemS8GLlm8Jd6KSLVQuSGjfgvWNsCmnkSyxYj8xerIP7S38kK4A76
	fMLZCPclxbbbe5Zwgi/q5C00DTwWptPlJeeyQNbIWggppRiuNj3IuuOzqeAwhZiS/1xeiwCOfX2
	rWPhIi6g5y/9YfzfAhGPZoqDBP+w4kREU+a2rmPnXe3kvU9xmsjRwGqMGgN5uXuoFZoILXSVYaM
	7AHgpRvqXqh0G4ppYmyQDU0pOkYFbYM5XFYE42/O9fVF4wji4Qy+IpHepMpJbL8J7TXnt/WZjYn
	VacW9viMJTStqOUrC9yq+uKsG/NA8OKsZIIDyJ+DC2TR9cxp9PAgfA8srgw=
X-Received: by 2002:a17:903:2f87:b0:2dd:c100:7cc7 with SMTP id d9443c01a7336-2e2e4b2eccdmr1329455ad.67.1790740125094;
        Tue, 29 Sep 2026 20:48:45 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:44 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] ntfs: fail the mount when $MFT needs its own extent records
Date: Wed, 30 Sep 2026 11:48:32 +0800
Message-ID: <93db42d097a460fd089106521ad806ecda33bbb1.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mounting a crafted image hangs the mount process forever, unkillable at
0% CPU.  Only the hung-task detector reports it:

  INFO: task mount:74 blocked in I/O wait for more than 30 seconds.

  folio_wait_bit_common      <- waits forever
  filemap_read_folio
  map_mft_record_folio
  map_mft_record
  ntfs_map_runlist_nolock
  ntfs_attr_vcn_to_rl
  __ntfs_read_iomap_begin
  iomap_read_folio
  ntfs_read_folio            <- already holds that folio's lock
  ntfs_read_inode_mount
  ntfs_fill_super

ntfs_read_inode_mount() assembles $MFT's runlist one $DATA extent at a
time, hoping, as its comment says, that it never needs a part of $MFT it
has not decoded yet.  If $MFT's attribute list puts one of its
attributes or later $DATA extents in an extent record outside the
runlist decoded so far, reading that record re-enters
ntfs_map_runlist_nolock() for $MFT.  Depending on the layout, that waits
on the folio lock it already holds, as above, blocks on $MFT's runlist
lock, or dereferences NULL in map_extent_mft_record().

Mark the volume for the whole $DATA enumeration and have
ntfs_map_runlist_nolock() refuse $MFT with -EIO while the mark is set.
The enumeration decodes each extent itself with
ntfs_mapping_pairs_decompress(), so it does not need that path.

A validly placed record can trip the check too.  The driver puts an
extent record for $MFT's own mapping pairs before the first vcn it
describes, but with clusters smaller than a page, the folio holding it
can still run past the decoded runlist.  An unpatched kernel hangs on
that layout as well; with the check the mount fails.  The check then
refuses only the folio's tail, so this patch needs "ntfs: do not map an
unmappable runlist fragment as a hole": without it the tail is
zero-filled and the mount serves an all-zero mft record.  The mount now
fails instead of hanging:

  ntfs: (device vda): ntfs_map_runlist_nolock(): $MFT needs its own
    extent records to describe itself; cannot mount.

Tested under qemu with KASAN, PROVE_LOCKING and the hung-task detector
on ntfs-next, with and without the whole series: six crafted images
that hang or crash an unpatched kernel fail to mount with the series,
and nine images that mount without it still mount, three of them with
the same file listing and contents, among them a volume written by
ntfs-3g whose $MFT has its $DATA in three extent records.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c | 11 +++++++++++
 fs/ntfs/inode.c  |  9 +++++++++
 fs/ntfs/volume.h |  3 +++
 3 files changed, 23 insertions(+)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 5f5a91265af5e..2e72cd816d04f 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -103,6 +103,17 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
 		base_ni = ni;
 	else
 		base_ni = ni->ext.base_ntfs_ino;
+	/*
+	 * ntfs_read_inode_mount() builds $MFT's runlist itself, so nothing
+	 * should reach here for $MFT.  A crafted image can: the read that
+	 * gets here already holds the $MFT folio lock it would wait on.
+	 */
+	if (unlikely(NVolMftBootstrap(ni->vol) &&
+		     base_ni == NTFS_I(ni->vol->mft_ino))) {
+		ntfs_error(ni->vol->sb,
+			   "$MFT needs its own extent records to describe itself; cannot mount.");
+		return -EIO;
+	}
 	if (!ctx) {
 		ctx_is_temporary = ctx_needs_reset = true;
 		m = map_mft_record(base_ni);
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9583b2c6c7a26..a61f1519549cb 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2080,6 +2080,11 @@ int ntfs_read_inode_mount(struct inode *vi)
 	/* Now load all attribute extents. */
 	a = NULL;
 	next_vcn = last_vcn = highest_vcn = 0;
+	/*
+	 * Reading one of $MFT's own extent records in this loop can re-enter
+	 * ntfs_map_runlist_nolock() for $MFT; see the check there.
+	 */
+	NVolSetMftBootstrap(vol);
 	while (!(err = ntfs_attr_lookup(AT_DATA, NULL, 0, 0, next_vcn, NULL, 0,
 			ctx))) {
 		struct runlist_element *nrl;
@@ -2162,6 +2167,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 			err = ntfs_read_locked_inode(vi);
 			if (err) {
 				ntfs_error(sb, "ntfs_read_inode() of $MFT failed.\n");
+				NVolClearMftBootstrap(vol);
 				ntfs_attr_put_search_ctx(ctx);
 				/* Revert to the safe super operations. */
 				kfree(m);
@@ -2195,6 +2201,7 @@ int ntfs_read_inode_mount(struct inode *vi)
 			goto put_err_out;
 		}
 	}
+	NVolClearMftBootstrap(vol);
 	if (err != -ENOENT) {
 		ntfs_error(sb, "Failed to lookup $MFT/$DATA attribute extent. Run chkdsk.\n");
 		goto put_err_out;
@@ -2229,6 +2236,8 @@ int ntfs_read_inode_mount(struct inode *vi)
 put_err_out:
 	ntfs_attr_put_search_ctx(ctx);
 err_out:
+	/* Also reached from inside the $DATA loop. */
+	NVolClearMftBootstrap(vol);
 	ntfs_error(sb, "Failed. Marking inode as bad.");
 	kfree(m);
 	return -1;
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index fdb57279de84c..0473b602084c5 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -194,6 +194,7 @@ struct ntfs_volume {
  * NV_Discard			Issue discard/TRIM commands for freed clusters.
  * NV_DisableSparse		Disable creation of sparse regions.
  * NV_NativeSymlinkRel		Translate absolute Windows reparse targets (native_symlink=rel).
+ * NV_MftBootstrap		Mount is still assembling $MFT's own runlist.
  */
 enum {
 	NV_Errors,
@@ -214,6 +215,7 @@ enum {
 	NV_DisableSparse,
 	NV_NativeSymlinkRel,
 	NV_SymlinkNative,
+	NV_MftBootstrap,
 };
 
 /*
@@ -253,6 +255,7 @@ DEFINE_NVOL_BIT_OPS(Discard)
 DEFINE_NVOL_BIT_OPS(DisableSparse)
 DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
 DEFINE_NVOL_BIT_OPS(SymlinkNative)
+DEFINE_NVOL_BIT_OPS(MftBootstrap)
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {
-- 
2.55.0

