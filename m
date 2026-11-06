Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002438;
	b=P7xcd3xH/WgOZmvPQVSYcUJpRO1kwt06fUHiHBCf2+646Zgw+4plDdQDyii4gnG/yHXr
	 KsEftkEhdFUEFxEfo3bFS4yD1dNhqv18FU8loM+K0/PliUDDAfTD0byn/pCMjQshGpGbc
	 9j5+po5z22exoSanVB5EfdEIsuZUlxpSsToNQPLMMfwhnT6OoYDT+Q4ODk/mvw9Pk84kr
	 ix2+n5tJqJ46kpHMTXQwmj/DnvfE3gPCgwZnBFup9ywmcI4bbgl/baL2LJ0Y7796pG9FN
	 kiT7BUYGE5b9QAg1INODRySjwbsCHjodds4PrJkQq3zvnlN/EIoL17Trxm/I+dStefQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4zRIr24RMockOcBqoMHX9eYkDrHMvoR/ITcYq1Fk2Z8=;
	b=x/ldB00MJQx9Ob9lNNo9QJlKIUyjKvxylwmbwD4l9h+wg6yGipzm3SilnUJ4MhJWt8rq
	 KPm8IgaQn+2k6ZzocV4JLbgeGno0VagAGMTieOo5NDprOAzygSdyx8x6GjwERmMznXdo/
	 cjmQJyaHxfMjI/B24lND7b7m0oUqSsuXVRu+Te8mPXJYAAJPdlESwKeojpnVVng0Nw0Mo
	 xYE/AUcsesf5fUH9h4jtZeAKCgJFE8Dz5dlDv6eMFsylRwQ7nUosI6oQSZmSoFTpy9DwY
	 aKKOwvX6rcVcDlY7WhbemaQKUSX3MSkbUnfqHSViYqDUVVM1tST4cA6AfMVb/fGjekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MMuPfx93;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E7606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473E7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MMuPfx93
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b28d7c729fso768620b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794002437; x=1794607237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zRIr24RMockOcBqoMHX9eYkDrHMvoR/ITcYq1Fk2Z8=;
        b=MMuPfx93FwNTDasyWxY2ab2EUWi9tQwbpCCbtJXUsw9QamHkjYEo0FdhjSIAwfRDlf
         Aikkt/+1WewCZ8GMLccIGlRypPRQwTy2n2TP9ZpvVDaxmq3sXTgvVjw9N/yuGmK0aEas
         iqgvROfo+AYtgFYAME0n0V4PlSHR/hOaCZrYVQ8ypxR/icoAULBbmTWBHxXcit3Lo/bD
         W4jgJXXeagQtltxC/KbEwW/kp9QiXda4K6curJDy9+AIS3Zrf3gBgfINTff0JVvjqJmX
         glwj4dXyl5zZYcf0rGNgirfF+H7XkdbeEBK8ZLSQDbDfnGTzolydfmP+2026ZFcGr8RZ
         Pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002437; x=1794607237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zRIr24RMockOcBqoMHX9eYkDrHMvoR/ITcYq1Fk2Z8=;
        b=HZWk3LUEKRSo16vl49/0Q7FRXnqCuPQGAu2uzGuywn8/b8RzHygY6SUTkLoqKSOqyR
         Hi6v+YPR0fjVzh16EpFLIUnwvOSmgdLeU8XOMzv4ZDNPzeME8K27d8gKGmx3e70hmkQB
         7z/8LvBU/QD3PxafdKZ87VHoZFRRkBm+LyAVUZ3Hxpc6I19qKdmDFP2Cn2nc4+HAYb2G
         WYCfu0M+S7R2LC+4NqyMesu/ZuPnSyjZGk1v9lKeqgVwuvJBwMF+y/8cjeQZtZ/3yUod
         LcPX9/Ghtrd0BuDjCTtVsC6Svs4SoSfiBY8sPzOR6h9Yu2kWI2CkbXasM2JbDyQ4uUan
         /IkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0KRnjs4vhkunJhVJaAdBvhUc0+sU9nR3XXb8gcJmkVoSt2jajpJbMX3wz0lLI2Lpsu9FF57+0z4Xw+Rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I82YPvAIHewh1Bp5Liadmi4VUu1bgNEGzLrbrZXXVOWKku/iF
	sceuobGTe+/Cogup49uz2TIy1FWoxUvhex3V546OD2MPdRHgOoSIM2Ozb2gQ3xF1Loc=
