Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196398;
	b=CtO6kARQ/iwMT/a8zOaDu6QkZSuOGZQjaS5QK0u8RHe9sF9J0vlFgMjctaW3mFASKZJC
	 PM5P7exlaPebSzZ4XQKs5UpOlxQKcq9f3fALk+LIe9ZwcHGgIa8npOaTi1Z/qXbLmhaAW
	 B7teyiik0ziOx72jC9Gn92nQLZtr/V5Q5HFje/4sOVxzV6Uxql2Oi3ch4TPH7SAjmaCui
	 koljNiLu6o6kh3yUaAD5JH8BPuP5RETPpnuyTYFDwrev0JbGxAlcXpWtqEmrxFqO3C2RO
	 w6SWl97237sHj96ouUblpx3LpbCMyO+svZuO/ZZKvZvF0NnXXWu//C2Xd2sDAAZUUgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196398;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NTgwcRzUf32MacA5MXJuOZ03d/Y16YM755ndq/T6KZQ=;
	b=lVrobRt8fcqeVrIB4QrvTskCZS7Lun3oon8IIjSy1v4o+U936H85Xx4ELtbw7gd2xLlr
	 2vdMlFoLMg2CgRv3+JwEInB/pQlLH/zy5oyNK4T9C9nkbJFi7p231kIoFwPXtRcwzX8/L
	 eXsHVbtTPE2/oI0vFhjvXH9Orgq+Anxw/nZfRaFsLJ2lBOdf2SwFWbc7nfBzwKdN79Ykd
	 moOxYbz3R1Xg8jNsDajnezBQLCLGJd4ZaZLHVvvwgZRh3rlSy8q0yp+jkJiOQdwvt7PNR
	 LXpfyjLIOnQuqUBtxs082XXBJJR/fuYQojeUv4yznRxdWT8JSKD8cVfwAwX+FFa50gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUqlkRAG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D49606D830
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUqlkRAG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457F11F00901;
	Mon,  9 Nov 2026 03:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196397;
	bh=NTgwcRzUf32MacA5MXJuOZ03d/Y16YM755ndq/T6KZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OUqlkRAGFZ/RMIWVZXDniGJJh11ExwQFPILdSTmiqW/eUJLyqOTFB0K/4eAayiwVQ
	 bR8/ybESSba47UaZveoREIbTMa4ETG6y5/KK6r6OZexifD02xboCY8qlohJr3qod2l
	 M3bYJGZQGVmzm0vbJZEzJrBU3wzgyaBUfjlxLofB0qnkYeJguttGlpx+Lu+h5mVsYM
	 IwWLl/0WMX6f1cfiKgkogNtFXXa1plkLwf0zjHxCQXcehTbTLXJd7ErNfFNu60KofL
	 l0kBPZTQRljAsih+ypn1dqu7h+pWDAkneN60yEFhkcfWgdcqsEczf/hy88TFMzLJ0Y
	 HoZGG9ABEGm8w==
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
Subject: [PATCH 08/14] iio: proximity: vl53l0x-i2c: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:46 +0000
Message-ID: <20261109035252.1295926-9-jic23@kernel.org>
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

Poll data->trig from vl53l0x_threaded_irq() rather than
indio_dev->trig. vl53l0x_validate_trigger() only accepts the driver's
own trigger, so with the buffer enabled that is the trigger in use.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/proximity/vl53l0x-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/vl53l0x-i2c.c b/drivers/iio/proximity/vl53l0x-i2c.c
index 173e69753df7..6c595e647d75 100644
--- a/drivers/iio/proximity/vl53l0x-i2c.c
+++ b/drivers/iio/proximity/vl53l0x-i2c.c
@@ -107,7 +107,7 @@ static irqreturn_t vl53l0x_threaded_irq(int irq, void *priv)
 	struct vl53l0x_data *data = iio_priv(indio_dev);
 
 	if (iio_buffer_enabled(indio_dev))
-		iio_trigger_poll_nested(indio_dev->trig);
+		iio_trigger_poll_nested(data->trig);
 	else
 		complete(&data->completion);
 
-- 
2.56.0

