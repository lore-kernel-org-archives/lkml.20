Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222606;
	b=aH2omwTC/E0oj4OyVtIiYhp9NQuWDMyKQOo8qT1Hi2YkcNYm9heoG2MNw1NM+mUHWVFR
	 Wsg/ZFpbMiPWk+YGggGs1cYhj2MfH4IvdqSyBAUeXfJr12Da/rsr0jV3iyW8E6fJjIxw2
	 JqwA7ErJ8DIrsoj1cvxyaH3xu17+ORvlugvXH2feMdxFIS0PzhafdI4g5NU3eJhwBKNdZ
	 Xh7wT4E84Vct/lsddc6OrvvXieX04hzmtpznksx6Q3yxqppUC4F3UFMErLbemb+YUhFAI
	 LCedK2ryKBNumbs1qU2/9m1Rc6Xa5rlxEw67U8L9K52LY6cfw+fnPBTLGypSY487B7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222606;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
	b=uj1a1+v9KboUHkplLS1bd02tvE6MLsYIpEYomphkpfiKU/HEmo2+gv7AkEd+ht/e8BGy
	 o1tZ3D7tPcVbJrf7mkb88l9V6ksV2mXx9HhJi4GVXVDy6Nv12t5OboC92m3a9MV6n3qFr
	 al15y8qRWARdNAX1baZdWlLYGmA/hLr60bWKxXwhquxxmxZUw6tnJPzRFohKDtojo7cFm
	 79aqi+CLpY2myi5+ZZIwJM2NyXOmdc21P9DcpEiAK5cPDSuMnSbUtef5RdXR/Q7/PRn8J
	 rcNxc9fbraOCzxqI4b2+nNBQK3rfL0CA55dZEMpXwoPHm2qYH8+hdZMtgwsanwVsZjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="RQ2AXx/A";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59760A261F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F59760A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RQ2AXx/A
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso840283a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222606; x=1793827406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
        b=K6KIcS+NN/8iJJFh6HrSGKTkG18FOC0YJfeRCmA9yWhfCTInmV8/SfG3wE4x3qJ/7Z
         /Y0sQyRNLbwmDVSggMWWRsPmuhxvUw9nF7X9RwZxX2hUk1cqbwZfDeymVuzj8LX8vQ5r
         KAIgKyNuJQuASqL0rLyCmZyqt00j+x5sLDnr8uQTeqRmi9e3tH3ZcjmmoVqGtmCfFKDn
         zXwP3V8g5U9ZBe5BsB6bliEkgmWF7agOyjLbtHOes9trr2nhhwm/DSAeb1q4CR4tNEcB
         Z2WSSAblK9bkTqTGZ5xOaVVQnxiBgXpOB52mSn2Yi4z1HGWf84fbynhHrWOgvZPguv+/
         Z4ow==
X-Forwarded-Encrypted: i=1; AKwUvBx3A6bTlbPGtxOPtAAVmlqZnMSmNVz+q1W9IubfqSyytAF/0oNwAv9cem4ELAsed/2S+EGpZAcw6rxuSzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtqcNPuEdcmoAbTuvpCX7cpCN5e7S7FUnN37QXuEX+cs9VuVOq
	G9Nwai7ugVi1Km1PJJsDfry+GG9c6j2tSYZ6kd21zR96sgwkmshtU4LKvUTtjvjIwVP00AT6f8M
	Z56R0MmgiF2DxEt2gXScHHnS6/T8My4ruq3aTRUZ4NA8ww/KmlRpoiBWYAeE99F6G48kpoDDB5e
	P9tufe9CxziJkzEARtAX3GBdmJMWsK1y147smQWrNrgCEsza6lX0EgqOeOUPv283ivhKs/V/YQ0
	uu9YGI2Io0rzw4S4B9K8rLf
