Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749204;
	b=GU/UxM6LfiiXo6oBYH8MNpzD+rA5Y9576j91KGcDxN4+rPEuyRe3pSxYdxpsFmOf2d/f
	 NQN1lVK2KY+nl8aW6LDCSNXdNxs4cxYg0kWzHsIV5DthhkOmfb5Ce/ZxlnlYtlZ1/I4rE
	 Of8sQpSCHT2sGScvLoPpOy8YaMTBFh4T0lReO8xo/EQ3MiILU8LhoZf0TW8C3IIJkbEOy
	 IsJKqZwVGRf4NzV6tpkh5MdWZQompOxXtvw1+CYQwEjsiDnrxct44+9HpMyRK0e5WTJe3
	 GN4JkP3y5ZOhFvI00iDRDZD2SKSumao+3dAhTU/RydBo2zACj/3/2faT+OAjdKcPiXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749204;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=kKg/9kwKNY2ZO/UoqGeyH2Gnh0wgDsd0MkIzDgaumFs=;
	b=buKuHf79BRwnJ98pytVgRc5IN9pP+0TftoWmq9XywPK0Xj/Se4pgs+b7ozm926YqASVf
	 mlJecyQWOPr32ymCcVeVdNzuSHXqfvgvi3cV6cB5Bylyhm5Yg5Fwe/U6BLF34fPBQuXpS
	 v0ZMaYjpzigZBeflsjsYyHja7poVx6Ejj9R9T1wUnn9B0/M/hV7DRpMMPy+HH5+jqLysE
	 dFU2jKzlK4PScuI08/aXEodtDNAtjQ9qR13AI8dnKtr3vSwilrW/jeskUACV3Pk1TGk8P
	 VIwkHIduSMr6t7ctsLf2noOv7eT4XEyOh+sqkv7pnSJo1ufN88WpC5ya49gXRNG+yfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RSSp0hF1;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B57606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B57606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RSSp0hF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kK
	g/9kwKNY2ZO/UoqGeyH2Gnh0wgDsd0MkIzDgaumFs=; b=RSSp0hF1JZl4i5nKta
	pNFwCj480A3FgFHp0JHV9gPCCxdvrRyf0ENPyPTb8vd8A0ZEYIEcTsK340KGiPD5
	DIcI6xLSaL4lMwq9sgErp5IP7WeMROPy3xYzCFBoQbZ8+WgkrFuo4/9h1Nk58hex
	ntl4unMKExhHhIgcTSj6P1Db0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD33yHzsvlqXCkHHw--.36757S6;
	Sun, 15 Nov 2026 21:26:15 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 04/12] ntfs: remove remaining attribute lists on creation failure
Date: Sun, 15 Nov 2026 21:26:01 +0800
Message-ID: <20261115132609.209957-5-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
References: <20261115132609.209957-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33yHzsvlqXCkHHw--.36757S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw17ZF48CFW3GFyUWFyUKFg_yoW8tw4Dpa
	1fuw47AwsrXw1IganakF40934IgrWkGrWUGr4UJ3WSya4kKw1S9asrKF1jkFs3JFZ5GrsF
	qr4DKr17JrWDuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2FALUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RcDzWr5svdtcAAA37

From: Xuewen Wang <wangxuewen@kylinos.cn>

Creation rollback can leave an ATTRIBUTE_LIST inode cached after freeing
the base and extent MFT records. MFT reuse can find that stale inode;
dropping it under another inode's record lock can trigger a lockdep
warning.

Remove any remaining ATTRIBUTE_LIST before freeing extent records to
release its storage and invalidate the cached inode. Drop the returned
reference after releasing the record locks.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
New in v4.

Tested rollback with large ACLs and long names forcing attribute lists
and extent records. Offline reclamation checks, space counts and retries
passed with 512-byte/4 KiB clusters.

 fs/ntfs/namei.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index a84d7bc9bc28..abb3675757e9 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -429,7 +429,7 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	struct mft_record *ni_mrec, *dni_mrec;
 	struct super_block *sb = dir_ni->vol->sb;
 	struct inode *rollback_data_vi = NULL, *rollback_sd_vi = NULL;
-	struct inode *rollback_rp_vi = NULL;
+	struct inode *rollback_rp_vi = NULL, *rollback_al_vi = NULL;
 	__le64 parent_mft_ref;
 	u64 child_mft_ref;
 	__le16 ea_size;
@@ -748,6 +748,10 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 				     &rollback_rp_vi))
 			ntfs_error(sb, "Failed to roll back REPARSE_POINT attribute.");
 	}
+	if (NInoAttrList(ni) &&
+	    ntfs_attr_remove(ni, AT_ATTRIBUTE_LIST, AT_UNNAMED, 0,
+			     &rollback_al_vi))
+		ntfs_error(sb, "Failed to roll back ATTRIBUTE_LIST attribute.");
 	/*
 	 * Free extent MFT records (should not exist any with current
 	 * ntfs_create implementation, but for any case if something will be
@@ -772,6 +776,8 @@ static struct ntfs_inode *__ntfs_create(const struct mnt_idmap *idmap, struct in
 	mutex_unlock(&dir_ni->mrec_lock);
 	mutex_unlock(&ni->mrec_lock);
 
+	if (rollback_al_vi)
+		iput(rollback_al_vi);
 	if (rollback_rp_vi)
 		iput(rollback_rp_vi);
 	if (rollback_data_vi)

