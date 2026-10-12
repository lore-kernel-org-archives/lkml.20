Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7983164BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811293; cv=none; b=axv1SiZ2dO791NIrDd0fkCeeXeJoYFB8UUXd2o0ajKulICCpyzT3WwRsO0I6xQv/msjAbAT1/eIv95dIb/AMNxMr/9cfwY5Zxp48WamWPL7v4D6Us9kQrY3sdtAi1TO48ZTr5m+3ZONWf6Qw6ge5SRseefmgFzJk4LFaxkugNGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811293; c=relaxed/simple;
	bh=NSJbphe7D00V6VsNq0MpqR9yG171dFhzRqBa0FnDYyo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=WJ196ClLo2cWHUgacQglS8QU2EyFGCpuD42QNaE0vig16SOOAaZw+xslkiA4EssvoRmo/Eqk5yLBeVISoIO0EQC+pD8Xq+z3SDd46Qa/ufvQX6S5nc8jMsb9HCdWLC0G1M1OLsI+ZxAH5rrtGo7wiI4Eg2X5IA+3cljr3UMmHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=epVLkHC7; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="epVLkHC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1791811280;
	bh=tHfMjB9wTitmw3WTeZq++IFexcprMDF2yE5QCi0jjxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=epVLkHC7HlE52Gjr2Gw1rqP2Nl+o7f9dO6Pu+at523SgOUC5oxJ0VwRpWDEbnVUhl
	 abeoxCP1tUquuWGc3N8ZG2rkxRjzNX+nFFTa5hzo1HvQoldjpI7qXbz2Vo0kWtsZvf
	 uAsdn15t82LO5INfk18jCpuV4txDNRhOq0FAJ/2U=
Received: from RE0700.barrietech.com ([122.233.58.214])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 50A0E8FD; Mon, 12 Oct 2026 21:20:10 +0800
X-QQ-mid: xmsmtpt1791811210t37a5ncsa
Message-ID: <tencent_4EDD66523CED299DB0C99498B4D8C939A009@qq.com>
X-QQ-XMAILINFO: M/NR0wiIuy702phmobPKm7JW6GBjJE7rjy8JudSBa4zpdcbIV8eBw6wusuER7F
	 kbRemxbv258Q0rHRmq9yjJVe8QOMsxoTSI2PqTiAJZsYeyCySgLShhqdRfNW/Hswcd45pXFuB3we
	 lXKlzbIx8CWsNsVFQ22fBp3O/Usqf3IfEiOgrDhDBBNZClx0H/a4Aexv/v52S6vgh69jSgAW1iTM
	 mvF82hEFq/U1XPXR/KEIpDirBn3ElStl/PsbuZH6pdj0nnwlPP7C466eOrmgY4aKBCkZ/tGS0heH
	 ZEEQcH9v976aRN8UooPXjNCj14pppElTGhic/2oaWTGjTjz2PBGF9lKTn74NxKZEGqq11F3kg241
	 OWBbH2OsmfOZGFErfH1EX0LNLBgv7n/S7AQ3SWGI94Nm1ILpRfFVOEtASdElFbSCTypRvpAcXaG6
	 +dijQrDi/PNOnrDDTND6sWfs+nLIMvlxJlgTam+gqwkpIhljQRh968q9zQWcyU+F/VX/zQiBtPFb
	 86LbqlGx4NXb5Akwb5tk1MureJNz0fDhI9yq1KDgQcZ064itfOiYQ9jlhCPe5Sm1ezCMs9JFFnZZ
	 gelvuNZOsxpztU0eqEf5tK33dnptgrN5xSODBydbqw7CNbNaZfTOwbKgdrfZASQCCpW5yXRp7Pok
	 TuVhaEg0mgsgIwY6FxKBZO3ZRVnQSn871J3qqkh9uD6+lcw/h9K78b1dhO+uj+201Fh9uUeZ7Cs6
	 BqrFUPNe6T7dcU2E6LmlyfFtLDZbYSqVClDXuGI+pF2+DL0hk15jWBU/OHUMvyIS+UV6mNiCsvfc
	 59mEwz6D6yMUc5MyEgk6JQLpr4qbqSMKgKlnJhXnJtmF0SRUJaWxceLvCgE6NQuHUK6AtGnE9dF4
	 idRy8DAv6RpXE+hKo/QxHMO3ngPq6iMUq2zxtQMODZLWisa4C8cLSK5kohCEDpYPiueuHMz2TLXX
	 VvCAB8gi6khToCy1rQeys92aetG1tSdB3CoP4uIK2+QuJsHwMBUZAbKzDUuVXxJe7up4iyQw2ZrO
	 tZFvn2Kl4smeHVPJ+tVEbfn2NWnDPYF/O6rb/tjivJV9up550/AioK1ioggwkjlEdtQZmGtqt/iF
	 DXVINxIO9htiWDAm6hRC46Gdn7iZ1KesOUGKlP6BOJyJDdAY1jKekBlykGpY2YI2hqxavC
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: zhoumin <teczm@foxmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	teczm@foxmail.com
Subject: [PATCH v2] fat: roll back the new entry when create/mkdir fails to build the inode
Date: Mon, 12 Oct 2026 21:20:06 +0800
X-OQ-MSGID: <20261012132006.763156-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87jynnff0g.fsf@mail.parknet.co.jp>
References: <87jynnff0g.fsf@mail.parknet.co.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfat_create(), vfat_mkdir(), msdos_create() and msdos_mkdir() add the
on-disk entry before calling fat_build_inode() to set up the VFS
inode.  If fat_build_inode() fails, the error is returned but the
entry stays on disk and the file or directory shows up after remount.

