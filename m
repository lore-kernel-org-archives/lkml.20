Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794120581;
	b=ldYONPqOexFlWOnCVY3eyFJb+mPtOwKg/UUxi8sRjh4k9v55eRqZGuHBXCL3nGgZRZOa
	 U0Ca1yNH5wIQ7jLlqI0sd4gf+/qJb7b8gpKi8P2eTKheosfsYxeH4R3e1NrKAQr7ghpJG
	 QilBn8zVeMqFjUWTD1HQNz7y2l0aPxTiNooJf0mlKMd5OkFWsKOwcAjnjLe57IDRokaBW
	 M4G3jJdugiV4CI9n5UdOI49oIvMIUkX2/r00m6hAoybI5YPhD3N30mv/2DPbb/IywIRl6
	 d1x3lMoztqPPIPXHSq3dszg57NjosJkW7XEsaRVTJifjWji4+L+C3KL7p7jiCaUCgSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794120581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x7Z+RUwPNkJfYSyvADI+2XwTh8BlG6SdiyklPwWIP7I=;
	b=McFnBO8CF69IMDQQW4SwfMTqYxSRu6DAt9G6cDCtVVXq7IpkVbj+a9GVaFrL1oMxCNdO
	 BowIEPVuiSVSApW/erxDU2U7bVBxwTQNtvwwd2MxCMUG5sFkCDCnyBRY+7DVR5+drGNcf
	 Ch8i311Q0RUQM5oqtb0XNRzo4ofUmIVYJM+xMGAt6J3R94GyDScT2h3dInyBQXA6e+aFf
	 dWjEwzUvHSELWCqSAaIro3jfR8aSCQmv+Mk+YAUxvX8yCVMVqTltKcMoz/I5m00Epagha
	 I2p+uuAvkMO0X7qt3NiKfrcTQeZS8BuWvDPCcA+v8SnFEZKYkQmlYWE0UkgqRBtL1zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJ6EVQFZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DD606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 06:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 742DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJ6EVQFZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1625735e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 22:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794120580; x=1794725380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7Z+RUwPNkJfYSyvADI+2XwTh8BlG6SdiyklPwWIP7I=;
        b=iJ6EVQFZqUc1JCULdiEBgNJ84P54mp7p0pzC8E12y44CcymFXp95DeiwtpJutyDQks
         djQPxTSogG61m8a/JgFTnpVeM/4lTbS9gfuxk06kfcT0DBMiBvLa8W7MCcCEtJ553TDU
         q2SmlgloURYCXaAiwAtgrUV8e+Efjvh1PBAxlFtLf8ZD3owfPIgDc2gGL8RUhjzl3Czj
         XTzv06fF3xab+Dx2oGntk1Fc4Qfw/rVua8BT0hGWjTBkdarjSWKcVyX7Vhp1tN6eOLmS
         WzD38G4NnWMmjOLhWLJM+tHoeuacn3xcC71IiBCX/w0fd/U3O5Hmxh/F5LrYUNfICGiH
         3tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794120580; x=1794725380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7Z+RUwPNkJfYSyvADI+2XwTh8BlG6SdiyklPwWIP7I=;
        b=jMsb4yN+N022QsLK+07ilo9ibTOCDeeahft1fDbuFTr6d6dhZFu0s9UadgO2bVTK3C
         Ee8OpYNalCO9QITjbbjf8ijiJ7lpIw55ZCWdZEbtAH5YXtv7bDMETwuwqhQ5WqMlHvzz
         uHcnBBvWuEp2IR2aTzLJ4nswslkt2jQKONCAMpvgPqSpgZuiFFWIJEJD7rw2R4nd0++M
         4a84Qr7VhyBCQ+zEqXC3/qirEHwEguIG7SFFesiir7ph2pC32gk8NKz604fqmNmIkQEK
         IUXZ1vwPsyMxvYhNzeKKQWv9sBv/74fz6abUxk5pcQZxB8d73Gt/NX8ChVibS8G3oVVq
         ehrA==
X-Forwarded-Encrypted: i=1; AKwUvBz3IN0ujRrCnvxLRi0DfjJLROGoQ7ETX8nzGXvzK3h2XAQ0vEzHlDdrS0l+mxCYqqiyJuWuzowHkBIjT8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S/unxYg6lyFMDFP38susX/+JKNIXRp21pduc1aZJGArbVwYpD
	au2QUFE0Cn3Jycr6hOHjuUhAJudSl7o3RLf8Zh9PV9M4Fv6kflDOSxLG
