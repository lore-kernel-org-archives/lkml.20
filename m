Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196405;
	b=ETpuEtVp4TGFPn8lkJ9w/wo+Pgjr+F5DkU7pFw4JBoYaT78lwlFDmAaLn3/dtfxwha1l
	 6oa99MkCttDetm6ds26a7Ca4xWqzb39g6loC2GUYOMArzpsTb0NL4llet27w3X1mkcdPp
	 ooNsPP5kUl3MNsdfnYs3TKG71GargCUhEORhGM6Z18WvvMX2fY47iLnZ4Au5WwopV5ODA
	 kNms0xnNIh7fkbMuML+OLjZE5X51LN3PupGqP2rjyUuSU+cJQ+I/07Ie0htiTLGb0JKG/
	 rTL/fJdXw8AKBKrozqdtGVcqQ+PKTXOx1w9hHZIdmLI4O7LDfc70HYMAR0xTtIVevZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196405;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VJyuxI9FB+vQTbzBQeNpV3K1r7mKGAWrwyncU59TBXg=;
	b=e2+pUbYcObpXbUONBCYtjorM7pToCYuZg3kYE1VyPyFmmK5VkXYIpQb2hU/njfNKVN8b
	 pgYR0uZFf/9jp7okeY+i7BkmRWfGCF1vw1WfKT1blj2FBOtCwXq+/E67E5CuKw1QJNZhS
	 RhgHA7EhSa31WAfKqD1Tcn2szFIlZ1BFzGZHsorJ07YVjUvhzLjS7ca0KFZ/8xklKbi7o
	 bIf+AQRPvM1r6M7dCx3xVyluic9CYZ43FMzTYkkws37nrg31V9ebN74HNrOgEaqv7Mx/e
	 /CSjKBao+zT1VksI/9VSJdkatTlLeC4OYfMQHlV4xwl96kjd8vhoxQZrx7jsUH2xjYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3oOmMQ5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9616606EEBA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3oOmMQ5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6974F1F008A4;
	Mon,  9 Nov 2026 03:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196404;
	bh=VJyuxI9FB+vQTbzBQeNpV3K1r7mKGAWrwyncU59TBXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V3oOmMQ5R4mM8ByLC2cYEbQraDdNT/QXXjUPIOvieFfMkD5lUUOUJy1bnHJDnczVZ
	 C8z5FNaejlHWLlWd6WIb8EZOMy3Rdl8n74+vTgiFkqWcXLbjh5woZ33FQ8/bS/hjx+
	 egf5YnDzOUU5hOkgNbBqlFAnEfvTi2QrE5V5RYguoHrUNWKPypWRiy2TZ7wjEpc/Pd
	 Qa9YSosSrLtsRIn7XnUWCVhxUcJ3Sw5sifW/+E8LbRl82n7HYUagPGu5SourWxheVk
	 3xPI0ivTmSSH9GfgaVshL9f4+F9pEfYOtpwlc06D+xTIfWGIPRAv8/CEjyFdRczRqr
	 07IS6UZehaF4g==
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
Subject: [PATCH 14/14] iio: adc: at91_adc: poll the enabled trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:52 +0000
Message-ID: <20261109035252.1295926-15-jic23@kernel.org>
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

The driver registers several hardware triggers, any of which may be
selected. The end of conversion interrupt is only enabled for buffered
capture by the set_trigger_state() callback of the trigger being
enabled, and handle_adc_eoc_trigger() then polls indio_dev->trig.

Record the trigger in at91_adc_configure_trigger() before enabling the
interrupt and poll that instead. It is not cleared on disable so that
an interrupt still in flight polls the same trigger as before rather
than dereferencing NULL.

Also use the trigger passed to at91_adc_configure_trigger() to look up
its configuration rather than indio_dev->trig, which is the same
trigger.

This removes the driver's dependencies on the trig field of struct
iio_dev, which is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/adc/at91_adc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 0ac74ad92fca..49e7fb2d39f2 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -229,6 +229,7 @@ struct at91_adc_state {
 	u8			sample_hold_time;
 	bool			sleep_mode;
 	struct iio_trigger	**trig;
+	struct iio_trigger	*cur_trig;	/* last enabled of trig[] */
 	bool			use_external;
 	u32			vref_mv;
 	u32			res;		/* resolution used for conversions */
@@ -294,7 +295,7 @@ static void handle_adc_eoc_trigger(int irq, struct iio_dev *idev)
 
 	if (iio_buffer_enabled(idev)) {
 		disable_irq_nosync(irq);
-		iio_trigger_poll(idev->trig);
+		iio_trigger_poll(st->cur_trig);
 	} else {
 		st->last_value = at91_adc_readl(st, AT91_ADC_CHAN(st, st->chnb));
 		/* Needed to ACK the DRDY interruption */
@@ -562,7 +563,7 @@ static int at91_adc_configure_trigger(struct iio_trigger *trig, bool state)
 
 	value = at91_adc_get_trigger_value_by_name(idev,
 						   st->caps->triggers,
-						   idev->trig->name);
+						   trig->name);
 	if (value < 0)
 		return value;
 
@@ -581,6 +582,7 @@ static int at91_adc_configure_trigger(struct iio_trigger *trig, bool state)
 					AT91_ADC_CH(chan->channel));
 		}
 
+		st->cur_trig = trig;
 		at91_adc_writel(st, AT91_ADC_IER, reg->drdy_mask);
 
 	} else {
-- 
2.56.0

