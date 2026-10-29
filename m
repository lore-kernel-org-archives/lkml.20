Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267433;
	b=qzelBFrMHDGoCV4txvC9k/XyIJ3faHm1YNDQS9Vzh6tRc76MIgCuADvGgzMGmcV+hCFp
	 YQHB1uEECHWvhxQwH3Enj6+huw494j1A2jHroGt4RmhJAcrp3eLw/LgsMGKbS5GpcRNW+
	 uItgoqyRE5rW3nV/UvtBHefUZN8RPd/kQw1Es+S9t3cy/ejD9Ub0b61/QY93wbaHlTkS6
	 qbpHnF2CUXwsYCuNGKvP22ysnXZrZS45Z8wgZPSVD0ZCOI5zjYlC4rFKh/4RD6kn+hg9h
	 KsPoq4PWHs0XOCjHU2eCH5J2oD0q0cV2DfK5V0KK+1D5TscQY2aZ2XiF2HnxDFsRERA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wlSDMq+Onl3G9IdYH55u+DZBDAOLa9ewzbFQlEUFQqc=;
	b=bHszHsvN1YvGhe0KHiyv/5RxyE7Ugrf3WG5niA2iNkDZW5ojZbCrG6ZnGqUo1mvvC8Ap
	 onKRo75QkNC9Xqjz7Zu2yzw5LQ6FdCVu2nOgr1D3A/kcqk6RdggVVSbPqNwdMihO7XirU
	 7PAOSePv/8z5cKIJB93bxl2LG3H0eMJ+pSw2UpWwIPzsw5P8a1yyh1qReVzCgZv05ZFR0
	 x4f1pHGSx/RtPHdjsoZReqOfNnIxH4Yrs1Vz3+BpgD6Ka0YjfdIfElNawPiP38ZyBBkYv
	 tACJZx+vQphLcAsgMciBKvIX3ba4wFQvx9KYsmK0jlih1cVvR41HgzJTiyjfamqVnYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fsLEvWhs;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF17606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF17606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fsLEvWhs
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so921538eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267432; x=1793872232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wlSDMq+Onl3G9IdYH55u+DZBDAOLa9ewzbFQlEUFQqc=;
        b=fsLEvWhsLauaXv8IFmCQXSUEAwtnV8yS5qvAuJglzHLUhmGPhuNlLSrFRnq1xYYSXF
         tpq/e5sTapHttdDlLZwQ++5LnC2FUKAJbTLz74WFlrr0ObZU6EcUKBPh5GFGgXQQrDXx
         9ALoQAsZ/vyAiU1ZYniw8u7t0ksEYI8lvn456NyhGjneK5IQUOX2/KwPlmoPUjYq7Rve
         xTBvZfYjG5P6fWFUgKVV2QeG1TqDFDQJD9YruvwMo3izHHjOT2WWGCpTUluzFYb8NlW/
         8GhrWXTG+aNwEPPjnPsr5X/3cwCu5ZMVyoCV+Bs/5+ddlsRun2B6wORR8L9skm4rcnB1
         7QDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267432; x=1793872232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlSDMq+Onl3G9IdYH55u+DZBDAOLa9ewzbFQlEUFQqc=;
        b=vv61NyUWMPDVLhF/7UNysoJ70xoQriXKuHDBY6iNK3DULyqXRxo90ZbmwWB67X1BxY
         V2PkjPB01/tap+lCNQrIsMENYdu0UDuMVMEFCZg4UCWwYqDpqscsY9ylb+xlLxWNLOPX
         nuE4TyEiWrH0vldYbkwYHLb9qFB091ExGNMQUsWyFtnp1DKgCX+ZYqqZGApwkTP5kCwX
         JLr+KRjMk6igrAM0vGxXmAhHnqKCu+cDvqRczkzOoNPMYGeNan4j4IkuKMgjtCqzRl+5
         T6Az3oB1NWzXN+AstiDsN+vBQ3U6QWu3MOh3LM1IX09Wrg8QMkREAQGnMaUK5zvSw022
         dWsg==
X-Forwarded-Encrypted: i=1; AKwUvBzTeQrZz+ck8sGmQ1nA6rmCuKSml2TB6pMYV6gqvdby60b2pYHIF61+NMCEdy/kakq15wkm2pKqQI+yPTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIScZCIA23CIEhL0hahhtvkHDBEmYDWaKLsePVRzhN4Vp43NNrv
	Clo2zF8oBvKwGvIANTjVigOVTNr9hh4r9e/K2NQ/ntVyumrpVU0pf8KI
X-Gm-Gg: AYBFou28HI6oI8p7dw9nArPp+/6zgQeIQsV4kayqDBXj3IkUu6PEoBS/6RagBJQqXwc
	98Mo+yYmxP+3MmBBs44ZD/HMPP1tNo0NeWeOIri81H94PwyFZ7qEx/6PZxr3brJ7ilSLP4yTo/K
	AkziswH2TRgz25xj3JXXmBI2aaFkejvNxYSQU0e6xvl5gT53BznNrMZyh91rtgngBbCa0F2Om9R
	8rMeZBhizBnRl1RBVJr6vAuO4fksFa2NBa0lElQ8PjrcDcJ2fdR248jcT5JTJYPFjABeo5pxzp1
	yU3qukkFXR9ZSLPo3yFPe4M5bu8Qy7cNz8nluKhwyyIntTmfAj56lIpsmlZZ7MJyrT/15wTnKk4
	aH6Mx+taKypHvPeB9UNYPs7GyKc9m+EkHmerXzr7M4hf/oU7LtLUDObRtSIRWA4FeDAu4o5fVfE
	s0pt8R6fou+8lC6O036dJJvCC3QR1WNehFl5KFyfSaZoffzRV/FuZp/fk6QXOiNc7NQAkjphle2
	zBPyy2B/PHmVA8oV0Rt4/OoKebHNASOu8iKQMMhmUqor0IYW/Xvx2EC5PwAmpi70RGXqKkSWrN4
	u28fp6+zsZR5skGtb98tUrn+JEo=
X-Received: by 2002:a05:693c:881a:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36a202869c9mr7131516eec.5.1793267432214;
        Thu, 29 Oct 2026 02:50:32 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239338e2sm18527707eec.18.2026.10.29.02.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:50:31 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Coia Prant <coiaprant@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: pcs: xpcs-rk: limit advertised interfaces
Date: Thu, 29 Oct 2026 17:49:17 +0800
Message-ID: <20261029094916.3127193-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII, but the RK3568
GMAC only implements SGMII, so only SGMII is advertised in
supported_interfaces.

The generic xpcs core fills the mask from the compat table, which
includes 1000BASE-X, QSGMII and the higher-speed modes. Clearing it and
setting only SGMII keeps phylink from validating interfaces that are
not usable here.

1000BASE-X and QSGMII can be enabled later when a board actually wires
them up.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-rk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index 6f0a110e32d2..cc11a70d624f 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -536,6 +536,12 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 		return xpcs;
 	}
 
+	/*
+	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
+	 */
+	phy_interface_zero(xpcs->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, xpcs->pcs.supported_interfaces);
+
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
 	put_device(&pdev->dev);
 	return xpcs;
-- 
2.47.3

