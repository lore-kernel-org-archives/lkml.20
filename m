Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800643DEBD
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553469; cv=none; b=nHeMnESDktllomFptVSIdw6cD3+UI+aRZ5VxlwkPrsCRpCiVIgnY6bnNiRTEOJaofyorxe6Fm+nkyVYdqL64pZD22Poq+hjENrv5kWhZyLA0x6giWHxLRGoUzDMJ7zrbWkBOcYH8WjLj6NVOZN+PQ+NPaFL+6LkgeG04kjEeCHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553469; c=relaxed/simple;
	bh=DglIrrDXllyhsuTDAoN4Y2DXS2rVZd1hX0AlaVyvY/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXjx5d4NXPMQ/TEgJO3pnOK+EDtqt/YERJBlDDaqyP/BWenP2mJhXgm5P+4kbEaIaYOzljLtr5brMoSs9/FQME8Ic+WZ0NFzXgcmF54vnUn0FWWjyeQbsIEN7djZnbaq4iytskT1RDfP1LEQJiPiLzoUz421haXH5haK+/reEHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=WJp7xzFN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="WJp7xzFN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso22921125e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790553464; x=1791158264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqY7rv9uom0DquimJxa+2jP2W//BGSFqhleEITvxJnA=;
        b=WJp7xzFN7fLX7WsdmmmxQcZdAj5+PPQA53mQr+l4ueta3UrOEHA6Xhxvh1lFTuR0YV
         k9rzYA4Ej1Q8eHSxVNRBOWYz5IXVIy+y0BXjt6d/MVaLUZeEQfR6XYzD6FTbIwkmvLxz
         HCD1BuAEk6Bi/SnUJAgpBXK27YKI4HdJ8qqYNDXt42eqm8V0daYcyMS+0K8okQJjHygh
         Wq8R0BMZmL/9lKgPqA2FHym+XBtmD9EtrUcDXcwZZPljy/hHiKjdZMAyDRVk0Y9n1P5Z
         AtOI1xG2rhhV0hk3VPMwjnLuhewVDx2b5/QMskgXeOPQXLE+68sw1I3CJcb5KS3WnBCZ
         HsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553464; x=1791158264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqY7rv9uom0DquimJxa+2jP2W//BGSFqhleEITvxJnA=;
        b=RjdyyWUAnJhM4rxO6cMLvXAOJHYUhwqYaZlN91ApxUdypRCPjowzNjjEXp2uOKObZc
         Z1j6UJDwybGdG4MZS6sv4eO6zfJjWzmF++3S7zTLiWvqFxEAMvX8pNeLzwSv8o+B8D1U
         gxMFxfDJxBRjTWRqsP876bRuIWQoTFS1WYvPjOaZf6sPaG0s6IENuAZJcwnhVXMcMVWv
         bM3EW9iqurXkPvqmBPdmCaeuWbuH+hYhkpM3vXBDFmnsOLH+W0vTjBg5rHQdrf3DmtJX
         9yc1ERStdhWTXBPUtW4h8+1E6c+eEdLVu35143MOgOMqEBVe9GrNkq2lxoGJ8QHiqtIl
         nQhA==
X-Forwarded-Encrypted: i=1; AKwUvBw3C/3MuY8X/d6xnsRnUYual8IjBgA7JzeT1YOb3GoW0oDGcsbeod7wQY88dL0x87DvxCQ4KpquyME02ao=@vger.kernel.org
X-Gm-Message-State: AFuF++kmLyFcTBFQUs9nnsnJxdlE79t3a/MMEN/c4m6SpmfPecNmflcy
	F9cLtT63GYz2Eijkw+ClI4v07vJEtImGIcfs5nXMfslPonKioa+9sLgGk42qfH/K6T0=
X-Gm-Gg: AYBFou0wasOXeLApVJ+ZLjwiwJuT+5Y4oasXfNAkz6WYzQgt+toVw0/ZRPJfi8WHKT+
	/Pr2FeRF+0wagWeNNSSkBuqTTTEAPi6ew+JX3UuWdY+/tssghMOr2GiMihNb3jNkYcU9TKnGqiu
	dV7Y9UjjwJ6DHCe1jsftIi/pRFWUFNlLAaerWisbaFaanlj1FyJJ3ckbsK83whhDmJ8gSr/LDJU
	NIwUmFQ1CK3taIQ6aEEjyeXgtWI9f781iLCAzWHyyJczVe+4hKCT0Fg2JmlGyXeQYGjpSX03WuW
	6FcrIBT92/4jwXj0dXcvx87uMUW8/pl2Kugx/DHDDqoDQId8uqYxMf4OOZTqFeJ+fhP3fgNLrbz
	2a0uclEKMIjFzH0RvOKeh5wUXaAGzCgQfr+MY1I5ZV6rgVt11iFkUmpY+/Rii7JUoZn3jbOoqsf
	v6uTyWQW2NL41e6ds9EAlZ9THulw15YCdNmHnSRww7RuPDr13TEw==
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-49fe66f4c72mr207314845e9.19.1790553463941;
        Sun, 27 Sep 2026 16:57:43 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm137971495e9.14.2026.09.27.16.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 16:57:43 -0700 (PDT)
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
Subject: [PATCH net v12 3/4] net: phy: take the interrupt back from the bus on detach
Date: Mon, 28 Sep 2026 02:57:32 +0300
Message-ID: <20260927235733.2619081-4-f@lex.la>
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

When a PHY's driver is a module that is not loaded yet when the MAC
connects, the PHY gets the generic driver first. phy_probe() then
replaces phydev->irq with PHY_POLL, because genphy has no interrupt
support. Nothing puts the number back, so after the real driver binds
the PHY is polled for the rest of the uptime.

Seen on a Keenetic KN-1012: the Airoha EN8811H behind an MT7531 port
has its driver on the root filesystem. Its devicetree interrupt maps to
irq 15, and after the real driver binds phydev->irq reads -1.

Restore the number when the PHY detaches. It comes from the bus table,
mdiobus->irq[], where the PHY got it at creation. Do it only when
phy_attach_direct() bound the generic driver, since that is the
substitution being undone; otherwise the field belongs to whoever wrote
it. Do it before device_release_driver(), because after the release a
probing driver can write the same field.

The store is ordered before the release rather than locked against it:
device_release_driver() takes the device lock itself. A MAC that sets
phydev->irq before phy_start(), as phy.rst describes, is not affected,
since the restore runs on detach, between connections.

Tested on the KN-1012 with a 6.18 distribution kernel: phydev->irq
reads 15 after the real driver binds, and -1 without this patch.

Fixes: 00db8189d984 ("This patch adds a PHY Abstraction Layer to the Linux Kernel, enabling ethernet drivers to remain as ignorant as is reasonable of the connected PHY's design and operation details.")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    v12: shorter commit message, no code change.
    
    The PHY module was made to load after the root filesystem, and the
    distribution's own late-PHY patch was removed. The value was read with a
    debug-only module parameter; the three switch ports read 79, 80 and 81
    in both runs.

 drivers/net/phy/phy_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..a9c71a286118 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1965,6 +1965,8 @@ void phy_detach(struct phy_device *phydev)
 	 * real driver could be loaded
 	 */
 	if (phydev->is_genphy_driven) {
+		/* The release below lets phy_probe() write this field. */
+		phydev->irq = phydev->mdio.bus->irq[phydev->mdio.addr];
 		device_release_driver(&phydev->mdio.dev);
 		phydev->is_genphy_driven = 0;
 	}
-- 
2.53.0

