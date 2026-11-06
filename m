Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926176;
	b=iaJnXezg1gdwbh6yzPYpOI8yDNUmL7dgeXa0SUG16m2WEOnp+/8qBN733uNfEdvOzTR2
	 CKb2qQRNwXDqEJIYIprbOAAE1urTZBfJcBTGkbOvI9Qrs9/78HlqL9t/3Hmx1SMkLq5uW
	 Akgbty1SG1Ge97Kht7rkueMJIPzqr4gZ03sJdW5OtxiW7mVKWEatsk/ebel+rafv52Vtz
	 Xd4WrJEwJ5AmBNrfGf3a0OInJNsxwzlu0rdXVjQhDjSDVfnZtMX/k0X9iKR4IT1hPnGcq
	 uXAEH/WF3R6IO4tB9xGn0V1WCtLBe/DhtukXxEjKUiPsRc0DYit/74DKiHBKjU04azQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pQEO01ciF970e+91pnP2bZpNYHOflDL1L7tQ/3yYlos=;
	b=w35swvFmLBGA1ZFVwmWT4scV3yv4gXiGjxgXGO1AcPH7nlKpQBlmPnvqIhAeTTc+uBqd
	 C7L31LqQJko4JtUfBJUAdKnswBDF28SJM7rmNj5EdP1DFOBSVCdd2EK1rEzbmdvC3Upi3
	 3VzmkVoHjsvrIKZeFctzAqGslpdTNcXI+hDNgRntnD/HgMjoiZWd4cp2DqjDW58AH1CYs
	 iqSGYTqTV5hf0wqH5XiNsKXNn+qjAOoQmQ1OZzalHuS+tMtOh4kMf7rjJX0VNc3A9rweR
	 2r3lKoUGdaXndKeghb5gvRU94z4HpnCkAcse94MA0loCBsOP3D0EGYR1o5BAKaCpBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SRvsCRRh;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575BE606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575BE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SRvsCRRh
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b31fc13124so250387b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1793926175; x=1794530975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQEO01ciF970e+91pnP2bZpNYHOflDL1L7tQ/3yYlos=;
        b=SRvsCRRh6RXZ6HSsP9hDVUOfGHTN2h+v6pEIzcaWNaMhUyl8R89A5rSdYFjSey0WBn
         LZ9CEd7glpe7Ucv1Ix7TF6OO5amWDz508ONNAilzMUEFPD6+DRKlc7xpa0+SEtDwcIRN
         qJlJ8Oga5cZHpIA4Wf1oPxKA1wx/ggWN96eKzaV7rfw0wK/Kaz8Id7ZBLbDJgtUZ5x11
         cUMIoJX0jgEa2aglKf1uPAai9na9bmmppDRSD7oHWWPBdJAFbEI/oqDMaFF2CacoPttw
         CojtyXcqHdeIZEUdKUFtVW5hEtkDNYgSlrhDB/D2vjeRMVV/QrA2eX6dctznoUoLM+im
         TXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926175; x=1794530975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQEO01ciF970e+91pnP2bZpNYHOflDL1L7tQ/3yYlos=;
        b=w59gWbQXh5vhg8Azj66IWvvYWTRLmief4r5cdT8QNggBAww2oZRAbXTImiZ0p068NK
         oNUgckFDZpO2oplmq44fQOO1NFPIxdbt4PimsstKiIYatQzrDFgDjkIYt7DM1ViVfV1u
         pCbW4rpQ1RGwEDjC+QqbOI7YdejxA4rGIVrVEjOza4/Y5bUC3ohUsnDQfeIOF0FvaIU3
         jSMGHPmFmEe66lcDdNWwyerdUwdRkAlFbnKeXdAs2HBLoSG5lPbmwOvUdwvopSmEMwmh
         537lUCJKUz/2d1V90tX0jDD/4NGXz27sjS8kpQwm12ijNCixMvQfhekMHeF8ROWkDYJL
         7Ybw==
X-Forwarded-Encrypted: i=1; AL+hErFYvGuANEUrC6acO94NYJDUKR36WgnWxC1G9YUkD9Hdql2m2K44ZJmad0xByY+pPUjvRF27IH/ik3FVXdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jW+eqfsjxwxCIV078+eDx4z424OAQ4c0LRjWy88M+05Qt0h9E
	Zodp2D9y65O48SJWzByoaSv/z0qZo84TYX4U68dUUPGgnxonCxKBUIUx0hLKVemuATc=