X-Gm-Gg: AYBFou0uQ+kcnxBK1W3BesRKW0LHcc0FISVJglqnMjFgQy3wJU5R/ihQsjdJdveJEb2
	UpbA8KFnFK5jOJTFqlD/XIUf33Dsb4SxLdl5rjInyjwMl7sClz1YpeLbD+7gDUxV33Zc66HfK8x
	wtrCgOnjNUGDKT6cTTLyziGQ+tQfpLOUuBYjCM7dcmaOVQGy1pTQw9IBFEXnXx+OfA5IuL4urQz
	8bmq6NfqT6pzUChpwG/OfoWcvh3sCGv+kW64khzgz7rqxnSz5mcjIot3D3bhutaO7xQXm+yJFvW
	Ffat5mElTasvw8iFsxogelcBaSXmx+e1IggB3ZKqUnUK79wD8XWCZm9xfMAsP14bkp/1/KREpJD
	rQRaRWxcXS6StdeeoNj3g6L735zCtqocJNz3hZs2sKsNelwRKcuP/pyHA+dhf1NXByL+zhw/jP4
	EzrOJ3Cn1gBZ0xNyKJv4o08oo53LaRLmHUkgMIZK/E
X-Received: by 2002:a17:90a:ec90:b0:3ae:2961:14db with SMTP id 98e67ed59e1d1-3ae580af9aamr2695400a91.21.1793222605680;
        Wed, 28 Oct 2026 14:23:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e6efe86sm545956a91.1.2026.10.28.14.23.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:23:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so204744385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793222604; x=1793827404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
        b=RQ2AXx/AEmTOkGwCqivWPHmGfr9SaJGSn4nXt+rK0bL+z0JLNs/4IGcB+mmAK2hzUl
         Unctm3jfJ29kHpI5oeI+V3UcHVVkmgdpz5klDu7+2Suf0EHn0SciRCU4dP1KUQJbtt+J
         uovbUAZn8qclmyPIrAtA6IGi9YV5rXB0ymyts=
X-Forwarded-Encrypted: i=1; AKwUvBykb0ws+KkrRqCJ14dyOUKYNbYRGsU4Idk3KObKV4eaqh8c1rNhKPOVTrgxvwiKMzGwvuDTII613tgkYwU=@vger.kernel.org
X-Received: by 2002:a05:620a:400e:b0:939:6de6:9518 with SMTP id af79cd13be357-94408a9275dmr560954485a.47.1793222604585;
        Wed, 28 Oct 2026 14:23:24 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:939:6de6:9518 with SMTP id af79cd13be357-94408a9275dmr560952285a.47.1793222604237;
        Wed, 28 Oct 2026 14:23:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669112sm1368755185a.10.2026.10.28.14.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:23:23 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 5/5] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Wed, 28 Oct 2026 14:23:10 -0700
Message-ID: <20261028212310.3847553-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
References: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The IMP and per-port GMII override registers swap the override-enable and 2
Gbps speed bits. Using the IMP speed bit on a GMII port clears its override
enable and leaves any previous 2 Gbps selection intact. Select the speed
bit alongside the register and enable bit so lower speeds clear the correct
bit and 2 Gbps sets it.

Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 378f47e7250c..75033b28100e 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1370,17 +1370,19 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 				  int speed, int duplex,
 				  bool tx_pause, bool rx_pause)
 {
-	u8 reg, val, off;
+	u8 reg, val, off, speed2000;
 
 	/* Override the port settings */
 	if (port == dev->imp_port) {
 		off = B53_PORT_OVERRIDE_CTRL;
 		val = PORT_OVERRIDE_EN;
+		speed2000 = PORT_OVERRIDE_SPEED_2000M;
 	} else if (is5325(dev)) {
 		return;
 	} else {
 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
 		val = GMII_PO_EN;
+		speed2000 = GMII_PO_SPEED_2000M;
 	}
 
 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
@@ -1392,11 +1394,11 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 
 	reg &= ~(0x3 << GMII_PO_SPEED_S);
 	if (is5301x(dev) || is58xx(dev))
-		reg &= ~PORT_OVERRIDE_SPEED_2000M;
+		reg &= ~speed2000;
 
 	switch (speed) {
 	case 2000:
-		reg |= PORT_OVERRIDE_SPEED_2000M;
+		reg |= speed2000;
 		fallthrough;
 	case SPEED_1000:
 		reg |= PORT_OVERRIDE_SPEED_1000M;
-- 
2.53.0

