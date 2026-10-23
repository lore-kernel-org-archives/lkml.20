Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778370;
	b=OX8eNWAQyaNr4SQ08s4YtpCWV8pNTzk15/TAaglomFeeIqeecB6TqqVIDEkU4UX6uK7a
	 ZMzbY1FsAvGNxu3TzTtP9bOVyjenMnDD9G+7t7ayE/qyT0ij0vXauBzogtq8sxEDenced
	 S86QlVM6SA3tdkHxIzwIH6YT3vRC5zSl6yeoY52s2IQMtk7mzt2qACRxosTfWb7N03jam
	 PpYd9YYw7HrXDyz3UAXY6blNO5+qzuKTwl/QHixZ3Gt8/xRhF19NowfNYAyFKZVGMre5B
	 Pg+qWTbiP6Sq1PJ1eLHtd4Dny8+tUTIhfIDUYP+r5ciCTqOW0mF28zZhDBtTzEem8dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BBJheptbrK1Xj6AgFoLSOO83tzUQObgmpiZOvZNyRbc=;
	b=vvqmgnXQcKH5mbzfYMgx95iebsZEaT6jkp+0YuirvbIhuKYCH0oI1dvEed+60GBlE8ry
	 T8Ln+5xNvfPmoO2urE5yNFJaf3Gly6ZPfur7EorOzU/8i24HV2OpxaABu4cVsAzCrh7KY
	 uPgrOGhnocmUkUSku6SdAuytYLF2fme73RP7spPdJIySmClRkj6ye2W38e+DlHESi4rR9
	 esjLfPeW6PYEEAV4neGJ8nRvoGBMRh6pxhTYV22qQImkEVthWr3Mic+ayfujIjci/78h/
	 oq2fitm7VqJx29jsXXWcHcUNtAsbCHSOGwcb9TFwxIHX2GdF0cE9go9dz3z/CkXpltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S1wCsyAz;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00DF606A339
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00DF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S1wCsyAz
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so9491755e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778368; x=1793383168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBJheptbrK1Xj6AgFoLSOO83tzUQObgmpiZOvZNyRbc=;
        b=S1wCsyAzFbrPOz3szW9M3HoEJRLbY4JkJT960VF0lYEI9tX6BdSrl9uPcUclDOD0iY
         shgMpLvvAiVZT7NpFh1ihkfuNTOyBSZA6rzQPMXxVjpd/Pq0yTz4msy9jjmZUXo1WlI1
         yHSAlCtK0oAk98KFGVlmvEa65UAiip18GfRP0PSYYi810Bez5qZg3TsJaAq+eHMVUGiC
         bEBzQm1DuRrVEncdKHglsTgNg1Yk4UXUZlt10s0y2L++P0XhNjuAqmO3Jca4JAQwzabD
         paE/0lA1cl7UNVAmTqqCF+hN2Lq4KYkFVO/siNRPBQqTJMgUvY1Hj9THzYXBMbubZpN4
         sHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778368; x=1793383168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBJheptbrK1Xj6AgFoLSOO83tzUQObgmpiZOvZNyRbc=;
        b=aBLrMRrfKOfqFKycVhWVdbqBauk9XIYhzWH6V/45K6RP0c6zvV+EgNqZCZk4bmcQDS
         Xw/NAGWggHnGnARxg3ttsG+C9vHB2879gj38FXbM45+5QlVXU8tUr6/Zug1grmpydni4
         CtylIC6hunPn4ZpAphlxGvywJN+Vkzw36fQkwB9xGtpojltenIxGCCxJDsCAhDfmSx+i
         EylEPNxHl22ycNmiRxmD/qdBt+gluHC+/nUYEn5UWJowFmeGkXppAC9qrMVUsRcXnew4
         o+0J7T1q5o+yercxAr4uPdfMeZW1Jv+dMv2LURDMLQyh57+HZX0hWxQSkYZoHbLl0ddR
         7tOg==
X-Forwarded-Encrypted: i=1; AKwUvBzS/SIuTYSZWR37H6e6/j26fK5/n/ll7goUa3NSyolVgHN3U9RqL96OAWgefMLqOpuumvEVg/9VsGuYMmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiWLT1LxrnsDWyfQ4LeiLeKlCx4ythxFPuqtyw/7/iI5VrwV+G
	7U7mT+YXZz7MsRjcj+2uBLJ7GQmudj6oRIyYHcPncJ6vC7aF1XlE7Go2
