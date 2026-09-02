Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43C43E3D8C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334407; cv=none; b=LVPK+29dkIYGB/fZA0Q8Bwyenx+HKdURmITkapa0tqQF6ivDgubbCfsNkNChbiG0DXZl1zNwdGptvhutkxpnqO17ZMRv3WytNMURqk/gRF8aC6JpTNA9UHGNjCJ9WFLUi/UccaI2EH+QeapgDBsLwH3h+v7fvWGNUZ3cOqiOMfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334407; c=relaxed/simple;
	bh=lv4rIKTEg2Rgs0zVvze95QwjEFvnGpRHGmU3/DR+ZxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZC4igDFUe7XmXo9S6pNmuqNDLrS/w0JqKeBAPgfptJ/tPzr96fQFKqHwa0mhFkUx4XkuUv3On2ID93g8Wqp6Og70C/b/xM3vVCUfDadZB36RfQpXItZGJAx+bsMb+YCHzl7QVV4Hk6difCly/Y/wCvP7bNvdiWcz1Tf7/9mF3P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CN/BMsRn; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CN/BMsRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qU
	HaUjAHwUSD5N9hdEvF96JzZ0kVJ+mGXaN+ZSRCuLU=; b=CN/BMsRnfHJxDAZv+2
	gfIacf+FMMbIrmG3OF2QHlElSpI4IRvs/Adb7IvvVs7LA2UVbi0LDZXO00Q+GRnh
	IDBtet9dX3lA5u4Vz0Wce0jq5DRqFQdM+czZ7ThRnIpwBNzN1WLuPAXgIohfzXYd
	JLBZ4qHgwIJmq9WEiGFkWH/kc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3x_0k0ZdqF_ZSAA--.18706S5;
	Wed, 02 Sep 2026 15:32:59 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 3/5] ntfs: preserve the truncate error in ntfs_enlarge_attribute()
Date: Wed,  2 Sep 2026 15:32:47 +0800
Message-ID: <20260902073249.3035977-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260902073249.3035977-1-liubaolin12138@163.com>
References: <20260902073249.3035977-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3x_0k0ZdqF_ZSAA--.18706S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy3CF4rCF45CFW7XFWkZwb_yoW8Gw1kpr
	ZrJFy7Kw4Yv342gF1v9a1qqw1Yvay3tFW5tryqkw1xA3Zxtw1DtryFyw10ga1IkrW8X34j
	qr48uay3uFy2vrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jWD73UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gv+yWqX0Su7CQAA3j

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

