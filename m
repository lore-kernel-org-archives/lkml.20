Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ACD559CB8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082999; cv=none; b=hBLsPwcrzoE5iXzl/5DAJoLkcsTsKfnz18u12zbvurUyMdgGEWP9kmlM65wzRGRgFZ1CD8/zmDdc2IxefD9fEcYp2NYqGKxmb1ZHoXolR4qjq54gEyj7ZW42C+qYjroDhuJuIpcWGNNr+I8ZQJfyywxLTl83A2LCSiZDzx6yLgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082999; c=relaxed/simple;
	bh=4WbZxV4Aknx80aOP97GV1nVAXrD+X49GsJ+s3LXshEA=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=S+88QcKPdGtv30x+nFkBd/tWoZt43FJHbLtgq5oQkZUBApNomIFWEaE8ODQPL3jTkTpl/grAE89uVkr0jUtfZNIguOh03IljQYIrmcDAjtGBVyVUJKFUTcvjs95EzFv5qzliPZlIjvRreMPsAFGvb6lMg/FHe2NbKACEH0xe3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.pku.edu.cn; spf=pass smtp.mailfrom=stu.pku.edu.cn; dkim=pass (1024-bit key) header.d=stu.pku.edu.cn header.i=@stu.pku.edu.cn header.b=aG5rQdD7; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=stu.pku.edu.cn header.i=@stu.pku.edu.cn header.b="aG5rQdD7"
Received: from smtpclient.apple (unknown [IPV6:240e:305:1b9d:c001:85f9:8c92:21c2:aa08])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ebc6db18;
	Tue, 22 Sep 2026 21:16:32 +0800 (GMT+08:00)
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
Subject: [PATCH] 9p: do not store the create fid on special files
Message-Id: <92377346-29E9-46D3-96F5-AABA8A64CD57@stu.pku.edu.cn>
Date: Tue, 22 Sep 2026 21:16:22 +0800
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 linux-kernel@vger.kernel.org
To: v9fs@lists.linux.dev
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-HM-Tid: 0aa0c942c9e803a1kunmda6e7a4493942
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGhoeVktMHkgaS0wZTkkdHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUhLTkFKGUIfQRhLS0pBQ04dQkFDGEJJQUlKGElBGh
	pLQ1lXWRYaDxIVHRRZQVlPS0hVSktJSE5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=aG5rQdD7QfvUAikYaLSHl6XAnZ55kbhgjFcPwR+UiQqchW7SFsJoGm6cWueo0UEVITT5N02mux4u+RHfH/SPzc0NFlVv0+lXtygVAa87Dd+QNGBmPtM9+bNBo5yT+xOQEVpGFVrpT/jQvzNqk+FBJjswHMBfor+IhGWPwipQYL0=; c=relaxed/relaxed; s=default; d=stu.pku.edu.cn; v=1;
	bh=y8hchbK2esqehkjjNjIUoRkxfPth210npqXQCiCPAsg=;
	h=date:mime-version:subject:message-id:from;

v9fs_vfs_atomic_open_dotl() always stores the create fid in
file->private_data after finish_open().  FIFO and device inodes
already have type-specific file_operations that own that field.
Overwriting it with the fid makes later read/write/close treat the
p9_fid as a pipe_inode_info, which corrupts the fid and can use it
after it has been clunked.  The non-dotl atomic_open path does not
assign the fid this way.

Only attach the fid for regular files and directories.  Special
files do not need the create fid; leave it for the existing
p9_fid_put() on the out path so it is clunked before return.

KASAN report, linux-stable 4982d3552a3b:

BUG: KASAN: slab-use-after-free in =
anon_pipe_prefill_and_lock+0x376/0x3f0
Read of size 4 at addr ffff88800ab30538 by task repro/1

Call Trace:
 <TASK>
 anon_pipe_prefill_and_lock+0x376/0x3f0
 anon_pipe_write+0x127/0x1600
 fifo_pipe_write+0x24/0x300
 vfs_write+0x659/0xd00
 ksys_write+0x10f/0x200
 do_syscall_64+0xdd/0x4a0
 </TASK>

Fixes: 30d904947459 ("kill struct opendata")
Signed-off-by: Yuanfu Xie <yuanfuxie@stu.pku.edu.cn>

---
The private_data guard was boot-tested on a 9P2000.L mount: a write
to a FIFO reached a reader again, and regular-file I/O stayed clean.
Without the guard the same write returned success but the reader
saw nothing.  Skipping v9fs_open_fid_add() for special files is so
the unused create fid is clunked by the existing put on the out
path; that part is compile-checked on 4982d3552a3b.

 fs/9p/vfs_inode_dotl.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index 116b29e95f21e..ff5b21e956b12 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -316,16 +316,24 @@ v9fs_vfs_atomic_open_dotl(struct inode *dir, =
struct dentry *dentry,
 	err =3D finish_open(file, dentry, generic_file_open);
 	if (err)
 		goto out;
-	file->private_data =3D ofid;
+	/*
+	 * Special files have type-specific fops that own
+	 * file->private_data.  The create fid is unused
+	 * there: leave it for p9_fid_put() on the out
+	 * path so it is clunked before we return.
+	 */
+	if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)) {
+		file->private_data =3D ofid;
 #ifdef CONFIG_9P_FSCACHE
-	if (v9ses->cache & CACHE_FSCACHE) {
-		struct v9fs_inode *v9inode =3D V9FS_I(inode);
-		fscache_use_cookie(v9fs_inode_cookie(v9inode),
-				   file->f_mode & FMODE_WRITE);
-	}
+		if (v9ses->cache & CACHE_FSCACHE) {
+			struct v9fs_inode *v9inode =3D V9FS_I(inode);
+			fscache_use_cookie(v9fs_inode_cookie(v9inode),
+					   file->f_mode & FMODE_WRITE);
+		}
 #endif
-	v9fs_fid_add_modes(ofid, v9ses->flags, v9ses->cache, flags);
-	v9fs_open_fid_add(inode, &ofid);
+		v9fs_fid_add_modes(ofid, v9ses->flags, v9ses->cache, =
flags);
+		v9fs_open_fid_add(inode, &ofid);
+	}
 	file->f_mode |=3D FMODE_CREATED;
 out:
 	p9_fid_put(dfid);=
