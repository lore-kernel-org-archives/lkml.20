Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401576;
	b=f4tKiLSrG6W9tGDbr52j9kwsv2yYvFF9eaol1fhMpUecEcMZJFmqXBhAlrQIoHq9inOr
	 AeWMTcUYjqoFZ///YPTI7xWPfNIydGXv5RLPrinqO17WAJG7suAaADhm+Z3F6gHKeRd0m
	 N4CJ7ildYbBL7nSsIf2pe6zGUppFpAcbCgez51qEkT8GXenlizcYUByznrZJjd1nhcGlF
	 lSA4nbLDCgI5NkdIF6jJQ7mz4aJlgowgUzAFVdsZ1SaHjXiqIALJHKpWwUoWa3doKy7XZ
	 3D01DEEyi3FYRU727YTeuh2+Hcy1XTkV8Klj6Qrud0tu0m8k+IguOCYTiHLvigz/cag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZlUnRwhuNKYl58D46FJzK3ZPEVVH6mJryR8gBN7fBsE=;
	b=RDPzbxfgeTfHg375B9jgxeK/EZZIG5DmFJvwzdJR6A0pru9JZ5gYGnFDG01AeHhqNuRt
	 sYPM7RmV/PAMgMHUkfcooaKACh2r81F/c5CaUPBlJvmEN/VOVC8Nc0kWbbejntjzPboiE
	 /SHRVNYy1PEOjGB2KhfZEOF/FqeBJHJa46Xr48q+zXCFw8Nd2Ak6e2S3q4KSdKCqMP6iP
	 Fa/S4BM6sOb2QraKf8mfS7vPM6cDMvgj9hTg5f5wWV9phaT8gKdA13BNg00gokcVJYnwX
	 7b1ogCRD//vPDPI3qZreEbnmhoSJz4wgWZ4gEdoWJDU60o82D3ds3++TP8c9jwaHTQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=IVqjvE4F;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86A606A886
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C86A606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=IVqjvE4F
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso24199295e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794401574; x=1795006374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlUnRwhuNKYl58D46FJzK3ZPEVVH6mJryR8gBN7fBsE=;
        b=IVqjvE4F62Chd5QkzqAnGjKcD4+n97iR51JmaeyNhKujhHCcOnkV0XzNb7QhT1/2Uq
         ACjRjy24JNPGMBDTF4n2IzNmY3YpVnuXa8eENtT6Njj1mw6/Ala9nAAUywfaV/9QStE0
         wlJHzILv4XB5dtYoNLe0rIpWHBwiVcn55dDej6LA4SIjJfYo8YkAJI73vPow5fLe0bVr
         9aroV6XFP9CW3Ueo/B5CnhNA1p064drarskEKPhIbxQQOxV37PzPGC3T11/67A4nUgAe
         IKccf854rbi+QrdekgeXxpbYwmSXBnzV68bUTQI1d7WFoD/8wQkdRdZQv+ob9BPN2Xvl
         3a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401574; x=1795006374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlUnRwhuNKYl58D46FJzK3ZPEVVH6mJryR8gBN7fBsE=;
        b=mF81w8GSdGAk03xCG9GdRJ32dMXTAfdpr4Yy0FH29MwZWLJh8uf0oHwZQja7w0ryOk
         XSckjcFFBaY0R4D0Xh3xNqQjUG4B6cieNf9iIedapdr7OX0egnkItOSdpQmYuJVTZUmT
         zGztrMZ5x4kGyMa1GacMjVKdH5WG0EkC9eeGE5jpk8Q7CCiWViorPtNslu7iZwRULP/m
         c8imFnNy4uAk7acIv2J+Ix+W/ZSpiA5dV4MJQ8PGT+66ID2fa0KdFbxJIiNyo3Td1c6N
         RmweeuBamVe4Es4DA5gsBX58/jBIL7PsYbEe5Re8mRu2u5w4E4JhePUCpsLay5DjYwr8
         0K1g==
X-Forwarded-Encrypted: i=1; AL+hErFxOEpEr0kgkTN6YnkhrvkXbiGjZwoFAEbGQ9tv/fnEAENr6i4uQXDjW4aj1yDEqzvGAFzgnW0l++Puxy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gRtwJA3JP31Vyj9nUlBwgt7WZhzCK+Sq0OCx5H4can8t1iQ5h
	eE5bb2Ie6g7KovWsvoFjJz9jBKnFDMCdodUn6t4EiEi+4zyCwL2s/rNbf0E8aRnUC+A=
X-Gm-Gg: AYBFou2mkIZs8vnZAUCylMynnI7Qxim5FnxkZsCRgE+IFe0w2yy/9WAVU3h9EmXod2I
	nVLwVWsvxW9xsMFtOyYPL/z5mzLBHYhZgtvGCnVmgT9hBJsfGAnmN1v+s3uu7KlGet5qqX4Myja
	exP1pT7kBXgRs7fNRoDpPH56R4gTq4PMYSUQIf4SwT6O2Zb+tl8ohT1DA+QbM2PgcRoWxQr81MF
	IdJbhkgdxW6p0n/eGeHD09QDTn8NdsJE0CQgAr8jqrlMi8qovkRRo9zTL2WnpqJFqEqjRjl1dNu
	CsFS/szd8GpMKqZOwR0IWuagl6VsRf6K6HyS2cO2ZNl4oUMXfn8Q0I84Aum0U1dctrnVzznBboN
	Qy6LlOBhQ6ywXcBIXU6FrwYwDaQiPS/i06+EjAacZc7a2lzQvqxzxxgIOYunX/uHJ+YtYU8U6Io
	BudduDxIyS0aYhRMNsexP3nHWsnjoTMPiDpp3HhSz+BjcSSkspnLf/tNXTpLwopB7Tl5qEvVYnZ
	uHSZ3/IidhUp5uzE8weDL9Ya+99EJwJlh8PAFAqH0TaRUaqbh23uyKbEqQBIijUj+yX9NQ12xLt
	OH9bpFk+cw3yplLk/010bJ4nO1XtFRp2mDBMIOPVg1jaY5yEqmjjWU/VLOk1obscuIrol8hQOqo
	KYsxrFtjgciUCt+Nq2iVX83MzbTWinQ==
