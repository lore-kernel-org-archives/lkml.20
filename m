Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662462;
	b=ztcut1D2PtOveE7XV4aZjNUrXKKgKjxb+H7tyVU49FkVfF5q0PhZS/of2KVBwA+0+UAR
	 C1bRrrcHS1rvD2csErYvE4ud46nteaCVVrxG9s64F7q+Tauy02s/fMrySIqF0AT+F7beL
	 +UrOiY1n3vlYprEFkLDn9D3zjMHTsTo6Zfg46WFSlWCPbxDc7O7wLk4YnjlLj+xfRkh51
	 L1d/qxsQUhZfSRQPOJV3sDkea92njpAPYzGM3oV7ajUGKrfPezW/s0FUn0mRUF5UxbVY5
	 IdL8vFFW5M6qw011UaDUuxU/Mobr393GjmeZbSgD8dmVMKATzkeKKUPxXDnBpgluQ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662462;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Y5oGHAGTxprDGXgoMex5C9TxEtgcDLlwr7sbjVK09k8=;
	b=xZ8/niHQyUGO0RP8tvIccKHNDZCXLJdaKs1qMJsGfiDkH4gHD//DLvCx7OYBUeEOmWlw
	 9cwzQoMzX9/oDWfUVVbkSz4QmldHvGHjEIgV63z5yWnHId5WAqg8OcAETJy9oWG9iQqa3
	 DRL2Lh0+tfwZ6ftntQIiudvPosyuJUuCtCinsR3kn4LRqX65B8jjRLAoBhyNL2W0xYSe2
	 mrYVyOXFQ4Uib5iK3xuoIMgRyYSidYuP3OAk54mxg5KHqPtOHOeNbDCEbMoNhKaFSVFAr
	 1knyev/h3rOceLhiD6nRRgnA2qxDa5PJo1QiG9zrRPhYS5SBabEzwLjRG+DNdugiskg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=nol3rY6g;
	arc=none smtp.remote-ip=202.108.3.24
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE9606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDE9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=nol3rY6g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792662460;
	bh=Y5oGHAGTxprDGXgoMex5C9TxEtgcDLlwr7sbjVK09k8=;
	h=From:Subject:Date:Message-ID;
	b=nol3rY6gbDIUNf5j3vZRsVPFuPSy5JnSITmJnPocfZuhru0kYTuMd0Kal1e8YTuFO
	 /7i77Z2tXnT1bi4tCPe1FWwqPafH8phjpPKtTlqhAVOT/E/6t/Tyn5bGSFrWT2AHex
	 ykfKbieArcmIvlBfRkySViv0Xj8IO93TjFt2AN6U=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD9DBB100000217; Thu, 22 Oct 2026 17:47:31 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6866546816076
X-SMAIL-UIID: AF1A6D85FA254DF2ADBFD9477B29945F-20261022-174731-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+4fae162886e497f72228@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] kernel BUG in create_default_group...
Date: Thu, 22 Oct 2026 17:47:28 +0800
Message-ID: <20261022094729.104768-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ad65cac.5a04d468.191e0a.001c.GAE@google.com>
References: <6ad65cac.5a04d468.191e0a.001c.GAE@google.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 58161ead29e5

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index eda80c2a2d38..d8e74abe3485 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -65,8 +65,24 @@ static void configfs_d_iput(struct dentry * dentry,
 	iput(inode);
 }
 
+static int configfs_d_revalidate(struct inode *dir, const struct qstr *name,
+			 struct dentry *dentry, unsigned int flags)
+{
+	struct inode *inode = d_inode(dentry);
+	struct configfs_dirent * parent_sd = dentry->d_fsdata;
+
+	if (!inode)
+		return -ECHILD;
+
+	if (!configfs_dirent_is_ready(parent_sd))
+		return -ECHILD;
+
+	return 1;
+}
+
 const struct dentry_operations configfs_dentry_ops = {
 	.d_iput		= configfs_d_iput,
+	.d_revalidate   = configfs_d_revalidate,
 };
 
 #ifdef CONFIG_LOCKDEP
