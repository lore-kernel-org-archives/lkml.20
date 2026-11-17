Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919698;
	b=rO+R/BGoYcTrxsoKiIo9Z4pwvdJ/cNNVvwbIqt0WAahjz0P3e2uNn+gzxuVts6qr8iyM
	 FzvCaOs4/dO/mJZE4pdgAFobXI1PhhG5kOjVhivn//cmOqzey22FAU7hp94/EtxDRus96
	 wkFSKryb02HLrvYr7jpY+BrVm88Urd7lthYB4uQsmUErN6CyLFAhNAg9eeAkoZKCBcyfS
	 A0aOfCLIZ4IFrXdz87p2G+C3T2w5OlQ81kxLiFIWvkIzrD0/32aTro19dgTirr/tuEwI8
	 atPnuip2eg/0GTWeFpTl2BOst5xiMUP5XnyaUb3iCTShuWzHm7wYUFZS64gQEWx5mqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2UZ4KDs27ccMSIJ05qxi98qMn453KRwTQ3SPpAtEY/Q=;
	b=g+3NYeRYDv16gdRVMtxc3gXXQFu2BNkWcGVbLxSmYgWdBylpaqpW0YW9DqUrNnmAf3NX
	 StVDQ+t2s2KB/x0bSUAv0dqybAPFprLNiY7snHvgACUNz1yxvFVaOwwpIinB5gKEbNQpU
	 wsjhDcGqgIbWE2g6TjEouD/H0KdBKymli2JOM5ZS9q3GkfRXiMCf/h6fY0zhnFUPeEDkE
	 v5YqZfg9LQxkr4O4aqKL+u6bap4PIsShPh4FGD/zVximcWuO4N1THI9k2Fm2iJGIk9Xr4
	 Oj6TrA+sbz3YUGPk6o44ol+xJBc87zfIvW7N71udyU9D6HNqZlH26b/nPx3/aNB/cIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BvEtF63N;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B02606A89B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B02606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BvEtF63N
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so30470665e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794919696; x=1795524496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UZ4KDs27ccMSIJ05qxi98qMn453KRwTQ3SPpAtEY/Q=;
        b=BvEtF63N5fmFZW/Le7YGJ2Wf6gX52ILIGV3jphIVCOJrKptLFhQJPhFoaimdJotho8
         SiT5Lq/DLcr8c8SyqyTlqxA0W/8CCbeg1eXRvInDR/H4DHjQ4rI87RxPlJLZTXHuvHJa
         b0ZZsLwP2eog+8LdjhUMxEvUVn7QSxw1GNk94w6uGHVnxdWrk//Kgwueg4kTigKHOaw3
         XlSriOotJWHlImnSoDMr1uY45mUpvmSdpk+6L9xAgWmGIQbSHjOQ/VGF9cbz5l0hJWNU
         zQKFvM0TqsJw9cAZSlISutzIC1QnvLKVF06M44l8XXH8K9dWkquv7yVValkJoW28DU08
         5lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919696; x=1795524496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UZ4KDs27ccMSIJ05qxi98qMn453KRwTQ3SPpAtEY/Q=;
        b=BLK8gmif1vbjiHrM1o3g7Kb9GUFPj8vPPSDBhcZ6aBTfX/T1oNLO3q4lty7DnocbeY
         u7Qczw1Ocbsvj7HyXGJEBGneRZe520vnus7WB4CJE6/hhk7fCifXDFv1HdLg0A+9DOZj
         Lz2vb6XEk0GIFSyRohE5r3/n6EPzAxGRbUb2uRtE737Dei4gtJHdljjm5nz3MLj8+YvT
         I+t/i27Iw4AZrjl3Iglt7uBv3oq1Cxu7i8zlH1PYIXLq4ZaeRY/rnJcWvv/HnMiPQXZD
         8oxmQ2z6JCM036rLN/ns1fjQ+gIzVv6ltWgAcgtqRIVSNRufUK8+9axUrJtXthfLWVh1
         m/lA==
X-Forwarded-Encrypted: i=1; AL+hErEQ/aPjgtKdqADZ61CJGeVs7PGxResBD6TPpjLOGrqP/3o1K2s81I9eRK0F1g969Gi4Tc6t5CtfPBArcBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g40CDXM60qSgAqSqSW2glAiEDz3eWAyxUfdOI1Od07Zs8HoLE
	GJQOPOxF1wjBhkVpNtWaGJIrcFqlPJZfxlSJVAVIfAa8qasaKYLIWZ7+OyYKWIs6P5M=
