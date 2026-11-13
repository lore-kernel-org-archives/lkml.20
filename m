Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600553;
	b=OxSZ9psulMRqaV8ESeiNR1fRUJeQOMD+s42WRuKQtUyj/7ES0dqphWVLiflDz1M7mk0z
	 GYXv3I300pGGbXf/1K0IjBxxBZMvBYrPcVTT99ZbUdt/aYB+JzA167IIzrOJ1+CVpR1uu
	 isnRwOPtaIhtI/nfUDjVBgucvGYNH2mF87gGbZbNpwahCuNicb5MlpFR3bbuJrDXtaPxj
	 6hsbKezA5o5JU6FgCpis25z1Rw0H2aHvNjOgczXF5SHkinaH2Wc0vH/KsW3NxYJWBttBK
	 mn4b2tA/BzxQHS4/x1K/DNB+x7IXF79/Nrs44C0z8qjl33Pl1u9tHI5iI9N0XJKTaxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2JCzw07zOgx11DGTQQhhF28iPAeJ5hNLiG60ahLQknE=;
	b=Vi+yYQ/owvsuozZvbjzFzy5eoY13HJJljyWXAK439r3g1RenWIC9dOMzKKmBvIOY9PdR
	 huVVEcvbVlQ46zbgy6psh3+J55GyCJjnGOu3ULta6mDnApyj9+uQCf9d4d8PDmt1rmhJk
	 K/XRzTZkeomd5T85bbGvXS1fEZbbCtUNYefuy//jmknmmPdxK02nchxrzI1JBjTJdqNUm
	 U96y+QPwAX5H0gIx8JvKjFO4sWifsXCLvOjTSpkWohDANYdQwKTcsM4140T7vY2MMHm8E
	 zgUeu/ag9YR6Sgioc9xxNC6bUqRBEtv/JgJtLC7snKn38azyYYyvLud/QHt0Aj6vrwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f621t1+l;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E628606A897
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E628606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f621t1+l
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so635003b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600552; x=1795205352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JCzw07zOgx11DGTQQhhF28iPAeJ5hNLiG60ahLQknE=;
        b=f621t1+l3LFyEqFI4xtWFUDVqtAZYddsP/LopCueVvVln59bn9q982pU2SvHRdbl9D
         jXyJavipTdav2Ur9PUA4svlvJaFtU8PoMtUHZTXUPo36yxteTc97ocYxqWPfXBZ2MOG2
         1+K8NST4M4eBjNkMRh+puxH5xBlEUe1/ppQAd5tuzViQEVr7ICBOWdDfn1Zk1DUqjimN
         U4fx1FIGCqhtHVv/cF2zgxu2a3XVSNIi8PnsZtJHr/cNB75hbPLZUk9GzqMCyajlVp0i
         8X1zKMUfxuJGuvdcSltovRcVsvidUigS8OnW8Mfhf/ZOODSOWzOgOIUQB6AMCp77e9pR
         awFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600552; x=1795205352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JCzw07zOgx11DGTQQhhF28iPAeJ5hNLiG60ahLQknE=;
        b=WI6AxccnO1AwEnJnHEnWCr3nCDnuDtHbMz5AKDAihnpMTliTko4mmq8jGMQUpWTGzx
         x36njx+fOQLjhAL4Iso9ETg8iqpmI5n2aVyv0K98UPx/EwcjcXuTK10QkuJ2l5jDxMs4
         XvHPpoETdgLog5Ps8qV2/Z64TJ4mAn7cRJu4Zt9gv6nhVjiJasksHc4SdBOCjFje6a1g
         ppleI4QNxb1EvowhxlgD3LA+TjRez6ico6vdUF2V8Gth7X9EKsbN0rdpFSwkgGe+4rZT
         0gd79JL3HS4v4/HxMET1objv0j7Nngyv4G+dKorM4STJbXqYYueY8VcLo9a4cROSV+Il
         +I0Q==
X-Gm-Message-State: APuU4Z+f0j2AmPBPzPY5IKNGDDrfhhN8BaIhETq5lGx8cZuTpraRBu0R
	iEgpyN0YnDF2JDzRtDP10aTSObA1NtylDmyD996lMrYcgmpffI9MAanqyBU/rA==