X-Gm-Gg: AYBFou1D4GhdA0Hyebshfr6TNi0tkHbRrMi5Hu+WbueFLRgBxKaEENpKfVUoM7Qlz3N
	q7K++dMwCVPLuCcq9+3ixeUPYdt56Xw3NB14D3fEGZklE3pV9gzcrWcc4h21D/7qAFR0adtwzjn
	3HL107cQiab2ozRcf4VhGNsCUG6s7V6RWtK5mNZqZP/Qea47fqf/5geP3EGyy9r+SZZ7dUQwhPe
	eENF8IS62K0N5YsV7pr4We3ZI/2v9WhFhj5frg6iUmSPBiZRFdxyculN601LpQcdFCPcSEqhKry
	hcRKFYuC40pl4oR6pFr/cQVKOf3ZI7yUUtl8vd1giLW6xpqJDGr/gQcW3pazacR7KA0B1oYBK1x
	r1SVjxik71g0lty3SZghpQY8frjErXOe/xfsssaEWDckq3wMoHP6QIXYM068+b8utFnkF4oQZ/p
	YBa5hVV0AYz6OkT02dbKe5s5XDAnobUtERV2DERHYQGyLNv9DAu2i0kQeYS2KopGRcvvWwC7NIK
	WBupk87Gt8ZUVQ01Jwwip8/aHnj1A4s/Eab4mGOtLrFug2ijYkPYO65mXN03QZQXAyg9r7CVB5b
	3VKnSi9CEQ9OdE+MpZznhgU/0DO0YyzQHA==
X-Received: by 2002:a05:6808:1a21:b0:4b9:e65b:8c2c with SMTP id 5614622812f47-567e152dcb1mr2603511b6e.26.1794002437217;
        Fri, 06 Nov 2026 14:00:37 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:ce15:58eb:7458:e922])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7f010e4sm2432116b6e.14.2026.11.06.14.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:00:35 -0800 (PST)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 06 Nov 2026 16:00:06 -0600
Subject: [PATCH v3 1/2] iio: adc: ti-ads112c14: parameterize GPIO register
 field macros
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
Message-Id: <20261106-iio-adc-ti-ads112c14-gpio-v3-1-7578ae66ee19@baylibre.com>
References: <20261106-iio-adc-ti-ads112c14-gpio-v3-0-7578ae66ee19@baylibre.com>
In-Reply-To: <20261106-iio-adc-ti-ads112c14-gpio-v3-0-7578ae66ee19@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>, 
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>, 
 "David Lechner (TI)" <dlechner@baylibre.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=bAtnUumcuaTuT0OrX4ijsU3VvDIn8fzI9Lr9fbQwzDc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBq7k3yqxofoIHMI56e0DWccHyiSyXkKlv2HKcGB
 mh6xdiWneGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCau5N8gAKCRDCzCAB/wGP
 wOyOB/0caa18spBg4OxHINaKhalUp26+rrkIfjHSluwbgPUi9QlCrvpRwtp9475qAM/P6gDRamo
 FasNOWZfdvRHsaBtoaOfS55fsqvCYAr/w9SSV7dUsfYnNfHqe5bO6Lsa5hitxbe/cVCSj2kEvyz
 sLaiE11NPr0yvfM04Jynl8FUf5se0bViS8ryPjaUpZja1X6RNIvlgeT4yCKTXxfy2EbYmZkKEa7
 EtYtNzDWKKAkw0AFxXMtuAdS0NqLGWv16uF4YSXnSc0+DZGgnYMs1osX0xNl+DfFoCpub5AKUCP
 950pTZxPlCor3sRig4FQKVpkEJchg/Yj45D1NzjgCH1rLhvd
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Replace the per-pin GPIO register field macros with parameterized ones.
This will be used in a later patch to access the fields by GPIO offset.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iio/adc/ti-ads112c14.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index c0374bd8d001..498893bd01bc 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -63,10 +63,7 @@
 
 #define ADS112C14_REG_STATUS_LSB			0x03
 #define   ADS112C14_STATUS_LSB_CONV_COUNT		GENMASK(7, 4)
