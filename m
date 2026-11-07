Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089960;
	b=dqudJ+jtol9rfh3GLhoL8UFmlU9cn4f0IzGySmmeuvIqjExoZaPFYd2cNei3UP9Z/rAu
	 BmK44A7kA1fIwlC55LaQ4T0nSxEsEnZiGQ0YM+3x7Z7peBsLnY/OADWvmLnjY/YgS3Wtd
	 hRH8cv/vnaJgwH4eXJCNiT9w5ChdhhiyD6qvFKIwCgH7RX2qgw8dfLaxiFfH7MLXsigVA
	 p9y8CPH187Z5iWlLUtNg2dsDwyMXd5u9rIykibuiF8/XnaIEMZjpk8qS3dad2m6Hmi6Ss
	 OoNrdHdng4UoYaRPdl8DWNJjsrOK6yQWJFgLOXmZc+f2NpQoNjAmhlBEn04wbY9LEzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
	b=kecW1RcRaEgc30IgF7PQmkvziVGX6oVZ8WlB8/Ig7FhtWfeWdDyZf1v5D1WnuD5s182m
	 sunc7NNCMHDCualErIJAPqjPsRKsrdkKraxD3KgXZHZFZfQocx/9WV4gLcP7mfasV/q9Y
	 aOIa3rrtMwLMTm7aKKohismybBPcFhXevLo8B4QtwWfvJmcXCzzAainM91pOZ9I59N362
	 mKaPJtRQuLxtM8wWF07a5cPObmd3FFiGrtiwHhD037seOp+5KW6erK7XpcOCIFD9JPB1A
	 CtZHNa1c0nnYuce92G3VnCzPIwFE9LxUET8SdhgWUn+GlTkgs5UoLNHU3HoDYc1Yllw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qw/4HWuw";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D5C606D80B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 22:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D5C606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qw/4HWuw
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d28f75d62so5968366b.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 14:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089959; x=1794694759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
        b=qw/4HWuwg2WHlPYs4w4+6HZZGNYix40p5q1PClBBb75bpM/OFOGzBZoBtqOshx/ehX
         NrvU9SYGaIvI9rDZYrSndfWENYgxQVImvywQSbs9U+0qdXMJAagtY3+1ogqB1SYUnwK1
         q68O6zAT3N7nP758LpE1my+WAz3CH4wYPxljvZH1GIj3qK2C8xDIXj6wuVP/eU2HqUUZ
         n/iwOj1uv1HjTnqqITN+QTmhNS8SKD4HN08/jh3cAS5t9dDminiegVYf87rO5UNOGtJr
         MQqBQtbVffwIxYC9clD4QZxZFBNZKafkal9iyTneJA614yiQItovEVvPh48ldZ7HavMS
         5Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089959; x=1794694759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
        b=MDbW861JVMdUizMP+5IKRaOB2CYMZHh3dYvV85rQKZ5hsE88LPQo4kLisT5wV+PB4m
         +5KkvYgildp36bfw8bdv1vgwcuI53J2+K1jIlwgXRPc2TLU3Po7g3MiJ2ofVbbhkQdmh
         Sb23Hcf+ccwv6W04+g5wE3ymXqa+9vgM8cLIiHglmg4NIOZaw4xkCX5Jx93r+u3IqAim
         NowcskC9TO1uualFQwqGrqb+27mSCggi661T05YTKeDBpIdOxNgSDSbp4uAig/r0r4ao
         T1NJhPkBKAt2Hjsz9+wZdj9jVS6FbOCq7V3MQVtBxqbx1iyxhCJIGmarW/loaWp30rF7
         hvPA==
X-Forwarded-Encrypted: i=1; AL+hErHWL4De7ZtHUYIVvUx3jG2Ay/oOJTZuSJsPzuXWF5axlca+vIjLDnwgJcOsuuZZM0Lrk20rvQxxbU6BXOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kwoe6EbbAURb5FN9PB5ufp3C1Y2pEEIKZFhgVrCZecCX7dY1P
	RO+JzJ/OkwUXyZubYC7NfRES9P6QEk5L5kGYMli+USCb8f2hpUs8T5s1
X-Gm-Gg: AYBFou2DLlVo6uu5SPpID9lEtLheXE6ery77NzyiH6XjMYxbD1FZUmgqZDR0iYDe7q0
	RCTXHDxNnfBHm13QX0BN7iA8vyHX7BAlcHjW9nX/9Ly/T9UFHuZuPSKIWujVhV0B0fRyLSE8SWP
	knGKXLvIfbLFYffcvuQSvsL/XC+b6cJMdFnd35wiuHjLipEsUX49gRYkaPnR9JAh5//FQMmB8s2
	HevqTANvg0eoxq9KoqyK+QkGAfkzf0eC3oAQQdENpGBVXdoveBxBR2ZviID9Nzb1GWkcUwEJpfM
	09kn4HkMPmjkK+Q2vFswlnvy4BerQ2BNZ6C2bA9pQlxRiRfPyUWUVaUS/BBzH75bIT88XZW5E+S
	R6E0BRMUNH6+Brv/ZmqYf46XGrX5Pi5w2ldFXY6i17og9O4t7q43yw84PNsW2ec7gImaimwJBpt
	SN3DPDMbK7IV07kDyqbfpINZxdPUZotrFx8pFkdk8+0h5d1fYh+K31rnOWxz0xoQvh/Hcawjcop
	L7YZorRAVQJZclp8ltmAsGfbWyIT5qSgQEufo+9XDpiLCEmYaX1a+gqJpIej8Hx9srwcsvlQVTd
	iLihWg6uAlGVMFi9VoG4k+lSAWUk6sV/KIED/lr9X3xy6QdoEde9R6eJKGw=
