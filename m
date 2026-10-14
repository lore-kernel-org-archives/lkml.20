Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6565C3B47EE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958199; cv=none; b=VoUFtWLdow+p7OdA1PaaJqk4suSpW471qyKzfh9HHiCnanAyNRy8hxdQ2KcxANTuyCeAQevuRmWV3SyZ1bJnvOIv+2sHrtytxbazfZDvFA7dV2w38J+eDdfeGTJOk2wXguYGUQ6nnRb9nqVd2vn/ALAGpGzTq+Nme719cM+s+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958199; c=relaxed/simple;
	bh=6KbgZ6ZC53ynJIskscr49r/AcWSlPztIjmAQZpZN/1c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AexFlvGJx7/4gLvybaXHVNdiGmzRTF2ESgER8hmKgv6Jq7ew+hOQ5MJJEuHu9roXznC5o4ugniNC8oEnjDsbXm9nh8HcUb1Ar+RwPD6E2a1L5VV9f6u2EBLG2w2qCQ2AMcthsw3pT/KJZdTi7S2RsTLvvnXD+bp5pakSA3aaL0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=kFxwD+jv; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="kFxwD+jv"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HU+Eb4UZtw6L9Gsa9JY/F8hNcQZDUPWTRzMQNp41osI=;
	b=kFxwD+jvBhurmi0BfsXBtIMbWcpgOX2OxN5te0ouEHcjkH6yGw1+zTcwTIvlHRjCpJX/q0mCL
	aVei36jKBKCOVwO+7h8dcGb2wXyGgFvUHzoKKEN46gv8gPPDh2m4whiVAZhO61vkGlBgtI1MwkG
	ytl80vIysMoRrl2JiG29ANA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4j4L8L1c1tzRhQs;
	Wed, 14 Oct 2026 13:57:38 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E2A04056D;
	Wed, 14 Oct 2026 14:09:52 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 14:09:51 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 2/2] ubifs: tnc_delete: Don't update collapsed znodes if memory allocation fails
Date: Wed, 14 Oct 2026 14:02:52 +0800
Message-ID: <20261014060252.3531356-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014060252.3531356-1-chengzhihao1@huawei.com>
References: <20261014060252.3531356-1-chengzhihao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)

A collapsed znode is updated with 'znode->parent = NULL' before calling
insert_old_idx(), if a memory allocation failure happens, there will
exists non-root znode(without parent) in TNC, which leads a null-ptr-def
problem for TNC traversing, the details shown as:

 file: consists of many data nodes, TNC is:
                   znode_A (lv 2)
  	     /                         \
       znode_B (lvl 1)              znode (lv 1)
        /             \                 |
    znode_C(lv 0)...znode(lv 0)     znode (lv 0)
     |   |     |     |       |          |
  ino_1 ino_f dent dn_0 ... dn_i      dn_i+1

     P1
  truncate(file, 0)
   ubifs_setattr
    ubifs_jnl_truncate
     ubifs_tnc_remove_range
      tnc_delete // dn_* are removed
       do-while

  the TNC looks like:
          znode_A (lv 2, parent = NULL)
		|
	  znode_B (lvl 1, parent = znode_A)
		|
	  znode_C (lv 0, parent = znode_B)
	  |     |     |
	ino_1 ino_f dent

  tnc_delete will collapse the tree:
  // while (znode->child_cnt == 1 && znode->level != 0)
   // round 1
   zp = znode_A
   znode_B = get_znode(c, znode_A, 0)
   znode_B->parent = NULL
   znode_B->iip = 0
   insert_old_idx
   c->zroot = znode_B
   kfree(znode_A)
   // round 2
   zp = znode_B
   znode_C = get_znode(c, znode_B, 0)
   znode_C->parent = NULL
   znode_C->iip = 0
   ENOMEM = insert_old_idx
    return
   c->zroot = znode_C // skip

  the TNC looks like:
          znode_B (lv 1, parent = NULL)
		|
	  znode_C (lv 0, parent = NULL)
	  |     |     |
	ino_1 ino_f dent

      P2
  umount
   kill_ubifs_super
    ubifs_put_super
     ubifs_umount
      destroy_journal
       ubifs_tnc_close
        ubifs_destroy_tnc_tree
	 ubifs_destroy_tnc_subtree
	  znode_C = ubifs_tnc_postorder_first
	  if (zn == znode) // false, zn = znode_C, znode = znode_B
	  zn = ubifs_tnc_postorder_next(c, znode_C) // zn = NULL
	  for (n = 0; n < zn->child_cnt; n++) // null-ptr-def !

The root cause is that zroot & znode->parent updating is not atomic,
which could be interrupted by the insert_old_idx() failure, fix it by
making zroot & znode->parent updating together.

Reproducer is https://bugzilla.kernel.org/show_bug.cgi?id=222130.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/tnc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 679afddadf82..c9480d963e4c 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2611,14 +2611,14 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 			znode = dirty_cow_znode(c, zbr);
 			if (IS_ERR(znode))
 				return PTR_ERR(znode);
-			znode->parent = NULL;
-			znode->iip = 0;
 			if (c->zroot.len) {
 				err = insert_old_idx(c, c->zroot.lnum,
 						     c->zroot.offs);
 				if (err)
 					return err;
 			}
+			znode->parent = NULL;
+			znode->iip = 0;
 			c->zroot.lnum = zbr->lnum;
 			c->zroot.offs = zbr->offs;
 			c->zroot.len = zbr->len;
-- 
2.52.0

