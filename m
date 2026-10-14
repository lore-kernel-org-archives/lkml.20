Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6937D4AE109
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017069; cv=none; b=UE7bAelaA/wGMUUS0yX1rEoptwIErQ9mw7mAy9fyyF7sbJIepPyrFldIXY7xuhPeSgPySQ4VrucRUo7ufcEq9xRC5OiWtQxEtDN8rFomqOK1sV1AivMABTkiER/da3egRaNpC1V/oj+lsK4y/lqpYXivjrcT6FY1Un5lcwzv6J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017069; c=relaxed/simple;
	bh=FjAz/hbU9CW7acYWh7pTK+WN1VFdjJzgjf8bL47ouXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pePJe5Tp6KYwy03Ac2znQPfEgd/7phGH+ok+Wy6j1FZNFkaSUEluel/lh4C3UItAey7uVCrlA9D1ZabR9KDvy10sXPL2hSBEsx6J0ZKzL3+7ws3irM8p7gl+YUUEoYQEYFiBBpExBJM+L/gf+OV+wS2b2J2gshFD2n8QkRqdcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=VK5OFc26; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="VK5OFc26"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5339733feb9so42709281cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792017066; x=1792621866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsIKARYVlihqDjmV/OKM1uQES+iC0tNE8qrLr/nLJds=;
        b=VK5OFc268OdxA1v1ne2Zniu0BR4zzekRwmNPSKsp3fKo7SmLP0KgFGuQm9XNx7nJ6u
         7bkyc83tTXyuu/GcWAfvJXXVQbtgYM85KZ5VeKmymDuICyLqePAJ7NDOHp7fMvjHJGut
         Q9tKs97Qr2JF/JqeCwN7mZmf9fkplmHzmhtdZJ+23kQjer+bsoeczhPjje8I7ObkG23R
         0CkuLV7bYT3HQx3zBtaMDQa1fSolBOdGCmbNbEjwnaE9tDWIAlHo3Dod9xJ34vY6l7q8
         +LkV5oniXrXOYa4pETvbb0eBGahFA/M1acl4YiKiMA+5K53rrP0dZAiI3YnFTH0MzgRS
         19vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017066; x=1792621866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsIKARYVlihqDjmV/OKM1uQES+iC0tNE8qrLr/nLJds=;
        b=zT1spTWcQ8Y+4sLDnVLi8FHIKLiwSmNe2SmhZ4REVybZwQyGkrdGwvZzXEPnYZyIU7
         CU7WCKf4HOgwIsYOJM+O7ulV5ESNTRI1fDiEJOWzyYV7dtDH//6WI5ExkrgCmPpeJEjc
         goW59ejICZ6x2jrXIWuT5wdmOSgUP4+Hd2NSYipzu7tjbGM2riADFMC9gTfPsgkrdatp
         b4VavWom4GJhK6R+gtnzBFRiCP2jSQo+ilkLuFNK0q092c/MUVsbH3jxejBodR4fpqjG
         gzKzMwR8JE3+ZkSKJp7RoiVZfAk00VxTVZktCklxEhRwEbSueRy0CPEDJ+20WpGyLYxl
         0Hkw==
X-Forwarded-Encrypted: i=1; AKwUvBxT3b6RDYKFRm0aTK+HZ9a2RSTGfrmHiwi/dR+X8AH7LYHdQYIJmGnNRhmADsjLMLnQi8gbMMP9aN1/BFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK07sRjUGO37BFwoTM/MranZfCqjkA8bVC+lEMYRHGbB2MRqsUU
	0dy0d0jP7BRzQzuo+qib9gGWz9373wnQXuWtviZgrh/khQVu80OOpvDzCgXnZ1/+BlM=
X-Gm-Gg: AYBFou012fv9ARr2q9aiOTvzCqq2+yvGMhu+Sc5Fh0jeiAhtXbsN8t+69/HzDXZ/iJN
	ZXMGiwelGaRm3ucftJ3M5y4br73YlG6sxCck52xSlyr40VTJ2yq89OZ5yBe/7HnJKutbmMmds1j
	8doUVZkPfCD1qsSlu8/Evsr+W2YNzjEqcLn/f/cvU2jbwAIfj3NR36fFPYJbRJvrb/Wojyyw9KG
	KaOJGp9El6Q2RU0B1c4c9rtyqg5cGYfN26LhaHmqOOEox5AswhOHeSJM5wtcaVKj4gd+9lhY0KZ
	zF6jcJASrJzeh3LtuIDIUZLHKCjI0qNgbrfkQmIKlMHYghX6xTNnnnx+DDaHBOXwFZDux2GACvK
	CkpK8QBtNQO64Du5uwGJPXcpGP33U6RDi+Tf6nzgt/vn0QHcoBic40jp6M82KaoIwHgwA0SlTTt
	3an4wbz6U4Vj3Sut3XEQl0GFnEpuPP3Mpp//BrleGnqVSR4RvrHhoo33Q9GWic/bg2pBggl/9hC
	bE=
