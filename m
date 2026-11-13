Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562111;
	b=VriYvmE4vGwNjPnhpWHGNfRKNExB49Pdq72owQmittKbydtVOXwy2EHYp5osGyP7cFXh
	 d4ZuMTLf4WtQMCjJEHX+N/U3smKsmzwxA2HUOx7tbnvPF9X/i2lran254M3N4pU1q510h
	 nlQfafBcFxe5HasRe0oxl/wysGh0idHIPBr+1t2qZeIyg8Nx0T1o+FXGEoMWnbXX71mi3
	 Nlgllis7YrnOobNw90bkLC6lNHeNN+EzViWoMja7iQimw35sD5+CWuIPpme5KBxU4kIAs
	 Nz3C/mxcYCgDL6/U7oIiIVzyHQFQFJEE0Qaf0bKjZxaFgcyHBJ3or9Y9/f13uH12ElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=CIlAjjzP5ZXkuJIu4Whn5N+9lP8TULOuvWMoUXH2eBk=;
	b=YR9JMx3E+xycFJ37Gp+Di+8asFqWO7ML6iquAfX5rDsbpKcKD4fYfqAzPTYq+xC4teMd
	 67aI/8le6R3ocr/B5cW5UMOspsFInYb2B0ZCnleV9ASkEMiDWI9CSsPJrMvKEeGdVnKd0
	 CXOGxfUrsTpwdIWfBRQThmoqVeFCZfLJ2FCsFqN1TMwBNP8nt5JzYD9F02pT1X4Pc1Km1
	 YYR68XsGGmFAPLV1ic+caV4tBCiMFTb9vG2WbvUkhP3ouXLfrjZEyWLJwm+ISgeG2W2Gf
	 cAbc4nptD2ND4ZimM4uYHBKK2nvXgnLAA+dC6PAuQCCaMXCCL6RuwV697xnXfMaDj8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tMyJJZ7d;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED25606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED25606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tMyJJZ7d
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso4867695e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794562110; x=1795166910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIlAjjzP5ZXkuJIu4Whn5N+9lP8TULOuvWMoUXH2eBk=;
        b=tMyJJZ7dm0Zrfs81fs07a8kOa0DEdvi9J3wePjDtL0TbRD1onKbr487LUAiBe8MrT/
         lqXfCfc7Sn+gszaAsV4SKMFIuuXPY3Xxvl5/z1TvQZG1AbNjczFNICpoG3RebBqAWf4X
         ksWWlPhuFS3F/OMFz9F3fDBoVMB+jd1dp8JfmanVIGzsrK8C2OpHEbBORZsp9G+kDbD7
         UQHtzMRKEsvG3SB76rE69Aoc+6x+3dSMZN21/bKA4eozJkSZ65R7xm05vTHQtHl2WnbP
         PlMBUT2SB9LENhOHmkO8Z2tWdEO/A1ffYLg6GUutRg7VQeCIVDp/3Jkki7r1dVyWhlG5
         Wgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562110; x=1795166910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIlAjjzP5ZXkuJIu4Whn5N+9lP8TULOuvWMoUXH2eBk=;
        b=J6xGAiLRkOnbIMoHY3jtFsFVxj14G7uoJf/ohrRPqb8w+tyP/lXtMt5Q5fgzrSw88R
         jhMxEsy4BOxL3pur633rHC+HMTXcVFXKnSw4+FIEYcLNUaodvammg+BrsdFejwbLoSLD
         FYAxzVN37doerwYGXnC3GNRVDCv7JymGNYz7+dJYjtyfZmMXP052+3MkoLdBh8ifq/Lx
         OegWqJHahJ/QTgKezSH3a8n0SvdZz6BiesU9uIjNZp0ZTgEZyoHIylZ6Ib3SBPzXQbzz
         XNTHXEPpNGDW2oJeTmHsoPz8TIUBj2JvRAFeRCwIw8v7RmXnlnGO1JnMM65JMMuZpzpx
         nb8g==
X-Forwarded-Encrypted: i=1; AL+hErHP59Ezu8NaG0mHyWcl9RchXKfoZLxh0ceYSrz0gFoL+adCRgLAq4wQTRasMznqSEqbF/WZly5fOHSfnBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z81Q9OxJXyfWU1XTqJMwwqjstLVHCpiBc8Auwa7Ilg2veh/xq6B
	iJZ8nWvTIexL+VKII4j0qfmDgMdfXN3UlsavEVIgrUCzxOM0S8hPMphqZEEnhWYnjDA=
X-Gm-Gg: AYBFou3j3REFi5kHKu3gOcEW6+vSYMXVgr3wBH8C6nmudfBCG7c3XZuFDeo0cwV6wss
	Vr9YzG7EY3bD4R/ApPpxJMkvjYMf75GjZpl2mMIWI0IWlN/Fbh+Lz+OsWNOfajMzhYPHU30zXvs
	Iyz3rZ6X4C6eHZkvkdwxMO8KCGpCvImT6dKBa3m9Bf8rJ+BM7J8uLoVpzieMoqOwXCGnF+Ua7xj
	PIOpXSRP/dwKN8Z3zboU7wYuKa4zbHEMtwpssx7NN1OFVyLGhs4eWZUrh18aVCRcXw8yY7rbTXN
	NQl6Iy3yb7cSGMXFggT19f6WBD4aatoLirfsKpqqiG8jCFXMwrkM/eOSwDwilFH5u2v9FALfDrj
	+trojt2BzKEAsxbS+zLnmsbe3EZN7f+3LH+Req/tzSk7PQ9QcNt125QBKQMLUwjzmiEuiaYpQ6g
	Hiisqs4vKZUychQ4FlEm+FMPBtpGoBDHzp9DO6aqM2/Yxz8bcrUn8nzsty/RWHbc7YfAIBmSuBt
	RK/RE+SAjXOW5ZXibna9XGisFVQW+Bc9CbMY3LVIQstIQDZpt7L2kO8c/+J3ghp/fDSaX8JiXsx
	1nUcvxjoW0GI1JfoSuqh6+nyPCaGcKkESX7IgrGh3ceuPS1DqIQ0yXPCsZyF9qfxEzaYewexrlC
	H79yXs1lh
X-Received: by 2002:a05:600c:a45:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb55a69123mr38136345e9.13.1794562109875;
        Fri, 13 Nov 2026 01:28:29 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm238668335e9.1.2026.11.13.01.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:28:29 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 13:28:16 +0400
Subject: [PATCH v2 1/4] usb: gadget: udc: Clear a pending connection when
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
Message-Id: <20261113-udc-connect-v2-1-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
In-Reply-To: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994; i=alchark@flipper.net;
 h=from:subject:message-id; bh=H1NZkbwOLqgox3njeMpCXWj9ST4HT9e/9uVkqeyhY3k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9u2ExvzC8IC6y1H675PsVR3gZWD/3LjZ8Yfng54IsE
 ZaV8+q4OyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqKa8YGToDL/KUn7jzeK3VnBOrD/n9ajnlGfAoTyqx42np7Lc29+oYGW65LTX
 9fFN/F0OolOvx12cq8h3VBbLPH9nBmfs5XurOL0YA
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

