Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0EA3B47EF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485719; cv=none; b=p7Q4N+gUW5ZhshsMAuyhYowYqs+7r9X/xTP/EmcOP0+VPFCMn2yRsG8PIjGfbvubcBmE2w2gMufTQ/Sc+/BmlQ/nP5UMuuQDdM+fbcWoBqI8hQEtoJ968R0YLSEAYGnLSb+bvF3ECgT/cP/nA7DDqNg3pCmts2iuY/MU/FagNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485719; c=relaxed/simple;
	bh=VwFLvYKsJzscPanK7T8iwvb3utgq+eA4nnAP3ul+4TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8BPcjA7Z8Yn/tLTvUwRB4HKjcLgmLUnuT7RsPvejZRLLVIzblCqW7owUB1krtHRJEaOuZDd2gXqU8/fIznGjcQWgtlpNx4fJhiIGbD4puKXT5iLND0h9eD8zkOClNdgnoyscRgN0fxzlyz+9u/BgTr2/xmsqjlwa1+JynvdaOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DD55ctQF; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DD55ctQF"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e44so440206a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485717; x=1791090517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ed0UOtl4W0jokNIthkI+uQMuk4LnWAdg3ee5pXHMshA=;
        b=DD55ctQFW4SLSqJ7TT+8hncIu1WEV+PEO06ShGaUEQSqW94VBwaKxxx71Cdo+zopcW
         ckyir7U35UscXg+3SM42h7UBBvY0Qis/3E4q0acMX8uX1P+nlc7wq1SqsLNcammEgWNE
         gmwcSRJIBxKvsJvabnSmpOedHause3Sh4Zuw3qXkhha4TefhDZFj55HGKWxkZS2CmxTi
         JE1ku0x4ZcsWOO02x5VBycwBQtsX1tb+IP+rmzw+2Pm5O6epeIc8RR62Itw3cskpWIcy
         ldE1no5Ly2arEZ2i2Dm2H0Tf2uMYh5zzyjwZeemrgu8KKGbw+ARU/q89tfDmo7qA0wVC
         HwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485717; x=1791090517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ed0UOtl4W0jokNIthkI+uQMuk4LnWAdg3ee5pXHMshA=;
        b=CEnuGXg2M4tZ6gjWM3zE4+lK3VlHPFOP1ODy6mAeTRH5DN3p/6kTQEH6LAqZOhIotU
         aDbdNMv4o/lOH3eWJUxHD788INIjJBBX5cH6TrCnRU4gbRGmskUEHdyq+nH5yxV8Z7cR
         vFXuPraXie8hKCr6ktizwVViP57MaAw/ju3dwsrkR3VhHZp0S7Zc3fT+aKCmOO1xcG2P
         D3ZorvB26VI18SODXCwrHHje4WsiFq5+CJFd4qJ7tnafo0v1zSG1XL+Am8PKw2x4No7f
         ubkoyN/h+jKBpXgmLPv3J/6JRrgrEMTaiNMcjX6MyMvMjjzKdtEKd8Ww/0dSpLuLGncw
         vWyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQAH4p0oA7ewh3c3HaOcSn0Y44ucdyf046gFNtm/Nyrv7hwbAmfLqAaNNUwcWnWdNdEAO2u+vwT5OV1nY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA6kHNmD7Vt/f9T+tUgfIlZGHo6VeHnDlTmBWLihs6asthYJ5u
	0Edu12qZK9sXV0oA0KotoX48v9y6+jG90qEDZ+jVezJh3rjM1A/XUchZ
X-Gm-Gg: AYBFou1PgHBttu0Bgww+egOiYteHDCf4V7BsgokpgKphp/GOJSnH6pjbyRU0sY3tyX1
	DhWv8v2LMgVzSQxiZNq+ysRZkGx4hL3PDcZPt7uOC4GLkkDqINnKKhXGtwEsVguaXA6kbm6O9xZ
	P7CME9oXADhPfa7zpHacx0enjFPofupkiyPEatrVup2myIEMF63CBMrMaxono/LJok6pu1l3GA7
	sKZUa1ygafXgP1u+WOUM63DZUWxRV2W7QB3uEWjwh/FwrjasPHITJo/J8MlajbGrTp/B2sa2Paj
	P9//KvpmkliUkyVe7fHXlZIn6VFj8KZl2oMVtqThq4xuSZ+8jRNijN7Wblo+BGavXIIkeTYeZHH
	TMwHv/8EnR5yMLrJjds76kA3vSDe3mIhNFVeTybICj/ijg1QVfteQC6xir2GtSJkP8yeGyo/tDi
	XDKRHxJEFgkrTZ0SDiN8HKvVtPOZm5fZklif4lRaGFbppExT7WNqYXK/ZmJ/2MeXXQChX8sWqaW
	ZeTf9mDMV6EniYCp558Pf69oeNv7rd7qgt2jZ4WWq5SkI56HhdH5uDmlyKl0nrLmC+nNi7zyNFu
	7S/R+7SHauKaVtXQQ03GaT/tQKygxDVZ4DATbxf02Ux+Gpsn12F5e4DDpsE=
X-Received: by 2002:a17:903:19e3:b0:2dd:c053:d73e with SMTP id d9443c01a7336-2df7dc3880bmr76790815ad.37.1790485716634;
        Sat, 26 Sep 2026 22:08:36 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:36 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] ntfs: fail the mount when $MFT needs its own extent records
Date: Sun, 27 Sep 2026 13:08:22 +0800
Message-ID: <20260927050831.2739166-3-matthias.goergens@gmail.com>
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
index a337a3429b401..eab4d8d32132f 100644
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

