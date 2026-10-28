Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172650;
	b=QS4EANeljiMcP84WPLGBVHyo+mXO0GdUMxI6TNY0fJNLr++xrvU5TwNcWjewdRhulM32
	 g+sjuFCndiuHRMao0VpemBaQiLsfPYQYUuaNXWxoUki5RaCWl+NI28XTTPijR3/Nb1Jaf
	 4j9cqU0dK+tkCooVDdl1pZLLKGo0hCtF/jkpeBSc5UreUvnTPEWET/SiMc7sCMjMdmHd3
	 69aark5EzpHUz5SiMz7hyyCdTi7B18rSaMOyUn9M6hCWNyJq+WfgKcX4h3aB5g/t7hFa+
	 C/t08TQVAZfaV/qTFRXkoipCKjCJUOGz1tL2LAkGqri/xMzwgL16Hw6aIsOiCoCgSdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xlOBsO8kcdP1J080HWu9hmTEce9Xj0OyKuwceuvj+bE=;
	b=mGem2jE1w56fed8Ur/OicvcAsUp1ClJjA/G2tBC5SBSB8ItSX7/qJtyiBj4UfzyHTe+o
	 KkdqwtAlSi0aDb+tpE6aI3T4yUIqPquChYZnV8XIrxG7oWH9Quq0whC+9vj5r4WpZoYWi
	 4FT7BkQjIWQ4tG7nrLF9t070drEMSF89LtngTzFpMVTesKnVK25tkLiJTJ5IyOsMnS7TQ
	 aPFB6w0NccCf31AzGNv2rOkCh1tpRrpfxPjpxtvzTjSqYALDi9HUhhQ6r+GkH2BL9Gk8w
	 fA15gJEO39bTeIKVkog1mS2RcEtlCyxa+ZkZEgBDsQH/2YFmtN6YcDVI3Smb0wOu9KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgXzwn8Y;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4A606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA4A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgXzwn8Y
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e04773687so220163f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172648; x=1793777448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlOBsO8kcdP1J080HWu9hmTEce9Xj0OyKuwceuvj+bE=;
        b=wgXzwn8YYCaVXZt94hQEpCLocthVD4zuyhV2Ar9yRtzJs4rSE6tTLyYZM4rfec707z
         sEWkYcS0h5K3irfZlYEOpkJCoFB+vmvPMkVmJ9fc7uSB29xzO7RhvBGjxqEEc50uvYmH
         5SCLr4ua3jsAZZIWkeZVI8U64Jh4yeBy5QyIkFdztWnQ86ZqCuB1mVO8Jen05Il1UV4o
         W8KSvvTaW/rWh36v7VJMDyRXFb7DdsZqes6gqd/OlKercU0J1jDo85NuFZO+GF+EGMJL
         Axye+VNPeuh+/m64N0iQvZH7+as50d4SP//Gy+bbAPVdfQIL/l0eOmCoWtPr74IMPU6m
         gjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172648; x=1793777448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlOBsO8kcdP1J080HWu9hmTEce9Xj0OyKuwceuvj+bE=;
        b=ryC6GhUcdfX+kv5wo+YPUqhlgIE1TpT9ishiwWBGj933M8krbYC7PdUxV59mvefFas
         wBFsfJNSlYf0ZIz86g9+L+5B+dfbP3lzcfSP4k98OuMLP2NkNLqjdSAd4jdM6j/LymfY
         9CM1ZZOt7FM8vf+ktdTqd0KWsfBZwQ8+82NyqLh8wZ5ezmeBfLCWyat66gXq8hOxTh7Y
         PXZLsJ85tUMS/O5UnVH8RyQ/iVbZm5806BK8UXyDKD78B40fNn5KP82P3oTZbxx2d2hO
         9FKR03/itTdQpZ3Tbaw8nUB+LXLzxk+uTmbEVIGoVP7zwErxgjeiXFDumhODpcEgdkhc
         1CDA==
