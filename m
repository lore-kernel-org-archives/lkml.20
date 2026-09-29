Received: from mail-dy2-f15.google.com (mail-dy2-f15.google.com [74.125.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D4951E45E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699305; cv=none; b=DSL1fBbVo6VnnPj4Nrsc43x9cL9f7XGrYVMGRTtTmRuyBWG0ae8uGH0Q9gl/8OegEX96wVbEZfnXhp/UB2MxWUpeeq6ZrU92hzbWCQC0PxPZFnvaAnUioX+b5H4UFK78F+DqvTX2CJsQwwuuCFtVOZD0GgfnLPzGYvhg71gz3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699305; c=relaxed/simple;
	bh=Jq2r1sgopAvM35am7tUBN0KJRVKbVZQQvJ8GCCw7fjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+44jdJKjvhIEGKrIh+ypBS85M24skBTeaZE5LpntBbT0gBeeVj74on79g0rseX64Sd1suoBir12BTHI4QS725ziJuHCEThBs0U1Fzz1RVeEPwhV2MqABYXLAXPBouJCctxF5X63Bggm60D0MvNuE6vm5lqZE45O4ah3+1xq2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=UDZxFcb1; arc=none smtp.client-ip=74.125.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="UDZxFcb1"
Received: by mail-dy2-f15.google.com with SMTP id 5a478bee46e88-34b223602d7so686649eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790699303; x=1791304103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIG5aezIvFLItLUQyFfjj+0bna6lrv+DBpzkqJ9qmNw=;
        b=UDZxFcb10sz6H1SXb3zZdETplLEq5M5Zu7pyzN+PAil01BwDGWHTX8davG232sGI4l
         X1Y0ABqi1QfWoXTM34kAAcybemdyqpMG9j/yfoPIAG7jRPfxhZ520iIE2m0x0OppbvFn
         i8hBgs5v/9NRxnnyBBNtxBiUsitVgXvwjN8f4klA3JsD+4P0Hea7wJVV6npcnXkCaYlP
         ymOFUlpGs7ojFoHAJkh1Vq067IUUJ87K8negZD8TFg9IcPJsXbE73yKtIBXEnXJPJIm4
         vIdM80Dsf39r8QcURKfdVTAoOLDYB+N6BYSaW6bRvWqMDE7CsT1DjPDL3cMCPy06BLZm
         HbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699303; x=1791304103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIG5aezIvFLItLUQyFfjj+0bna6lrv+DBpzkqJ9qmNw=;
        b=hfQGJmRt1cERAYJiffnEioF58tnWMdNXwHYUnXq8aSMdGxaMgFF9pCi3ktSaTKksMw
         BW5wQq7ZxSG++UYT1+dOFQxlwmwYJctfyag/dMgVxM1puMoPDmeLaIzhOjRS5VO7njXZ
         rm9MaBnZrUzq0Xn4Haj4JoU0cyO3ZCEZnqZe6DT0RvI+7X8oao/S7b3J+gLL94vibkRP
         ffGk7LlpqcfgSIMiY6XIrIG6LNT80rMsZWEVrbjBJfH1Ydghha03YVtUCYRWoKL8OkuN
         O8b69a0sSb0ohVc3M3d5Tq3gdrJuB4J/m2z2iwF7b0ZIkCPbbun/FgiYZ306rv1h6nAk
         g7wA==
X-Forwarded-Encrypted: i=1; AKwUvBweiZQNm1R0LdC6tfw0qzYVAbBaND5MWzPb8pVZx/t+lhIQKn+zLeYkl1QEfp7yjokwYKvwpm3RSh5obbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEHvHO72pCrC/sDtnzCgFHGi4z/thnk7UcUZDPk/bu1djJhbza
	zzQPsMgH7xwOmOaCJLxdJC+Wzz8ykemoy8g6fbdT6nuYAWOEDsfzabb1+IqyfC1RrLU=
X-Gm-Gg: AYBFou0iUhzAlp0Jg1TrfJKXCkcv9UzjO15/WLXCbHiXeI84VXQpJDPlnWQsI/0woEm
	BhYLrsERvA4BKZWI/KdUpB6fcBCH6RiIts5ZWr+aJRlA2syf+cTBU1izZRZfmhuCsxcqLvQFCn0
	dr9xqrDHgDquULfrbN9l+KNVop7OqG7XRSsCmD5UZ8hbwBM7t/c2nYRv/vYzbn22IYgu2maosuA
	wZNOZUgmNga0jP0dt9hrOKS7d3Q8+rczD06YPox1pWtffYsTSAz4M40uv9wYHMd3ExhKBW4Sfoc
	AbGXGckEV3uzTIRsP1T1U3coToOSenGTyv3f/T6VQb9k9G2q62FBnX79jcH8Fr1YUDvAVTov/x/
	ZCn8JvPhwHuC2tKdNwLlmSc6GTmul2+q0+ppuI1NQaxDAe9PFOjO8h73ao9sAr3lsS8ekgZO5Dt
	0SbwjHpVvAtdPgtJAZDICWaQn3mI+G0wXGQAOsuX5q/+Pr08gnD6oHWIq3YwrFn8yYaYzyMy/pQ
	A==
X-Received: by 2002:a05:7301:dd97:b0:34c:1e2c:3499 with SMTP id 5a478bee46e88-34c1e2c34a9mr560429eec.28.1790699302512;
        Tue, 29 Sep 2026 09:28:22 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c378c9a7fsm425590eec.10.2026.09.29.09.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:28:22 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 29 Sep 2026 09:28:17 -0700
Subject: [PATCH 2/2] misc: eeprom_93xx46: add Microchip 93LC86C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-eeprom-93xx46-93lc86c-v1-2-272791aac875@nexthop.ai>
References: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
In-Reply-To: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699298; l=2511;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Jq2r1sgopAvM35am7tUBN0KJRVKbVZQQvJ8GCCw7fjQ=;
 b=7fPpQaVsFczkgPOwj57Q4FirI7J0Qsl/mjZLq7G/m9KcY9O2EWHCK5jgVBXtJthb082MOucjZ
 0rj8WmbTQdSC2wIEMD5awKlH5fjnp+09KkdAhmDc87LhKSRifc5nB/S
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family: 2048 bytes, so a
10 bit word address in x16 and 11 bits in x8. Like the 93LC46B it
clocks an extra cycle out after the address during a read, so it
takes the same quirk.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/misc/eeprom/eeprom_93xx46.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index f9c3ab52c2f9..77fe1fb641aa 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -29,6 +29,7 @@ struct eeprom_93xx46_platform_data {
 #define EE_SIZE1K	0x10		/* 1 kb of data, that is a 93xx46 */
 #define EE_SIZE2K	0x20		/* 2 kb of data, that is a 93xx56 */
 #define EE_SIZE4K	0x40		/* 4 kb of data, that is a 93xx66 */
+#define EE_SIZE16K	0x80		/* 16 kb of data, that is a 93xx86 */
 
 	unsigned int	quirks;
 /* Single word read transfers only; no sequential read. */
@@ -77,6 +78,11 @@ static const struct eeprom_93xx46_devtype_data microchip_93lc46b_data = {
 	.quirks = EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE,
 };
 
+static const struct eeprom_93xx46_devtype_data microchip_93lc86c_data = {
+	.flags = EE_SIZE16K,
+	.quirks = EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE,
+};
+
 struct eeprom_93xx46_dev {
 	struct spi_device *spi;
 	struct eeprom_93xx46_platform_data *pdata;
@@ -389,6 +395,7 @@ static const struct of_device_id eeprom_93xx46_of_table[] = {
 	{ .compatible = "atmel,at93c56", .data = &at93c56_data, },
 	{ .compatible = "atmel,at93c66", .data = &at93c66_data, },
 	{ .compatible = "microchip,93lc46b", .data = &microchip_93lc46b_data, },
+	{ .compatible = "microchip,93lc86c", .data = &microchip_93lc86c_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, eeprom_93xx46_of_table);
@@ -406,6 +413,8 @@ static const struct spi_device_id eeprom_93xx46_spi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&at93c66_data, },
 	{ .name = "93lc46b",
 	  .driver_data = (kernel_ulong_t)&microchip_93lc46b_data, },
+	{ .name = "93lc86c",
+	  .driver_data = (kernel_ulong_t)&microchip_93lc86c_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(spi, eeprom_93xx46_spi_ids);
@@ -482,6 +491,8 @@ static int eeprom_93xx46_probe(struct spi_device *spi)
 		edev->size = 256;
 	else if (pd->flags & EE_SIZE4K)
 		edev->size = 512;
+	else if (pd->flags & EE_SIZE16K)
+		edev->size = 2048;
 	else {
 		dev_err(&spi->dev, "unspecified size\n");
 		return -EINVAL;

-- 
2.54.0

