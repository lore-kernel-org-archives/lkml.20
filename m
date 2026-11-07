Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079199;
	b=2oXCxgu1AXxmQYiR063mjD5UIpVD1hl1TPVd9Yjb6yH1QB/L0g+9l6iFbgSSnCl8ijPY
	 7R0SVbQ0wwmShC3s374Oi4ra/GJN24i4+kicsnhQaxO4grZ7KbU428/3KcVTupjuyaCl3
	 ztrfAaBRLA4JFsxlM8E6znIRDrMxWcl9FzlrhtzcyFAfFvkw9DznlCyW7hhmNifzI/IW4
	 5UOYunQ4EKAcRig/sgn5CL7MLdPdN3hugPTiLVSxBTBLyeyAxN+peJrhC/H95Zq/q3xl3
	 gWAcI5BXisYt3L5R2bGvq1MGS0mA8PnVisa1RDljuDdToNAHZyiI16ooQ7kcSK50nfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yyz+TCgoPL1RPM4ciC0T5BUQFlfpuuTjnTjdwz3J2B4=;
	b=eoN0IuVC4NGVq4IslhH7L2k6G0LijQjvSUivZUhj+vu1dts/6GGbmpeKTliz833twllp
	 irbRkruWDKc9psRI2lOnEy3/rzPuPrxQ3u3t5/4D1alHfnW8njft27e47fE/lns0IlY8Q
	 SxZHvQf5sglO2Yd7cyndNNqGeWVJYRhXUZWnBcHWaI0jpEiLPOI997Zbr3T/TOJQnWWcE
	 bKCMs/1eEC7XLXsvbEAxjtrNS9UlSTEu4PTsUzdTOQ9fYN4cNhM7srV+zZIeRl2B+zzQ/
	 v43VmHimZXMTntYREKUElMEXRLEfjcvkBPts54XX0CxAtyB+3xgIat3Q+UgH2myyPXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jhCXnqXt;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5E606EE9F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB5E606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jhCXnqXt
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91befbcad6dso23182466d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794079198; x=1794683998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyz+TCgoPL1RPM4ciC0T5BUQFlfpuuTjnTjdwz3J2B4=;
        b=jhCXnqXtZhNManQzhOa7bUYKsxRSop+m6mAKqX3CTlPMw/6n+c2JU5JU+Ai1GFr03Y
         kHhPZECL8LDMAbXEeOkTbzJdinPCLwZM/1ftLYhk7U7c8Bx3u95Rb5qtlQ5Yj8u1UIHb
         NM1H8ARt9yv0THG1UzcvA0jQior0s6qA2KgcJHZCC+Aa6ch4c3LRxBKDCIOCcwBBjr6Y
         scgIH56KUiC/a24YXf9ZiuuaPoDdsSNDj2pg817FMMX2ZjO5cv+6T+t7gqdsD1PTgJQm
         t1cywZDmtCKVGEx4pz1ypp1Bdif7UT1E4M96U5Eap8cwa6N8jZ29eXcHNOsrbNSCjYyC
         iOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079198; x=1794683998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyz+TCgoPL1RPM4ciC0T5BUQFlfpuuTjnTjdwz3J2B4=;
        b=O+NEqv9QFh9CUTYaPhiTfWnWxxnm+NOMYnfGvneeX8Kbvpa8demWTXSrb1fq/WAYLJ
         YdtfZEDh9BysfmA4L8acDHuHYmWp2JWmS8SckE5Z/qBK0eZmK743vp+VUuNg4pgloSyy
         oJPMrdsL80urzpmFeahuLsVUPxI/lUpe9jmAtm3nQFPGaKnsTBqoYanah7LePkMyC7RO
         RwEhLmg9iRJroLXalOLUuptcfZKMJDUL55p5ZF4wohJY0cGgsrMWNfhWrOAdymHJi1hw
         rwMyBACC5aQlQDBojjcHecfdc4jPI2taJovSiID2PxymPLtNBSs8h7aE/SYKBOR0n6Zu
         M97Q==
