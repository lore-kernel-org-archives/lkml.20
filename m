Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756581;
	b=Ey6Oz4UYc0Gv9XPWeG7dzDo722T8X+nvUl+Ih9Fyb8Nu0biRycoNTQ7uB1vMSpdb5U0J
	 qINEDhVWI2zYrS7eiKCT/hpG3Wo4IWRWKq2cjYGTFEdbxEJm7gDroMTDsDgXCj7ZOi0yD
	 8sdf+AczgrtCmZf6Vlww8fI1nU2NLG85y0uwbbHpHv2UOh1iHYJCU1PYC3uf/V5UZnMAr
	 K9K+ms9JN9xx2ZVGcMp22u5hsHPGlhgcu6BUjdiL+zYfrA4zcPzf5Eroeq5kjQ9GAv7et
	 TWLLfBpCKh2l2As3fNbnnjrIrgouU3IDMhzC1/G3YRDPFyv7d4uaVe2gtPqTFJOpSIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5dCvo6bsmgCaQ8DMa8VWGE76Rg99fDHT/+IeuLzD3dU=;
	b=tWlt+kbf+tdjx/kuXEKx8NO4qCcvFNzF5rV68rMA+ZGrSz1StAZWYMsrIbvFSlTAE/Bq
	 pp+LBCMq+5rzeJaXl1bZGcchZJhD1UokhZnNKd3czhaXhIYtOyFf0gPxwS3Jzecxmxco7
	 0ZZFP+WPZBCbd98lz4CfP/M6o/jCMYsIO/8q69Qfi6GBTf+ru9mQI5kTJOWMUS4Y8EkUC
	 3lX5A1tVkjJliFwnCTbC8D6Xx4RzZzvxZLRQI/6x1HPR+3D0HnvbiBRs4Z2cnqDOqQus9
	 jWOZAvZk6EHJ9c2AVEY98hcxszDw3X/qF9qUxhI7+9fvwGfwV2MVVyCDmdGXLwa5BMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s+adkAZn;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4574606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4574606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s+adkAZn
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a264b6a06bso354621b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756580; x=1793361380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dCvo6bsmgCaQ8DMa8VWGE76Rg99fDHT/+IeuLzD3dU=;
        b=s+adkAZnr3Kn/RfzSY3qYmRNyUA+d6aAnEkHDvskSdcJXybOUl2qWdYoWfXIe/mRqw
         a2I3e04I28t18EGam2ykHEQ77LPPqltfwIrbBPbL+S22/YWcW2FvsOLK9O6robRcDIhU
         KqfB1+RThj2NzvK3U5/zZJJ4m4dFYwNmIM+YY5nGAy5wDPyQr7TgfFo3vPZ+nL/B5bvQ
         4D+yM3u2B0Baiv67oUg8R1eZcV7Qv659c0Bb75v0F6TT3yJ8Ywzwp928vOcENIpOZD/O
         4vVMO6vosD7KIzYUHnMA2vvfCDDHXAM1pZaaiC4UHsxPihzj7tV3OCHGY3lQkfJ/TCpG
         DOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756580; x=1793361380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dCvo6bsmgCaQ8DMa8VWGE76Rg99fDHT/+IeuLzD3dU=;
        b=iRXvAP/iZnz+r3tmg2Ld7j2fxtxZRJUAVqBrdadIbocugdlrrJSfw6Upp4GLqPadRF
         CQPqLO/v3smEbvZhwdc9bHh72bFy6QtnFdMX2ceqRy9Zn/mAlb4bVwYx9nO3q3trqj3B
         dX3YFl4jKMAEDdOFb65MCdmAkkXTgpKWWoLmD77TGXSNpZD9EQY3RilhQV0NyayhLKBm
         oY66ld0u86CZnuwvrKWBfgHWoEWD5iZDYrqz4daE9MIMPqw8PU60Oore83DrmWhpj4Ty
         npLi0aQQbzm3lR/7VvRGlhvY0LYOSCdrUjXP+l0cdeweFOsfQsv2Jn2NdNWQ+MBh+OWs
         8gbg==
X-Forwarded-Encrypted: i=1; AKwUvBzChW/iWpdsRsCDdCkAqUCaIm6O7FwwYcexTo5/b9x6Y2//beaNyr5YTgxvNvYGV7yoWPgBlGi3LTlmCfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMZpNqF2c3GpvcdO+rkS5f8dpUL/bXTk0SqsFX6g8na+tLLyUy
	hfdeyZXuj6IRRhoNIVgv+EJJvaaEjQ8CsRn6vrvHeNa29U/qly23GJlI