X-Received: by 2002:a17:907:6d16:b0:c49:a4b1:9cb1 with SMTP id a640c23a62f3a-c4d6d160ecdmr19605866b.3.1794089958683;
        Sat, 07 Nov 2026 14:19:18 -0800 (PST)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e3dsm14108866b.42.2026.11.07.14.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:19:17 -0800 (PST)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH v4 1/2] usb: musb: gadget: count givebacks in busy
Date: Sat,  7 Nov 2026 23:19:03 +0100
Message-ID: <20261107221904.82487-2-lineprinter0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107221904.82487-1-lineprinter0@gmail.com>
References: <20261107221904.82487-1-lineprinter0@gmail.com>
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

The ep->busy flag is used by musb_g_giveback() to signal that
req->complete() is running on an endpoint, the ep is busy and
starting a new request is not appropriate right now.

It is only a flag and not a counter currently;
musb_g_giveback() saves the old ep->busy value, sets busy to 1,
releases musb->lock, runs req->complete(), restores the old ep->busy.
This works when there is no possibility of two musb_g_giveback()s
running in parallel.

This does not work when musb_gadget_dequeue()->...->musb_g_giveback()
happens at the same time as musb_interrupt()->...->musb_g_giveback().
The above save-then-restore can get the busy flag stuck at 1.

  CPU0 (interrupt)                CPU1 (usb_ep_dequeue())
  giveback: saved 0, busy = 1
  unlock, ->complete()
                                  giveback: saved 1, busy = 1
                                  unlock, ->complete()
  lock, busy = 0
                                  lock, busy = 1

...and this gets the entire endpoint stuck.

This was reproduced and the patch was tested on a Pine A64+
(Allwinner A64, four cores, no DMA) with PREEMPT_DYNAMIC and lockdep,
using a specially constructed f_fs function that keeps two AIO requests
queued on a bulk endpoint and cancels the newer one with io_cancel(),
in a loop. Tested with both a bulk IN and a bulk OUT endpoint.

If musb_g_giveback() were to be started from some other context,
the same issue would come up.

"Promote" ep->busy from a flag to a counter.

musb_gadget_enable() should not reset `busy` to 0 anymore because
musb_g_giveback() decrements busy, and if these two run in parallel,
it would be problematic (cause an underflow).

Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>
---
 drivers/usb/musb/musb_gadget.c | 10 +++++-----
 drivers/usb/musb/musb_gadget.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc..b500e0d8b 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -129,7 +129,6 @@ __acquires(ep->musb->lock)
 {
 	struct musb_request	*req;
 	struct musb		*musb;
-	int			busy = ep->busy;
 
 	req = to_musb_request(request);
 
@@ -138,7 +137,7 @@ __acquires(ep->musb->lock)
 		req->request.status = status;
 	musb = req->musb;
 
-	ep->busy = 1;
+	ep->busy++;
 	spin_unlock(&musb->lock);
 
 	if (!dma_mapping_error(&musb->g.dev, request->dma))
@@ -147,7 +146,7 @@ __acquires(ep->musb->lock)
 	trace_musb_req_gb(req);
 	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
 	spin_lock(&musb->lock);
-	ep->busy = busy;
+	ep->busy--;
 }
 
 /* ----------------------------------------------------------------------- */
@@ -162,7 +161,7 @@ static void nuke(struct musb_ep *ep, const int status)
 	struct musb_request	*req = NULL;
 	void __iomem *epio = ep->musb->endpoints[ep->current_epnum].regs;
 
-	ep->busy = 1;
+	ep->busy++;
 
 	if (is_dma_capable() && ep->dma) {
 		struct dma_controller	*c = ep->musb->dma_controller;
@@ -195,6 +194,8 @@ static void nuke(struct musb_ep *ep, const int status)
 		req = list_first_entry(&ep->req_list, struct musb_request, list);
 		musb_g_giveback(ep, &req->request, status);
 	}
+
+	ep->busy--;
 }
 
 /* ----------------------------------------------------------------------- */
@@ -1061,7 +1062,6 @@ static int musb_gadget_enable(struct usb_ep *ep,
 		musb_ep->dma = NULL;
 
 	musb_ep->desc = desc;
-	musb_ep->busy = 0;
 	musb_ep->wedged = 0;
 	status = 0;
 
diff --git a/drivers/usb/musb/musb_gadget.h b/drivers/usb/musb/musb_gadget.h
index f49f25b3b..95bc746f7 100644
--- a/drivers/usb/musb/musb_gadget.h
+++ b/drivers/usb/musb/musb_gadget.h
@@ -90,7 +90,7 @@ struct musb_ep {
 
 	u8				wedged;
 
-	/* true if lock must be dropped but req_list may not be advanced */
+	/* number of givebacks in progress; req_list may not be advanced */
 	u8				busy;
 
 	u8				hb_mult;
-- 
2.53.0

