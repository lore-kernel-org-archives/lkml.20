Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500758;
	b=xrsq/3uYqzeh8SnWTkCpckhYuACfxj14339DlJq67zovOJd2bR/pVVh1bFERoiZAWuZ0
	 h+hjEMbPOuFwHwkis2QWd5IJuiUsaj1jsyY8sXWSdrTJ3GzCUHmZIbQw0L4Htwx264yS4
	 kZdpoOOGWn0pO42jNK/JbT4QF6yYlwjlEyUbUceCkRiKqkD+IYKZL/diJ53YepSUHkk1c
	 0MSuuM94ITBKOcapaAcawCSc+o2mdDRl2Wm+7TChDDQNP2Xrpk4g17UeX6NegKnqkxjaC
	 fFzc23kFIy3wgKwm2166GRgcUKo786WfCAhRUh5bOaRDc2ZBOmjFXwybkz5Zh59X+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K5OlwiJN896d/1knLEJqlVUMXIymRAuCbtD548JnU1U=;
	b=BqTC0yMNe2/FSsbcEkpvJ7xf6iYhOHkMb4rrYB9ifhmN1unr54INN7I8sJ+4fFAZ4LLh
	 yPCP351R6QWisN7OSqGIvaPQyEC3+/CzydWRsFUv+tORBTYF6Go1JFAfR9Btd126K6RlB
	 vqsctDXNAcIvmW6wS0hhKTkFV4EHQuXNV+7W8iS1XPYNzPt/i68p9tJDL06790aGien2g
	 vu5nC8t4Y6Y39QTWcGZ4z7HuS9Bdz1OT0pX9nHChvjvTrX2squV5yiClopLnsb6pyGpH9
	 JqptHuTeIm8BfY21BToMn3Pysk5UXXCPY0hxnvICODA6DLVXzIt4Jan5j7ghGtcwJHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SbB64Y7e;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EFE606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91EFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SbB64Y7e
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e901e114fdso15528725ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500758; x=1793105558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5OlwiJN896d/1knLEJqlVUMXIymRAuCbtD548JnU1U=;
        b=SbB64Y7eN2RD+RzP36Nk12lzyoC78uMs/jtg3ulnjCE+SZgFf742palyn6vO+gzoJy
         BNF3IKahm4H7eNwKLRDi3gWuKHgXe8boMG9TUVO9LWn+IF8LMgM7DLOvyk8NegBUXK9C
         kTcGmPje1wvvuWR1tD6uoU3/cabpn1cn/Ufe+kP5+QjFvC8VSJGC0aLpjKwLeNzxJGas
         iDgSkMEjzvy9ryjY89LndWNLMkcb5js9lcYU1D6rxGRn9WHHwL85tiryvbvoCrNQkOCD
         hr81ZmSDV0zJm9zEbAuZjkK+KS6Byv8BfxtVJavhY/Nd8WSoyWrguL8GDIbugKR1jVCn
         vVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500758; x=1793105558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5OlwiJN896d/1knLEJqlVUMXIymRAuCbtD548JnU1U=;
        b=i5NBacYIwcl1ZjF9CdLxLCxXvr5BeplivtSxhabcew0C+2K9+WaSL7LQ5KTcMWUr+1
         iDFZTEj9WxkQ/COVMwSQUswQ8Epxr6JMqEShvpuO03OBhutfoJYRE+zBQ3dFHxsRLusJ
         m2O1m191XgnuRdvfocD+hOvm2YPEjsIzvxh3MX6SrpMI6IP0cLY/D8PLbLqep3pJlRTc
         r0BDAQow7vYuD+fkUPcWuw47p2DBttp5GFRo8ts9xNq46/4uoMCqArjm0S8aZ5pHXM3y
         qVN/S4iXVt43NMrdfQPHBhpczj63Ya8yPxhzYkC4/nthT+DKWC8Wb1Eers4pTz6ynghD
         uf5g==
X-Forwarded-Encrypted: i=1; AKwUvBw1BOQMd1fN8WSN36YRmc1esRlGeGLqngCCD/McGgQMMV7QnReMwlu6oe5vTnSvU/C3/qx02b0mHrd/oyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDj52WmbO0RC0fdpm7QwBgUfeoHTZHqr6ID1HiQG0WLz23sZok
	v/q9rcAwOnwRBqrRDsaDOUIaD27TP6DNYYmA/bC8GgYvTbtD7mituGLo
