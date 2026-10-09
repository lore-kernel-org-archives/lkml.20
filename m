Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17CE4C6515
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543565; cv=none; b=kprIGQk5ViWzZ35woLB6sfvpKBlcX1U+a+c5hcG9rIqsAcIaEZfbwS/ut9Bamvyfw3cflbQS0UkG2O9k1jQRDlNQ1Hk/jttdstkITTC7QHeBlRb7zrWd/xir2plf5qL+AQ9VUU35OwKpNfJaimGywN7aSJ+k0jz8Q4H4kGtcubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543565; c=relaxed/simple;
	bh=BXGkEZuWz6PIaWyhn3drqwPYaoL5CeBKsRvBIJ9Izno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4491Fzu5p6lEtaU3PAFIEy7DeJwlYnf/KBrzsJ8hjr2Q7hF/kd24ozwC10bY2gUjop66xjuJikPelJtUCiaGZFYo0gimIAT8JZHAy+VQshRajPBotHTrUVJ41m3xwvW4KLFu9Ayl7ePK4jyfYbYJRmYkrHgoQ4HYDe2/w3kyhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXt4+sYL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXt4+sYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD901F00893;
	Fri,  9 Oct 2026 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791543555;
	bh=O7Xi6h1I5Mb6FlicJ0w7Ua9QyL0wb103FvJh6JPXnG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QXt4+sYLNeO8lwuHdgchBnBOQlnll7Do8nta0N+/PO54Y1EnlOE2c9gy+P5Wz9nqi
	 29wzZpF3rAp7h0AdSKTuqz4BZeoaSdXZoiqMkDvu1xtyRbg5Mg3jCvzgaCDuPDeGhK
	 IOaszuUpAXazVXb0pafiWISAstGub6PQ+euczbOfuGZdbsVtRSmJi4xb8jmErEhaYO
	 bPCApAumjOTy+yjHelHFKVRNxIKUj/JAk751WoEr16eoosynMvQnHTo66kc29tTDoy
	 MNl3bk4+pslocBtAfosNf1dn2nqPR4GAlI82/jHUnq5JBtXFHbQz+IC+D5z4MWQ7rD
	 ZgoFx4JTgIG/A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org,
	Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 6.12.y 3/3] f2fs: fix to reset all pinned status during fggc
Date: Fri,  9 Oct 2026 10:59:06 +0000
Message-ID: <20261009105906.1861478-3-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009105906.1861478-1-chao@kernel.org>
References: <20261009105906.1861478-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

[ Upstream commit 2b8704b6a8b2896ccad1f5941d9a3e2c5031a470 ]

Otherwise, the pinned status may affect latter flow of fggc.

Cc: stable@kernel.org
Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 664260807072..6c831276d81d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2132,6 +2132,9 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true, false);
 		put_gc_inode(&gc_list);
 
+		/* reset all pinned status during fggc */
+		f2fs_unpin_all_sections(sbi, true);
+
 		if (!dry_run && get_valid_blocks(sbi, segno, true)) {
 			err = -EAGAIN;
 			goto next;
-- 
2.49.0

