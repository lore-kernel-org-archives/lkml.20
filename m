Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846868;
	b=xhGickbtzH8rPoeWzZpgmPeEBvsqyOUs2ToTuURW+Hp5meuK7X/AA4TSkIFJhASOm61s
	 HQwkOqWiEOj1B62159juCAQ2/nascE+r0Rkl/CqHzxmluX2W0O9h2naPtlxMA8gyDPj55
	 kDqy/m+14UUYxe46wR1cN0+1ZNKCaebeIYIOqsH5/iNSm+Ybl4Y4XoZ5ofakkhi3TgHXV
	 5sioZUidw1lqQY9l6yRVBx9uFBizslL9EYUYoOYOtWFw9UTLzsJmBaNqAUDoXpLIZc+wg
	 gVI8zZda4CleC6d84Awy+QlmDoJlqfTVrNRAXbn14/O/blyCQNgdAhMlPJilFfUzu8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
	b=Fdp1WTcDHS53fzPQ7bOro0EnVav3/HBIvZL+8oenDGjPy7XKnU3unKlY7bmQFoa7xdlp
	 /s9bCTBkBiPa1JvPsLZ9xLwT++mx9BJfW+f7xLn//1T0G5wSyqKong4jeXlOP6wJvMkZy
	 8HvuuKJ8Tak/KAX8Cq4JVanurshD6FWJEU6nUC6rLYAC5wHqsvUn1OjlPVZBKo48lafQ3
	 T61aCuRXVg5rY8b6f5pvydmPFhGWhDz6z1s1ACuzDsqbKoAiyfK9WXS52Cv4HutQV1Ua3
	 /C/d8BwZ3NynMlKvQNHXStfvvXvTsB8B/TNl203X88DNWOqnZsEN2sbkCVQD51v58wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eUiA67bS;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94038606A893
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94038606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eUiA67bS
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48fd2e38825so2367649f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846866; x=1795451666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=eUiA67bSs16wP2EwEdR29sel2q5XJAk6uGpuvPkK4qT8eWxm6L1gfo791jYjsLlO03
         FQgc3x+hARkL9OxXwByJ3c6Mv4oI0h+i8mSshaqyLuf6trjlDM7meZwQwrGfYfwRVH5C
         Vl4KEttTTTrxdrjrxaTyXYpz2sIzq3LLtyWOzOdoA58vqUrK1rHl1UUGfk1KyBZAuECp
         b41Xe3aF/SM08eze/I7rqrMo/TTFt8KPUuwguM40G88jladpoKhxUCIwtzb9MOH6i5DN
         nwLspvPUZ9k3ixcBExdrk4QcaEa48QYn4fp6MREOUriz9isXNhZGB3yBAH2It8B+XXbU
         Bbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846866; x=1795451666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=HI/eq4b18V7DIrk3IoKyS7RAVHPiLLSWreydyBgwtSTa+YuSChWj6S7FjEuLo7ahBF
         Kqle7ZwDDL3mGJIylCNeBGpkK1qkLAaU+LiZ6PF5/ZSqDYjQ3EgNUbfY+j8RvNq3ulmZ
         Vh/Iwa6Z+dW+R9gMLNXvhXnQNKX7wXRL8pNCOa/a52tBYCUKduUJDBQIKVbkYZZ3DyYX
         HWiExLG/iYeV7vQFv7Jk1fBZBhOYPpYhgtIkdAq7jJ6MisExSmGe1Z9y17qadJbqZPbC
         sIZ64MIx0n/XoKKufD12gH1lrssCcTnw/n8oBfxhv62r5BA3xL8bPmznR8NDc+Z0kq5X
         U5Yw==
X-Forwarded-Encrypted: i=1; AL+hErHycZP9Xb/Ugq2h+zgf5WTD/7zUtK+Eq8ULNbvMbPo/XpExUX7eN+DsfthygqR8xt7bC008qXQx49xvii4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oGPaEtwlMqtKf+/HiIUXqyHbxIV2TrEIlHRnO42gsKtiMCTW7
	ONlfezJayT6+5vARscZEQxnouGdxbY1HxYUC8CKbewFWWkkmh40AsCU/
X-Gm-Gg: AZFdTZdW5k3t8I+uknkFAZucTuoP8GDA7+hOZ6nk2cLFW0nMWk8h1nMIAo9rcFouuPp
	7R/HbQe6bdtrtsLqugDDcNsKbLuH8aM64PzJdfo/VplfjL0gueJT7ag20H44RV92p01ZsQss3jV
	hQWF1EFdMq1wRo03a19Ew8TgyqRx9bt5ukWzzKDWB0XA9gXPSpo6OXO3pzF9nrkhHPy4QLtnFDS
	/F5vAsH9E2fSlEgzBg1+RN1MNsZpgiYh0I4Vj6NRJsepY2HUPztV+LopOF4Bf0ZRpRBBFPPanb+
	BptG3UJmXRmu+IOuNywrS9UbtybvSU9qMlOA0NXKOpw33+O3B7al+6yjtrzH3AjNAChi+2a0g+d
	aGeMimgEGcRbHUFGlj2pzcnN25sFpe/Z3jV+l+ZvkLHEjc82dVPZ/Ihbiz+q/46H+XcR6UgBQva
	c7BTnvnu6UFdkvQTZVXjjwG3qEenBeDdR+t6JrGKHVoe4YYm/EuINgHlZWRqfPFHwvJzVCL0Mr6
	akzd0WKwUL+6mHw99EYzIj+FD+/DV1Twk3lx3UDnRZY18ro5d4laxGoMutUkqEkAcb0h8jUwEHJ
	Gew9w4bRzxHUC+x1MzJlNvApNUIvMOz6p53LQTVe+jLjNs7wMIOIHZkBxVMc567vTxwvBXAzwbZ
	PnyL6YnxQUgaU1mLGFAdtHvCBYAn+rCGp3Q==
X-Received: by 2002:a05:6000:46db:b0:492:9630:6a7f with SMTP id ffacd0b85a97d-49c73350ba7mr14457094f8f.55.1794846865873;
        Mon, 16 Nov 2026 08:34:25 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:24 -0800 (PST)
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
Subject: [PATCH net-next v21 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Mon, 16 Nov 2026 17:33:45 +0100
Message-ID: <20261116163412.551438-3-ansuelsmth@gmail.com>
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

