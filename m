Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4D3D4138
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506649; cv=none; b=k5Niho6/v2JB2QTX/9zrTr7QRbdFqVUj4UvXshbqO4gSb+adFSgw97lidhQzw4KhKtkBZKmpurygvCdwoi3NhbZbHfie9HMj5mnMEQxMgkhadJF7l1hX6Sp2zzlqYWA6ASNtDnkyc1FAhEdYRCk3pGnk3q1KVv3DU68yEaY3R/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506649; c=relaxed/simple;
	bh=j50b6HFpY691xsWjBZr7qmgD/1Uyyqi+7/IqWm3vVTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tw2leEY0siDobcHo/CNUjIKlozEA/CgajNw5hRFYPi+PZpV2tIK+5wy70NXB0bJOdWEjNDVKzJAkEqIdoBS56bSOe6HR08Zv2a8oIy6ZGh+D7B3Hj97HLKdJibk9QSzqa9l8hKJEx5l8htB9sMS+iy7SfDuacFHUB7F+Qxkhai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDwvk1ca; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDwvk1ca"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a0b0fa2055so1255170a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506640; x=1791111440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qM1QolBILO9M6t8Cy7bQUCoiUPwrfyFsHodEhUYmYb8=;
        b=lDwvk1caLDD2PRLWz8TAuScD9btIUPvODBznnsWPIB+2qAFbrWY7bl0KqMD3gkipe3
         Pam6AGz3f+luEZS2BhHdrWoHFVgSyu4XXRMTkNQkn02HpNCrCXsy4xfPWAtHzQ9k43UK
         XaLDE3y2ULIoI4WNTL5vLhzUe4zxp/pO3qzixij4Mcr9/uBM8v3ODP5lFvtR/8+458oN
         wPH5LZdIfOT8cWdQvCPldmrvWjBjicFTHdpjJet5OT4f09RhWRTXOIPXmzXIiabZ4oZv
         TNXeemQD5H3nmJRzYAdUsMlHdzlznHrhHljXrMb+BAWS5MJP6fR+PG8FQXVfQmRJ2QQn
         F8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506640; x=1791111440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qM1QolBILO9M6t8Cy7bQUCoiUPwrfyFsHodEhUYmYb8=;
        b=USbe1XRxGaIOR5i9lVoBQqjZ3h/Wio+4Hm+pCEQWj0wMSDxtQ1ykJJX9rGF2GxZNbI
         QWUloxB0MREXSA95LaFBW7RO/IXGbh5YT10uBBGnk1LkfCN+JKssyK5OmEmNv6I5DFu9
         Y8kQ7ThEYfprw8x1zyWeNnhdSDrZGIjSBIvwwv8Dnu7RozGWx2309RNgxWRwtmLRrq9/
         dlecdeuC2cnUGIUebn6WP4H4OokhMN4L0JaZvzeiKtu7pkphGgXPSz2aSly+u1PzZsBv
         t/BMjxeDfzeMq1hcmKMwRXfQ9ScJmWZisyDLQjpUCJhXXhZhxcN39p5tV6XmAaeNvhXp
         jVXg==
X-Forwarded-Encrypted: i=1; AKwUvBxHfYMqAbevbb2RA0ErFG7pCxPax2vBRDeOeiaLKaT7CGzX2OzhSd20cWtwiewiyyRQQn9eWkXt3QuL9Lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA1nDpcmm7rS3ryxi0CEwCMSnl6nxhqdOqHtk8y8PSUJIkBVJF
	6oUI+jR3BbDPuJcsbKE5aFUQJmPOuUXvkzcmh0/97hDsun3dZ50f/amv
X-Gm-Gg: AYBFou2FFA+kSTEy5GKUL5wdf5rTspfBSwyVstEtRdos8cCjND87hAR7yfdwmcaQqNF
	0dA7uzo1Fm7ghjtmSYpNqEetJzmjTXC/pxLnowqQifuYPqXFfa2vRwRsueOyRlnxl+C7Ut8toEp
	kvR5WZ7R6aU96xs89Jv3POokLOendY13YekB6e1JCPTQcopESi4pUPV0Fe1NPNYtDkA9MIIRK79
	b9FRwxsQ1lpY3CBCQrJDADwjOfVzxVIJv9oF55LoyMWZhpaf3nGfCWmNfXk2W/tM6IR5g7xszQt
	hr1R+G6SLIQO8q/CrZxMtDlJrel6Q/kfguaIQL+VWumDpIll1IAMANqgOkRhRGYQgsNiftA1jbG
	X3JLD/GjMNIvwE0iVCVfkUdRqQh/IF461b3ngpWlWUHvdUgYazTPuDUqij8lCnLtFR5M+Aj1g/7
	p0xpHrKuaI+9kZI8Xq0oXFUo5jyj/luqNJKEuZrfBSVtZquKhriO9Qy+ziHA1yUZxUZ3A+UkpbF
	HqI3csdH98+MCD+YIQLmxVwlEg5y9RpXLxIXEX3lIXVFr2EGbTGhyGtMOzIHdU/Sb20q89NITaT
	CQShhoCIlgB7A/iSFr97VQj7tq2jyFR7eMjf3U66nJk2AkbCtITyzjtt8iQ=
X-Received: by 2002:a17:90b:51c2:b0:3a0:deda:3d07 with SMTP id 98e67ed59e1d1-3a0deda3ff1mr3267462a91.14.1790506639701;
        Sun, 27 Sep 2026 03:57:19 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm14419192a91.16.2026.09.27.03.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:19 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ntfs: set the attribute list size before reserving space for it
Date: Sun, 27 Sep 2026 18:57:12 +0800
Message-ID: <a3db61194cd4c2a472963aa6d9e9563ceb8efd33.1790503811.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790503811.git.matthias.goergens@gmail.com>
References: <cover.1790503811.git.matthias.goergens@gmail.com>
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
index 1bbd2bc62c582..62dfb96e31a3c 100644
--- a/fs/ntfs/attrlist.c
+++ b/fs/ntfs/attrlist.c
@@ -252,6 +252,9 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		return err;
 	}
 
+	/* ntfs_attrlist_repack() below reads the list up to i_size. */
+	i_size_write(attr_vi, base_ni->attr_list_size);
+
 	/*
 	 * Reserve the maximum legal list size while the MFT metadata area is
 	 * still easy to allocate contiguously. This prevents a later list entry
@@ -279,8 +282,6 @@ int ntfs_attrlist_update_locked(struct ntfs_inode *base_ni,
 		}
 	}
 
-	i_size_write(attr_vi, base_ni->attr_list_size);
-
 	if (NInoNonResident(attr_ni) && !NInoAttrListNonResident(base_ni))
 		NInoSetAttrListNonResident(base_ni);
 
-- 
2.55.0