X-Gm-Gg: AYBFou1Pa2snBkj8+EOcWSD6ybUBqFUp7PKTPTbSOKId4kYGki+kc9KmbPqpTMc6l8l
	jxH1GEXV8i+Wubgb+jQARDbbRspR/j45lM0Wk+wn2nmiYhKyuJK+4P7G+R4rOERmykL6t63IqER
	1UelP0+L1Td4RN2nMgN/koBejwWzNy7TgguhdogIRat1sWI7kyDIl6z4rQYI6CQ/DypRvDvh3Y7
	L6a1Wb2Ltj/oLQmGSClt8iIpji1Zs/9aK74pphOflbmcn/U3RuAzfbFecxgZt05LSiuzizUItOT
	loIajH6RcJuvoB4DeC3soQnTQl+6wEV5cMdg5q6svXtTVSTeQQsVKTu0ShYNfttIymO1f9aO7pn
	zUQiyKKm7pYfpNNPFK/VbAAlaPavkqjf43liIf5SlAXgARdAK2LHihwTIWn5BsrlwinC55BDmcF
	EXUxUb9BqZqUkWmrPYia+RKvD9xSj3pWY93fz3GW+kebvQ4Hi09a+yFDZ9CD+xOgFRCdRJho+bm
	vDssrafhfYA6qfKxyN2HQUH+J6tUvVgH5IaDhzOfMMifQsNOaCtksuzhEUsvBNsQljrgVhgy2Db
	dx3KpbkUcse77LbM+IcVw4LEfqAYpWjZs0zWvfe1znjddA==
X-Received: by 2002:a05:600c:8712:b0:4b3:6900:280c with SMTP id 5b1f17b1804b1-4b963c7d013mr12738155e9.19.1794120579685;
        Sat, 07 Nov 2026 22:49:39 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:475e:f800:9c3f:1631:3855:dec8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b8fdda3358sm37582945e9.0.2026.11.07.22.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 22:49:39 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: richardcochran@gmail.com,
	netdev@vger.kernel.org
Cc: horms@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	arnd@arndb.de,
	john.stultz@linaro.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH net v2] ptp: Report clock removal to poll waiters
Date: Sun,  8 Nov 2026 08:49:29 +0200
Message-ID: <20261108064928.1931917-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ptp_clock_unregister() marks the clock defunct and wakes timestamp
waiters before posix_clock_unregister() marks it a zombie. A poll
waiter can consume the removal wakeup while the event queue is empty,
return no events, and remain blocked until timeout after device
removal.

Using netdevsim's mock PTP clock in an x86_64 QEMU/KVM guest,
the unpatched kernel missed all eight epoll removal notifications.
The four poll waits returned POLLERR only at timeout. With this
patch, all 12 poll and epoll waits reported clock removal promptly.

Check the defunct state after registering the poll wait queue and
return EPOLLERR when the clock is being removed. Use READ_ONCE() for
the lockless defunct checks and WRITE_ONCE() for the unregister store.

Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

v2:
  - ddress Sashiko's v1 review, forwarded by Simon Horman, by pairing
    the new READ_ONCE() with WRITE_ONCE() in ptp_clock_unregister() and
    using READ_ONCE() for both ptp_read() checks
  - the v1 poll fix already addressed the observed removal scenario,
    these changes are really just to make the lockless accesses consistent

v1: https://lore.kernel.org/r/20261102122340.1160733-1-thnkslprpt@gmail.com/
 drivers/ptp/ptp_chardev.c | 8 ++++++--
 drivers/ptp/ptp_clock.c   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index f63b45f5ee6a..dc5865e95f77 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -593,6 +593,9 @@ __poll_t ptp_poll(struct posix_clock_context *pccontext, struct file *fp,
 
 	poll_wait(fp, &ptp->tsev_wq, wait);
 
+	if (READ_ONCE(ptp->defunct))
+		return EPOLLERR;
+
 	return queue_cnt(queue) ? EPOLLIN : 0;
 }
 
@@ -616,10 +619,11 @@ ssize_t ptp_read(struct posix_clock_context *pccontext, uint rdflags,
 	if (cnt > EXTTS_BUFSIZE)
 		cnt = EXTTS_BUFSIZE;
 
-	if (wait_event_interruptible(ptp->tsev_wq, ptp->defunct || queue_cnt(queue)))
+	if (wait_event_interruptible(ptp->tsev_wq,
+				     READ_ONCE(ptp->defunct) || queue_cnt(queue)))
 		return -ERESTARTSYS;
 
-	if (ptp->defunct)
+	if (READ_ONCE(ptp->defunct))
 		return -ENODEV;
 
 	event = kmalloc(EXTTS_BUFSIZE, GFP_KERNEL);
diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 4111342d64f0..d2640325abf7 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -518,7 +518,7 @@ int ptp_clock_unregister(struct ptp_clock *ptp)
 	get_device(&ptp->dev);
 
 	/* Wake up any userspace waiting for an event. */
-	ptp->defunct = 1;
+	WRITE_ONCE(ptp->defunct, 1);
 	wake_up_interruptible(&ptp->tsev_wq);
 
 	/* Tear down the POSIX clock, which removes the user interface. */
-- 
2.43.0

