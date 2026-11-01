Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793550681;
	b=DEP6M2iWGONIqTUK8cDJ+zJadpXMrSQotGkL9BV+8iFL+0vaabSnfhiiBFMqnyK12fGl
	 OmMPQdWsdjJmegdwPXQE5QptImPYyGaQ3kgS4q6exa+xkuKtErpxGN4J58oKbowPELdIG
	 afyPiahStk/3j9DKgajxNo872lSBfbZRFAwrXS7DVL0ZUYSJwf/mbYSQAEJonh6FbFqa6
	 IU5pJnfPwJlEkyFeuiV1aqqLj7FVENuBqL9QFcFKInmioKKY4A3Oi/1NrlIC39ILCysqZ
	 G6fBvzzjVMzIDGwXSGZKU6CuYKQc1SXxfzf8He0pTqeNoAio+JwjlwMEkK3EZ4Hp9GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793550681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
	b=zTKfRVCF0t1w8apdC8z+VXvBrgI4rKOGxQp0oTPE5C56qmdLzHRzqDyrNZ0h3QiESO0S
	 Q4ff6J9e8+Kbld7FWKQnoNnKRsqmnpThDzqQGVhsW9E05R2QvN495Y+MR+cAQp96gTBf4
	 oyUdozrtt0dB8xVfH5ACZjjesLbZz7mQkninMI1ACNq/6LGprZ5LsDU9cqhXads/WAu8D
	 TBo6miMkofGmuVsOC9QvMbnhXxJ6L/iLZDNVchBt6pQiANNlLbveYeG5QEkzoedCeWNNK
	 2d4+VpvpDuthwrvl03m8oEflOiyUtyEhqr0O7sG10knqmrByI8Hx87n9qT5+YahGsMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JA4m2Ns4;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D8606A330
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 440D8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JA4m2Ns4
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac6008c914so292442a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793550681; x=1794155481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=JA4m2Ns40pxtAJ0B0P+Apj0Caferb//RL/RdbQHGvGyLjmAJ661bHSRKsH+u2pLmEo
         zWKn9R+UAQGSmuZ1egI7pZtERHb9SFkWQnl1Vqp/ubDT6tl9Qit7v3WxzGD5tdi0f+GY
         k5iGNn2FuVCnoDLnbLAA3LyL9PQbXS56aetV9r1dfywrCDD6QlcM0yKhgfujFVp8ENxq
         N/sQKIQS0xdl2lNlXCYQFwrdLZFvZk95ig1EzRjTspquwegJ3b8Jhq8Z4ihMIdXhTG1o
         P84pi9y54esfjSEl3eibipuoKv7er51jnmxtor9rbbV2guKpA6Rxz02UTyARgHvo6Wlk
         NLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550681; x=1794155481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=onkz+URvinbhFez4Mppg8GMECjVIYqzS2QKh9EZDoH1CGynLtXttuZJ4Xz4hUNsYzc
         hyBf9wVfMqBWXx3lKU5OjwH0UzbxWs2aP/m1lsoSUm1JNacKTebRqcwgWFlKQLYXaKYs
         UUOzu/y11hkL5AmOnWJZDTcnyXYokjRN+zC1JZbHCFcJnVPggxLzBdLV5+VM8X10sPue
         vQlf7KZr1rK4j+/gay4mZQ+Bh61hgQuz5LdxVxu5W9asdLCPIAVwm5njlD2XUJu0EGAz
         pmzYe1+2OOWckdlzZoB+36A2RYqayW7EC4UPd4dtx+Tjw+RERtv4V6IWL5sJ0Vnxgsfb
         ng2w==
X-Forwarded-Encrypted: i=1; AKwUvByHThkcs8Bix5YB9zpQxI9L7eawhHnE4oqUOO0RYSGBw36SIpu+CgRXHbUQ70W5qJccmYy9vPFt+mq9bxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//PaE2jSPHUifxxvd/cb3SQkaKnjGSO/iqMGKAx9bj84HbJLIO
	XuWs4I7VFAE+4CusDNtPRK90L1/+IuhpaKp/s4ZxM0BqKChKW/79Do2H
X-Gm-Gg: AYBFou3Uw65SjcExVEOvcQmQL5JEm5qnLPoAOhEHJkN6E1sGPBExCaqqB1drMXTPiB0
	d3YaH6HPiuHSEINKyKnaDcp7ap1TfeL8tir6NdRi7+Tn9YoZN5AzbmjWrDCw2jV9CAsaKmVb/+B
	PqcQRTw1VFAd5msp+JyViooyPQg057WzS+Cs/a7O+upu1QRdG2PQFe076wbzdszSemwQxV4gOGj
	oujRjzl+Y+NiVsUM/8ALZGV64hzKn/MIlHIZH+6E1kKTu8rNcJZgfdoCAbCs30lzdHpcx18gQbk
	BV+uLcrN0ulzhRmccQuG0FP4EzzVDjrJ6aGkHKS5+D8GRobuKz/pZgLI8r55ZVJT4iOJrKzzXyQ
	dCaOotgy57+xr1XIWxP8ReBrA2bPFeH1euf9YWjn8+c97mJS5pK/+1kSlEBeg+VYItpMx90pW33
	mnON4Tlqw7DDbzAErE4sKSjkFAjJYQaehRdFj00A9T/VtqjuU6DBHn6X9vqPsieeVqrL7Jy5d/u
	XCsQRLSpeE8aMb3utV6x4V3TfA0vRkvTwY5gWqJTZNVSC4tu0bfYJLAiAWN3091kHJLdFcLXfsf
	4OGj/qrqP6CSkQWbQqfrBEDp5rnJZoFOrTfEKEAgwRsFqOcYqYEWmP8m88YdjDobRaSDcIl0jes
	/afp9/pk5qELVu4cuCtfCyDU=
