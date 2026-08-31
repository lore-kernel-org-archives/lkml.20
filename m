Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFCC3E0C44
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168175; cv=none; b=gQxsCvzE3EK9MOYpQi9HVXj6OO0d2mFtwx8UerCuh3AwU71Jcuh82wK+xwyCYdkqiPApymwvJDsE3puADP/b9SJ9qSaFwIZoa6BZSlPmkTbR/qtdq0lXgnNveUbt3wyrHf9uQRPPkhNP4C2f80AUX9zj1Nt9S34T94jOafBPb0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168175; c=relaxed/simple;
	bh=MeFrGVEGdfRAuCi4HzC3/rrMHSsBfSfvd6BVhH3bMEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSXufZzJWpxLvJTOtTQm1+/rdqIiky2/JXqc7624mTgCzACTzP5KIdZisNQkWVGoLnwJ3jJfAZSji8izcf4lbxrTRBjVyfTU63pPqPj3l65ZD/LPFjLhG6qXTKp6oRyCeOS8fxs7eiJnhQOOKK+Gdn790/bOxwnDUwwsMsTIQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9sfgT2t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9sfgT2t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B6C1F00A3D;
	Mon, 31 Aug 2026 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788168173;
	bh=3f1GWhr9QjJPjx1dSEW5B9u8nAJuwDUkgImH+lNYX8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K9sfgT2tMmsabP9u5znNjT35VED2FL1tLAtck8VLuSgwEcwriR7wCkjmVU05Qkced
	 58OepwS1a7SVBWRZ3E4G8O/gL/rXABZPbrTEXj3Gb3sOhhCX+O64J+l7JE2ABC2ONj
	 tNSzysAmyRp9v4iQokg8+b6SSctPWt+oZBEHHjLCPsEhD/gup4H6hq59AbNFBUavIV
	 7L3rZnxDUlG+0ga2Gns5hXD3tGnsS1uH/a+xJ/rUjf69KS/HJVa7OPBAU0/ONgOIT4
	 YKxIu6k7MyxdXdlAPbkjKEoWYqaGDQcOFiekRpQWsxUL5voF7PCioQU54J/QrPWk5h
	 h8uBd3K8WK5yQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v5 10/12] f2fs: cache: support fault injection
Date: Mon, 31 Aug 2026 17:22:25 +0800
Message-ID: <20260831092227.739737-11-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260831092227.739737-1-chao@kernel.org>
References: <20260831092227.739737-1-chao@kernel.org>
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
index e29b32da5338..8276682d6af8 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -167,23 +167,27 @@ static struct f2fs_cached_block *f2fs_create_cache(
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