X-Gm-Gg: AYBFou2g7KGW6ztEKVn5WzDIeAadeZtLscs2oJpwq2ZmutnFtoAfqYbSIEef3CEXYuf
	udfYWEapkaGafj3CMFvcOnfigx/2fcoMfn5IimRezMXkQKYsPuY+Rhw/BBMpds78G9dOxijqaA9
	wh4KEyrg/8VF59QKhXOTddYezG+DKCx95yRk8tL1kNjRI3HVHXmY7aEhORlY32y6CLyeNwXgOqu
	2rt0YIguupAeAEQISFNQazZYRU5a7HnxMKLS4q8s8X/Qaf7/7z8pbksRn0kG/ga5AoFPeol4XaD
	ra1xMcWMsEshf2zuGlDhn8HDvAbvWZORZ2nd0L2ZdxLw78qORabqGa8BzMmmIxZJNH52YUz10xZ
	1cPAwW0Vs9ayZRiRKLcCuxXp6sN/KWQ2oKHNuqIaok3eYkSrQ6Xj1/Ta8E5v/4FEDRm2Yvj9gAA
	nyiR/09noxVA138382k7VEi8/bsbjQW/cZFuqePBv0SHSYD3voOeR1tYA0coY6d1ZYGpz3QSnVl
	Mg6VwRyqLRPFp5NlSBXxEgPgp7SiV84pCUEwkCCWlzlXSGIqwl5EuCJssKcxd1vUazDjWXFDtRu
	bKziYx3DFov3cefeh5fwOcK80ei+0H2gi2/CYinJZFtgOQcDwzqvUX3eWazTKLvnax6udF5g9QN
	QKDBAJ61V5+IC9J6hQkAcbw5qnnKVuWJNTF2a3Pn3zdwpD6URge3yMNX2jmY=
X-Received: by 2002:a05:690e:1443:b0:677:d023:49e3 with SMTP id 956f58d0204a3-67c1454bac8mr777734d50.65.1793926175279;
        Thu, 05 Nov 2026 16:49:35 -0800 (PST)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:62d1:9ddf:24f7:e87e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0e5fsm851304d50.5.2026.11.05.16.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 16:49:34 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 1/2] hfsplus: set s_maxbytes from the volume capacity
Date: Thu,  5 Nov 2026 16:49:22 -0800
Message-ID: <20261106004923.1844283-2-slava@dubeyko.com>
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

The xfstests' test-case generic/564 expects -EFBIG when
copy_file_range() targets a destination offset near 8EiB.
hfsplus_fill_super() sets s_maxbytes to MAX_LFS_FILESIZE,
so the VFS limit checks (generic_write_check_limits())
only trim the length instead of failing, and the request
reaches the file system. Because HFS+ does not support
holes, the driver then tries to zero-fill the whole gap
up to the target offset, and the operation fails with
-ENOSPC instead of -EFBIG.

This was previously worked around by a local check
against the volume capacity in hfsplus_write_begin().
That check only covered the write path and only the
start offset: truncate up, copy_file_range() and writes
that straddle the limit were not handled.

Every byte of an HFS+ file up to end-of-file must be
backed by an allocated block, so a file can never be
larger than the volume. Set s_maxbytes to the volume
capacity (total_blocks << alloc_blksz_shift, capped by
MAX_LFS_FILESIZE). The VFS then returns -EFBIG for
write(), copy_file_range(), truncate and fallocate
beyond that limit, and trims writes that straddle it.
Drop the now redundant local check from
hfsplus_write_begin().

Fixes: 56a4dbc90601 ("hfsplus: fix error code when writing beyond volume capacity")
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfsplus/inode.c |  7 -------
 fs/hfsplus/super.c | 10 +++++++++-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index aed0866499b2..5fa72b465922 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -44,15 +44,8 @@ int hfsplus_write_begin(const struct kiocb *iocb,
 			void **fsdata)
 {
 	struct inode *inode = mapping->host;
-	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
-	loff_t total_capacity;
 	int ret;
 
-	total_capacity = (loff_t)sbi->total_blocks << sbi->alloc_blksz_shift;
-
-	if (pos >= total_capacity)
-		return -EFBIG;
-
 	ret = cont_write_begin(iocb, mapping, pos, len, foliop, fsdata,
 				hfsplus_get_block,
 				&HFSPLUS_I(inode)->phys_size);
diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index 4e878641fb59..f3283e9b42c8 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -672,7 +672,15 @@ static int hfsplus_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* Set up operations so we can load metadata */
 	sb->s_op = &hfsplus_sops;
-	sb->s_maxbytes = MAX_LFS_FILESIZE;
+
+	/*
+	 * HFS+ does not support sparse files, so every byte up to
+	 * the end-of-file has to be backed by an allocated block.
+	 * Therefore, a file can never be larger than the volume.
+	 */
+	sb->s_maxbytes = min_t(loff_t, MAX_LFS_FILESIZE,
+			       (loff_t)sbi->total_blocks <<
+					sbi->alloc_blksz_shift);
 
 	if (!(vhdr->attributes & cpu_to_be32(HFSPLUS_VOL_UNMNT))) {
 		pr_warn("Filesystem was not cleanly unmounted, running fsck.hfsplus is recommended.  mounting read-only.\n");
-- 
2.43.0

