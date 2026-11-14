Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653085;
	b=o8McJ9LEwWCoYS78lkfc3CWPPdwGsPVKDFomPX42LxVX1TA1jSsvcjmyef5Nu8Dy2iLH
	 F3ph75GNPKwMM7L0AhTd9uH9EZz8LjPIKWaPsf1G+Mk229H9m/tqTmrgrtj1b3pANe+xO
	 n7+u0jVyCtVpV1qPvvrA1mlsJaiMtQdIFlU5WCg9I9tSOkLxzshNu6Q/XQLKbrc8NzwXm
	 cQZ7htHXA76fXR5aLYy+dRCZvxafNMfzXiBdG85q081Nh9tWCGRp/1Shr/s5Xv9R3TrMg
	 WNP39DIkBuEjk6UAboPBljBQvARsSErY49I9nbmAPU+S714re1Hr7SiNmAVo1luD8MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=Mf0wk91IzjOXS2C3jZjOoify5UVsSizLxJx7aXX6k3vi15yXD8nJ74ZVsMksPlfRuyIU
	 SaPtmFXZk8xeyu38Xtt6bdNhxKOdwhJiXwlzUrg9DtxV7FMgJenxd7bgWRX/h0tz7zMc/
	 oATVROPPXcrbnPve/mMxGnJBDzi2kNjnJ1MoGh9ZvvVQDBDC4VXllMpwFhvGiaoD7UvMK
	 IyGMBANBT6Cc02BakrWlmnwWMvtsJJhjLQ6Lors0vs8oYbB4QDz6W7rqGhhCWKkDNVRJf
	 FXv6bfXmqZNMPOcUo2DhSTgLDlZzs4/d7QmmJPb/lRLIw+ZOMnvjk0EiO3u8ILyr5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVOWEp3W;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D80560A380A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D80560A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVOWEp3W
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so14097685e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653083; x=1795257883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=pVOWEp3WOe28qHag/t5ZSnvAb/yJWXgEYMDc9O/AXCJJhNh87hjSurMqxSevp8BUPA
         47os7gAgol87q1XUkyFhP4KDC0Rrc0HKpC/MGriNoqvenaMsS33T+8IfzXvwfqqZqTZN
         Y+8IXGqhR4fb83HfwdqYMWq0iNgGQpv+ISOfWgGe1V8odOo8doM2JLdocyDkQ3HHO+XW
         /CKSh8dcfjaweQxN1sWFHQeDhMTXeZxO/O4nvPutektuHyQ+PxWp/gcSmKUoriJ1OLNf
         5XV0hBqrXgILz5Iey4nz/oJvMiMJSpqJUklTXmzCeJWuu6l6w97xx2/6sJd//3fxdqkw
         zqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653083; x=1795257883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=KQv94KKGXTY6amV8Pecn0ifcaIVV2vW/DSLTEY28IU+r4RLwNM0TH5obtp5aps1/8F
         mXWuDTYr0txAz/nbghDoyln7IcVSnlJMpuazTIiPWmjuj4Xh4M/aA9g2/EOwAys+Qmlq
         YYirvq8b/qtXwy21vb7jGvLx33QHKuQtPX1fQm0bmToKQTS7VuOAan9ERSwHWMwPfmUa
         khsOo4vMIuZzE5BYdMfmAh5jeMpST6o8jHX55ORvXbmfAIJAU9NNTme4hFP5o4GgKRav
         s7BLQjhremKdumeDa/Mm2jNddiyYRPGPQFhB+Fs3GhIQjL+3zzqdacInkITRA/wFz//9
         3wLg==
X-Forwarded-Encrypted: i=1; AL+hErGrFEl4NGW39StAkYYUuCbFpWgRmMAl84ONvzX/BnBuDSkuEXnS1uL7HiDjwThh+x9wPwVPlZyOaN86vNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xa6oKpUAP0ApuSrYP0zOsgtXRSFurse3Hs7iZ74Lu7s397URY
	2QF2XVq8tjq4Ww0oUWUXPKItmlYdbKpWGLa5YllaCMOgtAhdbJrRN4pG
X-Gm-Gg: AYBFou3+EeSHIWa7Hb5vsnrGiE3mb8g3t5MPLwaYXjffemW28xmBnLsR++1OmgKnWdM
	Yrwxag4XjF7FRqnEm2H+MzkD8TWD4/L0oUxXdlNqdcbKp9pqPSOd09HZFbs5OlfXnWb9QCZo6Tu
	07/IEn60DYqsT0aIx5W/KuPhztjQAY/TJniHIpoaYIT2kUMGkHHfBlIhE3LBSGfHY+8qQditySn
	Dwh7d/gMc+IMahuAg5+iXSSY5vcjth6XiSkmAz0F4WTw0qg9/QhqsahZfloykRakzryiIo+1XfU
	MqVjjy28INtmXU+MD/TNiSDHAQlsXLrpMXcq4c8E//EfmSVWSYnEj/knFX8tntpHvLbitqX8Uc9
	xYcBZcGmIceZ/q1WwzbvB+8n3pkz1qpnygjj+vVCgUfHMKR1S9UTGgfG1vqSGmM23ug1ABx29KR
	J+bwXpzWOvEEu3HiTM6nfOFs9s6Xdv2zh8L65OygNo9Yt1aBP9vg+CDhdZZ+CPXRnINBwIGXxn8
	gdsjRRsYHQnKaszngh47GoWrqb8bDoareJGnDh0jTOPSJSBHO5uRwprXbAJyaeRJaYtQMVujx1B
	7kYsDl2gj5qr89GonoPULk9pZHIKiKHopu83EPASxnKHzXMGnWi2xhXSSnRh/JClMQR3IpE+WLN
	iyS0xttZMarMCgGl3uxcOoZCu9lWIbEXKuA==
X-Received: by 2002:a05:600c:6089:b0:4b9:ff94:6b7a with SMTP id 5b1f17b1804b1-4bb55a7ed16mr107792215e9.20.1794653082907;
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
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
Subject: [PATCH net-next v20 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Sat, 14 Nov 2026 11:43:44 +0100
Message-ID: <20261114104426.235620-6-ansuelsmth@gmail.com>
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
index 64b00d324988..e2e0b313fd61 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

