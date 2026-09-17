Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4226548592B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630444; cv=none; b=QMQ6LbJuS1/kOC2IXd5mst1mKRoGSpL9jWAm1y4Zd7D/gH1incV7LtYVGMuAlZ+1O60GDsPzrcVI12eP1tY/LBziju4ugcPxPn9AyiaRUzvnAdUvVu53t1erN+3HufY6irxshII4B2dd4/sLN/k8L4RSOFwCOjfWlVGRZues624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630444; c=relaxed/simple;
	bh=dokFiHUzli4rO898bqBvt2NRnexYR8JW2437dfN0SyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOE07Sm0FwB1d5fJN9iR/RGHvOkw7mFlYJaCIExT9ZyMXCl9vnO0CGEq0dExB2XfyIgjUM/uzBl4RVNolzyxlUMQ/MdTQc21Pzvj2ImulyxRmgMaiJkVNeuh7d8cm0SR7fBCmqai17Nj6kgs0Slap/DL5IRJRiAdq3aTwt8fQ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW+VLmu1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW+VLmu1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414751F0089D;
	Thu, 17 Sep 2026 07:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789630441;
	bh=u60a7hzzUwntyya3Yn4RCKAjyCDLb1Lf1oXylakCnKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LW+VLmu1pERO7vjJZ20Q2z2x2+6XaB/ou+8Tm3YiQpG98P0MMjH2pHQeZbPOsfwI1
	 BkCeFPEJ4v8E+MGtxe+FAgWd5IQUuZ60X2ahfcmn/LNhxXaLxSBKyk7+BMxFqd58W7
	 Cehr1rB75PRMgjf03ltIGAResaM1KkblkHvSzQrh0LUXGin3Y0VOSPwNWfoseIZK3U
	 ZEyGRXH3MkxvBB6nY4Wh1EJVKv9b9ASCs1GamDsHWP6ODDfE/7ZBlODYwe+HRne06N
	 Z3P2tFQOde8itiSp70qduA6tT/yMvRPPljeHd4sOx2zz3UkNzV/ZjpRdLA61WctA7i
	 xqbXHih1jTACQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Zhiguo Niu <zhiguo.niu@unisoc.com>
Subject: [PATCH v9 10/12] f2fs: cache: support fault injection
Date: Thu, 17 Sep 2026 15:33:41 +0800
Message-ID: <20260917073343.2823157-11-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260917073343.2823157-1-chao@kernel.org>
References: <20260917073343.2823157-1-chao@kernel.org>
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

Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index a56982a02585..0814c38b24bc 100644
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

