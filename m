Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35697340A6F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174490; cv=none; b=Cs9SrXKXNAcrxlLZkglqi5wFa0D60v/BuJRwG7XroqExfJA8bAAAaCLKZA7B45gmFVIaEHS6TbYVpd8DaXxDqkVVczsx5i2FtXu6hYT1A12wU+Mtz21awheML2O3GsSj5uZBDq7SU/GkUHN+i1Ns8XxVrHzdaN+ps/HsjUlUNe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174490; c=relaxed/simple;
	bh=+otIrsLnvG63x+JWVf3rTo9vMNO9yRb6KUn2LVEtsEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WSy/iTabAn72bkHIYCKQmEFQmq44e7l0o1W3ZWA0h0SOO4grhluch6HXeZa/AC95NZvZyV9dKO1Iqs88M49gPQ2qVvEzAx//Qci4/Sc8jJVRJGxHYz4Zy+PZScARLBt2xEwCqev3pTbiKyIXiczqWlHqph0sdYc4qGi3OvDzDEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1lxs8yU; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1lxs8yU"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso535874b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174488; x=1790779288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VbNCrUtC6XhrJdqpuUyW50kKcrIjN7yFV7NZTjlcAE=;
        b=N1lxs8yUK/BdDMTD0oKKt7ODrXJQMzvHFjYT2V1V1PJX3DdRWS/2KuYChvyMQPVxH5
         CKaNUgdaRlOYfDg/f7CszEPI9cphIzPEqmJ5UbT6B8Abd/c3mQv22x6djCrcD22uYYPd
         UEDD1sjcufD5HLr+yR02T4LcqfM7z3U9FkB1ZXMChyAcqGvuQkzAN0i7+SjFsfZNwqTn
         IWp/ssNYjM0WSLs/kLvgyC30OSfDIil4+df8ou5oI7L4F3MFrOug7U/IanrGff9nYMy6
         H+5/cFdiD0fH5e/xs68W+IT8wKw88uDvy6881Mfb5eTCZyVn7Ivfee4uE55Df/OeK6DE
         pmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174488; x=1790779288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VbNCrUtC6XhrJdqpuUyW50kKcrIjN7yFV7NZTjlcAE=;
        b=hyEUVOqHrF/STaHgv8bbtNQ2eH+sGAAHBKHNom/KUq+W6EotUEloHHnSl7YE8nFwSL
         dMKLd59HKxpP9YatMlhIWSFYZ+5RxZ2BQGx13ukcXYK+pytkq9Q3oETc/h577fqOVZOB
         7ixL/w7VW6qZG3shQ07EdR9qLfhpS8Hi1Tt1dAjTb85l8dQ29sokK7W+rbbV4Ltl+ovk
         6VG2avYf4N0yGzyVI5ZNyhjVSwiGZCF/B9G3zrpoc/y14YtaaH/8FkJLJt8nEVS4i49u
         67ehx+uS3Go2RLXmZpEfgMA1SXM4xgzcnaJno6BKVdU7rBmNfqv+MkDBoDa5FziwnHa+
         jR1Q==
X-Forwarded-Encrypted: i=1; AKwUvByLCcOBAsgKkrTyLven/Bmz6c2/QWDqrvppAUJoqxzGwhOukxuV82G0yIKRTsKDejcGI0ES8ijdFHMi5Vw=@vger.kernel.org
X-Gm-Message-State: AFuF++ma33BL+jtEsgXttX9gYecvUfal4ukvZp4zLKPe2MmO+zeEOpmx
	w7oNXPuZr1FRNwEKRV2AF++5Exa3enaH4DsdlUpZI19KZcyB6f/Rq+7C
