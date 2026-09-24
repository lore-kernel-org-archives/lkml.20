Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B84DAF90
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287202; cv=none; b=e5tJV2FJA253fnBgw+N/je9YjGAOVq2FyzP/wvsk0YZVzPrCnWwlAMJwU2QWOY597XI0eXJp7Ftl4DqxbF6uTvBdSkoEvVne0LkwAqN6olEos8cUhi/xLKlUHYp8m7nFY1vMBVsBMnh/+Z0W5sV5nbu89sBl9unUrRtOyXe3C0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287202; c=relaxed/simple;
	bh=vEy4ilH+KqsEZF3cOIjyFr9T0T/kUsGLP7hbMpz+0Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOS9+zNwAvEVJ8TEgp40wFmB7R0OC4X/MVBSy9RMr4Fpkaod5NoGJuq1GlUB5uCswcS8LgsrF4xeRKKOx1ruUzaVE75W0btHKgl25+fVeL/VBsL0dhjPQr7asncfOsORImxOn4a7ckLrirR2MO4zWW3BEhlQjj7jL/5zkYGrlZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=V+JsaQuW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="V+JsaQuW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso3020645e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790287197; x=1790891997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hECQ91MjmL9J8JDRPNlgIqAOO9M9chA074io5HZLms=;
        b=V+JsaQuWrCh81zWhB/brhgWaE3+h7l4y/BdyrxmhlnC/kTn+hXF1xQNd6ItGkGq3qc
         3DQmsXHlSfLXzAcLeY7s2+jRQSIktopVtv3uj+pyyavx0VrzVGduwgvtf6CgBZj6Fq4H
         SY5NQ8ZWgnddp8BiIYxoLYczzJqxNmV6ABg02rKreLsruuidMIs/7JLxoU/RLTX+NanL
         qtbF+p+M0VD85drK5GH6wiiiJBCkd+H1rfl/6KOerH3oLcD9W1GpUjLlh9pKbjs+rTu1
         w7H9sgsGIhXU0Ar1aXTiv3SOLoj4PeCUbEAvWETbG1fYhuAaPS082HodPcohPPFinPaa
         9SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287197; x=1790891997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hECQ91MjmL9J8JDRPNlgIqAOO9M9chA074io5HZLms=;
        b=uFkEtfZuVP0iOz9VVhMIlB/YQHRonWQhKzA1UjWw2vVY5j2XzZFo0vnv14JZngoIPg
         VtEtNDAMjEsbEAo5xdkI7XhUWIkICDIsUZSFzkJK2LVvT6gzfnRAJEbEh18btzPp/Ruu
         1rYbxtxx9+YROnAFy2piFxMZ/S9SAcBuM8Yl5m/71UfqLVMhWP6a25OpbgfPy6Q1Pz0q
         tmDf6ZJvs1KFwPLUVloi9sVllPSx47HoDF4BVOWlfeaX4iH/cTfvIEKfXCLSo+HGxmZd
         6N6P9ExsXcWYD+5hN+59zE/zsFA1Ezvnv3kZ8VUGum8ROpalYoA2JROPhJ0lTWw+omsJ
         YBqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs9wxqwG5tGSzFIEmk7x5AvfClg8ewADhIjJvILghxrjjytmKQ7QTAoJI1WD+xuNKLBvLJy0OrtsPRpu4=@vger.kernel.org
X-Gm-Message-State: AFuF++m8YZXL4lR5KQs1ofcky2TYDvirpxSR3S+gyQ/o/YxU/8CTnYhe
	EnafQOXNjqayA9So7K6NIFqcxWs74Lc1TDkpJxFUgt1DSHEOeAyEqOE1m94r73yIMFY=
X-Gm-Gg: AYBFou1dpyHN3+eh9iaJphvE1v9sgyCXqNNAqJnoA/2Wd9uEyzmXusqYisvQdWLNv6I
	KsVb98PmBCpGlM5IZGktF35BDBAWH3s0X7JEe8vN19TNgQii5egWHHtuewvbCHiDcd1hd2Pw0Aq
	07VFEw559tvTUIWW5+u1CbxDFdR+Dj+uoy6bY4aR+2hbJHF80DINcfHuICn3kE5zBR/Z51ji0dB
	DgVQPIZ+481OBkPqiQmIOimYHTKViQJEOGTG5vJQO47IUYT5nbgV5o9xwQBNs2H+gSsvzQGu5Ts
	mf0Nc0E5ck4ulD7kEsJ0gvBYZrkXhjegAkrlPqR2DwlbAPnjvpIKF4u71/VvHQu02l8r6nxx5xf
	3KdPP8kpm2k7cvfkCVPMuO2YNjauSrobyV8PUzU//5ACOvMLjtWuAsNAIWwPQ5ZwIgBO3DgDIS+
	kh5cuJAIB11q2ughnuaiY1qx9POw1qirB1DHf4xcf7CmrpvjjBesEKn5WO1saY
X-Received: by 2002:a05:6000:2584:b0:487:f93:c8d9 with SMTP id ffacd0b85a97d-48872ad7862mr6052233f8f.54.1790287197677;
        Thu, 24 Sep 2026 14:59:57 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm1922324f8f.9.2026.09.24.14.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:59:57 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Mao Wenan <maowenan@huawei.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net v3 1/4] net: phy: refuse a second attach before touching the PHY
Date: Fri, 25 Sep 2026 00:59:47 +0300
Message-ID: <20260924215951.2127682-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924215951.2127682-1-f@lex.la>
References: <20260924215951.2127682-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_attach_direct() tests phydev->attached_dev only after it has taken
its references and, for a PHY with no driver, bound the generic one, and
then leaves through the error path that calls phy_detach(). That
phy_detach() works on the PHY's current attachment, so a second attach
of a PHY in use tears down the first consumer: it clears that netdev's
phydev pointer and the PHY's attached_dev, removes the sysfs links,
suspends the PHY and, for the generic driver, unbinds it, while the
first consumer goes on using the PHY.

Found in review of a change that makes phy_detach() put only the
module the attach recorded: with it, this path leaves the first
consumer's reference pinned. On a Keenetic KN-1012, a test module
attaching a second netdev to the EN8811H that the lan4 DSA port holds
got -EBUSY and left lan4 with no PHY; with this change lan4 kept it.

Test attached_dev before anything is taken and return from there.

Fixes: a7dac9f9c169 ("phy: fix error case of phy_led_triggers_(un)register")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phy_device.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..7046976c5b6a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1757,6 +1757,11 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	struct module *ndev_owner = NULL;
 	int err;
 
+	if (phydev->attached_dev) {
+		phydev_err(phydev, "PHY already attached\n");
+		return -EBUSY;
+	}
+
 	/* For Ethernet device drivers that register their own MDIO bus, we
 	 * will have bus->owner match ndev_mod, so we do not want to increment
 	 * our own module->refcnt here, otherwise we would not be able to
@@ -1798,12 +1803,6 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 			goto error_module_put;
 	}
 
-	if (phydev->attached_dev) {
-		dev_err(&dev->dev, "PHY already attached\n");
-		err = -EBUSY;
-		goto error;
-	}
-
 	phydev->phy_link_change = phy_link_change;
 	if (dev) {
 		phydev->attached_dev = dev;
-- 
2.53.0

