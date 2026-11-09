Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223706;
	b=shUFDjFFCto4VTCGjTvsaCA3AuIrDg5RnDu/wCBsjZXLu9Fq5r+Utj75lTyjOd4xSJdW
	 gTEqTOUbQdbmYcQuVmQUrtSM/yfsn0KBz1g1Nxj1Ke6Xhi39dPAhJtXvO/rBPySZeOcvz
	 a6eyqFhE0Ru8VEfbegNveVE4Yt4XaEre7TY47wKFhHrPpIVDl/DjZDTYEfjjel32JXflH
	 OGHzIHYFf0HmnfF4RrPeBv9MiJyGOwUI5rdkVlf00yIXtAqjTOOV2Fnekaui3v7D3a2ZI
	 aiLgbYBYqbou6PoNPuzk/FxMVqFv9Uxs+G+PArfDqfanMtMlp+46hB1jzSiJBCku4NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=4tw+IF5aQngUQm4ayIz8HVZjcjZZWFvwMMAFsCc9hwU=;
	b=iHL92TGqMA/0rfRJ1GB8Uv8gtvEiW9Fqy6neOaaVewmc3Kh6xGZIpbaRQZoj+3BuEe57
	 AEokzj3xewh7E6YxJwLbob1IRJYoOMpClQCMZCcyYDNlZWXScDVcbz2nVfQUV2U6HQ/Tu
	 mx9kyeUm9KH+9Hg3O+i2te7ZKY4/duMH8C0gqb2lv7BJUTzSX4rtBi1c6jxN8o2CDVREN
	 mFzliKeZgYmn0JV87GjeMgtQPvPYFWIxUwsBs8keMC//FDe446n/D/eEtnrmGIvqQJwAi
	 iNssSfDqMRoEpa66zceRwbwZmFL7/hoxZ9024vtHbN0+ETcpK+MxmRGH7nSVRVmBv/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2ncWKGo;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E047D606D804
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E047D606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2ncWKGo
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a49a022221so6661321fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223704; x=1794828504; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4tw+IF5aQngUQm4ayIz8HVZjcjZZWFvwMMAFsCc9hwU=;
        b=o2ncWKGoK0i4/+DVA8voEoyBLT4opwHX+bw24fcA8OuNz52IoRCVDMG+LGZsry0mIE
         0ATWJ518GAGfb5gMvkpz0IGiFydCiXaRXaH892r/K5eUUabeki34mUeRig7K37VoJfrb
         uw9m0JdsLIWtZmypO2RJ7Y/XtTRsPUiTFYz4tg+cbDo+4xekERCPd52rhb3tya+8yfMJ
         i1IQpeNsJJ+QI0tDQBLWKM9rESt5utG55gGijo2fNpt+EuzxH6r9E1CuFZU2lJj4qfyy
         VUABuruMcogQTb2dDA1gULzh5a+8nn6jC64u4F7L/zZklVjuVLwvS0MEbZFKczk1KQeI
         K+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223704; x=1794828504;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tw+IF5aQngUQm4ayIz8HVZjcjZZWFvwMMAFsCc9hwU=;
        b=vvTBgTKxHbeoWiR1oyzmF2b6CjF9kzQ4+vM3bAxJrlcg+mjidB5epEf5es2ACb6ijY
         2uHYdn8H8RQPDgh7fh/yrXKbFi3MpSBH5b9IpxGPMnDEVCAl1Qn/kUK5GeMWHznDNCx4
         oOgLjp2ycrjYBxG8V8XoQ0qCoGyKzEfJRtc1X0bvok6fTkQY2YJGbXiTMTylqwsyANpr
         C4CR46D7oxhFPKrxWxskw1fcwSUmWG4h/jxvvkAO3aUcNEG2zt4TpEn204XvkEy+Wg/o
         6C1Ng5ir87LDWfLs4009Q77Tah17kDyL/piOocfZvmJO4U1dTEFJ0vbl36MihsRcHU4F
         CjIw==
X-Forwarded-Encrypted: i=1; AL+hErF4QzvCFEM1Y5+mSCFMvx9ybAXiEUWUGIN0yGgnau4/k+L/Q7b9rsFJkmy7U48o6Ga1MtKZA85oaB2eC64=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ADrty3od3UeJf7tESuXTlR2GXxfpjapYzHns3ruug2ZZnGqI4
	mN/E9ngcVswxyLizh2jhcINTqd/laCzHIXmdX5E/ou/aFwMS3ezFISZkITh9Sg==
