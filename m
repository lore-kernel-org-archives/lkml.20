Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn [202.108.3.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94585349CFF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416431; cv=none; b=q5mzjPp5w9apKpVg9k+XI9gG+lwsvEAAX+QH8hEeQg4zIWwTHF8VG/RrHgI+DnPJ2bif0EdwZ+MESpXfSeE6x6nFD4OwdBLtqolQzF1eUwAAv6lv0ym5Hq5g9pI9cl7DZDdBrydYXH9yWSSpRxeGqg6sBZw5iAcPh4azgTgZrgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416431; c=relaxed/simple;
	bh=LqSxqYiLmJzBjhWRcMK/6K6Tt2nLJpYQHOsAVTQAKbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMzYef/2rcR++XbVSsOCCNTq0Y8x12mjB9a0VqogRrBV1DEo9LNAgfecHgRFGxYyPhx733LKWvE7G/mdflE+fjYqonQtYNL6IZEU2P2W/W9csC1Wp4QnPmgISlxXorlcvaz8vNaUhT9/zxuzkq6InX7x0usQ/qc54iWgpFKqzAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=maKuZCZa; arc=none smtp.client-ip=202.108.3.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="maKuZCZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788416426;
	bh=15IEfIkJpEjNUZ/friIdMOu0wzTjvH9fZNptG2yvhdk=;
	h=From:Subject:Date:Message-ID;
	b=maKuZCZa8+VWS/NMvanYSERwgc1f5AnxVzILRBunYTmfyoxTHcFTbazJqqzDZzx7c
	 /pry/KMbUXytS7QV9LmBMA2hv/GErVDX2LlcJDyeOTUUpaTL6ro2PAiQtT3mZ5/1sQ
	 AMjwP0vENFg0NMJisSsg9RW8/LM3VxPjJMzpK9LE=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6A990F6500001906; Thu, 3 Sep 2026 14:10:47 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6466586685127
X-SMAIL-UIID: F91EA7994B97459FA1732ADE8B3D34D6-20260903-141047-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+df1db6e034b3953e19f5@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [autofs?] memory leak in autofs_new_ino
Date: Thu,  3 Sep 2026 14:10:45 +0800
Message-ID: <20260903061045.525053-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a984fda.27a413cd.1e878c.000a.GAE@google.com>
References: <6a984fda.27a413cd.1e878c.000a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 8d3ae59288f1

diff --git a/fs/autofs/inode.c b/fs/autofs/inode.c
index c1e210cec436..6b15a3717ba7 100644
--- a/fs/autofs/inode.c
+++ b/fs/autofs/inode.c
@@ -323,8 +323,10 @@ static int autofs_fill_super(struct super_block *s, struct fs_context *fc)
 		return -ENOMEM;
 
 	root_inode = autofs_get_inode(s, S_IFDIR | 0755);
-	if (!root_inode)
+	if (!root_inode) {
+		autofs_free_ino(ino);
 		return -ENOMEM;
+	}
 
 	root_inode->i_uid = ctx->uid;
 	root_inode->i_gid = ctx->gid;
