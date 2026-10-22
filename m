Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686027;
	b=XxXNhrpUnmhmRqapP7EFRuSF2ha6JgYJwg7KZJalmP3UEw55ZuHMVwycEFo5t4gon4Yu
	 IrbZwEqXaHaTdQdoVa7Okx5tIHYSRSd8E4OxgqwhqWv74ivIUoOy/auOUSUKJKzMnxHma
	 vXA7iy0Gvhicvbc5GgQeUmg1PsjvW4uzXhYhPM436rtvMARunP0Kv7iqjU5qBLtMJcCRA
	 aJQGqoc/pXn8qlCHGTSDeAXdUetiixT2Fg8+4u4FS6lwjbmidRReZbcb5luulVj5h9Qjx
	 2U06/YS4sL18vp4hJB1kCTX+0Mntg1iLGiIJT7fXH+/xfCztSVq2GxPplUe0Oq2M8Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P83f4IprDp7e5obGVb5Vbzr+nVTtl7vkcsibamZws88=;
	b=K7gtImpF40YS0xyarUaUNdS3JRxCY3dd2PGb9FlNHXImdIvCbOfUM5o1J00bG2B84BdM
	 zWnOST8jq9rLnC8QfWSjIc5zB5djhckhZU2+sOQO6dl9b1zr2Gi7lDGQCKrVgK529lu/P
	 h//nnblqiilTC6q1yPmFOK+ZQos5eTWDpc5ZVBJg4Zrc/jcMKUkhgG3u91VsEMIxSa3Li
	 99RVXiq2isqMBXfaJD1UklV+yrEqaCeAiGQOlwbnBEC1sTpGOG5lu457CT93Y4mjrDDfD
	 wkVPsyo9SPrn5neC7AQAc8gZEnM9r6F9YC/+w1Mzt23I9Sbla6RMPuX1oYdL0Qr8ZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b="KbaoyUs/";
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F7A606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F7A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=KbaoyUs/
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53653e30353so27500341cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792686026; x=1793290826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P83f4IprDp7e5obGVb5Vbzr+nVTtl7vkcsibamZws88=;
        b=KbaoyUs/PSNXKOd75b6/jtzcSg2o2CtEO3zAmKjr9+2epnPrzQNUDUzsCaSo4Kd8vm
         skhDicCz2/TPEmHC3KfuPTP4B32b3gGsQu7mU4iXz+PkM8H5udS51wCkfKfaXGeJZpMo
         j2XZwuYyDnnCQNnGwtIsM2memFFjNOtd6JpVsCUetQlAN88KlkjQvzREwtUEnppSzBwZ
         kG7Myu9FsYl2rafm5pWirFYctxoFksnRDWIkFJIa6EbRQUOiFOxHBzPZPCpbAlOnolug
         w039PlOX3DQCtdO9fnifn6gF7fVEnxf9AhRvhEQYuPmYuUIPbjrjokK/sxN6hUhY0uAn
         fSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686026; x=1793290826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P83f4IprDp7e5obGVb5Vbzr+nVTtl7vkcsibamZws88=;
        b=kdhMr49ym2cp9kdo5+aLXnL9PcH1yT2U9oc3gKlY29n3eKEgnj5rih67XwNSeuDQvn
         Af7jfRvLum5A477B2PPJ3Gr1VpCDEP+OacCmV+Nt+pMfkcj6+5ngAzjRI9gdXvah079E
         oTjf8P12kTBhkypFj6W8qovZq9O5Z0ZmMAatUtgm6Szd5GSEz8dJgKpMopZaIuQOmxSq
         L0LzOL/l1sv8AX0Eft68IdWUO4sTnXJ+7Fr04cmpd5DzWVssAOND1AhbKQ2NWViy64vK
         m70wTR4dpDW3tOFBrBzBuQTCaRWG9JtaB4Wm5yh5avGYqM3NoSG5mEsQVVPFVcRt3qPN
         fJ+g==
X-Forwarded-Encrypted: i=1; AKwUvBwzwj+Kt1NO5fJTTG2lTGizePwOxOVRY0LpUo0Mnttnk6Jrp+TxOiF6dIzonh4G5p5erI/BZFh7hVXP1pM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGYdn9Snpv5StNn4BzgzohS6oOzHUPmtlh8FpV0GoZH88i4art
	1IXxvUdP9gxxRHgs0U88X0GhqGEoqc78E0xP0E9Dqphu5YCrhrDjVEA/qB+GnsPRFgAn70DpK05
	f2AQghw==
X-Gm-Gg: AYBFou3zLM5DbPH2Lll+1xye8WynRLp8jhK+QK82AKgKZ208a/nkU06v77xIiue/Q9j
	GmlcaBf/uAfICibOSSaI2KX2yUJooaMITcMg56ClZzdYqK7I8+f/UkYt9De8Bx1yQ38mhVtndvn
	7His+elcQVZOCAqWo9ksSJWnZqXDAbGwx3pax0fQSc3C+yR/X+pcrxamYM+/RfbUpTxFOSaDbZo
	KR2BhLcN+EBZGclofKGStiWv2pMtZoAYNxlpbHv+XXO9qejDdreep0sewYI8J3isHM0ZNSbrmUD
	2c0lpZgtgBLvqxUllFMdYtKPrdZhARRr7WHvJkj/25T7hJCCtLxfI/8GEeUEn2mT8sVSquSic/k
	Y+mJubXqLxv4+6h15ekeLjd4XMpELgkXWRApyi12ecL6qmWEGaJHbWtuu38G9z7Hj5TijEnX7sz
	7S6Uli7p9X4oNMxgqAssI7zrrFzJ6N93oidkRgRi1hpd9GdcawlUSzMmgV0/kG7sc7SAXc2j5pl
	bHOB9hAo4G9ScdgrzCs8BYp6hQSL7kUTRoXsY4CwSt5uYsdwHsYf5xaGW1e+DdFDM+5q5isHWAq
	Ew==
