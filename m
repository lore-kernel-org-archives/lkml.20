Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662068;
	b=SUVOjHTrdJnfyTav2xOr8Z07bBAYUJDyi109lOybxTL5SkbRMO9lKOqUDcgkl/mHAURm
	 cqcTryQkAozdegoDn0PiPGurqpy8GTcf+IM6NCDc49VxRnlEkIOlyTNRASozoydsFkSDy
	 Lxb+hGpbju7XkO4yE3vKDjvHAL4fBPydqWBMQSkSPKR0xA+cJ7qiSqcGwEEYiGRKIOWab
	 S+gaijZrVARKE387VggJBs8bOgxsbFYeXGxUgeF9SSv6K0RvvSMu9hPH1G3XXe6aMQPov
	 zS/MREdAKCcv08h9APf6pH7j0otkWrKMRJrhSjYWX+iXjhsbjH9OyXuPjKWY4DtjpQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XIEdpK6uoY0VcAn4RMjuLM3ziGKUkenXplth+Lt8Y7A=;
	b=03XZu0impzIZK18Nqc2hmmaZPy7zdQGvCNjwxSsTR9ag35jk6+gYVxyMmcLayXyyqL2Q
	 r6+N0GM9WaJseuS6h91aO7oCYGOvPHPlCHJDjuIjdCK61Jh1rZvLSc9I/5qaB0ueBwwRZ
	 voP9AAybtkRdwvoCYip/x1dhKbHVi0Q7GXteiXbqcAr2mzt84FyC7nDPp+pcvt9Nazm/6
	 mrU12uOjSLYo+58qlBfjaC1BEH4u7Qr4QorCfZ90WkqQMOoozBfUtBaoozAMv/0O2CiBN
	 u8fZTBNN+p1lo9VxaFjxBNAUsi6RM42ENtRCGHVJJUHI9pxAZLVvnTkXQwZYj0bWDZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=kz3Vg9pv;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9DD606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B9DD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=kz3Vg9pv
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b8306b9f8so26003976d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792662067; x=1793266867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIEdpK6uoY0VcAn4RMjuLM3ziGKUkenXplth+Lt8Y7A=;
        b=kz3Vg9pvKqAJ2lSpLZ/iAeT6tIlkg/q/lJDA65XliRZtEb1BP2h5McqrqUuHNE0A+Q
         T9EOQwdqdK6yfwIGeUo6xoq2dQwQitTjYraLMBqq26QrO/IDS5sd4VHYo4z6/M1MoOyB
         ZKc2iW9QbX2tDjW8lwIRHk4+AqR/joJ9OOmVHtvbiihqQbvYOCmvsop/a4capa5jPt5f
         lMym/OyK57LJd+Wjf/8q1yUDG6hb62kEKbpIea7mKtrydASLGKyYE1ov/CCJsT2oDsi3
         wisSn5UqPg+vcp1ZStL7L4Ctr/iQVO3K4ePRJlvpeODN7rNvki9IB7eSvRLerO8/ayfR
         bGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662067; x=1793266867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIEdpK6uoY0VcAn4RMjuLM3ziGKUkenXplth+Lt8Y7A=;
        b=A6dKjod4co7IlRtaQFIO94lKfrn9yCinFVomDzWHf6HKL8yqhiNUEcCrJjqKU8mlSA
         XkE8j3UTxTyABuB6z09F8bb+6Lq3dzRMXBIkWz6sMCHmp2Nl1MSx6a/b7DzJcugZb7Tn
         hwS2c6iKcraeHVZ+WemPFsuMFeTejGeMyf5hmtqnXGS+0+VshYxVx1CyEPgis9Mvn//m
         A3nlwnwzRfGNjL5XSe1gLnN3YHb0JyjzEPL5HGb3pNn8kmMgQay9yk322kasNja4AUvV
         yJkxVkefUfAMdxNrcgI2AtD4IHHIqkWf859hI12yODBdaE8lGBaSlIUSXNWpT7QusoJ2
         brIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdhQbd2mojkyOBF2R98/uaF5AEyjnA23GLwIr3QQvm8m42z+XglK71+FNubP4fhZ+6bnojhzazh5mpmyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFZqf/11zypC2W3+q6osuRwFtIpgGCxmK8ZkVxpR7ZTFKm90Na
	DKowt+vFcOk9MqSuGAoGbGyRUe12m74IW017sPEjBMvX51DerwVTQRl/M6Mlkr+Img==
