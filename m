Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4EE41442F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107778; cv=none; b=t+ZEgFW9hv4fvhxq6HtMFL2rJ990stEGwZIO5fsHYL8cUI2IETiIPUVzNxZmHxAJaweujKRmCNC8v2UUpKzqLM69koArn11P6sOZlx/BWaI8jXVKYg/GV8xHicvAfkua3bWPMS50GSFWdpnqNGACyJERdo2jP0z3kLJC8ndd0A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107778; c=relaxed/simple;
	bh=+GGAOb4rGJgpXMxIngb5vc1ci0qSp8bUnDzlGkuVbHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baBvKYVG7BMYzDGhM5eMeSGrkJkdzqVjR5glgtdqysWM8GMhU/cRLBels05y3aNbi2Q+MAZT3AVImr5HWzQZGiP+VT17xDtEtAxK1bqt/Y76EWC2t2fSTeU3ZN4fCSusQhNeKUp4XlNhQzxbj6QiUHYzQSY0yfDtrhVezrL1cCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtiaMI/y; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtiaMI/y"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a9f57bd42so238682b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107776; x=1791712576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6dhwlhuHfppNHFWGhV6LLMGTjzCNhvMr26duFoEtJc=;
        b=BtiaMI/y8MBF28BVimyMQgRUz7q60pjNiNOraUNFc8DQ93M49OHoTszPZ3s2bBi9Xg
         vYAZezqB4rM0HrmN8LkbbIffbIr03lKZEe0E/zXB66EYBkaHByVgWFh+aKVAG0xN8pAt
         9hSx7n7pfBnRZ2t/FPE4Mei78agDXQKnFQjQIU0/YM8HKjzZZskXEvBNoRhIMcQslMSL
         wtn5hbUCj0PdtrlEQKpFHt8UY/5uclH+6+rbSE5bQQViFkda+ps94RNNhwcUj0h6KOZq
         d9fmz4R0m397SAJyQ254j/5Osgo/sOTR/RE9Er9g3m3+2PfHHwWtwUrV5CK+3SMzInRx
         NIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107776; x=1791712576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6dhwlhuHfppNHFWGhV6LLMGTjzCNhvMr26duFoEtJc=;
        b=LGbMQxNyqVL+gKewwVozM8eWTzmzEYvnt+chWH5iBBnLSUI0g8CdlhLHO/n4l0GmJo
         ugJvBDmJnb0gtuXCktuddQ9XZk+aJr2zYS073gsFcnjh1MUrA9/KZm/7kPfk+rz2BDcr
         f59sQJOYE1gr1EtozMl3ayKtpI8ZQcRfniwJBR69Ar1XsS4zqXCAyG1y40M5OcE8VGzx
         BYP6A0vp1TnviDN255R6w5C+QIcPDzeZg/Qkclif5HP7jLN7bmzvwQx5IJfpIKudmPrd
         Rr9j1M3uMU5gj5mHr89MNA8n85AIQUrZZ3bBl9wSEWPNvIf8eUd6QGVDwQ1RrWzx5d8U
         tsmw==
X-Forwarded-Encrypted: i=1; AKwUvBwI3DrKTA1dMe6AVaxwNrS9038roAdqUqdrtD2I5B5iV0soN1np1ytO85c+rMZjiaDIvXdyvuzUAplzBnc=@vger.kernel.org
X-Gm-Message-State: AFuF++lcEG+weIcZD346aGkktHluPMyZK4uh5yLm8c9YZt/oXShJlUlL
	4GFttVIUE5AtLU+4NaBC3sR0xlKItaBWIUxBeh1vzl95wlbGt7lfsWuv
