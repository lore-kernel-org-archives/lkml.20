Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785460;
	b=OJgralLLlEGEGl8ngoO8+0DXFCaqex/HWMGvvG/SBPqn1L+WO6xBI0O8Q+QmziMr81KW
	 10VyX0AbjOuv/Hr173TZ74kRoAlHBsLBrwxTmuptPRQQ9grGMKLzgfrKEspEKedX6QWvP
	 gmTa46ybYHjv+MVzCgIFERuCkLb297rJy20O9CrDuXRr8xLrbtNep87LjQ9pJxI/NjChD
	 yNdIf10HRGOCG8G8nBiymgAZxP3+o7GwPp9rOSSoaiLot02lOFOf3t+40EYMiQgcMTGlu
	 IEmKy+4VPZhcg/jK05VbSd3t8v1TXc18SSRF2r7+kWHrYMl/WOUc8HsNIigBRyBWZuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=eCaLjyOBd6911x6Yq+VkNvkgea81PfoqbKdxl69yD3U=;
	b=h2VJlEUZvUazc4P+nfLZi5dlgKc6+8jiiofPyEaazRCNTffdo7iQlpZMC786ar2HBJuH
	 8NkTvVnzB1aLTt9e0ew7gALUScIpXZauLaOAwaRIxlBhCdPKeh/K1V0vDaie9N3axsZ2G
	 6Cvpm/En5ZoNW06j/eeZ3+7IMmyuLLkK9MLueLV2bIp983TKqUNzakt2bA9SNaGNlEnRV
	 xxz1KKKE7ICTR52KfqfZJ6hFtuC/mguGW++dwwlFzAi/vpLWjpKDmQvNNaduAQmdnznUO
	 8tiP/mhcCiWE2jfuuQ8uNoOJ+/kvwSNOwVylkm7AnUikIP6JWGPsDFcNgepcDCNc8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f2oqeoDv;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A9606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8A9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f2oqeoDv
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so449124eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785459; x=1794390259; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCaLjyOBd6911x6Yq+VkNvkgea81PfoqbKdxl69yD3U=;
        b=f2oqeoDvsUl95ytGmI3xBjsAllvAv3xhGg7t2I5oeZ0lzR0L6D67bRUb4fhbovwYld
         KB7o4aIc7367/Jq9eNhubnYylEV89CLbGVH9qT/ipsgy21BXqF52faCMMOVBo3+xRUME
         VgY7wL/bhI5OSPAvHuxyHJCm7BFxpM+1bo9AoEhdlnI/EE6L8GWxdT3xvvZ/jr1ZT8I0
         dxk6R2Lyfm52lzMvTjcKLoy5kMNGVbaucel2uG8pOyZjJf53nPiRytxICnrJhKO/xi2/
         kwcvPyFcTOfz0fFbbJbh8rj9qyCIlTRAmsFCe2grZ/ZBqF8cHxmXLixnYFWmtKcb7lWo
         cPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785459; x=1794390259;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCaLjyOBd6911x6Yq+VkNvkgea81PfoqbKdxl69yD3U=;
        b=XBPEDeQcY4Y2sV0P0MnPxjtV/4UIiKSfqQmmrgSj31sVWqh46A5IdB/iVa5r150Twa
         MlpRUd7vIYsa8Vg0H2pp+ovtfledXXLAIeobE04ffKX7LA0n7cGRZhenSvYkfLR6JfnK
         aPJ8CH+Ec2KcB1OT42tg4gXeHZo0Y1Nf2arFgOsx5fOGfiTUyboFZq++TBAWsQzNmXVK
         TX0fERX9xobPlJ8DDJoOQPFae9FSuRaWXlDDk9ffPoLkszZ0oDbxC2MSNDnygFT/bzWv
         9JN7tyJWU/7QYg/gSzD07WTvPe0lK8lRY4vTGCUfKg9PqMj764m7sFbxFZe6Ws0wXcW4
         MV+A==
X-Forwarded-Encrypted: i=1; AKwUvBwPgOX3AkhgqZF55IjRYGrwx+zBXpl4i/xkHB6HG0VrTfhlCrr4BpjxvubsuLjmbGeLPxxmQRb+MqxUMVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g7bsgtUv2QFCoZM9VO0+yIjFOeSES1dAIdyPj2EISIerJybn1
	7WqkX7MBCVwLtZLwoT4ZmxbCYsYcore2CVR1rcpe6hO3B0LXkL0hW4uN
