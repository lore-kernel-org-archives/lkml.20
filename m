Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796916;
	b=WtL49xxNHx1Qpw9KmA4rMTWiRCHbtbE9QMTPHiFkGv62uUK+acb8dX5pgKoq89BZerOP
	 NmEi+g6RECSw0rf0WOf7QoGUlqokEgX7rvan4FSml7bum0Rn3fsSUa9Uuu9+/M1medWxe
	 IFLZjqbS9aHJ/KcWcDeH6RgqZnP49wn+UPW4qEQNs6P4fFfWLTHHw+0BusTD3PC5ezdBJ
	 W5BDTrhO8jhoJBP/l/mhT+xw1zi1wDlbcqqpDc5zy+81Wjdk8jacQqA+OM0D2qcF5pu/A
	 6vly2pn6lmUptasIcJ4rdEtfboAul2mu+udUL7jhQJwX7a7emR6D/fqZhSeNMEjuO8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ullk1gSUOjFiId8wM/hEAChuzery1r2M6GlvL+3ThyA=;
	b=y5PGKmh10HMfKX0Gdn36Z5dcRnDXIvPJSzNb5CtHN00W9r3pjg2lq6oLahuPJF37HmKg
	 rpa19EvdVXZYcTrd3aYdRCWrTpLTnPXBidcq+YZsvT5obJ824RJ33ECEnE6QnsLMjNKRT
	 vvQqTlc/cRowxVmi6ZjY9pt1bVh+pKyluzleM0QlDJZDVpiI0EXrI0LIgny909Hxo3+3L
	 AmPBEp94KpPnE6LI3Bl6QfOAseWZ4LpPF9E9ydgPZocf6emGT2cmG++ykEgDqqMtozCZK
	 oRPaTG+6+fel7jU9k50h4xb5tZb3tkEKsvRpnS0rUkikpfKWMxH4xKqu1SEEapMrEQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUI0ybbz;
	arc=none smtp.remote-ip=74.125.225.130
Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5738606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5738606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUI0ybbz
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4a2171c351aso1147175e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796914; x=1794401714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ullk1gSUOjFiId8wM/hEAChuzery1r2M6GlvL+3ThyA=;
        b=xUI0ybbzYTbhInu8D379Df79kDfFwdSiP1liu3jX+MNCdSouhd5sSWeTGARNfXArr5
         srUmwsaIaT5AaQu9XGYB+8RufGFwt/n/JiPr6uObTcqeZP3IYw5Fo0nJ7VJNCcxrqOL/
         pVEB2623OjThdGbgr/0KY0EgcofWgoaSXXBcdHVM2GZt6DrUiwXuj269zRntaDHOfzt3
         qpkTEw3xYn6HNgLIOi/pFQsi0VcGftFTa1Qs5S8gJYWFRmsdZx3UwPiU7a3xFMBrRLf1
         34sHs9iU2CkSt2/HClvLpO13tPWw61n+zDYJ+R1WbXXLRSNZHhDCJ4i6XjY3Hb0dASYu
         Derw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796914; x=1794401714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ullk1gSUOjFiId8wM/hEAChuzery1r2M6GlvL+3ThyA=;
        b=ZTyX+73ySAgJi2fP3yJzwKMVY54ME6o8X2EcgYg1lQS0iXGDV2PYGtP9kpN5OQpj3R
         J1TJ33pK33RY0pq7HC9KPz4vbZ8zffL/lR04bfXltYmGYB8DjcBnjpg8O3chLHlPL1Na
         R+LlEz8SQixCydbmDjXggzXYogCTGMtzoJ+iOvE6yp1aZwftRl3rFUH5NJnH6wCtRvLa
         aeVuKoYDaJCCFhIDkjz0TZXg1fQX1wnPRbesjAC13dnjasFSkbsWS9Y5a0CvpHW14ieg
         mOjuDJfbNWCaEEUtN0GbGtkUn+8pysm7llpxgQn4HsyB5S5fxFb6IXY0RDyxJPbtPoL/
         qsWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/vKGrG2vikOMqoTXR1UQXk05ts96T+ZiR+AIgFH454osD9vMZG9tYqrHjv/H/FDgv0kVmc8BgzMc7VLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z81McargK/1vBR2siBrHXCIytoLhEtvRiW75rq2Bz7wiZphQ+FW
	yysJkOK8rZ+3uQaDaUmfFpU2h36mdMuJl1snMBCv5YCktLOis44lQG/HTe8uNw9y