Remove the entry in that case.  For mkdir, also free the directory
cluster and decrement the parent's link count.

Signed-off-by: zhoumin <teczm@foxmail.com>
---
Changes since v1:
 - Only undo the parent nlink and free the cluster when
   fat_remove_entries() succeeds.
 - Use a block scoped err2.
 - Reuse out_free instead of an open coded fat_free_clusters().

 fs/fat/namei_msdos.c | 22 ++++++++++++++++++----
 fs/fat/namei_vfat.c  | 22 ++++++++++++++++++----
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index d46d1a3851f2..7f2c68149efd 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -292,11 +292,17 @@ static int msdos_create(struct mnt_idmap *idmap, struct inode *dir,
 	if (err)
 		goto out;
 	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
-	brelse(sinfo.bh);
 	if (IS_ERR(inode)) {
+		int err2;
+
 		err = PTR_ERR(inode);
+		err2 = fat_remove_entries(dir, &sinfo);
+		if (err2)
+			fat_msg(sb, KERN_WARNING,
+				"failed to roll back new entry (%d)", err2);
 		goto out;
 	}
+	brelse(sinfo.bh);
 	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 
@@ -381,12 +387,20 @@ static struct dentry *msdos_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	inc_nlink(dir);
 
 	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
-	brelse(sinfo.bh);
 	if (IS_ERR(inode)) {
+		int err2;
+
 		err = PTR_ERR(inode);
-		/* the directory was completed, just return a error */
-		goto out;
+		err2 = fat_remove_entries(dir, &sinfo);
+		if (err2) {
+			fat_msg(sb, KERN_WARNING,
+				"failed to roll back new entry (%d)", err2);
+			goto out;
+		}
+		drop_nlink(dir);
+		goto out_free;
 	}
+	brelse(sinfo.bh);
 	set_nlink(inode, 2);
 	fat_truncate_time(inode, &ts, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
 	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index da3e89c0b16a..b366e0163272 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -771,11 +771,17 @@ static int vfat_create(struct mnt_idmap *idmap, struct inode *dir,
 	inode_inc_iversion(dir);
 
 	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
-	brelse(sinfo.bh);
 	if (IS_ERR(inode)) {
+		int err2;
+
 		err = PTR_ERR(inode);
+		err2 = fat_remove_entries(dir, &sinfo);
+		if (err2)
+			fat_msg(sb, KERN_WARNING,
+				"failed to roll back new entry (%d)", err2);
 		goto out;
 	}
+	brelse(sinfo.bh);
 	inode_inc_iversion(inode);
 
 	d_instantiate(dentry, inode);
@@ -870,12 +876,20 @@ static struct dentry *vfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	inc_nlink(dir);
 
 	inode = fat_build_inode(sb, sinfo.de, sinfo.i_pos);
-	brelse(sinfo.bh);
 	if (IS_ERR(inode)) {
+		int err2;
+
 		err = PTR_ERR(inode);
-		/* the directory was completed, just return a error */
-		goto out;
+		err2 = fat_remove_entries(dir, &sinfo);
+		if (err2) {
+			fat_msg(sb, KERN_WARNING,
+				"failed to roll back new entry (%d)", err2);
+			goto out;
+		}
+		drop_nlink(dir);
+		goto out_free;
 	}
+	brelse(sinfo.bh);
 	inode_inc_iversion(inode);
 	set_nlink(inode, 2);
 
-- 
2.53.0

