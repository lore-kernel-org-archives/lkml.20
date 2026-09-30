Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13A353A91
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731178; cv=none; b=buUEnmG4K4yMHctA0U22P8cOJUtjRDveNzM8wr8hp31SpW0zRKQjpWUh0WEpxYpS+rj0qiCf38oJCigIQhAm3H5p31Nxlf+9oJrz1Qxgp0idmYmHi+igd4zWrDok0bcSZO/ZJleug7DzhiqNbHnxDWnbdm0wV/0bLLDhfjc7Ijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731178; c=relaxed/simple;
	bh=bpLB1ab1BY9ORTX1MlTrgZDnkNc2cdghQ3lF7HKHbDA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eJaBkY+Y0XCLWnRH5mKVNcFFtLROLu3PySCNe6ht6Nj3d6n3dH+i3IIyJ7PRsdsZJf84TwYFxQ4zXQdZbLa12kYpJFJLjyxKMCh7+DhZn4L+sehkS5jcQl4snL0wF8pTy5EPJNcEbgyfRtgm1Lth3IfhGruMwk9nYZejxrZ9NRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rg5tfEmE; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rg5tfEmE"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33baaba6371so18076012eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790731175; x=1791335975; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VApuM5lufQKhv2Z8CNJsSepO+dLFr7rZjSeOJOWL1Og=;
        b=Rg5tfEmEjo9/IXaKGeTlM9BMWmIbeehQNcYmdU6e7aoKmyMfILsI2hHxEuAKP7NEp0
         iLRnr+35cdYzoIgz6bxGIDArF2s/gwtsKOUCNJYSKkeK2j1DgKCPckvf9foTMsu0WkuL
         RPFmrDQ3yijuLAmhHGXdpmTaP6HVRy+7jwcSl5CokeeaItm+OMLhLHf8LVBbhapoCEZ1
         54B6hn/mseCmm5C6uPKXQTFTrfTeY+HbKqRxmhvAn5OOuTb+9V158RlRv4xfAWJPqMtP
         ShL5p4wBZlH52A+GcoFR3yz2mrZ0r2DJwYe2GMC6v8BBF4jQsaM2mcw7EDQPP+XDmNn1
         vG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790731175; x=1791335975;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VApuM5lufQKhv2Z8CNJsSepO+dLFr7rZjSeOJOWL1Og=;
        b=2FpDzA1LNLCW+XrUv+sivaJCFr0cQKkrj90taH2oDQ9TjTRM1tcuQMNUUrx95/CnxF
         PmDEmQyI9QICS3aO8Tbav1CO0HynCCsi8NYF0eAAg8mcgRgiyUFCxBzPrkDtj+LagXRT
         2Or0bZrlJsV9x6F/CLRN232dgFmKOgv3C0AIvSKrfYA9fnLS6gPkklwpOiiKLEMOPvp0
         x2wQoitW6Oiy0FSWQ80LPtTD/oiUHFNcngtD8RmMzsPRtWSqSiJoP1EI+Csg9vSHCKy6
         7ZyuXzVDAwJMJIqp9sLxzQ2jqJYMZwiILyHLhpJeJDLUHcZmHc0GcFOSML2064JpSeSE
         WPzg==
X-Forwarded-Encrypted: i=1; AKwUvBxhBFIxbAw/pmLQFhLR1mzd92/a8A8L5SJIX87fc8z7eI+6p9E5wUQI1fYlJwy7Z2/X6l97GYnUmOoIdXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMhinfdgkNPzqbOUtETAfIPs4nC+i2PJFrLTz/kEAEf1+IWw5D
	Uruwc49XlG47iMIWJSYpdZVyCVUSO6vI6oYsO/jUtKblYmCTHwx7FQR1tXA8tF0/Jcnvmr5pFFP
	IjdvB/W+NFkfToqbeQWyK5N1hvlZHBLkRL08s4Q==
X-Received: from dyblf37.prod.google.com ([2002:a05:7301:a25:b0:33e:6278:c3de])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:aa6:b0:342:94b:aa28 with SMTP id 5a478bee46e88-34c64cb8e45mr1319141eec.27.1790731175148;
 Tue, 29 Sep 2026 18:19:35 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:19:20 -0700
In-Reply-To: <20260930011921.1188150-1-sarthakkukreti@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011921.1188150-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011921.1188150-3-sarthakkukreti@google.com>
Subject: [PATCH 2/3] erofs: bypass managed_pslots xarray when compressed cache
 and dedupe are disabled
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Cc: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

When EROFS is mounted with cache_strategy=disabled and without global
compressed data deduplication (!erofs_sb_has_dedupe(sbi)), every
pcluster still:
1. Performs an RCU xa_load(&sbi->managed_pslots, map->m_pa) lookup in
   z_erofs_pcluster_begin().
2. Acquires the superblock-wide xa_lock(&sbi->managed_pslots) spinlock
   to insert the pcluster via __xa_cmpxchg() in
   z_erofs_register_pcluster().
