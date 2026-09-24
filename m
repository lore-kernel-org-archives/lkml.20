Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A742EEB7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240516; cv=none; b=iewxg8T/Rv3pmbto2lal2+CB4EcXyeoLjyCobAPbf3ZyY2BLy772n+FG8iFNbWfiZnsEuTiPuHPXnxJzV6AZxd56cZ4ms6qP0Kok5+CBVFO7n6ndG9qDJ6aaymbD7gFaNyq4XfgULuVs8etGslhmgmMFX8Y71YQZMgBWpdI4x/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240516; c=relaxed/simple;
	bh=nlEcWPrX1SR8a4NjnBkTRcdgsv/PhhC7lVxaC6KPQsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xis3qa7BrmTbSVpfc2D6wS0abjlLBUB5pg9PFNG7qahwWLJN37Y8KGcNBOTd5SkBJMj+89JwHaXZN7y4qmieCVcoReWIQ2zyWrxLMAL55nTkxky0bB16X6YYt0pk9v8QyT7rX3LEn3dve5u5dOI1hiZIxf5b6cR1UXIkJehKLl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mMkr35rG; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mMkr35rG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Rh
	XZkhWFBAftr/JZYjGl3TJHEvx++2EVZdgYgNiY64o=; b=mMkr35rGrpyQwPb3uS
	LSh02gkcXnNN9ofWSPdCIVT7c+mdO2zpHBhEmdJ8ZgsnAYBzIyR66SGs0pRSpAUl
	aG5XQrgsIXGd7zYE9KXEv7p8VORgyQYFc1Fh0/qno6MTBYVCp4cBdXMB4tu6ueXF
	AvRHcaGLXzufcSebAZGuOGEbU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3H73Q5rRqL6EhAg--.34883S5;
	Thu, 24 Sep 2026 17:01:13 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 3/6] ntfs: report inode metadata errors to fsnotify
Date: Thu, 24 Sep 2026 17:00:59 +0800
Message-ID: <20260924090102.2865942-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924090102.2865942-1-liubaolin12138@163.com>
References: <20260924090102.2865942-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H73Q5rRqL6EhAg--.34883S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWrGF1DurW8JrykJFy3XFb_yoW5Ar1xpF
	93G3s3t34DtFy2gwn2vrWYv34akF1xG3y7uryrG3W7X3Z8tr1vqF40yF1I9FyFkr95K3yY
	qw1jkrWUur4UArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jWJPiUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hm3gmq05tkM5wAA3M

From: Baolin Liu <liubaolin@kylinos.cn>

Inode initialization, writeback and LogFile failures currently mark the
volume as having errors without notifying filesystem health monitors.

Report these failures against the affected VFS inode, using the base
inode for attribute and index inodes. Preserve the existing treatment of
allocation failures, unsupported formats and interrupted operations.
Do not propagate reporting state between inode and attribute operations;
fanotify can merge queued error events.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/inode.c   | 12 ++++++++----
 fs/ntfs/logfile.c |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 9583b2c6c7a2..591aab2850be 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -1257,7 +1257,7 @@ static int ntfs_read_locked_inode(struct inode *vi)
 		ntfs_error(vol->sb,
 			"Failed with error code %i.  Marking corrupt inode 0x%llx as bad.  Run chkdsk.",
 			err, ni->mft_no);
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(vi, err);
 	}
 	return err;
 }
@@ -1486,7 +1486,7 @@ static int ntfs_read_locked_attr_inode(struct inode *base_vi, struct inode *vi)
 			base_ni->mft_no);
 	if (err != -ENOENT && err != -ENOMEM &&
 	    err != -EINTR && err != -ERESTARTSYS)
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(base_vi, err);
 	return err;
 }
 
@@ -1741,7 +1741,7 @@ static int ntfs_read_locked_index_inode(struct inode *base_vi, struct inode *vi)
 			err, ni->mft_no, ni->name_len);
 	if (err != -EOPNOTSUPP && err != -ENOMEM &&
 	    err != -EINTR && err != -ERESTARTSYS)
-		NVolSetErrors(vol);
+		ntfs_report_file_metadata_error(base_vi, err);
 	return err;
 }
 
@@ -2898,7 +2898,10 @@ int __ntfs_write_inode(struct inode *vi, int sync)
 		mark_inode_dirty(vi);
 	else {
 		ntfs_error(vi->i_sb, "Failed (error %i):  Run chkdsk.", -err);
-		NVolSetErrors(ni->vol);
+		if (err != -EINTR && err != -ERESTARTSYS)
+			ntfs_report_file_metadata_error(vi, err);
+		else
+			NVolSetErrors(ni->vol);
 	}
 	if (need_iput)
 		iput(vi);
@@ -2967,6 +2970,7 @@ static struct ntfs_inode *ntfs_extent_inode_open(struct ntfs_inode *base_ni,
 			    seq_no != le16_to_cpu(ni_mrec->sequence_number)) {
 				ntfs_error(sb, "Found stale extent mft reference mft=%llu",
 						ni->mft_no);
+				ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
 				unmap_mft_record(ni);
 				return ERR_PTR(-EIO);
 			}
diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index 1404664dacc0..6897faf849c1 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -768,7 +768,7 @@ bool ntfs_empty_logfile(struct inode *log_vi)
 rl_err:
 	ntfs_error(sb, "Runlist is corrupt.  Unmount and run chkdsk.");
 dirty_err:
-	NVolSetErrors(vol);
+	ntfs_report_file_metadata_error(log_vi, -EIO);
 	err = -EIO;
 err:
 	kvfree(empty_buf);
-- 
2.51.0

