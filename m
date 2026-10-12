Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29A235676A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811346; cv=none; b=boMQ4xzuIO2wQxhlas7gS83Smfqp+YjIFYnEpQfzMVDfY4M7xAPYdNptCvDyKcZC9tR5jvw8b+5CVUGFSC3TEqhG/yTw4O/Mq+at8qkh9Mecl3zMocMx8fmrpgJGoqfppeDLJ+m6o/imYJXO4iiWIBLbdgjzHwuTKxLY/RiXf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811346; c=relaxed/simple;
	bh=KjCLsZxRLcmrGnX3wW5CsVcfBq2PCkd0j2s8EAZ72rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HzIEpmIC+0rA/7FNxolmwEMsNwJ+Bzc8J7p0lFAOVIQXmSucv+RkP+7+sQOTbxA9LJRoOlkDSN+raqdQ17R0r8w3iEq86qsHgr0ZQXa0f/gBy4YO9kyz7E+ckhRBqP4DdijlSjXUj0wwBVklqLT/si9K7GQNAbp/SYJhUirJnKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6D1HD9T; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6D1HD9T"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e60f9af6e6so16571405ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811344; x=1792416144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mv8NtEZjLloAYySm4PvAEeW8+dLMN+Qs6To+I3pzm9c=;
        b=J6D1HD9TZkNvrsefy1XhdJe9qdu3XfuGlu2S9Oa66R5JQeHrL3Ks/xB86T0zRRO388
         n2eNVhxLKeewg1y32A3QcWreTJ7mx0sK9O1wwc1qZnReu7LlneHR8pI9/ZpjYansnZTJ
         Rmfp9wjKmHCsThyqs/UEjprINpViEBZ7KFouOUAg9bHnNk7R+ijY2uPvys3fDZ21BqTR
         BrVItehmQnfkoni2fOtWofd5u5pGdyHjeFlAnLa+WtVC33alfHuXlu3ofdEsGJebww+l
         YOYKNSLIDBiYxUoIqfhtwEKaKBZRzOGG4B8TWKEnZPA0mJ8+w0cgAhyqZ5IPQ89L4pdG
         nu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811344; x=1792416144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mv8NtEZjLloAYySm4PvAEeW8+dLMN+Qs6To+I3pzm9c=;
        b=Lj6NnCqMqDCCXK54n3yFY+hq1kSHPwJNqWjDOqYqmdo6CE6I3juj2W2wqk5gSTUNki
         IlgxtC9pDd7+xxzXiaR4A0hlB7HhvjP5t5lQMJXDnWIjaZZqeo8BUYK9AVuo8gwAgnPe
         KrR8lNaM3TeQo+QJmJWk8HSiB9ZTmyJ7aUB7epCtPIszLXrplUt8IiGh+gEFouR8l2SC
         wN4InsbRw3SbIquY6zqXdiJ7rAIJplyUiWlZOONHHKSBbAXc7YP0iPjWtCj/cV5KfiLO
         coV1i/H+CFdYrmk10WDkY0BdHV1i1WkQnVb0KzeGP8fCqpAQ47URwl6LIsKWwGksUWHm
         1QBA==
X-Forwarded-Encrypted: i=1; AKwUvBwOf9klSgnqhCYp4b/bieFgNrCW40ylKGkvEYsoEp+Jd8TtYHhraaJu/z1T1iV+9r1vylOGXrADx0LyMBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEfAo/QmsZNXMYGhsF7Of3TpCB7ij7v09cT4Gn4T/ioBhYUZiZ
	uqSeoz2Mv12Uj6fNJJUEi1EBQkAfSXqzlj0rmpz01UbeDRk65BeWS08GZO4TOvti
