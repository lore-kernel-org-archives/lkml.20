Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.74.67.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676715;
	b=R1JT0d92pBBnOprwbUMqBIvk0rsoLO2gEDcizH3hGjn0o24OgmTfOL0doN7AoiJVp1oz
	 8fbsHGvWpySpg8M4S1VWNVkHEFZVoHzro8Uw3/daobLhfBtgL+7PQhY4PINFn2m33hUYW
	 v5Jec3L/h3DPnzICFNorLVHyFjrnekwDCqWmIQCaBJYc7UBUgKefpzM3Fkd40+HmV+/YY
	 lp7uTuFbeq0zw+pL1SuU06lPB2m7LYoULQIceB7bGROo6OxR0lu+KkSVRjvRXiyP936ZP
	 M0Wj9/IT0bYCkQ/UtPWqYzHFguoutKSID4IYIyRAQx398aTH7QuX+FYnVh4AEE12b+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676715;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=dQII75vn1LaGbr8YWromgMAKQRt5pbZH3aHUZ0ksAjU=;
	b=DhACQpLJMYed8pnD8toO4WGxSeB71PtvGFpJPUip9FlG0nL5J7n7AH34Shg4VsoAn8X7
	 EsIB2M99lhdeOraHT/xG06FPYMStdmGEKDJwJod/zfhTThBjZQ7ugwbNfcDoGXqpDKBBS
	 nM4j4czbPzJ40QD23Ve7tTMNTx1oWOIwlnzECe536rpLySTLzgS4aEo/GjkTkuweOSGbY
	 VKA4oxNn9Ae/Tl/YGgrezPTS2BmW4tCtZ84oHw4Y+NQwUNxnY36AgiIpWOd/p5JQ4Rh0V
	 ra+YdyUaESjf00UmktzkZ5i3WgvKPLu1wqK1d63kvX6n9etQuBskkeDPsNuI9eHl5bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=poczta.fm;
	spf=pass smtp.mailfrom=poczta.fm;
	dkim=pass header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=Q18MlgLH;
	arc=none smtp.remote-ip=217.74.67.49
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5AD60A5BFE
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5AD60A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=poczta.fm header.i=@poczta.fm header.a=rsa-sha256 header.s=dk header.b=Q18MlgLH
Received: from localhost (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Thu, 22 Oct 2026 15:45:04 +0200 (CEST)
From: Slawomir Stepien <sst@poczta.fm>
To: leitao@debian.org,
	a.hindborg@kernel.org,
	k.opasiak@samsung.com,
	nab@linux-iscsi.org
Cc: linux-kernel@vger.kernel.org,
	Slawomir Stepien <sst@poczta.fm>,
	syzbot+b3410eb576b568216ae5@syzkaller.appspotmail.com
Subject: [PATCH 2/2] configfs: give the root inode its own lockdep class
Date: Thu, 22 Oct 2026 15:44:43 +0200
Message-ID: <20261022134443.1122318-2-sst@poczta.fm>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022134443.1122318-1-sst@poczta.fm>
References: <20261022134443.1122318-1-sst@poczta.fm>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1792676705; bh=dQII75vn1LaGbr8YWromgMAKQRt5pbZH3aHUZ0ksAjU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Q18MlgLHe0uoxhuKopLgqAm28TUfhOI+LRBQV7Kirm1adYEZ/nHmG0a8yQ2mcvpvl
	 qiydavXgb9qQeiaDRsSGXuvaW6kyehtSYf/KoMzYWqAclwUSG50qXCVY4sXqEBWmBu
	 uIvkRZMMr1gpF5Lu2SMupKxfZ160w96HUjcA6iso=

configfs_depend_item_unlocked() is meant to be called from configfs
callbacks, where VFS already holds directory inode locks and configfs
holds the subsystem's su_mutex. When the target item lives in another
subsystem, it additionally locks the configfs root inode so that the
target subsystem cannot be unregistered underneath it.

The root inode shares the &sb->s_type->i_mutex_key lockdep class with
every user-created configfs directory, so lockdep cannot tell it apart
from the directory inode locks taken by mkdir, rmdir and symlink. Any
lock held by the depend caller therefore looks like it nests both
inside and outside "the" configfs inode lock. f_tcm's usbg_make_tpg(),
which depends on a gadget function item from the target subsystem's
mkdir callback, triggers this in two ways:

  target su_mutex -> root inode (depend), while
  rmdir under target/: directory inode -> target su_mutex

  tpg_instances_lock -> root inode (depend), while
  mkdir functions/tcm.N: directory inode -> gadget su_mutex ->
    func_lock -> tpg_instances_lock (tcm_alloc_inst())

Neither is a real deadlock, because no holder of the root inode lock
waits for su_mutex, tpg_instances_lock or a directory inode lock held
by a depend caller:

 - configfs_depend_item() and configfs_depend_item_unlocked() only look
   up the subsystem and scan the tree under configfs_dirent_lock, a
   spinlock.
 - Lookup and readdir in the configfs root only take
   configfs_dirent_lock. mkdir and symlink in the root fail with
   -EPERM before any other lock is taken, and configfs_rmdir() of a
   subsystem directory never gets as far as taking su_mutex.
 - configfs_register_subsystem() only locks the inodes of the new
   subsystem directory it is creating, which nobody else can hold yet.
 - configfs_unregister_subsystem() does wait for the subsystem
   directory's inode lock, but it only runs from the subsystem module's
   exit path. Every mkdir and rmdir in that subsystem holds a reference
   on the module, so none of them can be in progress at that point.

Put the root inode's i_rwsem into its own lock class so that lockdep
stops aliasing it with ordinary directory inodes. Splitting a class
cannot create new lockdep cycles, and real dependencies on the root
inode are still tracked under the new class. This is an annotation
only: without CONFIG_LOCKDEP the key is empty and lockdep_set_class()
compiles away.

Fixes: d79d75b5c518 ("fs: configfs: Add unlocked version of configfs_depend_item()")
Reported-by: syzbot+b3410eb576b568216ae5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b3410eb576b568216ae5
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 fs/configfs/mount.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index d8cac1cbf3bd..f5e9b98c1315 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -15,11 +15,19 @@
 #include <linux/fs_context.h>
 #include <linux/pagemap.h>
 #include <linux/init.h>
+#include <linux/lockdep.h>
 #include <linux/slab.h>
 
 #include <linux/configfs.h>
 #include "configfs_internal.h"
 
+/*
+ * configfs_depend_item_unlocked() locks the root inode while the caller holds
+ * su_mutex and other locks from a configfs callback; nothing taken under the
+ * root inode lock depends on those, so keep it out of the directory class.
+ */
+static struct lock_class_key configfs_root_inode_class;
+
 static struct vfsmount *configfs_mount = NULL;
 struct kmem_cache *configfs_dir_cachep;
 static int configfs_mnt_count = 0;
@@ -74,6 +82,7 @@ static int configfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (inode) {
 		inode->i_op = &configfs_root_inode_operations;
 		inode->i_fop = &configfs_dir_operations;
+		lockdep_set_class(&inode->i_rwsem, &configfs_root_inode_class);
 		/* directory inodes start off with i_nlink == 2 (for "." entry) */
 		inc_nlink(inode);
 	} else {
-- 
2.56.0

