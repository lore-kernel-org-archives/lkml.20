Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8D49EC52
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593764; cv=none; b=gupzDKPdLVNycXNjrQe4YSpTcFkJaUPTnImCcLT6KFdx1iqVH8FS65q1KvG6cq4opGGFqYlI8Ph6ZfJxwj15mJPwxPka7aNfIxc/qdxtHH2ksNN/WaFIOtAy3VKKzlDodEcYzOwEw8PzI5zWWBkXmP2xv4KToyZWsN3zgvseenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593764; c=relaxed/simple;
	bh=V7++Z6Q4Is+KX0oKqAtCtffZGEEwrBvT8RQwkGg/1wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fu99/VH+cQSbjkTXNr5qgVxzB34uByE7axsry1rmmu+As2j0SJyLUdZFux/2wHrFHKGv4oqEyZyAPfpGfC6cI7ae7u74E/05uLN0v/4XZkariFdE0JVlzvVsnAF6RedgVwTTCJbIX0xWRjSr3HEzJPzvV59Mg6pb3HMNweG42jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=cxgqdO/j; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="cxgqdO/j"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2304134f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790593760; x=1791198560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Hbwzddbbp3OqIU1MbfolXZQVb9BNy+to7ZoHFd6OK4=;
        b=cxgqdO/jx1zdUMhHdLeIGT62mCM0adJjA2ntKtc4KAd1VStuSwG7JTv130zBoS5fDO
         aiRxsxOI12hynPcZHsRaAnpFotV8m2U4M05AAOqSDkLK91hiLr6SNaxZaoUUCAQT4tNn
         neCFS7yEsg4MxH8LwAEV1AaP4mOL6ZZe3F5Ej6szd53HOgubNupwdfqHUi5WTDs9k1us
         fzmWpiKBIQA/ZJ/KIV50AGkr+ss42csNQZ4MxUEae4lt5C9LmYOphsyfxIdTUMTGQUNh
         sWUOpXV1boznB+yn9tbsV3E4r1y+Zzg+xgjaPojxvVLBM4zAJSDXFNPyR/UGMCcpuMRI
         aavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593760; x=1791198560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Hbwzddbbp3OqIU1MbfolXZQVb9BNy+to7ZoHFd6OK4=;
        b=fnqAVBfthgHbsOB+cBlh9+VICQnpp/uUI1ECchgKIQETGxZnH3+55sicjZINFvt0ix
         OwMb/N4ElO0EKSoh+vBHSx4nwRJomK1bsRfe7HsJYK2BW1gvXvRpUPQsdVj3rgiGDfhq
         janqPHaR5RK2OGePP4F4VfRcv6d6bmxrYTxY7dVI7sRflSTatx8Hj+9AEgM4mft804D/
         zgrvQ2A9UHo8QgujTeZQHQnAhYpDtmGEpcLP/NwjXkGOYrDO4kpOzPXXyCSWljgqYP07
         ezFQJnErVIWhs+mbqc0ydtlEcNRJStsRSRJNqeX5DZ8Ht4tBNDpaPhJi2VYQgwhhbPL2
         yDIg==
X-Forwarded-Encrypted: i=1; AKwUvByHIPeWK2WkHIIkjjz1abMMgyqdAAD2XbKLCwTnxtzkwJtld5W1QUdNwKnIE003YQcw28faXUrjcPmuJDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWWg3nwlPvK+gv3wiGYSXSQDCfWQ7MytvXnhqZezcIRnBoI8nW
	DNq2ZrwbV16b78ZMql4Frh01C92esOCFwjkj21K0qumSD5mp6/IOQ+reCWuS3kA49/c=
X-Gm-Gg: AYBFou0D++QM85/upGwYyCMyWD91kvYFz1NYCna5AVTklSMDabC1/uv5GTFvb6rqg3R
	xczmIJS5WGf69UcHx2oopEJVv48/ErXJHgiR9JIi4Ff2h8arNyGurPadp1H3dxEZG6GwuhiIXr6
	KfdFp2f5t0/5vZDgg31qyENjocKASzn/UUZYTopMcW6GyrZLtKG+8BhaSzCzp5t2tnFn7NkGa/p
	wPOarw888KBUCYDV/Sd9sxDMAyfru350phjO2FHw1HVwZqv3+8qcPYzcpl0GXo7oXI10xZj6Gi7
	2GmBrCEy+D1tyonNiuCFmbx2tx2CCEHlB4vUICnEKSIMGtYSAWRqZI9erzH6xo7qZI1UYNTHBiM
	NtCNinAXqimpkHqOny6/riMs/I1NrSPweCXywxi1TBJlDDq8NMKgniL0cOtlE21emJ2DH4MWb6S
	PoiSyWzGah79v9MqK1NmmgnPKCZx1xoYuDHimllzatlGR/tHKSvdl4KUyrRl4PgzdkWKWiWKFNc
	SpVNPcWFrqIYxFxN/E=
