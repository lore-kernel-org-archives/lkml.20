Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2744E5341
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414699; cv=none; b=SxF76hOsVkNHL9L8W1iubLNH1n7yyShvEFUBYIVqeTgOa7zsPXfEfNv46tO/MbUAjYR4VasQtWEDmKXM2mbtYt1LbRcdjrH6bMmwrfjeTNSjwPzhOEhSptJfN07E+G7t0XsTQuCKS7zxUBw6e3MdK2mBgEKvSeI0U+NOZxNwMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414699; c=relaxed/simple;
	bh=uyOP+tG8v685A3a1n/dqAIYQe1Z74x5GrtGIbaRiQnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl4wE3OBUHZAPEDCcaK/wOp4Ao2tz5O9SaF/qNsyE+UYNDoGplXqrvs5GbDcLcitNQWWGrpp2HuC8XRuOHun9WhHVEXMQ5Tqr8twrmL0PhdhTwMuRBc+XizSkQ68CLLEpyjjQfrbz6N7d3FUfXqpCg45Sa+n7UgN+Czev4M0z7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6un1pXa; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6un1pXa"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1213361b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414697; x=1793019497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkMZq+uSgui/Ahp3XWrqkllCggzYIHX41EJvO2PAjAg=;
        b=P6un1pXaVtfzK70KlSPubB1v9Ar9FrQ6N0TUJcrEOEYjtjgDGRBl/08MXgvuukYaSI
         rJGmCLMf+6d/6/J402GTfAvcjzXEUqiTmhRR/tUIZE86Nqg9qvY5jYl77ftwrh+kCMOp
         GkgqaTkN+0qyq8n+kHW9HPfXNlpBE2OewcS8Y3VNOGqQJgd7pKTdXTM2FZQ/TgTYpyKr
         u1LmZEX1JSUY6p+EbHD8+Z8CIN7tl+u/e1PAM4czaZ/M+r9cN76RGho5ffFHJ8/ZpThJ
         J3A68Si8xDmjl8/qzq/jntJEw/DOOv/Ejb8cnu81h2abAI0xlMxRDWZ1/eG/hZafspQx
         UuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414697; x=1793019497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkMZq+uSgui/Ahp3XWrqkllCggzYIHX41EJvO2PAjAg=;
        b=VBJ/LJTN6LzaTehoAmR1uRBGopJphOyV0QCSEqe6+maJClFVR+oyaImXDtENK1d2iG
         e+6kNcJOC+54gJs8ABLK+cjyOcaLRLW7PvUsTgU3tj5ByzEJ5NVj3/iFazop2ZWg92hc
         lJu7JcuS398o+ynoc4piFmGqKjooMGbHkXgVI63YQvGCbf8w4ygtPMYBwSpESed+Sjce
         0bNeG2J2Ti7zNEsti5602fvPTqsG0IwhfOsp2iGE9E+4kpRiwpTeYMEiKGJiDInRh1VA
         SRPPL2tIWuVUyN3/Gf/qrj+kVQOIKdlXorpQ9nXUXRwMH6OdBvGzTGgiCDnX7qx8YvAs
         HLXA==
X-Forwarded-Encrypted: i=1; AKwUvBy70XxyLbfXHPAYJQ+Fd/YWGb9EQfVxm8/yOTNarMOInMHRokfzeqZYjnLTrbhmCBrf86K0o+6V4IYZ9rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl1vf65qZV3Wn+AfpvKWVe4MIQ55stCXOtNweaQ8woY3zoiUUJ
	Jg3APEtraPPji2uC9zQ0UJFZy5hTTqncwp2PYKLraqJ9+vERTrFrJ0hH
X-Gm-Gg: AYBFou1r8ChgV848Vo/ZNIEGB5lpMNKY3mMJ7qzlyB+1flMfqC6gYkBJyq42k1QzDG+
	xoEnVgEaPH00LzlJYoZjj0ojGGXPtDAOa3HXBxa4sd8DdyWSUaruq8mElszAv5g0Icet1p4D4Wk
	yU4rFqsQNNhG9pnmJqzNV8GdlJQyK1co+cUcqut9kFyZgM12TZ62Ii1MKZJFOekJOdJY2ydTkLS
	oS/RaAyQNc975HkxGWB88wdRlryPhqbJ8hw9Vj17+C490/sB6kuNI57BcQ2DegQKL3eNenri5AT
	wyo/ZMFC2TQ6sRNvcE3k+yTvZztaRPbJ98klrtO8wxggq2LDho72zPP1+oi4VzjjCAW2KUa0jBV
	3RarBZhtEhqQcSwmbEaO52XiEcGD1jFm1+GIRbQ69Bt554jjd+81HEf8OJbEitRnZzuv1Obn9VV
	5M1fUao/iYbwGM7Q0rKJfgYJjNBQP6jkmQz63cguzTOxDfnUhokiobfKhUNS+QDbLBvZ26Ww==
