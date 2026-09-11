Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922145D931
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115373; cv=none; b=CuXxkPy1S6AhenRedBd/1rk+HgVasU1Q0xzYy/CqPEuZSbV2RhC+ZKqyn0FnU+mj7tSvrNpwHpifop1ERk5F+PgAO+mh24B3CcF/DMvEWgk380kIRlc0DwarKmAR5gPBlFU6wxcqn4NIXHReOdWmRfT/XOkOYdHGhE+ISo2LuDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115373; c=relaxed/simple;
	bh=2hDBv13iFMZQaOI6n5c7uEnBxP5tE0KEzZ/ppW6TX9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nr1FblzhYsY4Wkwn+2O4hNWNeS6OZsZQBniCAc3zluvgWWEfX5ONq8Fp2T8aF9xPIUd4clOuA4otqrJWxRt3QwbdSKm4AGResrZWUDCtikZdmTI4AqDTJM61Mf1YsI/JbkFjawhYt/h9V48+FtqiUVX/7t8vio2CDdROg5uZJd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=fnwCh3ag; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="fnwCh3ag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789115366;
	bh=MAJTeeg95jDpxhzr0/vgFGLa1flGi7p/2o9kZVzp/M8=;
	h=From:Subject:Date:Message-ID;
	b=fnwCh3agG4whcKI1pDt0ptgwEtYA4s6DKHefj3dIPGOSnVrn/6LcHbSyXBTYbRE1t
	 0pXWhlBioKSGh4cZ1BYYjMbPY/qc35sDJjCCQ6m+XpgPcbTjHtvw472bVvs8so++jJ
	 NhqouxgN0S93IiArf6LOVzEPUdyc7sRPrG+cxpls=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AA3BBB60000314D; Fri, 11 Sep 2026 16:28:40 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7678144456723
X-SMAIL-UIID: 24680F43F93446AFBDB1CC6F47AC873E-20260911-162840-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+743079a09058321247d8@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
Date: Fri, 11 Sep 2026 16:28:38 +0800
Message-ID: <20260911082838.850442-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa351f4.6e6c5f9e.28f11f.003b.GAE@google.com>
References: <6aa351f4.6e6c5f9e.28f11f.003b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 50d05c7c76c9

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 6ada8369a762..59972e03685d 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -256,6 +256,7 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
 	struct jffs2_sb_info *c;
 	struct jffs2_raw_inode latest_node;
 	union jffs2_device_node jdev;
+	unsigned int nofs_flag;
 	struct inode *inode;
 	dev_t rdev = 0;
 	int ret;
@@ -274,7 +275,9 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
 	jffs2_init_inode_info(f);
 	mutex_lock(&f->sem);
 
+	nofs_flag = memalloc_nofs_save();
 	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
+	memalloc_nofs_restore(nofs_flag);
 	if (ret)
 		goto error;
 
