Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381803;
	b=MB1eetRilY9xcWntIUROCj35KfeGIi8E1VReGws+bHMDAvTh577roZ3rsBHGt0MPtkqL
	 2ALdoAOp1xREuXaFIhAh60CdvcR4e07lZ7vE9Rlx2hLIoOI1ObOmIluJz9HJDmyCXX57d
	 2KbeKPsYlpWR1IRKF+R6twaaPF5PEKh8Jk29OrE6JtLLvnwX8UFE1hitNrIT7lG8R3Gew
	 FVhRtjH7r1FNnWT9MgUWQxG333Xn4dz5/Xr9OuhQH3vODMxV8z+m2F8oZSO4zSMdm13F6
	 GGQN81zcrdbuDeEtUbjlUttg7lWBaWKw5Z4ijxwCfE+2rSy2lDAgkitow3PTJmwzgMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AUKPS5RA8eXgoyfSnvQNUOAbgh7hfsrUJVAkmo79Ccw=;
	b=MDLxJtVuhMlwVU7boscSyxZqrrl5Ru2MmHmIfsSIvo5y2jYvsi6s6Ak6KVjuoGmnnOtx
	 Yg/ED/evMVnx3Et21I5Q1nbbiWMzjjunGIYdMRsnEvUUmHO/MPizQM1jiUQcfiiPucNUh
	 FfyZ/BexBp1QMU1iNLytgPkfKuLE45apYQ2jsUXDh1BZTdzdyiujQ2jf0Y6qDuqJ9pigK
	 VXhOSUUV2UO6Cg5PJvbcnu2lyVMy4T1aFF+MP8yRC6X3vaVEuXUgNIC4suoB4fAZlBllt
	 J1a0OjiEKAUG6bS06LCumPkDbrGDxJiZf5Cv0W8tohgKfe7PyNpHcUOrXxxtfkh49wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D2MkHM9b;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345E606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B345E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D2MkHM9b
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so6018804eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794381802; x=1794986602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUKPS5RA8eXgoyfSnvQNUOAbgh7hfsrUJVAkmo79Ccw=;
        b=D2MkHM9bMVmn5KJjXCcY7Zf8IrlcQRW/j7MZfCz5t8C4trhHu6yVTgIJqX18vkhH6T
         yLp06YE/BU+HUh4VO10HdZlhwZpXGvDWfE6uBIA0EMM/lnXiEW/9U3DuuvYe0ObpI8o3
         ZP3qEXCYvt8L/Q029eGUcaEgOFN24c2VCu1yVc11KHpGLhyximDhkH0cHtiHOZM4rtgX
         rsMQtEJGvcn7hNMDhy3Yzvsz43VEAI+FYvEhGxN1p+keNAOQ410Oqa9VNAE1Ocu5AhiR
         2vBxfeS6KaFMeONHK51HLuSDa0Le9PPSGeI7hdK7ihCRqgUXBe6uqKuRw1h7ry/+/I17
         6c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381802; x=1794986602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUKPS5RA8eXgoyfSnvQNUOAbgh7hfsrUJVAkmo79Ccw=;
        b=WLBLbrOo2LGQbj3TSrOiXI/73cBllbFdyQavp7r9jfpbvYeuWJ3AWxO5/YQSfLzYf7
         GXAYgnQiU4VPjepkjikrWM0cGF09G9p87fOHgojnnBbzxSqWIJxSHA//xLnRaZRjl4ao
         Ul6ynnlNHK4bpaTlbp4EocoqATB2rI/Fs1lecegowuHgH0CseZyMe6WjmeIbhK1XODFZ
         9tD3YF+44UBcLo/NSraQhEA7k1JhyUpOCsplVw5zm2lOj4zMNJrI7UYUFUY10qaGEhrI
         yYbuo6eFSI9ZN+jItN77HG1WfqG7yxnqphG7DzbUR7r2rKh3o/nWlbnYqazbApr25oGV
         5ONQ==
