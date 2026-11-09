Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196391;
	b=Yt1w9LdYOBgoSoBsRDTDIEmRNEcDRESQ3FUS/5nNCwOqNq1xc5Cq25XPFk+Fh2uvGiI8
	 IXhYWW1/XhC7SQi1svBil1kxY1j/mBkd7Sa5fKFapLByTO3dzGMmDGqtMSrk6Cki5PqCc
	 BZvc6CF++DeMprE1s0W8A2M4tVr19spEPTyAdJuQvHpIT2FDpzcoq76qfed8CWFZrS14Y
	 eJjrroH2pI7XHIrFiBXzMnGwGbLFE2E09xOy0ENI/xjy7p3RkaK9aVUhnVwVkxOU8eBSQ
	 8sNCyZkbdmgY04Yrjv2n8fqm3pFdA2HC1ANBtmyZe4oiYn1Y3cGViHlXwj0UaYLpSMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196391;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=I7LWda9VcDO/rMIUhcFJBfu3q+cLbfZB0A4Yi23fMc4=;
	b=m4RumYLcee12bCetykG93+oxlOx0TxkJ6m5AbLgwCUQQ6WAB4/aRvtJADanCCYIRZIEV
	 kU6cJn9enWXwBs6qMXW86p0618NnCAOkPzmEogYA++YvaOPk5koSQ7m1tzw3rLUCcQfQ0
	 VsSBHocqcyDiOfdQgaoRGjozjUv9EfJBhEA6YlwlKln2OSEZVrk+ZVAhWSy0RvSbIi2zV
	 f33Me8nXCcxDjWV02Y7TZMCha7/2Gyz44FSZNStNScZimHjHuezP9xNkgGjxAUTrg7Dov
	 JiPt0XnfB3weOjqNc/ftR7wkCxRwA93ExOpUME273ikvvATBICI6WvtcMkURwCaxrzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CjCiyrPR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673A606A339
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CjCiyrPR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD431F008A4;
	Mon,  9 Nov 2026 03:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196391;
	bh=I7LWda9VcDO/rMIUhcFJBfu3q+cLbfZB0A4Yi23fMc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CjCiyrPRjZVVmO3h+6oo6Qh/AKoQ0wVXj/zb/nCbaFhZ/teS7qW2+ljAnxajEqiF6
	 xsD1DpjiVIxmxLX8H8V7eq2MsaGusSwBmobErPN31pt/mqjvz/K0xNmmKmClRDP6xb
	 DiEljzp5rxchKmUSzXOCM34h58Fu94Rg5rajA4UrlwY21637Dg/iTaYfRKEB6SeRn6
	 HQ0cuk1zVwTf4XCa8nbgxyu+F/N3zkd2XtYSwqaIZ8WdJBQAVByOobpz3bDnC5p7fY
	 mWFh6ZzA2VUFb4z4NNiKjVeD4vnoe86L5naydV7wxX8eLrtJiFOfYk2c6vt90QmZmT
	 Gv+GDsaORP8mA==
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
Subject: [PATCH 03/14] iio: adc: max1027: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:41 +0000
Message-ID: <20261109035252.1295926-4-jic23@kernel.org>
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

Poll st->trig from max1027_handler() rather than indio_dev->trig. The
poll is only reached when the buffer is enabled and the device's own
trigger is in use.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/adc/max1027.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/max1027.c b/drivers/iio/adc/max1027.c
index 8d282feea8b5..65a0e85faca9 100644
--- a/drivers/iio/adc/max1027.c
+++ b/drivers/iio/adc/max1027.c
@@ -481,7 +481,7 @@ static irqreturn_t max1027_handler(int irq, void *private)
 	if (!iio_buffer_enabled(indio_dev) || !iio_trigger_using_own(indio_dev))
 		complete(&st->complete);
 	else
-		iio_trigger_poll(indio_dev->trig);
+		iio_trigger_poll(st->trig);
 
 	return IRQ_HANDLED;
 }
-- 
2.56.0

