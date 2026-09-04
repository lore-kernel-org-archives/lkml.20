Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156535221F0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548614; cv=none; b=CJ1pACCW38UVfZEC40e3rstia5zNgHI5gBjeWdUpSQShflItaVo3vqnKlZfU/fPqMJbf+1XEz20kgZGuOH1ZAN5GCzLInXF+kUbNOjCSZA0pc0zoBFKVf6Mbhmq8jGE4Y22FQGYseiwjVH5Z/lS6mZ3lOWtOn/5lMPxFyu/Son8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548614; c=relaxed/simple;
	bh=yfXfFA1c3vQG1+Ye7UxWHbvarQ+1G95ouDiPWPxXcDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLiOTvWpyPzO4vdMtmVFEtX5oM5StAWRDpGxrA++lYSDFkRGpdmUlcP6waDUsB+2ekMn2kv6RGmNn9M9pcHjmrcRtUaaH+kgz9NB9TFgVM3/qrWWEkGQ+U/JXBw8vGsfweTGkSh7K5KuXaS8h0edowwvpOKQ3o9yy4DgYN1olSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=REvQzaHS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="REvQzaHS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso15409775e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548601; x=1789153401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMh5lYeH3aGg59+QPJC3P1Oz0qgidcMVPi+b3gENV5I=;
        b=REvQzaHSJtV3hEBDt0Zye8R4e1GhaX3CB5shzqz/lZhvQXG+J4PxnVyoKbZFmAD64k
         NZ40P2MeQLhrnOdpPvM2Ym/lb0LLFBbQNAJmLZ4kg/npdsWD0sIAiwyxOq6dAfupXGlb
         vESAxdyUmmNHCKeVCp566frDoJld/t+TgG3+W55VlmdZmEMkPhQo5pbHI34o+fKvZldi
         kl0WeSs8T/R5pselR0H2HYy6bFcWWAKQvuck5i0jioLJmzwMgNHH/dwguhRrnOwM4Cvc
         lc+oc0fxf5nkBYEildoOGcx7bKXwSNU7m0psAOlZF/Tk2+1k/rNWEyOIMbpD/WD9xMa6
         E3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548601; x=1789153401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMh5lYeH3aGg59+QPJC3P1Oz0qgidcMVPi+b3gENV5I=;
        b=ZTC7HLj3GDuDxzk4XRzpYpPUYHPnOuaxfEuOgzjEmi7BmvMrKGqqUl+VpQ3R0TDgw7
         yhL1A4lVbn7YYvgIp7d/aE1/fQKY4gDq30n2vExEySM6m5eSpBT7IJMlAHTBL6ZPUkXj
         WuzN0D/SYvN7acW1fO1sgD9ko1TDnQZbr0gZGuQLkrWyifgbz2R7sSBI0ANZVy6pR6xB
         bMLci4qQ+qEymKaO9ZSw5Q/3ZRf6mJCUmb/FouvVKxd/7iBrP9bZ+WJ+qT/82dlCJ4tq
         0hKI9mMucqG4LOL756KR/UYgUmjfhrdKltFCLjdqlJFnS7IGR3/zxGOJazc/MyCEcvWy
         unsA==
X-Forwarded-Encrypted: i=1; AKwUvBwaeMnWJoE3gxUT5MymupsOCi4DQLaTKtu2hCZ82GuXNpaRMNcBMFXJYyP2dzszQDJkmbyf80VgBRTGm94=@vger.kernel.org
X-Gm-Message-State: AFuF++n5jdGRCkba0vr5ny7gw1y1sDlB8e090nYQCKbo/Jrk8cMlqbcX
	BCgJTzblXJpM0yVwUC1ZVhZHjLOwF7hfkkGtpZ/S7B/DQsILP49LCx4M8id94v6W8Rs=