X-Gm-Gg: AYBFou18EziZ+v4d2eFi0FZLwe7ZXm0OFkUvlpAKJPVQE5v31lxCnUaBFDT6Ir20h+l
	kiykBW0gXGRqFLrXYz5SWJKCgIywEuUKbmjGpk/XAX06w3J3VHsxJihbk4etrgTWE1UMZRZ9Fe4
	LcdjigrbiuVEWbLQ1ibzmF6hwNcxrBUJd+P2JDBnp2tXm+he9O3weUNp4wEMhcqTV6DrYEDGJ/y
	CCKOnP1NHNJO14SzFExfZmQmVjrArYPWGothSAVZy5wc84MPcA10sj4iKlK/X1Q+INlS8NKqtQU
	i/uWuh50Gcn5l0TZd+rLCNw0bYTzMRYCoE+zzkNS/BBZMb6/6LHQKMqKlfK4H3REyJwd5eQ3/JJ
	T5z50hrzd3jAlWUM/pXL1WkF7EJ1JUVPqATxpBuBtLA2HkmbE/47PTvkIBILAAW/uXXOGQujQ3N
	P213New+lwjRhCr8qoOxUqtZGVm17NSrjOMLzo92XA4DbaGft3Z+uP+IcYOfb5zQUQb5Z31705z
	+yq+o18aitZeG6y+2fU8GcQa9qE4XrLmfqw7O9fXg3XtOGFeJeXaKncv63UaabsAXSJgnzlLe5F
	TaVCL6c8Jh9nQGiIoSW0Xk8aJqKW3Kxv2T3eLZXrRQ+w1g1rTYAFtRFVcq96VZ3dLgKWuB7B8xr
	6hSaP4L1QggdEXCfaj/HE+98WwUJvLCE=
X-Received: by 2002:a05:600c:6089:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb76d9f83amr77248575e9.34.1794919696039;
        Tue, 17 Nov 2026 04:48:16 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5f350d51sm124029135e9.4.2026.11.17.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:48:15 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:48:07 +0400
Subject: [PATCH v3 1/3] usb: gadget: udc: Clear a pending connection when
 starting the UDC
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-udc-connect-v3-1-9413b491d213@flipper.net>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
In-Reply-To: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=alchark@flipper.net;
 h=from:subject:message-id; bh=52B6NtpvqPp1v/6zvOd5T1p3lDIt9y6MOcV/446fH1E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT98eWOuhAQefuhmuGtvc8j9ZcGMP6VFWwW5Ml1PBxSH
 JB8RUaqYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKn+vZ/hf2H4Q/cbe7ndb+meuRmbfsV7GhNr50r+tg8Z+wt3afWW8TIyvHj+4c2
 shFiL3y3bbhr9jlJMf9BYlPZBNvK2zk4lrqi3DAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
connected"), usb_gadget_connect_locked() returns early when
gadget->connected is set. A connection requested while the UDC is
stopped sets that flag too, without enabling the pullup. A later
gadget_bind_driver() or soft_connect "connect" then finds it set and
never enables the pullup, so the host doesn't see the gadget until it is
unbound and bound again.

This happens whenever a UDC driver reports VBUS through
usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
Type-C port controller switches the controller to the device role at
boot, seconds before userspace binds a configfs gadget.

The pullup is never enabled while the UDC is stopped, so clear
gadget->connected once it starts. The bind connects according to the
VBUS state that the core tracks anyway, and a function that deactivates
the gadget during bind still has the connection recorded for
usb_gadget_activate().

Fixes: 62911bc82b03 ("usb: gadget: udc: skip pullup() if already connected")
Cc: stable@vger.kernel.org
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/udc/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index d5844384c368..577bc15f61a1 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1236,8 +1236,16 @@ static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
 	}
 
 	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
-	if (!ret)
+	if (!ret) {
 		udc->started = true;
+		/*
+		 * The pullup is never enabled while the UDC is stopped, so any
+		 * connection recorded meanwhile was only a request. Forget it,
+		 * so that the next usb_gadget_connect_locked() enables the
+		 * pullup rather than returning early.
+		 */
+		udc->gadget->connected = false;
+	}
 
 	return ret;
 }

-- 
2.56.0

