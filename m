Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489033;
	b=RfKAtibwoWEkeDPk8MCPvEw3FjYfiU4l10hDNQPKlSS4j71BmVtRXOH+4uKX6tcwkfOU
	 EPz9cN4Kyr553PbXXSfQj95vk6Xr3eFc4v5QcodkrfhGN4xc8Pu7qlVnr5jwz3B1qeFiQ
	 oBTdoR7rw0HEkczzcqMJLyUBg9l5P+lHQRNyk/xEH84VoiXdnkn2xxh/qb/VA+sbKyYIA
	 uT5PqDw9KXk24nIGzje6+kU3WYza36L1SqHGG14oxAX7305H6Ywf5aww61tSrVrevBtOo
	 7qlx1Lk+9EinGXj7lfCfHZZ0z27crxbSUGHuqSvwP5+KL07y3/S9BxXl6fjgyP75qhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N2Et6FhOSAKo3DWy4+Ueo5mIubBKDT9//pePGJ0VN7g=;
	b=v5rq+0oPCAiDas0Rh4v8fvOsBaTZVWtxrIJZ7xwd0T83478sZsO1N2+rn39Jaof7mW5U
	 8uD1g5O4FxGhhDDwrTsw6WRKWA8jRf41guWTOoXWa09ehUQHwkMsLj/BhH9Tjw1EMGIpf
	 OCG/ao2fkfIurNnzkm0RYaaEGPGkhRsfLuvC+3KD24mwihKyp09qz+r77QaHtlxWWGf28
	 HQxXubs8bIC2kQ0qhzTbspAacJeOHFmYf7tzWetqrIZKyLRR240Zb8Pe0uPfvadLags8u
	 6h5MfhHx0d/ishG5CNa9/1QtW/Q4pI/xrl2EfkYk+WVEkNMCkGmos2ABdDYPKZtm+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=TW+HT7R+;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23B60A380E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A23B60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=TW+HT7R+
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so229312866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792489032; x=1793093832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2Et6FhOSAKo3DWy4+Ueo5mIubBKDT9//pePGJ0VN7g=;
        b=TW+HT7R+qM7cFRyny5S8cDwqPmlT4Uy/idOozwPOQ2+ChYoRRRlkqnKvkC+3jJDtf0
         SpNuTxuDQRdJx3PSMTmdYVbYW8zisypHmjYUAtoUthNA84NcBfJUISbj/XUlwQswaQ1L
         TF768m67jp8robOaElgrMeX8XnxgW+c6sDB4+fVXGnDCW+GtjQpLS26tT5Oa2xhushng
         L8trduE8/3ajP5I5daEPkpXz7iwqbU/5MF+Gza8mUquT8S/lG2RIxWWUNxzCLh9+U5fc
         USj+fZB6LlgsHTJWHG5p+b+sJExP3gYMbCT0UwNGodc1pDXijic02nPPADgF1L8HU4hJ
         qrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489032; x=1793093832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2Et6FhOSAKo3DWy4+Ueo5mIubBKDT9//pePGJ0VN7g=;
        b=P3vbEn4vDBnMIhn5CXlwWzkc6OmxTeaZQ/PSWwm/mSf/R5gQbmQYBWbJzAYXBe1rld
         26sf+mZ5X/zV9Wkn8nFgdoalWAeo/iErf1NvOzap8TJUvIKVEH09N3163PFqD7JBwuOx
         Ky6LT1Ih8vIEak3/8cqlPpGNm0zUhJxp9yHb8UF2EDugPGKRhimHh97OSifdQBfDWacj
         aD7KnXM5ij3NurAmALgu6c8oilI4XLx6/X7BJsPlBWKquG7e5ULLfJdZD+CZxfsKTASB
         CRFtpRmZdrpFb6zgAtAe6/TZR7mJRByBHy7h7gJCzKzZ8MPj1chXKHXULYJfnZgNZe/0
         w6ow==
