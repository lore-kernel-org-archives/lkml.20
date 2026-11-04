Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785819;
	b=SfgDjzQR3zR3dk8eGMHmLxWgugWzVjqDqfk6lWWs5vW9s0r3Hm3p/zce13BCnMRz2bzX
	 Kzy3Ju/ZiiqIHoqd2GcO71jg9vY+WgK4Kg9uwVfpAFgBMqxQZQ00dFHvYsp4VqHwhfYBR
	 9IhjCvGfJd4sf0Cahx3IRUhOS1hzpg1dRejtwzwJMrW32T8joui7uEXMr8ZOOSDgXdN+n
	 txxQVGcJ32ZnkJeMLos7KRRWVzSDGEnIpIzmIZbogHeMiTlM4EYMhrdt3pFnJL+0T/IDU
	 nDY7MWa/Pn7HobZnI9NeZsUYiaacvz8uZ74WYxUzUTaTUKfCFa7y+Ly+TOmacJVcvSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=z9ahkQoGqY4LXm5ulXS80YZleTn1KGfrTqpEsVzzvjo=;
	b=zoQ6bEV6SWyQeUR5aVrda5l+MJ4VkMX/tqGSv8kVnOG39xvyeANoPiZUcutYS7AqbBk1
	 VWGf3/15sCNTcCX099d7JBRV/rrwn6DhrHu9NGHeEzBBjl4DB70OD3sbB/yHe8mCvU2Ae
	 yXPWdBmrGVJabbbjqKwYDV9ExzCT6iW8T4tcaqXxhU7mQ7y8ztwSU0AQiPbsUQA22NAch
	 MHm18mnwTbmUiPnig4tNLNY4APq5m2WPGzZDHXVKfPSBlo661oObWcpHYJSiUWMPbXNmU
	 AMfAEtJaNsmJavRcLbRAVyeYO/xF//GVdGCklm+bpNUYm2ZZMKf5B1pplC+bsTZFCOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7Wx2uuD;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BEE606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BEE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7Wx2uuD
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f33df08eso840745eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785818; x=1794390618; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9ahkQoGqY4LXm5ulXS80YZleTn1KGfrTqpEsVzzvjo=;
        b=R7Wx2uuDBgNls+XoNlqzt23IZkEGWU94ycKy8gvIwI2P7FjUK+MliwC8wupB57/+Z6
         rxW63Y/2vd+FDslj3mXWEG/NS2i4RuWieP1lCxwwlTTlXi8luo7EUzSPzvmWgukGHNre
         iUOuC0b216RNvkQDZgKhrIkJaxmQLvRmXKaX082SNqWiyXkDFIE3aOZiP6698LOem09T
         CVjuaPJgXj5XIxn7MwqGT0St47QT8uoDIc5Cq6ZdrWBV/p5LM9zFR+Or3YvapelgtbQL
         Xz8SypqHeP+IEcgZHTSdyMKDMpV0lfzGqAj095SFAOYDmmmAy6Igqb60WbJPseV7TBQ+
         INaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785818; x=1794390618;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9ahkQoGqY4LXm5ulXS80YZleTn1KGfrTqpEsVzzvjo=;
        b=izmH3aR2qIaGJdSIoMs8ZMibg11XwooR3W/YV+tBkN1zU4ZlaDH7mcILXu2J4eyxOQ
         T+0gfFjmSvveB7lszlKBxpxcqqNpvc3x1nGXjrhj1cqcuD8acXdyE6IyGS4FwlsrEVRG
         ApRLlcqxeCqRaKrjzjoNtQ2mwfm82w1eN2xIeiM4N5IOK3DVd4sUZSxqQ4FCpn+ennjC
         cD+w+wNbIrURZp9Hb1cRb6n/G3d3HwK8JqH7UZEcVNjEcqw5xMCb6S1TjJ1SXpV5xs3E
         ZX7DYvzvajdp6CkBICTkMaPmhnEABECd6ynU3yw5iZKdRw1e+Ae0Hc97OcupYQ7F8Tdp
         gGjw==
X-Forwarded-Encrypted: i=1; AKwUvBy/KkUMROHKx6kw49WDcgtWJW4rBvnkQmeuB8iy6Mq6l89Z6zKlqr19pC8/Z4CCFMh+VNkNY77WQ03FgTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z88/xixrN6I3Tigf/EfSBfymBABdzF2YVxalosfe28DC9oVx1LQ
	Ss3JBel2OlXU9eqtoWKBDJ66bkUaPx4ZAgUEO7u/IAwrdmUjnL8OsMXQHEXRVAjmvssOMggz