X-Gm-Gg: AYBFou28MLtGGe1o745QFIZKWOwPSoZViE1tY/Jyd/3hx16YPkvycy6s2IGLWhXqsja
	wkimtiiNlLxpzM3zjCh09EoU1IoDWJiLO5SxtBebyIWhHvk0I081/N1KO3/UIIODca7wl9HiGnN
	8jDFMD7QV5bCY0/XbAUUgBAky2K1i/auYYNV1PYq24JhQQJjW7UaQhQ5tguqap9tlXmfokgM8xo
	uGa7u+Dp9tNbkvBznEYvYY9PtQGv6YqIwD38sy5ZL+bs0oH3JItuMYtjLTqSlwBX8A8tHEOMoDv
	jFCeaF//DJJfzsFeEQ3kzgKGcAL6galP2gTFiUAZ8njVeRs4gxCrMR13RC/y6Cm/bMea2MKJ9g+
	9S0Tq7GqlD7VBp5enWPyKuZArrihNeg1F5qvT0jSUoW4J3uPQwJAGYE/VXF3MokJHO7RXiXgfea
	e1mmIbDM1nX8HdoIrCz6uOx2BUpQjjZ+0m0T1LreMkWobIL4lXr4h00t4OZHOYzQ0dyCKchw==
X-Received: by 2002:a17:902:e892:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2e842e1363emr90629255ad.39.1791811344018;
        Mon, 12 Oct 2026 06:22:24 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7aa0:50::3cf:23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1643sm44568765ad.70.2026.10.12.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:22:23 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+1cfd29c242c7cd26da02@syzkaller.appspotmail.com
Subject: [PATCH] fs/dcache: annotate the lockless d_unhashed() check in retain_dentry()
Date: Mon, 12 Oct 2026 20:22:18 +0700
Message-ID: <20261012132218.106771-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KCSAN reports a data race between __d_drop() clearing d_hash.pprev
and the d_unhashed() test in retain_dentry(), reached from fast_dput()
without ->d_lock held:

  BUG: KCSAN: data-race in dentry_kill / fast_dput

  write to 0xffff888107394e50 of 8 bytes by task 3667 on cpu 0:
   __d_drop fs/dcache.c:578 [inline]
   dentry_kill+0x139/0x500 fs/dcache.c:824
   finish_dput+0x16/0x1d0 fs/dcache.c:1001
   dput+0x48/0x50 fs/dcache.c:1042
   lookup_one_qstr_excl+0x156/0x240
   filename_unlinkat+0x149/0x410

  read to 0xffff888107394e50 of 8 bytes by task 3668 on cpu 1:
   hlist_bl_unhashed include/linux/list_bl.h:54 [inline]
   d_unhashed include/linux/dcache.h:396 [inline]
   retain_dentry fs/dcache.c:872 [inline]
   fast_dput+0x64/0x300 fs/dcache.c:971
   dput+0x1f/0x50 fs/dcache.c:1040
   handle_mounts fs/namei.c:1753 [inline]
   step_into_slowpath+0x38c/0x4c0 fs/namei.c:2104
   path_lookupat+0x2eb/0x4c0
   do_readlinkat+0x74/0x2f0

  value changed: 0xffff8882376dc230 -> 0x0000000000000000

The race is intentional. As the comment above retain_dentry() says,
without ->d_lock the predicates are not stable, and it is enough that
the dentry was hashed at some point after the reference was dropped.
If the lockless reader sees a stale "hashed" value, the dentry is kept
with a zero refcount, exactly as if it had been dropped just after the
check. If it sees "unhashed", it takes ->d_lock and rechecks. A single
aligned pointer load cannot tear, so neither outcome is harmful.

Mark the read with data_race() to document this and silence KCSAN.
No functional change.

Reproduced with the syzbot C reproducer on a KCSAN kernel in QEMU;
with this patch the dentry_kill race no longer shows up.

Reported-by: syzbot+1cfd29c242c7cd26da02@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1cfd29c242c7cd26da02
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/dcache.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index 1b1a81f10da6..3eb3d7e7ab0f 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -868,8 +868,9 @@ static inline bool retain_dentry(struct dentry *dentry, bool locked)
 	smp_rmb();
 	d_flags = READ_ONCE(dentry->d_flags);
 
-	// Unreachable? Nobody would be able to look it up, no point retaining
-	if (unlikely(d_unhashed(dentry)))
+	// Unreachable? Nobody would be able to look it up, no point retaining.
+	// Racy when !locked: a stale answer only costs a recheck under ->d_lock.
+	if (unlikely(data_race(d_unhashed(dentry))))
 		return false;
 
 	// Same if it's disconnected
-- 
2.43.0

