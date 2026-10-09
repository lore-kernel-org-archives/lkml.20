Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDC3F4DE9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525358; cv=none; b=ik9rta1a6gvn6bZp7fh5RliEztN1BkBTCr4IypdwlshHI00g4ElB9nxNxYJKUWJuO9K5P1A/w9Q7WcjLcCX5y2DwV2e3AFgvumCMz7VHdQYDQKXsClVI575dR3HJFJoxet72fz30sRVnobbPxGrUZoLl+LX/WNmLhMlDCsrqReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525358; c=relaxed/simple;
	bh=9emYsz15GuXjmCU4lAwqVw4KY/Rrcx/aCcY0KTAhp9w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q1eM6ZSq2hzTDwUST0ieCMzeeS7nBuw+7QN2dqJVPHiUpVZhya5SObyFAl62DnPIG5I+aqGHFZ5o2fox0845d7sbcT594pd1IbjZp0zmA7XAeVk7PPP/Nq7hG13G+8rvkmKSN+foeeV/rCEtb2bs6pz7KlqSkHMmATUfzVEfNg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCUisXHP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCUisXHP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso4678497f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791525355; x=1792130155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zp7G9mLjsHEHBJvEhOvfosmT6IrpsVXu9tMKZrIiLvQ=;
        b=oCUisXHPYXpccFMBVqueMbFFrtpmsKdjN33T8LwQPv7B4nU/y+//eCv6kh9HbVXHBx
         CGb7N0qrmLa/n1T6ftp1boCAbLPT5YqQD4BBS9XFruXkIWW4rTTEvN5s52z8N6CWnil7
         ZxI6zf/oQUuWC296K4f17zH4pYbyn4a+jw6zRowKMqBjTmHEbVZg9IxhlYqlTd3pNwMU
         MznmrJOdGPQOIccjTDzVtWF37FWzo7fpGc2A2tTvDsBNa7uehw9hiUgmvJ760JBBRJcz
         6GgyAYVCDAQtysAE8QuG7yND70zqtPC6xHWG+MBZML4FL+ywDXJu/Rb3U04Rc5TGQCkQ
         t3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525355; x=1792130155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zp7G9mLjsHEHBJvEhOvfosmT6IrpsVXu9tMKZrIiLvQ=;
        b=nnU7OHgtIgZaaUMOyjdfrJZnOA7+X9HDC8hCrax0vExdTn5GXeO0poEdg8HG43vD6E
         jj3ocrJxkeWHYk4a0mdsfDAptveo9b3GxRs/1n6fzsZAA4lRlGPnJPHaANopp7Hf/vjV
         +B5RpO0uQUavJaBgKJ5V3xb4Om0sERbuAqgNacxwQGhtBaQTNgT2umL6zcX5oFsCNPxh
         0h/CFeCGML3B3PBDMX5TU6ZXoUpp3tKLq/WBdkQEe2bZt2rZh8zu6MAc+7OZBZvCE5uS
         bqWg81daYiUdiJBcgZ9yza8YywWUkbKhRkJEgC/B10MSZm8EQV8bUDZheaZJXb8Fldso
         06PA==
X-Forwarded-Encrypted: i=1; AKwUvBynBKLBC/Rl81/pBWFHWKv1J3GYeq3QTxsiS2JnDBxRseJ9ZwYa1UpGtHmHz2nGDYUMFyQKPXbXPFpUZQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/aGTwxsXf0Fr3tpbDHF0neuaQ5Y2FuqNVQedNAtROG5PXamBP
	4Jbxq4IOD5zrDceCrbFqFF0lllqxP+avnqXOwQ1xKmaas1AvCfFpK12Mi/Ywx0Px
