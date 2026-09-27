Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A113D44062B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553471; cv=none; b=fx5OIpSyjeUpgHUMq50X6qC2EGsDmD3EXEv6DgwXwASxQuYGZFJxOS2wZoz+8Q85U1Vb+LtxqP3tSE98Q7IP9ziOayN6FyatcXCVyQYFjDvmpNMXT06WCJ4EaH7yKcYj/UTJVOf7Sl0d1DXFheeYaQayNr+EvNjI4qL3NYOwpfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553471; c=relaxed/simple;
	bh=DTm+8VkU5gcH3XgRDOy8kN9YKZ+MZN+K6h7Y7ZTzZkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqFzo/kF27Yt1tkISC35QLrXRfPSwdK7ihtq8m9vUBACPah6pKOKwZBziG+JM4hI17mIuuECl1WJrHA0QQvUp+dVsBiEf8bIV+MnU9hTcBbGAQT1A/Xuv3WG+AVMMk6xFti0QvkOQKbQIrR1OmwgQWK3CGJKEuyrp6Uw90wrEX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=EiWrHDvo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="EiWrHDvo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so18461745e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790553465; x=1791158265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZ8p/NVIadAMhbwnanN8QfTI2Nz4vTcQTSBnLNkkJao=;
        b=EiWrHDvoGPu1pv31N0eklGwGWwdl/XhlLest5aA9BDbyED0VD7KzLIeINxU6L49ZX1
         f5n5XF823gLQyRCaR/vV+MsjCzgtNK9tWnfntpbLIVplARWK8uM48Mj9gjg1fBI30ksd
         t4YJUAFYoOujuee1XGT80g3MUDoAjuRSNULPNd7GJHpY6IK746LsF6Anv0GG0syPeiO+
         9xCd8fqcDHz/8WoO2QfKDl5ranjgvCTDB2M5sU9krjJhL6sx38cuwXH8BuxJeVmCFokF
         1U0ehmgIUzd0KDhY43bGm+NIHEI1h5W5N7VKqPoMOOFM5vMtPf0Govc8VDd4qjo9wt8w
         Z6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553465; x=1791158265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZ8p/NVIadAMhbwnanN8QfTI2Nz4vTcQTSBnLNkkJao=;
        b=Bq+9UVeEyOUdSKdQ/8+WvyeixZz6byDAmfHZzaWNlJlJ0H/k50mDMnGPA9w1r0GyPz
         wNaswcp6ww4bMRPdaS7ozL8RQC49MuMNLkYrZNIinQEq+4Itb3Lg6KKPyJyQ77vmoXf1
         8saD8fbkeKuU6bu/rZBz6Lgs7husDdjKVrzWQu40gy1EsCPLxaW7fAYzOEkFYjx2L/pp
         ICly+joxpvVzklNDqB+vlip/41T2MHNn37Ze7nfgGClo+zZjEHTNniMDjr4muNgd2gI7
         bcaPDUlzX4SHD6oAeu1I5wy3/7RO2OVKcdHM2OXe6Y0k+iJUjRVqvFOy560HbHhslgso
         DbVA==
X-Forwarded-Encrypted: i=1; AKwUvByPOcsmNhdyTjU8X41rNkCgsH4yExt1B+FYQEOF49V7t7JeA8ZIJCHxFattZy9TtH6Jb0dBJomZOHi3YOk=@vger.kernel.org
X-Gm-Message-State: AFuF++kcDF3pfk27z8q/RcZMbvdnYsgJYV3GfYX57VIyYR+elnI8Q43S
	VMAGvE/ijqLz5Z0Wh5MTiaORhdUM+ra45DJZPfpdPRtInqZ+jLyoYTrF57D78ELLpkc=
X-Gm-Gg: AYBFou2TTy/gLHoUSlWuZf/ekZLFHbHvQ9VALFWs2S3EqKhmXkGe/rALG6cyA32VmME
	CtYedN4u6RcO3DjRHGO0VhcPnEJywMpvk4acyPdmDzlR490xQ8zyI4YlNfx5Y2ceUJEzx9YZKgx
	4NF5PofIH+WwuaUK1+Euxmq5lJ05kfdqYSBhywqL60plsUYUaEfBsAFd3gzcQFP1LxT+7Kkmhqq
	YArY/sqIOiPayoykhcb7orpy4a17ADGB9VgHoFkiy/zM5H+WiPE1QVHvmiOpeUMYw2wqKqKj503
	pOXonFqzigl2RFEBppiO/5jxqMuuYVoR89ihtbKW4KdttyvSu1hQricbyFdrGYDFDNI8nVdHle5
	pugKbk+90H8F/vcQw/gah/adpkSKxk2ez+uQALSQTmVsCF0HWFMYwq8QIYtAwWZjS9vwUvJPc7x
	mgUkmVo/kHKBEkvmqa7Xhhb2HOlu3/GyqPXF15hgM2yFsHMY2dCw==
X-Received: by 2002:a05:600c:37c4:b0:4a0:b6:460f with SMTP id 5b1f17b1804b1-4a001e8c579mr42530565e9.33.1790553465459;
        Sun, 27 Sep 2026 16:57:45 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm137971495e9.14.2026.09.27.16.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:57:45 -0700 (PDT)
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
Subject: [PATCH net v12 4/4] net: phy: restore the interrupt when the generic bind cycle fails
Date: Mon, 28 Sep 2026 02:57:33 +0300
Message-ID: <20260927235733.2619081-5-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927235733.2619081-1-f@lex.la>
References: <20260927235733.2619081-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the generic driver is bound by hand and the bind fails, the PHY is
left with polling in place of its interrupt. phy_probe() has already
replaced phydev->irq with PHY_POLL by then. The unwind does not go
through phy_detach(), so the restore there does not run, and a later
attach finds a PHY that can only be polled.

Found on a Keenetic KN-1012 while adding the restore in phy_detach(),
as the other way out of the same bind cycle.

Save the interrupt number on entry and put it back on the error path.
The bus table is not the right source here. The same label is reached
when a second attach of an already attached PHY fails, and there the
field is live. The table also misses a PHY_MAC_INTERRUPT that a MAC
wrote into phydev->irq.

Tested on the KN-1012 with a 6.18 distribution kernel and an injected
failure of the generic probe: phydev->irq reads 15 afterwards, and -1
with only the restore in phy_detach().

Fixes: 6d9f66ac7fec ("net: phy: Fix PHY module checks and NULL deref in phy_attach_direct()")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v12: shorter commit message, no code change.
    
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