X-Forwarded-Encrypted: i=1; AL+hErEXsUXBUsIQCVi6dFdisYiUTfVHeR/62l/CidJxDQ1oUwVE9kN9p5Op2Nq32F4lYUmMFol/Cwh63Jm1bxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EOtvAm1sD2Uw1CfdPZzJR8TTHrX/npqmrKIMUBgE5WjsKjRTD
	M3DIQ681e1zao5g27QJDysEYIAYsoOtYTX7OieDUreCCvNlR+70Fm6B7mCaJAZHdws1eczWlpRc
	L0e0a5+s=
X-Gm-Gg: AYBFou0875QiUsoQBO6OCQ5rBAj48W89UMRRbsYeiob9w87IE1+bYhTnHsMkQusLKIb
	DREVtfadmo9H8voYO1fsSE7DviuL0uIA2d9bBcK963ll8A7y7X3f1lntxkWQg4lI5IDjNMZaVlG
	BWaJw40luG6mf538GDqmldAvsXW/eXJ07kVEVZkHgb7raDztIWdzpVdy0NwwWYU+Gk37n9jYChz
	ce4Xv1X3OQosJia/yFa13eHvmOsPFEJp+n2s3a9x9YyXAwbOQlliNKkS7dUwB9c2ZJTkW1krhiW
	tsN8Yv60j3XjSC5751BX2Wgy37BRYkQwWj2ZRIKd0/u09n7XojO0+rgQbRB1/AkFBW16gmGprv3
	/sHE8+v9+/HzL379bHAKGGao74UX/pmrAmdCN+kurRQUtROJoNFLRYATWR5uz07qJckHN3hcAgS
	CTIzdGITiMtBNOmT55diACnYuwAnnXP2w0IUiqwyxGaDZh7sfSTjPR+tqZ3ZHbjQzbpU2cQhd11
	VZz97nzdVhmLpGQtUDiFe+IO7cGZXHqsROuXBYGO/OVvtsxpXOEvkr/4aFQBrSGWN5h/LLZQXes
	mSyG/Bo4y0p8tl5R7jGEVnicBUjSsM2wvZuqdJAV7SPeVi0=
X-Received: by 2002:a05:6214:4302:b0:91e:81a3:d440 with SMTP id 6a1803df08f44-91ea96207b0mr83428466d6.16.1794079197856;
        Sat, 07 Nov 2026 11:19:57 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eceb56c90sm703446d6.3.2026.11.07.11.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:19:57 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Sat, 07 Nov 2026 19:19:37 +0000
Subject: [PATCH v5 8/8] ovl: implement containerized syncfs for overlayfs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-b4-ovl-containerized-sync-v5-8-d34b4ae57fdf@toxicpanda.com>
References: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
In-Reply-To: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794079181; l=4798;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Mk4AG64uyCvjs4ynhnVlu/B/QEf+yciM4nDTzhGVnWc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNA5+8X0bIazjZwZW6M8RCBna/Vn2OUFAkR9UTevs/wu3GMie+PUgjx0lBBrfk+MhzafNWCor4e
 eiTTkZRplPwg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

Now overlayfs can only sync own dirty inodes during syncfs,
so remove unnecessary sync_filesystem() on upper file system.

Do that with fsync=relaxed only.  Call sync_fs_and_bdev() on the upper
filesystem instead, which is what sync_filesystem() does after it has
written the inodes.  Do the same for a read-only remount.

The root inode of an overlay is not hashed and cannot be on a dirty list,
so write its upper inode every time.

Upper inodes that have no overlay inode, like whiteouts and the work
directories, are not tracked.  It is up to ->sync_fs() and the block device
to get them to disk.  ext4, xfs and btrfs log all metadata, and ext4
without a journal keeps it in the buffers of the block device.

