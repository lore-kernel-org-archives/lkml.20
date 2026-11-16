Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846877;
	b=DEjx5y67MsRN0N7F1lkQsb+86r36N/sedRIKabDlRU4ejjmTmhiZ+ZmBTciq/2DMMr11
	 TdqRePT9padZl0UOQifC02X5oCi3imrYRf3s/HQ2FRRthMhdZjW+OBNte0coQIpF57b01
	 IF8Em/RE9+ZoI1EncjBj4m+cIQH8yT89VyU04WxzX23d5Qt8SoFR39rGIZb/fGkUTqg7q
	 cu6ZXVNPi0utghNfS3CjAhuG2bEoKa6GfRud5vgm9nUzB5U57f7cFaSWbcGhNwxMH19zH
	 slGqJYEBUbOpNvTK46mk7APIms+lJle9UVG45b1TZAEiiG0pi8R6srBwYn4LYY+4lPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ws/YN6ACF8XyocpnxEMNfixqo2alevxFzQaiIzjhqZY=;
	b=pJhsdhnYCeGDWAZ3wpRXgTHZltG7L4VvgefkGbiUG0uTiVlp08moWuFMg0QWJ1bZVYzX
	 xyZyUA/ZOHPKmHdiCfVTQ/ldB1NCgsqHY+Rb5TDmzxGlnNB1+saCNRgaM7+H8LdLT3iZw
	 loQtSjbE9E1QfPqRKkQBgVkapu4rNcP3TwSl6pIoAl8bxUB/GXtgHRiVIi10cNTqW/79v
	 ebUILuNslvxIpPM/Knl7f22wxsy0FIm7jqtsZBckPwPW90poJ3deIaHXC1nBSFXWHFBMu
	 J/ynfL4BRJANkI/DxhZ5NkmHLDu9ZaAu9IAndXNghDlFhXK8CEw3l9og852Zy36wBEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEZ7YfDn;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EF9606A8AB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02EF9606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEZ7YfDn
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2778306f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846875; x=1795451675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ws/YN6ACF8XyocpnxEMNfixqo2alevxFzQaiIzjhqZY=;
        b=rEZ7YfDnK90/UL2JMosvh6mpAZy0qQJnS/vNtBw4+gbBmplbtv31vA9fXJ/A+nIFhY
         j0HXJuEdThuD+jHN/3EbiVjhZRbbHUzvto7xpNCycIvaunHaolVpPo6xtBpcLr5ltU1q
         X4lh7o7/cQcyEIMAwL3HHqgX+9ee8udZwvNun9SUAL+5j5Ry07xNbG+sn4bi+W3K9Czg
         k/3sZ/iCBOR1mkVcIGlbkYGBqv9jpaCiL40jBkVpORid2mPyaFluiKgbeHq3owQ2CT1N
         zN9L238IAXiwjjXZz0jl2eMcBu1uU3HGnYHAkuTbxTAiFKl9WbP4Rt+zIrst+sTD+T3G
         tfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846875; x=1795451675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ws/YN6ACF8XyocpnxEMNfixqo2alevxFzQaiIzjhqZY=;
        b=K35CvmFW437Ds8OXSVfT26VEDbc36SW+J8NFg5d4sblDxvg9DWYFSm0xzO/VDpRTrH
         Lryfy1fv5AWnBLyWQ09e1akWKsSZeEU8oCdpM2D0ezjdErxfo5GnZGux743JcyaFE2Lu
         R2en7PAwNTHdrs5NHdXby4WDqtzgWIDaDwSgxdD9s1be2N0S35sdoqMKeWqp1CL61ruY
         v8IGUxhsSigqmPzH3mvWdC0Gsudnv5YXLcZ77nxg5Ayfxh1kKNZdkuKBpBQcnZR8orby
         4qcw4aB5BQENflloGiP7nxsUUl7Y+vczNnD0Aae88YMd59W+QC0Tnaj++/Q0oYro64Gb
         hG+w==
X-Forwarded-Encrypted: i=1; AL+hErEf8tuZQzwo5g7/zbptHjd7q16C1cEEOXyf2bWm0BbSJg5eDzrTn+3ZlM1S555DEGeSran+xsqLPtb6xjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oNamXnfqlutA85oF5GyBqFosuTWUwqcip0VT6TbSrlTvGXh0M
	UDdnAiPUxKJVKTJRZlgN4ex4hsNCERh/+kj6879QfHTCranPukC8IbLP