X-Gm-Gg: AYBFou0qSYkaYpuRxYFQw+taG7mdLSeBtL+2hAP7eXra+CN/8Q3rmYi8g73jNR342ve
	uTy9Yad3g2/Dqj+FZQ7F+YBY8124ITHQX4R4BhMTgz82QBs88p/5X9eUFrHrsYEM/QmHhm699T2
	1Y+p58AQgnpPYot7pZDZgX91R0vMYZKbujAJ/9jvWRt/hUoe+rKv9Vl76WN7d7FzSDfcSGCHBSv
	F2Tgbce8ZM7sbYboygmHyuv7SdoRJApym4aYz1VrXXkXjgHdUHIWck+usVGdvMmTben9ljuCoEW
	hs4K74eHvd5rh8OAWJJxfQKdzYZEbYJff3b7OiqhO8x58E8abmR3mqWkOeXvrGctAMg/Ch9A8Qi
	0a1XFdoVmnmFUaTXHjOu/uvn6VGP6woXvQmzO+WOtntbWuUBCIlboM+yvfs0+A4i503lJJI5srI
	cNsIOTQLbCyoYH1732qvzHKr+wgLb0vil6aCjBJqOmlFSzwLvyRYHh/46mbheI326XPfKuYw89n
	y0OF2VWT0I3XrbrqH3SsV06eR2Yo/98l+KsHtNKjD55X5mtWBAra04vUdeXPHnihqeGLbeFnDLJ
	uFEh7fYg7hFwCqV5QgkPRUBkpQ02T2z8MK3ovWqquc6PuzAwznRTALGd2h1Q2aNykoo9UA==
X-Received: by 2002:a05:6a00:409a:b0:880:fd80:d629 with SMTP id d2e1a72fcca58-88af58d4ddbmr6837436b3a.22.1791107775821;
        Sun, 04 Oct 2026 02:56:15 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:15 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] ntfs: set the attribute list size before reserving space for it
Date: Sun,  4 Oct 2026 17:56:05 +0800
Message-ID: <f95082ee39faa2600158c7f66fbeb0506ad56d80.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791107674.git.matthias.goergens@gmail.com>
References: <cover.1791107674.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_attrlist_update_locked() resizes the attribute list and then, for
$MFT, tries to reserve the maximum list size.  When that allocation
fails with -ENOSPC it falls back to ntfs_attrlist_repack(), which reads
the list through ntfs_inode_attr_pread().  The read stops at i_size,
but i_size is only updated after the reserve, so when the list has just
grown the repack gets a short read and returns -EIO.  Only -ENOSPC from
the reserve is ignored, so the -EIO fails the $MFT extension and with
it the file creation that needed a new mft record.

On a 32 MiB volume with 512-byte clusters whose $MFT has a non-resident
attribute list, 591 of 1500 creations of empty files succeed and the
rest fail with EIO while 742 KiB is still free:

  ntfs: (device vda): ntfs_attrlist_update_locked(): Failed to reserve attribute list space
  ntfs: Failed add attr entry to attrlist
  ntfs: MP update failed
  ntfs: (device vda): ntfs_mft_record_alloc(): Failed to extend mft data allocation.

Update i_size as soon as the list has been resized.  File creation then
goes on until the volume is full and fails with ENOSPC.

Fixes: b1d732e62a5b ("ntfs: repack $MFT/$ATTRIBUTE LIST")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
The volume is frag.img from
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-09-26-ntfs-mft-runlist
(mft-bootstrap/frag.img.xz); creating empty files on it until one fails
is enough.  Tested with KASAN and lockdep: after the patch the files
written before the volume filled read back intact after a remount, and
ntfsfix and ntfsresize --info find nothing wrong with the image.
---
 fs/ntfs/attrlist.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrlist.c b/fs/ntfs/attrlist.c
index 3660e7fd24b1..6edd5d2d9bf2 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -256,6 +256,9 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		return err;
 	}
 
+	/* ntfs_attrlist_repack() below reads the list up to i_size. */
+	i_size_write(attr_vi, base_ni->attr_list_size);
+
 	/*
 	 * Reserve the maximum legal list size while the MFT metadata area is
 	 * still easy to allocate contiguously. This prevents a later list entry
@@ -283,8 +286,6 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		}
 	}
 
-	i_size_write(attr_vi, base_ni->attr_list_size);
-
 	if (NInoNonResident(attr_ni) && !NInoAttrListNonResident(base_ni))
 		NInoSetAttrListNonResident(base_ni);
 
-- 
2.56.0

