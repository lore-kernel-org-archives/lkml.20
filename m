Received: from r3-18.sinamail.sina.com.cn (r3-18.sinamail.sina.com.cn [202.108.3.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD014A2A42
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635711; cv=none; b=mbyyCk+kpb7whrLjv9O6mRdqiFQCaqpeU50or9zeAHHY+GnOP6tCv0Gcu5HtD60ccxTkYfMH3lAcSfb1/SFU9YmbSnCNbMezSuv1eMLkjzk99IM/65yt3he/Joj3dQ9rqBuu/fZgKzY8VIdlEdgzlHh5Yb3k5AVWVKFFbdFsVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635711; c=relaxed/simple;
	bh=eMFfAmWTJtjV3qMHcY9lbqkSOgI/TwKr56yiKasgMpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U23VxWHzLgDrb6jqZKmuvMkvb8zKe1TABeID/uEwTB7D2kHfC73JDjkPcTnswDTHKpnh+dkVjiW+cH9JaWhbeC5M8TuorzelFd9w3ACvqjZM5ZKhclg7H5yz7SsVLVIuoDF77bAlc7dOZLBG3xvyxxtwhgVE6SZoAAeZVazAn48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=tuNPQFSc; arc=none smtp.client-ip=202.108.3.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="tuNPQFSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789635706;
	bh=NcwYxhPcpxAsUj9xa2/K9JyuHTiKOPnpcuy8/K6Jhtk=;
	h=From:Subject:Date:Message-ID;
	b=tuNPQFScIDInS9stMSfGQBcRopNjOeI3RedvXOzLl8wOKGlIvzYyzMpA70eA/YNmy
	 9IIj5Gwb0lP83/tqPioBGa2fqvOTgU5sy+qvpQfKywgoc0rIkFecXlArKMkLSV23iV
	 8r8GuuRoHEfHhFP5fjXlCbz8N7nRGRn7uWXOo4Gs=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AABAC6E00004619; Thu, 17 Sep 2026 17:01:35 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5770544456597
X-SMAIL-UIID: 5A0FE6DDE2FA40869E5835FD91BD883E-20260917-170135-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-use-after-free Read in ecryptfs_destroy_mount_crypt_stat
Date: Thu, 17 Sep 2026 17:01:34 +0800
Message-ID: <20260917090134.1003642-1-eadavis@sina.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 238650ef6c7c

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
