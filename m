Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EADD4C9DFD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543525; cv=none; b=BUn/zRFtdeP3BRvRwKV4Zme4UB4e28rccj/LIHaa0lcUY5L4+h30sZ0aGPZUmGI6wo/JYoAiXxeW4HuC30FbEJgNlM238Rq8X/4h9O903wgULTNeSyEchcWhDuSNjdUOFRyuMMPtwfsVULLw8PywydbithYh4urmGB/IQidEDng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543525; c=relaxed/simple;
	bh=RA/RPNmo7TN47Rac2/63pI2D+gBLK3RaOvlIfkzK2jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f84oVYMZsLEIYP6yMj5fwqnt2Kcj/7vqv0ghpm0YNHJtG+1GRzbaeLYEfRt4TG9nsndtVaBvyGJfKs+aFQvnl8IOVI8JkcNeM0opcGER17ghsFfsCVXKNVP9X4U73q27ahypC8YrmZQeA9P5wMJX0wgnycSwb9LE2zXDMYnur70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dO2NdwCO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dO2NdwCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C781F00893;
	Fri,  9 Oct 2026 10:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791543514;
	bh=vVjrHJKa7rDFUypv5UxZTfsmJ51mWGgTIxM/zhOP14I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dO2NdwCOeZi1yEnhbWIPdtPQzS1HlV2O8Fl2BQ2hPaG3/48poDSfS8l3HoXxv788L
	 qNmAJdhJc/ihA2re1GWQMlmQ9O0/0gc88JSr2YHjjtui1BX6cTdTZGs3U4c9pgI+Fx
	 D1wVRU7tRw2Ac1k3EYHUMmRGcBXL0vv7Q+3CvXIzz9axO2K2fHj4VIdxD8orNSPO9/
	 ueuOVqnU6v2oS9di/1yX+22lTuqX+sBYB2a5oJpYJI8xrud7KKLya1tehZ2GswfOkn
	 2DOjiqX7KrOhD5tq6BvoL9CLk6L2jPlbz9TDFBvi29aEW3Zbo5GGXPCPl1HHD6jy5C
	 dAnojplIgJZrg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org,
	Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 6.6.y 3/3] f2fs: fix to reset all pinned status during fggc
Date: Fri,  9 Oct 2026 10:58:22 +0000
Message-ID: <20261009105822.1859709-3-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009105822.1859709-1-chao@kernel.org>
References: <20261009105822.1859709-1-chao@kernel.org>
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
index 8a37461fc278..8a4395bfeff6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2064,6 +2064,9 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 						dry_run_sections == 0);
 		put_gc_inode(&gc_list);
 
+		/* reset all pinned status during fggc */
+		f2fs_unpin_all_sections(sbi, true);
+
 		if (!dry_run && get_valid_blocks(sbi, segno, true)) {
 			err = -EAGAIN;
 			goto next;
-- 
2.49.0

