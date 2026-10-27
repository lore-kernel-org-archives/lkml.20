Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093743;
	b=MR03lp4lpM3yxfAtjL0S3gRj6nmU9W0AJh4xrm1cqZUFojqWjc1RVHFpiqXFPP8edAKq
	 yslRxKzRENi2DZcSlbXNJR4Fnmm4jgD5n2ij710lSU39g5mxqlexRQlYGzpWx8epLg4Lb
	 A7AukwmsQRtThhKs6ija8Dl4FYNlAsm6LQesJl7gwPm4DTPQrTf1autzxdzQtfqu6Ztz6
	 MQ/W4pldpnhFc5vTxU+vBo5CZE5XlKQH1WE+2Sqme4ZlhrOfxwTznfLuduMe6kQWwsu/X
	 h3st/nmVqDD4zs7CbmX4VjhVRRXwzCHtirSLgru/qLrHYHUjGce+6YUMyEytoPh2bAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093743;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9PFg1tiFxtrMY3H3LlJpJ8GZvRMHcfHEPOcGYZAAP8I=;
	b=Qn+bGf7gmp7hbrId5FoA7dkl5PRT6WwIVs7kPDqg6bWu88NphAZHCm93crHL4tMGiqfC
	 pRcBrwafrKZZvyQdh7dRLknNaKAP01FI5hgPniai3nPdpU5mSgES3dETLFkH7MKqAoLLb
	 +KmQ88PYK375vCn6MVPjBPIvHF7u/yyoV4PEASXUMjiiI6bK6WLdQrQ6TMkDcS86Mi9CX
	 BPaPvbwAD8ZPfk8bn0OxmiWDpwBAmQyZz9aDF0Jx3osULNmJsvOInpvuf8zr7DVKYPA/W
	 m3he0dHFTw/n9BtUD0WGKRFs2Hc+NEjouOO4UircZ+qZ/xTP/WMI86nRYcoJ8YDKuww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ow5KUI8g;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2297606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2297606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ow5KUI8g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9P
	Fg1tiFxtrMY3H3LlJpJ8GZvRMHcfHEPOcGYZAAP8I=; b=Ow5KUI8gBHEyjgPA00
	9HgdRwMKZDMwS87xncR0jHj/0ibsWfXxk/A7mbjfn//1Qlu5Iq7gCOrRDtb4slse
	i+MA4KtqvQjzWBdKkqzhOWAWl+OQ9/nEZcC8gBULd7Qz69TbVzjxK7xEQQyLWfQR
	5xYOTjsyI4VryWoEBzfHT4sOg=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD33xFVcOBqdMGFDQ--.18497S4;
	Tue, 27 Oct 2026 17:35:19 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1 2/5] ntfs: preserve timestamps when creating hard links
Date: Tue, 27 Oct 2026 17:35:12 +0800
Message-ID: <20261027093515.344799-3-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027093515.344799-1-liubaolin12138@163.com>
References: <20261027093515.344799-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33xFVcOBqdMGFDQ--.18497S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4fZrW5Gr45Jr1DGryUWrg_yoW8Wryrpr
	W3J34DKwn5CrW7u392yFsrXFn2gayxWF4xJFZ8A3W7Awn8KFnaqF1rtryUX3WfAr95Wr12
	grsYg34UXryYyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jk2-nUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RcEzmrgcFdKfgAA3t

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_link() resets atime, mtime and ctime on both the source file and
the destination directory after creating a hard link. This overwrites
the source file's atime and mtime and the directory's atime.

Update only the source ctime and the destination directory mtime/ctime.
Mark both inodes dirty so these changes are queued for writeback instead
of relying on the earlier FILE_NAME write.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested with the complete five-patch series in QEMU. Explicitly assigned
atime and mtime are preserved across ordinary hard-link creation and
O_TMPFILE publication. A separate persistence check set and synced
atime/mtime on the published file, then verified those values after
cache eviction, remount and a fresh boot.

 fs/ntfs/namei.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 0c84a5c..4442e1d 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1663,12 +1663,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
 	}
 
 	inode_inc_iversion(dir);
-	simple_inode_init_ts(dir);
+	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
+	mark_inode_dirty(dir);
 
 	inode_inc_iversion(vi);
-	simple_inode_init_ts(vi);
+	inode_set_ctime_current(vi);
+	mark_inode_dirty(vi);
 
-	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 	d_instantiate(dentry, vi);
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);

