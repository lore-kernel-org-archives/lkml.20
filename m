Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C9B3F3298
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791156912; cv=none; b=V/6DyRymwk3FxoE645q8B7Hq0o0nPMBp+gaT2mQ0zRqKaYqE6vi4EQ760yo34UYSGVoYoAOgH3DAsAuMSTAcJP3Y8ilD/LkHHTkEcHrbTL7fZ9DQ2VgYerI8AgRQK5mCdPaLL7DyD2FF0mJlYFJnfQnCGY0r4QBJamP0/uXMb7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791156912; c=relaxed/simple;
	bh=agn/G9mTJy0n8+UIRRMgHsHvHBt/hWBfv5LbPKPmUGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uoXg2yQ8pbfOdYLeasGNmfZ6u+tXVcf3+yINIz36PI0Hi87raA61evI7hEnVL2pocuyjlySEfcnWEl49/Icnb5SDAMkr8jxhzjNp27qy88/1tUDisv4tv9Q8lFl9V1KsOwrjBRyvyi3rRsUU8L78w0uHu6Taf3eQQTlwkpXeCXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skNbuxTx; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skNbuxTx"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso536816a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 16:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791156910; x=1791761710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3ss4x2XY1NtegOb+bi9AVH4a9A9wdpQ5aQv2P3PhMI=;
        b=skNbuxTxjfjT+e8OXvDAMjO2U6kkMBZGrdGBSEVNDEZjZIPbNp5SBT8jtN43DQI/rM
         5h80GjK0s3Luhqm5RzxtDAPMgNF/XbNZJ2mJXidBAEXXAb87g6tOnVjICqioXzBpzkdZ
         vKtVDB7vCn51mU8q6U/MnhoDOlqwIgJsdW3ihUKiehembyXHrBZsSbnbi0S5dw1EiMnl
         e1p/GsOcyYL4VUhrMOXAMeNhRi0ylKYGvEpBMy6LAguQx0h+hLgtS1plqpEMrfzysI4o
         AQwJAW3Ka634Bo0ggPRXG8cXmpbIqQeBBa350h7YC3npNq37BkV0JUKuHJct9r84Bnqk
         /1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791156910; x=1791761710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3ss4x2XY1NtegOb+bi9AVH4a9A9wdpQ5aQv2P3PhMI=;
        b=L5jp7CFGsT/NOwG9FEhBQ9RCgcMBmg0Z8rih3uUA2kDoZXwiV4XL5nJtgRJ+SyR+E8
         M0b2utb5at9DOZnM2MGzJtwthj2vsv+duQLDTml8tiNYYuHxL04T7IuoUfWwqqGXqaPf
         XcQ9rH4HwWbIxisq5O9MeMFBZsdie7uGNaX6KtAwm4TDlhnSqCGAzdS6GFnfE2M1NnNa
         GuZyGtqnKMNj9BvvwbQG2Bcnt19oAQwpTdo8RZNRlW8lXiP1gK9fWQL45HI/xrD4bUDy
         P3uW4FDkWSM2G4Rrfvw3ZLNGbz7WxJERuvew0rQ9FH/7JmWn3vcNmnGlerC7CthRnRjk
         VrYg==
X-Forwarded-Encrypted: i=1; AKwUvBx0sjyKEMjf5B6i+9gBAM2eZ5cVbsdAxVu4THkATPFxb8xhyIKLpoJv53Ieskm34vpbq598+M+2IcvzkIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2MHST6wPtJGzJIaNLYKfsXqmSX9jAKFZDPM4kIezVnGQZNOds
	30e9KFZ5LpAWHBZXfgCpITvOWM58I2he2dQowuFz7jZI/OkrtFiJxCUJ
X-Gm-Gg: AYBFou2zfm8qoTvmjsGc8q333BOoa+Ugm2OWOaP5guDaGZrbi6tP1ePzE3MMTIbOivi
	WViknnu8nDUUCeZr6+5+HbnJJvls5Lpcyg55sy8oJyZ/qy45ns8XXSp483DELkcnUA2E2dzwoWV
	2XiqsCz7FyvicAPBQv3c8bo2huqVzaygmE+B1WeBHjUnHbqaww7JR+Br68DnxkDoHc+X4ODAB7U
	D4rM+1bxR5gfoVTnQynr6qnjPGcwAhbRKGtUj7aFzesZaf53mXeXF8uX5sxey3rHXYp0GSrOkqw
	yf8+CDRjgMOWPZkXSiqZiOPYMLXluSdcY6QqNtieAwYw9Ne/Dt5J+I8ES4h18f4fKmar+cFQFQ8
	X3R5umOMcf6n31ZhKLmdzHFMbvOv9FEvjHRkQ77HldwSVjYO3ukM2cmifL6Ium7HlBYb2jlsBjF
	ccDEf4O/Y37RmbSVQ2KEy3UsFsTRB6QNhveA3wI482oVTXPIZeY9KU19GDpCLSKxGDEGvgwnOCX
	j2ty/Gozr72Od96A+SBRP9F4vYm8+ZFLvO/R4UqCu8=