X-Forwarded-Encrypted: i=1; AKwUvBwq5lA5LR3APrqUe9qmgn5k5qX+Noz8g5uQYb9t1scQQj3wLZuNb57LVX0jupUAYh7OgvPu9eIWtOGJAK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjSPUmprRPTnrIdNh83r8BseHA9xXSokHZbALbFtNWUvTdmhz7
	A8asAP//Ad28IQsRX2L24zmxUHB5tx3GCrdwWNAjWIeuwLBLjU18p2LT
X-Gm-Gg: AYBFou2yqQIPvPf4Kx94s3Xo43C0PGICBYjIqCrk5Cje7PokTbp8Gw7zZUFyMdVZGb0
	qN72BrL4ppDf9uK/BfOYDQmFq4sB8KDIOl8JJymSBS5dikdTW+kjJIHo93PiShgvcGCXpXMgwPs
	OdW2RnlCqk6kVCAWoGLWPAiKJ+kI8ONR3VkCnCxcEPnmdTGIlVfJmE58fscsPR4wrjjoRbCFT1i
	A59NlexW/vWnz4MwQPnkf2mxaLkLMnj+9iNqdI/EhAaHnxu7Iza6CjDYZ9tNzb53Kf4COO4vetR
	FWCToPXDs5HNHADd48HqGfkIOq2cjgjrdaofvUZ6SuRP00q+oQGRJiVXY+xRNyNJ0fK9QDw/tvx
	+37pumXNy3uwD84p7cZNokchmsHCm0VG9VUWVjBUoagmzF0f+I+exvLEhtQ3Fow/Dsw+I3fn8Jr
	Il4oiOHkR3WRUSDiHrnXzNDmMJ/Vcub/9jft0T+a51VDs/RjnCyj1NLgq+sefLN7HnCb8LedZWe
	JhKN61QM7T3qIykpJ5MGUgG91l7xM7GKcx2LRoy64bA4EH7uY8KUgSPz4+8t2+NtmFm8o+uQoDm
	v3fXajWW70JmUREIvgd14cf/kAf+BWFcSyjZFN3gz4Roni1nZj/qQZKYWR90j+3DEWzf7QTj9Lr
	s21xbR2pjKSca+M8GGChHVhGg8d+x5a0iV2cjec61XTgRJZguMkuk5HQ=
X-Received: by 2002:a05:6000:240f:b0:48e:60bf:4177 with SMTP id ffacd0b85a97d-48e60bf43demr854284f8f.9.1793172648194;
        Wed, 28 Oct 2026 00:30:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm12083088f8f.13.2026.10.28.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:30:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net v3 1/4] net: phy: as21xxx: handle stale link status during autoneg
Date: Wed, 28 Oct 2026 08:30:19 +0100
Message-ID: <20261028073024.25175-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028073024.25175-1-ansuelsmth@gmail.com>
References: <20261028073024.25175-1-ansuelsmth@gmail.com>
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

When autonegotiation is restarted, MDIO_STAT1_ANEGCOMPLETE may be
cleared before MDIO_STAT1_LSTATUS. In this case, the link status bit
may still indicate link up even though autonegotiation has not
completed.

Force the link down when autonegotiation is enabled but has not
completed, preventing as21xxx_read_status() from reporting a link up
with an unknown or stale speed.

Fixes: 830877d89edc ("net: phy: Add support for Aeonsemi AS21xxx PHYs")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/as21xxx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/as21xxx.c b/drivers/net/phy/as21xxx.c
index d5738117eca6..0db82da8dbdf 100644
--- a/drivers/net/phy/as21xxx.c
+++ b/drivers/net/phy/as21xxx.c
@@ -658,6 +658,13 @@ static int as21xxx_read_link(struct phy_device *phydev, int *bmcr)
 		return status;
 
 	phydev->link = !!(status & MDIO_STAT1_LSTATUS);
+	phydev->autoneg_complete = !!(status & MDIO_AN_STAT1_COMPLETE);
+
+	/* Consider the case that autoneg was started and "aneg complete"
+	 * bit has been reset, but "link up" bit not yet.
+	 */
+	if (phydev->autoneg == AUTONEG_ENABLE && !phydev->autoneg_complete)
+		phydev->link = 0;
 
 	return 0;
 }
-- 
2.55.0