X-Received: by 2002:a05:6a00:1f12:b0:880:973d:597a with SMTP id d2e1a72fcca58-8a04d04e513mr6085397b3a.53.1792414696945;
        Mon, 19 Oct 2026 05:58:16 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a076ea456asm277972b3a.6.2026.10.19.05.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:58:16 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+feeb9b5352b9ff89618a@syzkaller.appspotmail.com
Subject: [PATCH v2] block: annotate lockless task ioprio accesses
Date: Mon, 19 Oct 2026 19:58:11 +0700
Message-ID: <20261019125811.21666-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018071636.79198-1-ngocthang2710.1999@gmail.com>
References: <20261018071636.79198-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__get_task_ioprio() reads task->io_context and ioc->ioprio without
task_lock() when called on current, e.g. from init_sync_kiocb() on every
write.  set_task_ioprio() can update both for another task at any time,
including the first publication of a new io_context.  KCSAN reports it:

  BUG: KCSAN: data-race in __kernel_write_iter / set_task_ioprio
  value changed: 0x0000000000000000 -> 0xffff888109813730

A stale or torn value is harmless, a task simply gets the old or new
priority, but the compiler may tear or refetch the accesses and the
io_context fields must be visible before the pointer is.

The io_context itself needs no extra protection: only the owning task
drops it, in exit_io_context(), so it cannot be freed under a lockless
reader running as current.

Publish the pointer with smp_store_release(), read it with READ_ONCE()
(address dependency orders the ioprio load), and mark the ioprio
accesses.

Reported-by: syzbot+feeb9b5352b9ff89618a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=feeb9b5352b9ff89618a
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2:
- Document why no RCU is needed: only the owning task drops its io_context
  (Damien).  Comment in __get_task_ioprio() and a paragraph in the commit
  message.  No code change.
- v1: https://lore.kernel.org/r/20261018071636.79198-1-ngocthang2710.1999@gmail.com

Tested with a KCSAN kernel in QEMU: 26 data-race reports per run before, 0
in two runs after (v1 code, v2 differs only in comments).
 block/blk-ioc.c        | 5 +++--
 include/linux/ioprio.h | 9 +++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/block/blk-ioc.c b/block/blk-ioc.c
index d15918d7fabb..12ddc672f41d 100644
--- a/block/blk-ioc.c
+++ b/block/blk-ioc.c
@@ -277,9 +277,10 @@ int set_task_ioprio(struct task_struct *task, int ioprio)
 		if (task->io_context)
 			kmem_cache_free(iocontext_cachep, ioc);
 		else
-			task->io_context = ioc;
+			/* Pairs with READ_ONCE() in __get_task_ioprio() */
+			smp_store_release(&task->io_context, ioc);
 	}
-	task->io_context->ioprio = ioprio;
+	WRITE_ONCE(task->io_context->ioprio, ioprio);
 out:
 	task_unlock(task);
 	return 0;
diff --git a/include/linux/ioprio.h b/include/linux/ioprio.h
index 5210e8371238..d148548691c7 100644
--- a/include/linux/ioprio.h
+++ b/include/linux/ioprio.h
@@ -56,7 +56,12 @@ static inline int task_nice_ioclass(struct task_struct *task)
  */
 static inline int __get_task_ioprio(struct task_struct *p)
 {
-	struct io_context *ioc = p->io_context;
+	/*
+	 * Only the task itself drops its io_context (exit_io_context()), so
+	 * for p == current a non-NULL ioc stays valid.  Another task can
+	 * still install it or change ->ioprio, hence the annotations.
+	 */
+	struct io_context *ioc = READ_ONCE(p->io_context);
 	int prio;
 
 	if (!ioc)
@@ -66,7 +71,7 @@ static inline int __get_task_ioprio(struct task_struct *p)
 	if (p != current)
 		lockdep_assert_held(&p->alloc_lock);
 
-	prio = ioc->ioprio;
+	prio = READ_ONCE(ioc->ioprio);
 	if (IOPRIO_PRIO_CLASS(prio) == IOPRIO_CLASS_NONE)
 		prio = IOPRIO_PRIO_VALUE(task_nice_ioclass(p),
 					 task_nice_ioprio(p));
-- 
2.43.0

