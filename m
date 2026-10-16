Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614F47F2C6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149655; cv=none; b=ltt2LcDYFZS3yJWAT8CVcuAUItYBZ/9FpR8lixwBREiBv20LJ6l9TdkAyIRa/Yc8+M0SDA0pEa9TBm598dV4wbA0qA+8Rs/UtoZ+5+Gsv8hexCiNN5ZINA13/4mcrhGPxDXD3oqxxQXL460wnjwfOec4KEE7zop2SQCdu8Xblo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149655; c=relaxed/simple;
	bh=NSjps/+qrZ2pxo/mOyPI/slP/UQ7vd/FSOG9Do4T2aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mm6sNA/+26zF9wlmOXt0mgDWBnr9lJ6Hl6dddy1VxWJpK4LOtMrsinZOKcorfBGGVUP0JVGJOPWwSNTrG5S3qH6Mxj8anwDTVwVFMEF385zbAmIOZYqm+GFoTAGUt+vHyZRg4F7QycxRrsTChMERwMzaiAFV5VJWmhUm4cCBW4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=I6mrVv97; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="I6mrVv97"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so7719611a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792149650; x=1792754450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cdNkb22thSf49fSjLJsH03nlYp9anRuLr9xPLztstQ=;
        b=I6mrVv97wIFdMEOngcPlPEqW/crO/4iThaWsz/ZfKqlUrywVda22JI9ddgpLcZ4gYc
         sIP5ZZayq0tPqyloVAYWmlsG2TzCEGA18JRfpFQcNSZ4Y0ZwXKAw+9qTseGJ+CPH+bbF
         qTNOiP4RkNxUJ+3Ih1Jxz823+qYRkCTyXtzW+ziELTz+MPJw4Dg9pB4Sk16OmldLL+1e
         mCC8C7HGSKD/dFZIYbbFWMr0PspfOzivsgeV0bUzkDC5NggV7ifA9PDduP6Jq5ixnMdL
         y8CtC3W/NRtavyjLf8hs58Icp/7/KJ9meRW2VpQPnIm6hq3rGSxbL2Lme+q37VKrUaBq
         J/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149650; x=1792754450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cdNkb22thSf49fSjLJsH03nlYp9anRuLr9xPLztstQ=;
        b=x6aZrTsKVbupmGTIesup03lIg78cT3AzhdQ0ny4y0H6OIEFtZmQDWWbJ7MDgD2RPOk
         YPrqktHPvz2hGARdzrBaRp6EIZ0IgOmHaCTsM31Fd2xMCNyoSc3HTshJdlWWLZH97p5X
         SBUlAu16dKSFhuz+DZL88CgewxR/tAAAv/dxskNIun6ILdSlLhga075fLhUk1UfnnzmN
         mBGr9KW9k7+jWdiTsr3sJm6wgxEEJRhMI3VfMnF6gn4/ql7c73UXNuQlHUX4WFgRMna6
         RvI21SbjvXbeHiPa/35N6SyUGAfy7lCQukdGtBjx5wPC60UUkBA45tjLf75Ti/QzwIfa
         YZXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwB5XptA5rMPfDT8gCpepcy0Kjqb5WuqMlHn+9+VpG13ExDSeAY2lSwnmSebghBv/f53qT2aO0RKoTg5w4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYiAt39hzeDI/J69hFjAhCMVBtnVXQzTGAtARQUTNHzsrjdag7
	eXNpAJD8Xa1XFEF4/KPpJTnZFhGlE6OCAC0osWBxtgDlpoOL3WBwFRBFz7A9L+eHLm0=
X-Gm-Gg: AYBFou3ALgSjAJ3FgKVcXCwgZHyydfKbC/HxxwT1yBammDYt+T2Ugz7ppi6kYCz0h+v
	zJDcgcLWtKIwxtykTkobnAyDyNKZVrQjD2TgqgC67Cm4La8JOzZLch/lEo+askwbixzbsghqP8E
	8WgCw/n6VzZVqZ0msVYqsmuHQrJBvv22pXNUKV/1VxElejfg2prX/6SL6NSpPL3JXDnfsr8VKpG
	uC0ENYH6LX+/a7tMSHJiiKB/B4Y7gVFqh3Li3DAlMDXbiLJU34dXWqnoFlADsCPPGi4Zz5U8F+u
	qNCRNUh2l5OIe5xSy7tJSM1mX1AVTRv4wd5aKLYakfRfrcOe1ptYOnR1OXT7yZ32OMCamC2WWh/
	p+IsFF9c5G7eYNWfoF9j8KwNJZ5ygKOkkbQiEEu9ldRvOQpCGksfUEgS7CwUCkqxyoGFOL7n5G9
	VsGWJvD0ZrWFnrD2a42x09Ub7IZpDdVn3+jFgHtFhd1vZYQJSJXxruhDQJ3Pgp39yhW+OHyU1nl
	VQHXIHnOQxNJzZ3j52UJjidPFWYH+rQXiBkN+vV3eECS/1d2K0YClUy07vFTyqy2MR2vI7V6lWO
	A6Fql60w9G29k6Xc+TcjM5Qn8dHv
