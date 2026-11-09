Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196398;
	b=dbbCAtPzA1uNsdwsnY+eJvvnN0CWBRarFSVWN9tomuu9YB1IxQGAgn/QgVXxFjnxx0+D
	 KO0zll/EP29ouiKOgOpRSw+Rx0vXwqBeR9MjY6qpsSHlTRKpw9DzxlXkBBQQS7RgmrI41
	 FbivEAUQZYgJd22Ipnlc6f5T8EOo4VVzs63vM7TLLi6jg3MdrHH3DT4PR6gZMFfyV0cd8
	 PzdiRP6/MfpwCjprEy7d70TKi5NJ4w0Y6eKuYhcUrg9u9N5dh2ZRIuhcKuzzlwecgmpmN
	 1Y88iSUpR1yfgcrUFcx/wjzD7McTfQVC/m02ouIrkZ5uornpX14nRwfnUD78LZLvi9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196398;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=EtQrRKvpWtz+E3mm+kaVFsLMC7JdRWPcalkYQmYAWUQ=;
	b=as8C/dZAwYBPYteGQXEokECLAjSo9h7SQdnjVThg/UcZHriO88VtpaQN+AuRWeEaxxC0
	 oXHmbL9YQOxWDQdxkw94vszAIinZ47ZWzmb/NwFkATHS4/O7W3Zq3uir8ndTWkAJ7zabN
	 /WHC7abu6Hx/WJXXiwP7UwPFkZJU5TVPxozALkaxfPuN8Pjv7n58VobUTyMM5v1VOSJxz
	 zTUgRfdymaMUboqJYjd8rdcRR4SDafhwkrVvxwu+fFJpzBlSq73xadv9RypVBLwO9tWZt
	 bPJpDlSokfTauQiJIICoyY/luKd3ouFFVWfh1B1ykGb2Hy5DGj09YVOv4VBxkEmq3UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enEQRfp8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3AA606D836
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enEQRfp8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C31F008A3;
	Mon,  9 Nov 2026 03:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196398;
	bh=EtQrRKvpWtz+E3mm+kaVFsLMC7JdRWPcalkYQmYAWUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=enEQRfp8GcHPDBKAozvewP13RGYazH5k8XAR700+eAIfojarJ1E71l6ngS6q3IG1h
	 lSvVLEIhFsGSB+wP93oqXw9lVtCD0vgIsqpxbjErBlHeDSmHxbTZdsFqpZkxY9b2mz
	 s15FU3+Z1+LBf0WS3HqJniYn+3PZRjWZUj4zy0tz3y4S+hQdozUSGLrn4zxzIegfdg
	 p/mrbdZdbZl0M5ht179gImQWQYXvCggOw/oxp8LxAVEJ+gox1dDPepZvdjsR1LzRk4
	 C+RczyZbluYA8eM+BeXZvPKx4gkT/h9bM/e8syheGzXaddbhY0yOzd5ePSVQMUUzHl
	 bAqTdaZXQrNgw==
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
Subject: [PATCH 09/14] iio: adc: ad4691: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:47 +0000
Message-ID: <20261109035252.1295926-10-jic23@kernel.org>
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

Keep a pointer to the CNV burst trigger in struct ad4691_state and poll
that from ad4691_irq() rather than indio_dev->trig. The interrupt is
only enabled for CNV burst mode with the buffer enabled, and the iio_info
used in that mode only accepts the driver's own trigger via
iio_validate_own_trigger(), so this is the same trigger.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/adc/ad4691.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
index f2f7c4c6424a..f63a68a009f8 100644
--- a/drivers/iio/adc/ad4691.c
+++ b/drivers/iio/adc/ad4691.c
@@ -441,6 +441,7 @@ struct ad4691_state {
 	struct spi_device *spi;
 
 	struct pwm_device *conv_trigger;
+	struct iio_trigger *trig;
 	int irq;
 	int vref_uV;
 	u32 cnv_period_ns;
@@ -1563,7 +1564,7 @@ static irqreturn_t ad4691_irq(int irq, void *private)
 	 * the IRQ.
 	 */
 	disable_irq_nosync(st->irq);
-	iio_trigger_poll(indio_dev->trig);
+	iio_trigger_poll(st->trig);
 
 	return IRQ_HANDLED;
 }
@@ -1861,6 +1862,7 @@ static int ad4691_setup_triggered_buffer(struct iio_dev *indio_dev,
 	if (!trig)
 		return -ENOMEM;
 
+	st->trig = trig;
 	trig->ops = &ad4691_trigger_ops;
 	iio_trigger_set_drvdata(trig, st);
 
-- 
2.56.0

