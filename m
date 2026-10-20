Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489030;
	b=kJL3Lsx/VrrYsHklgKQLojW8WtlukmnErtJwfeWsnYU70uhNETiCAfdsdJF+KuchITDy
	 hJicevzWGBNxIcLkn91i3M4h0cRYryaffYhdVc1s8BJf9LeAuZAAHVjDOUL/OyrJm86BM
	 0YnvFT8AWhHe3ixuqc0+Q3xNE3zYpTAGmQDmdugD3q67Pf+Hvcr9xO/kHYDrEDVy311bF
	 XRdjdZXVVgfHyS9QjUkOkZTwJgDQeKub8OIDHPRM+v0AorM/Gb2b3KX3ld/gEqTcYKJxs
	 lUVlah938rFIe8VS24Svw+k8vstIuP2aCX1ggfX5P66SCVVXresdIcr4nF4WSbiTKMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H4GOGL2XRIUNcWmRMGdO+Qzk7DbDP4YbYaaDzFcYy0w=;
	b=eDHkyhp9Pxgm2Bz3AIP+KMplW0iiknXBQVZAKcneHLzBHReGJQZXD1g9cMP0km3hbj+V
	 ITno5/rcm+B00qd09L3v8Jv5M6CQfMbBedxACj4Ur+hvd7e7qbu9THgQ/UMUT63D+MTku
	 IhBUQhw4oNKzTzRg89LFgLLlVtl6skM2iqNLYcLkFsHfAnpmD7f8lkCi0zMkY9PYz7Cwx
	 b7Ztb1FA7tef2C8YML3IDsCtOtRFfg+Tp/je3u7hlXUAi1BQ06KmuNJ3n8EeBqWqaPg4E
	 NroccWeWW+B0TbvSWMtyMVcr9XDWckn5us32TKJdDJNT4vcOMLD8JjKAmXPrKDDebNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DyCaFXpu;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B1F60A2614
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B1F60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DyCaFXpu
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4322d310e7so293755866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792489029; x=1793093829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4GOGL2XRIUNcWmRMGdO+Qzk7DbDP4YbYaaDzFcYy0w=;
        b=DyCaFXpuNo2qreLvjLkI0Hkp/j0h/KSJhtDB+JWBTwzeVn2JS7TzFqTBLfsmNXVzow
         z+eG5oe6tiG8AS40BoZNrNtLguY5+4hdWB2N8STR8Y3I/yynOI0Oc39K6xKKm2lUgiz0
         WiqWJvYGJhBP+x/Xap1zEN17pfbp2i+N4V2dCCsLM1A+m7WkR3EswTlapSyCaBNrCAzM
         Gs7uLUw8KNYyue1VuvZCjFQGWeBAM/2rc73rQDoPyeOJH9LFNlxnSZu1lF2egSg4KymF
         0MUYQTZsKhWIXDctVbPMPkCxDC8U0RJ/IQeqs7MP8UrIq4Dftt6NA2N2LrELJTwfWgNr
         7U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489029; x=1793093829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4GOGL2XRIUNcWmRMGdO+Qzk7DbDP4YbYaaDzFcYy0w=;
        b=s4ynTM1U3q9SC21/8O8eKV6mt2ALIJ5iNKKNHgeFnmJAGTB59v6LSkl82AR4rfvX4X
         NwTyxzGuN1d/RFw6BZv8fLr5TMd6m6g2lptAfEeibl1p908PmPNoRDmiT4P0AunN5Hgu
         kOY0HzPfmKePEMxS48nqjVShZKLaUd3ezkJnW+a+xnZ3aZYeF+dQ52kDFRDTbDPzwf9w
         pd0CfaiJMwa/DBd08PNcJYhGTq839ulDCVoJ3xav+vfR1LS4ORUgY1aMc0yjGExdgWYC
         wziUiwuUffLZyV9f4wCumzfJ+eLdhDDkLKNM9MxMT5NJYVHfXrBs/J4FzPcR3+sB0bmY
         3WgQ==
X-Forwarded-Encrypted: i=1; AKwUvByVs5PG0GSgtOTmj0ADyK+68S+NR1oGkyJTmkfRwelNSOS/BnpCVh0sQBprPYFZ45A97UjIKOaPa6eltgY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+0w32lZikTwl8hSz2+511eW9eC2hlh1msRC7q66qK1uFB3SFe
	Uq170o5KUpXehUdAF54k66CIL3Z+LzAI9jygaYoh16l/da5Qc9NurHJPdEnFG5exqEg=
