Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904603;
	b=Ed7k2/ISKooFoFKhoPSu4a/plhsBbLdJkt9sct2UPlaL9FLgtbdrgEhwbLZPJgIb1ssy
	 eDpadXiWL2GSDreMPd5v5YjNs64EYlZD8NSPHaVPin+5zk+XwxPJ6Fz4r8pRViWCbLUFg
	 jm+4yeB5UQ8l3YDPxA2yAsitcAsVPXk1z18UgcwcNpFeziur3J3abjsIqhbm0VWTd0APS
	 MDqGmPbhB7EXRMn6lbmWRhGo77hMcEGdnaQiylx2h47Z5axAAe4uaA0jth2La83vqgEgG
	 jFqlggAy5d2A8CcvBi2tukTee58suWLrbUwK7YCqV26ZruJww+dO94nvq7oLJPGUg8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
	b=FzA3dH7KeihZ1a5nRmea9TnwPeMklBCUAAlQVF/6cE4GCrjl71rXZeuJrH9/+5qG4/4h
	 DfUCjTCe/p2iJVvT0eN3rNNFW3HqjtnPRy8pGb4GkknOeUdlQ+e2+3nF2hKqLFOC/CgwF
	 v4wKDL7FL9l6+bEyold+OXJWPb69t1WHUfb3TYvS6N0074sHKJiE2LYgG7KZvXW3UZrsn
	 mQgf+24pnNrUSCKZskvU2qtQSO695q+RwqTaaApB5qRHLbTImEyj2Wk8KRBaGFNYjI11n
	 4y9CfXq6K+rea7WtebEToClmHPQYDzodU/fkc+gO0Hyp39J8FXBbjv93SxyLpFPlx/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tJzUA6VS;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C3D606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C3D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tJzUA6VS
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550c917fd3so3088258eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904602; x=1793509402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
        b=tJzUA6VSmSq07QqY86FTLNROXqjdilQpTq4znKxJr3PJlG+VDo7WfaAW1uWZ2RLEAN
         DWi2MjTy7FyD2jTPKuPrMv66Yew5s48tZdpQjAecLvs4V80Q3hwHmFzOqFMoFVHtC/1+
         joMJ+VnaPLH+RAgHCZDqncWsQCa2u15DmVUMJj9cNP3wUpN/Nf4RBpyPeBXntSGz8R2O
         s/yoO+Ru8qDFsFEmd6zyL7pEWDKsSJSC3wt9kYjC27au3XHoBAtC+OePjzQa6Ui1cePy
         7yo+MUBVQl6iCFoif6M42jaJzNd6g5c9GoP3e9HGlS+fk5/PkEN8cDLPv56HBBFVDl5u
         veAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904602; x=1793509402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spE8ASswp9McnO32z6MEazcYBuSIjUY04KDtPzWURoE=;
        b=zfHarKHQx6owKNVLCjIyIwzPWYdDKvSLFRb3IAgNlQ7CtMufHv92WP4cydc437AmKM
         CuzSkNH/8Js9al/lOh8C8bhNeVVqVrp2tjPBB4HKnbPn6v/2xKk5F1H5Lh/lzRhY4LwI
         Eus3Ngzdf2wjWr1FslDIZwUed54lvTGJ8rlyUG2XyBiOk0D0NTpPpktD9hhY2+4xerRo
         YXZTKVIPZLfhtSZA7xB8/oiz+mbrwe+6kOQxN8J2pzo4LZ6TdLrwIBjbsA9BKbPZ38VO
         rUMtbUcAB4RN2yfdJtllrXdmnxJvlg9Cz6aYqhguxnh2R1WWGsKpmYr9ux182KX/CdMu
         cRMg==
X-Forwarded-Encrypted: i=1; AKwUvBzM9c8Es7hEBL2c1QJEcq6MIgp10u2/pwbYWR3wM0FzlKYYhA7yZnLoV1sZJednH/hnrkyLMLUPy/mECv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYISLHXeOIL+s597FRG0z1Rxn14Jsl3/wJkwXC38qe2z/aTWkn1J
	+e71jKYba2yOPoAD4XaFUOlOuIyEjqov/bhq2Eyj861V7kGK0aC4RNNScQEYjw==
