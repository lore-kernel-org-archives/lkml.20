Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580747;
	b=YjHw/1RSEUPkpj+4f2yJulA7MwahwTJXkc28n3n6foY2Iph5vWOt9t0+wN+SHtKtYwk9
	 1vpk/UVpoWuYali4JNsQKxKxkLuBQLW2Hz1nsWswsuAAKzAnO5qpegd+JkHaei1WIydaz
	 XHWCsaVCvRLhaSaV7EO5BNJrDSdo19nAQ0R72awUFHu4KEJQTy61ylmQBa1eCUyQ9ibCO
	 ws+g1pYO3vBYaSmiMxduu9ve3Ysa8gqaa+Xk6bgZRm1IkrM71LH8VLqbyGWNfKCQS3vdN
	 KGfodZKXQTsceeAxGjzBNFxQvXbmMdgmYTV/cyCQSwbzGAWRvbPBDnynGrHPE/2nsbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580747;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i91IextAwQtyto3JwcboWuxOtr/zAylf2Na72nZI7O0=;
	b=rei9suD0p1dk6GtZBxYLAwI8c4FPEmCctIFVJpK9JVSiCsIfWZoFY+aEWVO0cYpdFjXZ
	 6yf1T77UAp3WftimnxwZfqQbzT86B5nXqz+CktsQVFGuLork5N50PQCtXCcxQrWjCzJoc
	 OWGP5HfiG43uc1l6UopRS9wXqkp3a2K/JWi6TtEEtYnf+enGYDZ7ivIgEGkvTD8GyPTnJ
	 Fy+gb7rg6Z+VR3qaCNWPNyeb3ltA+P5hENqdHEonp/rP5N2Icn4hYO83IRXM1v3sKFfus
	 KjN7oQq2pVI2qhm3E9POMLtiyknlVHXst/EBC5d/sKd4mDC1dim3itr90Z7AlTKK8Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRsYJxy0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A6606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRsYJxy0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EA01F000C9;
	Wed, 21 Oct 2026 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580747;
	bh=i91IextAwQtyto3JwcboWuxOtr/zAylf2Na72nZI7O0=;
	h=From:To:Cc:Subject:Date;
	b=BRsYJxy0ddiNNztlu6kyvRrER9QbtcgazOA6hA99gQ3SG73+FRQm8x7JT3oIOMvyR
	 akC6qM9Q7iyVfbKzemGmXqP2ZFjk6ybymk9XU2+xZwEKcHPj8uX1y7jr+HlHcKu03N
	 8+ZtHaAFhtDKYU/4MZYmhtN8W65VS1Utc4Auygcl8WnC1Hrun0kQizIDSno5fS4UeU
	 kBrgSCOFUuOOFIFiWSj+sWEqeSD3wfFMQn/k78jOPDRyNtvRDUw/zV62ue2jhEhvYk
	 2dzhPAdG8izSVb9bTqjiXP1djoCHqr9ug1U8wi9nHn7h2od9yfNwHvttfl59oPKOLl
	 An5h0boK+0CXw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH] f2fs: compress: don't overwrite populated compress cache entry
Date: Wed, 21 Oct 2026 11:05:38 +0000
Message-ID: <20261021110538.746063-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
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

From: Chao Yu <chao@kernel.org>

f2fs_cache_compressed_page() looks up the entry of blkaddr w/
f2fs_find_cache(), and then grabs it w/ f2fs_grab_cache() and
F2FS_CACHE_LOCK_CREATE. If another reader populates the entry in
between, f2fs_grab_cache() returns that uptodate entry, and we will
overwrite its ino and data.

Before the compress cache was converted to the generic cache,
add_to_page_cache_lru() failed w/ -EEXIST in this case, and the
existing page was left untouched.

Normally, the racer is a reader of the same block of the same inode,
so both copies are the same, let's just back off, as
f2fs_ra_meta_caches() does.

A block address can only be owned by one inode at a time, the block
can not be freed and reused by another inode during population, since
the reader holds the locks of the cluster's pagecache pages until
decompression completes, and truncation must lock these pages before
freeing blocks. So if the uptodate entry was cached by another inode,
it's a bug, and one of the copies must be stale, let's report the bug,
and drop the entry, then readers will load the block from disk.

Cc: stable@kernel.org
Fixes: 6a78d0488116 ("f2fs: cache: use compress cache")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 747141c79900..9cc77d4dc63f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1928,6 +1928,24 @@ static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
 	if (IS_ERR(entry))
 		return;
 
+	/* someone else has populated the entry after f2fs_find_cache() */
+	if (f2fs_cache_test_uptodate(entry)) {
+		/*
+		 * a block address can only be owned by one inode, if the
+		 * entry was cached by another inode, one of copies must be
+		 * stale, drop it and let readers load the block from disk.
+		 */
+		if (unlikely(entry->ino != ino)) {
+			f2fs_bug_on(sbi, 1);
+			f2fs_warn_ratelimited(sbi,
+				"%s: blkaddr %u was cached by ino %u, current ino %u",
+				__func__, blkaddr, entry->ino, ino);
+			f2fs_truncate_locked_cache(entry, false);
+		}
+		f2fs_put_cache(entry, true);
+		return;
+	}
+
 	entry->ino = ino;
 	memcpy(cache_address(entry), folio_address(folio), sbi->blocksize);
 	f2fs_cache_set_uptodate(entry);
-- 
2.49.0