X-Gm-Gg: AYBFou3yEa9Ezo7vUy8L+r1fZIXredLnOOFgISUXEIcTvaLXkAFxg79xcd3/j64gRWK
	CKU5HYXNdgf8rXQmu07vodv6za4a7iG0Jib5LDvP81GlHxtaYQV1O7xNnLMkC9N/TpUAYfWDzCw
	v/S4ByKLAeVc0ARgu2rd97OXpstg0VIlUhjnPEKqdDokRF9O0qhVjQ1s04uKvJHEUyni4+O3fJY
	ehjQv/Kjoszuzv/JWzb+2vog1omwvBL9MXDeOChA4jAOGv2rSos1il3PTLqhDS9cWdgyf9fZ53y
	6j2tEGocYsi8nBxN91JDRrsgAvNZWi2rAefFin8KCl450H8iZy+kVQzrBERURVx007uxJuN+PjR
	prMaoQhjE+hHNjvWc9/f4MHIEtuqk9BEePMeDJ0yeLMYHNif7AvJELwkAXonuz4jnO76Y3NA4Va
	acer4rsXuyTT27yuJMOuVYP1LOHdv7RrpLNhoX1Tv8gfJb957ZFedAXJFkT4R9gt5txS7fZwYVO
	QvLDIi9NAaxS2QT1j2pK8twexc=
X-Received: by 2002:a05:6300:6bcf:10b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3ddf7cca4dcmr1648693637.3.1790174488224;
        Wed, 23 Sep 2026 07:41:28 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:f072:2258:ced5:5d8c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f406238sm1239936a12.26.2026.09.23.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:41:27 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	ngocthang2710.1999@gmail.com,
	syzbot+5570e0eb2edddd308514@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] jfs: fix self-deadlock on discarded metapage in __get_metapage()
Date: Wed, 23 Sep 2026 21:41:22 +0700
Message-ID: <20260923144122.25792-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__get_metapage() holds the folio lock when it finds a cached metapage
flagged META_discard on a non-new lookup.  It reports the corruption
and calls discard_metapage(), which goes through release_metapage() and
tries to take the same folio lock again:

  release_metapage+0x103/0xab0 fs/jfs/jfs_metapage.c:868
  __get_metapage+0x9a0/0xde0 fs/jfs/jfs_metapage.c:751
  jfs_readdir+0x1e01/0x3ae0 fs/jfs/jfs_dtree.c:3041

The task then sleeps forever in D state with i_rwsem held, which
syzbot reports as a hung task.

Split release_metapage() into a locked variant and use it here.  The
locked variant also unlocks and puts the folio, so return NULL directly
instead of going through the unlock label.

Reported-by: syzbot+5570e0eb2edddd308514@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5570e0eb2edddd308514
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/jfs/jfs_metapage.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 41fe12e641ce..b3585df259cd 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -681,6 +681,8 @@ const struct address_space_operations jfs_metapage_aops = {
 	.migrate_folio	= metapage_migrate_folio,
 };
 
+static void release_metapage_locked(struct metapage *mp);
+
 struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
 				unsigned int size, int absolute,
 				unsigned long new)
@@ -751,8 +753,9 @@ struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
 			if (!new) {
 				jfs_error(inode->i_sb,
 					  "using a discarded metapage\n");
-				discard_metapage(mp);
-				goto unlock;
+				clear_bit(META_dirty, &mp->flag);
+				release_metapage_locked(mp);
+				return NULL;
 			}
 			clear_bit(META_discard, &mp->flag);
 		}
@@ -863,12 +866,11 @@ void put_metapage(struct metapage *mp)
 	release_metapage(mp);
 }
 
-void release_metapage(struct metapage * mp)
+/* Caller holds the folio lock; it is dropped along with the folio ref. */
+static void release_metapage_locked(struct metapage *mp)
 {
 	struct folio *folio = mp->folio;
-	jfs_info("release_metapage: mp = 0x%p, flag = 0x%lx", mp, mp->flag);
 
-	folio_lock(folio);
 	unlock_metapage(mp);
 
 	assert(mp->count);
@@ -896,6 +898,14 @@ void release_metapage(struct metapage * mp)
 	folio_put(folio);
 }
 
+void release_metapage(struct metapage *mp)
+{
+	jfs_info("release_metapage: mp = 0x%p, flag = 0x%lx", mp, mp->flag);
+
+	folio_lock(mp->folio);
+	release_metapage_locked(mp);
+}
+
 void __invalidate_metapages(struct inode *ip, s64 addr, int len)
 {
 	sector_t lblock;
-- 
2.43.0

