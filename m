Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662583E9C1E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806634; cv=none; b=tZECHcpL+tvV/JihoKuvDlQTjVRz8bpTqV/eNMs5GIhFvZWwmbRHLZzEF7H0+RwRB2ZB60wU0r0oOkZQE556ZN5v+mbbDbxJnHXBcNpDp2IVpuQgDb5Z82h4wuv7g4zWl8ls0pbU78jD2z5VMY1DnbZOU7ck/LOIBBq68BE2uwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806634; c=relaxed/simple;
	bh=8nYNe+jFCSGCbZkYJ0reOL0GEmHxcDol25mK1GmPrvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ge/3FmatpQZYraDagr6NyS6GW7GtvzXq68z7J2scCg+dhdBIOzB+R9h/LMLdS3JbW2pYnX6qif/Y04zYwlIfsAwl5ufkTjRbiIWZ+FxK4qN+iuZHLekGU2RJP4YPGU8DmJdfg0wC1g5lWCPYAtTsUkeOGuZJcnM5mKZJZRn6qig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izqtfutB; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izqtfutB"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so1049192a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806633; x=1792411433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOmdfS1EZyi4lRyYFKG0c8OF7Kjs14HuhHIl44z8ViE=;
        b=izqtfutBWF6xLfZXzVwXEiE1n7YTKNQcIG3raPzJfZZZrjMqKGQPctvokeQhuZWJQl
         83bDCHPvzv4Ly94lB/nRfC4b5jyrRtKXtaVrb2YyMuww44Bp8gkwun1gp4AeragWaUQR
         TY3lGCZWAj5wXMJF3sz29SNYtkq2uNbi8L7U2VoAkGIuuTxZ1sPX96i0zvZ2QEUkLhBS
         UWRP4TAxDWzObXbvMwEiBSADdRUXDp3gROYQV5Jok7x9/epaFIQKiKh4dFe4iTRWNL76
         nS4QRzXI8Is16m8HJD85ShBMIkZXwhk6sxWc/3VQjWfJmIl+Uli2rAghh1ui5+L1GoeM
         jsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806633; x=1792411433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOmdfS1EZyi4lRyYFKG0c8OF7Kjs14HuhHIl44z8ViE=;
        b=ODWoIqezHMj2Pb9VHTuFnMkipni0xIEqwXyFmqMWEc5apbifHwnxB4XPGn0ZSxiuvN
         8bpw27R77dUc2/zdI6PeH2UpOa+k3hqUAlpx45oOQ1LnGutFUZds7145ntl100wN8VI3
         qZ3tnEWswpzbz+dBUbrI9B2v2GTLpqMcYfnCntN9ECFMIWUeqfJdukekrtnR81Demhna
         GBdFRnbxp/TCUuky6P42nHSqyod1MhFrySTbxsxjENm997W5N9SQQnCVRzIJdW0LoyED
         7V/X9P6oQe4VBhtK9m6rmwFVPUeXA9rIv/MgLhdGRygLwmx6jVSUlgOatMW8VHtAQaTi
         MM9A==
X-Forwarded-Encrypted: i=1; AKwUvBw2kufbkcHYmxzvpGtYLaD+BgdUZg4+T5l7pmqJpjAzgs7Lu5UGunbrsge2lL6FcCU10yMrGj0WJscfQ1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF3EkylXaOzOKBsVQhRf3pha8f6FMoSWhBQ76eHiRl+xD994LW
	DB223UNMM394BSfiJ4HsZQMe+zODClPq6zVSNh5nfzFgSgtoJyVUL192