X-Gm-Gg: AYBFou1+wp94HVyqNAYr00L+2lvw7N2EOr2CI78Fw7e54HUVyII6+pMvD4RzT6bvSFY
	p5+sSkkqDnIwCQPeXJUWm/bmvfkc46BQ32/eFuutfZj7rMyojzppAnSFO5kAnbj0RPvzrhyAw3P
	Ui6xVtrqXHiAfV00ZR1JxXRt3EiRPDHupxlMVZqprcll05YfJ9aVqWERr89CRNd5z5kZCZw7MHt
	syiUBHIAW4gXVjwFFjnkjodmGgK3LeP9urhllg2dOvkkOzDZ76ulgDZ5KHgT2hgC2Ypf/9I1W7U
	3C+g44Zq8VBjZrLoX2qWfYD4BRhvod7nbpLtcN6FOoyfPHTQcRRq7IY6CKgDhOZ/9djGXdoqaRW
	gccf5ZSTDfu91A2xhzrqTVt9vmIKuuGFdg7e8qC9gFNqVxmXGIFJ7qTJ/6/CUWmTPt72JXjcn6p
	LQnGdrILRlDwFw9hj56j7xu4oxwYG7Yp7Uv8g2s981Z8rDIjUFdWZKeEOgZjU1/lCx7IJWfQ5pY
	UH1+c1PtrsSzmeO7Y9DZ36GvR4f8h/aeH2ZVwduv3FZYFpGO4aVIhf1tm9Kp2uqLrUuM5fLG8lG
	Zd8/+8gY2cA9I8fMrL2LVooJogUOfmqBrgylSl9OMaGCDZQD8uX0HDvJHvSflJx48Ss=
X-Received: by 2002:a05:7300:cf8e:b0:36d:6a77:960a with SMTP id 5a478bee46e88-36d6a86f678mr179367eec.1.1793785459127;
        Wed, 04 Nov 2026 01:44:19 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm5545273eec.15.2026.11.04.01.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:44:18 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:43:51 +0800
Subject: [PATCH] virtio_console: guard read-side virtqueue access during
 unplug
Message-ID: <179378543196.71890.7555371342727156729@gmail.com>
To: amit@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: rusty@rustcorp.com.au, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The virtio-console write path has an unplug fence, but the read path
can still access port->in_vq after device removal has destroyed its
virtqueues. port_has_data() and fill_readbuf() take inbuf_lock without
checking whether the owning port device has gone away.

Clear portdev while holding inbuf_lock during unplug, and check it
under that lock before reading from or re-adding a buffer to the
input virtqueue. Discard an input buffer instead of requeuing it if
the port was unplugged during a userspace copy.

A KASAN-enabled QEMU virtio-serial test reproduced the stale
virtqueue access when read raced with device unbind. The same
injection-assisted sequence did not report a use-after-free with
this change applied.

Fixes: 31610434bc352 ("Virtio console driver")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/char/virtio_console.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 019bcae81af5c..e97e0daa34395 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -541,10 +541,16 @@ static bool port_has_data(struct port *port)
 
 	ret = false;
 	spin_lock_irqsave(&port->inbuf_lock, flags);
+
+	/* Port is going away. The vqs are already gone. */
+	if (!port->portdev)
+		goto out_unlock;
+
 	port->inbuf = get_inbuf(port);
 	if (port->inbuf)
 		ret = true;
 
+out_unlock:
 	spin_unlock_irqrestore(&port->inbuf_lock, flags);
 	return ret;
 }
@@ -725,6 +731,16 @@ static ssize_t fill_readbuf(struct port *port, u8 __user *out_buf,
 		spin_lock_irqsave(&port->inbuf_lock, flags);
 		port->inbuf = NULL;
 
+		/*
+		 * The port may have been unplugged while we were copying
+		 * data out of the buffer: the vqs are then already gone.
+		 */
+		if (!port->portdev) {
+			spin_unlock_irqrestore(&port->inbuf_lock, flags);
+			free_buf(buf, true);
+			return out_count;
+		}
+
 		if (add_inbuf(port->in_vq, buf) < 0)
 			dev_warn(port->dev, "failed add_buf\n");
 
@@ -1568,6 +1584,18 @@ static void unplug_port(struct port *port)
 	 * a close on an open port later from sending a stale control
 	 * message.
 	 */
+	/*
+	 * Null out portdev under inbuf_lock as well, so the read path
+	 * (port_has_data(), fill_readbuf()) cannot race with the vq
+	 * teardown: it checks port->portdev inside the same lock and
+	 * bails out if NULL, preventing any virtqueue access to an
+	 * already torn-down virtqueue — mirroring the outvq_lock fence
+	 * below for the write path.
+	 */
+	spin_lock_irq(&port->inbuf_lock);
+	port->portdev = NULL;
+	spin_unlock_irq(&port->inbuf_lock);
+
 	spin_lock_irq(&port->outvq_lock);
 	port->portdev = NULL;
 	spin_unlock_irq(&port->outvq_lock);
-- 
2.34.1

