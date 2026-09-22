Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE036560AC2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091578; cv=none; b=ExyaUcPR1bk0o8JtIWGLoXm3ECXO7nHp0MAKdpMbDl2+ni+Bl+aEbiSJLbili1H/C1YtF4SWmPdnimRbQG5qfVVeR9pQcyo3K18oSVaBIhX320fDW9WucFilzbcYySRQuwgfnNYJ+ctGfeUV32SvHxluObiWa99iFhNPf8b86ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091578; c=relaxed/simple;
	bh=ObHOZkgZUauIsv+gkqbVOZHMF7yXw3o02lD4RY8/9ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5fbLLd+5YagX8730kwSHNSXwsxakZfh+t60PHgGmX6gFoOHKuUVj0wP4TVBN4bR0mx4x0WjvhRmqc+zuPhwRBrg2TgPP9zNtPtQKXUuc7cl/DBCCd76g7Xa+VVCRMf7Ke1oMn43II7ivuMgKatGnqKnc5J53rQVRt7aQKyLm+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8NtWRgu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8NtWRgu"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso34545a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790091576; x=1790696376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eFSozcq1g/iyO648jGCz6Ze3x62tWi9tU5J7WxKtkk=;
        b=e8NtWRgulJb/7cDX6ENAvAGl/tNRdH0RKEvrn3rUkeGhqZi89Ez9uqLdp2csT5Wg4I
         tieAmsf8wJ72BhdeMl4FBPPT8lEGnGs2D1MXSANbFfOELgD6wLNDXSkSeRN+bZUo3HAp
         cRPpQ8J60IYflI4BzFdlH2Q93cMeeVpdH+CAmN+sZK1OlnYqNdIUNvGVXBiNDI8jZA2Q
         6fFzV+OUi/nxS15negjHj5+0iiKb6Y34kxkVvh2BDrrgqRlW2pOv0bWQHdxOtgN6ubA+
         RmHAcJfW7kg7od5EXqQXITwnbCPc9gJV0js/cvk4DUVRs3m0k6uLeJ/tBdYMGTymrMPJ
         6DSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091576; x=1790696376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eFSozcq1g/iyO648jGCz6Ze3x62tWi9tU5J7WxKtkk=;
        b=T6iXfcq2gM0wp8zVNkVwN+6dFhH/IwGVBP13gWBxDBMyysUwvenPRjnfimm3An4Mp2
         MqY8aWrEvy7x8wnXAMchrvHp5bP+uC5qmW+24STnK8xZz7Vn6Gqx3UEmnPyne4WeYywo
         EpUwmBTteUDYkeDmCmMGip/LhrSH2F6kOjukK+0XHfrs/wbkbm7mYrys8SluygXyZEfQ
         sj1yO/QTUMs6U+Llo0ijtQybceMHCx+RCAbHOYe6CXEczPrTDPRtXb0P+HU5WOswAPiN
         lBeDvrHovsjJXaQtbTjG6cNfqjCy2cEUUgZTNRAyuKadxfDuyY3cR4ATWRq17DSlJ/TD
         rYBg==
X-Forwarded-Encrypted: i=1; AKwUvBwXD9+ZDmrL8nCxA0A68orM8gRM1pBsq8+DEZAuvKDTxq+KU+5QIAmMwiWu/vnpHJ9ORBz6/8SeKeuTEhE=@vger.kernel.org
X-Gm-Message-State: AFuF++l7psb8k88HZj/yoJDAtSu2evlSoVv7e8QioOy9XubqX+7iJnc2
	/LbJLRMXMY/4GWdLmFp7zxQ5spvTn/gmY2YmA5B0X9o2+tdhvPPDrreH
X-Gm-Gg: AYBFou3WB9uzZMdr03tHxQwgTIKc5b1ghJl0toa5xvDANzAqjidvfQ5cioXGpwtNOM2
	zivDut2RtUYTeDgwUTbWu2h+qAhm6S3A6MmSqabstn5Sb618JT7fXa48E75dyCfK6mBpGNm/b/u
	HQKGa/kc/7beJuKZ+OHxhZpOxgUFz3UweInJH7Lz2n0eZFyP5JMRyHDg5kcYCu1hoBawBDvLWjA
	/a3onrKONU68r42C+MZ4lmWVVwBmEbTMYYLn3ORfywDwN786XO3kFqgXpT5x0Fkw4GDtQJiDu4S
	PDFvXY5IXCX6v1bHA0u8CKNzHYWUK0LtS8ZEHph0vmN6l5cmGpZJC6/4d3eSyidVlAtUb7eQusT
	XIV6arFKOodrGrpzm9ZbC5lb99xRUD77nBZgyCHRNbK0AAXSfYWtJo+8vBBaM67+PLM//S4ODKj
	jJlyQLROngrAYza5HzkV2ZTuySxyJhsMVaZXfxPiNEyhvPUAgAz1fDb5vABWdn1LyephYnzkSyK
	c56Y8x297RQHOK/Oxy6ER3ECW+FBK3x3PEUXfb4ooYVZaZiMkTNgyW+6/l3KrhBbPbU2j7/imPU
	AqS75wJrB/szNRwhAf+dXTPiQgZz6N6hRxD6eXqlH/kQAGRp2lFB6UQENpYlo9U=
