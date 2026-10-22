Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655694;
	b=n+8yKeVdHbi4DPvfUkcwncGUR6iP/FUWMKmq5tS2vWIvMuFroF1SPccHOyvZKtpEI5oW
	 6k6hyrg+4vsHNsZxkpuZcTdrxmdy9tK6iDeTAdbg0kaTkMTm+oI44yjTB6MlVzJwhVC3i
	 zw6Nx5QivtqJuWgWq9YKadKHDYDXZQ51wiBg0fg2ow7w3a56v0Nygbh22g+FWBE08bXdW
	 ipM7kAZLTHii6s+h+OV2cmQdOQTX/xxBgAwvWzB59pjh6eIHpFcSRpnhry8ajnW6kOuyM
	 drIkgttgcj5skrjC868xNJ9nNT7Xd4zf+mmjpKwBVlddkPJU/6XUsjD0wfZRIAxoUOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E5432w1B/mY1BOzeKsXE8/FBXgJKiRjyy818qnwTTaU=;
	b=QScUl7SX/7SA8Vpnm7/YlSakc67B/i9lq4NNfMEv+N7aN1BQfu3Zx9BpFSK1AoBkTDrR
	 96kVVtFpzwTlGftc6zzlyWn5PdQo7xuz3nfnP8MlJeNvnNwezZPh0mMc8b8fSDeqgA74H
	 pDwsi5HRt8j6+sBXmNU5bxEImE9F/A0OmwlisW+eKJYXzf+Pb41zTXxqCgim9gzIXMI1i
	 8wSBrL7xpA27cP0nGMVIikZnT9NktFeJ+3CXl2mf28/BF5bulztez9UlJdr9yIaqgOLhr
	 QNRVGHhv3jj8TjpBQfr9R0cz91kHMLXR/svp6qgR7cs7CMazkC+AR0xToyo/jz0OpgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SMcShZmO;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6500B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SMcShZmO
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so757556a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655694; x=1793260494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5432w1B/mY1BOzeKsXE8/FBXgJKiRjyy818qnwTTaU=;
        b=SMcShZmOjHmfszWpp97juJ2yyQToUmpiHAZH7ibEmO9FaQz7A8LUbGQohgd/xt9e7o
         Eega4BT6vFWLRyMcQER7XBezLKHggdP3WdJEhQWcvwCH4Se3DpQlEgydCbssGXCNO7HW
         GH+Ylw54pX0VUk6IsJV23mFVEPvBbJYSadcjTey9BDPFcMieGAQSZrdEIAQIpPG2qb0g
         yKtxX1M7aXcDz32P1ND4L5Vcsrqrz8bIzBRtDtf6AGFosQwYL3kfxDpSwDT40y7HV0HN
         qE7TAyIUwae2vBCQVkvB+veEkLqh7cqtfxLhzFN1JoDBScFRfQG2X70Gwkt7wP0Vtkru
         26wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655694; x=1793260494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5432w1B/mY1BOzeKsXE8/FBXgJKiRjyy818qnwTTaU=;
        b=0ROQB50Yw6/RWA5Rx+a4ba3xSaYTx4MgPzNLSBxAOFbeGameHXWmCM/9toK7gBRMbt
         aFWBHd5LZh1I2GhLRxE+9KDo8cazuA0AbcqPSpy30mW5Tvxl69roMlcHJQCfcRd+6bsH
         6eeciLtkqNcNzpdKbUruLtH+j3+l75IAGwgY/ih8N9Yipot2Exhp8hGk94lLVU0iNMez
         4VHpka3NXdsUyXnoRJptVGAOHviQLOSDpu7wbBplRNi9NZ7FW1D8TYsuUIj0dAxgOl2H
         mologLnif1CfiDYnt4IY1L+KN2ncZpEopgkamrMyMG3dajImpFNFsGsK22YloeD8j3qI
         Pnig==
X-Forwarded-Encrypted: i=1; AKwUvBwW9X8AkPav3ueuJUgkq058vdBFxnV9OeVbKUjbmaTQ5kdx8k3esjf9CHYyC55u46qmXARbK4nadr4kPP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYINBUQfhmG56lilHn/9vvZXiMe73azR4pjV//PjKmjQon+diyKv
	WNNuLjXyAGXhDhPvl/ZNXq1Lork1hDfDCVZ+VjHLzBnw/zl29XzMdA0+
