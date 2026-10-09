Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E554F3EA8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569162; cv=none; b=NpaQauIFE1/lpu9EClyJxaq5avXE4bJQDt0iFSsflxj8ATj4yiCJjschyyKULbPTGoiF2bppojxFiLkprXHKBUO3gmTNxpkRcoz6AAZPXYBQ9l+aTqveyud3GgL5CHzPWUea4oMBn+lgYIZkbMh7eCySl0lzsYZctO1A7nL8fIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569162; c=relaxed/simple;
	bh=XNCC1hqe/mHMvxpTFKt4d9uwidGer/WfeTOA2blvb90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J38GwrabOkUVzVxVoUyileJHeotji1VgZhpr4AeRtXaU168HLdNXTnwJw8Cx1f3E01RCI0MCu+oz9rL6Yb6P0fprsnvn8eHJ3ELsTKt65ryviu8c8NRMjganztUfDpFK6hXopoDSKNWn4XxGs0k04izxXk1xH+BOazihUzqCBEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=ixKMSMd/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="ixKMSMd/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso854025e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791569159; x=1792173959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2rBfIUuOWtZQ6HO6K3CxhJKicUe18hqhsuvPjwqG6A=;
        b=ixKMSMd/RGd34B/FraevHvpK6LpamEhFdHsCqMYURKtMXsDWgqPrdrqwr5FLlQ3we1
         oJ4zpr1tag/ggCBpG6DI8D0tcXm6/fOZET9bmUluAwoE9T2D/YbxJMP0NKRn37uUULGu
         k/mcnybiTn4ukgju6yDITmtBwViQj2IS0/Uiq0K6JZfmc7keNAEv9uvdpLLZ4lSsMzm6
         2VvucSU0b94nVCD5rJkcJvXUcjHT+OjExzOWyN2x6G0YrQAMoXwAfpwOWxrxwJ47PZB1
         fIHfLamJwVqyhxuJyHHW6ndwZEezzZ7UUm+w5HQ7voZ+Knv18Ny23DRaqAMys0WxUUha
         VkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569159; x=1792173959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n2rBfIUuOWtZQ6HO6K3CxhJKicUe18hqhsuvPjwqG6A=;
        b=JGSNtx7vG2KGfLt+GBQZemZ7doudyeAgrreC/nZ9Od4Ns/qmibjsB8yD6T286qcHTj
         /NSOEC8YyQccX3bYa9kmCFW6WO1eWK9SL9BKBJHi91WAOGIR4cADCqZZThjLq7Of4NDL
         3XorIdvPXvlpIA7reiK16Yxw3obQ+ok4TtUyWKisqeWpzE6IYyh3YSUhq9UUl2k0wKL8
         eUvdCtfM/yrc4Rzdh6C6pZu1epHCb4Vfp+M2UHPoVACua/Mm66aQe7TIXmJK3fGJzZ8g
         5f+CMd1r1rU0w4GYGNuvC6rYSWsI0ayuOaUjtm4Wzv3DCetw/L43BmId4k9tTCJhbIte
         AVKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJnKXBrOZiqWYRl6t0snoRaZ1Y+oUtWQBBW/U5qfTu00Qnpb4guehpuztL+a7LEgP3mP7qaY/DXHEtDA8=@vger.kernel.org
X-Gm-Message-State: AFuF++kWRxaw+HVgAgvfHOlYZdnTRNk5TXnNoKTX3V7IYdiSsjtRCjgK
	xYx20oeyKv5rs+eZj+feWmTGn+LQL1VagtSMMJADHIcdm0/o/0DIvyuiRoIxKbIr7ow=