X-Received: by 2002:a17:907:3fa9:b0:c26:1649:47af with SMTP id a640c23a62f3a-c31a9fb6451mr2004138466b.37.1792149649982;
        Fri, 16 Oct 2026 04:20:49 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-194.xnet.hr. [88.207.15.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm63947666b.11.2026.10.16.04.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:20:49 -0700 (PDT)
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
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2 5/5] net: phy: mxl-gpy: support MxL86211C lane mapping
Date: Fri, 16 Oct 2026 13:19:36 +0200
Message-ID: <20261016112033.949026-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016112033.949026-1-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure the MxL86211C mapping from physical TPI lanes to analog
front ends (ASPs) when specified in DTS.

Leave the hardware reset mapping untouched when the optional property
is absent.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Preserve unrelated register bits when updating the lane map.

 drivers/net/phy/mxl-gpy.c | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 8bc119655f104..acd5ad01a285d 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -116,6 +116,13 @@
 #define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
 #define VSPEC1_PM_CTRL_SI	BIT(12)		/* Super Isolate */
 
+/* TPI lane to ASP map */
+#define VSPEC1_LANE_ASP_MAP	0x14
+#define VSPEC1_LANE_ASP_MAP_A	GENMASK(1, 0)
+#define VSPEC1_LANE_ASP_MAP_B	GENMASK(3, 2)
+#define VSPEC1_LANE_ASP_MAP_C	GENMASK(5, 4)
+#define VSPEC1_LANE_ASP_MAP_D	GENMASK(7, 6)
+
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
 #define VSPEC1_TEMP_STA_DATA	GENMASK(9, 0)
@@ -423,6 +430,42 @@ static int mxl86211c_configure_mdio_voltage(struct phy_device *phydev,
 			      VSPEC1_PM_CTRL_MDIO_VOL, val);
 }
 
+static int mxl86211c_configure_lane_asp_map(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	u32 lane_asp_map[4];
+	u16 val;
+	unsigned int seen = 0;
+	int i, ret;
+
+	if (!device_property_present(dev, "maxlinear,lane-asp-map"))
+		return 0;
+
+	ret = device_property_read_u32_array(dev, "maxlinear,lane-asp-map",
+					     lane_asp_map,
+					     ARRAY_SIZE(lane_asp_map));
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(lane_asp_map); i++) {
+		if (lane_asp_map[i] > 3 || seen & BIT(lane_asp_map[i]))
+			return -EINVAL;
+
+		seen |= BIT(lane_asp_map[i]);
+	}
+
+	val = FIELD_PREP(VSPEC1_LANE_ASP_MAP_A, lane_asp_map[0]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_B, lane_asp_map[1]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_C, lane_asp_map[2]) |
+	      FIELD_PREP(VSPEC1_LANE_ASP_MAP_D, lane_asp_map[3]);
+
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_LANE_ASP_MAP,
+			      VSPEC1_LANE_ASP_MAP_A |
+			      VSPEC1_LANE_ASP_MAP_B |
+			      VSPEC1_LANE_ASP_MAP_C |
+			      VSPEC1_LANE_ASP_MAP_D, val);
+}
+
 static int mxl86211c_config_init(struct phy_device *phydev)
 {
 	struct gpy_priv *priv = phydev->priv;
@@ -432,6 +475,10 @@ static int mxl86211c_config_init(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
+	ret = mxl86211c_configure_lane_asp_map(phydev);
+	if (ret)
+		return ret;
+
 	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
 			     VSPEC1_PM_CTRL_SI, 0);
 	if (ret)
-- 
2.56.0

