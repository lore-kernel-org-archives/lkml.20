Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532493246E8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270281; cv=none; b=AfYvfg4eVLdJyjEUnUY3AQ8dnTVilEiTIlqjNfmDiD+ZHE5RKDGc89attQK92LErbKXVxA/QAW7odxoiwYmZpNtzdKrO4ORN2GPCCI5XS0+D5Hwbu23tmIW347ekxpxe6tLHHO8QxqP8tVF+1Ci+jIDFjfmyz0BpBBR9WY3o944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270281; c=relaxed/simple;
	bh=rkZ5ijmpJAGxeoOVO7yyUbFq4Mbbp5IQA48pR+FRNS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJZbA3LuKQGOwix/9fwGwu9gQPnrA7nPxvM7aUj4NrTyMgXDnEGEJ7ThCKGg/hRVPZJtpWzSjGrqp7kL1i2SX+MXUjkRJJsfP8PYjdfcl8EJQAH+OzvY7MmC4aC+x2hXyFC0RoaZB97inrtm1xqa+iTNChEXmpmBKeuLvvd3hsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYFGEr26; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYFGEr26"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d5cad1a6baso46054375ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270280; x=1788875080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4Oo1S4jAyEm4Xw/DK4VzIEPmxMTMVWIQhiDyGj7k1E=;
        b=kYFGEr26KJ8fa1xg9UvRRZUGfYSMrX7DpGnvoPL7deIxQeWfR7ZwsS/df4eVHofk+a
         S0h96pFjDg0tYfe9CJF/ZwNDwS+cYWW1ru5DMHMiYwACKcza8GLTrr8WBbQAjbiBge3M
         anD76pbHYeNchRP8kLwAZ+SX84xDK/6EAklleN2AjVe7PyExPw7Kc9U/8oEiiQ4bALjS
         +v6/rOFYOzT8K6XUYsNKMT6vDmhCyV9iVArrR43zFCyll+XxWmKZxJxgEMJ2N+eqIQtP
         4EKawjY1tfQ2A/+eks5eRFqt9czvcPlRdxmQfGDF26mg8G83YcbjvQLfvqlvRidDxwR/
         OP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270280; x=1788875080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4Oo1S4jAyEm4Xw/DK4VzIEPmxMTMVWIQhiDyGj7k1E=;
        b=DAdx9jsiyfX0k/BSNfue9CJ9F5lNIdSiL3HXKgR65KvyZNSujs/9ps8c4YXPIQx7aW
         PeQ4iWg4Mqvxfzl7RWKIr3YRF+QLQSWSqofafnZiBLTJpAqYTANlTXQuWaKVDd4sGRa9
         7NCIRF/LvvIh94Owgqb86uvmOTqR1VNCH3wP44tthnI0+B83JtCvsHJ637SHIIMOAEDq
         /7W6AR5yCKuezg1iF3rrRHkVFk9bDPJyajj4sWhfHvYJk8TA5F1GtcFBhazv0uHin988
         W6+ZEBM+7sOUWmay0aAtjuYt5aWNT02LdDcqyvs+t0lhf3TBf1E1SALxa4q7LWN1akgi
         kHog==
X-Gm-Message-State: AFuF++mglwHrhcKCnJwBsbpWdQ2Bnroh0FKhySvkl2xy2Ym54xigsaN5
	kvaW39a41A3YFRaD+7A5PNFTYqBxN625c9t8JxXKAC12CUctSxbctgDp
X-Gm-Gg: AR+sD13myx0tUvm3Y6cWAvh8CcmOh9z2zbMP219drB01CGNy9EjYOGZv43kWRpYEr9n
	Lsh2MOkug1qqnA9MN7kix6KbNgsDPmLtYzBtGgKDfHmj9pKo6aEIh47rOt3758r2GUwKN6UXM6e
	LRXoQKhboI2TDku/hkzjhh47JiODU4sAME2vqqiKaCgMBMmm3/6K+ayvW9f80qXznl3MgWhnmKK
	cyfJJWUaW2DqhrznLmEeQgI5NZNdlgvQZtUgbpXyMb6cIzqEYHZegr9tx1Swm7OEJokVTBiKeRK
	PYQ7StH99NXc/87aWCNWx7U71e5L+ILcZGNxiP/prXMxFvCzsIUI+sOQun8ncUOD3kQUwsDrzlx
	p83nBuFF7EAHakQbUVf5VudsKhlzFV+/AIXwvX42NNKjsctoYHzP9eUckFSfjx/yXFuHAm2QPrp
	B8XYsvsLcktOqxVhCTzK83Nu+5rLYtCGs5WpD4GmYhdq3XkNMKdkBWe6omuKkLP6wAWF7GyoY=
X-Received: by 2002:a17:903:1b30:b0:2d8:d4d3:da4e with SMTP id d9443c01a7336-2d94a90efd6mr141688925ad.18.1788270279390;
        Tue, 01 Sep 2026 06:44:39 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fc0c9sm52461455ad.2.2026.09.01.06.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:44:38 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: konishi.ryusuke@gmail.com,
	linux-nilfs@vger.kernel.org,
	slava@dubeyko.com
Cc: linux-kernel@vger.kernel.org,
	r772577952@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] nilfs2: clear folio dirty flag when copying back from the shadow map
Date: Tue,  1 Sep 2026 21:44:30 +0800
Message-ID: <20260901134430.1292467-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While garbage collection runs, nilfs2 keeps a shadow copy of the DAT
metadata file's page cache so that it can roll the file back if GC
fails.  The rollback has two steps: nilfs_clear_dirty_pages() drops the
dirty state of the folios in the DAT cache, then nilfs_copy_back_pages()
overwrites them with the saved contents.  The second step warns if it
still finds a dirty folio, because the first step is supposed to have
cleared every one of them:

	/* overwrite existing folio in the destination cache */
	WARN_ON(folio_test_dirty(dfolio));

Clearing has been best-effort since commit ca76bb226bf4 ("nilfs2: do not
force clear folio if buffer is referenced"): nilfs_clear_folio_dirty()
leaves a folio dirty if a buffer head under it is still busy.  Reading
metadata creates such buffers.  nilfs_mdt_read_block() submits
read-ahead for the blocks following the one it was asked for and waits
only for that one, so the read-ahead buffers are still locked when it
returns.  When the block size is smaller than the page size, several
metadata blocks share a folio, so a single folio can hold both a dirty
block and a locked read-ahead buffer.  Such a folio survives the
clearing step, and the copy-back warns on it.

Use __nilfs_clear_folio_dirty() to clear the dirty flag of the
destination folio before overwriting it, rather than making
nilfs_clear_folio_dirty() force-clear busy buffer heads again.

Fixes: ca76bb226bf4 ("nilfs2: do not force clear folio if buffer is referenced")
Closes: https://lore.kernel.org/lkml/CANypQFZSYrtcshnUzOPiqatyLd-M8_OReOewQoAi_V5yY0dTtg@mail.gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 fs/nilfs2/page.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index cf4f1c6798f5..b26d9c3bda6d 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -328,7 +328,8 @@ void nilfs_copy_back_pages(struct address_space *dmap,
 		dfolio = filemap_lock_folio(dmap, index);
 		if (!IS_ERR(dfolio)) {
 			/* overwrite existing folio in the destination cache */
-			WARN_ON(folio_test_dirty(dfolio));
+			if (unlikely(folio_test_dirty(dfolio)))
+				__nilfs_clear_folio_dirty(dfolio);
 			nilfs_copy_folio(dfolio, folio, false);
 			folio_unlock(dfolio);
 			folio_put(dfolio);
-- 
2.43.0

