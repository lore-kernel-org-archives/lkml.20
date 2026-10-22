Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709843;
	b=s07lqGwswL9sUB2rXjQGeoMCgn7zzEc2Qq73AZ+0qOAd7D8vwaYV7wVZQ3jEuvrak7Is
	 LQnAHk6TIECzaZ5g+1TrSBMMMTgZY+PIZaZQknX4HJRXHUYWsn++JZ0Hqwx+8dNcOib8m
	 ddDIpWQuhrBJthAXlQt2SGGyXgEQphyiJbv8mb1CXaQ6UORuCxwWGsECouwpCXCafL4fR
	 Yevtt/JoP0bqE7AvMXkALE7/uog0PxwuM9C2UgRLBKRL3uiGRxen6KsgM0IQF/rs1zIa9
	 17mdE54OihPqISxBCsQXRYcpeNOy1pe/VhCCrAvN1F0fLG7b1tOjKx8Dc6eczSc+pLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709843;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OucDXYhGBdXsYkzJOkUEznMM0q6yUkDYhETeuLwQ0h8=;
	b=RhmU9WrYJCzlxWJg8oebpzmfg6ilNgw5sZvqfYuNs+XkEHP/VXmeOqzUo/TJebdl7sBA
	 8GVEztv8PhWE+ds7iOW9Fm5XJ8mkN2WSZjPF8Cfmcmz3SyX5SvR6zjbqWrjTzR1oLIKWE
	 QJfsVJw4djERoeNtH9kSLlqkaXZjewsnp5y2WQG/9ug/CrPqz0xpZUQ6hINo1C5KE4ql2
	 463tAbIjIokxZbYI1+o5c+EsjhGT1z93ComMEwiqYJZGNk9hJL6PQy+TDWBgvManebXQ5
	 jrtb/YYQ6d/pHU2hraCUK+kw/9s1rljKlS91mqsvOztbytmIXvbGZn7qVvNzGLvL3Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Wx4UHPbG;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2C60A2611
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B2C60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Wx4UHPbG
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so181987a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709842; x=1793314642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OucDXYhGBdXsYkzJOkUEznMM0q6yUkDYhETeuLwQ0h8=;
        b=c3Cny9amj+Afajy2bXFeLBTKkLTX4N1vPXHzOC0CiHrSQT+l2Pz0d8xVhjoSVO13oL
         X2dqU7eGr+fQxaruJtFVtCWCsGp8scfYIggr/KpA0WyvUKTXVa8EuZeAQu2vkHlrDtS1
         8eNrGiiYjDsWtdlJJDX3HZegsjXgQMxol9mA4KAQWkJBnzrdx6+2u2rUZ/m7xOQX+tSx
         xFq/LULCEYP3s4NiNnOWxHFiu491A6oZ6BnCqFTOVvgQ8Ne3zw77MqVTLfNVRmMSrz1D
         pODc13LdTyofC9E5s+E4nRRzyy3MxNPbj9V7Y8DEQyxfzn/CGgjKDnxKGZVWZ/8u0VvJ
         n2fg==
X-Forwarded-Encrypted: i=1; AKwUvByApZymYQyzOPDf7/jco9mKp2wZjbG2LP/P0ZAFfnNJv8IqYLYrc6HEy+bLhKwm2Tr7WVuT0yhNyjDe7m8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpbnk71p1AOpfrjwNJ6axlXJcenBHHW5HC7MjcF1Pix/H0miNt
	TjuZyrLu2lSTrLw4KJKKbiEB/30vq2AwO7SKBmn2e0zBtRmlYqqRZw6slrGMBBjvFII5Rk3q+x7
	RT/e2GiCWxm/BGK7yhk/d5uoXHQQiv0l5jhB4QMY3JlLzGGhDbaK9+WEohPcaYLB+r/WNARanUK
	FsvULiK+NbpcjMvVZJXyVImFFYnbjtKA6mxj/w2+gV8ZSE6iXt4zAAmeU0Lg3GOwhKGLa+iiJC4
	XDIfha19hQaxuJ8xgyUbglq
