Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196402;
	b=OCE94ABzxnPtZX4GYvt4Pa72bFF2YfeNrj+YQNg1PszY2QQy0Rlr/bJ7r1P0nqVpqXf8
	 tyGZDwMN+x14WVRpcJOSC2VzNIpyEEZ4PDdKoWWfR4ZcDCDdE7TSzpDfmzsEIyrT1Wlgl
	 KvxO0GvxpKfQ7vR+wq9FqKsMVGzMeRoV7/YyMFlfLWkTiYlEOlM6yQ8H4JNVH96+4X2q7
	 tV8BG3yOV9hvrjlA9jp5CFptM30Zzj00ZQA3p/CKFPbPFIvA/Ynm0mq0OqqOmhg6XMFCc
	 Oyz7zjzW5QFEKvF6I38MZE43x3kn/uDaqisZtJxsJvHxtYlY8rcYe0Lir0rUGeuXZzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196402;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xbScOYTDgyrTUjPbnxCpt2oXpwahQgbrUgKAhY62GAM=;
	b=F13jblPzCJMp2vyPh/tYieygJONxwLcSoI+kfHapxoKWZLN7qDBIH/mY2fbor0Orh/WR
	 7/S8wtJubr3u2Tf8kv8i2rANHq9PV+I5Sia37X8Etax+55DxX8zrwXfSTOtf2B43eTFeW
	 /0fE7hA8Bt9CS9m9h8t1P1Fq9NoFKBG1aTIc96yCGE0RuaFv0SKjwWHpqhhnIKz/SrIRK
	 hgGB/HJobUID16RjA81Mg5e7jGHzJA6k6DbYxD8fvMm7hgCcBuJTkbDieuQlDNKbSZRKX
	 O4uIp3kY7cRN0+fX1oIzTjHnk6RGQ7z0cr1QkXfgJnX/Zbf7l3bp7RujMpyb7Er5PyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GNwoMlT4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA0E606D81B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GNwoMlT4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573501F008A1;
	Mon,  9 Nov 2026 03:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196401;
	bh=xbScOYTDgyrTUjPbnxCpt2oXpwahQgbrUgKAhY62GAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GNwoMlT47rA2wPrESkGwbsr6wrzWhqlUKdDTcb5RP/bAfiSCTCpQLXFLVG1oBRcrm
	 SlBLr9OzFcLJOfolry3uUi3afDz539XnQp88giaka37IbJUg0bu6ef+bwLEGYeWtMZ
	 /vj6TlTWrs04gshj39P/eK/ub+19z8RkodWZhjEDJlSaVN5msVhrq/xCusJOdwWtsf
	 JEBbTzKNfwZfOScyQZgVAp03p5XW+v33Uy9908oq7h0tl64+9nYi2KTD4m4YOs1A8t
	 1Q28FHMuYrEXVfxRW6iRdb8g+waUnSZRkW01sh5wnTt7DGmN8q21Zfav80nHeSku05
	 ZeDYCBjARmR0Q==
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
Subject: [PATCH 12/14] iio: proximity: irsd200: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:50 +0000
Message-ID: <20261109035252.1295926-13-jic23@kernel.org>
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

Keep a pointer to the driver's trigger in struct irsd200_data and poll
that from irsd200_irq_thread() rather than indio_dev->trig. The data
interrupt source is only enabled by the trigger's set_trigger_state()
callback, so it is the driver's own trigger that is in use whenever this
path is reached.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/proximity/irsd200.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/irsd200.c b/drivers/iio/proximity/irsd200.c
index b3db7f3a49f6..82edb135f4bf 100644
--- a/drivers/iio/proximity/irsd200.c
+++ b/drivers/iio/proximity/irsd200.c
@@ -122,6 +122,7 @@ struct irsd200_data {
 	struct regmap *regmap;
 	struct regmap_field *regfields[IRS_REGF_MAX];
 	struct device *dev;
+	struct iio_trigger *trig;
 };
 
 static int irsd200_setup(struct irsd200_data *data)
@@ -698,7 +699,7 @@ static irqreturn_t irsd200_irq_thread(int irq, void *dev_id)
 	}
 
 	if (status & BIT(IRS_INTR_DATA) && iio_buffer_enabled(indio_dev)) {
-		iio_trigger_poll_nested(indio_dev->trig);
+		iio_trigger_poll_nested(data->trig);
 		clear |= BIT(IRS_INTR_DATA);
 	}
 
@@ -917,6 +918,7 @@ static int irsd200_probe(struct i2c_client *client)
 	if (!trigger)
 		return -ENOMEM;
 
+	data->trig = trigger;
 	trigger->ops = &irsd200_trigger_ops;
 	iio_trigger_set_drvdata(trigger, data);
 
-- 
2.56.0