X-Forwarded-Encrypted: i=1; AKwUvBwLmXIFNnT8sKZeNx/vlXZ6R+oMohBnSeDrgP4ny+2FnF35FXlqjhjUrIGkd4h/fzdgRrx3iuE1/eJpiOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd1DfILP2fRCXBnf5ihgAdD8bWOxMLacQYS2vMehqWr3ESNXXY
	lzpiAJZSAhHpaTUNCcus6cOalQp3X5kwGiU0UYPNN6IpdEJyARloW86/o2voHAfvsLY=
X-Gm-Gg: AYBFou37bQ1BGiEo1r/7ObIB8DP/quYcuRSE4DMHsp4ChI6lxTkRRI6sbo6pCa8X+mJ
	ByfolUbCMpD/rMKQ691SOuD9sn8uLckkvPO1bFijmCd1/j4+a9/pHIfOvJFtyOtYLOIb58YoVO1
	tAIBZFjduAQ3lrH3g9Dgcz+CU+TfASyiGv2uUfzctRG4XWg19SY2fO8jq+zIaGJm9BY135lBoiS
	7szCX7Z8Z1Ofkend0YKqNXXINSN0cEXWXR+F8gKL1TeqHNIKCI5B6hc8JYg4RqW8xAy6WxV1s4P
	QL8EVMI70HLPK44A8fZZcE99T6ujcZUM8uib7w3Zj/ln9BVfdicTEPYEPuJrOP0G4r++JZJSNst
	h/q2LtE2+HseRrbhzGje0ytGYLb49f2qmmpBgkFGXpUU/avYcE0tiroB4caY/Dms2EEwzXykjn7
	ES3wAI+sALfhW4tWG9Cx69goqxHNb0tP0g7WeFqb7YZvyp0XWXaaq1QO40m10SZZjDHVGnf1yhX
	nbK2Dg9oQ0iDXbM27oAA4L+NLoFOFAOkxOD6P4HuR6YTvo7gWAQAi40cwpepk1B3BwZOpmXOA7g
	bgOdFYHKUU9m/ZfkJHfE0coqhiEL/IITbtP2slN+IqdzYA==
X-Received: by 2002:a17:907:94ca:b0:c45:c030:732a with SMTP id a640c23a62f3a-c45c0309ca1mr203260366b.35.1792489031683;
        Tue, 20 Oct 2026 02:37:11 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm462730966b.47.2026.10.20.02.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:37:11 -0700 (PDT)
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
	Robert Marko <robert.marko@sartura.hr>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v3 5/5] net: phy: mxl-gpy: support MxL86211C lane mapping
Date: Tue, 20 Oct 2026 11:35:38 +0200
Message-ID: <20261020093655.344585-5-robert.marko@sartura.hr>
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

Configure the MxL86211C mapping from physical TPI lanes to analog
front ends (ASPs) when specified in DTS.

Leave the hardware reset mapping untouched when the optional property
is absent.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v3:
- Reject an incorrectly sized lane map before reading its values.

Changes in v2:
- Preserve unrelated register bits when updating the lane map.

 drivers/net/phy/mxl-gpy.c | 53 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index dba0777158b2d..b71ed2bef3e5d 100644
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
@@ -434,6 +441,48 @@ static int mxl86211c_release_super_isolate(struct phy_device *phydev)
 			      VSPEC1_PM_CTRL_SI, 0);
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
+	ret = device_property_count_u32(dev, "maxlinear,lane-asp-map");
+	if (ret < 0)
+		return ret;
+	if (ret != ARRAY_SIZE(lane_asp_map))
+		return -EINVAL;
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
@@ -445,6 +494,10 @@ static int mxl86211c_config_init(struct phy_device *phydev)
 			return ret;
 	}
 
+	ret = mxl86211c_configure_lane_asp_map(phydev);
+	if (ret)
+		return ret;
+
 	ret = mxl86211c_release_super_isolate(phydev);
 	if (ret)
 		return ret;
-- 
2.56.0

