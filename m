Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709848;
	b=19fuBDXSXflAIqNcf+anZXrf1Kjhrj00Qn+A6XsbgUO3SfHkJOnnvOFB1MA098K9DVnn
	 gQPamOVv/Xej8wMN2GSWigpPMnOVO6zulLH7EGChe1BLQ9jo2VPPg8iZ3fLUE/hHccS6m
	 uM7pxUrB7D1mxRprh/cFfu1pIFPn+J6BF7Y8jZ9QjiwemNnqp1k/dmJZkqw0XK201zPgu
	 6vlzZnVtfVqOBcdgeAFV20q4LcutVTfE+KT6W/zM17JrPp3wknGzStlUtrl0gxFIc2tJB
	 gzuBnIxEPHsTNxRf6t6855dZyZctD6OInq82OT8r1UYxdXHzbkEPPDTIGYgfqhh10iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709848;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=0hgSB5REeOoOU4+uL52FWMra36mU3bq54+5dt+GWlSg=;
	b=tjfOzSj8QC0u6r8MPKdB9w8KyRWcqT/6BGQLCF+1jriEs0r9ah9fjIxbhiK0FtCO/ZPj
	 HahUAY9bEBdp9fSMtLduiImEWrTUP3mVTVt0OgbdmDXUSDJAesL7Tyu250CIK+eXNZLk6
	 9qsBgpggNMObwwmtOCxjeIITjnOzYE5YlfeQYIeJ0G0dWdIXbZ9LNYSapOfw6TKfRLj6p
	 fzv51cASjPVE7tb5QFxjUkqVzBEi0N3weNWU9mMHIvnjBWOB9rpSRmsqoCNSghb/YE7Tw
	 BKglxaMCNYUesDaphCdyFtLo1eNE1ViM5W/YWV+8ZYpGdrkWu1cYehoQTfdbF1eTiZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Kx9o1f+1;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A025F60A380A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A025F60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Kx9o1f+1
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91befbcad6dso5137206d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709847; x=1793314647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0hgSB5REeOoOU4+uL52FWMra36mU3bq54+5dt+GWlSg=;
        b=dOp7hiYh7Wj/kGsgz6NZnCbVvxVZhjhE9pbjDssDpg81Gd+Zj1fAcyqWgvWwslZETg
         dwfdeA9N+BHjTIddSjJ+0CeEsUD3I3J+FcuXR1qILKRE+5aeq2AWOUb/qEtyawJsNn/X
         teTP6GLmBMbNPyuj2SK9LXiKBAHOQNAm8vEP6tA2HtEEae3MBm6yt4x/6IvQNa4Fhd2A
         8tzmT/5UsLBVEEiZFqTJkLAhiO4pGsOl+0bx1OkQzB0lwTpzGC8RjdRHYInTXdWkY9Yp
         tAJlBstKSQtR6hjG+8FXOww1nuBLI+0ctj3FSDJ17ivZHX1/CmwYY8MXNg4rXhwiEe0x
         kC7w==
X-Forwarded-Encrypted: i=1; AKwUvBxmIrafulpmMph0CdQxi9XKKT8vWcnJ0jKgyCyo4GOTUCdociDdYffmG+SBAZbPzxDUDDdA+JKPHZ+aX4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Q9T68R0r4IYIdnlXnmmrBmcQMRfBfChF4OdaHGmbke/F88CX
	OkkOH8TmZUynUB3DnMj1HsiFGOrAnXZvvmJivyz+Y7qopMO1wdHClPl/Rhsc1E/LUEytdPS5lK3
	E2uOlqHXRH9vEHcKHWXl3i4jJDqrJ96H8+qMaqLpHcl9muD4bl6p/uQZk6MIdCxkCHr+aL8AttF
	gDmhhvAhiPMFrG/qSGRtea01CrC5qHlms1MsPSesq6085sYWXJAqW31DpARbtRFZgTdo5Tfp2AB
	siZ05V96cEP7ZlQiAq1tPd+
X-Gm-Gg: AYBFou1e6TtQ/I14iMDc3QZT9afk85jci/aaahSWvSenjVdRsEyzAX6fg7MNYrrhVhd
	wBGdev63oTrtAmk6nii2cJfqee6CfuXQ/A9O85FwT7qQJ1js660ZPRnRDnNQA1mhz1NChi4zUND
	M5nDcX2mnLyis4wt5qmb0BRiuQx83L3a8G8vTSNVdRQwFHpZtzmahRd0n87fFPML0CaWobgdco/
	bhJoiILXXopqlWVPGt9ak4sIf6boQ03Y9aFGvDI4z55TsIKiUt9V5hCjbX4BdIV29qK0Q8OQenY
	EkyFX2+yuDWVJaQ9mcj7dqhxarnQKGwNzzGgRjxtw2+zszR0aUNEY3/nzT2y7sMSuXbXKDsP8wT
	pMzc6vgKkrhtOikTLgLimDgHjMbb9z/qb3iv48z3jWQltlB/LGqFAxoJtPg9rdauifX64bmhDF6
	wOXnvSHMmgi29XgBjCPOt6bJuh804scrFHUpwYwT9Qq0c=