X-Gm-Gg: AYBFou02XluUkMPh1+F9+0Yv7vly7MC12CHmcBc3P8W0OHTr15PYfABOFhMjzletgPw
	1ZbPfbn9d0ONQH1XNhWaK4dLp9Sd0F4Gh5/Pf90yMzOZU1Af9W4AypPoPezC+Q+3WbrrgxK+h/u
	LWVA9teHq4ZTUEPT1f0BnLrN3x8wWZEpVc+7i/P8cI54rBDYsMX2t367e8JSE7JrVwskfViWbaE
	0AotaljA146eeaIqS0xzHjhmSLe8WiUVNAdcZs2ZXoxhBkmjBKt0vn+dX2+Sh2lY0Ut5j8z3hF2
	kUaDUogDv9WY9gVDgqxhQPr8kt6/lGL7XE1WlPl4rCOtE9I/3R/vP+o/+Urs+3RAAo01wDjjwjC
	/UilMEOl2wEqpErr32fWKLCV6Pv74XH7dBcSIgW3/Ou4KGsDkNk+u//9H4wkthEG1PqCFbj+lfm
	ojOUIdY4XWbpgYdt4u0syOZAax95pq51WXu/uehjx4iqc=
X-Received: by 2002:a17:90b:5647:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3adce0e3825mr259273a91.61.1792709841956;
        Thu, 22 Oct 2026 15:57:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada49252d2sm2988702a91.8.2026.10.22.15.57.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:57:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917baea8e5dso7400656d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792709839; x=1793314639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OucDXYhGBdXsYkzJOkUEznMM0q6yUkDYhETeuLwQ0h8=;
        b=Wx4UHPbGv07jfQfElS3JNkHG6sMmKyEFEeiXrPfHvsyPnLMt28MWyf+fTju445KYiY
         YUO3jF0ufRmQeFfrLxA/w/BIpb41IEo2ueYEpmBBCL/BbomNaXJO9dVnNvh9NVGiUr/Y
         KxL0pKCdfePLykN3YtbCdPQosjJmVt8zmCHGo=
X-Forwarded-Encrypted: i=1; AKwUvBy/BK1+2BcvAI5mtTPNXUzndDcTP/34kf6vIv3tGHAJnyv7QOWlgeeOFVHv35rS0OON3B9rzqqhoTN0HEA=@vger.kernel.org
X-Received: by 2002:a05:6214:268b:b0:91b:83b7:b252 with SMTP id 6a1803df08f44-91c3a63bbaemr4400936d6.3.1792709839192;
        Thu, 22 Oct 2026 15:57:19 -0700 (PDT)
X-Received: by 2002:a05:6214:268b:b0:91b:83b7:b252 with SMTP id 6a1803df08f44-91c3a63bbaemr4400676d6.3.1792709838659;
        Thu, 22 Oct 2026 15:57:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c395025d0sm4501656d6.5.2026.10.22.15.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:57:17 -0700 (PDT)
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
Subject: [PATCH net 3/6 RESEND] net: dsa: b53: constrain SerDes interfaces to initialized PCSes
Date: Thu, 22 Oct 2026 15:56:53 -0700
Message-ID: <20261022225656.1387306-4-florian.fainelli@broadcom.com>
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

Publish the supported interface bitmap on each successfully discovered
PCS and use it for capability reporting and PCS selection. Clear the
parallel interfaces inherited from the common switch code on ports whose
mux selects a SerDes. A failed discovery must not leave a usable serial
interface advertised without its PCS.

Stop advertising 2500BASE-X: the driver neither selects its baud rate nor
supports 2.5G in the MAC override code. The downstream robo SerDes speed
setter likewise only implements 10/100/1000. Keep SGMII and 1000BASE-X on
both lanes until a complete 2.5G programming path is available.

