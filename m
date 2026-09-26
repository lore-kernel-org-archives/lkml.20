Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28293AEF50
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790466640; cv=none; b=D6fmJFqX2ifY4OS66XWVfLycjFHR72Va7PnlOUqtSvQKMvJmXBo/n3B+2WmgAY6A7tVwbmep4aTWRcnKxBWxX3rdQJ9FupDtuAKsmKeakhpm6grDLxK5lvVjVFCXWU176kmCyvFnlIDDC241pPB7j++xXT1YkrQ91fhqpPAbMQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790466640; c=relaxed/simple;
	bh=yu+FWbTBNR4w3RS3h+ePS0wkYH+4aMC72bViihdyVlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmJp01nv9SAGdbUFRUQAhtyezymmHTR52v8ZvbjNcusfKKQM+/57AP/hQv/hZJC5Yz5TRja/JFQoF5ESfi9cGIVGFB/OVWsG8JfJD2Vmf6HKnhfHNgxM56yPP9ZbLRBY1gRPfAtB5D50OxT3L5qUNcTYMl9YcYqtGjAGEB2EKq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=aEvtgBgM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="aEvtgBgM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48870973bddso845561f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790466636; x=1791071436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1yHDWljL5Sb6p6flxG/OoWaxJ52niTk3EaC1lnbd/c=;
        b=aEvtgBgMiGOO3eGeaf0hZyh+eKAFrkNzilKVawgMB4xMvRBG9xpfIWUf74s6tqxKrV
         SCuurymfJjAAiea2KG+lJc0YwRpf/aoGPUu4KvXn1/pRmZmJaSDRKoSnTL92q+Yd+/e8
         7pfI88nSFaMaUH3VHYm5wanoYohm//fvjwsj1xjHlm3C+owo8tpZtzOlAg9t439ZUysD
         nKbY29RLP8xjD88WIG8dzhNblnQ63k5f+JVy3mdE0UDq7oqD4divoNPSX1CRa1muwA9w
         YNhrLEkd0A73E1bvM6RSAVJv5KgkyfdoiNk3OrRf/2beUa/1dhK51MAPCi1vAfbav8IF
         K/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790466636; x=1791071436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1yHDWljL5Sb6p6flxG/OoWaxJ52niTk3EaC1lnbd/c=;
        b=roK4q4zud60EK2pUGj2oujiwkKMQg8QxqSlMJhvB3Dsr4vUtk3fq+rUzB5MELRnqpZ
         z3Atd/yphcZFMy/mial1aj0QR4Rh/zx3ZYou+GRx1NF7IZvuiQ0iA+dEq8R2SlOyvo+t
         U13LcBahxcA2QTtROEfWZovhy1RuEOq2ZjurURrV6JDP1DyL+jrvbtT3eZ9hdSfsbM5C
         2XfLaehqN4+dpCVtMGLt5C0RhTjxNVVDPLne2V47X72KsqQ9EVwsUcgsiF+BlwIbY/uw
         7M+ykhKZGooMZRL9C15FGG4LxTPq36z+okO6ORtbdZy/LkA2UyRz0zjZhXMvqUhPfi87
         A0sQ==
X-Forwarded-Encrypted: i=1; AKwUvByiNEzQ2xJcnJJS4gaGrTZ0epJDISWKtIbt17gr9D8yNzbjneMfk9MM4zjHYfDpI6dB1x0dxbgsEwpLiI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM8N4JMCk1qUJN+oQNCTicTARkusNKUCUqYNeNoFCm/+akrQpu
	vnYUFG5nk96xOH2c14IBX3FNyBJnH9vzcrvMLcVgJPpkLzKHQauBrtKKwqDmE8MIVdM=
