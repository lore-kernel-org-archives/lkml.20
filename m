Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89949345ED3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691723; cv=none; b=qF/MffBzCQA101uyjloctQs3gkf23ItHFG8RX8p0csEZkcl43FD9bEOBEep3CIXwcg3C+u8je8dRTnNZOTv4gGqFXb7hahIiocTaAvRCjt4GZNsbIJeYZb3xckJVa7mD7dnkZgYj5OCINCi8Z2cDPVHCrsq6dBhfinMebTDL77s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691723; c=relaxed/simple;
	bh=pgl4zPu17dNeVSrPTqGsrsI4dsZMbTcOEDJB1qLJ924=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptwouIbz0W6+offUs8VhKNLjIRasZRrp268fUZAoAF6kjlIBBbOJyXNaO15QDYO4WbSNXV2X8P9IpS0tcWOGDbjpH0V8Nlg+m+D80OQWZCAfz2rQaYjJ2FkFqzIRUPafREtRa5wf4wKHGcOx+PdE52n1bHaDgIkklopwGSMSWrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=MkKsbD1+; arc=none smtp.client-ip=202.108.3.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="MkKsbD1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789691718;
	bh=QdlXiMEiU+ZLTnRv4KzQNOCoSHotN5s5Q2Ca6EdqQjA=;
	h=From:Subject:Date:Message-ID;
	b=MkKsbD1+7ba8GswrAXkKPG4EMyS6xiaNZu2r5Zq1z6tYD8eIV6cB5MnY3M89sR4r0
	 2P0lh/4vLnealT6tCrXrSRxUtss8pBXy1i9wWefRi796M2yxJ+PEx/X9mkLlKaw7x4
	 8jOSzqcp/hxaiunCxsngWH+vs+ttJ1KV4XvxWOx0=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AAC874000006840; Fri, 18 Sep 2026 08:35:14 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 1668494456756
X-SMAIL-UIID: 8BE20AB9AA0A4D048630C0A29C1B10CC-20260918-083514-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	eadavis@sina.com
Subject: [PATCH] ecryptfs: reject destroy mount crypt stat if sb's active refer is 1
Date: Fri, 18 Sep 2026 08:35:12 +0800
Message-ID: <20260918003512.1027861-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aab8055.71f81b7d.278072.0015.GAE@google.com>
References: <6aab8055.71f81b7d.278072.0015.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sget_fc() is executed within ecryptfs_get_tree(), the active reference
count of the superblock is not incremented (e.g., via grab_super()).

A fault injection [0] causes super_setup_bdi() to fail and return -ENOMEM,
triggering a jump to the out1 label in ecryptfs_get_tree(). At this point,
the superblock's active reference count remains at its initial value of 1,
it causing deactivate_locked_super() to free the superblock and the sbi,
potentially hitting uaf [1].

Destroy mount crypt stat should only be performed when the superblock's
active reference count is greater than 1.

[0]
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 0
Call Trace:
 security_sb_alloc+0x25/0x240
 sget_fc+0x3ca/0x1f20
 ecryptfs_get_tree+0x615/0x15b0
 vfs_get_tree+0x92/0x320
 path_mount+0x7d0/0x24c0

[1]
BUG: KASAN: slab-use-after-free in ecryptfs_destroy_mount_crypt_stat+0x28f/0x360 fs/ecryptfs/crypto.c:137
Read of size 4 at addr ffff88802b378610 by task syz.0.20/5927
Call Trace:
 ecryptfs_destroy_mount_crypt_stat+0x28f/0x360 fs/ecryptfs/crypto.c:137
 ecryptfs_get_tree+0x10b6/0x15b0 fs/ecryptfs/main.c:566
 vfs_get_tree+0x92/0x320 fs/super.c:1933
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3772 [inline]
 do_new_mount fs/namespace.c:3848 [inline]

Allocated by task 5927:
 ecryptfs_init_fs_context+0x6b/0x200 fs/ecryptfs/main.c:617
 alloc_fs_context+0x60c/0xf40 fs/fs_context.c:295
 do_new_mount fs/namespace.c:3828 [inline]

Freed by task 5927:
 ecryptfs_kill_block_super+0x81/0xa0 fs/ecryptfs/main.c:586
 deactivate_locked_super+0xbd/0x140 fs/super.c:589
 ecryptfs_get_tree+0x10e9/0x15b0 fs/ecryptfs/main.c:563
 vfs_get_tree+0x92/0x320 fs/super.c:1933
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3772 [inline]
 do_new_mount fs/namespace.c:3848 [inline]
 
Fixes: 2ccde7c631f9 ("Clean ecryptfs ->get_sb() up")
Reported-by: syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=baa24e4b7e349e388442
Tested-by: syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 fs/ecryptfs/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 5f37cddb956f..6b82c077c0d6 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -441,7 +441,7 @@ static int ecryptfs_get_tree(struct fs_context *fc)
 	const char *err = "Getting sb failed";
 	struct inode *inode;
 	struct path path;
-	int rc;
+	int rc, active;
 
 	if (!fc->source) {
 		rc = -EINVAL;
@@ -468,6 +468,7 @@ static int ecryptfs_get_tree(struct fs_context *fc)
 		goto out;
 	}
 
+	active = atomic_read(&s->s_active);
 	rc = super_setup_bdi(s);
 	if (rc)
 		goto out1;
@@ -562,7 +563,7 @@ static int ecryptfs_get_tree(struct fs_context *fc)
 out1:
 	deactivate_locked_super(s);
 out:
-	if (sbi)
+	if (sbi && active > 1)
 		ecryptfs_destroy_mount_crypt_stat(&sbi->mount_crypt_stat);
 
 	printk(KERN_ERR "%s; rc = [%d]\n", err, rc);
-- 
2.43.0