X-Gm-Gg: AYBFou0f9V6iRfVva7JVGhdl1Op7MlVqT4L5ZYyvOXtoeTU0MTet5Bz0FLEcZc7Pdpj
	I25jkxLmrEgNtxJywKfva9sjLq1armUQzFVc3f2wa5stACDK7NiGch6vaqKiMFFHkA5prC91Oh8
	52fAyEhnGLZsEt36BiPzy/7gpEZx86JIL8ycOXF054zpXCjYQ79c/LevtTEQk1Ybl/FqaRHaDIn
	rS5aFDeYpenllMQASkFiBg/FoFYM/wz0x5iL31ZRmuXD8OoAhnObWRtkHJsi0/5GJLB8w76lR9h
	pEBcNbqruK0s8qWnRL0TBCYYBVHbn7CVmoMR3PdF9utAT4NRHwzcyOpRj0dPffOqu4hi+smx2Pg
	jkl0STCLCvKZbgJeHypHS1E1KarkbZ5sQCQLHqgroRy7SWFBO1vTJWHWQ+yW6tNip2C5ZNdKcDz
	DMtjsMoLWV7AoQuBUksXQacBBfkd2zChWXyqOLTeMwZdcAws2fw0s3Gz5OhPp57PlNOSbNNwsXo
	obVGZWV1tWvqoPDMbcYGJdA+6TWZy7ZIF2WQfUOKq0FT3RJNZMQNvkt/IHMlK8+xlpjp9Gs6d+N
	JqEhnBAvCbhlbXG35/D791qCStiSRl2+hhuPflZCZhYT+JlaPzIby/d4+g4KfSt1wq/gQ2YusGv
	B6chhSWzI6VBjm99Agt/VHQCjuna4mY6zW0M65S7NS7+O
X-Received: by 2002:a05:600c:1909:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a21398df21mr47236325e9.16.1792778368304;
        Fri, 23 Oct 2026 10:59:28 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/8] iio: adc: rzt2h: Add chip-specific configuration
Date: Fri, 23 Oct 2026 18:59:14 +0100
Message-ID: <20261023175919.160103-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for supporting SoCs with ADC IP that is similar to the
RZ/T2H ADC but may have different channel configurations.