3. Scans all pcluster pages in z_erofs_bind_cache() calling
   filemap_get_folio() on an empty MNGD_MAPPING.
4. Acquires xa_trylock(&sbi->managed_pslots) on completion in
   z_erofs_put_pcluster() to __xa_erase() the pcluster and defer freeing
   via call_rcu().

Under multi-threaded random read workloads with cache_strategy=disabled,
the superblock-wide managed_pslots XArray spinlock and RCU callback
queue become a contention bottleneck despite no managed cache folios or
shared pclusters ever being retained.

Record whether a pcluster is unregistered (pcl->anon, fitting in existing
struct padding alongside pcl->from_meta) at allocation time when
cache_strategy <= EROFS_ZIP_CACHE_DISABLED and !erofs_sb_has_dedupe(sbi).
Skip managed_pslots lookup, insertion, and cache binding for anonymous
pclusters, and free them directly via z_erofs_free_pcluster() upon
decompression completion just like inline metadata pclusters. Recording
pcl->anon per pcluster also avoids races if sbi->opt.cache_strategy is
changed via remount while pclusters are in flight.

Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 fs/erofs/zdata.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0517caf61959..cd0411695a02 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -77,6 +77,9 @@ struct z_erofs_pcluster {
 	/* I: whether compressed data is in-lined or not */
 	bool from_meta;
 
+	/* I: whether pcluster is not registered in managed_pslots */
+	bool anon;
+
 	/* L: whether partial decompression or not */
 	bool partial;
 
@@ -775,6 +778,9 @@ static int z_erofs_register_pcluster(struct z_erofs_frontend *fe)
 	pcl->pageofs_in = pageofs_in;
 	pcl->pageofs_out = map->m_la & ~PAGE_MASK;
 	pcl->from_meta = map->m_flags & EROFS_MAP_META;
+	pcl->anon = pcl->from_meta ||
+		(READ_ONCE(sbi->opt.cache_strategy) <= EROFS_ZIP_CACHE_DISABLED &&
+		 !erofs_sb_has_dedupe(sbi));
 	fe->mode = Z_EROFS_PCLUSTER_FOLLOWED;
 
 	/*
@@ -784,7 +790,7 @@ static int z_erofs_register_pcluster(struct z_erofs_frontend *fe)
 	mutex_init(&pcl->lock);
 	DBG_BUGON(!mutex_trylock(&pcl->lock));
 
-	if (!pcl->from_meta) {
+	if (!pcl->anon) {
 		while (1) {
 			xa_lock(&sbi->managed_pslots);
 			pre = __xa_cmpxchg(&sbi->managed_pslots, pcl->pos,
@@ -819,6 +825,7 @@ static int z_erofs_pcluster_begin(struct z_erofs_frontend *fe)
 {
 	struct erofs_map_blocks *map = &fe->map;
 	struct super_block *sb = fe->inode->i_sb;
+	struct erofs_sb_info *sbi = EROFS_SB(sb);
 	struct z_erofs_pcluster *pcl = NULL;
 	void *ptr = NULL;
 	bool needretry;
@@ -840,10 +847,11 @@ static int z_erofs_pcluster_begin(struct z_erofs_frontend *fe)
 			return PTR_ERR(ptr);
 		}
 		ptr = map->buf.page;
-	} else {
+	} else if (READ_ONCE(sbi->opt.cache_strategy) > EROFS_ZIP_CACHE_DISABLED ||
+		   erofs_sb_has_dedupe(sbi)) {
 		do {
 			rcu_read_lock();
-			pcl = xa_load(&EROFS_SB(sb)->managed_pslots, map->m_pa);
+			pcl = xa_load(&sbi->managed_pslots, map->m_pa);
 			needretry = pcl && !z_erofs_get_pcluster(pcl);
 			rcu_read_unlock();
 		} while (needretry);
@@ -875,7 +883,8 @@ static int z_erofs_pcluster_begin(struct z_erofs_frontend *fe)
 				Z_EROFS_INLINE_BVECS, fe->pcl->vcnt);
 	if (!fe->pcl->from_meta) {
 		/* bind cache first when cached decompression is preferred */
-		z_erofs_bind_cache(fe);
+		if (!fe->pcl->anon)
+			z_erofs_bind_cache(fe);
 	} else {
 		folio_get(page_folio((struct page *)ptr));
 		WRITE_ONCE(fe->pcl->compressed_bvecs[0].page, ptr);
@@ -1383,7 +1392,7 @@ static int z_erofs_decompress_pcluster(struct z_erofs_backend *be, bool eio)
 	WRITE_ONCE(pcl->next, NULL);
 	mutex_unlock(&pcl->lock);
 
-	if (pcl->from_meta)
+	if (pcl->anon)
 		z_erofs_free_pcluster(pcl);
 	else
 		z_erofs_put_pcluster(sbi, pcl, try_free);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