X-Gm-Gg: AYBFou2QKZoSLga8NUj0330/qer+DNkd/HtHft90fw+jMO/wIL6j0Le+ukk3yKJY2HW
	KXdFWRz7PvGobMSg+R4+XntabsbF4TdKX1O6AWjnZkHJCV5SQTE8NWdPGjAULqw5JpGizx9Dz9D
	qVtV14/Y9P8so/R4/3nSHCqRPzxS5/HCcE9cnoB2ybnRBERxfe06DLSXRJSS95W32hqLWHozgUv
	UY8Gq4BavNeYLAgZ2jYedCo4cXTLqysmhyR7RNHtCjCUAPazBV5tRJDLc2VMxhvGWQYfjbcNPsz
	t/GlBIWTAO5nIUDSuzhjQubL34vpNyTrixCBwSpPoR9CyFsLxoUcAgfMtcef3YZyTgA437LPRGd
	tWkiw59Q2nIkQ6/c0IdN6E5iNaUbC06zeWY7SwPsbm23kQ55Nd2PN1sp3JNJ+LAXkn71CrvZLSF
	kej1aWV+NRmq/7LEsEJhXxXs+28OeQCW2NRAH4la5zFfj7EzLxQHU/q/vNmKRG6jt25YmESBLam
	5zw3V63jdp3Gw4a2l0Eu2wbrEy6uEZF+QYdozc29XTPyRURkWRPEqcV031DCksLXwF7SG1ozk9C
	bx1ETDEcGNaJ02VZRNhbeAoIeFNcTalfeND+dAXllHqjZFW0JicSU3W5vyAA+iborI/opYHfQtw
	KtF0vgqrAqpZq
X-Received: by 2002:a05:6000:2503:b0:48c:7083:be67 with SMTP id ffacd0b85a97d-48dbace462emr1140675f8f.42.1791525354938;
        Thu, 08 Oct 2026 22:55:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acee65sm1984126f8f.49.2026.10.08.22.55.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 22:55:54 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH] fs: fix ramfs_fs_info leak when rootfs is unmounted
Date: Fri,  9 Oct 2026 07:55:46 +0200
Message-Id: <20261009055546.85279-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When rootfs is a ramfs, for example with root= on the command line, its
superblock carries a struct ramfs_fs_info from ramfs_init_fs_context().
ramfs_kill_sb() frees it, but rootfs_fs_type uses kill_anon_super().

Before commit 576ee5dfd459 ("fs: add immutable rootfs") rootfs could not
be unmounted. Since then prepare_namespace() pivots into the real root
and unmounts rootfs. When the superblock is destroyed, the structure is
leaked. kmemleak on an SH7785LCR board:

  unreferenced object 0x8100a720 (size 32):
    comm "swapper/0", pid 0, jiffies 4294892299
    backtrace (crc c8bfd23b):
      ...
      ramfs_init_fs_context+0x16/0x48
      rootfs_init_fs_context+0x16/0x2c
      alloc_fs_context+0x98/0x114
      fs_context_for_mount+0x16/0x24
      ...

Call ramfs_kill_sb() when rootfs is a ramfs. tmpfs frees its own data
in put_super and keeps kill_anon_super().

Fixes: 576ee5dfd459 ("fs: add immutable rootfs")
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Test: kernels with DEBUG_KMEMLEAK that mount root=/dev/sda themselves,
no initramfs. kmemleak reports the object without the patch and nothing
with it, on

- the custom QEMU model of the SH7785LCR (sh for-next plus unmerged sh
  patches; 32-byte leaked allocation), and
- user-mode Linux (v7.3-rc5, um defconfig; 8-byte leaked allocation).

On the model, rootfstype=ext2,tmpfs makes rootfs a tmpfs. kmemleak
reports nothing there, with or without the patch.

The report only shows up after init reopens /dev/console. The console
that the kernel opens for init is on rootfs and keeps it alive.
---
 init/do_mounts.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 95e0b3a0f711..b088021b1546 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -503,10 +503,18 @@ static int rootfs_init_fs_context(struct fs_context *fc)
 	return ramfs_init_fs_context(fc);
 }
 
+static void rootfs_kill_sb(struct super_block *sb)
+{
+	if (IS_ENABLED(CONFIG_TMPFS) && is_tmpfs)
+		kill_anon_super(sb);
+	else
+		ramfs_kill_sb(sb);
+}
+
 struct file_system_type rootfs_fs_type = {
 	.name		= "rootfs",
 	.init_fs_context = rootfs_init_fs_context,
-	.kill_sb	= kill_anon_super,
+	.kill_sb	= rootfs_kill_sb,
 };
 
 void __init init_rootfs(void)

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.53.0

