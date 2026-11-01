Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793550678;
	b=uUlv+TEIjBTOTaBktSopoe/g4JtulmXJSbFOO3IB1oUmLMiIHLncUkTmQkF2iAMnOAac
	 0DpY979sKFQj6n7bxBEHReE0fQPRsuis/83md5U7by+TAFxM+kDv68GXrgAIV8OXdImEk
	 DmNTbEBYbNVqvfnOzaO6nNpNBQY0ZWUiizHREkctA8O2fP0jpIELCfdlD5Jrl4rKhOqhU
	 RNt0vqrzUtUFTZqXBPUUg+aSe2xLBtFFtpwFkx8hi7HqHnrW8rYA+wJgBtYtmeFJtmzEx
	 NUhnTS8G+hUZeBZkNUbyeccdTefN6VfpVYB+0XUIBC0nXWcMDSNMHMl0Hfgch2ib8sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793550678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
	b=FlId+LJ5pcluW+aAWewYrIIBn13aEgmow5zsIEKP40kd0qBKV6jYv/Pp4/N8PJEMiQhZ
	 de1lgZjKIJd/HkRsRVR6tr/IhApXC5uhN1aibPEXRCoYBx71PfiyxbYB0S6ITZdnJNNoj
	 RMF84fYidHVhfYPk5m6HuZ9mvEEHkB5FK/w4UCAdCyCb7rNBhka+YlFEuh7h0U6Os6fvk
	 oIh0WQ7af7NdxVzSMZGcU2twTCL/8hvhu3qNPGpxCP8dLfkbjnmCYr4aM+352bEmteT+n
	 /pZ74H5+vKgoOylJcAOnFw0mnlY2CK8X6DWA9Ou7xhZLm2hTurQGiaSEeohgWadfWYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xz7o3aNL;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D786E606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D786E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xz7o3aNL
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso416051a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793550677; x=1794155477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=Xz7o3aNLu0EcXJgkFcpNcT9ms9XQbE9FRhuapUyst6lLzOD/XqlbsiUKQjSNbt7WM1
         mustLlBcHK3qKFtAQoCHJ435p/Z+T+JOF7KRfAdSeF3D7q3Uqn8bslYV/P3gC1nDZXAl
         oq1ATQwO2pb8mWXr+dGI5e/gLbKhz06tDjmK9Y5F/5kqAITu6JtGWJZkYg51oc20Pomo
         a2jffLkunx9lY9Z54vt6p7d837s6aRRzT4e6sBF5eEgbIxR5Sc2aVtzqtcg21db9MS6W
         Dm6GmZ9OKvOjbAXBtZdaTWQsUWhEKkITcHgwjc0cvjcI4/M+zz5iZcXbNsamCBuEKev2
         2kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550677; x=1794155477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1wgGnLaHoKZu2/+Ud078CAK3gozxrFVUFtZdHR2t7Q=;
        b=qG/8yE8gHlVgWMMNyfb6NzyCDq8XgBLgPSgDg8DIhWkrF+r1hg3JuK5kkWV4/xgH+y
         FwM3cLTM1kp8owmWXVqkLRYxlO4N8EFYZIOxEP54UFpgJO+JLtaRa9L0+SiwCXi8Bsoo
         LBJQIzgMEYoD4A6jTqm0us5yhEjmnWUDzo2xUlEk+4JNm02tijEZsRXIvqBux59AupPD
         dVECj/7bUacxDRz8iJWONXkUQr/BCGA8LSbLXqLyZq+NYtgLnmO08QsfjBkMmszgGclW
         EOJHtxcna0XM+ITh6dodlG7rvw3lZqHlm1CX9K/FexlDcFsPT0IbZ8TicmlSlhEnBq90
         1PjQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0IT1Ddg2e91OOf6StFaqx/aTE5Ae1RKY4/PddsG+G13lCrcBtvXM8XPCRU1PeAaG5A4TAMOgpDPozGJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BRy18NmBfsZ9TORJTKNz+jw2uQJrMmnJgmtyFcVeQpnVyBjmQ
	wnCcfIo/VucXrnxq/g+1nXyMVb2tbSWgLoQJbLjeeU+7V8jNL+lycwIv
X-Gm-Gg: AYBFou0qMLs6pTH2vnOXul4xVGzzKldT8uuunb7w6uUN0AwfzglYBreuGFPJqlUEWJ9
	yCkMydiV6kpbttAu0bjHMzv2zm4gohXZMTZDNAxquJwZ5X1hD4u6F+yknO44tg9RrhnVx0bXKEp
	bQElwqwSC1JCVB3Q0xPsp6UjwvWHS9ASjLqwYUHXtuu51r45osPkDUTEdQMS0sDY3vcylxCqTzi
	jly9R/knUY0iwkJFmTYiHEFlX/CM9gz+cDYbZ3Z09Mv5tGgbUUIG5VoIOj82Xjsfa25KuB7eAl1
	uw7YZUSlR+THL2r3jKLOTuKoZMDirdSBOcpwEBsplTfreKXva562ikkr9Mg5NFwgcwkFLGd9U7P
	2eRzOWJyea9mizdtK3S4hVLXMW2tE68q40WKocRqt+235OoRmD+zSy18GQ/17tZkLUB/NVWy1Ry
	0QgEUwqUdKXCHiTM8YCAqBRvW4uSvpMfjjTGBSSGT+W5dGCEa0CLHqHHFPWiLZTd+oM33zAL8ds
	nP9FsxfJ2ySV9BBsu09sIejNpD9DU1alZpDgI/0/isiM0oWbijV4rOgUidM0Rjnqg6HkFs+Fisl
	vgS8+GA9qmlrxAe41VSbaCZXKxQaHG3nvaqkxx0X4bOuAN3adlk1TjR35fOprlbahsSYlDF3cjJ
	mwENie/QKBkB2+03Q6iboqHo=
X-Received: by 2002:a17:90b:2cc6:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3ae89292da7mr11229213a91.0.1793550676949;
        Sun, 01 Nov 2026 08:31:16 -0800 (PST)
Received: from localhost.localdomain ([113.102.236.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e944ba9sm15038585a91.8.2026.11.01.08.31.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 08:31:16 -0800 (PST)
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
Date: Mon,  2 Nov 2026 00:31:06 +0800
Message-ID: <20261101163107.55037-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
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