X-Received: by 2002:a05:620a:3721:b0:93e:910c:5fbd with SMTP id af79cd13be357-93f6f82b792mr163732785a.63.1792709846658;
        Thu, 22 Oct 2026 15:57:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93f70ece19csm6492785a.8.2026.10.22.15.57.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:57:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b8306ba68so7812496d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792709846; x=1793314646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hgSB5REeOoOU4+uL52FWMra36mU3bq54+5dt+GWlSg=;
        b=Kx9o1f+1Er2yF9nGynciYriCgi+cGH2pLyBSUR/amEKN+/7Dl9XiWSe/gNkkjm5IL0
         OVhBBRnBhBNSUD7KCxqHsY9b/i/XtXDjWUOkEJl0VaCsZetdegoOJvjPLAO8eGc/MJsS
         HoktTTY3ewoQY5JMfycIV1sf/fJay74oFEZxA=
X-Forwarded-Encrypted: i=1; AKwUvBwOn6qKoCfho/9i6/UCcTEfmCXny6BYB4bx1neqVorx/2QaUhys3fTYYcHrPJ2yvh49c0/OpGz0ZxDqUM4=@vger.kernel.org
X-Received: by 2002:a05:6214:d42:b0:91b:5d3b:7abd with SMTP id 6a1803df08f44-91c3ab25d34mr4344346d6.57.1792709846005;
        Thu, 22 Oct 2026 15:57:26 -0700 (PDT)
X-Received: by 2002:a05:6214:d42:b0:91b:5d3b:7abd with SMTP id 6a1803df08f44-91c3ab25d34mr4344166d6.57.1792709845589;
        Thu, 22 Oct 2026 15:57:25 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c395025d0sm4501656d6.5.2026.10.22.15.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:57:24 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 6/6 RESEND] net: dsa: b53: apply resolved link settings to serial port MACs
Date: Thu, 22 Oct 2026 15:56:56 -0700
Message-ID: <20261022225656.1387306-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022225656.1387306-1-florian.fainelli@broadcom.com>
References: <20261022225656.1387306-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The serial port MAC callbacks leave speed, duplex and pause under the
hardware's autonomous control. In particular, changing phylink's pause
policy cannot affect the MAC when Clause 37 negotiation is in use.

Use the existing MAC override registers for SGMII and 1000BASE-X links,
including PHY and fixed-link negotiation modes. Apply the settings passed
by phylink at link-up and force the MAC link down at link-down. PCS power
and link observation remain independent of the MAC override.

Preserve the existing parallel-port handling, EEE initialization and
BCM5301x CPU-port pause quirk.

Fixes: 0e01491de646 ("net: dsa: b53: Add SerDes support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 50 +++++++++++++++-----------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index b04f9d5f0525..172ada124cbf 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1600,6 +1600,17 @@ static void b53_phylink_mac_config(struct phylink_config *config,
 	}
 }
 
+static bool b53_phylink_mac_needs_override(struct b53_device *dev, int port,
+					   unsigned int mode,
+					   phy_interface_t interface)
+{
+	return mode == MLO_AN_FIXED ||
+	       interface == PHY_INTERFACE_MODE_SGMII ||
+	       interface == PHY_INTERFACE_MODE_1000BASEX ||
+	       (mode == MLO_AN_PHY && is63xx(dev) &&
+		in_range(port, B53_63XX_RGMII0, 4));
+}
+
 static void b53_phylink_mac_link_down(struct phylink_config *config,
 				      unsigned int mode,
 				      phy_interface_t interface)
@@ -1608,16 +1619,8 @@ static void b53_phylink_mac_link_down(struct phylink_config *config,
 	struct b53_device *dev = dp->ds->priv;
 	int port = dp->index;
 
-	if (mode == MLO_AN_PHY) {
-		if (is63xx(dev) && in_range(port, B53_63XX_RGMII0, 4))
-			b53_force_link(dev, port, false);
-		return;
-	}
-
-	if (mode == MLO_AN_FIXED) {
+	if (b53_phylink_mac_needs_override(dev, port, mode, interface))
 		b53_force_link(dev, port, false);
-		return;
-	}
 }
 
 static void b53_phylink_mac_link_up(struct phylink_config *config,
@@ -1633,29 +1636,22 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
 	struct ethtool_keee *p = &dev->ports[dp->index].eee;
 	int port = dp->index;
 
-	if (mode == MLO_AN_PHY) {
-		/* Re-negotiate EEE if it was enabled already */
+	/* Re-negotiate EEE if it was enabled already */
+	if (mode == MLO_AN_PHY)
 		p->eee_enabled = b53_eee_init(ds, port, phydev);
 
-		if (is63xx(dev) && in_range(port, B53_63XX_RGMII0, 4)) {
-			b53_force_port_config(dev, port, speed, duplex,
-					      tx_pause, rx_pause);
-			b53_force_link(dev, port, true);
-		}
-
+	if (!b53_phylink_mac_needs_override(dev, port, mode, interface))
 		return;
-	}
 
-	if (mode == MLO_AN_FIXED) {
-		/* Force flow control on BCM5301x's CPU port */
-		if (is5301x(dev) && dsa_is_cpu_port(ds, port))
-			tx_pause = rx_pause = true;
-
-		b53_force_port_config(dev, port, speed, duplex,
-				      tx_pause, rx_pause);
-		b53_force_link(dev, port, true);
-		return;
+	/* Force flow control on BCM5301x's CPU port */
+	if (mode == MLO_AN_FIXED && is5301x(dev) && dsa_is_cpu_port(ds, port)) {
+		tx_pause = true;
+		rx_pause = true;
 	}
+
+	/* PCS negotiation supplies state; the MAC applies phylink's policy. */
+	b53_force_port_config(dev, port, speed, duplex, tx_pause, rx_pause);
+	b53_force_link(dev, port, true);
 }
 
 int b53_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
-- 
2.53.0

