Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C78950AC1C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991306; cv=none; b=dg8d4sSCe7DxEoX3KCF/GlClT3RKaY91J7k7K1u5pMrl+ZW/k8qW6AVJ8LqIIUjoLmyCXc9baNc3QgZrc848n5zGZz7775oK5Wq9bKNqs+y33c/J3+oHOEVyQU8QRkd/ABnJsR9sZjz6VAESx6jOKq7hYG++dtDKG3ZHXjn8uws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991306; c=relaxed/simple;
	bh=pBs7Y297Oe1QIg0d52pT6AvqcNoJZd3gOVtKlHKarwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2SUGmMrq/YahG8zquLyFblmI71Ux/JMfeTz1Z+ZVdbjdM7l8/liLFXHBoNAUlmaj4Cj6LmzWVcC5Wtr20U2/rDsFbliGtacAfNI/ReV4i1QBtJ3IxPKKs1oGO90PX56MnthU0NaZlz8VyNQS5m24qUitweQ9DL/ovH9RBBU+u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/1wFQeH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/1wFQeH"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so3281834a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991304; x=1792596104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=03Sv77pdv2enIYJcIXZDBzD47e3X9YUsV2CCINJLlls=;
        b=E/1wFQeHbWrk9VjLiUUbrqamLzeyosY8O8po6J0tOoX29328kfqN1WXWtjInrVwd2/
         imR+/J9IcBguinufj+F2oEiR5TEbjX/LkM//0AFWcCLxpVYYOnWopBtIG/Gcc1/TD4Ul
         YtKLy0zoIVmXDysWLWUgI9Y8ZczliTFEGqzuo+cYkRRm6iDb7EoSTBpg6cqOiov5X+0C
         1dTyCiYOAMWPbctWdzkB8ZBEXJohVl9BDEV5flTdR5fek/4ns3dCL4gHfMLTB/QJ9FY7
         WbLirxlil/Xbz3dc0kkTO1F452fuQtfmL1U6cQD2QmZXm2ywpRHppF+2lI4brjOUfL8v
         MZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991304; x=1792596104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03Sv77pdv2enIYJcIXZDBzD47e3X9YUsV2CCINJLlls=;
        b=oStBEFkMGoqhVS0/g5CF1KtJzxPMGt0OmJkBDB20fkN5+WPtL58wgSwXv3qch3224A
         YYN68QxyiIM6YEtQPGmQFnp7le3q6Hu6PezeEVkgVFHB1bUyJZhOeYgxsYKls44RFPzk
         X7S/LqCWgDstNzxa11xZS/gjLtYUq6aH1xXmxAQl+u7SR55tWSQqSUUItD+Zj/rtFAjI
         3JyicRQBt+ASqsQ2yQpR7j3RA8rInD+eTSWSDFupMvBPsn5MEboopSI/5Z37JkJ/nDCf
         LuZHdRKby9IzZZyMn0cIRigIQI5PCx7pdq+C5etQNX9gB12XZJREFNqAacNrlJ2GqhZF
         4e0g==
X-Gm-Message-State: AFq9FYJ7JfJo5FDBuOiCZ5oaSEVfdmDhZAusV9bBmyCYTKsAN7IdzBN8
	YZ97kJRKdEG6IbWJvO/0QOa0zKoyz9Jj2l/s4EknlzeW4KF99ldOkYJE6TOREdrm
X-Gm-Gg: AYBFou366K6+7DZ7+6e4SGjHJFXZySc8TMRX4W1dGhBZIcFU+KCDwvunZlzNxLw2aLO
	edf37D8W3lM2HrzJSiZ/N0WIIiHe9nchHGoCz5Z1x7yXvTKImRBBFYg9wFz6lp0y7eJluGFYAQW
	cbCIzLg7P76hhDqdDeDZREVpvyaiBf7XAWjFfetiCYumb1eLi1sR1+4hCkWkXdjIALckyJCF0Vd
	va0IZzKri+gk/7VilmCuDdfHKTQPSoee/VJO94gMm+iDUA58Awrxf3c1rEbIw0VDYKPE/Mzpzax
	hytcEMwfZsBrDRHhzKmfX+nm2hek4t71VqcUa8gyfEQ3vFgO24QMbX+iEpghCubL2rMJWmvjGDr
	Iia79uLVKKmUstRoaoHUJKaOYUZDp5pCiicZdF2sSczQJsSOzwZ8GYEnoHvA7/EDuYpNjW3Hxdl
	ti35IN1LGXe2CEPjTSDEmdAAjO83jTCN3qxeT0afIKNBZ/ODSQHvsILJtTeGLa2CH3ZcsKvqRU4
	iRXVrFHxmVcpBkLtJu85p1eJdilpfTHtEZWdLHJoxnqnRprCy+3qZ3mhLrkuwLhu2upIobXpkYe
	aCwr4/cmH+QUZxs=
X-Received: by 2002:a05:6a20:8f29:b0:3e0:2b03:4008 with SMTP id adf61e73a8af0-3e16bd8348cmr13712804637.12.1791991304125;
        Wed, 14 Oct 2026 08:21:44 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d49af2sm6732967a12.2.2026.10.14.08.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:21:43 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: expose resizable_tail feature via sysfs
Date: Wed, 14 Oct 2026 15:21:38 +0000
Message-ID: <20261014152138.138281-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Userspace has no way to know whether the kernel supports the
resizable_tail_secno mount option before mounting. Passing it to a
kernel without the support fails the mount with -EINVAL, and checking
/sys/fs/f2fs/<disk>/pinned_area_max_secno requires an f2fs instance
to be mounted already.

Export /sys/fs/f2fs/features/resizable_tail so that userspace can check
the support before formatting or mounting a filesystem that relies on
resizable_tail_secno, e.g. a filesystem whose tail is going to be shrunk
online later.

Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinned allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
 fs/f2fs/sysfs.c                         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c4746c416ac..8df18b5d479 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -271,7 +271,7 @@ Description:	Shows all enabled kernel features.
 		inode_crtime, lost_found, verity, sb_checksum,
 		casefold, readonly, compression, test_dummy_encryption_v2,
 		atomic_write, pin_file, encrypted_casefold, linear_lookup,
-		fserror.
+		fserror, resizable_tail.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 9749da70089..8b844a8b0bf 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1421,6 +1421,7 @@ F2FS_FEATURE_RO_ATTR(linear_lookup);
 #endif
 F2FS_FEATURE_RO_ATTR(packed_ssa);
 F2FS_FEATURE_RO_ATTR(fserror);
+F2FS_FEATURE_RO_ATTR(resizable_tail);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
@@ -1592,6 +1593,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 #endif
 	BASE_ATTR_LIST(packed_ssa),
 	BASE_ATTR_LIST(fserror),
+	BASE_ATTR_LIST(resizable_tail),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
-- 
2.56.0.385.gd3acb90ef8-goog

