Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560668;
	b=2BW3D+CMGp6yIDTFJ6nSCqiZoYmYTXcdjET7etfNayBww6dHmERZggTF+8+tIqe/GHx8
	 i97Yx/Mpwnmo77vNAKrz9X/HpKnPrvqQNFs7BbDbL0KiFIzrLnMUQteKNQ148hQs2mbZ2
	 ZmO5QTiynxlhxvaxZmMQmyhNU3qT8YGeOt7g5fOnzdN7lj6hghZ5mNOrQOwOI5LktLAk3
	 peRA1o5hDczbpzxBdb/0KVvLgbT9YMNAaXxOxcygNZESiuZl1RH57ilrh/Ba4vO9AFvTF
	 pcMxlgyM0GayIGEux1zTt+8cIhVOSzt8IzW2wbfpSGwx+BZkxUFv80q5iLtxCBgWd5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560668;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ky2NpRR2wA3rI5JofH0oPOu2Ap9UfVO+8mvTU5ilZnc=;
	b=Ee5ENCEY/tXCjl8tHdi9lBWgwCjRhVEJc5aQ/f3hrZha97UVnJXkTFgyTYBScuytpGix
	 thUiRo0fabA3F8PC4etukxUHgRJyqQBePsKgDj0W0O7VI/3h7t6zeFKQJEibfjECfF+Tm
	 blfGhkVBTtOUpOrjo6B3sOiCe0b03xCKRvZlzIvDGnGkUWQm4iVyG8aa8Jk/a0p5IkF3M
	 gqF2XTfGfbVywohxB0QhN92ywPAhWtFYORc9qOPT8vBIb+PXscu2weoAWL3hZjYXKmbYs
	 ktPfhW90bZX04sAOupyD176xbaqQ8j3qyeVcyzzwybFZZVaVvJ6Ypbnt5jpo5aLVEQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=xej6Vdz6;
	arc=none smtp.remote-ip=202.108.3.167
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn [202.108.3.167])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712C606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5712C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=xej6Vdz6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792560665;
	bh=ky2NpRR2wA3rI5JofH0oPOu2Ap9UfVO+8mvTU5ilZnc=;
	h=From:Subject:Date:Message-ID;
	b=xej6Vdz6x7Ot3NyND7ikFS47e8wZNqSMhcO4dcHgCoDBZ4IcVZlhjgHPwG2482bKW
	 MKMIPEhAEQcUF04YXeF2JFwvYEBk4CZ2M8NWeO1kd5qIFt/AL7l4VQF3/truT/DkiJ
	 8YjojnxpdN+YzagjTHocEGILZBRT960Dy+I5L2mQ=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AD84E0D00006B73; Wed, 21 Oct 2026 13:30:56 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8399316685400
X-SMAIL-UIID: 094CBD41D6DC47BD8ACA3DD8161A78B9-20261021-133056-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+4fae162886e497f72228@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] kernel BUG in create_default_group...
Date: Wed, 21 Oct 2026 13:30:53 +0800
Message-ID: <20261021053053.50220-1-eadavis@sina.com>
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
index eda80c2a2d38..45a955b8ab36 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -313,7 +313,6 @@ static int configfs_create_dir(struct config_item *item, struct dentry *dentry,
 		goto out_remove;
 
 	inode->i_op = &configfs_dir_inode_operations;
-	inode->i_fop = &configfs_dir_operations;
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
 	inc_nlink(inode);
 	d_make_persistent(dentry, inode);
@@ -930,6 +929,10 @@ static int configfs_attach_group(struct config_item *item,
 		inode_unlock(d_inode(dentry));
 		if (ret)
 			d_delete(dentry);
+		else {
+			struct inode *inode = d_inode(dentry);
+			inode->i_fop = &configfs_dir_operations;
+		}
 	}
 
 	return ret;
@@ -1430,8 +1433,13 @@ static struct dentry *configfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 
 	if (group)
 		ret = configfs_attach_group(item, dentry, frag);
-	else
+	else {
 		ret = configfs_attach_item(item, dentry, frag);
+		if (!ret) {
+			struct inode *inode = d_inode(dentry);
+			inode->i_fop = &configfs_dir_operations;
+		}
+	}
 
 	spin_lock(&configfs_dirent_lock);
 	sd->s_type &= ~CONFIGFS_USET_IN_MKDIR;
