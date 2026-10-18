Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307923C4B79
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307803; cv=none; b=TpvUpCpwaxaeNJEYW3ZVSQt9RpuCrvojDe/EV6F4arfPkf3lnyuM/AY0yDzJFC+rZHfLinIuBiBcbVje0DmZfVDF2XPdgppfm7ZIREB2iDnqBFBfgGbdPUSqYt31hWE/PSJu/RfslFYUG5dNuOfwg7pcgGawbRVNYGrlw8u23Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307803; c=relaxed/simple;
	bh=nvVFUq/61qzab7zOKRtEl9kkbUwupZvr5gTkYS91nQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQ7EReND4aqiFHSrasBRD4mUPhKyIX/R5VcpRztQPu3poE/XIqPJJP9eSkg+ph4Ti56Bn2ERBlybjo59rqtsq+It4WGvF7Tgf+5hjVzLl4lye2jbnXDcaTNdhVWB72sS4SmTj7ZJB5y28ikSWFfIij3JM0X/nofOua2784BA43g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aj1iBFTd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aj1iBFTd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e940d5d2beso3998305ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792307801; x=1792912601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fm+8hE4os7LvlJdHIvQMczxhBtCibQ83SWWXxfbxmcs=;
        b=aj1iBFTdSwsKANMPlPG0PyzmeE6Ym+3QmMHp6nleL2ctUTQRbK74jj5m10EtAbJ+zq
         eoSnHTpaN6nVF/4VnLnAXBZGyZXA8pioglIEAf9F8oTJ1u1okkUlrQIFSMuchJVfZpRt
         ifew6+ncepgYjCwaUwxh5n3EPpFr7KfC3LJn5APhmwoSBmkUQs3QtINEtpa4KsLp7Ph+
         19mG1q22g4biYJliI1Hx3A76MVUB+UAJEyiajSHp8qWrDSDf9bDAIYMyPLZxib90sRKz
         oQbszV5t/ydq43kYtJErGC8+RKUkDYmtDmLx+VuQ4mKnIHsWS/il/50mB90fsN0zoVjQ
         817w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307801; x=1792912601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fm+8hE4os7LvlJdHIvQMczxhBtCibQ83SWWXxfbxmcs=;
        b=mvRrElDluIRNpZq1zpCl7xITrjOk6rmYSnq+cR9yGG+N0dE5U7e9UL1Nf621CsAeJj
         bimD8eIXBWQkSFvK52/JUcLItCyADz7PoqaoeSxJ8CGXbIMkJqQeRnFBQDZLpBvbNHt3
         9ttTlGgu4rTzt3yA8XCBpD/5z+aA1EmLlba03kC/n4E1BHowMvpBEKSUGlKf+Unr6UiR
         6XiYm6FTXm/QALPGr/AyX0VJCNzquzKZoRmdwaRZk+TdL1mrIVXqm9x6dWUGQpdd3wu3
         5U2uqpXxcptsVsPvxRspgiiCfI0MRPbmCEX6ThlFM5nlsTEAluqggFQ9VK39TVPYo1BS
         Ud2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3TdSK8iVldbezUjx+xfOsguodRvf9bTjhk0soKVfM6TuWlQeZ3AfThzNGeAo1239RQTI9wIJOqR8hUlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2ggeYwsHM5OlTUC+ZJyp3qe84kfTMrx4CgxQk4sdt2Yc3Djyo
	uULMZhM5nF5tzoEWHSYFz1Xsl5ZOAzUcMTefqVtcEiBkj1wUwnben47AT7xds4rm
X-Gm-Gg: AYBFou1hd+CYK5ayckTgBLeN/Z7y7Hijwv4HmekRcPLovrOaAGZgfH6qiheZGs1047R
	RpMNF3RbKfwUoQKin75RaUhx7deGokqDGdVH+ApWu4MwP5RbY+Fh1cXM8Q5NbXc5mTyG3OaL+Jd
	oAkQR/1B99lgVuI9jEvROHNKYZxK4XH6SJUamnnIwLXVUaJLnI9Bp5McUPotAkP0ha8zyCRvNIZ
	62vcMXV6g4tsF8tCAvRVCAgGGEhAh+HuQsuCtFbR5B2dScqjXUCdQlxMdmToJHlPxnQzDaA+a53
	HllGbKNy/DPPPux+xtyNsJSumX9XBhQ3qnvrg50M84cB/rQQljYdHZ5VloK/0yDQaee3c6j7KDr
	BmHgqh5NYJBHBoQrSUqoGEUpU56jt9iAtftfho2X4p8ruZfQvVoz68WBAX2CegFhX64UWTB21vx
	gAB6kLhOE2uY007jiAnS3VatDB8HDcgfPky0vP2UM2WTTOCTSV+ug0BdOtFHCofa0CfOuebA==
X-Received: by 2002:a17:902:ce11:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e9a68d91bfmr36318835ad.22.1792307801324;
        Sun, 18 Oct 2026 00:16:41 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7ac0:50::3d0:3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e835063sm26509325ad.33.2026.10.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:16:40 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+feeb9b5352b9ff89618a@syzkaller.appspotmail.com
Subject: [PATCH] block: annotate lockless task ioprio accesses
Date: Sun, 18 Oct 2026 14:16:36 +0700
Message-ID: <20261018071636.79198-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Publish the pointer with smp_store_release(), read it with READ_ONCE()
(address dependency orders the ioprio load), and mark the ioprio
accesses.

Reported-by: syzbot+feeb9b5352b9ff89618a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=feeb9b5352b9ff89618a
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested with a KCSAN kernel in QEMU. syzbot's coredump repro is too slow to hit
the window, so a thread loops pwrite() on a tmpfs file while the main thread
does the first ioprio_set() on its tid (~35k iterations per run). Same pair,
same "0 -> pointer" value change: 26 reports per run before, 0 in two runs
after. No Fixes: tag, the history I have is grafted.
 block/blk-ioc.c        | 5 +++--
 include/linux/ioprio.h | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

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
index 5210e8371238..56371e9ea306 100644
--- a/include/linux/ioprio.h
+++ b/include/linux/ioprio.h
@@ -56,7 +56,8 @@ static inline int task_nice_ioclass(struct task_struct *task)
  */
 static inline int __get_task_ioprio(struct task_struct *p)
 {
-	struct io_context *ioc = p->io_context;
+	/* Paired with smp_store_release() in set_task_ioprio() */
+	struct io_context *ioc = READ_ONCE(p->io_context);
 	int prio;
 
 	if (!ioc)
@@ -66,7 +67,7 @@ static inline int __get_task_ioprio(struct task_struct *p)
 	if (p != current)
 		lockdep_assert_held(&p->alloc_lock);
 
-	prio = ioc->ioprio;
+	prio = READ_ONCE(ioc->ioprio);
 	if (IOPRIO_PRIO_CLASS(prio) == IOPRIO_CLASS_NONE)
 		prio = IOPRIO_PRIO_VALUE(task_nice_ioclass(p),
 					 task_nice_ioprio(p));
-- 
2.43.0

