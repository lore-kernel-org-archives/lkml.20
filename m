Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94E4F55BF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488427; cv=none; b=bEra2wshIrZeMdteDoDmWl/DkEKNXREBtZ/hYIRE8SzCV/IKmaIH3bwMFgKZXFLkel8/vFnXWzBK179myk3hGYQzFz05CYj3/SqzXsOdkEi0KA935zr66HRGWyIRKCP1jibrObcNfi+wXJ3RlT2XHNxCLpX6Om3Hm8qVhf/paXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488427; c=relaxed/simple;
	bh=igs2tqHF/e5m1TR4ZJ1BI1cUnIOjq3NYwvi9hVUtQZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS2BLK2B3TxkP+uo+cBQrit8yab4Cc4QyMWh12arWBDwWebem1p122RONHGO9xm0UZod7P3UcqkEPv6yP2IvfCSofw3U/kyKCAavtoCUBCfwwaqnx4mAMLP3LbeMzFj43N7jfX3OUnq+t67xKn2gLgqyCbl5z1jL/08P45pfs4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Elsfa47l; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Elsfa47l"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso29013215e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488422; x=1792093222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=;
        b=Elsfa47lVla7MnQgVv75UOBcFni1CLI3II73VKfl3GO3AorOPznCySjgjUJVkAtpI8
         kkKAREzqVCaIn6ql/p3YXyhCP4R1K9o5B93pW9jYp5fx8BpjeJn1SlSz82EJIFPk6Tqb
         f9B7EfbntFnwRWkdPLfZ4Bq49zvwY3/bttkWsFQKaeF36ince10sVwIJZHxFebH/CrO/
         a/u1vdWGTnrx0OnRj9g7y1mqetnj/CfhrhiH6W1CVUBHcFzP6C0B0opw0y3OV1Xq0oGR
         M9M3gQzd+oqjXo9hzlp0+Xq4hDlrb0nC2XqJ2/QOVtfduLDkOTwU/vjHdhsld+SPPGWm
         CgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488422; x=1792093222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=;
        b=Vcuh3XgK00DoMDPnz7Co/93hPg40QSfnF8XEZTIO79b6bwbGGL935YhF+as4qfekAb
         +5zX3Ik5kRwwNk6BVwxhVIh8D9YMqPex7R0TvPV8nbdZheRViS9I9YBplQId/RGh0Gqf
         bL4512EmIfMrDx2xl/tJO3P393gYcR4IWT56ziDZogXo1AQma0RLTFLKqCcdBWRFJBCJ
         vMOZEMvtddnxN1SVMbD6BcuRJ/SEKyG/s/0Z1MK4evhV4wFuEgqSVb46mU/1ut7AdmMq
         z4CYpZiD/fhQO/F3n7eOSCh4TKzSfrD5T3DHKSYIY15TGdVSNMLzHKPcVnz3VqntlvVw
         PqsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/7X1z7kTSJVpg8gfEmfFCH4xcY3FayKfWakEC1HK1LOVvpB9Wu7frXJlPzM0pfOGLQplc1MVqs66JxcU=@vger.kernel.org
X-Gm-Message-State: AFuF++lIwY5Upb/oSp6PrcQPHUnQZvYWVB+JnuNxfovyAIONJIFB3Yrp
	KBakcScsCCltkhkM5tP1G+B6IM678AK1kFmxwYX7V9eTp7Q/mIMC+xMM
X-Gm-Gg: AYBFou0anfCcowxtVjVX+PGqHrsWRm15patwsVYM8f1f3Ru6dhFxG/hR7018QD+0gUb
	IVHHWL7L+HFbaLY2vXLBwzfHJvyGWKKOmFINq5oXwJynOROb2/2PNkeUQBwA/pSpeaK6AbVQJ2v
	m4fxl10e+/3hwSZ9pBOfodxuWSHACPyn+xIb0V7PCKNf85bCvojcnPn+9n9lvFMV9uotIWawbDS
	SB50SlCzCIz01pVXrZN5sXayjbkLYPAvl05hCHAc/iJc1vWoEX01QBGMXiOK9W2yonlNNAbiAyY
	rQtm4MXcoLY8onN3m0qoSxev69ua2fzdJ7CM2880Yie6DK0wI6xnKLE8Rn/BYCY82etj0HT7pmY
	RaH5eCsVfvh115k9pyaStn12fvv6tMjSZ6uQvnYXnS9w98E4Dqlq5+ExNt00WfW9bTRH4zuwi8q
	yxvJYQsWYpiSz+bxWLCwit3hKVLsqRAmDOkDWfX4u6JpCIOKyVSm3jB5Zb/6TkExzKmlwln+eKO
	WFH5PpGErGNU7z/CE63tuGCtFSiKLYOwCOTmg4AqDH99H6VYmDAqxxLs8hjDsG6HeAQEpMGMWAg
	SejCbHzLS2UUJEGB91r/Hw==
X-Received: by 2002:a05:600c:5252:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1806878c3mr107026915e9.33.1791488421519;
        Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 04/13] net: phy: micrel: Check RMII clock select property presence
Date: Thu,  8 Oct 2026 21:37:44 +0200
Message-ID: <6271eea14eb6ef93031921cedc12d87cf5e25595.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The micrel,rmii-reference-clock-select-25-mhz property is tested
for presence, but of_property_read_bool() warns when the property
has a value. Encoding it as <1> to satisfy the DT schema unit check
would therefore produce a warning at PHY probe.

Use of_property_present() for the presence test. It accepts both
existing empty properties and the new numeric form without changing
the RMII clock selection.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - No changes.

v2->v3:
 - New patch: use of_property_present() for the RMII clock select
   property so its numeric form does not warn during PHY probe.

 drivers/net/phy/micrel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index ae830781824b..acb481a29c25 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2791,7 +2791,7 @@ static int kszphy_probe(struct phy_device *phydev)
 
 		if (type)
 			priv->rmii_ref_clk_sel = type->has_rmii_ref_clk_sel;
-		rmii_ref_clk_sel_25_mhz = of_property_read_bool(np,
+		rmii_ref_clk_sel_25_mhz = of_property_present(np,
 				"micrel,rmii-reference-clock-select-25-mhz");
 
 		if (rate > 24500000 && rate < 25500000) {
-- 
2.47.3

