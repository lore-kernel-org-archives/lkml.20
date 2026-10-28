Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163979;
	b=NLVMqXpWseST4obydyE1tKr0Vuf6USqrdRzXaOHrlq1cir0vuY9BZ7FKcUpgPcCyn+Xr
	 ZSY00r03BT/s4sgqz0qEVJHbjaihBD2PlAsgx2Q5pp8D/gw4Y8EAcaLbYiFJtiUYQtLmt
	 J6Bs2oWbiegvJPru49HtN9eKnlKul4eTcnoCrGQ3EIqb/OMSqj+mJ8PzrWWdLwXhGeIHg
	 eH7ReBb33Wsg4JAptrJCKHyf8l4kgngnhZkn3UrY7Jp22JWSZFYXZ4F1p8VlInZ0etLUS
	 BJQYbrrj47j1M55ZlpVrqEqo4nI3/ZT9Chxy8DjhpKtDcuPnP3Gfb8/8KBgIn2uqIFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163979;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yUD5YLynuGYaqf6Oqfvw56LrdLQlN9UTWI1HrgotyIY=;
	b=q0JNU69rOu7VEy2VZW/vqjnl/5ZLaBlmwo4DKKo0uBRmoiIUjNS/Xn/BmhTD49yuLHan
	 Xoz6xcUrKAiKeMP9j4EiOJFml+MlvLdx3FK2MP7pGAcVP/QmEZ0UmDUH6BRL+oD+YZr2m
	 n+HRmjG0HJytLCqAQg84amdlJqYhG+DvtIJm5ZAsNXg24nulg3L9EQ1ZhmpABEzjKsknS
	 mZNPQ7m0j82EYZgN0pqP+hyXC/Gp2AJXstbcOT17JGuhmaONv5zNTKQFieyX3wmTZ6u+6
	 1pudgYv6sPES0E8TyVQxHgxrFMgLlyTGZkR7kioqyt9O0/n/E74c1/wSreE0c8eggKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGf6VaI9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AEB606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGf6VaI9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B46C1F01825;
	Wed, 28 Oct 2026 05:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793163978;
	bh=yUD5YLynuGYaqf6Oqfvw56LrdLQlN9UTWI1HrgotyIY=;
	h=From:To:Cc:Subject:Date;
	b=DGf6VaI9HWZBDnKA7ThUJVLSYVDRALZFi2xNTtp21abzgugYZLGqVxKCrNuyTipT3
	 u4b/FM4ALSP+LOiU1/7xVBcGJCdTJzJz6RswfHVX1O1y3RoV7DuMMm+NKifAPtfMZJ
	 V+e0ABCE3p4EqHmumtOAPja7hkEaPjtcIa0Kp/f1nSavBzAmH//ZYyYlfECpMZcvCQ
	 DGbydqsfJSBqg92OxgoRvg+WmJGX0y1DCYfl4gdjK8JmrTy1hpT7EW4r3Ixrrkul3X
	 PEYsZV0+Vv05O5UPv8016hBkPhyMo/R6OrQocqPBbLmwflYsOrHA/ltiTL59IjEB+6
	 2jeMspYGIA6Fg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	stable@kernel.org
Subject: [PATCH] f2fs: do f2fs_zero_post_eof_page for all the time
Date: Wed, 28 Oct 2026 05:06:15 +0000
Message-ID: <20261028050615.259268-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
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

This fixes xfstests/generic/794, since the issue is not related to the
posix=strict mode only.

Cc: stable@kernel.org
Fixes: 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending file size")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8b4a7a9d7dbe..823df06ae0f2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -74,15 +74,10 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
 					loff_t new_size, bool lock, bool writeback)
 {
 	loff_t old_size = i_size_read(inode);
-	bool strict =
-		F2FS_OPTION(F2FS_I_SB(inode)).fsync_mode == FSYNC_MODE_STRICT;
 
 	if (old_size >= new_size)
 		return 0;
 
-	if (!strict && mapping_empty(inode->i_mapping))
-		return 0;
-
 	if (lock)
 		filemap_invalidate_lock(inode->i_mapping);
 	/* zero or drop pages only in range of [old_size, new_size] */
@@ -90,14 +85,9 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
 	if (lock)
 		filemap_invalidate_unlock(inode->i_mapping);
 
-	if (!writeback || !strict)
+	if (!writeback)
 		return 0;
-	/*
-	 * In fsync_mode=strict, when we expand an unaligned EOF size, we
-	 * should zero post EOF data and writeback the data immediately,
-	 * so that it can avoid exposing stale data after metadata flush
-	 * and POR.
-	 */
+
 	return do_zero_post_eof_page(inode, new_size);
 }
 
-- 
2.56.0.307.g5fe7bd680c-goog

