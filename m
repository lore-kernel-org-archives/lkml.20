Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057CF511E6D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602737; cv=none; b=Z59DOD6wHZtokkExJPjeeUDaUoVSBVCgjMMxmKXJ6ObM7zucfInwwmBhKL9Hwzfnq4hLediLOk6v8Ygky4hsTad/qaI0HJzj3l5INKOXfruSaNX4N2DA1jpNj46ImWEF6zR/KCk7YOak/ULzyWHvUSKDM2mkL2Zk2KsI1bWj3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602737; c=relaxed/simple;
	bh=Hx9TIRdPyOWp2JCcph+UWaHhkA7sNcruB3L94/kOINc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/axaslSMbI8+2kUDHbZ2B6rWj1OLycLhAN2vS413RdDHg7jMPGy0Ql1QrhWsphzewlJb/tsxOCubEhG53MYLlCbcKlATNeUpE7IsbaRQtqoU0XwU0RSTAtnGoaAlLEbFASEHyDKiePSCJ7Qpdj/xgJeOGJAGd+RQcI50vjnkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEb999X0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEb999X0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so169806f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602734; x=1790207534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4CVtSRo73kcxXzyXjS3Uh97Hci0HJhAxnJFberGLSLg=;
        b=JEb999X0KytLGOkY0x6IW1uK8xXIaKJuZWj5o7ofoiJ8ltzOTJSEJv2jlZJI+fbabx
         PBveXUfeKOSA8qSlr/FgXBRhXWRnLh1rKfdNcwzaNfM+ATnXbHUr17b5ZDs9NEkPlnq1
         YFuBbQPG2jZpHPvzCmvYrl7sCzRwiyLt6VRe9z/ezkx2pI/hURe92C6EM8ZyxMmSU0Cq
         cWms72kh5jJKa3hdNtyN4l8tAMdPe+hT71CvKr0k0sQ4hqpGuIzZwVRW9uZbltQCLjfQ
         8iWTQ/sgL3FFOhWd2bXa6uvoOtzsr6gIZz8FZeD0/nYCEDSHVbHzSinXWVZHqhm1R6cD
         CWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602734; x=1790207534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4CVtSRo73kcxXzyXjS3Uh97Hci0HJhAxnJFberGLSLg=;
        b=ecw62CYcXbAy7nUQHFyxakgbAT/N5jjB3G5Zu9Pb8BhzLhC35vVJrA3z2F3cu9x4Tr
         ax9+Jl9bO8aL3udTWhZX7D9maGOzaKiiiA7khXHtR/i4RkgHlUJMVevvDJj7LM+7Lnaf
         BNJjRIHRUqxTxMjaZqVlt0mV5Cz7pwYhBUXCkWAy04yI0QQRefwOLZykaT4NCGCfdGCq
         LkdrIkipCvRykvT35mQRnDkUXkHBD+eCrNm5P+RCJS4pz7SkqDMk0W4ncHJzbZvhuArg
         FRcglhVp/IeezFqOrPO7ihBA2HBAubK3XZPmgYQ+65uZyhaCk+Y45coNIfjERkucZe9W
         BCOw==
X-Forwarded-Encrypted: i=1; AKwUvBxyYvRPX5cb11wifO2jsfRV0digouobkPQiYfHb4uGnvVxCXi8lfCMVEnymFAVLme+5TaNLA2Qvg4BAk+g=@vger.kernel.org
X-Gm-Message-State: AFuF++lMsuiWtV0ReNZZHhAN6E/akCYsEtS5LcxEWH/frPjiXvjj76jw
	9SZQYZlUcPTEmUot38xkSAJspX/hnBAmXKyInWUUETKmMBjdcZDo+rzU
X-Gm-Gg: AYBFou32Mq/4dqr68WZQngaq8fFcNpz1X79z/kfOm+HD/4FTirPdmazN0FLQnupmEo9
	68T0uRRs/oqHglLiFYp2VYyu1cOBj/SmXIIeUDtu6KWy32s321b243HrZu5AWMv9TLaqkrNyO8f
	vCq/LmlOYjteN+IylJ49niAV/a1Vq2KfbfyAW0QNRSvuuGDsEmCEOq5FSX9ERm5VZzKWfbujQk1
	VnsGHERi9feQfw15gzIolP/vbU4Xr2cjDDK2wKpwlaOyb8m7EozJ7bO8oR/+B1tUeVdwpbHIAGK
	FRf9cncsGv5oEA10RX0obrfe8XS3yRozXs9eV03B7djjlldWt06cBkY9KExextylGA2ZM7z6BFP
	vBcitdy+sAEqDfKp6af2di3L3T71tlyKVGDTWcGhJcH/lk/t/hiFOmiaWhpBHZMGliZYpMnVBQ3
	EX/ef4qKtQqpFUEaxuHualVraeMzKrKnZvRR+PFUHjjAxvepxaezyTGBlmajMV4HpmsYbx8khSs
	LiC4zLAoR7lE/bgDHMYN2YYump9ihhMsSFi9+EB1h5iqXqnwa7ayalVdJTWXD4=
X-Received: by 2002:a05:6000:1868:b0:487:980:b42c with SMTP id ffacd0b85a97d-4870cef14b3mr9005287f8f.11.1789602734011;
        Wed, 16 Sep 2026 16:52:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v16 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Thu, 17 Sep 2026 01:51:27 +0200
Message-ID: <20260916235200.20712-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 390d3eb3e6f7..d67a5184c524 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -628,7 +633,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2026,6 +2031,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2147,7 +2155,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2947,12 +2955,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3831,14 +3839,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -4009,7 +4017,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.55.0

