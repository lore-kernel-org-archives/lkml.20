Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196402;
	b=yiWbV2mizKcsENLdQeJb77SimNC0vWsc8suJawj1bXz6V4LcMMbffLJh8Zpkc/alArKb
	 FQ1hPOj/J8B4e8/qq0E8JuokwH+JBVqD4MlKYuPDW6oGiDnQBQgrGuKH6M6/oLqGAzPAm
	 YL9ZQTlTcL+ZIzdHaEES+CVmwShB6JSbZ/KBFS8JR6qLzcbLGto0S1wxC3/LakCvq3MY8
	 DwKmZxFz5Ak5PpEjgPfqgHcFCU/uj19KRIclF1Si2NUhC/0hwmfrWmQrIoT4gq3shCOg8
	 bXDdzs8rYYFtxiwElu+Fx/oPevmvGNE1kVKSq2Rt8yioXkZmnhinLlXNz6CDJXrQwYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196402;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8Uj4IOUei/xFM9ENtdppOiYtatJz1cAwsG8KzHWm0/Q=;
	b=WLSQAMUmU75nNOJ27tM0C6NWwaFW/XRB2h3T8xdEv9rJBxDyWJoQv2AaNBSx6ekC7HrI
	 ErxSFWCvjuRUz+M/70vbil9qwQXHgEmUepQ/+ZXrMlARvaxNrkwdrbJ2pTSfO076lKh4y
	 fDoFkVZUjhLyW85mprvINNnDovOwR+d0+OtoA0R0zUEdhw2zJgAD3ApYBLQ15S40dnhFX
	 gvgw3hua9GUZV56uN+y2X0XWNGim6K1Zb68Rj6a8IEUJLZznLVFyhU5GcvsU7G1Rp8NHS
	 VRlL3C5AFSJn5kn399IVxrBr7Ow7zoP5krF9sm7Dj2dsACTb38dCU+8NSrIQQn6n3Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPX64WPh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51E606EE8F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPX64WPh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8EF1F00901;
	Mon,  9 Nov 2026 03:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196401;
	bh=8Uj4IOUei/xFM9ENtdppOiYtatJz1cAwsG8KzHWm0/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RPX64WPhIEsXR0BFWPyWm7fAO8960RSXm6YDi2rZieqOEKG4Wut8n5Slq+OuuAyQH
	 P0oqJxNga2FDzhr0gNSmh8fdj0iyI2tOybeWDb563+r0/kQsCmFyezJHct0Mmqb5ZI
	 h0KeV0Pr/p5YbUCOVIQ7hdkN4R5t4e7GUuo+i8dgcdxjuTHkgSYQ+7DL1d6HZH5tJS
	 43WOjvVlAzDrdoNZZMjKx0+X4D/By77tUkK2XHP8TBn9JeS6nrTMD1TtJ6GWPRRmqA
	 +P3nBOxhzunMXHBUx0LVeNRI+h+lPohXrXklBQYxb2Jqk8XhqL6VLY13XA4IVI90YX
	 P6WtjZgi3AAnw==
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
Subject: [PATCH 11/14] iio: proximity: vl53l1x-i2c: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:49 +0000
Message-ID: <20261109035252.1295926-12-jic23@kernel.org>
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

Keep a pointer to the driver's trigger in struct vl53l1x_data and poll
that from vl53l1x_irq_handler() rather than indio_dev->trig. Only the
driver's own trigger is accepted, via iio_validate_own_trigger(), so
with the buffer enabled that is the trigger in use.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/proximity/vl53l1x-i2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/vl53l1x-i2c.c b/drivers/iio/proximity/vl53l1x-i2c.c
index bce238d1b6de..ffc6fe45b165 100644
--- a/drivers/iio/proximity/vl53l1x-i2c.c
+++ b/drivers/iio/proximity/vl53l1x-i2c.c
@@ -102,6 +102,7 @@ struct vl53l1x_data {
 	enum vl53l1x_distance_mode distance_mode;
 	u8 gpio_polarity;
 	int irq;
+	struct iio_trigger *trig;
 };
 
 static const struct regmap_range vl53l1x_volatile_ranges[] = {
@@ -587,7 +588,7 @@ static irqreturn_t vl53l1x_irq_handler(int irq, void *priv)
 	struct vl53l1x_data *data = iio_priv(indio_dev);
 
 	if (iio_buffer_enabled(indio_dev))
-		iio_trigger_poll(indio_dev->trig);
+		iio_trigger_poll(data->trig);
 	else
 		complete(&data->completion);
 
@@ -707,6 +708,7 @@ static int vl53l1x_probe(struct i2c_client *client)
 		if (!trig)
 			return -ENOMEM;
 
+		data->trig = trig;
 		trig->ops = &vl53l1x_trigger_ops;
 		iio_trigger_set_drvdata(trig, indio_dev);
 		ret = devm_iio_trigger_register(dev, trig);
-- 
2.56.0