-#define   ADS112C14_STATUS_LSB_GPIO3_DAT_IN		BIT(3)
-#define   ADS112C14_STATUS_LSB_GPIO2_DAT_IN		BIT(2)
-#define   ADS112C14_STATUS_LSB_GPIO1_DAT_IN		BIT(1)
-#define   ADS112C14_STATUS_LSB_GPIO0_DAT_IN		BIT(0)
+#define   ADS112C14_STATUS_LSB_GPIO_DAT_IN(n)		BIT(n)
 
 #define ADS112C14_REG_CONVERSION_CTRL			0x04
 #define   ADS112C14_CONVERSION_CTRL_RESET		GENMASK(7, 2)
@@ -133,10 +130,7 @@
 #define   ADS112C14_DIGITAL_CFG_CODING			BIT(1)
 
 #define ADS112C14_REG_GPIO_CFG				0x0B
-#define   ADS112C14_GPIO_CFG_GPIO3_CFG			GENMASK(7, 6)
-#define   ADS112C14_GPIO_CFG_GPIO2_CFG			GENMASK(5, 4)
-#define   ADS112C14_GPIO_CFG_GPIO1_CFG			GENMASK(3, 2)
-#define   ADS112C14_GPIO_CFG_GPIO0_CFG			GENMASK(1, 0)
+#define   ADS112C14_GPIO_CFG_GPIO_CFG(n)		(GENMASK(1, 0) << (2 * (n)))
 #define     ADS112C14_GPIO_CFG_GPIO_CFG_DISABLED	  0
 #define     ADS112C14_GPIO_CFG_GPIO_CFG_INPUT		  1
 #define     ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL  2
@@ -147,10 +141,7 @@
 #define     ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC_DAT_OUT  0
 #define     ADS112C14_GPIO_DATA_OUTPUT_GPIO3_SRC_DRDY	  1
 #define   ADS112C14_GPIO_DATA_OUTPUT_GPIO2_SRC		BIT(6)
-#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO3_DAT_OUT	BIT(3)
-#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO2_DAT_OUT	BIT(2)
-#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO1_DAT_OUT	BIT(1)
-#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO0_DAT_OUT	BIT(0)
+#define   ADS112C14_GPIO_DATA_OUTPUT_GPIO_DAT_OUT(n)	BIT(n)
 
 #define ADS112C14_REG_IDAC_MAG_CFG			0x0D
 #define   ADS112C14_IDAC_MAG_CFG_I2MAG			GENMASK(7, 4)
@@ -2514,8 +2505,8 @@ static int ads112c14_probe(struct i2c_client *client)
 		 * order to support open drain option here.
 		 */
 		ret = regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
-					 ADS112C14_GPIO_CFG_GPIO3_CFG,
-					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO3_CFG,
+					 ADS112C14_GPIO_CFG_GPIO_CFG(3),
+					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO_CFG(3),
 						    ADS112C14_GPIO_CFG_GPIO_CFG_OUTPUT_PUSH_PULL));
 		if (ret)
 			return ret;
@@ -2550,8 +2541,8 @@ static int ads112c14_probe(struct i2c_client *client)
 
 	if (clk) {
 		ret = regmap_update_bits(data->regmap, ADS112C14_REG_GPIO_CFG,
-					 ADS112C14_GPIO_CFG_GPIO3_CFG,
-					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO3_CFG,
+					 ADS112C14_GPIO_CFG_GPIO_CFG(3),
+					 FIELD_PREP(ADS112C14_GPIO_CFG_GPIO_CFG(3),
 						    ADS112C14_GPIO_CFG_GPIO_CFG_INPUT));
 		if (ret)
 			return ret;

-- 
2.53.0

