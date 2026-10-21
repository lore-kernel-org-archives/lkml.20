Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604747;
	b=ypYiVg9yUcuw2CR/nt5xP1LzR3RmesfRN+aYBBzOzF89JwicsF8/QNOFE/BzDCVKHERm
	 JwRKHJPcnAVf1Rb8ibZe3rn5oiwDCDLMe/kjfvH0SG0HTdx49iLOxvYhNyMcayhDpcwqz
	 3CDgzfgfGLF89IyrqcCN5/AMMtp3Hwn3IKJ0k+qGXhxa3lAbbWnuLqHTbzgvVrvxitZTx
	 5NpTKsoM1d2PAe/7RWg7IAf5dgteAkyDVfCOHC+sln1ZSon/Y0UBz+jP/gfVRTJYEbZ0w
	 7+TrHi+Y4EOFaxca36sWNuQR9suCwPP18/Opm0fUlklmUlYFAaBmkECI6H62bljy3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qMSnAmvn+xg6zpwC7JmIegT9TgfMe039TBaNzlGjfQg=;
	b=eOiZB2qaoP8JcUGkwgejwQpzTuwIp2sRix9OGoI0fGZam4IIgTk0ARHtklQVdvSHpEli
	 JYx2TAy5Y81iKu3enuFKcdAWAqH/1pi9svMZnLZtJBslbywhY+0wls5HyzCW0eS5V+bUy
	 HAZIxDZHmUbkD1dV/GZ1/WS03ASFd8z98SgJhlnRA8lMyHBq6dJInMtK5NwuO9JNbQpp8
	 jqY5NII6NpjAhGQpOjNv5OWaHnq1orobCuKhr0nOFP/qsFM0I5+fCwbe+ZHItoJ9ETHOI
	 /YaX2qGLwvrZjnv6r3tQrjhdIARFXKB+3JomSLNYzlTmEVvMhf7BVTuRrXWtm/JnzKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=E4K0X3i8;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8620606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8620606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=E4K0X3i8
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab38a051aaso10193807b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792604746; x=1793209546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMSnAmvn+xg6zpwC7JmIegT9TgfMe039TBaNzlGjfQg=;
        b=E4K0X3i8r+6CaMc7vAJpCu7jS+wDCnhpEaPPLdQvVZCLJD37G+UJgN38uvC4T8dzwr
         NOfzj9+2eIomAlkoy02RfEzQG6qRQAhSVRjTdMvDG+rn1IW9pThm8Zqz/2dKsf1gIsmk
         ZRTF66Ylj9OO0YQxDgt2uNJCVrMbUuVzKZy3NrjoQwf31cJ8d5szD90Rm+QWb7Rb+DYs
         bRUTIH8nvFu/pqvIKTJhTz9gkdpR7+EpTOWmaB4k8JGZHf5tsS4ZbU8ueDmBuLQzm0z7
         rVsGvLeT1cvTkdC41gXIHWzZ1zH8Mwtu1NverGxQJ1vrt7j2o3kdnqX/BhGPFAVSol9Z
         wRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604746; x=1793209546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMSnAmvn+xg6zpwC7JmIegT9TgfMe039TBaNzlGjfQg=;
        b=Guy2FwHfDSwKcDVnTsYh4YbRRISdLrAu3NY7mMUrGdHyJ6IIuw6ZQqwd4LwU0ZolSK
         uN1w50xRKjcXKmzzQxh/pDd/qyRxS8KvhjkvcpRlDZYFSCxGhHCIIFxKr7kxfHVnWq8H
         LVwXhCv4+3fzgzBrnC2YV4D6v/kTB6r0ZPMIuk1BJKBwaokxmAP1eAxVXfS8Wt/I2Go+
         p8/Y/YKcXfz9YpJaSkoNUGQxrAxvSUdkQHVgabTmUxU6BQcMeM2gktUFBeLxT0cYFbyr
         P4Yp2ZG0yh0tAcbx49e7zgd4JWKhrdk7nFsaHzeeZu3yiojZHdB6DcBcY0DScZqks4F9
         W+Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzw7plZ0ViZUZVmyD6ETN0XF3vuYmcrPbQpZSzAIXipf9ggmtuqQ0DujnVhbQAHOBLz6IWZwzekTVaLSKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLglPGeSFgLPQDyt8gfBSsBAcr1R9w/a/VU5plzm5rwGmAg08BE
	JVm6gSizrShaWAZiYhkyC62zxDx6YokP4CBGqnkzttx+rZsp3Lr/akYiX8ejW8jn3Q==
