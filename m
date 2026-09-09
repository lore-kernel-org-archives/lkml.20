Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16D2C15A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917804; cv=none; b=JDCR9HO03tMku5AIrnROGAUIqe+dxZExvw0GUfnG6178e5/npAZtj2wJjbvcSX9lgJWNvhv7JnQBMUhOW0NPvjwld48cTEYsqAJjt5qoXz7/tii4J++u0pTXHFwzhePY4EMEZJ/6K+PMlP/Dz1pyhAGAej+ofh72DPaiHqvXlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917804; c=relaxed/simple;
	bh=cEikqb+1FvqhKorqAZK1aI/gzAcjP/X1a+Jk1hr1/6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ojecjxoais00hlFe6w3Sn/3vt4D6fUr3nVCV5hdIagG4ymCMSh37+/SffgaTmZAR46Aoi0uoJA22SnOS6Z9o0jApPoz6u6IpscUSMbtiEVaULnok4Dztj6z1mGjrSl/zpzTEONefaS+vbf5VxyrbXYe+LPK/tkMJrlPo685FfkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oL92ufMN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oL92ufMN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CCD1F00A3D;
	Wed,  9 Sep 2026 01:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788917803;
	bh=WGq8Em2086hbB+4h/5zhCJsDKNyBfoGes5sm4/+vj8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oL92ufMNFbHRxrjb2gs4Xop+snVaNGk5XREsb80RlQQMcCi4KRbjHqTc0SOngEXkI
	 g99fdCO0AJWY13JKQ3+gCcoPIcuTvEPRN6XTDP2d53PldVUmT4lHYMHrYWLWKzvn3Q
	 KXKW8KGiuqDCHl2HX981CTSRelGJYdIwPgLRF26Iht+fndDoBGbpYZ4WYw1swwhYTz
	 zaks08siWO0Y7lZkD3Nx54Mvm7rT+dQ7MLJd8m9YfacAcwlCTw67WKJ1ouctqjr53t
	 IwGzLgM65m79xuD0ZqZaQpOLKC2tcmEtOxIgM8vMbDmr9tldTLu7mWGnAZi4tTo696
	 WglTq1IND45IA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v6 10/12] f2fs: cache: support fault injection
Date: Wed,  9 Sep 2026 09:36:09 +0800
Message-ID: <20260909013611.3418568-11-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260909013611.3418568-1-chao@kernel.org>
References: <20260909013611.3418568-1-chao@kernel.org>
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
index e52e73d76700..01047528c21a 100644
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