X-Gm-Gg: AYBFou3140KfAG1uqr+rvfgNs1M6U9CPgpVZNBWlEvu9gwo/c1MmlAosJqmYDWEDd8S
	dzZynmmuSAtmnStvS54hmHS/QqnAiq1IVETbAtyYPn3/SOsobhz0PpsNz6Lt44wwq+QWutuYdSr
	2qtkq7CJP8iyGnFwdJIpwwDyRevlYj1dUc3JY8aSHJ7Em/IfpmSz53x2NeEcy2pQ8LO9MGuLp45
	9nxUfdKUXG8cDV1dMaHbUztzdPnZmKpPKg7HW5dY9P758kDsvVH6mscWy95COB8Lc23OtjG01XI
	owzgCUNOe+wCPsQEvAG9laSdyXqT1GFFkK91dZOKEesWH5xw6ZoOxlUY7ij6d22Zcmp40228VdK
	AcCCb6xjlmWm/lgkw9YnOwi0Re76cPxv2i+2zSGbKvZ8O3rzd1aBHxKyO7uhIdWzsg4Gl/zX3Eh
	uhfrI2+pUbQsfjcTRv0FRnf6wQlMnLgfFhO+TvStO8cyzoq4Z3eSwHEN7ZAggWD2g+HQqKoqM8I
	F5AVpXMojeiAy0zrDopBbIPGtMe9g+qTHPziQU6NnE/YJBhkIq9z1Y=
X-Received: by 2002:a05:6a00:3496:b0:89f:d254:7c74 with SMTP id d2e1a72fcca58-8a2c626f0e5mr1846740b3a.9.1792756579962;
        Fri, 23 Oct 2026 04:56:19 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7ae0:50::498:6a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2d2948e11sm604419b3a.31.2026.10.23.04.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:56:19 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+feeb9b5352b9ff89618a@syzkaller.appspotmail.com
Subject: [PATCH v4] block: use READ_ONCE() to access the task io_context ioprio
Date: Fri, 23 Oct 2026 18:56:15 +0700
Message-ID: <20261023115615.12260-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020125233.9820-1-ngocthang2710.1999@gmail.com>
References: <20261020125233.9820-1-ngocthang2710.1999@gmail.com>
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
priority, but the compiler may tear or refetch the accesses.

The io_context itself needs no extra protection: only the owning task
drops it, in exit_io_context(), so it cannot be freed under a lockless
reader running as current.

Read the pointer and ->ioprio with READ_ONCE() and write ->ioprio with
WRITE_ONCE().  Publish a new io_context with smp_store_release() so that
its initialization is visible before the pointer.  The reader only
dereferences the pointer it loaded, so the address dependency of
READ_ONCE() is enough to pair with the release, as with
rcu_assign_pointer() and rcu_dereference(); an acquire is not needed.

Reported-by: syzbot+feeb9b5352b9ff89618a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=feeb9b5352b9ff89618a
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v4:
- Retitle: "annotate" was too vague (Damien).
- Explain in the commit message and in a comment why smp_store_release()
  pairs with READ_ONCE() and not smp_load_acquire(): the reader only uses
  the loaded pointer, so the address dependency orders the access, as in
  rcu_assign_pointer()/rcu_dereference().  No code change.

v3: https://lore.kernel.org/r/20261020125233.9820-1-ngocthang2710.1999@gmail.com

Tested with a KCSAN kernel in QEMU: 26 data-race reports per run before, 0
in two runs after (v1 code, later versions differ only in comments).
 block/blk-ioc.c        |  9 +++++++--
 include/linux/ioprio.h | 11 +++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/block/blk-ioc.c b/block/blk-ioc.c
index d15918d7fabb..fac62f2858ec 100644
--- a/block/blk-ioc.c
+++ b/block/blk-ioc.c
@@ -277,9 +277,14 @@ int set_task_ioprio(struct task_struct *task, int ioprio)
 		if (task->io_context)
 			kmem_cache_free(iocontext_cachep, ioc);
 		else
-			task->io_context = ioc;
+			/*
+			 * Make the ioc initialization visible before the
+			 * pointer.  Readers use READ_ONCE(), whose address
+			 * dependency is enough, like rcu_dereference().
+			 */
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