X-Gm-Gg: AYBFou2Aomjl5KlfCMKi9cfQqIXdUrqBxarFruw27aM0gQMyppC1lpAKT2SGrCXOK7d
	XGLkb3LiK3gafOSRzd1IbU4AC0Bkzqow7eQDoYEG91z+/r6MN5vKkUFz8YtTk/LUiCb+dUESIaL
	v55BdGhwH4AQqnG0N5FUvGcDN17/t04eW32lP/9OzUlG32JmCvkhP7SQrVIIF6V7DqlvTf4jU+d
	+xqRL+8l5RLzl+NooTJwJps0qYA9P8JJ5YOEoWN1MWutN6opALfTuY0/2qvfagVcqX9U8RznJgP
	avd6+wznmjMAk1pczc4Um100BVad/9JGd8ybUR/2bPxzOGvH+GOhhd6Ns5RQy7bCijq24HP+PHS
	CFsoIlDOBeRHPWFHj8PnykAyVuCT1SvRhtJyVBYQTgzN5F4Axw5kQOSJcRDoOtVJa8mR5lGTfgJ
	Tkj3zn6R5hEf7mnS69F7oOi36BfrPN6ZNwomB1Jh209rTMvqj5nyPdb6/DGbrA
X-Received: by 2002:a05:600c:3e1b:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4a18e487239mr56246325e9.14.1791569159183;
        Fri, 09 Oct 2026 11:05:59 -0700 (PDT)
Received: from remote-01 ([84.17.55.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm118184915e9.8.2026.10.09.11.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:05:58 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v5 1/4] net: phy: refuse a second attach before touching the PHY
Date: Fri,  9 Oct 2026 21:05:47 +0300
Message-ID: <20261009180551.1234107-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009180551.1234107-1-f@lex.la>
References: <20261009180551.1234107-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_attach_direct() tests phydev->attached_dev only after it has taken
the driver module and, for a PHY with no driver, bound the generic one,
and then leaves through the error path that calls
phy_detach_internal(). That call works on the PHY's current attachment,
so a second attach of a PHY in use tears down the first consumer: it
clears that netdev's phydev pointer and the PHY's attached_dev, removes
the sysfs links and suspends the PHY, while the first consumer goes on
using it. A PHY on the generic driver never reaches the test: the
attach runs its probe again and, when the bind fails, clears d->driver
under the first consumer.

Found in review of a change that makes phy_detach() put only the
module the attach recorded: with it, this path leaves the first
consumer's reference pinned. On a Keenetic KN-1012, a test module
attaching a second netdev to the EN8811H that the lan4 DSA port holds
got -EBUSY and left lan4 with no PHY; with this change lan4 kept it.

Test whether the PHY is attached before the driver module is taken or
the generic driver bound, and refuse from there. A PHY attached without
a netdev, as DSA does for its CPU and link ports, has no attached_dev,
so test phy_link_change, which every attach sets and every detach
clears. A second attach of such a PHY used to succeed and share it;
with that change it would also leak a module reference.

Fixes: a7dac9f9c169 ("phy: fix error case of phy_led_triggers_(un)register")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v5:
- The test moved below the device and bus references; patch 3 puts it
  under bind_lock.
- The message says what a second attach did to a PHY on the generic
  driver.

 drivers/net/phy/phy_device.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index bfce8b893644..6bc9cdb7fa69 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1811,6 +1811,13 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 	get_device(d);
 
+	/* Set by every attach, with or without a netdev */
+	if (phydev->phy_link_change) {
+		phydev_err(phydev, "PHY already attached\n");
+		err = -EBUSY;
+		goto error_put_device;
+	}
+
 	/* Assume that if there is no driver, that it doesn't
 	 * exist, and we should use the genphy driver.
 	 */
@@ -1838,12 +1845,6 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 			goto error_module_put;
 	}
 
-	if (phydev->attached_dev) {
-		dev_err(&dev->dev, "PHY already attached\n");
-		err = -EBUSY;
-		goto error;
-	}
-
 	phydev->phy_link_change = phy_link_change;
 	if (dev) {
 		phydev->attached_dev = dev;
-- 
2.53.0

