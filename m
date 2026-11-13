Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529962;
	b=rVft1gLknCbxvvp+hcfexVyz0KlTuIXnQkfubQMosYPepp9bNfnkYm/3ghyZ1/8AWj4E
	 3arRDOMFWLBeOs+cEZSTXRXsBPN3SExjXMSwVTlDlu/tQlvMP985xBhBz2tvRd5gc7vfE
	 vuLAn8STK+kw+sbhv7AfxL0DIQqZ4OEowimPocy08Orjbkm4E4Z8jdNuFSD+Iqzjj17cP
	 GsLjQQ/iFUStQOoGNtLELk1Zc8hPtq/2PYZPOQgIyOEJgiUARhJi0gaD0HPibb5q2773k
	 /GVBMl9C7zo7VxL7ic/IQGPfPot3htYEx7jalYb3I+/CCcavJC4iS4Vud0uwFvr1ZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=UX9JyNiMR3dTuJSabKufA0O16lPyICRLXrLlTg7C00Tk7HZZ2+MVCwohq89o0+2063xH
	 PPFWth6hXokKlmjnaA/vRZjwV8qYMkBDs/KgmY5huIa9iUkRgndzGgwfDOHaPRwrrdJ4L
	 mo0arTqbdBax26C7xTpL5GfdZRLrFNThafPBayipN0o+KcUYyu0Lzjn6IoZMAeYCylV8b
	 v2YiMdUeLi019i3Arc84f824VE36rWKV2KlN0Z8mLJgg3S7C8gqcSeUHjxZgxsptU+gw8
	 1EXVglFtkIiOYm684QaXLLnZIY1dpdlilxgVw56TRl/U7Pr+sAzLiX9UTGZpsEDzA0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTp29Dl3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020D60A2626
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4020D60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTp29Dl3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4747445e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529961; x=1795134761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=hTp29Dl3/fXwSC7T1y4v/ZOkf3y2Vs9AD5XVW6sK8tx/9Rd2znf2jvXkFcEnCV99c7
         43Wrvh+i/LIwGppmZT3IoAC7o+9UwWqw/Qwo9UEd25nwMjgAKmCNk9zwwAczTUqSf2E8
         mMuLPFzFlnwRwVLeg0pUCeUg/LFKVRFpzFm6q1LiBhOZVH1oZgqL9IhG9OlGzi9KBB2m
         jNd/628/BaUWjS3x8zw118tRw/p42CEXa2awQrPMrJva/pWpVphkYA7bdM7foEvCF0pW
         XUU6Q425Gq3BR5i4Yc5XzgRXocEsdDgdaDdJDE6/3oY1a6Ymehx9ePjVM/MDM7ZBOCYt
         Wd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529961; x=1795134761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=PCLInATBTzbhkWz497zhzZGqCzwjGMWW7hIwnwpv1OeqR2lszRx9P85q8G06+weaUl
         kCmKtHKjaF4rAKKwt++jFXAI52giTk3OanmWa/cgxMTgEkOZKx44lYkHbRDs8vYZgORq
         v7g99wbAGJPbIG+MsPLdkvVt7HqGHnZO4tHHP1Ne5Nu5Gty73CdS0FUDh5+mGJLv4Jtr
         oCbZzbFkwAP8JJdIrLVtAmgxFoKlN7J7CnObUD1Sxrc/9wvJPuSz9gUKWRufjRg+rKbu
         2fY2qQeaiJxx5dRujwbeH7779XG99BpqXm0OsD04Fhu7fp6Kw1KdRm0XtNjnsQ9PGFeV
         jKaA==
X-Forwarded-Encrypted: i=1; AL+hErH4wAhFYPCyibdBVPHRLBONj+bqdTRi4S/9LRpSJT+QhiYBmZZ2vX2eCCY5jm2vJROnhLnlXnPt48Xh/QY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lCH+pwB28M/5gvuqQYsJYqagorMjtc1wx4JXmZWDLqUw8G601
	FV/Lfj6FTsJYNon0dnnzxpZjtZLuUQ/H9bvU7QcT9yso1wSd+Hl7I+g5
X-Gm-Gg: AYBFou097IIjGB41F1A9RHmBPuBhl7+mh3rzVWqNSeS8tv5KS8pYvrGuklLNDBmftzV
	q0+txUrRWuyDe2T6Xs1iBFk2r/lV+eCTtpBWw/zZZRxdy3uGgo9Zo7wIoGfavXOUMNqWnnQPoZL
	B3G6iL4ESkyXNLXREw35ZxH6HtpKycnqFjWk9iZFuBADyZRT0Dk4o0hh5ZC8WTiNauqUwQOkivF
	m5j1sJqVzyVuYODdH+dba1Ue9TfLnQRMh/BhuNm+wJoucjSl6RKG+PuP/IFDDL5T7/EN79XVuKY
	rv0ODhqV/0aO/PpUycQY0nhPK6GfoANqEERubrWCx+b0UVu0kwBkNmb6kyVfhMdHGZjTWDfhv8D
	Crv6NEPOZ7iWZbHmzEyu7oz+mfufj8nXocrajED5qXmnses9z/1Pqe9+qPBPWWQ54zFU0/nI3fv
	TkCitOALpncnh89u9J+GvemBrfjpbHFhCTrJi7B2nMnzCwwYZnkCVY2sEDkcfxaM+0JWGBvVCos
	xJuBA0Dxkjt8CJ+F2spkzIUql8XqIetNIIOUi/BP0tn6l4UxnRYExtPbSW1VDZKbGZormFuSPcr
	+Qa5KMcduWrkbNKaabCZegCP0WohmMmhC2jEdPo+xKp2QU0qnBlMfiGW0LrrF7p4CBf5OvbPEAt
	MWWA5gWTtjMpc3tDEMkI5mSdizBVyDAjQVde+jkL1+dHulSXM9v81+ic=
X-Received: by 2002:a05:600c:c167:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4bb55a92fa1mr18062495e9.20.1794529960557;
        Thu, 12 Nov 2026 16:32:40 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:39 -0800 (PST)
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
Subject: [PATCH net-next v19 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 13 Nov 2026 01:31:55 +0100
Message-ID: <20261113003217.197757-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

