Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC256B862
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882634; cv=none; b=UZkmUARKt43fdBygDz2d1EgadeVxJ2a4Bh8M6r6BekTOUsv0zYGAZBOOJj33kMsAYRCNiqb3wZUQlNPTZWJjkZnSSAMlsRShSOhq+c2jrsdJUx1U196p8d2aaky0JGGciqJXFQhuna6GxKgOcKaFl6d/hChlFp/S7QxJsWx9lG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882634; c=relaxed/simple;
	bh=gtbtPei26NBxwIm4I+X5O9DzXMAMA3I9C/Tm0Yf9Ykk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5IGhq07yWZAISwT6eD6OTRajzc/ML4/Jvt6Jse9QeVd3e6+TeD2wWG7HRb9ldTjmktwwq8FqXqqHSuzXNBZu9id+srp74eCncBDvIP/3jtOT/ix37MLNBXHvyR8ju7wVtLU5jWIUZeyLj1EiZb5+bijY4g0uDHLxoHPp9JzrVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=NQoQsYM4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="NQoQsYM4"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482f9309813so4469872f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788882630; x=1789487430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bO7Bfy8ufcVVG4fz4/9HKHFZXDmM8/J+B/IYDh0YeSI=;
        b=NQoQsYM4VjFIwCULM3VfNZaWczcaZf9RWUA25AdXuHKK/PXvp36NeXSzPepkp8tWAi
         GTbPW4/QR2FpwAsrXz5f3sU2/GLPw1QNjwjEoKeRqIgE8c3FYMoPVNYpDRwhie1CyYdb
         58S5LVp/c7UDtKNyNdvlESBnnLH4qG0+B8GoiIQ9RACp1LX3xxUCVAYzqAVXoMnytTZk
         hqO99QoK8rzMmSuYuGm3V8+uIV1VK4GABMQ8Lv7UiFoiLH476kEKrW9NPx2Wb9+2Zwxk
         TPCrXvC3TkKDNacftuGJD9CvDSaN0wYbXkC4bnZqD7jge4vPUrC29sjBI7gPD9YFyJSY
         SVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882630; x=1789487430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bO7Bfy8ufcVVG4fz4/9HKHFZXDmM8/J+B/IYDh0YeSI=;
        b=YCmyFGOtxTVhv6LOmYRwOMzISAHuC7D7EpGNeT/08l6PO2/YCc2NtQ0CCgpyraayZ2
         ZILL2yAn1CQzwVLuXMrGk0NSyA9vVVm8+8K+ydmFogCzvFnmCFDm/ZuHTe+a23dx+8c6
         wMnmULy/ahZe5uoo3sKwFj6/yy0S3eJy0LBqRIBN6CFP9UWeykPMgu6wVXrRb9hVsLLZ
         pGFmcVFf12CG3kNMi7YjRtIxEgxh10qnxyXORxlla9UFoDkfyQ+Nb2xt3W4CPc3dWOA1
         Kc49FIsFTl6jhmODHEmQJ7Gt+2xCU2CPp0gtO5nRqRleDw2vYrMFcmoOU1pgwfjoN2QX
         vbNg==
X-Forwarded-Encrypted: i=1; AKwUvBwtWnBz7dOJUUcEgQEo03fyGc4KyQOsVk3ZW9HvuyF6s9k4rOFwP4rOgcagCd+ZDFq1R3vbZf/UOMJReGw=@vger.kernel.org
X-Gm-Message-State: AFuF++niN2kr/7JtQqvPY2LQk4BHtjGDMWXsD0T8sbxwRl5xhYS9wvzY
	A2lCMv8jGYCO6GTVeaBmTWKeRCFQURhlJv1tLhBBopNk44wUrUnR2Os/8Cfw4To17GU=
