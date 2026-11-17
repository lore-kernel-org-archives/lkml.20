Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916766;
	b=MZnif40RESxmOhd4mpN5rXGxoAjVBt8m2pMPnYmHaEmCoh4WAVB/kBU9I8fUyycR4lpL
	 cizg1tog4RVQsJfxSlqVvwpJtba9qZIu0YPXV32A12vLwZweiG8Qjf01b2CI+Z4HaA4eP
	 UqLCCiDEhKNiWMxBjou26WBALeGB7OlBLNkIx3h9YysNL2hWb+ttvV0t6tt4ttvEpEfBm
	 Hw/VtJ9QbdRe3xZNfRT6dxlmHu8QQaeh7x9wP4wnwLEl9ROuw6TvnCVdB3ZSpkzsAETvd
	 2c/Mv0E/+GE7KdIr6vKdak5Mu6/2rEE3okBYewRMzhmXi7PN/FvtuGeuZSiIjc8uZBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=akxqhpumQouYLjB5xhQSRs278F3Gk1Wbad1Mmuun1nM=;
	b=p388v96zwT6huOjPL/mNQGTxORZotmTkx7INZffrGkjBJvHi5X79ohPqV3yvTeCPVeWz
	 9qtHq6tq8HHoFOkgqJCkUUbJZ8gTkywRxBKbXMWbjzZFTWqdlmitf/dmPlbS6cbuGQNmd
	 fzlf0wmxwSpnfnTs8Ws+xC38Ti2eEFwCTX0K3PfYLBXbh82wO1TD+hQNuEoFbtY06ccdB
	 HEDqwLXZ72Xcig56e4nubZrUSs6ZJC14Vi/wjzim1jq+tCqJuykh1B224hLsd5iLe8ee5
	 zqkVIA9PKSFUR5U6VX+V+X8zvnm0SaN+7r5sHbBJDRS/VMn7uwaFUCzNI1PYlgRWCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnOb2fcp;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF4B606A882
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF4B606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnOb2fcp
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40f29667e6so800296266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916765; x=1795521565; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=akxqhpumQouYLjB5xhQSRs278F3Gk1Wbad1Mmuun1nM=;
        b=dnOb2fcptWNpdDe5zPChnItVT5dJaXGIEANkx6aEVsnbONY27IKwZACo/n2eiaxQby
         ChptOW4NdgFSz8bUG7IzTP7i8h9FbfHPOlByRh/P345QGrYeGG7uKGC/0LOKi5F5kDe0
         ugltLrWIAs3NchA5PRa7g8fqxe/7SVnT1DbdAmgWMkqFhNNPbJUv8g8aozFSO5ZdKb/P
         M3D8TYC7wWnLX8yP6uFvFMlbjYqwc3pq0qU9mfGJ5Jfr9rqbTHtB1EfvxxVtb9AZt1iG
         bv0vNSlQz40E/LENCp5W6+3PdFWK1lpY2fyJD5rrLq4BSssuLHwsHbPcuF8z117mJrWv
         JXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916765; x=1795521565;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akxqhpumQouYLjB5xhQSRs278F3Gk1Wbad1Mmuun1nM=;
        b=BEizzwvAJhDxy8xfCMlc54CQSk/2K9PqiOAKAY+gpRAo9/nF5Uxa0Fg7+3G7OVodYx
         vk+7peB45/+D7lnSIJk0qzMCuaaT6d23QQ9RC+zK1e7u2nNllq/gcP86ObAOmLabZexQ
         EbUg7KxoEk9SirxPQN8ykEra+fs7cpTHqGF3svIPIq9rSOEv+DACiVYFiH76wAKnpTlL
         l9LJsCaJ4tgZmnsBF94TviEvzj0Zhc8w6qUVGIzQc9E7XhQQI3k9l7TJCiC1jP9m4fCE
         EmXOi0NsoczO+gE8gvFqjKJhK4DDdK5s3JcwaEEVwAcJgl19Ak3Vm352UEqhlWaMjUXl
         eOug==
X-Forwarded-Encrypted: i=1; AL+hErE79D3NuUq30dnLlUSzMbnbtFE64IgwYE7DgVLOPRXnnxg760KTjkMT7M4yxJ+QT93di7SRFlh3lHzK90Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z862m6W/TxNHdHPB+ic/Pyg7TvXB9rzcqEvWyNpcRLoZnjhk89u
	XpJjXu+AVN9TDhF7dkknUADmTmwagQC14B5J4B2SksmGWgwKVyTYLpzo
X-Gm-Gg: AYBFou30V1IUhNJwZ8ZTVP9DDewmTiohoZhTeglEPhLOy7crBd8X5DrJ2nrKcetpe//
	hPjqpw86Gm3Ohdekp6nyzgpS60VdY2xkNB3wQZiTw3WwSo9EZqy/BasVFCBH3oJtEJNDpcMobLu
	TlW4vgCAXo7060rPMfl5tXi+y9YjdGFNca1OnAB+79GC/tQmnAgu81Y2WI0fjT8nyvPcjmQ2/Lc
	z3Msh1/BaA3dh70lCPvNCMRNG/XURLz/lJnNUwQwfYa6F2ZrUHopxZ7DKe5yeO7qxlfyMgZ/OQX
	xhDlclkrmq6tJN9bHMph/NTfrsEQ9anpanhayNMYcI6HNN7h5iyDv4QMLa3NBvzO+uW9/kh6orh
	gBynhNdtVjWd2R90gC7dS/zxDdwkj8keaGp5NSrc7AKsAwfCifmurfC1gpJYL0yV4esEPBBiziT
	9WZAbnW0v/6BZaddwSz0RRMsz01IX2MDs95Y6AM7uDBPH/tP0RWszaDLK+20YWTeVP+eyt0zBHT
	nm04+kpn9GGuhmxbaF+3VYMJ/5XJQj1gowMJxZ9NKM6GIO2zk40zCuR5xDBabV6znY/MLVt/IIx
	uikN8bRe6QC3P3f09WmCDUHbSnY05YU+a3K50EK4QlUCjYSgWZUbjtFk
X-Received: by 2002:a17:906:5642:b0:c50:d92b:6f40 with SMTP id a640c23a62f3a-c50d92b78d9mr436393166b.20.1794916764569;
        Tue, 17 Nov 2026 03:59:24 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50efdb3471sm115519866b.87.2026.11.17.03.59.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:24 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 4/8] char: xillybus: Rely on FMODE flags in poll method
Date: Tue, 17 Nov 2026 12:58:58 +0100
Message-Id: <20261117115902.41359-5-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261117115902.41359-1-eli.billauer@gmail.com>
References: <20261117115902.41359-1-eli.billauer@gmail.com>
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

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillyusb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 1aa8e7303ad1..f9c8591a679f 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1853,10 +1853,13 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
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
@@ -1869,7 +1872,7 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
 	 * wait queue.
 	 */
 
-	if (!chan->poll_used && chan->in_fifo) {
+	if (!chan->poll_used && open_for_read) {
 		chan->poll_used = 1;
 		request_read_anything(chan, OPCODE_SET_PUSH);
 	}
@@ -1881,11 +1884,11 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
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