X-Gm-Gg: AYBFou2bBPrZllexbtU28cKGZzRrW9NWFmyy0nzkHFwjqrKH/JIk49kpl/tdDYaOeSE
	Y0w/hOVzV33Nzu8dHPlRBPSmHgetgC2pK17wQeTsJBXo3yGPrUxdMEEOrKWigvLfGVdQjws77Ll
	aOdene7QCZiJFh202O98Zf1oVZbn2LCA120Oay4UdJ0fQIMfbtE5coh/hF67/4j0Yj9qgxSMqMQ
	tEi2t2b1mP7Qkv4gqCXhTkFrrciK+CRj7DZSjmE6izxZ8zXsfG3MWlkh37hG17B9smVzWdqApwR
	ejkLGcGoyApn03xQPz0ArYSSE+UHLJngA/h3SLqN751YPKzh3Tplm430k+OQKYCp/TESlYliSde
	/EwCzIlbH/c1IBqToHWCmpBz1IHgrWh3vFOE2n3yh3oNg6g9ngRAuQVGR81LHpxeoSAkZjQF4xb
	fZCg4KcECUOszspSu+UG01n07bft77L0GcfcV3Vb0dMR1EIIca6gDyvW9CxTBIj90vcztFvd/0T
	xf21lvwyfet6Cn9HvgI2ucpzrv8fQZR693tr1rS43l2yfxIN7ugdk9X+FsY1SgCNYvsy2y53QbQ
	m9zy1hp03p90hXTTlDP2+XEuAHlp/rwEbP5yv0uu5Au5irIQvZkyGeHzhBOQzho+hY3SxUTb/2O
	CI0tdgQ2nFocjEYRCZ6LQusEOS8z+lJjLld4SdtJ1n1oYMcmhk6atkOGD
X-Received: by 2002:a05:600c:8b61:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4ac17752ee4mr338445795e9.16.1793796913931;
        Wed, 04 Nov 2026 04:55:13 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43cb2360dsm59330345e9.8.2026.11.04.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:55:13 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: linux@armlinux.org.uk,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH net v1 1/1] net: phylink: keep initial advertising settings
Date: Wed,  4 Nov 2026 13:55:09 +0100
Message-ID: <20261104125509.3221743-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
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

If the net device is phylink based,
consists of a mac with a phy connected and the
mac driver does add the phy while the ndo_open callback,
initial advertising settings of the link may be overwritten
during phylink_bringup_phy.

The mode of action is as follows:

* The link was not up yet - no phy connected
* the user configures the advertisement of the interface
* the mac driver delegates the call to phylink_ethtool_ksettings_set
    * here we are not configuring the phy - it does not exist yet
* the user set up the interface
* the mac drivers calls phylink_connect_phy
    * calls phylink_bringup_phy
        * overwrites advertisement with
            * linkmode_copy(config.advertising, phy->advertising);
            * linkmode_copy(pl->link_config.advertising,
                config.advertising);

Connecting the phy while ndo_open callback seems to be a common pattern,
affected drivers are:

* macb
* r8169
* stmmac
* tn40xx

The advertising settings can be kept by using the intersection
of the phylink advert bits and the phy advert bits.

This was observed and tested on a
Xilinx Zyqnmp system with builtin macb ethernet interface.

Fixes: 9525ae83959b ("phylink: add phylink infrastructure")
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/net/phy/phylink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e885da1c2831..145f181bc9d3 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2320,6 +2320,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	pl->phy_state.duplex = DUPLEX_UNKNOWN;
 	pl->phy_state.rate_matching = RATE_MATCH_NONE;
 	linkmode_copy(pl->supported, supported);
+	linkmode_and(config.advertising, config.advertising, pl->link_config.advertising);
 	linkmode_copy(pl->link_config.advertising, config.advertising);

 	/* Restrict the phy advertisement according to the MAC support. */
--
2.43.0