X-Gm-Gg: AYBFou1yjWf035LfLQ+NxeeABHz33zxsyuyvqPwjOO6rcglnvPY5FE/59rRxoj5bw1s
	pjOXb72YBmvcHhGbiOpUXjhLfPS4UbQ+dn0ehh5TZWJv+jiGw9gZGV7M9ToBK/Yo/NZiQ7Ljqso
	Bz8fRbAWLOXhzwI9QlZhGIHcqoEYY4lDTSh6RQZ+IjR3bD1rf//g4oc/j5khH4dpr/xz9ntE2Wi
	I+VshhI7uXJRZOGgAjHBL05ZHbJ2oDr9dQhzKbGzUvvPwWlsEjpj6UL+7Ly1JfLt3j8Os3VXCO+
	d2sFu6VNcSxaNMN7oUdjBl29CeNRKks5AeO6WONuH63BREa2oRcRCMhuwaMFAjOAabOJP4ucnxD
	Kajx+xo5TGS85mb7YN2U/Yuim/zCNJy8fLD2L9+dAieiPI7S5XzTIFtcxQrvfVsaDNmJf5WEKOE
	I5KMC3RyndRjhAG0qCtgivZYTIyfeqPfF26QzwtVoFXbjjjDUEDXBppccTcNgm335xaeYkQrWVT
	fw8KihW+OFh+GaD4f+JfVZ/4WE8Cec+XQUsJxDJ2JYFJeHtUX9ZlQaKcKLanuTRi2gpDvymfKNe
	ukc/FW+x5fw7/pRaGiMKgWYkMLy6IGO7s6tZWLQShHqA+tkjKBJ/xjr3
X-Received: by 2002:a05:651c:2106:b0:3ac:e231:bb21 with SMTP id 38308e7fff4ca-3adfa45e5c4mr8927131fa.6.1794223703998;
        Mon, 09 Nov 2026 03:28:23 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3adf9f52330sm7403421fa.39.2026.11.09.03.28.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:23 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 4/8] char: xillybus: Rely on FMODE flags in poll method
Date: Mon,  9 Nov 2026 12:27:56 +0100
Message-Id: <20261109112800.48663-5-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261109112800.48663-1-eli.billauer@gmail.com>
References: <20261109112800.48663-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The poll method of xillyusb.c previously tested chan->in_fifo and
chan->out_ep for being NULL in order to determine if the file is opened
for read and/or write, respectively. This works incorrectly if two files
are opened on the same device file, one for read and one for write.

In particular, if the release method is called for the file opened for
read while a poll is called for the file opened for write (and vice
versa), a race condition could lead to access of freed memory.

Relying on the FMODE flags as a guarantee for the validity of
chan->in_fifo and chan->out_ep as pointers to allocated memory is safe,
as the allocation and deallocation occurs with the open and release
methods for each file.

Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/char/xillybus/xillyusb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 45612fd760f0..73e26f254693 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1856,10 +1856,13 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
 	struct xillyusb_channel *chan = filp->private_data;
 	__poll_t mask = 0;
 
-	if (chan->in_fifo)
+	bool open_for_read = !!(filp->f_mode & FMODE_READ);
+	bool open_for_write = !!(filp->f_mode & FMODE_WRITE);
+
+	if (open_for_read)
 		poll_wait(filp, &chan->in_fifo->waitq, wait);
 
-	if (chan->out_ep)
+	if (open_for_write)
 		poll_wait(filp, &chan->out_ep->fifo.waitq, wait);
 
 	/*
@@ -1872,7 +1875,7 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
 	 * wait queue.
 	 */
 
-	if (!chan->poll_used && chan->in_fifo) {
+	if (!chan->poll_used && open_for_read) {
 		chan->poll_used = 1;
 		request_read_anything(chan, OPCODE_SET_PUSH);
 	}
@@ -1884,11 +1887,11 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
 	 * which it may not. So make it never work.
 	 */
 
-	if (chan->in_fifo && !chan->in_synchronous &&
+	if (open_for_read && !chan->in_synchronous &&
 	    (READ_ONCE(chan->in_fifo->fill) || !chan->read_data_ok))
 		mask |= EPOLLIN | EPOLLRDNORM;
 
-	if (chan->out_ep &&
+	if (open_for_write &&
 	    (READ_ONCE(chan->out_ep->fifo.fill) != chan->out_ep->fifo.size))
 		mask |= EPOLLOUT | EPOLLWRNORM;
 
-- 
2.17.1