X-Received: by 2002:a05:6000:4b09:b0:488:6072:c0bc with SMTP id ffacd0b85a97d-48872a5d9a7mr22419714f8f.4.1790593760084;
        Mon, 28 Sep 2026 04:09:20 -0700 (PDT)
Received: from localhost ([2a02:168:9d56:1:4334:d7ec:dc81:975d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4887a6470b7sm27304997f8f.27.2026.09.28.04.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 04:09:19 -0700 (PDT)
From: Bruno Produit <bruno.produit@trailofbits.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: Kyle Zeng <kylebot@openai.com>,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	Bruno Produit <bruno.produit@trailofbits.com>,
	syzbot+f1521383cec5f7baaa94@syzkaller.appspotmail.com
Subject: [PATCH v2] jfs: pin metapage during synchronous writeback
Date: Mon, 28 Sep 2026 13:09:16 +0200
Message-ID: <20260928110916.2089316-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

release_metapage() decrements mp->count to zero before it starts a
synchronous write. metapage_write_one() drops the folio lock while it
waits for writeback, but release_metapage() retains mp and dereferences
it after taking the folio lock again.

Once writeback clears META_dirty and ends, reclaim can lock the folio
first. metapage_release_folio() then observes a zero count and frees mp,
leaving release_metapage() with a dangling pointer.

Add a separate writeback counter that metapage release and reclaim both
honor while synchronous writeback has dropped the folio lock. Keep it
separate from mp->count so concurrent writers can still reach the final
release path and propagate META_dirty to the page cache.

Fixes: 7fab479bebb9 ("[PATCH] JFS: Support page sizes greater than 4K")
Reported-by: Kyle Zeng <kylebot@openai.com>
Reported-by: syzbot+f1521383cec5f7baaa94@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f1521383cec5f7baaa94
Assisted-by: Codex:gpt-6
Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
---
 fs/jfs/jfs_metapage.c | 9 ++++++---
 fs/jfs/jfs_metapage.h | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

v2: Following the Sashiko review at 
https://sashiko.dev/#/patchset/20260922110754.1804555-1-bruno.produit%40trailofbits.com,
use a separate writeback counter to preserve concurrent dirty writes.

The syzkaller issue has the same crash and root cause, although its public
reproducer did not trigger KASAN in local runs. A separate reproducer
reliably triggers the KASAN use-after-free under reclaim pressure.

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 41fe12e641ce..1c388eb4af2b 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -269,6 +269,7 @@ static inline struct metapage *alloc_metapage(gfp_t gfp_mask)
 		mp->data = NULL;
 		mp->clsn = 0;
 		mp->log = NULL;
+		mp->writeback_count = 0;
 		init_waitqueue_head(&mp->wait);
 		INIT_LIST_HEAD(&mp->synclist);
 	}
@@ -309,8 +310,8 @@ void metapage_exit(void)
 
 static inline void drop_metapage(struct folio *folio, struct metapage *mp)
 {
-	if (mp->count || mp->nohomeok || test_bit(META_dirty, &mp->flag) ||
-	    test_bit(META_io, &mp->flag))
+	if (mp->count || mp->nohomeok || mp->writeback_count ||
+	    test_bit(META_dirty, &mp->flag) || test_bit(META_io, &mp->flag))
 		return;
 	remove_metapage(folio, mp);
 	INCREMENT(mpStat.pagefree);
@@ -623,7 +624,7 @@ static bool metapage_release_folio(struct folio *folio, gfp_t gfp_mask)
 			continue;
 
 		jfs_info("metapage_release_folio: mp = 0x%p", mp);
-		if (mp->count || mp->nohomeok ||
+		if (mp->count || mp->nohomeok || mp->writeback_count ||
 		    test_bit(META_dirty, &mp->flag)) {
 			jfs_info("count = %ld, nohomeok = %d", mp->count,
 				 mp->nohomeok);
@@ -882,9 +883,11 @@ void release_metapage(struct metapage * mp)
 		folio_mark_dirty(folio);
 		if (test_bit(META_sync, &mp->flag)) {
 			clear_bit(META_sync, &mp->flag);
+			mp->writeback_count++;
 			if (metapage_write_one(folio))
 				jfs_error(mp->sb, "metapage_write_one() failed\n");
 			folio_lock(folio);
+			mp->writeback_count--;
 		}
 	} else if (mp->lsn)	/* discard_metapage doesn't remove it */
 		remove_from_logsync(mp);
diff --git a/fs/jfs/jfs_metapage.h b/fs/jfs/jfs_metapage.h
index 2e5015c2705b..12368314b2da 100644
--- a/fs/jfs/jfs_metapage.h
+++ b/fs/jfs/jfs_metapage.h
@@ -31,6 +31,7 @@ struct metapage {
 	/* Journal management */
 	int clsn;
 	int nohomeok;
+	unsigned int writeback_count; /* Synchronous writeback users */
 	struct jfs_log *log;
 };
 
-- 
2.53.0
