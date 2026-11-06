Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926178;
	b=p5t8qliLvAn4ZKblmFrS2vPrRsK5j7PZ2OgtB2uxb2iBRMPNnd1tw76EVpEykWHect+l
	 Wmn9X1As0yCnbCWBMwDJRCCKcEHiI7ciIzuh6ui9pA8uR5lzW3PHSSv3OcysNwKi6l58B
	 mzv7GfRXi2XUzsV6pnz6SFZqXubsRHDu2JwBLXsmwncJahToHf1R2aGSxwZ5FGwqOr2g+
	 Jtx3ruR1Xt+UA7DIO41fKt6wmWW8b94codAO9cfBELbiLdeMxe0pb44MDES5QG7D0VbTf
	 LMl3pXnSM+e8aBzddr7rJiptEDTqWne61eEjji1KOH8gg1LKPOeDQpFcVA8BuDpLVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vy39PjWOWbG+QrSRDXaAzGUP/r3sGf5HzC8FZEBUydY=;
	b=N82oLqAATj2cbWLZB7PA1v6gTdw97hNiE8Ftr5MBjxl9Z8LOIX6P6JhDnfjy/jYmhppJ
	 1JSfsZdRpFD1wftYNi/k3hZg5LdS4nS+5s1dt/c6h5S2tPpsbEjUljvg2iYhL0c7v6/Ui
	 N7b4hA2kYrCPYgKn6xMFzqXOs1Q3GBCloliYoiAsRU5E6iaAXbAp95EACYSfzX9mhdngD
	 bmbn/scJDsdE1BPWlT15FoOCSAEJ62OfmRY/Gf36vvMhkdv/sJf/1y8QtFGK6W3iNCkpp
	 j2uXn+60r2euHEIoHnjKNDPjyDhHYwOVSpnM6puavsgzLzPyW0CW5nVKRLEQ1VxK/dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UnLZtKM8;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF722606D805
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF722606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UnLZtKM8
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b31ca7e0bcso372027b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1793926177; x=1794530977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy39PjWOWbG+QrSRDXaAzGUP/r3sGf5HzC8FZEBUydY=;
        b=UnLZtKM8UTbER3LHVPfZKyk1EUnt+cvT68sEceFoFgL2Fk6sNsZRMsWEHoC5BbusuG
         BByYUONFr2FMV9MyGkUEns1+0UNUT3hSIJAmvtYkeebjMQzUuqgsqWHRpE/GSIn8heCq
         fPs5KLdjDUvvkRE9AT5TSADhIpAag8+R8AolyHbl+TnbWcpTbU5A42rnEMorvAeG0yZr
         VeSyFXSEL7mlO4W92oz5zoNVLGOkCQUYvww+PJmX3flh1GexAXM5DvxvBP3PQTP5WkUj
         Wr/mq963kxABtCb50HNmoUq4uOftBEPtPbiHKdNBKSeErDoP6A8tLjTqm04HdayBm9vx
         cdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926177; x=1794530977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vy39PjWOWbG+QrSRDXaAzGUP/r3sGf5HzC8FZEBUydY=;
        b=LzGfVJkq36vXZWuL44elAVQ8kQl1stZkSLTCpmxuLZJ3dYu5qKvYfa/JbuSn9UUdEb
         itzJRJp1alBd2FI4OPMSnrUo/n0Skxz9cf0SP3pJWxzs/O5PEhRE7tHJDPQKrVlrvnnW
         pfNzcSuoNq9grVoGqgVfwDsSOdpnksdqVTnNkkC97g6tAutyU459G4JlRCYGabWvZ8jZ
         fHPwIW8muhliFPXKRhj1vsyG7P5ievNBcqnxO18eUIsPIQe4aJWuamByYoMG89QwL2LB
         AsEutjGS8QQp/MDghlwVpAFmmW+NSyFBYFe4afNRtPAY67SXwzwXmucC4Kf3cfGDMVEA
         WzBg==
X-Forwarded-Encrypted: i=1; AL+hErGvysfYsVcZlDz+nVPp7rJV1EwAs7B6tgU5OlYoVddiHJSxoYxBVfr5Gm332iQx5PnaOPmHBJoBAkZCFb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z84oTuJ9hy4jmK6/ED9rc3vUI6wTwaXZyf1/lHWBf9BdWSY6Usz
	celHoj1mRrORH19k4cp7ZN1htvSemY6RKzJPK3+2oqcHKawcwGnkYqGT5Gqmctqq9ZU=
