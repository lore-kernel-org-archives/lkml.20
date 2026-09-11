Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1865043803B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169068; cv=none; b=O6jZSLS688M3UjZTngjVv/iqhHBvlO9eL6NwYT/3pu1uym0Ma93WhSUGMSaxttwpAfe5fIZ7+x2v0xBnx9ncHExk0ugkrjsWRgM3kqcWvKFJ0YHkS0vnjWhFagbSogfZZHM7xZRQrm+HoUUSLG0A3t7NKO9I+VJ822f0Ui+XEOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169068; c=relaxed/simple;
	bh=VSjwtclMXRZu2+dEaoEkprHrbkj1yJY6x9+93YlAFjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYCrDwBbEDcVboUF9exbRiEUeYB3s5vH7Z0QJZ6TiTLl01IMzNBDbRX+JgDL0dIEkrNsDqDeOgD77dndEcWuYqJlEfyYpJ2oZn989ceYBAeFFS7V1O1h6rb1y0/KQsGVha1LeFFI1wotToLZsGvB80wna3/95d20puSXU2IyQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCPzfOXZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCPzfOXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5C61F00899;
	Fri, 11 Sep 2026 23:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789169067;
	bh=NSBS8ZRpS+SWgzWKF9sDzzykDP2ZBx41vKFFWX58pcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GCPzfOXZ0HEiommtYml1fn8h3BF/0W9ZU8uay4lbb6NKj49YzNTwspaDBqY0LHu+b
	 DUhcnnQkIR7SXoJb/WQdGuFHn+K/4Lfluq9NsEGg97oqfwXP5VAXeJglpD+kW9GHpY
	 5p+N1Xsu9YgPvpXkp9xb6TKTdl2+tCYIYwca15WYoas5D6OEgnA0xFUyoHW5043sAi
	 cvwk8vfU/wIGKsIEIxsmuqeU1LFWw+xM+v/ssG1SNP/3sZp/UgwSOXhn3oVpAkVWw5
	 ZIyyglXuDCSs+eVLC5r3ppTiOGw/eMX9d5U4z00SET25ydH9Ei/IFZdzA7FL/hwZIB
	 93tBJstgLzODQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v7 10/12] f2fs: cache: support fault injection
Date: Sat, 12 Sep 2026 07:24:03 +0800
Message-ID: <20260911232405.1815804-11-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
In-Reply-To: <20260911232405.1815804-1-chao@kernel.org>
References: <20260911232405.1815804-1-chao@kernel.org>
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
index 7260c157654b..dcab0f321730 100644
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