X-Gm-Gg: AYBFou3EbPJyshatljjn15a13+U0JPDyn6L0nNg/esw/I/ILFnq04mVgA8Y8n3LJkad
	XzkXpuc0Z8QBmBeVFqa1I1Fw09X3+Hy0kRsWJxAg0jaLol+uHaZ/TWKEXY7bJSn05cBOiaCuSOv
	U6wI9M16JrqZD/ZA2bu3WVcD4QtwLbZM3FKrZPuiAlOV9Z2PA+zT+2Mzcz8DW3QUGsAZntui8MJ
	NTjDyRYxl2b353NLgsZynVSyGSMz7DJlvzlwfq9t9bHQM4c0mUUz6Sj8FDCnbJ4bH0PkirwiNNb
	IGwokItkPZGLxI4vy5LQIfMDXUYp9x/PntXKTb1XlazwI9flxGIMZ9foh44XROoYeSEcng+uCN6
	TxBBO4233zk+SlK464e/Jay5VQh+Wxc0ePpC13c3nz0b6vKe+zdyga5Eww6xUOLg9bOU/HX4a9p
	rg+usZ0wU6xrYLpIfTKaUieLWzZ2J1Hj6rPf/SDoA7P72UTl240MEZk/Loui/RT+hLcuD9nA==
X-Received: by 2002:a05:6a21:600f:b0:3dd:85aa:4533 with SMTP id adf61e73a8af0-3e16be72365mr7368666637.37.1791806632582;
        Mon, 12 Oct 2026 05:03:52 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7aa0:50::3cf:23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c37e267csm4005882b3a.27.2026.10.12.05.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:03:51 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Subject: [PATCH v2] printk: annotate the intentional data race on the data block id
Date: Mon, 12 Oct 2026 19:03:39 +0700
Message-ID: <20261012120341.12423-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

data_alloc() stores the descriptor ID into a newly reserved data block
while data_make_reusable(), running from data_push_tail() on another CPU,
may still be loading the ID from the same area. The ringbuffer allows
this race: a stale or garbage ID simply fails the descriptor lookup or
the blk_lpos check. KCSAN nevertheless reports it.

Annotate the accesses with data_race() instead of READ_ONCE()/WRITE_ONCE(),
which would needlessly restrict compiler optimizations for a race that is
allowed by design. No functional change.

Reported-by: syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8324b8fd984b86905a66
Fixes: 896fbe20b4e2 ("printk: use the lockless ringbuffer")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2: use data_race() instead of READ_ONCE()/WRITE_ONCE(), as suggested by
    John Ogness. v1: https://lore.kernel.org/all/20261011091755.303723-1-ngocthang2710.1999@gmail.com/

 kernel/printk/printk_ringbuffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 85c0c854b3ce..ff25c55971e8 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -605,7 +605,7 @@ static bool data_make_reusable(struct printk_ringbuffer *rb,
 		 * sure it points back to this data block. If the check fails,
 		 * the data area has been recycled by another writer.
 		 */
-		id = blk->id; /* LMM(data_make_reusable:A) */
+		id = data_race(blk->id); /* LMM(data_make_reusable:A) */
 
 		d_state = desc_read(desc_ring, id, &desc,
 				    NULL, NULL); /* LMM(data_make_reusable:B) */
@@ -1113,7 +1113,7 @@ static char *data_alloc(struct printk_ringbuffer *rb, unsigned int size,
 					  next_lpos)); /* LMM(data_alloc:A) */
 
 	blk = to_block(data_ring, begin_lpos);
-	blk->id = id; /* LMM(data_alloc:B) */
+	data_race(blk->id = id); /* LMM(data_alloc:B) */
 
 	if (is_blk_wrapped(data_ring, begin_lpos, next_lpos)) {
 		/* Wrapping data blocks store their data at the beginning. */
@@ -1123,7 +1123,7 @@ static char *data_alloc(struct printk_ringbuffer *rb, unsigned int size,
 		 * Store the ID on the wrapped block for consistency.
 		 * The printk_ringbuffer does not actually use it.
 		 */
-		blk->id = id;
+		data_race(blk->id = id); /* see data_make_reusable:A */
 	}
 
 	blk_lpos->begin = begin_lpos;
@@ -1212,7 +1212,7 @@ static char *data_realloc(struct printk_ringbuffer *rb, unsigned int size,
 		 * Store the ID on the wrapped block for consistency.
 		 * The printk_ringbuffer does not actually use it.
 		 */
-		blk->id = id;
+		data_race(blk->id = id); /* see data_make_reusable:A */
 
 		if (!wrapped) {
 			/*
-- 
2.43.0