X-Received: by 2002:a17:90b:28c7:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3ae897f82c4mr10848258a91.5.1793550680657;
        Sun, 01 Nov 2026 08:31:20 -0800 (PST)
Received: from localhost.localdomain ([113.102.236.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e944ba9sm15038585a91.8.2026.11.01.08.31.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 08:31:20 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org,
	Qihang <q.h.hack.winter@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] xen/privcmd: fix double free when an irqfd is shut down twice
Date: Mon,  2 Nov 2026 00:31:07 +0800
Message-ID: <20261101163107.55037-2-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101163107.55037-1-q.h.hack.winter@gmail.com>
References: <20261101163107.55037-1-q.h.hack.winter@gmail.com>
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

irqfd_deactivate() takes the irqfd off irqfds_list and queues
irqfd_shutdown().  queue_work() is not a once-only gate: it refuses to
enqueue a work item only while WORK_STRUCT_PENDING is set, and
process_one_work() clears that bit before it calls the work function.  So
nothing records that the shutdown work has already been queued, and
nothing protects the window between the start of irqfd_shutdown() and the
kfree() at its end.

Two paths call irqfd_deactivate() for the same irqfd:

  - privcmd_irqfd_deassign(), from the PRIVCMD_IRQFD_FLAG_DEASSIGN ioctl;

  - irqfd_wakeup(), with EPOLLHUP set, when the last reference to the
    eventfd file goes away, which runs wake_up_poll(&ctx->wqh, EPOLLHUP)
    from eventfd_release().

irqfds_lock serialises the two calls, but it does not make the second one
a no-op, and eventfd_ctx_fdget() takes a reference to the eventfd_ctx,
not to the struct file, so the last fd can still be closed while the
ioctl is running:

  CPU0                                 CPU1

  eventfd_ctx_fdget()
  spin_lock(irqfds_lock)
  list_del_init(&kirqfd->list)
  queue_work(&kirqfd->shutdown)        close(fd)
                                         eventfd_release()
                                           wake_up_poll(EPOLLHUP)
                                         irqfd_wakeup()
                                         spin_lock(irqfds_lock)
                                         irqfd_deactivate() again

If the work item has already started by then, its pending bit has been
cleared and the second queue_work() succeeds.  irqfd_shutdown() then runs
twice, so eventfd_ctx_remove_wait_queue(), eventfd_ctx_put() and kfree()
each hit the same object a second time; and when the second queue_work()
lands after the irqfd has been freed, the workqueue list operations write
to freed memory.

virt/kvm/eventfd.c has the same two callers and has had this guard since
the original irqfd support (721eecbf4fe99): irqfd_wakeup() calls
irqfd_deactivate() only if irqfd_is_active().  The comment there explains
why that is enough: the other side deactivates the irqfd before it takes
it off the waitqueue, and irqfd_shutdown() needs the waitqueue lock,
which this callback holds, so the irqfd cannot be freed under it.

Do the same here.  list_del_init() leaves the list head empty and the
irqfd stays off the list until kfree(), so it serves as a one-way
"active" flag.  The test is in irqfd_deactivate() rather than in
irqfd_wakeup() because privcmd_irqfd_deassign() walks irqfds_list and can
therefore never reach an inactive irqfd; only the wakeup path can, and a
single test covers both callers.

Fixes: f8941e6c4c712 ("xen: privcmd: Add support for irqfd")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 drivers/xen/privcmd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 5e56fbc934478..221b31611343e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -901,10 +901,25 @@ struct privcmd_kernel_irqfd {
 	poll_table pt;
 };
 
+static bool irqfd_is_active(struct privcmd_kernel_irqfd *kirqfd)
+{
+	lockdep_assert_held(&irqfds_lock);
+
+	return !list_empty(&kirqfd->list);
+}
+
 static void irqfd_deactivate(struct privcmd_kernel_irqfd *kirqfd)
 {
 	lockdep_assert_held(&irqfds_lock);
 
+	/*
+	 * Both the deassign ioctl and the eventfd wakeup path can reach
+	 * this function.  list_del_init() marks the irqfd inactive, so
+	 * only the first caller may queue the shutdown work.
+	 */
+	if (!irqfd_is_active(kirqfd))
+		return;
+
 	list_del_init(&kirqfd->list);
 	queue_work(irqfd_cleanup_wq, &kirqfd->shutdown);
 }
-- 
2.54.0 (Apple Git-157)

