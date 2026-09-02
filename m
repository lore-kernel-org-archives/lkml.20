Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7E3E92A9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334413; cv=none; b=IH7FBHtmXqK2C1BEFeM7KSnyZmb6esOWlVtXFQHS/qlUtETsXD3osBemOEbC9g80xkeTsly7ewvMIa/FKqOazlKYsDIh72oSzWUC1yec51eY+S8FQDUrK8u5UJ/+QZYlNGDpax8kGCBlY9O+vfHGbYvGrnFKalKt0BkB8z6kh/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334413; c=relaxed/simple;
	bh=sDT7xjM0dZISfQn5a6JEPcrI4SkY98hFxbZcEi1sMFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUY0OyM2kTbroqnGY+i8RvkKIQe48aR7QRp+9r//gCgEu9HYc8v2qI3cz3wwhf2MtJa30SvnwCxRsX8tdi4MezCT/8HYQQJMWFeqk2QmoR2KeXX0O/vuMPTc3FE+ihI38hLCvlGxFYfh1Q0qSrdLK3+SMKpWvzd0PbW6sP1zDok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T73qDWMb; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T73qDWMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=rL
	BrRbq6Vb3Paam/kpUsHN325HJZ3rHQyjFwMyPSp0o=; b=T73qDWMblV7YD8Kcns
	dFf7EMNSSPecwc63i241i1W+MFbTFxre9eFt+oq+z5DZFESgN4ZxRSKIlUXC/X38
	NrudZZDm6B0qPrUAlGkIi3Ek1asx8VjrzuC19b/T6lAYuNW/efvs/G4oL4KLxxj1
	acrFpBA9PbJhvhUR6Rrbx7lzY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3x_0k0ZdqF_ZSAA--.18706S4;
	Wed, 02 Sep 2026 15:32:58 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH 2/5] ntfs: return -ENOMEM from ntfs_inode_attach_all_extents()
Date: Wed,  2 Sep 2026 15:32:46 +0800
Message-ID: <20260902073249.3035977-3-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3x_0k0ZdqF_ZSAA--.18706S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyfAr47Xw1ftr4xWr4rKrg_yoWkZFX_C3
	WfJr4kKr1YqFn5ZwsxGw1YqrnakF48GF1Iqr15JF1ay3yUtFs0yrnrJFsYy397Wr4jqr9x
	Jws7Gr13Zr1avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08pnPUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwgr+yWqX0SqH+wAA3F

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_inode_attach_all_extents() returns -1 when ntfs_extent_inode_open()
fails, and both callers propagate it unchanged, so userspace sees EPERM
from setxattr, reparse point creation and directory index updates on
inodes with an attribute list.

Both paths that return NULL here are allocation failures: the
kmem_cache_alloc() in ntfs_new_extent_inode() and the kvzalloc() that
grows ext.extent_ntfs_inos[]. Return -ENOMEM.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 5aedc045f65a..747a60ae27c9 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -3025,7 +3025,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
 				prev_attached != MREF_LE(ale->mft_reference)) {
 			if (!ntfs_extent_inode_open(ni, ale->mft_reference)) {
 				ntfs_debug("Couldn't attach extent inode.\n");
-				return -1;
+				return -ENOMEM;
 			}
 			prev_attached = MREF_LE(ale->mft_reference);
 		}
-- 
2.51.0