With many containers on one upper filesystem, stopping one of them no
longer writes out the dirty data of all the others.

Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
[josef: everything after the first paragraph, no wait_sb_inodes() on the
 upper filesystem]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 Documentation/filesystems/overlayfs.rst |  2 +-
 fs/overlayfs/params.c                   | 14 +++----------
 fs/overlayfs/super.c                    | 36 +++++++++++++++++++++++++--------
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/filesystems/overlayfs.rst
index 1a59500834a1..34fc4e6f8a84 100644
--- a/Documentation/filesystems/overlayfs.rst
+++ b/Documentation/filesystems/overlayfs.rst
@@ -830,7 +830,7 @@ Traditionally, syncfs(2) and unmount of an overlay sync the entire upper
 filesystem, including the dirty data of other overlays that share it.
 Overlayfs can be told to only write back the files that were modified
 through the overlay, and then ask the upper filesystem to commit its
-metadata.
+metadata and write its block device.
 
 On traditional local filesystems with a single journal (e.g. ext4, xfs),
 fsync on a file also persists the parent directory changes, because they
diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
index 549fc1e83ac9..6de99e79eb6b 100644
--- a/fs/overlayfs/params.c
+++ b/fs/overlayfs/params.c
@@ -774,22 +774,14 @@ static int ovl_reconfigure(struct fs_context *fc)
 {
 	struct super_block *sb = fc->root->d_sb;
 	struct ovl_fs *ofs = OVL_FS(sb);
-	struct super_block *upper_sb;
-	int ret = 0;
 
 	if (!(fc->sb_flags & SB_RDONLY) && ovl_force_readonly(ofs))
 		return -EROFS;
 
-	if (fc->sb_flags & SB_RDONLY && !sb_rdonly(sb)) {
-		upper_sb = ovl_upper_mnt(ofs)->mnt_sb;
-		if (ovl_should_sync(ofs)) {
-			down_read(&upper_sb->s_umount);
-			ret = sync_filesystem(upper_sb);
-			up_read(&upper_sb->s_umount);
-		}
-	}
+	if (fc->sb_flags & SB_RDONLY && !sb_rdonly(sb) && ovl_should_sync(ofs))
+		return sync_filesystem(sb);
 
-	return ret;
+	return 0;
 }
 
 static const struct fs_context_operations ovl_context_ops = {
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index f38c6dd2ae47..72f5d81aff6a 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -270,18 +270,38 @@ static int ovl_sync_fs(struct super_block *sb, int wait)
 	/*
 	 * Not called for sync(2) call or an emergency sync (SB_I_SKIP_SYNC).
 	 * All the super blocks will be iterated, including upper_sb.
-	 *
-	 * If this is a syncfs(2) call, then we do need to call
-	 * sync_filesystem() on upper_sb, but enough if we do it when being
-	 * called with wait == 1.
 	 */
-	if (!wait)
-		return 0;
-
 	upper_sb = ovl_upper_mnt(ofs)->mnt_sb;
 
+	if (ovl_should_sync_upper_fs(ofs)) {
+		/* Enough if we do it when being called with wait == 1 */
+		if (!wait)
+			return 0;
+
+		down_read(&upper_sb->s_umount);
+		ret = sync_filesystem(upper_sb);
+		up_read(&upper_sb->s_umount);
+
+		return ret;
+	}
+
+	/*
+	 * sync_filesystem() has already written the dirty inodes of this
+	 * overlay through ovl_write_inode().  What is left are the last two
+	 * steps of sync_filesystem() on the upper filesystem.  They have to
+	 * take care of the upper inodes that have no overlay inode, like
+	 * whiteouts and the work directories.  Do not write the inodes that
+	 * others have dirtied on the upper filesystem.
+	 *
+	 * The root inode is not hashed, so it is never on the dirty list.
+	 * Write its upper inode every time.  sb->s_root is gone during an
+	 * unmount.  An error ends up in s_wb_err, like for any other inode.
+	 */
+	ovl_write_upper_inode(sb, d_inode(ovl_upper_mnt(ofs)->mnt_root),
+			      wait ? OVL_WRITE_WAIT : OVL_WRITE_START);
+
 	down_read(&upper_sb->s_umount);
-	ret = sync_filesystem(upper_sb);
+	ret = sync_fs_and_bdev(upper_sb, wait);
 	up_read(&upper_sb->s_umount);
 
 	return ret;

-- 
2.55.0

