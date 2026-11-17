Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919214;
	b=pv/Gcg60h0m0+QtORZyhKd0jBPBmkCyAxe7ca/upAgqBiy05c2uVKnNoUy56QSdoFj0x
	 MuoVQjXq8XQP0jziEIKufnOIVgm8oYlze0NLFQywQR2Ltbz5WDh7OK9vnqTIRyzpf3xQO
	 OdIsC1bonsPZzbG4wjJqKEdUBWSp3XbjQEXJgPl4fFR803owf/dvpV65fdB+X1LHug8yD
	 qigPTgyo8W2m+ByCZFyo/jMXk8IRvr1KYw3JFvnwA5aMlRdQQAS0nhsGv/ao6GH3ZIpgH
	 VLcNAOm2h/nob7vyyuighTTHBnCpONc4SlKkVBZop4/GRDCUC/BfL/dDmrdHtGtDsbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
	b=IHlWIc0A0RDQw9BjqTd3y2AYO65WrJqi8STEqdXdg3hIL1o/TxF5tA6qq8Xqy/IFuhhO
	 QjREZKXQbfKSqgg4VhOx4UbFGfFhY9RL5OtEWu3bNBFDNuVxA13EQ0GVQtqZnnLKcnDRD
	 9dXZutdzJPMt3CzaWuJtATba+3IaLyCkR2ptR4L5sm8v1Ez09E4keVUyKXJL8P8Ki1tsB
	 5eueIio2p/ogczf9vH0qHWhNZEWhLMUWLH+GE/KCxevZKtPvZXj4nB1ufAetZ6JdireAt
	 Ok/BdHiErvMdjXO2ZRnDDnr8FWO8rvolukW4aLaU8ZFH6MxijuXEdGbeAVQ60wYf5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fh2bEDIR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CCC60A3827
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6CCC60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fh2bEDIR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso21195475e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919212; x=1795524012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=Fh2bEDIR/d4uWsXPkBfajsg5Nj7BImqYBDcRS4r+K6kCFwgeO+dcKNai4X+1/lmKmc
         1gISntCorZBotrgw7gWmMS29Ac1jNLiXIbTNJJci4zTdvWCsrgMm7m0aKIk9NHFx1UJP
         QHP770xVZniMTDC45tVGF2RNJERWAAfLIMPoV9QmQvL0citbFzUX90QPouysWgIJ/f1n
         AXgfs7Aj60F2QXBV2EB1MZy6FXJkE72sj2yoZFtNwX2brRbnryjsuoMBIHhotID6UXRj
         nxUHsoTME3V609QEQcv8buE5iT8roh1KFQUJ/X0GjBiThB/lsqoBJcrO9xvw26IercKs
         pcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919212; x=1795524012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=y5r5KQkkcsnK5HkWsY0rlgRuEJaY8oz9E3KODonJvbatL2KL4GzmwoNFG5bRuBkscU
         TnNO++pBsHxGcvwI66G2IXJ6SWvqwvyDqo6nGJr+CI2JfmlxhjoQbHMnsXe/cNGdKYpc
         jlCS1QZnpa/WV6wXTxkskzfmJCY4y9b/j2IJ9hd0AdzYiUvA7XDj3kE2wIWxogHm8nJJ
         +eaJlu9pFUOHlT22+wvSSZOd+4fZp1ITcL2rP3vbEpYOuOYWYyqmm9agKw2uEekz77Ce
         +t8498ZAhOe4DMYGVXMYDjWBSh8BBlITmjKqijGvNtL4FjLFo3wavBLoJUI/IP6SuD4z
         8W0w==
X-Forwarded-Encrypted: i=1; AL+hErEckZKGOtZQF9vQ2CXFZL+z084btEFWVJSvajPEl5SfgOBpdnNmqJFSi9wfolxkiHtgigMVv+DgT7ejD88=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ALl1wVsMp1jM5BdgZ6hf9dPluUs5gkvBTM/x71xw/LK052eEk
	viGDMs3N4eeCm+drgJjhOkPPH3g021kdeFoTdQBOwpLQgVt5jiW8m44K
X-Gm-Gg: AYBFou1TYkw+lTF7Z8PWu2R1VRqpNXnGcpOJPzACMJk8BzWZcSE48jbZHt4rA/n8Rvd
	xGUc4EeAv/t+bV3RqdrSK19Fa0bsURcmCpdliaaRVo9SCcH606hDjVR53vMCFGyZN0GM6xuu3xF
	i7kNwlqtDGiuwcHlG0Q/7fhKKt6qJyntpKK23cAvJ8+NKoSsEyHH5uqr5Dc4Yo1Xp0TFbnea2nk
	Ve2TN9r4y/rVG9s95/hxuJKYxkbOFuQ0EQ2rHidMbU3M6ME0/TgdniSp3qnIb9Xh6QyWq44zN78
	IgeLcK4N3kuyv25hn+tVFWrTKj2X9gfN0rilZJkQw1a/ywzWljSkBaaJzB9HBGhEQ9CrmxIhrB2
	m3+WJ6m4CKr0LuosA4nBlsRl6Fk6o1qdSgcV1dSSCuwp/gBYdzk9KF1Djntcp8jUPhgawa9+CAv
	1czlshPXrLZtR0xP1tjT8/uDLaLqHnq6wUNhStjdvyVOHeQTcvkNz6mpzjxqqBP87VyhFoW/oVp
	T7gp2PjC7jm/3Fxn/HbAv9wq5IKdlCD/+oR24id0YqH/ZXfKs8uTJRukN064vI4MN40qzoJbHC7
	A1KWJofoLyQKxzL6P7/PqP5wcb6QU5blNk+59CR/oRCX47iUUqiik4bK2vmswSwJHMPZ1Ag/Acu
	RIxXliY+1obJTbpAKJ9jstTb0KBOdlyHAjfMz/duxZ8+BSZzOqvl4d7A=
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb6a5a7a48mr183926425e9.20.1794919212027;
        Tue, 17 Nov 2026 04:40:12 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:11 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue, 17 Nov 2026 13:39:42 +0100
Message-ID: <20261117123956.11981-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d9d0ace2042e..f482dc608810 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -633,7 +638,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1788,7 +1793,7 @@ static int phylink_create_sfp_cage_port(struct phylink *pl)
 	port->is_mii = true;
 	port->active = true;
 
-	phy_interface_and(port->interfaces, pl->config->supported_interfaces,
+	phy_interface_and(port->interfaces, pl->supported_interfaces,
 			  phylink_sfp_interfaces);
 	phy_port_update_supported(port);
 
@@ -2091,6 +2096,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2218,7 +2226,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3037,12 +3045,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3921,14 +3929,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4166,7 +4174,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0