X-Received: by 2002:a17:90b:2786:b0:39e:6c69:776e with SMTP id 98e67ed59e1d1-3a07321bf3dmr1668189a91.23.1790091576014;
        Tue, 22 Sep 2026 08:39:36 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07d39ca07sm227984a91.3.2026.09.22.08.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:39:35 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: fail the mount when $MFT needs its own extent records
Date: Tue, 22 Sep 2026 23:39:31 +0800
Message-ID: <20260922153931.1976405-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mounting a crafted image hangs the mount process forever: no output, no
progress, unkillable, 0% CPU.  Nothing is reported, because the task is
not blocked on any lock lockdep tracks.  With PROVE_LOCKING and
DEBUG_MUTEXES on it stays silent, and only the hung-task detector
notices:

  INFO: task mount:74 blocked in I/O wait for more than 30 seconds.
  locks held by mount/74: 1
    #0: (&type->s_umount_key#26/1) at sget_fc

It is a folio lock, which lockdep does not track:

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

ntfs_read_inode_mount() builds the first extent of $MFT/$DATA by hand
and then calls ntfs_read_locked_inode() to pick up $MFT's remaining
attributes.  The comment there says what that assumes:

	 * ... we would hope that we don't need
	 * further extents in order to find the other
	 * attributes belonging to $MFT. ... But lets
	 * hope this never happens...

An image whose $MFT attribute list puts those attributes in one of
$MFT's own extent records makes it false.  Mapping that extent record
reads $MFT at a vcn the half-built runlist does not cover, so the read
comes back into ntfs_map_runlist_nolock() for $MFT while it already
holds the lock on the folio it then waits for.

So check it.  Mark the volume while the bootstrap is assembling $MFT's
runlist, and refuse to map $MFT's runlist through the general path
while that mark is set.  The bootstrap builds the runlist itself with
ntfs_mapping_pairs_decompress() and never goes through the guarded
path, so only the re-entrant case is rejected.

The mount now fails instead of hanging:

  ntfs: (device vda): ntfs_map_runlist_nolock(): $MFT needs its own
    extent records to describe itself. $MFT is corrupt. Run chkdsk.
  ntfs: (device vda): ntfs_read_inode_mount(): ntfs_read_inode() of
    $MFT failed.

The guard bails before the function touches anything: no search
context, no mapped record, no lock taken.  -EIO is not a new return
value here either, and all six call sites already handle a negative
one.  ntfs_map_runlist() and ntfs_empty_logfile() propagate it,
ntfs_attr_vcn_to_lcn_nolock() maps it to LCN_EIO,
ntfs_attr_find_vcn_nolock() passes it through, and
ntfs_attr_vcn_to_rl() and ntfs_write_simple_iomap_begin_non_resident()
only act on success, falling through to the unmapped-runlist handling
they already have.

Found by fuzzing mountable images.  Checked under qemu with KASAN,
PROVE_LOCKING and the hung-task detector: two crafted images hang an
unpatched kernel and are rejected by a patched one, and eight
well-formed images mount on both.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
The two crafted images are 28 KB each; happy to send them or put them
somewhere fetchable.

fs/ntfs3 rejects both while loading $Volume, so it is not affected by
these images, but I did not try fuzzing its parser.

 fs/ntfs/attrib.c | 11 +++++++++++
 fs/ntfs/inode.c  |  2 ++
 fs/ntfs/volume.h |  3 +++
 3 files changed, 16 insertions(+)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index c949ff765075..f94e928f145f 100644
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
+			   "$MFT needs its own extent records to describe itself. $MFT is corrupt. Run chkdsk.");
+		return -EIO;
+	}
 	if (!ctx) {
 		ctx_is_temporary = ctx_needs_reset = true;
 		m = map_mft_record(base_ni);
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index a777de8a80c7..55f6d3334238 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2150,7 +2150,9 @@ int ntfs_read_inode_mount(struct inode *vi)
 			 * ntfs_read_inode() on extents of $MFT/$DATA. But lets
 			 * hope this never happens...
 			 */
+			NVolSetMftBootstrap(vol);
 			err = ntfs_read_locked_inode(vi);
+			NVolClearMftBootstrap(vol);
 			if (err) {
 				ntfs_error(sb, "ntfs_read_inode() of $MFT failed.\n");
 				ntfs_attr_put_search_ctx(ctx);
diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
index bc85a9592245..f9ecbbe205ad 100644
--- a/fs/ntfs/volume.h
+++ b/fs/ntfs/volume.h
@@ -184,6 +184,7 @@ struct ntfs_volume {
  * NV_Discard			Issue discard/TRIM commands for freed clusters.
  * NV_DisableSparse		Disable creation of sparse regions.
  * NV_NativeSymlinkRel		Translate absolute Windows reparse targets (native_symlink=rel).
+ * NV_MftBootstrap		Mount is still assembling $MFT's own runlist.
  */
 enum {
 	NV_Errors,
@@ -203,6 +204,7 @@ enum {
 	NV_DisableSparse,
 	NV_NativeSymlinkRel,
 	NV_SymlinkNative,
+	NV_MftBootstrap,
 };
 
 /*
@@ -241,6 +243,7 @@ DEFINE_NVOL_BIT_OPS(Discard)
 DEFINE_NVOL_BIT_OPS(DisableSparse)
 DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
 DEFINE_NVOL_BIT_OPS(SymlinkNative)
+DEFINE_NVOL_BIT_OPS(MftBootstrap)
 
 static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
 {

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.55.0

