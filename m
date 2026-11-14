Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653077;
	b=bxKZomd9UnIbuUu6CHlZVXFw/fBzRhm9SPz1A9oXeyQhwUZV86ugySXmuq6CVzHqmNiy
	 OmUUKV/tn0A2B6HFINXUr4A2l4Cvf8+aDA3meZPTiC35cnVSFSeU0H7OKo/bXnVB0p2UY
	 VfDtC902Fc3vQUqvnn4naVxwlFEwmIZRQ5gSS3l9FhdjnotNHyI07n786QKuhM7ZXykME
	 aI6DFfhJ0S3LeINCdLVZYxlIj2qvBXFD/1ZmYShVeOTiMsR7+pgoTuTR+5RKR2hw5gnwA
	 7mmbp8E7cBwll9K8XZa4OWqdiNLqnAhzvmdUuxmPKsibvfpeS33O9EI8Rbwk41L7YQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
	b=dYxh3yU5ZtFzgubBxVj3+v5cppRxZVEy4+2NM2ECEoYBkrJKJYOYaOGWq0DToQW9L9Rf
	 WTX9sM5dTN0qbSaWEaxtGj3Ki9ByUS5fNc2DmrRFm+ypSihSdRvrtsmmZ2BwUACPyd4dC
	 IGKGW7LxM+l59O84CbhEWoOCZIoOPfLmBB6l1s3jWwEfLwvXqKM5o2xpN3HFyf6t6Wwcx
	 XMOz13MUohwFRGLGLyLsfb8GZNXR1kkqNlqAoq7bokFx5mvy6U6+ObSMS9H656G35AYu8
	 wQSkCCYKLljxWpkdKdUadPFur5AIa1bwRqXouyMMpw41MJj0B93QqU9WS/pA7VoSRuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpaORhkx;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A4606A88E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B72A4606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpaORhkx
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so23108115e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653075; x=1795257875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=ZpaORhkxfgHskmS7Tyg/sZApKd0c4evYnbZ+R70mFfFkAQczDt4xteRVZ0bknhasjr
         +rO8uBnEzWnrrfBVR60b4mE50aJJDUqZ8Ohx4z6O4UU+saGPasWRVOJDnRnwfbv9bVov
         +88JqW21RAEJxnuzsT9Sh62pTF5OPMBgzB5n8/CquLut72d8GRe/vopnvQjiTUzcuzjU
         H2Cm3l4j2Lk7g4yY5COGFUjv658BG2QkV9n3wUWW/CYqJ0hs0CYb629OQbpVzMJP5sAY
         4O8PryyHCsf5bMKvOrxo6xKUMNSeR899I4Y8YFQtyJ5mgtX80If7Ws92dHQsvcLrW3QS
         TRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653075; x=1795257875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=AVlf9Gfh0gQKCD+SxQmWtsAsP2czZm9AsBu785OWkV0v97PPS3ywOmxbUwfsCMggHs
         xQhy/4QPi450MQxiI6bXHSt/Lg3MdIPPp5d1Xl04fZGks7S1A+wHxlnFeYZ04ibVbZVf
         /1cD40VSjBHVgblgiZuGC2E1jkiIpwVD4bE+mI+SUKgOirJhbdXmiif2BUr8PFQ1KCM3
         AB1xQonUTCoZuhGt6v56Y/yUHPUhhfkFzflldpEhYakQiw7Uh4jhU7oG0y3BJs4PRUB3
         PDDUSnlAACjWcmmrV4OOTVzSn/qrtQ1ER2MukMNKvfT/WVtAjhnxt75S2nPNNkCDHWr7
         2dew==
X-Forwarded-Encrypted: i=1; AL+hErG17KXGUz04VWJADhLeO83B3GPBHt9ku4wW4L/GJ2STTuw75T31Qz0Vw1lQGUFla+0UnxrA8w3gdRdO+9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NKQCZyVhg22eICO69IdSlpM03/NZE1tl/ykiPaDFMQzOgeagQ
	q0r4saa7I1dJqnprX3plga/CrSsTCy4m7ny5vvsRD2NKVAZI76OnRHbb
X-Gm-Gg: AYBFou1etAKawrPmdO8m+F0UoUE6EzOfHpRp6dT0PHowXXEcaf4OJCwxsExaI3sXF+9
	tIkRiKW+PmfP4lrlMIXxGlLgS6YggE1HiKH2ttAm/cLmegXFRELrc3EmR95jDMlxLFkkRDGRM6/
	X3PuqZnvH/3chL68n4jCooIGJO9lPXya9PTown1Ax7iz+5SHNQvWLlafkbZkY0T+jLBEu3O/SOE
	icggMAnAGTeN723HbhhO5pCaU0ZInZJ8nH4Y04c2RZzSjtQdqysyGLMQ0rg9zZFkoPbgBCAKIg/
	/yr/4MpqwL4NuVT1a8YBgEc6bIwMAHhl+g2GJS8PKvtQUaqnOEHf1NiuJR3Pj/abpXgXvnPxH/C
	m02i7pz3pycBaO1fIFqVtV2VVnQeA/gCUL/l2/YP6RG+Vvm0KYHEB3eqVx05jdM7XqB6TmoH9yy
	bLwfOj2JcGLtIhPyvhS4qTnD7HITvvqz25ZeX7m8tSlj99d/k8aDL9VVXvkFvuxA/aVh1QV6cZn
	fdBiIcXOknDbwt3nLQNtXNHlxIQ+cPXzcr6QpvPN7ZtCG1PZCetqk9efMCgNYS+jlpdn+AVEMU3
	iwqvwVMcrcei1/gZLyaToIQ9VQ3I2kadkyUfSzVSTPxw6V4xqQjZi3Rd2L0KKMY2G+0zM0kA2ss
	POKrMLm5xa6Utru58ZjWVA61w7x3xk4MpioA=
X-Received: by 2002:a05:600c:3495:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb68477c73mr8647025e9.26.1794653074802;
        Sat, 14 Nov 2026 02:44:34 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:34 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v20 01/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sat, 14 Nov 2026 11:43:40 +0100
Message-ID: <20261114104426.235620-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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
index e7734e45376c..5d649903be9e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -62,6 +62,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -632,7 +637,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2090,6 +2095,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2212,7 +2220,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3026,12 +3034,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3910,14 +3918,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4155,7 +4163,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0

