Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915CA50B8CB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859773; cv=none; b=MzmLIUH61CfvzzVq9d6296wcbI+uI/y4igXpWjh1jSb6rlEXQZTrS8elcrrB7r7c/+Dwi3Anf/ZO8jHYiKsYyWeJXLQ7C24COy9oFTJ9aSdN3W3hOtZx0w6xOV6UhyRVxuy1+Opjk16LzBHZZ1CISqp8Oz+ICxq2I1sloA7sqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859773; c=relaxed/simple;
	bh=1seQhCsG4zTNv0vt7jmouxLcXiY3KVURT6FwgrKhTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIlruloDpXWk8Rdk+pTbwdSMrEQw0SnX2j362ARTVdgIQXsKKzioQ0v4hoB0JdeNJYhf6o0i9WUlomLaHWCBrefl5BOgpQXpz7grISkaGDpyNMnR59RgYalr3OE449JeaQnuFuJVHp0ubWobtyPhL3J8Z28IPABqIV39syXwIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=W+qqLNOJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="W+qqLNOJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso67024665e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859769; x=1791464569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xKReKDjBhMU66Cilkw+V7uGPo4uWsfjAVCm4Sm3gd0=;
        b=W+qqLNOJO8iDV1zDiW3lxrlXz7ujq5kHyYRjdqhhGu3id0lLnyLbikXAareVSYrJRL
         jKhmo9whDMtZQk9eLhCIzvDSJfN3oWbmTvF4zMpTJUMQb5u4o89ZEkURh+eVBqDaWDmY
         JczPmiTdXhxKn0AKLji2NJ7iYRGX4BvO1rLKeQpj9lt1axmWCHToudPNXmODAlJPmeEN
         uptTuP5FHDzlowQ5F5r2/Wfkf8eDz8imWMR8oug2MzlIVt9YarHVl3F1MnKr4ru0oV49
         nEndFTakT7cu6Xg7MMhGa8l2gCElO5uzmKS0ZjUTv1AAmtpYaI4QJ6aDc2wcqOcO3Fmr
         4aRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859769; x=1791464569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xKReKDjBhMU66Cilkw+V7uGPo4uWsfjAVCm4Sm3gd0=;
        b=SXHa+CuXSb2lQ/Dos7wubRM99g/YPwCRIGH+LyszPj9YKcmuxD26sjeZ53oBNehFr4
         fiJMpe6LnDSRSGFdHxot2sJdZ+g6/PxUZkpWrLq4GG+gvhxQ7qvwRWbC8/24a1m9ELFW
         rKjUu8wTu8Syt8VIb9MylRz+bxvyT+zchUbc7AQ2S9qPAyuNvGJIa/w5WHaX3f0Tzaeh
         9sqUlZBEjB3u9lfarYF4Mv2qsi/H4zoTZDDcmL/wqH3wUZMIKJlr43ISxbGFYUTb/Fum
         OyYyM1KIsgwYFsvIOSz6QlNerTGdSYo1oPCnQjUCWsnOl3Y0LUJWZWxBaNcQFXtkEZ6L
         FMag==
X-Forwarded-Encrypted: i=1; AKwUvBwwL7sV8POKktXWf9zfv6y6OOpMJzBed6r+6O7iUVWWG4pvPUDCfwHwwux0zIpHJQ033J1Wzh6BihRluVs=@vger.kernel.org
X-Gm-Message-State: AFuF++kwM3rKqhtncV/2vCQlDiWbuMxEPmxynVXMK2ThHsen3k3tmSN0
	rtO0hGWuYSGTjzo9a9XZh4f6Io+Fxj0lKppYJ7qTzr7/girMOmZrm9u8WAgtwgOD9y8=
X-Gm-Gg: AYBFou3seUIMxHEUqpIGhl2NeNKZJ9/msIYz+6CqQxz+qSD1LmfPnTRmzZYTWLftu7Y
	x7CHagMqoh3YBWl1us/pK9cBINGNiCozXOrKQ0j5IUV9Pz2gk8UH5+GlW0qnf/+mLgogjADWspK
	gq+RXzurnFL5WdKoGs7EjrreGjY4dBL4ZLETQCtFtFJfaL86YZssjT6iSChoR1yGyuixAV+ZQkH
	sWDYYTcpTHwYyksAIrS4pvbK2JB5YJ1f74NtPiU6bWC1964MzXEw3hp5oMr3G/dSjMn4XPvO+Cl
	C/H4L8NnsOdpY8oE6/i+vlCLk+PVuwsIJkTc590rvivYOAp+huPIUcsgBLpBDSvTmNMobTD3lYj
	oqaR1Fy5vnXKcwmev9QlJSl5LgBYVnySuIl3gnpokTkoulNWeJGKo+1C3L+XT3XT+4wOP1foz1C
	+kaQxDSgCczsrpj5TaqzW/CO70TMndQy3FdoOBzQGDv3338sXGKg==
X-Received: by 2002:a05:600c:638d:b0:4a0:21b9:a55c with SMTP id 5b1f17b1804b1-4a021b9a5f4mr37206285e9.29.1790859769574;
        Thu, 01 Oct 2026 06:02:49 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm48051775e9.2.2026.10.01.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:48 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	f.fainelli@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v13 4/4] net: phy: restore the interrupt when the generic bind cycle fails
Date: Thu,  1 Oct 2026 16:02:36 +0300
Message-ID: <20261001130236.106059-5-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130236.106059-1-f@lex.la>
References: <20261001130236.106059-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When phy_attach_direct() binds the generic driver itself and the bind
fails, the PHY is left with polling in place of its interrupt.
phy_probe() has already replaced phydev->irq with PHY_POLL by then. The
unwind does not go through phy_detach(), so the restore there does not
run, and a later attach finds a PHY that can only be polled.

Found on a Keenetic KN-1012 while adding the restore in phy_detach(),
as the other way out of the same bind cycle.

Save the interrupt number on entry and put it back on the error path.
The bus table is not the right source here. The same label is reached
when a second attach of a PHY already attached through the generic
driver fails, and there the field is live. The table also misses a
PHY_MAC_INTERRUPT that a MAC wrote into phydev->irq.

Tested on the KN-1012 with a 6.18 distribution kernel and an injected
failure of the generic probe: phydev->irq reads 15 afterwards, and -1
with only the restore in phy_detach().

Fixes: 6d9f66ac7fec ("net: phy: Fix PHY module checks and NULL deref in phy_attach_direct()")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v13: the commit message says who binds the generic driver, and which
    second attach reaches the label. No code change.
    
    The Fixes: tag differs from patch 3 because 6d9f66ac7fec split this
    failure off the label that calls phy_detach(). The failure was injected
    with a debug-only module parameter, once for one MDIO address.

 drivers/net/phy/phy_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index a9c71a286118..8bfb154402ad 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1755,6 +1755,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	struct mii_bus *bus = phydev->mdio.bus;
 	struct device *d = &phydev->mdio.dev;
 	struct module *ndev_owner = NULL;
+	int irq = phydev->irq;
 	int err;
 
 	/* For Ethernet device drivers that register their own MDIO bus, we
@@ -1896,6 +1897,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 error_module_put:
 	module_put(d->driver->owner);
+	phydev->irq = irq;
 	phydev->is_genphy_driven = 0;
 	d->driver = NULL;
 error_put_device:
-- 
2.53.0

