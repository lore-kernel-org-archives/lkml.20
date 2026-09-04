Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C53655EA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512501; cv=none; b=mSw7MkxiuQrFz4DqckF/WO+6wU0VdYzj3KcewE9Z7Nk4MQHysVlbbFcQdlwrNb67Xof2NBwuKm977zJwSBsGjXjyzZO8MEEAFW6DeXzmGeUnJ2AUvqUCFS2hudpyS11nQeRQ4CoWFHz6tnXVNbgB29aZSaAd7HV8al4dxGxMhq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512501; c=relaxed/simple;
	bh=nFmFAlfMfvchNY8wxK6eXDlPjjlVlM5IsxUS5faaTzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGANcN46cFAnF0wX/goXue5/LV9rO6/YZCPnibwEDjoEie9k4vXaAdhvaA1eIns7Nr9EPPTL1TJdTITRtPv3Nu344NGhwzCxd1OGbf1INOLPEYl4LW7dY4FZPRJ/dkYslW/JhaL1eohWS6Ce0N5P2TIjfez5lRNRuaAi6S6RWb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W3yrBs7f; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W3yrBs7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nu
	j0+1XQbhDECxrIopxhQRoG1J/egygz61nzFEiJBpk=; b=W3yrBs7fwzFqRNOgA1
	MEseH6I/LZrHsvJHG2cfBuMw5+m6thAUzwRu6V7xwTOi1+bWYQExAlR/6cfaw1Mc
	GflyyD7vIibK4VbVxmSoTmp9gvi2PYzM1GyZS06KQqx5iX84l2JhfRxL2tReRWUf
	18TmixH6Veid/+UM34OgwD9Zc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAHU97ViJpqDNWCAg--.41284S5;
	Fri, 04 Sep 2026 17:01:20 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 3/5] ntfs: preserve the truncate error in ntfs_enlarge_attribute()
Date: Fri,  4 Sep 2026 17:00:52 +0800
Message-ID: <20260904090054.3365538-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260904090054.3365538-1-liubaolin12138@163.com>
References: <20260904090054.3365538-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHU97ViJpqDNWCAg--.41284S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy3CF4rCF45CFW7XFWkZwb_yoW8XrW8pr
	ZrAry7Kw4Fv347Wr1v9a1qq3Wjvay3KrW5tFyq9w1xA3Zxtw1Dt34Fyw10gw4IkrW8X3yj
	qr48uay7uFy2vrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jW9a9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QCbZmqaiOCwPQAA3B

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_enlarge_attribute() discards the error from ntfs_attr_truncate() and
returns -1, which reaches userspace as EPERM. The discarded codes are
meaningful: -ENOSPC when the attribute cannot grow, -EACCES when it is
encrypted, -EOPNOTSUPP when compressed, plus -EINVAL and -ENOMEM.

Most callers of ntfs_inode_attr_pwrite() compare the result against the
requested length and substitute -EIO, masking this. ntfs_ib_write() does
not; it returns the value verbatim, which propagates through
ntfs_index_add_filename() to __ntfs_create() and __ntfs_link(), so a full
volume reports EPERM instead of ENOSPC from create(), mkdir() and link().

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/inode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 747a60ae27c9..9b2ff15da94c 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3618,9 +3618,10 @@ static inline int ntfs_enlarge_attribute(struct inode *vi, s64 pos, s64 count,
 		return -EOPNOTSUPP;
 
 	if (pos + count > ni->data_size) {
-		if (ntfs_attr_truncate(ni, pos + count)) {
+		ret = ntfs_attr_truncate(ni, pos + count);
+		if (ret) {
 			ntfs_debug("Failed to truncate attribute");
-			return -1;
+			return ret;
 		}
 
 		ntfs_attr_reinit_search_ctx(ctx);
-- 
2.51.0

