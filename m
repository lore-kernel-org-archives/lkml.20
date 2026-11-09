Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196395;
	b=XTDxCJpgAwY2XBsxzL3C9oM5D2rkQid1q69kIZw8LIgPxtsmzQ7JTJ6u150zmgonza/m
	 xf+TpPZ5ICxAR+APfm1OG69D3kP5L46BKl7t7I20kYXr7gf0vHGr2ZuEmy26ynSeSJN6l
	 x4TvZhPxDAgcsNwn23lAtQ9Anqtz4Ly9/m/uwLOB4Dipgwp9NJBoq9itZnjD0qoO5wa1X
	 wPA413ycC8KROvBeuclnj9FcreI5tQL+ypT0T0KzHizZsCim9wtEcRArATf6QxJlfZCGF
	 Nw0HChpV7tYk8oGQzjdQ+20EU8dhFaQ6tYLU9eqYvMSJ09wGOwTO994HVr5z4pHiQSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196395;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+vNJkoFdRV0hile3s0HC3gFTuex7879BN3APjkn7jbs=;
	b=tUHlRLdEvZhoWd3w1tKL5AYyecZn71KRmtpBFwAKLc0cGJiY0/Oi07d8DPf+y8QwI8Ww
	 ToloQRx2joJ4KLqqw7BPfjbsiESBpFC7v8FoeXbD0wLfqbqYfvmPdHQ6nSc0v9exM3vac
	 68SUx2uzUHYsJ1rhzyKkkGwI1C46cehRtiZG981IYdH43RxC8vuZMBS2nTy+5rV4Mgpgk
	 +WCV7i8db86chbo+h4/TMWnUoQRB6ohCtESilSrgmYVg8Y95AydrribIq5LpmSHNc3Wvt
	 Bb4fabkkMpBauAWcYTFUXUuIXwFWPi0vIR7lsRRz1mNfDgqpLvG+pELNJFtwdZpn3+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ktL4ZkIf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C85606D818
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ktL4ZkIf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2111F008BD;
	Mon,  9 Nov 2026 03:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196395;
	bh=+vNJkoFdRV0hile3s0HC3gFTuex7879BN3APjkn7jbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ktL4ZkIflPj7K3WoQl+5ry6SHK90P2zIQ9mMIpNFEJ7RU1ld+a/7qOsDf8tSoVcpS
	 EiZpVHH4sLF2hlQ37rPdGi4QTdbHnQTmuyjU/B3eFR31Tx9f0nMsPHS/AC3hM0sksP
	 xR6+q8526CzBfXG8YMCCN84fpbyUcQQB3eLXJwJXnJOuy+hYJ0/Vk73GWC4+qcS2TD
	 Zsl4vMB1PTfcEqDnyAKZc7zjx1UCd8YWYkcSfcNTeL9ilH6Wxka2MFlHm+3VUP6wuC
	 lLgZ7PnhkqD7BfgHDts1ZEmxzNU+D7SMpLS4H8YJjsQPrbFcWaCRPE8EZlNH41gSbK
	 0peSM3PJWJDoQ==
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
Subject: [PATCH 07/14] iio: light: vl6180: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:45 +0000
Message-ID: <20261109035252.1295926-8-jic23@kernel.org>
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

Poll data->trig from vl6180_threaded_irq() rather than indio_dev->trig.
The poll is only reached with the buffer enabled, which is only possible
with the driver's own trigger as iio_validate_own_trigger() rejects any
other.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/light/vl6180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/vl6180.c b/drivers/iio/light/vl6180.c
index aef8a5333442..44fd0446b583 100644
--- a/drivers/iio/light/vl6180.c
+++ b/drivers/iio/light/vl6180.c
@@ -525,7 +525,7 @@ static irqreturn_t vl6180_threaded_irq(int irq, void *priv)
 	struct vl6180_data *data = iio_priv(indio_dev);
 
 	if (iio_buffer_enabled(indio_dev))
-		iio_trigger_poll_nested(indio_dev->trig);
+		iio_trigger_poll_nested(data->trig);
 	else
 		complete(&data->completion);
 
-- 
2.56.0