X-Gm-Gg: AYBFou3Q/9D5Klq64ixtdJ0bbhX1Fes4V4MdpcCadM+bhiC3oz/BJwU5UGJF/QbeIB2
	9PAwY/uciICLHrrGp2+K1jgcczAUm3eSzk8Pv3BW91fxIvGalsvfHxC2O6uzouZLD56Mtt5empX
	l18NCUCF1lXgduTnXR7f9oYPst/khDHl9Ogi6AOasLkMI/rkWZKHVbkEHL81+ddiq9jrmCVTWqT
	CyioxWqor17lpdM1C+V2I8by9B70j8wcfdJTtp8XonjTzDxNq1q97RuEWVb8e4gq9sINGPDzymA
	EoPts8Er4viEMLU3RFlbDX8+KukC1EPnB2phwu0nrWGv13ah9jv7JyzVJgJRbaS2iKt52mUQ4nY
	ajP8S5SSckhXaMVjojqr5ykfTge0qiPSVgXFpvU89o3MI0b+gfDgzXmYfmDlezZ7UmjDGOevkkY
	Kf69OVyg7Qu5eUYEhK+u8y/ujlEls5xNt4EPH4SLPNboTez1jL1BdNCQVmgW9da7W77FaiXKsV/
	U+68+B/LF70JUM+T9tuBFwjAssam06O9Sugsl96wkzKyvq3SVPIJEtsU3Gx1K5lYyaHvjzxzN93
	j34=
X-Received: by 2002:a05:6214:418a:b0:91b:5d39:e13f with SMTP id 6a1803df08f44-91c12f339e4mr79983386d6.52.1792662066786;
        Thu, 22 Oct 2026 02:41:06 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c0f838sm46074876d6.32.2026.10.22.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:06 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] hfsplus: preserve FinderInfo when listing extended attributes
Date: Thu, 22 Oct 2026 05:40:58 -0400
Message-ID: <20261022094058.1169039-1-hengyul@cs.unc.edu>
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

Commit aef507847129 ("hfsplus: fix generic/062 xfstests failure") made
hfsplus_listxattr() return zero when the inode has no records in the
attributes B-tree.

However, osx.com.apple.FinderInfo is stored in the catalog record, and
hfsplus_listxattr() has already added it to the result at that point.
Setting the result to zero drops it. As of now, a file whose only
extended attribute is FinderInfo gets an empty list on a volume with
an attributes B-tree, which mkfs.hfsplus creates by default. getxattr()
still returns the value.

The issue can be reproduced with:

    truncate -s 64M hfs.img
    mkfs.hfsplus hfs.img
    mount -o loop hfs.img /mnt
    touch /mnt/file
    v=0x54455854$(printf %056d 0)
    setfattr -n osx.com.apple.FinderInfo -v $v /mnt/file
    getfattr -m - /mnt/file

Without this patch, getfattr prints nothing. With this patch, it lists
the FinderInfo entry.

This patch keeps the result of hfsplus_listxattr_finder_info() when no
attributes B-tree records are found, as is already done when the
volume has no attributes B-tree. A file without extended attributes
still gets an empty list.

Fixes: aef507847129 ("hfsplus: fix generic/062 xfstests failure")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Changes in v2:
- Restructure the error check as suggested by Viacheslav Dubeyko. No
  functional change.
- v1: https://lore.kernel.org/r/20261021174534.482192-1-hengyul@cs.unc.edu

Tested in KVM with KASAN on a804c5742bff, without and with this patch:
- The commands above, and a C test of listxattr() sizes and buffer
  lengths: a file with only FinderInfo gives 0 without the patch and
  25 with it; a file without extended attributes gives 0 on both.
- generic/062: 10/10 passed on both kernels.
- Full fstests (805 generic tests, 608 not run on both kernels): 186
  passed and 11 failed without the patch, 187 and 10 with it. The only
  difference is generic/795, which fails at random on both kernels
  with fsck "Invalid volume file count" (1 of 11 runs without the
  patch, 2 of 11 with it). generic/089 and a small test that only
  creates files and unlinks them while open hit the same error on both
  kernels. This looks like a separate race: hfsplus_file_release()
  updates file_count without vh_mutex.

With this patch, getfattr above prints "osx.com.apple.FinderInf". The
last character is lost by a separate bug in copy_name(), which Maurycy
Pawlowski-Wieronski's patch fixes:
https://lore.kernel.org/all/20260828-hfsplus-copy_name-fix-v1-1-75ed9f0f378c@maurycy.com/

 fs/hfsplus/xattr.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index 71364e093fa7..45571d6f3abd 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -837,13 +837,9 @@ ssize_t hfsplus_listxattr(struct dentry *dentry, char *buffer, size_t size)
 
 	err = hfsplus_find_attr(inode->i_sb, inode->i_ino, NULL, &fd);
 	if (err) {
-		if (err == -ENOENT || err == -ENODATA) {
-			res = 0;
-			goto end_listxattr;
-		} else {
+		if (err != -ENOENT && err != -ENODATA)
 			res = err;
-			goto end_listxattr;
-		}
+		goto end_listxattr;
 	}
 
 	for (;;) {

base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
-- 
2.53.0