X-Gm-Gg: AYBFou0IDsw2uBFW2CeSJwo6/8ocycWq933JNzK8VxH3RPuwbJ6+9UWt6qe735KDcDz
	ykbysnnD34iDQb+zZtbQiY0agXLw+FjOmqxCyNaTsvIfReya1XXhz6Wq8+Rh0RTt+BLMYoQ6Bw9
	UXqDUkgVwPyf0in+kOeYbesDSHmMhMUSgRRdmo+pVeew3pdqmbLmcN1+dMPE5b9+eb4J3OULkd7
	s+CSedxPnmHkakbZi65y2+umgSffvVmrIp0zlEK6GdtLHoEDJMzprjdol68yVGECQ+3U0u3+Lnv
	XiRdxXybqLDxDpcgpbB151V8Ipm3NKzGXe4FlLdGhT63ISqxDhl7mlFtzlm5Rj5fEaKvAmpmaPp
	Qs2Cof7i0i+R2gLOmpwrBI9hMmM1w61xZ3XhcWT1YJW3+V5Cg4Lxk9k08d5zZkdmVHWaMkZkxeV
	D/9uni7ZFoiIwcVZ4KQRUQggu1atEMq1aKPOfhT0CAeGtVlymTKA==
X-Received: by 2002:a05:6000:2585:b0:488:8074:ef57 with SMTP id ffacd0b85a97d-4888074f0d9mr11291257f8f.3.1790466636166;
        Sat, 26 Sep 2026 16:50:36 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm24716798f8f.8.2026.09.26.16.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:50:35 -0700 (PDT)
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
Subject: [PATCH net v11 4/4] net: phy: restore the interrupt when the generic bind cycle fails
Date: Sun, 27 Sep 2026 02:50:24 +0300
Message-ID: <20260926235024.705646-5-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260926235024.705646-1-f@lex.la>
References: <20260926235024.705646-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_attach_direct() binds the generic driver by hand, and the probe it
calls is phy_probe(), which replaces phydev->irq with PHY_POLL before
either point the hand-bind can fail at. That failure unwinds on a label
of its own, which does not go through phy_detach(), so the substitution
outlives a bind cycle that never completed and a later attach finds a
PHY that can only be polled. Found on a Keenetic KN-1012 while placing
the restore of the previous patch, as the other exit of the same bind
cycle.

Save phydev->irq on entry and put it back on that label. The unwind runs
inside the call that made the substitution, so the value from before it
is known exactly. The bus table the previous patch reads from would be
wrong here twice over: it does not hold a PHY_MAC_INTERRUPT that a MAC
wrote into phydev->irq alone, and the label is also reached when a
second attach of an attached PHY fails its bind, where the field is
live.

The store is not ordered against a concurrent bind: this unwind, like
the hand-bind it undoes, runs without the device lock that
device_bind_driver() asks its callers to hold.

Fixes: 6d9f66ac7fec ("net: phy: Fix PHY module checks and NULL deref in phy_attach_direct()")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Both points the hand-bind can fail at are reachable. phy_probe() reaches
    genphy_read_abilities() through genphy_driver's .get_features, and that
    returns the error from phy_read(phydev, MII_BMSR); device_bind_driver()
    returns whatever driver_sysfs_add() got, from either of its two
    sysfs_create_link() calls or from the coredump attribute.
    
    A failed genphy bind leaves the device with no driver bound at all, so the
    next driver to arrive binds directly and never goes through phy_detach().
    That is why patch 3 cannot cover this path, and why the Fixes: tag here is
    6d9f66ac7fec rather than the one patch 3 carries. That commit did not
    introduce the lost number - the substitution is far older - it created this
    second exit from the bind cycle, splitting the failure off the label that
    calls phy_detach(). Before it, patch 3 alone would have covered this, so
    that is where the backport range for this one starts.
    
    Exercised on the board described in patch 3, with a debug-only module
    parameter that fails the hand-bound generic probe once for one MDIO
    address. The connect then ends in -EIO rather than the -EINVAL of the
    validation path, so the unwind takes the label this patch touches.
    Measured again for this version, since the value now comes from the
    local: two images of the distribution's 6.18.52 kernel differing only
    by this patch, injected failure at 2.0 s, real driver bound at 6.4 s.
    phydev->irq afterwards reads -1 with patch 3 alone and 15 with this
    one; the three switch ports read 79, 80 and 81 in both.
    
    One difference between the injector and a real failure, since it does not
    affect what was measured but should not be implied away: a genuine error
    inside phy_probe() leaves through its out: label, which re-asserts the PHY
    reset before returning, while the injector returns earlier than that.
    Neither path touches phydev->irq.

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