X-Gm-Gg: AYBFou2Wpro7MRO0c1eyUCWKrpXr7cr45DhCPrPLa0GzuG0w/TzIPA3gX/Jq9DQogF+
	JAmUXlYnwnI6lItlOLedUTnT6YxsvslW30+3BMRITXcPpBIMHOMdUGbQZeOPxBPKA76OZzx/dT2
	zOYy9EimsOUf/1O23EyEoLjCKFmfIpnGlIpIJIZit4ZDMumRMOaTHULTGnJhXTHX5amIyP2055i
	7L+Lo3OtAKAZAoSzemM7Z/BNL02PpMcbBSIYb1OkwVOXyfOLAl9YI1GOetEX7r9oCUfEzuDAKqq
	KMvfMzF2kV9WUPVsr6xRBIQURP6Qg8zqzWvhq0DA+nnFmzN8FnE/h4Q9JALCIZ4Hl5di/BzG0pP
	iy5gcKPr3LNfbaI7tJm/xNuwJEZ8OfTdpFfaJOeXgz/BaeQd9ygyAQjnpcOlTgYSl3bW2BKLa64
	+LMZT22tFsuIDBXkKRHhs+LSBYQKnEX0ZmJImJTqZgucsPdBKzcfpTLwkf/H4zSdfe46oZMkWF4
	DaQc9karBin5F17EhBfRbIBdI1Fb0/2175yNzJ5yZlKlG4LSx9XnvMDawB9Ulze0wk71ezJrlyM
	3zvCjBaMldNAGcRvyQWJDfmekDJrd74P/mEX/EDaqKetQIOp6LIrVYnSIw07jkRl+IROVF2rozA
	eEEVv3bp8LYO8
X-Received: by 2002:a05:7300:c01c:10b0:36a:50ec:db3f with SMTP id 5a478bee46e88-36a50ecdd21mr22929780eec.7.1793785817978;
        Wed, 04 Nov 2026 01:50:17 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca362f38asm7068083eec.0.2026.11.04.01.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:50:17 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:50:01 +0800
Subject: [PATCH] iio: buffer: hold a reference while DMA-BUF is attached
Message-ID: <179378580164.73301.2666197876060323279@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 paul@crapouillou.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

iio_buffer_attach_dmabuf() stores an IIO buffer pointer in the DMA-BUF
attachment without taking a buffer reference. A delayed DMA fence
completion can release the attachment after the IIO device has been
unbound and its buffer freed. The release callback then dereferences
the stale buffer while detaching the DMA-BUF.

Take a reference when storing the buffer in the attachment, and drop
it after the final detach or when the attach operation fails. This
keeps the buffer alive for the asynchronous completion path.

A KASAN-enabled test with a DMA-BUF-capable IIO test device reproduced
the use-after-free on the unmodified kernel. The same delayed
completion sequence produced no report with the change applied.

Fixes: 3e26d9f08fbe0 ("iio: core: Add new DMABUF interface infrastructure")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/iio/industrialio-buffer.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 4294101810fd7..bfa6d19471126 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1597,6 +1597,8 @@ static void iio_buffer_dmabuf_release(struct kref *ref)
 
 	buffer->access->detach_dmabuf(buffer, priv->block);
 
+	iio_buffer_put(buffer);
+
 	dma_buf_detach(attach->dmabuf, attach);
 	dma_buf_put(dmabuf);
 	kfree(priv);
@@ -1741,7 +1743,13 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 	}
 
 	kref_init(&priv->ref);
-	priv->buffer = buffer;
+	/*
+	 * Hold a reference for the asynchronous dmabuf completion path
+	 * (iio_buffer_cleanup() -> iio_buffer_dmabuf_put() may run from a
+	 * work item after the device has been unbound); released in
+	 * iio_buffer_dmabuf_release().
+	 */
+	priv->buffer = iio_buffer_get(buffer);
 	priv->attach = attach;
 	attach->importer_priv = priv;
 
@@ -1789,6 +1797,7 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
 err_dmabuf_put:
 	dma_buf_put(dmabuf);
 err_free_priv:
+	iio_buffer_put(priv->buffer);
 	kfree(priv);
 
 	return err;
-- 
2.34.1

