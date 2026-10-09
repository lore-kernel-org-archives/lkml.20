Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB3F4FECC1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570549; cv=none; b=aRGWg7ZeHndON6vkFNOWzu5/cfmMzWvHUglq6YE8XYAY8Kws+4zcA/EhpJFn/l9pOmAdkVZ49esuQz73O2PWU2doPADcTCvls2fa/YahHA3ePFiZHaMOLAJawnW2TITxsRE7EVMt1Z1FrYHUR6hx4LoY9r6yecOaslhabUmuxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570549; c=relaxed/simple;
	bh=m5HqqAwvf714jhn9AtFujlH/Cfft9cIXbM/MO6suoWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RdBsFjAJefRSr4xk4s+Kj+hccFTd//p8twvpnUpIu3DN665MxjFmid86qpAvwqB5cVfzyekH11ceiD8aHMfKVi7b04p7ZGueUpRRhMUcSlJ6tpC0m1D46+esm5+4iIHGLRW80hvAbn7VeZOCOBookQUVAETKbt3pXDWpYvdwB3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmTrLDb1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmTrLDb1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b060ec084so72632f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570543; x=1792175343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=GmTrLDb1MWwldnZ3d2c5G45p4fXiG+jIr8tqArrqf64NbatwXybyHqRyyu+RWOuvf5
         ootpzgbp/S2vMiBIiV4pIgYS/KiReRONIYhtQ+n8vkKO+wqkjcMnCVSmUnP8x/fz6lAx
         23jb9FyUmeGr4XCrIrnm0LHwFH7uluWyl06L/TSsP6wzeQopWCHkTHV9VXI9sHsrhjTy
         WYoDXIpa23jNALo169N3EtG8MkzwfNxxbFGNXDG7GyLCqk6k0sovJwvAYASDYkN1Ncnx
         86MCfWVMkUoyQTjpeszKZLfZ1vZ7qznDJuZrE488FAPK+8QFdDBRkUlvOmdIL9SD6vIR
         RxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570543; x=1792175343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=iv0+W6uyXzEOk0gPPWV+bZxJ4WkDP3gguYR7x2hPgy62ysdj1gKDic5fmquKt+pbm9
         BDhw/GJ+InM06NCFddUG6XoRH6kAW1fbhopHk86lQftlTQJH07uQqzM3noK6GksOMEyt
         l4h1THLEufJeQuoURdYeFxEzT23vN3QvWefPaBOVZNXiE7SAFfhG69OSrGzSux7WqSVY
         S+1eouHHZLOFIJleXIMculSlpQNVodSJx9RP8HXG9JJBsqFu5LeU0bnR0v4jrLXtau47
         qYq5hvRuV8+DFmtsHn0/temAhC6VT2HsgVVoL/BvZsFoVFL3fyaCOInAxoDVrQYZCLgI
         HtXg==
X-Forwarded-Encrypted: i=1; AKwUvBx73clciivyhWaTpSXm+W//olv5QOZUfvMv60GIPyyce2AOCIGT6GqZ1frieNkDi6Uv1PmnCc8gWuTvYOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI/7IEKY31lsF+xMzQtTq0amAsWbq6ERxJV3x3jO6sYAErlkEj
	FeDXSKQw+jBhEEGT9tXRKErkXy808vZ+M8rcQBXCSEeT9hAWkpbj5Cgx
X-Gm-Gg: AYBFou0V+uUdEZJE5qfphvt8+dlOmdaX/GNj+vMAQVCeJVRP1UniM1uQFfuOh6AbIZD
	LntpA+Ok58FMi0AFBMRCPuS84JIU/dMw6cS9zJsJ8OYpaEcp2W7F8LO1HVF8Hd6FhxtgZJnYyrf
	mPB/D3ng6so5LMRylKN2NTf6MeT2aIi9rmGN2hqKBeOVuu5JnZ3AB09Km5HQKqTiVmDPPsiCwkl
	tUU5VIn0x9jT94X3KPz47n3ToDdstFg+TlD3HtUo1t8tnF+zisGdLKP2i9bnVD0gjB+PeHsKFhd
	JZIgsJLE5KuT3zPxiDVpEMU6CZCQSqLaBsJb4tQY50/xpyAK0vvP0z/LElL1cf/95lGSNKnzDLT
	NdXsgKAhmJRvoYdzzlqu2Bzwi43gKPBoWYXeKLE8OPxLzuLydGOgWQkMVsrmrbpQ55FgeZAjuC+
	Mb+L6NdnWC9OA6+QlJQU4TAfIDYQNVq3EN+O92ZG75qt+0L7mRB/fkKiuXkYa23+NkFHe+MPJ4K
	6WBL0MgSWGUjH6F4piMjB7JrpT3L0fmyU2voOD7q+DH8QXmtKhVDJ1D7M6YDm7k6I2sASRi4XBp
	RL3hN+V62qs0+IVYSw==
X-Received: by 2002:a05:6000:25ee:b0:48b:e50:715a with SMTP id ffacd0b85a97d-48dbace01abmr5330100f8f.34.1791570543097;
        Fri, 09 Oct 2026 11:29:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:01 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri,  9 Oct 2026 20:28:00 +0200
Message-ID: <20261009182836.50631-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1156e6c61a08..9441afe372c3 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