X-Gm-Gg: AYBFou1L67+AtJAp5vh21ndzRoilhYJiRhMwZg7HKXy1W1VfpJPsKgREsaLRypM/+9k
	rllXQahSTj5p5HDsQNDVPYfqZJfH+GYwv2xRj0lF527AD7Nks1R0d8vM9IQxD6d8nociNjzza0a
	P/0TrpaWa/UJWioXKhnM19m61OpISP3dnDRu2OVKOf/KAu8SGq+3llfZQ3cAA2FNyMQim+4Jkhh
	fVcK4sD6qQXZsbV/cOoWnMw6QOSwdl48uy54zraWuXqTzxh4zSu9PbcNbqjz06CnEDGRhPtNxDn
	bmvizLIjvGA/+7fG6FLFFwC9iXV3xvV6OJ6szLnKh7BoTKcjrbvf/mBv7CHxq7Uc677Jxg7Kd7K
	Klj8t7jE74W29tY0WzmhlygXpzEvgKVY7r/2GURptjiwl9O7weKJ3fIP4afnbCORO9daKMHT0rq
	TwbLgiRaarl9I8cCa291lQag5v1q09bMQjrH5yUdSxzU4GDPTqzltrpXcg1Ahw+LAGKOolZamFG
	etZNolG/ipQgnz821kMbg0UR9dFGcJsRntNtB3gSYZlnntrsnyrzw7NBImce1s/ucuBcDiPW1Nz
	drm7Pt1VQQP4M+UUdJs9IP3YsMUD46ZdaVdI8FUdK/6W6A==
X-Received: by 2002:a17:907:96ab:b0:c3e:f39b:2286 with SMTP id a640c23a62f3a-c419699e001mr779531066b.0.1792489028894;
        Tue, 20 Oct 2026 02:37:08 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm462730966b.47.2026.10.20.02.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:37:08 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lxu@maxlinear.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v3 3/5] net: phy: mxl-gpy: release MxL86211C Super Isolate
Date: Tue, 20 Oct 2026 11:35:36 +0200
Message-ID: <20261020093655.344585-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020093655.344585-1-robert.marko@sartura.hr>
References: <20261020093655.344585-1-robert.marko@sartura.hr>
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

The MxL86211C can be strapped into Super Isolate mode, leaving the PHY
halted after reset until software releases it.

Release Super Isolate before gpy_probe() reads the firmware version. Do it
again in config_init, where optional VDDP setup is reapplied after each
hardware reset.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Release Super Isolate during probe before reading the firmware version.
- Reapply the MDIO pad voltage only when a VDDP supply is provided.

Changes in v2:
- Move Super Isolate release from probe to config_init for resets.
- Reapply the MDIO pad voltage before releasing Super Isolate.

 drivers/net/phy/mxl-gpy.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 952272faac1e8..dba0777158b2d 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -114,6 +114,7 @@
 /* Packet Manager Control */
 #define VSPEC1_PM_CTRL		0x0c
 #define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
+#define VSPEC1_PM_CTRL_SI	BIT(12)		/* Super Isolate */
 
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
@@ -427,6 +428,30 @@ static void mxl86211c_disable_vddp(void *data)
 	regulator_disable(data);
 }
 
+static int mxl86211c_release_super_isolate(struct phy_device *phydev)
+{
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
+			      VSPEC1_PM_CTRL_SI, 0);
+}
+
+static int mxl86211c_config_init(struct phy_device *phydev)
+{
+	struct gpy_priv *priv = phydev->priv;
+	int ret;
+
+	if (priv->vddp) {
+		ret = mxl86211c_configure_mdio_voltage(phydev, priv->vddp);
+		if (ret)
+			return ret;
+	}
+
+	ret = mxl86211c_release_super_isolate(phydev);
+	if (ret)
+		return ret;
+
+	return gpy21x_config_init(phydev);
+}
+
 static int mxl86211c_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -456,6 +481,10 @@ static int mxl86211c_probe(struct phy_device *phydev)
 			return ret;
 	}
 
+	ret = mxl86211c_release_super_isolate(phydev);
+	if (ret)
+		return ret;
+
 	ret = gpy_probe(phydev);
 	if (ret)
 		return ret;
@@ -1481,7 +1510,7 @@ static struct phy_driver gpy_drivers[] = {
 		PHY_ID_MATCH_MODEL(PHY_ID_MXL86211C),
 		.name		= "Maxlinear Ethernet MxL86211C",
 		.get_features	= genphy_c45_pma_read_abilities,
-		.config_init	= gpy21x_config_init,
+		.config_init	= mxl86211c_config_init,
 		.probe		= mxl86211c_probe,
 		.inband_caps	= gpy_inband_caps,
 		.config_inband	= gpy_config_inband,
-- 
2.56.0

