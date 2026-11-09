Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196395;
	b=P/zXGYqaVI6ESXwG5/alYMJ47sBhzOxSruzOtZvkJNlmgOrtZl+N0RJQb+H5aITQl3k1
	 zcn3VtpMyaBTxDHrlBnhu+D3RRJj7HUwr1kB/N59tKBqb4VSeUP2a2jwvSkLrgS5WYS0h
	 EgJyb1K6zDcKpok2YRP+W5nSGgIwXMquOiGg//2YyIdfTVigPrfpIx83MWzZbW/o6+Ete
	 CnW42ApGfXTbiaXUmI/XHaD8KVjytbgTa3ayCLem37QJTTTSSLutgDT8UiTKIJ0MSsFvU
	 OJNjKkHaPeKO2IT28U8OgAAge4nFwIe1huCZnyaC6L9xCRH/9MHSGmzmKo7LaU8Lq9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196395;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=P7U6eYOXzQk6WjNmpy/+3nVmJAdQE4etbQZ1/KFKhmo=;
	b=h4GudPg0F41uXxirVbrLNsI+jIQtk57FOwOJJiZ1TgdTjo8t+8dONgBpvWB8FnYi1fx9
	 LnkuHaOvJwSStDD2GKtbfCk/ZFZO0WFkiTJFArOHJ93R9G5OiaNfkSibbHgLC/g6DhlIl
	 BmeW2YnM5qQPYVAualkj07X4h/kv7hz9V7zR1cRhEqus8WMk0y9P9NZywx7ZsUs/18GND
	 PJs4QM2Ntm6F9+l2fI/UI/cRq8AuIwOCNxDd86ijypBLzoSG8QGnW3M+BlUHjKTAeJ+px
	 wVFhTGH1FrZ7nH5/FzbVSlWjO2N0+oaCuID/G0ppkPbN/RuGP5CDyWcRUB5/UBNi6NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jYLK1NRL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE055606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jYLK1NRL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BA11F008A1;
	Mon,  9 Nov 2026 03:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196394;
	bh=P7U6eYOXzQk6WjNmpy/+3nVmJAdQE4etbQZ1/KFKhmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jYLK1NRL2W1CIVoqJAfGj9HLxqM0UlzF+vwdrmOdwb2m02Gq+wGTRpDpWDTv3I10H
	 yxnUtpiSc5WdnFkYGP757kllfotDQGIVGeS6zKxBqamGJ3t8lT0x4wPOSxPX4akSPU
	 x4KdjZZTDFMEvRTFfen4jJ+9DtZOKr0wYSzppFH7efn9xGBSWT5kX6QJ4oPZI71Bn1
	 JXo2bA3ldT4joHZBQALbsCgY1jhQDuawrmP7B6SiryBf6YyydAPCVK/+f1dgx8BZlw
	 GbMRWA/W8T6Q22K+2uKsMhExX+BRzoaOolOJmn1Ix5/0KjnpMhLFPviao/PSn34T4R
	 KIBqcHg/VsDfA==
From: Jonathan Cameron <jic23@kernel.org>
To: iio@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Song Qiang <songqiang1304521@gmail.com>,
	Radu Sabau <radu.sabau@analog.com>,
	Maxwell Doose <maxwell@maxwelld.cc>,
	Tomasz Duszynski <tduszyns@gmail.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Waqar Hameed <waqar.hameed@axis.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH 06/14] iio: adc: at91-sama5d2: poll own trigger on data ready interrupt
Date: Mon,  9 Nov 2026 03:52:44 +0000
Message-ID: <20261109035252.1295926-7-jic23@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109035252.1295926-1-jic23@kernel.org>
References: <20261109035252.1295926-1-jic23@kernel.org>
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

From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Poll st->trig from the data ready interrupt path rather than
indio->trig. The data ready interrupt is only enabled for the triggered
buffer when DMA is not in use and the device's own trigger is in use,
see at91_adc_buffer_check_use_irq().

The DMA completion callback still polls indio_dev->trig as it must run
the pollfunc on whichever trigger the device is using.

This removes one dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index dba4e7b2e77b..e4db74fa1360 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -1711,7 +1711,7 @@ static irqreturn_t at91_adc_interrupt(int irq, void *private)
 		   (status & AT91_SAMA5D2_IER_DRDY)) {
 		/* triggered buffer without DMA */
 		disable_irq_nosync(irq);
-		iio_trigger_poll(indio->trig);
+		iio_trigger_poll(st->trig);
 	} else if (iio_buffer_enabled(indio) && st->dma_st.dma_chan) {
 		/* triggered buffer with DMA - should not happen */
 		disable_irq_nosync(irq);
-- 
2.56.0

