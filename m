Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9A550DA1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082957; cv=none; b=aSrlxWbYduG5sSmGM9KbSFflywpjtH+UtGe+P7N2naEtkSGgI6fGdxIEsLvuDB62R/jNfRLOkI1ACwU8mDmm6AQTAavcCfbWsvlb6x48b+PC+RQox8vm0orEy13aeVwCLTkSV740DwMeuyhC6cz2rC+cb6+d9qEylWQFGuoX83M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082957; c=relaxed/simple;
	bh=+UdaCVRneIGGV5nsh9YAZ+IihSE4daXByCA2mJwAAUI=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=jkjLwhwtFiJYWRL64CRrom4BHtMALkkAK1l2Pypqj5/4G2L02OZwZGBhtRtlIekdVD0QQeARj4urPtT2TOJiH+Oh+FxEwf9TRGKu9feBonWDnHp8Oe3J4q7w3Ixx5inUmZTAob6+9MgnvLMBGOA3TL1iHnIFzK+5U+4vqv0f3Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.pku.edu.cn; spf=pass smtp.mailfrom=stu.pku.edu.cn; dkim=pass (1024-bit key) header.d=stu.pku.edu.cn header.i=@stu.pku.edu.cn header.b=A7xSsiBb; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=stu.pku.edu.cn header.i=@stu.pku.edu.cn header.b="A7xSsiBb"
Received: from smtpclient.apple (unknown [IPV6:240e:305:1b9d:c001:85f9:8c92:21c2:aa08])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ebc6db07;
	Tue, 22 Sep 2026 21:15:47 +0800 (GMT+08:00)
From: Yuanfu Xie <yuanfuxie@stu.pku.edu.cn>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: [PATCH] 9p: fall back to the normal open path for non-regular files
Message-Id: <908FC420-EC1F-46FC-8526-698F646961A8@stu.pku.edu.cn>
Date: Tue, 22 Sep 2026 21:15:36 +0800
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 linux-kernel@vger.kernel.org
To: v9fs@lists.linux.dev
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-HM-Tid: 0aa0c94217a903a1kunmda6e7a44938a7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHxoeVkhKSUpMSRhNGkgfSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUhLTkFKGUIfQRhLS0pBQ04dQkFDGEJJQUlKGElBGh
	pLQ1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=A7xSsiBbgmI7bsgqzkFNHz0OuFQeLugGnHFZRSoq2tT81EYOTzFK46xMLqxZIKwbXprN+lCfRobAEkV5J4hSCeiTm5MAxahoSYrlaDvn92ZGffCwNu3dyDcnYS4MnKDLz2Uo6OYrA3qReTFtq+1enSGbK0uYwuNLy7sZXlU3YR4=; c=relaxed/relaxed; s=default; d=stu.pku.edu.cn; v=1;
	bh=2v4Xd3k5sr46njshCKgMazaLCM9+ouxRU88llcwTTm0=;
	h=date:mime-version:subject:message-id:from;

v9fs_vfs_atomic_open() and v9fs_vfs_atomic_open_dotl() call
finish_open(file, dentry, generic_file_open) regardless of the file
type the server reported for the created dentry.  The supplied
callback replaces f_op->open in do_dentry_open(), so blkdev_open()
never runs for a server-reported device node: an open() with O_CREAT
succeeds with f_op =3D def_blk_fops while f_mapping still points at the
9p inode, because the bdev mapping swap only happens inside
blkdev_open().  The block file methods then derive their block_device
from that inode with I_BDEV(); the loads land at the tail of a
656-byte v9fs_inode_cache object (offsets +624 and +632), which KASAN
reports as slab-out-of-bounds, and the garbage they read is then
dereferenced, so the first read(), write(), ioctl() or close() ends
in a NULL pointer write and a panic.  In the ioctl(BLKGETSIZE64)
variant the value read this way is returned to userspace.

The server controls the file type reported for the create, so a
malicious server can crash the client this way.  KASAN report of the
read() variant, on a build of linux-stable 2709dd5ae32f:

BUG: KASAN: slab-out-of-bounds in blkdev_read_iter+0x3cd/0x440
Read of size 8 at addr ffff88800828ceb0 by task repro/1

Call Trace:
 <TASK>
 dump_stack_lvl+0x7b/0xa0
 print_report+0xd0/0x630
 kasan_report+0xe5/0x120
 blkdev_read_iter+0x3cd/0x440
 vfs_read+0x718/0xa50
 ksys_read+0x10f/0x200
 do_syscall_64+0xdd/0x4a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

The buggy address belongs to the object at ffff88800828cc40
 which belongs to the cache v9fs_inode_cache of size 656
The buggy address is located 624 bytes inside of
 allocated 656-byte region [ffff88800828cc40, ffff88800828ced0)

A plain open() without O_CREAT is not affected: it runs blkdev_open()
and either maps the device correctly or fails with -ENXIO for an rdev
with no registered device.  When the created inode is not a regular
file, clunk the fid the create opened.  The unopened fid is already
on the dentry.  Set FMODE_CREATED and return finish_no_open(file, NULL)
so the VFS keeps its dentry reference and calls the inode's ->open.
Regular files still use finish_open() with generic_file_open.

Fixes: be12af3ef5e6 ("getting rid of 'opened' argument of =
->atomic_open() - part 1")
Signed-off-by: Yuanfu Xie <yuanfuxie@stu.pku.edu.cn>

---
The unopened fid is already on the dentry.  This clunks the fid
opened by the create.  finish_no_open(file, NULL) leaves the VFS
dentry reference alone; FMODE_CREATED makes the caller run vfs_open().

 fs/9p/vfs_inode.c      | 10 ++++++++++
 fs/9p/vfs_inode_dotl.c | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 3829554..d7e678d 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -802,6 +802,16 @@ v9fs_vfs_atomic_open(struct inode *dir, struct =
dentry *dentry,
 	v9fs_invalidate_inode_attr(dir);
 	inode =3D d_inode(dentry);
 	v9inode =3D V9FS_I(inode);
+	if (!S_ISREG(inode->i_mode)) {
+		/*
+		 * Not a regular file.  v9fs_create() already stored the
+		 * unopened fid on the dentry.  Clunk the opened fid =
from
+		 * the create and let the VFS call ->open.
+		 */
+		p9_fid_put(fid);
+		file->f_mode |=3D FMODE_CREATED;
+		return finish_no_open(file, NULL);
+	}
 	err =3D finish_open(file, dentry, generic_file_open);
 	if (unlikely(err)) {
 		p9_fid_put(fid);
diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index 116b29e..1431549 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -312,6 +312,18 @@ v9fs_vfs_atomic_open_dotl(struct inode *dir, struct =
dentry *dentry,
 	v9fs_fid_add(dentry, &fid);
 	d_instantiate(dentry, inode);

+	if (!S_ISREG(inode->i_mode)) {
+		/*
+		 * Not a regular file.  The unopened fid is already on =
the
+		 * dentry.  Clunk the opened create fid and let the VFS =
call
+		 * ->open.
+		 */
+		p9_fid_put(ofid);
+		ofid =3D NULL;
+		file->f_mode |=3D FMODE_CREATED;
+		err =3D finish_no_open(file, NULL);
+		goto out;
+	}
 	/* Since we are opening a file, assign the open fid to the file =
*/
 	err =3D finish_open(file, dentry, generic_file_open);
 	if (err)