X-Received: by 2002:a05:600c:4f15:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ba0939b45amr47904445e9.26.1794401573822;
        Wed, 11 Nov 2026 04:52:53 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm132712185e9.7.2026.11.11.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:52:53 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 3/3] ext4: store creation time in separate seconds and nanoseconds
Date: Wed, 11 Nov 2026 13:52:42 +0100
Message-ID: <20261111125242.1078620-4-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111125242.1078620-1-max.kellermann@ionos.com>
References: <20261111125242.1078620-1-max.kellermann@ionos.com>
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

Keep 64-bit seconds and 32-bit nanoseconds and place the latter next
to i_raw_lock. Preserve the existing on-disk encoding and timestamp
range while saving 8 bytes per inode without fast commit.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ext4/ext4.h   | 18 +++++++++++++-----
 fs/ext4/ialloc.c |  3 ++-
 fs/ext4/inode.c  |  4 ++--
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index c2c242f60700..9b6df2632fdd 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -930,9 +930,15 @@ do {										\
 	EXT4_INODE_SET_XTIME_VAL(i_ctime, inode, raw_inode, inode_get_ctime(inode))
 
 #define EXT4_EINODE_SET_XTIME(xtime, einode, raw_inode)				\
+do {									\
+	struct timespec64 ts = {						\
+		.tv_sec = (einode)->xtime ## _sec,			\
+		.tv_nsec = (einode)->xtime ## _nsec,			\
+	};								\
 	if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime))			\
 		EXT4_INODE_SET_XTIME_VAL(xtime, &((einode)->vfs_inode),		\
-					 raw_inode, (einode)->xtime)
+					 raw_inode, ts);			\
+} while (0)
 
 #define EXT4_INODE_GET_XTIME_VAL(xtime, inode, raw_inode)			\
 	(EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra) ?	\
@@ -962,12 +968,13 @@ do {										\
 
 #define EXT4_EINODE_GET_XTIME(xtime, einode, raw_inode)				\
 do {										\
+	struct timespec64 ts = { 0, 0 };					\
 	if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime)) 			\
-		(einode)->xtime =						\
+		ts =								\
 			EXT4_INODE_GET_XTIME_VAL(xtime, &(einode->vfs_inode),	\
 						 raw_inode);			\
-	else									\
-		(einode)->xtime = (struct timespec64){0, 0};			\
+	(einode)->xtime ## _sec = ts.tv_sec;				\
+	(einode)->xtime ## _nsec = ts.tv_nsec;				\
 } while (0)
 
 #define i_disk_version osd1.linux1.l_i_version
@@ -1123,6 +1130,7 @@ struct ext4_inode_info {
 #endif
 
 	spinlock_t i_raw_lock;	/* protects updates to the raw inode */
+	u32 i_crtime_nsec;
 
 #ifdef CONFIG_EXT4_FS_FAST_COMMIT
 	/*
@@ -1168,7 +1176,7 @@ struct ext4_inode_info {
 	 * File creation time. Its function is same as that of
 	 * struct timespec64 i_{a,c,m}time in the generic inode.
 	 */
-	struct timespec64 i_crtime;
+	time64_t i_crtime_sec;
 
 	/* mballoc */
 	atomic_t i_prealloc_active;
diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index 527f1f703c3e..1d73dd35e000 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -1261,7 +1261,8 @@ struct inode *__ext4_new_inode(const struct mnt_idmap *idmap,
 	/* This is the optimal IO size (for stat), not the fs block size */
 	inode->i_blocks = 0;
 	simple_inode_init_ts(inode);
-	ei->i_crtime = inode_get_mtime(inode);
+	ei->i_crtime_sec = inode_get_mtime_sec(inode);
+	ei->i_crtime_nsec = inode_get_mtime_nsec(inode);
 
 	memset(ei->i_data, 0, sizeof(ei->i_data));
 	ei->i_dir_start_lookup = 0;
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 829095aedbe6..5dc22f8747ff 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -7190,8 +7190,8 @@ int ext4_getattr(const struct mnt_idmap *idmap, const struct path *path,
 	if ((request_mask & STATX_BTIME) &&
 	    EXT4_FITS_IN_INODE(raw_inode, ei, i_crtime)) {
 		stat->result_mask |= STATX_BTIME;
-		stat->btime.tv_sec = ei->i_crtime.tv_sec;
-		stat->btime.tv_nsec = ei->i_crtime.tv_nsec;
+		stat->btime.tv_sec = ei->i_crtime_sec;
+		stat->btime.tv_nsec = ei->i_crtime_nsec;
 	}
 
 	/* Return the DIO alignment restrictions if requested. */
-- 
2.53.0

