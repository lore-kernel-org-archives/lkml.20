Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn [202.108.3.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81800369219
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126921; cv=none; b=CULe3LvHtcRrIOufvh3Gt9oMncAO5MXZXtcloCO7aFSHXZSJZ0i5IL6mhahM68sdgFKu08NaBfDQhPxuV4I3J3vbmV+LKDWcbgXbR97vZ2yAZM4N9xN2PRSedME805s8QlmWkKtJhRrSx44cZPeEY2+U3cVmQ/kzlBY7lnvxEAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126921; c=relaxed/simple;
	bh=DU1WkLY10EMgq57tjMPlLzfqYKq0LHo5YYq35Fu9sF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWCRbPprzV6NnkFBxtOTCpX2TeAeeesDXpJJIzXqza19AXzHzZqSVyC0W1iE+t97hvM2D7pYAhr3wE/Oj120Ze7XRZX1e2ddZkScnmGN9U3j5fKxNZN57IRAEEtogfU/xapQJeF1448eA9javx0F/DG4Ul4U6GVHZGboUcctiQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=SEa+e5oc; arc=none smtp.client-ip=202.108.3.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="SEa+e5oc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789126916;
	bh=euiS91PZudxhiOdyQkJZ+xwdB8hJwgDK72Y1L2jW0NM=;
	h=From:Subject:Date:Message-ID;
	b=SEa+e5ocxnJPdev8MAD5CLBr1J3zHeC+pyhqpqhGretRQ1KfqRamgA4SZCeEc7/GJ
	 QcRVFqO0dvdq63Njt8C5C1qVtMJz4ayM4ru9UrHUYWlV9dr6FU7Az1KYkYQBrUkACV
	 BVv5A79JwguQFtmi2VTR0bHA50TUOHvOBGDEG6u8=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AA3E8D400001FC2; Fri, 11 Sep 2026 19:41:13 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8061736684944
X-SMAIL-UIID: F066ADE229AC4DC7885A7D1769336E84-20260911-194113-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+743079a09058321247d8@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
Date: Fri, 11 Sep 2026 19:41:08 +0800
Message-ID: <20260911114108.855991-1-eadavis@sina.com>
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

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 1caabff9dc91..6d0c766fe801 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1416,6 +1416,9 @@ void jffs2_do_clear_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f)
 	int deleted;
 
 	jffs2_xattr_delete_inode(c, f->inocache);
+	if (!f->inocache && !f->metadata)
+		return;
+
 	mutex_lock(&f->sem);
 	deleted = f->inocache && !f->inocache->pino_nlink;
 