X-Received: by 2002:a05:622a:1f8e:b0:536:6c4e:13ff with SMTP id d75a77b69052e-5369b861036mr90429941cf.56.1792686025878;
        Thu, 22 Oct 2026 09:20:25 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab792935sm30803631cf.25.2026.10.22.09.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:20:25 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: free clusters on truncate again when prealloc is off
Date: Thu, 22 Oct 2026 12:20:03 -0400
Message-ID: <20261022162003.1688315-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit ecbb433f9a8e ("fs/ntfs3: fold file size handling into
ntfs_set_size()") made truncate go through ntfs_set_size(), which
always keeps the clusters preallocated past the new size.

However, those clusters are only freed when the last writer closes the
file, and only if the prealloc mount option is set. As of now, with
prealloc=0, a file that is made smaller keeps all its clusters until
it is deleted, also across umount and mount.

The issue can be reproduced on a freshly formatted 32 MiB volume with:

    mount -t ntfs3 -o loop,prealloc=0 ntfs.img /mnt
    dd if=/dev/zero of=/mnt/f bs=1M count=8 conv=fsync
    truncate -s 0 /mnt/f
    df -k /mnt

Before that commit, df shows the 8 MiB as free again. After it, they
stay in use until /mnt/f is removed.

This patch makes ntfs_set_size() keep preallocated clusters only with
the prealloc mount option, as ntfs_truncate() did before. fallocate()
with FALLOC_FL_KEEP_SIZE still keeps the clusters it allocates past
i_size.

Fixes: ecbb433f9a8e ("fs/ntfs3: fold file size handling into ntfs_set_size()")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested in KVM with KASAN on ntfs3 master da4391c496fe, without and
with this patch, on a fresh 32 MiB mkntfs image:
- The commands above: with prealloc=0, the used space after truncate
  is 11816K without the patch, also after remount, and 3624K with it.
- fallocate() with FALLOC_FL_KEEP_SIZE of 8 MiB on a 1-byte file,
  with prealloc=0 and with the default options: same results with and
  without the patch.
- truncate(2) by path on the default mount: same results.
- 11 runs of a random write/ftruncate model test (15,900 operations,
  buffered and direct I/O, default, prealloc=0 and sparse mounts, and
  a nearly full volume): same results with and without the patch.

 fs/ntfs3/file.c    |  3 ++-
 fs/ntfs3/inode.c   | 12 +++++++++---
 fs/ntfs3/ntfs_fs.h |  1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index c11da747270f..2afc2fe8f009 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -680,7 +680,8 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
 		}
 
 		if (mode & FALLOC_FL_KEEP_SIZE) {
-			err = ntfs_set_size(inode, i_size);
+			/* Keep the clusters just allocated past i_size. */
+			err = ntfs_set_size_ex(inode, i_size, true);
 			if (err)
 				goto out;
 		}
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 8adbdf1a7d11..72ecd802a8cf 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -887,7 +887,7 @@ static void ntfs_readahead(struct readahead_control *rac)
 	iomap_readahead(&ntfs_iomap_ops, &ctx, NULL);
 }
 
-int ntfs_set_size(struct inode *inode, u64 new_size)
+int ntfs_set_size_ex(struct inode *inode, u64 new_size, bool keep_prealloc)
 {
 	struct super_block *sb = inode->i_sb;
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
@@ -911,9 +911,8 @@ int ntfs_set_size(struct inode *inode, u64 new_size)
 	if (new_size < ni->i_valid)
 		ni->i_valid = new_size;
 
-	/* last 'true' means keep preallocated. */
 	err = attr_set_size(ni, ATTR_DATA, ni->file.ads.name, ni->file.ads.len,
-			    &ni->file.run, new_size, &ni->i_valid, true);
+			    &ni->file.run, new_size, &ni->i_valid, keep_prealloc);
 
 	up_write(&ni->file.run_lock);
 	ni_unlock(ni);
@@ -921,6 +920,13 @@ int ntfs_set_size(struct inode *inode, u64 new_size)
 	return err;
 }
 
+/* Keep clusters preallocated past the new size only with "prealloc". */
+int ntfs_set_size(struct inode *inode, u64 new_size)
+{
+	return ntfs_set_size_ex(inode, new_size,
+				ntfs_sb(inode->i_sb)->options->prealloc);
+}
+
 /*
  * Special value to detect ntfs_writeback_range call
  */
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 90ccfde951dc..0dd9efa2c88c 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -801,6 +801,7 @@ static inline struct inode *ntfs_iget5(struct super_block *sb,
 	return ntfs_iget5_flags(sb, ref, name, 0);
 }
 int ntfs_set_size(struct inode *inode, u64 new_size);
+int ntfs_set_size_ex(struct inode *inode, u64 new_size, bool keep_prealloc);
 int ntfs3_write_inode(struct inode *inode, struct writeback_control *wbc);
 int ntfs_sync_inode(struct inode *inode);
 int inode_read_data(struct inode *inode, void *data, size_t bytes);

base-commit: da4391c496fedc1ca78a99907712f2256ce8fb80
-- 
2.53.0