X-Gm-Gg: AYBFou3n062t3Mfve2KbO1jjjIYK0olUlBkzglZj9J5XO420ifSyd9qMJItMfWMVrS7
	mUeVosPLGdw1LDd2vywXvOucBHWRuzwgqwPig2Lt2cTnjh+Hyf/Px+b17eFAV+b6iI7B+K/vaT7
	3RHT+lvza9tS+pAMZUSne87nAp68ztAsbYtMFuJdmryqY2/JgcYsJBlKu6yPqLPAL61P13MYpIX
	f+tU1b7Y0XAn8VR1O2J4DVfgbQ5BFiQjSo4c1fksDHgm4NTfwX0Y75bTjMeoS8iNUpvSwB/zq6E
	5h8A2wE/dS5nc0kLAhB6yQV+0R9CkB/leieXhsPyC6xZxCZKEvX0NL+gf5nrxcuDzzsxiLgT/RL
	vPi4hD3hM+rJeSfQTkA6hCbtCo9tYjhXf0c6PqfziH2hWd4wMSY/J6/Fq5iOnp6AtN0V8ztGrfc
	VlA7JIZV2mL/XfbeJaN8ckNqRsFXKN2F4yBP9itUg=
X-Received: by 2002:a05:6000:658:b0:482:e1b0:8a1a with SMTP id ffacd0b85a97d-485872addd6mr29202076f8f.15.1788882630229;
        Tue, 08 Sep 2026 08:50:30 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm40869652f8f.33.2026.09.08.08.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:50:30 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v6 2/2] net: phy: restore the interrupt the bus gave a PHY
Date: Tue,  8 Sep 2026 15:50:25 +0000
Message-ID: <20260908155025.4155289-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908155025.4155289-1-f@lex.la>
References: <20260908155025.4155289-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_probe() replaces phydev->irq with PHY_POLL when the driver that is
binding has no interrupt support, and nothing puts it back. A PHY whose
own driver is a module on a filesystem that is not mounted yet gets the
generic driver first, loses the number there, and polls for the rest of
the uptime once the real driver takes over.

Put it back from mdiobus->irq[], which is where the number came from:
phy_device_create() seeds phydev->irq out of that table, so the bus that
described the interrupt still holds it. Restore at the three points the
bind cycle can end, phy_remove(), phy_probe()'s own error exit and the
unwind in phy_attach_direct(), so a bind that is undone by any path
leaves the PHY as it was found.

Skip it while phy_link_change marks an attached consumer. That consumer
called phy_request_interrupt() on the PHY_POLL it saw and would free an
interrupt it never requested.

A bus whose driver writes only phydev->irq and never the table is not
covered, because the table then holds PHY_POLL and there is nothing to
give back; lan78xx, smsc95xx and sxgbe are in that position today and
registering the interrupt with the bus is theirs to do.

This needs commit e0d1c55501d3 ("net: phy: fix
phy_uses_state_machine()") to be of any use: without it the mark this
skips on is never cleared once a consumer has attached, and the restore
never runs.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phy_device.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..b55402569300 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1734,6 +1734,19 @@ static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 	return phydrv->config_intr && phydrv->handle_interrupt;
 }
 
+/* Give back what phy_probe() took, from the bus that owns the number, but
+ * not while phy_link_change marks a consumer: it skipped
+ * phy_request_interrupt() on the value it saw, so phy_disconnect() would
+ * free an interrupt nobody requested.
+ */
+static void phy_restore_probe_irq(struct phy_device *phydev)
+{
+	if (phydev->phy_link_change || phydev->irq != PHY_POLL)
+		return;
+
+	phydev->irq = phydev->mdio.bus->irq[phydev->mdio.addr];
+}
+
 /**
  * phy_attach_direct - attach a network device to a given PHY device pointer
  * @dev: network device to attach
@@ -1896,6 +1909,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 error_module_put:
 	module_put(d->driver->owner);
+	phy_restore_probe_irq(phydev);
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
@@ -3820,6 +3834,8 @@ static int phy_probe(struct device *dev)
 	if (!phydev->is_on_sfp_module)
 		phy_led_triggers_unregister(phydev);
 
+	phy_restore_probe_irq(phydev);
+
 	/* Re-assert the reset signal on error */
 	phy_device_reset(phydev, 1);
 
@@ -3848,6 +3864,8 @@ static int phy_remove(struct device *dev)
 	if (phydev->drv && phydev->drv->remove)
 		phydev->drv->remove(phydev);
 
+	phy_restore_probe_irq(phydev);
+
 	/* Assert the reset signal */
 	phy_device_reset(phydev, 1);
 
-- 
2.53.0