X-Gm-Gg: AZFdTZe8AmFCivW2li/7XxxayVpELDNddlDDQhHdZh5xzoj/ASnNstPNttVuTMb06XY
	hbDBvgE0wVbOGaWzwyYtj49gZbtTdV1uEBIx4k0DoldTvwvjrJcdPP68PFRhFNMGAnp4COiE/Be
	vW+GauX6yC6bw3s1X/l0+v/2W8lSMuSGXOUHKT7Gq2DbInMrL4dRZKi3JZXJiKUsxE9NiGhk2J+
	B/t+IUFF/yCRD2moYdrZ+QFd0KRcKM+2xoqxihtOOfv+o2kOLu9vb3z/y4Yw8dd274fbnR2737N
	PCIJ4qflx1gikZQr7PksR9zVdonY793V17Dt4n0xwGzpXENrlVMelwK0M97JyGDCFfH94vaKuqV
	hKSwP7uYcTJJhY8X8ifxZeb0Du92ZlPOoSLccURox2jzOz6Qb+omxPSeDZH7GMPwEEu74YOr7xD
	s/+ATINE0cWb+Ja6lpeBUjxlX4Yrf3gqO9ZtaZ4dTVKa1nMxW5+xbvTXWyjYatwnY7/R4kvP0eN
	8wjuUL+Wf79tK+wYNjXVSBdZjRBEmyBty2R6QjOWAljyb/hChzUuoEJmbygvdM0jmFaoPefcisN
	svuu3CtM4tvfp9ZIq4ze6+mfThVKFdBD60WqhqgJFmqYQu9iuS8AxXPDoxcUE2wQTnqBJSA9fKb
	CW8vwqQd5tQYVh/k4v4XEXzTQdi5jjMOEaA==
X-Received: by 2002:a05:6000:41d1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-49c72ba72b1mr21569635f8f.51.1794846875361;
        Mon, 16 Nov 2026 08:34:35 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:34 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Mon, 16 Nov 2026 17:33:50 +0100
Message-ID: <20261116163412.551438-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

In preparation for PCS release/late attach, it's needed to introduce an
helper to calculate the capabilities after a PCS is removed/added and it's
needed to track the advertising in link_config changed by the user compared
to the originally one calculated in phylink_create().

To archieve this, introduce dedicated advertising variables in phylink
struct and update it when the new phylink_update_capabilities() is called
or advertise is updated in link_config.

In phylink struct the new advertising will contain the full advertising
bits right after a phylink_validate and the new user_disabled_advertising
will be the mask of modes that were disabled from an ethtool ksettings
(with the parsing done in phylink_update_user_disabled_advertising()).

This double reference is needed to account case when a PCS gets removed and
attached again to preserve user-defined advertising rules.

phylink_update_capabilities() will calculate the new supported modes and
the new capabilities, update the full advertising in phylink and restore
the user-disabled modes.

phylink_create() is also updated to init the phylink advertising and
link_config advertising.

phylink_update_mac_pause_capabilities() is updated to use the new
phylink_update_capabilities() to account for user-disabled advertising
modes and update the full advertising in phylink.

phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
account for the user-disabled modes, first in the
phylink_sfp_interface_preference loop and then on updating the link_config
advertising.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 93 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 81 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 2af665790564..6dcd0d1f960a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,8 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(user_disabled_advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -717,6 +719,41 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static void phylink_update_capabilities(struct phylink *pl,
+					struct phylink_link_state *config)
+{
+	lockdep_assert_held(&pl->state_mutex);
+
+	/* Calculate the full supported advertisement */
+	linkmode_copy(config->advertising, pl->supported);
+	__phylink_validate(pl, pl->supported, config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, config->advertising);
+
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(config->advertising,
+			pl->advertising, pl->user_disabled_advertising);
+}
+
+static void phylink_update_user_disabled_advertising(struct phylink *pl,
+						     const unsigned long *advertising)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled);
+
+	/* Preserve restrictions for modes absent from the current full mask. */
+	linkmode_andnot(disabled, pl->user_disabled_advertising,
+			pl->advertising);
+
+	/* Update restrictions for modes in the current full advertisement. */
+	linkmode_andnot(pl->user_disabled_advertising, pl->advertising,
+			advertising);
+
+	/* Combine the updated restrictions with those preserved above. */
+	linkmode_or(pl->user_disabled_advertising,
+		    pl->user_disabled_advertising, disabled);
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -815,6 +852,7 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
 
 	c = phy_caps_lookup(pl->link_config.speed, pl->link_config.duplex,
 			    pl->supported, true);
@@ -840,6 +878,7 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 
 	linkmode_and(pl->link_config.advertising, pl->link_config.advertising,
 		     pl->supported);
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
 
 	pl->link_config.link = 1;
 	pl->link_config.an_complete = 1;
