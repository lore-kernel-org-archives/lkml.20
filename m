Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5123D3A254C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523708; cv=none; b=Yx6cdcOkpKekbKtdZOUwfa/ynHnmCvm07fZr9V73ZcAkOokr9JSeuZxfyT+dGS150kw7emyDV4uUsTrOaudPVFifqiiZijYlS/7dYlhl37mogpHxkZTzPKEcoRwkEGay6EsoRqEI8q5S5PhQy3ApgjBI/ZAz4JTMEDcgBqHv1a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523708; c=relaxed/simple;
	bh=bV9lG98iH6Wx78JCGOGAJ5oPvhTA7Kq5hKvj9x3GxxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPVsAU7y2V2saMmP3rps/+WTqHHvSxOCYF+OHPosUgmZGWGPWCACFoeargzXniqSJaov7wF4YTCgJb/W7UjYgJ2/TlE5zfdOeZjiCBMnMFx1CjdH/yRoDs4MXHVUszTuu56z2nHLFNS2OhnpeEI3SszZo7I9UKbKbf2GDia6ROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3lt3mmY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3lt3mmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0781F0089D;
	Wed, 16 Sep 2026 01:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789523699;
	bh=8iezvk0aqFV3s8RKr5k1FFGYRRAyKBJ6p1J4i3PzFb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m3lt3mmY050HLOdMF8pHwwYX1xwtKZ3DaXpLyIsviecf7WVF7KVZ5HkYSvvihRV7t
	 yqYXD+BilXH7pw5kkv9v26OatyeBQCWq2nMv50u7bvukrqusGpXW1O60j1Vu6uWz9E
	 XzsEYc6xsbdCKCf3AIijITypyf6NrjFe3G7Xg/DG414XGFxfH/Xt0rvGw290rmwLso
	 HAn6CPqkoOKmEMfVvHkWknvwz6eceAUbAiTxmTLRbYtV3p7weh/M9TA3fKqUr/XzLJ
	 CGS61+FzU07sdq1vrktn02BzLDQbNCC0rGg/GvwlbqNPeY/4WyOBMv/qz5NEXGTS20
	 ZIKiB3eDZgL7A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v8 10/12] f2fs: cache: support fault injection
Date: Wed, 16 Sep 2026 09:54:38 +0800
Message-ID: <20260916015440.2232938-11-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916015440.2232938-1-chao@kernel.org>
References: <20260916015440.2232938-1-chao@kernel.org>
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
- it integrates entry allocations with FAULT_KMALLOC

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 3e6a198ef3b3..27624b6799a9 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -154,23 +154,27 @@ static struct f2fs_cached_block *f2fs_create_cache(
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