Introduce chip-specific configuration for the channel template and number
of channels, and use it when setting up the IIO channels and DMA layout.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Returned -ENODATA in case device_get_match_data() returns NULL
---
 drivers/iio/adc/rzt2h_adc.c | 49 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 131904d97b8c..2ada8ecb2603 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -57,15 +57,21 @@
 #define RZT2H_ADC_DMA_PERIODS		64
 #define RZT2H_ADC_DMA_BUFFER_SAMPLES	(RZT2H_ADC_DMA_PERIODS * \
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
-#define RZT2H_ADC_DMA_BUFFER_SIZE	(RZT2H_ADC_DMA_BUFFER_SAMPLES * \
-					 RZT2H_ADC_MAX_CHANNELS * \
-					 RZT2H_ADC_CHANNEL_BYTES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
+
+struct rzt2h_adc_chip_info {
+	const struct iio_chan_spec *chan_template;
+	unsigned int num_channels;
+	u8 features;
+};
+
 struct rzt2h_adc_dma {
 	struct dma_chan *chan;
 	u16 *buf;
 	dma_addr_t addr;
+	size_t buf_size;
 
 	unsigned int period_index;
 	unsigned int period_bytes;
@@ -84,6 +90,7 @@ struct rzt2h_adc_dma {
 struct rzt2h_adc {
 	void __iomem *base;
 	struct device *dev;
+	const struct rzt2h_adc_chip_info *chip_info;
 
 	phys_addr_t phys_base;
 	struct rzt2h_adc_dma dma;
@@ -328,7 +335,8 @@ static void rzt2h_adc_dma_callback(void *data)
 static void rzt2h_adc_dma_calc_layout(struct iio_dev *indio_dev)
 {
 	struct rzt2h_adc *adc = iio_priv(indio_dev);
-	unsigned int hi = 0, lo = RZT2H_ADC_MAX_CHANNELS - 1;
+	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+	unsigned int hi = 0, lo = chip_info->num_channels - 1;
 	const struct iio_chan_spec *chan;
 	unsigned int sample_chans;
 	unsigned int first_chan;
@@ -349,7 +357,7 @@ static void rzt2h_adc_dma_calc_layout(struct iio_dev *indio_dev)
 	 * width, so pick the smallest power-of-two-aligned block of channels
 	 * that covers all enabled channels.
 	 */
-	for (sample_chans = 1; sample_chans < RZT2H_ADC_MAX_CHANNELS; sample_chans <<= 1) {
+	for (sample_chans = 1; sample_chans < chip_info->num_channels; sample_chans <<= 1) {
 		first_chan = round_down(lo, sample_chans);
 
 		if (first_chan + sample_chans > hi)
@@ -609,8 +617,8 @@ static int rzt2h_adc_parse_properties(struct rzt2h_adc *adc)
 	int ret;
 
 	ret = devm_iio_adc_device_alloc_chaninfo_se(adc->dev,
-						    &rzt2h_adc_chan_template,
-						    RZT2H_ADC_MAX_CHANNELS - 1,
+						    adc->chip_info->chan_template,
+						    adc->chip_info->num_channels - 1,
 						    &chan_array);
 	if (ret < 0)
 		return dev_err_probe(adc->dev, ret, "Failed to read channel info");
@@ -631,7 +639,7 @@ static void rzt2h_adc_free_dma_buf(void *p)
 {
 	struct rzt2h_adc *adc = p;
 
-	dma_free_noncoherent(adc->dev, RZT2H_ADC_DMA_BUFFER_SIZE,
+	dma_free_noncoherent(adc->dev, adc->dma.buf_size,
 			     adc->dma.buf, adc->dma.addr, DMA_FROM_DEVICE);
 }
 
@@ -651,13 +659,16 @@ static int rzt2h_adc_setup_dma(struct iio_dev *indio_dev)
 		return 0;
 	}
 
-	adc->dma.buf = dma_alloc_noncoherent(dev, RZT2H_ADC_DMA_BUFFER_SIZE,
+	adc->dma.buf_size = adc->chip_info->num_channels *
+			    RZT2H_ADC_DMA_BUFFER_SAMPLES *
+			    RZT2H_ADC_CHANNEL_BYTES;
+	adc->dma.buf = dma_alloc_noncoherent(dev, adc->dma.buf_size,
 					     &adc->dma.addr, DMA_FROM_DEVICE,
 					     GFP_KERNEL);
 	if (!adc->dma.buf)
 		return -ENOMEM;
 
-	dma_sync_single_for_device(dev, adc->dma.addr, RZT2H_ADC_DMA_BUFFER_SIZE,
+	dma_sync_single_for_device(dev, adc->dma.addr, adc->dma.buf_size,
 				   DMA_FROM_DEVICE);
 
 	ret = devm_add_action_or_reset(dev, rzt2h_adc_free_dma_buf, adc);
@@ -670,6 +681,7 @@ static int rzt2h_adc_setup_dma(struct iio_dev *indio_dev)
 
 static int rzt2h_adc_probe(struct platform_device *pdev)
 {
+	const struct rzt2h_adc_chip_info *chip_info;
 	struct device *dev = &pdev->dev;
 	struct iio_dev *indio_dev;
 	struct rzt2h_adc *adc;
@@ -677,11 +689,16 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	struct clk *adclk;
 	int ret;
 
+	chip_info = device_get_match_data(dev);
+	if (!chip_info)
+		return -ENODATA;
+
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	adc = iio_priv(indio_dev);
+	adc->chip_info = chip_info;
 	adc->dev = dev;
 	init_completion(&adc->completion);
 	init_waitqueue_head(&adc->dma.wq);
@@ -741,8 +758,14 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	return devm_iio_device_register(dev, indio_dev);
 }
 
+static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
+	.chan_template = &rzt2h_adc_chan_template,
+	.num_channels = 16,
+	.features = RZT2H_ADC_FEATURE_CALIBRATION,
+};
+
 static const struct of_device_id rzt2h_adc_match[] = {
-	{ .compatible = "renesas,r9a09g077-adc" },
+	{ .compatible = "renesas,r9a09g077-adc", .data = &rzt2h_adc_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
@@ -750,6 +773,10 @@ MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
 static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 {
 	struct rzt2h_adc *adc = dev_get_drvdata(dev);
+	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+
+	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
+		return 0;
 
 	/*
 	 * Datasheet Page 2810, Section 41.5.6:
-- 
2.55.0