@@ -922,6 +961,8 @@ static int phylink_parse_mode(struct phylink *pl,
 				    "failed to validate link configuration for in-band status\n");
 			return -EINVAL;
 		}
+
+		linkmode_copy(pl->advertising, pl->link_config.advertising);
 	}
 
 	return 0;
@@ -2152,7 +2193,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	__phylink_validate(pl, pl->supported, config);
+	phylink_update_capabilities(pl, config);
 
 	pause_state = config->pause;
 
@@ -2252,6 +2293,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2275,9 +2318,10 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
+	mutex_lock(&pl->state_mutex);
 	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	phylink_update_capabilities(pl, &pl->link_config);
+	mutex_unlock(&pl->state_mutex);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
@@ -2534,6 +2578,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	pl->phy_state.rate_matching = RATE_MATCH_NONE;
 	linkmode_copy(pl->supported, supported);
 	linkmode_copy(pl->link_config.advertising, config.advertising);
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
 
 	/* Restrict the phy advertisement according to the MAC support. */
 	linkmode_copy(phy->advertising, config.advertising);
@@ -3396,6 +3441,7 @@ static bool phylink_validate_pcs_inband_autoneg(struct phylink *pl,
 int phylink_ethtool_ksettings_set(struct phylink *pl,
 				  const struct ethtool_link_ksettings *kset)
 {
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(requested_advertising);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(support);
 	const struct link_capabilities *c;
 	struct phylink_link_state config;
@@ -3485,6 +3531,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 	 */
 	linkmode_mod_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, config.advertising,
 			 kset->base.autoneg == AUTONEG_ENABLE);
+	linkmode_copy(requested_advertising, config.advertising);
 
 	/* If this link is with an SFP, ensure that changes to advertised modes
 	 * also cause the associated interface to be selected such that the
@@ -3532,6 +3579,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 		return -EINVAL;
 
 	mutex_lock(&pl->state_mutex);
+	phylink_update_user_disabled_advertising(pl, requested_advertising);
 	pl->link_config.speed = config.speed;
 	pl->link_config.duplex = config.duplex;
 
@@ -4015,19 +4063,34 @@ static void phylink_sfp_detach(void *upstream, struct sfp_bus *bus)
 }
 
 static phy_interface_t phylink_choose_sfp_interface(struct phylink *pl,
-						    const unsigned long *intf)
+						    const unsigned long *intf,
+						    const unsigned long *supported,
+						    const struct phylink_link_state *state)
 {
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
+	struct phylink_link_state tmp_state;
 	phy_interface_t interface;
 	size_t i;
 
-	interface = PHY_INTERFACE_MODE_NA;
-	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++)
-		if (test_bit(phylink_sfp_interface_preference[i], intf)) {
-			interface = phylink_sfp_interface_preference[i];
-			break;
-		}
+	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++) {
+		interface = phylink_sfp_interface_preference[i];
+		if (!test_bit(interface, intf))
+			continue;
 
-	return interface;
+		tmp_state = *state;
+		tmp_state.interface = interface;
+		linkmode_copy(tmp_supported, supported);
+		if (phylink_validate(pl, tmp_supported, &tmp_state))
+			continue;
+
+		/* Skip this preferred interface if user-disabled in advertising */
+		linkmode_andnot(tmp_state.advertising, tmp_state.advertising,
+				pl->user_disabled_advertising);
+		if (!phylink_is_empty_linkmode(tmp_state.advertising))
+			return interface;
+	}
+
+	return PHY_INTERFACE_MODE_NA;
 }
 
 static void phylink_sfp_set_config(struct phylink *pl, unsigned long *supported,
@@ -4045,6 +4108,11 @@ static void phylink_sfp_set_config(struct phylink *pl, unsigned long *supported,
 		changed = true;
 	}
 
+	linkmode_copy(pl->advertising, state->advertising);
+	if (!pl->phydev)
+		linkmode_andnot(state->advertising, pl->advertising,
+				pl->user_disabled_advertising);
+
 	if (!linkmode_equal(pl->link_config.advertising, state->advertising)) {
 		linkmode_copy(pl->link_config.advertising, state->advertising);
 		changed = true;
@@ -4160,7 +4228,8 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 		return ret;
 	}
 
-	interface = phylink_choose_sfp_interface(pl, pl->sfp_interfaces);
+	interface = phylink_choose_sfp_interface(pl, pl->sfp_interfaces,
+						 pl->sfp_support, &config);
 	if (interface == PHY_INTERFACE_MODE_NA) {
 		phylink_err(pl, "failed to select SFP interface\n");
 		return -EINVAL;
-- 
2.55.0