Report discovery failures at the SRAB port to make missing capabilities
diagnosable.

Fixes: 0e01491de646 ("net: dsa: b53: Add SerDes support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_serdes.c | 28 ++++++++--------------------
 drivers/net/dsa/b53/b53_srab.c   |  9 +++++++--
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
index 87771e3788f7..d521050d7c8f 100644
--- a/drivers/net/dsa/b53/b53_serdes.c
+++ b/drivers/net/dsa/b53/b53_serdes.c
@@ -273,24 +273,11 @@ void b53_serdes_phylink_get_caps(struct b53_device *dev, int port,
 	if (lane == B53_INVALID_LANE)
 		return;
 
-	switch (lane) {
-	case 0:
-		/* It appears lane 0 supports 2500base-X and 1000base-X */
-		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
-			  config->supported_interfaces);
-		config->mac_capabilities |= MAC_2500FD;
-		fallthrough;
-	case 1:
-		/* It appears lane 1 only supports 1000base-X and SGMII */
-		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
-			  config->supported_interfaces);
-		__set_bit(PHY_INTERFACE_MODE_SGMII,
-			  config->supported_interfaces);
-		config->mac_capabilities |= MAC_1000FD;
-		break;
-	default:
-		break;
-	}
+	if (lane >= B53_N_PCS || !dev->pcs[lane].dev)
+		return;
+
+	phy_interface_copy(config->supported_interfaces,
+			   dev->pcs[lane].pcs.supported_interfaces);
 }
 EXPORT_SYMBOL(b53_serdes_phylink_get_caps);
 
@@ -304,8 +291,7 @@ struct phylink_pcs *b53_serdes_phylink_mac_select_pcs(struct b53_device *dev,
 	    !dev->pcs[lane].dev)
 		return NULL;
 
-	if (!phy_interface_mode_is_8023z(interface) &&
-	    interface != PHY_INTERFACE_MODE_SGMII)
+	if (!test_bit(interface, dev->pcs[lane].pcs.supported_interfaces))
 		return NULL;
 
 	return &dev->pcs[lane].pcs;
@@ -351,6 +337,8 @@ int b53_serdes_init(struct b53_device *dev, int port)
 	pcs->dev = dev;
 	pcs->lane = lane;
 	pcs->pcs.ops = &b53_pcs_ops;
+	__set_bit(PHY_INTERFACE_MODE_SGMII, pcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, pcs->pcs.supported_interfaces);
 
 	return 0;
 }
diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 9988a83fa7b7..77e81e1a414a 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -451,9 +451,11 @@ static void b53_srab_phylink_get_caps(struct b53_device *dev, int port,
 
 	switch (p->mode) {
 	case PHY_INTERFACE_MODE_SGMII:
+		/* The mux connects this port to a SerDes, not a parallel bus. */
+		phy_interface_zero(config->supported_interfaces);
 #if IS_ENABLED(CONFIG_B53_SERDES)
 		/* If p->mode indicates SGMII mode, that essentially means we
-		 * are using a serdes. As the serdes for the capabilities.
+		 * are using a SerDes. Ask it for the supported interfaces.
 		 */
 		b53_serdes_phylink_get_caps(dev, port, config);
 #endif
@@ -588,8 +590,11 @@ static void b53_srab_mux_init(struct platform_device *pdev)
 		case MUX_CONFIG_SGMII:
 			p->mode = PHY_INTERFACE_MODE_SGMII;
 			ret = b53_serdes_init(dev, port);
-			if (ret)
+			if (ret) {
+				dev_err(dev->dev, "port %d SerDes unavailable: %pe\n",
+					port, ERR_PTR(ret));
 				continue;
+			}
 			break;
 		case MUX_CONFIG_MII_LITE:
 			p->mode = PHY_INTERFACE_MODE_MII;
-- 
2.53.0