X-Gm-Gg: AYBFou0fpIKLULj02AYqt52w1dEqQAnFARVuiYUZB7VfWfOsSsSuaAmYrCE4Fd9RJKD
	QjF62uVDMQa5AHLm0lhEvoPWXlr6seNpcbCg0EWr/RxYOwdjb6MDwu2A9nWOBzgszCW0bYJLi2b
	sP3q2kcpr1UNCDPYrGF3as8+7WGBNurEPPsnQWZ0LWAJZlzreyeXyRpv7MlR//rX9xWHb+/MhVd
	LgxzLyzJzNdNEMYKJkBt5dsqJziznXj+Wv2kUG0gmbmMzpN3jpHNPjeb+crFhv6Lj/J0IaKS3kD
	moDRfVkxjk8CDZcKlgUy/M/w42gLn6s0rduVTTmN0j8tTI6gDP889w845sGzo/R8lL92ZnaOnA7
	X+wAZ3vTWw5c7beMIFM7iVLI68Lzrib50nIsb9OfK+Lzb2fh44/9f++zPT1HMuZ/2eVlGlYw5gm
	CXO1RN+dKmoHsNeeXY26Kkrzpm6TnVi+sZ8ZWiUDg=
X-Received: by 2002:a05:600c:4e11:b0:49c:f2f4:eddd with SMTP id 5b1f17b1804b1-49cf8268795mr95772385e9.16.1788548600659;
        Fri, 04 Sep 2026 12:03:20 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm172195485e9.10.2026.09.04.12.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:20 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2 10/10] net: phylink: report no link modes while a late PHY is missing
Date: Fri,  4 Sep 2026 19:03:04 +0000
Message-ID: <dd73c57289fb07fef0da931709ae4a957b5fdf69.1788548229.git.f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788548229.git.f@lex.la>
References: <cover.1788548229.git.f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A port waiting for its PHY reported the MAC's full set of link modes and
accepted settings for them, which describes a link that cannot come up.
Report an empty set and refuse to configure until the PHY arrives. Every
path through net/ethtool/ zeroes the reply before the get op, so the
pending path only stamps the unknown speed and duplex.

Setting pause parameters needs the same guard, because it is gated on
the same MAC-derived mask; reading them does not, since it reports the
configured request rather than a capability. The EEE calls need no guard
either: they already return -EOPNOTSUPP when no PHY is attached.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phylink.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index bceeac954779..942d5fe943a1 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2290,6 +2290,11 @@ EXPORT_SYMBOL_GPL(phylink_connect_phy);
 #define PHYLINK_SLOW_PHY_WARN_MS	60000
 #define PHYLINK_SLOW_PHY_POLL_MAX_MS	30000
 
+static bool phylink_slow_phy_pending(struct phylink *pl)
+{
+	return pl->slow_phy_fwnode && !pl->phydev;
+}
+
 /* Bound, not drv: drv is published before the driver's probe runs. The
  * device lock cannot be taken under rtnl, and losing this race costs a
  * generic-driver attach, not memory safety.
@@ -3087,6 +3092,14 @@ int phylink_ethtool_ksettings_get(struct phylink *pl,
 
 	ASSERT_RTNL();
 
+	/* No PHY yet: the port supports nothing, not what the MAC alone can. */
+	if (phylink_slow_phy_pending(pl)) {
+		kset->base.port = pl->link_port;
+		kset->base.speed = SPEED_UNKNOWN;
+		kset->base.duplex = DUPLEX_UNKNOWN;
+		return 0;
+	}
+
 	if (pl->phydev)
 		phy_ethtool_ksettings_get(pl->phydev, kset);
 	else
@@ -3159,6 +3172,10 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 
 	ASSERT_RTNL();
 
+	/* Would configure the MAC alone, for a link that cannot come up. */
+	if (phylink_slow_phy_pending(pl))
+		return -EOPNOTSUPP;
+
 	if (pl->phydev) {
 		struct ethtool_link_ksettings phy_kset = *kset;
 
@@ -3373,6 +3390,10 @@ int phylink_ethtool_set_pauseparam(struct phylink *pl,
 	if (pl->req_link_an_mode == MLO_AN_FIXED)
 		return -EOPNOTSUPP;
 
+	/* pl->supported still describes the MAC, so the test below passes. */
+	if (phylink_slow_phy_pending(pl))
+		return -EOPNOTSUPP;
+
 	if (!phylink_test(pl->supported, Pause) &&
 	    !phylink_test(pl->supported, Asym_Pause))
 		return -EOPNOTSUPP;
-- 
2.53.0