X-Received: by 2002:a05:622a:5cc:b0:535:2763:16a2 with SMTP id d75a77b69052e-5359fb873d3mr281803701cf.43.1792017065570;
        Wed, 14 Oct 2026 15:31:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bdfb89sm63708466d6.40.2026.10.14.15.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:31:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: Daniel Thompson <daniel@riscstar.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] net: pcs: xpcs: re-order xpcs_pre_config() to update after the reset
Date: Wed, 14 Oct 2026 17:30:58 -0500
Message-ID: <20261014223100.304486-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014223100.304486-1-elder@riscstar.com>
References: <20261014223100.304486-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

Currently, on Wangxun platforms, the XPCS is configured during the call
to xpcs_switch_interface_mode() and, if the need_reset flag is set, the
XPCS is reset and the configuration will be lost. This is harmless at
present because need_reset will never actually be set on these platforms.

Nevertheless having xpcs_switch_interface_mode() on the wrong side of
the reset is an obstacle for future changes where wiping out programmed
configuration with a reset could be harmful.

Reorder xpcs_pre_config() so the reset can happen before we switch
interface mode. To make this work we have to hoist the special case
logic for SGMII into the parent function.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 59 ++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index b415b93d77c15..49abf5ea6f5cc 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -705,46 +705,49 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
 				      phy_interface_t interface)
 {
-	int ret = 0;
+	/* Wangxun provides a full alternative implementation to handle quirks */
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
+		return txgbe_xpcs_switch_mode(xpcs, interface);
 
-	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
-		ret = txgbe_xpcs_switch_mode(xpcs, interface);
-	} else if (xpcs->interface != interface) {
-		if (interface == PHY_INTERFACE_MODE_SGMII)
-			xpcs->need_reset = true;
-		xpcs->interface = interface;
-	}
+	xpcs->interface = interface;
 
-	return ret;
+	return 0;
 }
 
 static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
+	struct device *dev = &xpcs->mdiodev->dev;
 	const struct dw_xpcs_compat *compat;
+	bool force_reset;
 	int ret;
 
+	/*
+	 * According to the XPCS datasheet, a soft reset is required to initiate
+	 * Clause 37 auto-negotiation when the XPCS switches interface modes.
+	 */
+	force_reset = interface == PHY_INTERFACE_MODE_SGMII;
+
+	if (force_reset || xpcs->need_reset) {
+		compat = xpcs_find_compat(xpcs, interface);
+		if (!compat) {
+			dev_err(dev, "unsupported interface %s\n",
+				phy_modes(interface));
+			return;
+		}
+
+		ret = xpcs_soft_reset(xpcs, compat);
+		if (ret) {
+			dev_err(dev, "soft reset failed: %pe\n", ERR_PTR(ret));
+			return;
+		}
+
+		xpcs->need_reset = false;
+	}
+
 	ret = xpcs_switch_interface_mode(xpcs, interface);
 	if (ret)
-		dev_err(&xpcs->mdiodev->dev, "switch interface failed: %pe\n",
-			ERR_PTR(ret));
-
-	if (!xpcs->need_reset)
-		return;
-
-	compat = xpcs_find_compat(xpcs, interface);
-	if (!compat) {
-		dev_err(&xpcs->mdiodev->dev, "unsupported interface %s\n",
-			phy_modes(interface));
-		return;
-	}
-
-	ret = xpcs_soft_reset(xpcs, compat);
-	if (ret)
-		dev_err(&xpcs->mdiodev->dev, "soft reset failed: %pe\n",
-			ERR_PTR(ret));
-
-	xpcs->need_reset = false;
+		dev_err(dev, "switch interface failed: %pe\n", ERR_PTR(ret));
 }
 
 static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
-- 
2.53.0