X-Gm-Gg: AYBFou1bj+B7xG9x1JXF1GVp7fgN6AQY4TYs/eHmWg3Np+QfjMLzMDENi4cwz85Gksk
	5ENpiXtL5AXZiUiEWUn+5vg0NFlSad08YuiKWJI3EBAxBiqaq/ABmpPxDW7vdpQS1p8euuL69BC
	dB47cxVExtdNPoBrlSbl8t0HUdz3biFlWgoNrF9s6LaubDAcrCkouJJmKJMW+XZ6C53YkQ3tP1U
	WJfBRG3FRyaB7FlyGYNMeU3I/iP+UeNRLKei7pvlavoKAc11ph7K3IA9/MZFORBC+315cNhPn72
	RSPiAMWRASd31DuA2ZPpI+djfqVOc5A3myz3U31a6bg2lwNMpQDw0dnWdBRbI+ABTNpBwxhr6lj
	HN7KwgwKeypzGCXZYXuBTFz/xwl2ssOFbvJalrxUv1SHS9pCUqD6M6Qg9HWFUCa6f2JT35X5Jnj
	cDWtF0VQfJSuhcFm2W9qugTZXQaBdnC1mYjCy0P60lkOaVmQ6nrMFxS1sxoEIKeb2myjvt69DTM
	6in3enNIbd+FzVBUldu6bJezFSR7zFMrTGglTkoUwzKIdBXn8sKqkt//TVen0OiYdNxFmlqN+sN
	7qipqj5sTpAszvazo/JzowZPCO1g88BigisZSNbKko57KG0Qg4HHbAheioY9Emkrp3/8/JrMc02
	O9uwwWH6bDqI7m/dsfe9mm6Br7U2e7oE+UI4rkWWCdCqVCjK+CmgfpeC8ZFE=
X-Received: by 2002:a53:acd3:0:20b0:66d:1877:121b with SMTP id 956f58d0204a3-67c14289dddmr546185d50.32.1793926176685;
        Thu, 05 Nov 2026 16:49:36 -0800 (PST)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:62d1:9ddf:24f7:e87e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0e5fsm851304d50.5.2026.11.05.16.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 16:49:36 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 2/2] hfs: set s_maxbytes from the volume capacity
Date: Thu,  5 Nov 2026 16:49:23 -0800
Message-ID: <20261106004923.1844283-3-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106004923.1844283-1-slava@dubeyko.com>
References: <20261106004923.1844283-1-slava@dubeyko.com>
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

Likewise HFS+, HFS returned -ENOSPC instead of -EFBIG when
a write targets an offset beyond the capacity of the volume.
hfs_fill_super() does not set s_maxbytes, so it keeps the
VFS default of MAX_NON_LFS (2GiB - 1). On a volume smaller
than that, the VFS limit checks consider the position valid
and the request reaches the file system. Because HFS does
not support holes, cont_write_begin() then tries to zero-fill
the whole gap up to the target offset, and the operation
fails with -ENOSPC.

This was previously worked around by a local check against
the volume capacity in hfs_write_begin(). That check only
covered the write path and only the start offset: truncate
up, copy_file_range() and writes that straddle the limit
were not handled.

Every byte of an HFS file up to end-of-file must be backed
by an allocated block, so a file can never be larger than
the volume. Set s_maxbytes to the volume capacity
(fs_ablocks * alloc_blksz, capped by MAX_NON_LFS). The VFS
then returns -EFBIG for write(), copy_file_range(), truncate
and fallocate beyond that limit, and trims writes that
straddle it. Drop the now redundant local check from
hfs_write_begin().

Fixes: c6decf13bf90 ("hfs: fix error code when writing beyond volume capacity")
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfs/inode.c | 7 -------
 fs/hfs/super.c | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index e7a8a5350216..ef1275bbbcbb 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -50,15 +50,8 @@ int hfs_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 		    void **fsdata)
 {
 	struct inode *inode = mapping->host;
-	struct hfs_sb_info *sbi = HFS_SB(inode->i_sb);
-	loff_t total_capacity;
 	int ret;
 
-	total_capacity = (loff_t)sbi->fs_ablocks * sbi->alloc_blksz;
-
-	if (pos >= total_capacity)
-		return -EFBIG;
-
 	ret = cont_write_begin(iocb, mapping, pos, len, foliop, fsdata,
 				hfs_get_block,
 				&HFS_I(inode)->phys_size);
diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index d20150277eb3..fb8c6c0ba212 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -359,6 +359,14 @@ static int hfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto bail;
 	}
 
+	/*
+	 * HFS does not support sparse files, so every byte up to
+	 * the end-of-file has to be backed by an allocated block.
+	 * Therefore, a file can never be larger than the volume.
+	 */
+	sb->s_maxbytes = min_t(loff_t, MAX_NON_LFS,
+			       (loff_t)sbi->fs_ablocks * sbi->alloc_blksz);
+
 	/* try to get the root inode */
 	res = hfs_find_init(HFS_SB(sb)->cat_tree, &fd);
 	if (res)
-- 
2.43.0