X-Gm-Gg: AYBFou0P44B8XsjfhTO3cITIm5zGSN/q4SL2QzXQ7DwiEeyFMF8jSZNVtBuqt1nTgJF
	S5vJ4Bb9jJhzGzbl3jM7/Gg8r/WFXXq8dwQE5S3TC+nUSTsaWtjWJ8o6cOB21Cf1rhuZppC0Nr+
	PwTm/KKzaw5X+Lj1i0JWYELjnaAOMiDn5ImZEF9GDvh+nDFMU5MTPtNr2Gbr5hOTgSW3BKahuHH
	rWHpn3DZ8ZtwWmC8E2OdQBqLcktnwfvPZt/ph4yqDrcONbybHY5Xt0KhB7se9Epzlzf3LehF0UN
	pQKSawf2JmrZohQTCiJq9K3Rr0HKTPQum6txILGz2b1pgiH/pXw7gUHNftvjgcY1fcfijAHHnv4
	ptUukRnhPdHZo75mHQTH6PJ0837k0QnIiVYDAunzcATRijQDEUmr5GiPISmlLxHhBtNMzl8MFoq
	khnTLZgcjnoZX0MG9/fspoHP/47EZ1jx23psGWBgiYrdoN1rMTHlNBw9pkVNg2eJUbu1wnliApl
	osCc6EiB12QwClacF4Qw1s6mNLjY7S3YUtp9TKr7RdQqSC9Lwe1b8Y56w==
X-Received: by 2002:a17:902:fc86:b0:2e9:5971:122 with SMTP id d9443c01a7336-2e9a69eaa37mr87787165ad.12.1792500757958;
        Tue, 20 Oct 2026 05:52:37 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:2646::3d0:4a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151b6899sm11223135ad.76.2026.10.20.05.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:37 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+feeb9b5352b9ff89618a@syzkaller.appspotmail.com
Subject: [PATCH v3] block: annotate lockless task ioprio accesses
Date: Tue, 20 Oct 2026 19:52:33 +0700
Message-ID: <20261020125233.9820-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019125811.21666-1-ngocthang2710.1999@gmail.com>
References: <20261019125811.21666-1-ngocthang2710.1999@gmail.com>
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
v3:
- Move the comment out of the declarations and reword it (Damien).
  No code change.

v2:
- Document why no RCU is needed: only the owning task drops its io_context
  (Damien).  Comment in __get_task_ioprio() and a paragraph in the commit
  message.  No code change.
- v1: https://lore.kernel.org/r/20261018071636.79198-1-ngocthang2710.1999@gmail.com
- v2: https://lore.kernel.org/r/20261019125811.21666-1-ngocthang2710.1999@gmail.com

Tested with a KCSAN kernel in QEMU: 26 data-race reports per run before, 0
in two runs after (v1 code, later versions differ only in comments).
 block/blk-ioc.c        |  5 +++--
 include/linux/ioprio.h | 11 +++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

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
index 5210e8371238..be999cbe7c91 100644
--- a/include/linux/ioprio.h
+++ b/include/linux/ioprio.h
@@ -56,9 +56,16 @@ static inline int task_nice_ioclass(struct task_struct *task)
  */
 static inline int __get_task_ioprio(struct task_struct *p)
 {
-	struct io_context *ioc = p->io_context;
+	struct io_context *ioc;
 	int prio;
 
+	/*
+	 * Only the current task itself drops its io_context, in
+	 * exit_io_context(), so a non-NULL ioc is always valid.  However,
+	 * another task may change ->io_context or ioc->ioprio, so make sure
+	 * to get the latest value with READ_ONCE().
+	 */
+	ioc = READ_ONCE(p->io_context);
 	if (!ioc)
 		return IOPRIO_PRIO_VALUE(task_nice_ioclass(p),
 					 task_nice_ioprio(p));
@@ -66,7 +73,7 @@ static inline int __get_task_ioprio(struct task_struct *p)
 	if (p != current)
 		lockdep_assert_held(&p->alloc_lock);
 
-	prio = ioc->ioprio;
+	prio = READ_ONCE(ioc->ioprio);
 	if (IOPRIO_PRIO_CLASS(prio) == IOPRIO_CLASS_NONE)
 		prio = IOPRIO_PRIO_VALUE(task_nice_ioclass(p),
 					 task_nice_ioprio(p));
-- 
2.43.0