X-Gm-Gg: AYBFou0s8OFMl7itPQqZildSrHl3Katy4mNUnB+n4xXF2hM8bCcvD/lQl6MlQO+ep2P
	R1gKg/j7r0f3XF6l1KdCr4uDUcxYOG8QzkWPXN+ZpgqjieYGAE1sz4B1Nx9HcnPhxELou38HBLu
	tXQ/dQMpILYce7jwAiKIrrrtF69YARBRKJib6fTkbl54XMaRzEbW60WZ43XVKeqyBOf4C9IfeRr
	y7VFKRBsY99gNUeTV30R+0XwgrGOrdf8YCSh5xdp48hW+FTQLYByqcETMZDtv8kvRH/mHL1JZw2
	A6IeCAddF1up4jHBSNzM/CnT1cNBE+97gUJ/JJAffbyHEHQMzNOQS487hApryDnR0OVSywW+KlS
	PXQQlsuR6lgtuSHGmslASdl9SbMKXRjiLpPVNkyPCenPYBaEHfDjOwqEv5IBsDligGTPuOZx/oB
	ahg/qMUVuu6rVY59FEuEGrvAysOgfrLrgx/iiamydxTSGqa5zzBLQ3aPw4JRAne/qI0VjW/TY75
	lpztPX1OSmchCvgLgNXFpJTw6H+sRim0IBmW4HAVhdvln7m0ruoWjeB4/0hA54/cf038KPc8Cyj
	Q6QPPrrTs0/4QCnQWA==
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr3406691a91.26.1792655693695;
        Thu, 22 Oct 2026 00:54:53 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:53 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v6 15/15] f2fs: make compressed files compatible with large folio
Date: Thu, 22 Oct 2026 15:53:42 +0800
Message-ID: <20261022075343.3043003-16-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

The compression flag is the hint indicates that the inode can be
compressed, when the inode is using large folio, we expected it keeps
using the large folio read/write paths and its data stays uncompressed
on disk until the inode is evicted and re-read

Let f2fs_write_begin() skip the compression overwrite preparation for
such inodes and remove the compressed-file gate in
f2fs_read_data_large_folio() so the data is simply read/written as
regular blocks.

For the same reason, reject F2FS_IOC_COMPRESS_FILE with -EOPNOTSUPP
once the inode mapping is switched to large folios.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 Documentation/filesystems/f2fs.rst | 10 ++++++++++
 fs/f2fs/compress.c                 |  2 ++
 fs/f2fs/data.c                     |  9 ++-------
 fs/f2fs/file.c                     |  7 +++++++
 4 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 55798421f2c4..b79bb67ee78e 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -942,6 +942,16 @@ Compression implementation
   reserved via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or the file size is
   truncated to zero.
 
+- Compression and large folios are not effective at the same time on a file:
+  a compressed inode does not use large folios, while an inode which is
+  using large folios keeps its data uncompressed on disk.  If the compression
+  flag is set on an inode that is already using large folios, the flag works
+  as a hint until the inode is evicted: the inode keeps using the large folio
+  read/write paths, f2fs_write_begin() skips the compression overwrite
+  preparation, and ioctl(F2FS_IOC_COMPRESS_FILE) fails with -EOPNOTSUPP.
+  Once the inode is evicted and read back, it uses order-0 folios again and
+  compression is applied as usual.
+
 Compress metadata layout::
 
 				[Dnode Structure]
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 162bd8ef822a..721b01dd0d24 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -78,6 +78,8 @@ bool f2fs_is_compressed_page(struct folio *folio)
 		return false;
 	if (folio_test_f2fs_nonpointer(folio))
 		return false;
+	if (f2fs_folio_has_ffs(folio))
+		return false;
 
 	f2fs_bug_on(F2FS_F_SB(folio),
 		*((u32 *)folio->private) != F2FS_COMPRESSED_PAGE_MAGIC);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2338450ce031..c5728fe28370 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3266,12 +3266,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio = false;
 
-	if (f2fs_compressed_file(inode)) {
-		if (folio)
-			folio_unlock(folio);
-		return -EOPNOTSUPP;
-	}
-
 	map.m_seg_type = NO_CHECK_TYPE;
 
 	if (rac)
@@ -5286,7 +5280,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode) &&
+	    !mapping_large_folio_support(inode->i_mapping)) {
 		int ret;
 		struct page *page;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3d621a20766d..e61c80ae7537 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5021,6 +5021,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
+	/*
+	 * The mapping is already using large folios, where the data is kept
+	 * uncompressed, so refuse to start compressing the file.
+	 */
+	if (mapping_large_folio_support(inode->i_mapping))
+		return -EOPNOTSUPP;
+
 	f2fs_balance_fs(sbi, true);
 
 	ret = mnt_want_write_file(filp);
-- 
2.43.0

