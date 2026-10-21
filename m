Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575654;
	b=v93+5S/POQSILV+LBK0/XOAESelLOGrTJE/eXjr8XCkLa8OWoOhrbRr2KOaEADQ20VAl
	 G94JsDcPS6ztOwa/uu9AbZ8wsWJdo62psO53ZsOqL7n+/VNjcgOCUpBFywGbgr+tGxHsn
	 BNJuSBd89m/5Xq3CqtOlOiLBluPImY0vhV7tBcH4+cykSuIL8tHYvxw386a2dmzKOp25c
	 ENoJWXGmDbm/zo/ONhAItSKOlQHtlUVvErXFtAsk4CCiM7HTVjNIaS4lrhFkihg7+vkY+
	 IEDirX+cdF1pT3uhrHC1W6jBgK6/bxaIcR3Ydg9Oj8hXdCsFKeMiGHcBSoHFdshNb7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575654;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vSwETkh3wkOi+VGFHHaGts/46wLig1NK9Uvkn+ZTxeY=;
	b=ay4NkaXnIMPZszBX/jwIA0t31qO57tGz+kgjDKmhkcp5vIQf9ISJYMJi5IwySKJ+TWYv
	 lk69VOaP0lWZ/9MXbtfBDTkOkVvdMQf5QH2VV2baoyHLne+dJWmRKGGe0jEouGVDkxE2J
	 O+wYhTyUIWYetzDj7V2163yLBEgubDthhrL/Uiu45UGw8Z7Bf90aMaQWhk+EoR9ia25FC
	 whZA6DKPoBtKGt/fLDJAjK+VetJPB3VUMs7tRQExetd5LDVjKhamNO18QLtGt0V8C3qZv
	 Aclj8IN2WEn140USWQmQSzNNaU6csqBWkAgD84bboyplqQWFfsXchjHpUFhbkUTppiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=v5LrxsI6;
	arc=none smtp.remote-ip=202.108.3.22
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn [202.108.3.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B99606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B99606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=v5LrxsI6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792575652;
	bh=vSwETkh3wkOi+VGFHHaGts/46wLig1NK9Uvkn+ZTxeY=;
	h=From:Subject:Date:Message-ID;
	b=v5LrxsI6sydxvmftDEqwzbYHAfsfAE2GtSElV0cR/7kX0Tn3vG1Ltzzoj8DX25m0E
	 BdUaH6oReDrVkU6PPQLu+UizLJmyGVQrOzQ2Khg03xlwWDWjalxZpSCs6xOwMBq59R
	 HZkngk/zfD1S3ZWmaF342Gof97BrqrQp5c2d2cJE=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AD8889600004738; Wed, 21 Oct 2026 17:40:42 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 1257776685464
X-SMAIL-UIID: 986BE175D99045DF8BF9DC36494E31A9-20261021-174042-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+4fae162886e497f72228@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] kernel BUG in create_default_group...
Date: Wed, 21 Oct 2026 17:40:37 +0800
Message-ID: <20261021094037.61096-1-eadavis@sina.com>
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
index eda80c2a2d38..edc5a7419ad9 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -1605,6 +1605,9 @@ static int configfs_dir_open(struct inode *inode, struct file *file)
 	struct configfs_dirent * parent_sd = dentry->d_fsdata;
 	int err;
 
+	if (!configfs_dirent_is_ready(parent_sd))
+		return -EAGAIN;
+
 	inode_lock(d_inode(dentry));
 	/*
 	 * Fake invisibility if dir belongs to a group/default groups hierarchy