X-Gm-Gg: AYBFou07nXc1NuVd+JrGUylbW9l+oFYhmYSV6If9e9Y58aN0x6h9/p+xOwJBGQZGlDw
	TAqOslHElPGoMT5j+eSjjJDCMwApoxJya5/9c1V1bvGpku+ROri2ywUlAK7U1Y4wnB5ZRNzeeIa
	bf5XlBK2kFYJNKnP97YpY3bUVRh1WTv05j77JmUZC+hT4v8zsyWfbInhQHOZgbGpC/s23sNLxUU
	Oj+C6Lv+R1xFNxWnC4jiav5TFWg22PFmwx2VKSW5xCC+WW9PRhnpS+k/6f2IQ7N3z1k16WVTDoO
	bIELL2xBpH03yxfQyZ+mlQP5LJ3+5lsU1xnEoltabfSChmGgM4z2WLpLMNRBkrGaJf4YZC8CXsr
	qI1yJGbv3sdKRkdc05RAeOSXq4Q1zauiK37ItAV158aC1PLoWAZDYmS+4cP2X4ZXDTAAJ0/IvbL
	Aaav5azSoco589S0gl3PzQ8Bm5sRnrhBvw8j5yMX3X4AEj0nbIgxAUi5OfyY1BLXrhrcFyKJ+N6
	OTWJuQxHaczt2o/uDtLXXLJTLNmFYk+vqp0ug3rVBQIdirh1SQmFrYrlSDOhHZsa+V5X9u7ZWPI
	jbcSxl/euLUoq50gsAHUsROyP1wxAlObmqEsf4XD1oiPAAMpNafao/cELeynVmbs
X-Received: by 2002:a05:7300:88:b0:367:3d68:8480 with SMTP id 5a478bee46e88-369e81ca340mr5718435eec.0.1792904601938;
        Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:13 -0700
Subject: [PATCH v4 2/4] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert the PMIC DVS GPIO configuration from a legacy lookup table to
software properties. We use the new 'dcdc_swnodes' field in 'struct
wm831x_pdata' to pass the software node to the regulator driver.
We keep the DVS configuration parameters (control source, startup
state) in the platform data.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 2264beef6dda..d0ec7697f366 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -456,6 +456,17 @@ static struct pca953x_platform_data crag6410_pca_data = {
 	.irq_base	= -1,
 };
 
+static const struct property_entry crag_dcdc1_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios",
+			    SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag_dcdc1_swnode = {
+	.name = "wm831x-buckv-dcdc1",
+	.properties = crag_dcdc1_properties,
+};
+
 /* VDDARM is controlled by DVS1 connected to GPK(0) */
 static struct wm831x_buckv_pdata vddarm_pdata = {
 	.dvs_control_src = 1,
@@ -633,6 +644,9 @@ static struct wm831x_pdata crag_pmic_pdata = {
 		&vddint,  /* DCDC2 */
 		&vddmem,  /* DCDC3 */
 	},
+	.dcdc_swnodes = {
+		&crag_dcdc1_swnode,
+	},
 
 	.ldo = {
 		&vddsys,   /* LDO1 */
@@ -656,24 +670,6 @@ static struct wm831x_pdata crag_pmic_pdata = {
 	.touch = &touch_pdata,
 };
 
-/*
- * VDDARM is eventually ending up as a regulator hanging on the MFD cell device
- * "wm831x-buckv.1" spawn from drivers/mfd/wm831x-core.c.
- *
- * From the note on the platform data we can see that this is clearly DVS1
- * and assigned as dcdc1 resource to the MFD core which sets .id of the cell
- * spawning the DVS1 platform device to 1, then the cell platform device
- * name is calculated from 10*instance + id resulting in the device name
- * "wm831x-buckv.11"
- */
-static struct gpiod_lookup_table crag_pmic_gpiod_table = {
-	.dev_id = "wm831x-buckv.11",
-	.table = {
-		GPIO_LOOKUP("GPIOK", 0, "dvs", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
 static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("24c08", 0x50), },
 	{ I2C_BOARD_INFO("tca6408", 0x20),
@@ -931,7 +927,7 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
+	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));

-- 
2.56.0.257.gf7497c7d27-goog

