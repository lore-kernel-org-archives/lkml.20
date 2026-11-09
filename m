Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196394;
	b=wXFANjPEeKloOWSr3QtjNZsnsZaegHP4zxJwDSGpE3AYF6og682AZummcFF6VvLzrHAN
	 NZZPITTD9H9aJZoRwMBe/ohciUA+3DvDITL6IH+LkA4SsYQmjphO6fJd53F6Dv5wLa7Xz
	 qG2/+ToBrpFJTbKN8G7zcms8Y0VgOMEgLxqEYn+21xkI30i+0FzJY1dDlRORwkxFNuZ2b
	 vXWhAQQDF1cNYChyQkhMxOCYWmuXYQ+eG20JT91mwIfbkrTMp8HdiKQgLrBto6lQqPPOH
	 3SIdEF4dtDPGiKE4O0Avt09TrQTZfgcLd5j/ivA/1Dz36mmeBjMc2tZZSBuATIcB3nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196394;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nAzU2aEwFGvXBq3kemA/V5Nf6mODtkvSfg96CQhWfEw=;
	b=B6NK/SsMDBZAvHvTXMfRFvZqDE4GWlzLZ9CQXkcfKpYaY3cId+xPQXMnWLgNg7Q1rkz1
	 Gnde1VGdj6kPfCZozGLGJxkkP9eovtE8j92XUXoYn1rvub4tSlI6VScHWccZKWjGOOLFb
	 FTjwmv6HFk9GY+MwJLrp80G7unfjSzP0MZhhvXngtlB1cOZgRePPIsVACeFuMywndW45+
	 69meIT0RuQPPHAtdDSSE5FC5d/Z2ZLzjjWUv8AV3osNo/VRl6+Tt6bL1QLM+CZN8mXGs9
	 t0orwDh+w6A5Bs5SPYad+B9kiTWsT6a1QDGW/km9WKKYo8ncyL/wmVaPso2RMDKwNiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Tl/GvZvk";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D56A606D80F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tl/GvZvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FC21F008A4;
	Mon,  9 Nov 2026 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196394;
	bh=nAzU2aEwFGvXBq3kemA/V5Nf6mODtkvSfg96CQhWfEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tl/GvZvkdRA4kDAheTqGRXCdihHVInsn6tNgy24QEzfC/yZLjzv+l4aspSod+O8fV
	 7QfAxZ9sdWgrBT3sF1xcVitre1umQOsJagGSiSR0JIkunFv8TTKJ6YPWKG2Zh5uL2f
	 FCK7KEkxsdLDSNIlIP4dUvI9d02SU8mHcc302sInpu+z+7jJ6O+u34iAIIZdviAvwM
	 wqwjOMah4IE+tB86cDJpeVXzWItoYmeV4a2p6JswIBeDn/UOG8hzttluK4mpTRrjzN
	 xg/ltqa7AE72wKAdQ9KRpyyZqiqyQGvi2nXBPVJNlVO82+/fuEbXajc8pJb4nTCpew
	 rBwAQcuKIfh8A==
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
Subject: [PATCH 05/14] iio: adc: mxs-lradc-adc: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:43 +0000
Message-ID: <20261109035252.1295926-6-jic23@kernel.org>
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

Poll adc->trig from the interrupt handler rather than iio->trig.
Conversions that raise this interrupt are only started when the
driver's own trigger is enabled, via its set_trigger_state() callback.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/adc/mxs-lradc-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index dda5182a5076..0174c7bb8d58 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -393,7 +393,7 @@ static irqreturn_t mxs_lradc_adc_handle_irq(int irq, void *data)
 	if (iio_buffer_enabled(iio)) {
 		if (reg & lradc->buffer_vchans) {
 			spin_lock_irqsave(&adc->lock, flags);
-			iio_trigger_poll(iio->trig);
+			iio_trigger_poll(adc->trig);
 			spin_unlock_irqrestore(&adc->lock, flags);
 		}
 	} else if (reg & LRADC_CTRL1_LRADC_IRQ(0)) {
-- 
2.56.0

