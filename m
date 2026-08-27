Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3440DB42
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833563; cv=none; b=YlwA5kdQwGIAbcPLk65nOC8SXluNvarfdq++VVBu9c/VJ23il0uNN5+lVqJOvsj46ZkRBHYW59NJhgn4Gzk1PNgzuxivMtWRUmg35v7u8pbNHwwnSRoIdCf92b1MvBdJ+jghSuj0AsA+Ys7HFpsJUjhIKglaJ06mbpsHLlyuuMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833563; c=relaxed/simple;
	bh=NG/l34W4WT7eSyelFbP4PjpZ4HUmCA1gzsAIIty46OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTzw/wKy+gishDEKbEpnH7kpGXhaRop9W9jIFmgqDcvJTuc2kGVvLoy+nCDyhQpl6nQZcl2UpCR3ciuRqheJCGt0tNpUTub4hQPQfYgltgMXIaY0ssuDmtK/DizTGnQkbhOnlyVmBXEGmoAhZ6p71Y3DBK9PpGmZuGtU9kA0sFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kw1gFfS6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kw1gFfS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70BF1F00AC4;
	Thu, 27 Aug 2026 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833561;
	bh=Ne8r8t10oFzf7ekM8lvrFV9qzNHGrX+xn9Nrur3onVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kw1gFfS68+nEwIlMvu9/lOMKf+4u95cJg9Iw74C7sGr2z2ZRoEOLWJjyZj6fS8w0G
	 RZ537bSpBR+M0LAaCcp+jq7dPkZhtd0dCWNASXQQTeS47htitkVeE16Nm6gMoX4xrM
	 gIoI4vaNxvBqkx0z3bYZsLoHlo+Acegqor9mLQWOlDuUKccPCniCFIheM1IG1BA9lE
	 iRkF3eNiH+EwrDLIgLnSpOmII3hPE1Y4EnV+AfMCIym4kBU5m4BWVfqdsAANIB+/jB
	 YXaMHjI8d0oA/jA35s/wjizIUkv41aKt7hiQSuEiW7cStID2S6n9fTjzcqArgGnuvx
	 kMT5FAcm3yH/w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v4 10/12] f2fs: cache: support fault injection
Date: Thu, 27 Aug 2026 20:25:38 +0800
Message-ID: <20260827122541.19967-11-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
In-Reply-To: <20260827122541.19967-1-chao@kernel.org>
References: <20260827122541.19967-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This patch adds fault injection support for metadata cache allocations
to improve error-path test coverage.
- it integrates entry allocations with FAULT_KALLOC

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 058e62c44152..2a98479bb3db 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -176,23 +176,27 @@ static struct f2fs_cached_block *f2fs_create_cache(
 		struct f2fs_cached_block_list *cache,
 		unsigned long index, bool nofail)
 {
+	struct f2fs_sb_info *sbi = cache->sbi;
 	struct f2fs_cached_block *entry;
 	unsigned int flags = GFP_NOFS;
 
 	if (index == ULONG_MAX)
 		return ERR_PTR(-ERANGE);
 
-	if (nofail)
+	if (nofail) {
 		flags |= __GFP_NOFAIL;
-
-	entry = kzalloc_obj(*entry, flags);
-	if (!entry)
-		return ERR_PTR(-ENOMEM);
-
-	entry->data = kmalloc(cache->sbi->blocksize, flags);
-	if (!entry->data) {
-		kfree(entry);
-		return ERR_PTR(-ENOMEM);
+		entry = kzalloc_obj(*entry, flags);
+		entry->data = kmalloc(sbi->blocksize, flags);
+	} else {
+		entry = f2fs_kzalloc(sbi, sizeof(*entry), flags);
+		if (!entry)
+			return ERR_PTR(-ENOMEM);
+
+		entry->data = f2fs_kmalloc(sbi, sbi->blocksize, flags);
+		if (!entry->data) {
+			kfree(entry);
+			return ERR_PTR(-ENOMEM);
+		}
 	}
 
 	entry->index = index;
-- 
2.49.0