X-Gm-Gg: AYBFou0vfs2roBxteHDLJED6XagpSuc56v27o3dQh74qaJogaZqQBYkL8dQ02nu0P6D
	xXw/bsgM/ebvh1oEHoLW8BTzDvvMsNjJ1ICmQ61C39OAvma0SsU6ddKfxOjG5M1NkKG9Z6lCHBZ
	vPkTaEmhRvOWDrFk8H/RnbI+pOZkbIkmoK71sHkSLytf3QdFIllbCJcq2E7omZpPp1JhAgehHmm
	RtSHX/SswlBs0wTwH85FxpR9/tduZQSB/6x844QpePL3S39U/s1QVWewiohaBS1vp1GcDHYEe5z
	HeRL2PEMG1x8Zc3ywKVTHkA2hR170WCbcgCBJmMOB1Kayxcin2op4q2EP6qoQj4iWSO/WqhrkoR
	o1rOO2vkoSfUhwMXOPxwCUjci1qSDlgSCh1V+Fac13W6+FuEKHMtZoLC4Falvwwhen5gkEFsH9B
	HPi4diryiYqwmryucktsASKgC+DENkNz9Sh1Myy3R5bdJQNgwg9FRj1/J2f+qArzx6LIC8yVxG1
	wmPR1T3yyERnsNgtG8v6Vy2lS6x6rSMw78gospwPtmO3ZEVW86O13oqblZ2LDgraUxmb9yc7Dzm
	BDSEvcRIL4xzCVb6yoaUABvhY1DohtjWtBvjErWWjT5GGu17mM5tp4uMAv5l+s2NJIptpVtOPbm
	t+eojDAvO1UNoVG5M8sJs6SFfXm/Pa2s18N54vRxuEwS9Pok3IhcpflCN3a4Vjkk2kyQ=
X-Received: by 2002:a17:90b:17d1:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3b1b0a3b41cmr3553616a91.29.1794600552264;
        Fri, 13 Nov 2026 12:09:12 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm10909841a91.1.2026.11.13.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:09:10 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs-tools: set the block size of zoned devices to the logical block size
Date: Fri, 13 Nov 2026 12:09:04 -0800
Message-ID: <20261113200904.3010578-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

From: Daeho Jeong <daehojeong@google.com>

The kernel caches a block device in units of its soft block size, which
is set to the largest power of two that divides the device size, up to
PAGE_SIZE. On a 16KB page kernel, it is 16KB even for a 4KB logical
block device, so a buffered 4KB write is written back as a whole 16KB
unit.

On a host-managed zoned device, the first write in a unit then moves the
write pointer of the sequential zone beyond the written data, and the
next write in the same unit is rejected as an unaligned write, e.g.

  Buffer I/O error on dev nvme0n1, logical block 24576, lost async page write
  Error: While writing the quota_blk to disk!!!

Set the soft block size of zoned devices to their logical block size
with BLKBSZSET, so that each write covers whole units. If it cannot be
set and the current one is larger, fail right away instead of failing in
the middle of the writes. Skip it for dump.f2fs and --dry-run, which do
not write to the device, and when the page size is not larger than the
logical block size, as the soft block size is not larger then either.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 lib/libf2fs.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 93f36ca..b0cdf09 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -922,6 +922,14 @@ void get_kernel_uname_version(__u8 *version)
 #define BLKSSZGET	_IO(0x12,104)
 #endif
 
+#if defined(__linux__) && defined(_IOR) && !defined(BLKBSZGET)
+#define BLKBSZGET	_IOR(0x12,112, size_t)
+#endif
+
+#if defined(__linux__) && defined(_IOW) && !defined(BLKBSZSET)
+#define BLKBSZSET	_IOW(0x12,113, size_t)
+#endif
+
 #if defined(__APPLE__)
 #include <sys/disk.h>
 #define BLKGETSIZE	DKIOCGETBLOCKCOUNT
@@ -1047,6 +1055,34 @@ int get_device_info(int i)
 		else if (dev->sector_size < sector_size)
 			dev->sector_size = sector_size;
 #endif
+#if defined(BLKBSZGET) && defined(BLKBSZSET)
+		/*
+		 * The page cache of a block device is managed in units of its
+		 * soft block size, which can be as large as PAGE_SIZE. A
+		 * smaller write is then written back as a whole unit, which
+		 * moves the write pointer of a sequential zone beyond the
+		 * written data, and makes the next write in the same unit
+		 * fail. Use the logical block size for zoned devices, and do
+		 * not go on to write to the device if it cannot be set. The
+		 * soft block size is larger than the logical block size only
+		 * when PAGE_SIZE is, so leave it alone otherwise.
+		 */
+		if (dev->zoned_model == F2FS_ZONED_HM &&
+				c.func != DUMP && !c.dry_run &&
+				sysconf(_SC_PAGESIZE) > (long)dev->sector_size) {
+			int bsz = dev->sector_size;
+			int cur_bsz = 0;
+
+			if (ioctl(fd, BLKBSZSET, &bsz) < 0 &&
+			    (ioctl(fd, BLKBSZGET, &cur_bsz) < 0 ||
+			     cur_bsz > bsz)) {
+				MSG(0, "\tError: Cannot set the block size "
+					"of %s to %d\n", dev->path, bsz);
+				free(stat_buf);
+				return -1;
+			}
+		}
+#endif
 #ifdef BLKGETSIZE64
 		if (ioctl(fd, BLKGETSIZE64, &dev->total_sectors) < 0) {
 			MSG(0, "\tError: Cannot get the device size\n");
-- 
2.56.0.611.g1030f0b940-goog