X-Forwarded-Encrypted: i=1; AL+hErFT3amL78ioaM9reuEOq7ja2jFQTZHbPjNtJm00QCBBu1SUxlesrzUd+INlUfgodcecX+WUyRxIxgYD/0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oSrom5vMrMpmYxALZV3U9N8bMOiiVJ9N7OLpmN1ORMwkY4+Pu
	RKxZsGYioMAeckU/vP1q6eWcJb4EyzQB5iEsqnqFDDUXYcETgwjB+zugU+y9Mz8j
X-Gm-Gg: AYBFou3y7nmSG1Wyh9NI2htDRndoUmNmjRlZQuaR9phRxzf3rP7QH5I26tQThZkd44i
	mraYM6kzAStE7hI/FE4lnNwLZWF5wYrjxUmh8FKV2m69K215+A1SUZAy+q0AKSwy0w4Ci/FtLhB
	ICL33SSUE+G5U53L0RqB4KLzVgPxPrm9VUI8ux8eta6PpLc7qNiEdxGdzOZUEYhzzkQz8emRw9Y
	xgv2125a8xUGJ8t5lML5RCa6/a0aBO7gex9izX80jdTVVcC/7ik0ajJSna4lVExeaprkzm8Ec+P
	C670bxJYIFARfNeyS+niSByi3x4H4/4GhPaoKvsnB3ich3yzIqhggHv5y7GbJekrBYratQyeRDF
	bMaa6jc4OWOKgTqEqc8yyUUVdFH9aEPuI6E5eYFHeDT+hppgqetm1hnsRDSajY6O3EpbWt3kcDe
	bdXv6YUf0RjDpt8NHI6vT55/nMb8ntAlKX+uKn0IOkpNzsipCVdBNn4EQNfyLhVVdM2GFcG9L3k
	T7iJiXAR9JSrBcJ4yneA4OXty4lB8ZXf9GtlUfO0HAgpC+7q+NhMcBnQjVCpd3ELyHIgyR/PNZq
	PPwIC/o5ckZqVUXmL/o3EeKsMPbv0tKL9ncwQNIdim0aii38
X-Received: by 2002:a05:693c:8950:10b0:35f:2858:aa4b with SMTP id 5a478bee46e88-3768675505fmr2135460eec.30.1794381801419;
        Tue, 10 Nov 2026 23:23:21 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm14542312eec.24.2026.11.10.23.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:23:20 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>,
	Neill Kapron <nkapron@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: bcm63xx_udc: don't sleep under spinlock in udc_stop
Date: Wed, 11 Nov 2026 16:23:10 +0900
Message-ID: <20261111072310.3005580-1-hj351016@gmail.com>
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

bcm63xx_udc_stop() clears udc->driver and then calls msleep(100) plus the
PHY/clock teardown while still holding udc->lock, which is taken with
spin_lock_irqsave(). Sleeping in that atomic context triggers "BUG:
scheduling while atomic" (and a CONFIG_DEBUG_ATOMIC_SLEEP splat) when the
gadget driver is unbound.

The lock is only needed to clear udc->driver, which serializes against the
interrupt handler. The settle delay and the bcm63xx_select_phy_mode() /
set_clocks() teardown only touch hardware and are already called without
the lock during init, so drop the lock right after clearing udc->driver
and run the sleep and teardown unlocked.

Fixes: 613065e53cb1 ("usb: gadget: bcm63xx UDC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/udc/bcm63xx_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index ba91b1ebbf57..269063d19f10 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -1847,8 +1847,8 @@ static int bcm63xx_udc_stop(struct usb_gadget *gadget)
 	unsigned long flags;
 
 	spin_lock_irqsave(&udc->lock, flags);
-
 	udc->driver = NULL;
+	spin_unlock_irqrestore(&udc->lock, flags);
 
 	/*
 	 * If we switch the PHY too abruptly after dropping D+, the host
@@ -1861,8 +1861,6 @@ static int bcm63xx_udc_stop(struct usb_gadget *gadget)
 	bcm63xx_select_phy_mode(udc, false);
 	set_clocks(udc, false);
 
-	spin_unlock_irqrestore(&udc->lock, flags);
-
 	return 0;
 }
 
-- 
2.43.0