X-Gm-Gg: AYBFou1KC+PMUcbskMrZfbtzkCg1VESiGgyUg53iqnSLDnCoxXcWNkcFohD/k0VgAIA
	FGpt8L3fOExWKbvbtxFI17I6zMiFqbWyiQrjkkQwOPstrfov55IqyTTXs8EtuVOuMvcUzaymHJg
	+wMi0K5+RtwejlVYfoCQEZTqAkNqXH5q5co4Cyg0SMJaqxES6kRqEvr5R/Wmh6HGd5IuaYWu6wS
	BC/L2rjh7Ib3duBE2jEDCK3rLVAeZdE7dq2NEj+LRspS50NLbtKLJLtjD8eoWIQ0eigJ5pqy0a4
	GLtYZPPv6R1VCq3YHJrSJUB9gpkihYqX8SA45suMZNuZCimpnFuWIQQdi1jRtpP/qCt7qiygD0+
	RdTz6B9VitJpxbPsPkCbVUaU0wSqE0keBDgYrP7I3LkZOXFx/g13s54AFDQPp5E/Uok87CPki2Q
	QIkifAK5ye/aS8tHDM1ovIsOiWjm+MDrTMRhVw6LkkbjdsG/vE9Ke4wN2TE0l2HOtipvoFgLoAl
	vueHSQHQoqTS7v8cdEfWEWRD0V8gmyI3i03eqDp1B2qLo8Ib8q4y/c4RIhfmTrd0/t6Au4aeuVp
	Qbk=
X-Received: by 2002:a05:690c:e251:20b0:8b1:901:b9ee with SMTP id 00721157ae682-8b133e48cc2mr11819357b3.13.1792604745668;
        Wed, 21 Oct 2026 10:45:45 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300f3cfesm14789647b3.27.2026.10.21.10.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:45:45 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] hfsplus: preserve FinderInfo when listing extended attributes
Date: Wed, 21 Oct 2026 13:45:34 -0400
Message-ID: <20261021174534.482192-1-hengyul@cs.unc.edu>
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
Tested in KVM with KASAN on a804c5742bff, without and with this patch:
- The commands above, and a C test of listxattr() sizes and buffer
  lengths: a file with only FinderInfo gives 0 without the patch and
  25 with it; a file without extended attributes gives 0 on both.
- generic/062: 10/10 passed on both kernels.
- Full fstests (805 generic tests): 186 passed, 11 failed and 608 not
  run on both kernels, with the same failing tests. fsck.hfsplus -fn
  reported no new errors.

With this patch, getfattr above prints "osx.com.apple.FinderInf". The
last character is lost by a separate bug in copy_name(), which Maurycy
Pawlowski-Wieronski's patch fixes:
https://lore.kernel.org/all/20260828-hfsplus-copy_name-fix-v1-1-75ed9f0f378c@maurycy.com/

 fs/hfsplus/xattr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index 71364e093fa7..c74c81966f12 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -838,7 +838,6 @@ ssize_t hfsplus_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	err = hfsplus_find_attr(inode->i_sb, inode->i_ino, NULL, &fd);
 	if (err) {
 		if (err == -ENOENT || err == -ENODATA) {
-			res = 0;
 			goto end_listxattr;
 		} else {
 			res = err;

base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
-- 
2.53.0