X-Received: by 2002:a17:90b:17c1:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3a813d7aa24mr202013a91.22.1791156909970;
        Sun, 04 Oct 2026 16:35:09 -0700 (PDT)
Received: from carrot.taila25129.ts.net (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78daef465sm8810002a91.1.2026.10.04.16.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:35:09 -0700 (PDT)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] nilfs2: simplify nilfs_mdt_writeback()
Date: Mon,  5 Oct 2026 08:31:06 +0900
Message-ID: <20261004233506.20802-1-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The writepages() callback for metadata files, nilfs_mdt_writeback(),
calls nilfs_mdt_write_folio() for each dirty folio via writeback_iter(),
where read-only superblock checks, folio dirty state clearing on error,
and triggering of the log writer via nilfs_construct_segment() are
performed.  This helper function is used nowhere else.

Executing these operations per folio is inefficient:

- Checking if the filesystem has fallen back to read-only mode is
  repeated redundantly.

- Calling nilfs_construct_segment() inside the per-folio loop causes
  redundant log writer invocations for a single sync request, where only
  the first invocation performs actual log writing.

Unfold nilfs_mdt_write_folio() into nilfs_mdt_writeback() and consolidate
these operations at the function level.  The read-only check is moved to
the top of nilfs_mdt_writeback(), replacing per-folio
nilfs_clear_folio_dirty() calls with a single nilfs_clear_dirty_pages()
call to discard dirty pages across the mapping at once.  Additionally,
nilfs_construct_segment() is invoked once when 'sync_mode' is WB_SYNC_ALL
and the mapping is tagged dirty.

With these operations consolidated outside the loop, the remaining
per-folio actions (calling folio_redirty_for_writepage() on already
dirty folios and unlocking them) serve no purpose, so the folio iteration
itself is removed.

Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
Viacheslav,

Please add this to the queue for the next cycle.

This refactors the metadata file writeback callback function,
restructuring an inefficient legacy function organization rooted in
the era of aops->writepage() to align with aops->writepages().

Thanks,
Ryusuke Konishi

 fs/nilfs2/mdt.c | 40 +++++++++++-----------------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
index b50c88b65183..77dc2be2ce65 100644
--- a/fs/nilfs2/mdt.c
+++ b/fs/nilfs2/mdt.c
@@ -391,51 +391,33 @@ int nilfs_mdt_fetch_dirty(struct inode *inode)
 	return test_bit(NILFS_I_DIRTY, &ii->i_state);
 }
 
-static int nilfs_mdt_write_folio(struct folio *folio,
+static int nilfs_mdt_writeback(struct address_space *mapping,
 		struct writeback_control *wbc)
 {
-	struct inode *inode = folio->mapping->host;
-	struct super_block *sb;
+	struct inode *inode = mapping->host;
 	int err = 0;
 
-	if (inode && sb_rdonly(inode->i_sb)) {
+	if (!inode)
+		return 0;
+
+	if (sb_rdonly(inode->i_sb)) {
 		/*
 		 * It means that filesystem was remounted in read-only
 		 * mode because of error or metadata corruption. But we
 		 * have dirty folios that try to be flushed in background.
-		 * So, here we simply discard this dirty folio.
+		 * So, here we simply discard these dirty folios.
 		 */
-		nilfs_clear_folio_dirty(folio, false);
-		folio_unlock(folio);
+		nilfs_clear_dirty_pages(mapping, false);
 		return -EROFS;
 	}
 
-	folio_redirty_for_writepage(wbc, folio);
-	folio_unlock(folio);
-
-	if (!inode)
-		return 0;
-
-	sb = inode->i_sb;
-
-	if (wbc->sync_mode == WB_SYNC_ALL)
-		err = nilfs_construct_segment(sb);
+	if (wbc->sync_mode == WB_SYNC_ALL &&
+		mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
+		err = nilfs_construct_segment(inode->i_sb);
 
 	return err;
 }
 
-static int nilfs_mdt_writeback(struct address_space *mapping,
-		struct writeback_control *wbc)
-{
-	struct folio *folio = NULL;
-	int error;
-
-	while ((folio = writeback_iter(mapping, wbc, folio, &error)))
-		error = nilfs_mdt_write_folio(folio, wbc);
-
-	return error;
-}
-
 static const struct address_space_operations def_mdt_aops = {
 	.dirty_folio		= block_dirty_folio,
 	.invalidate_folio	= block_invalidate_folio,
-- 
2.53.0

