Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196392;
	b=oo0Fhl/fNV2Yf8EFFOGwYDjHuGgH8WfMVlhS2l5Kc1RQiKU3o4W6OzJolGwB2awxYKkQ
	 Hz+gxnWYdLNboAw9X4PXhJqxfDdnjyAANDN42C1QwtTkj7x+ZKDGhBHIAjfGGX5BbtEuN
	 Q2GRHAHhbraCbVLfK5MXmv/yVQTzXjFSw/w7doQM6njxsIaLJDtu6ESIsAlvNRnujW99L
	 WSxz6kwyifPWkuqFEl6YFvz71WaRTNMb3YmV4/I46iKtSq5FkBKDrbDygg9t9t/0n9yM8
	 q565avvKXaboOPWCui5RtVvCKUggc7QdtqbLC68LbREQvr9g46l4tZORrJiD+EJ23Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196392;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1JrXEd2NO/cJ+1CoKfKmdQuXHWCqxoOc8mX38KC+4vo=;
	b=oPEOemN34bUaF4Pxqo8cCG+z/yFcP8+oNlsyIFaZFpTLtErD8UOiQFMBygxGDzXE3QaX
	 ul3lCfeZ20DwVKwdK2A/1OssEWgK5eF/hvXtTtSdPWFzygX0K/N7UrjKSi1Hyg2jj0R4V
	 UYcK2Y5+pE/Wd408dcgMDZxP1Ltqm9nerNk/1g7BxLxy4KP3PiBQMvlv8AIdVSPDXvalC
	 xx7IqGGakRdJwLs3Gssq6LTm1orkxKwbfUncW6SZ1n0dq5A3DTqeFjQMme1umFGcWT56P
	 hvhRsYBBcHk8JPc7Nv455gzAxNEynpfGAcCuhWbCH+DYjJrrVd9UEk+awV/sHsC1pcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUxyXe40;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998B606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUxyXe40
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433251F008BD;
	Mon,  9 Nov 2026 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196391;
	bh=1JrXEd2NO/cJ+1CoKfKmdQuXHWCqxoOc8mX38KC+4vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aUxyXe40/jdoSpPgY30oLpHwN/z7ZsJKFUD5IwzfHbnxlmwE2ioEoQP8dbOGqogBz
	 LJox9kyOkoSzFVQ/YRcaOLYCJi53s7khuPNW1L3/R4rmlNNKBL6d9y0lyO0zheNOY9
	 Aaci4WPOLC2uwazFpTt+ZywV2oVsdt7zuihbhy4vEaWwsYxS2sfV1MYQUMCLRJN9Jr
	 YLCnDdvuTUD+rFNreq1sv3QlM2wI9AR8hO80rREYZVY7UX87GizQFKT0XRuqzdMSpX
	 IRMglO07hmFwuzoglvBvjk/Vmw4ybh6JuitK96hSYIXhxYIjH9j8CoxNy8KPSnGcsK
	 Yb2eqdIsSm1Hg==
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
Subject: [PATCH 04/14] iio: adc: ti-ads1119: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:42 +0000
Message-ID: <20261109035252.1295926-5-jic23@kernel.org>
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

Poll st->trig from ads1119_irq_handler() rather than indio_dev->trig.
The poll is only reached when iio_trigger_using_own() is true.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/adc/ti-ads1119.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1119.c b/drivers/iio/adc/ti-ads1119.c
index b0f04741ddc6..e815ba6d9d4f 100644
--- a/drivers/iio/adc/ti-ads1119.c
+++ b/drivers/iio/adc/ti-ads1119.c
@@ -497,7 +497,7 @@ static irqreturn_t ads1119_irq_handler(int irq, void *dev_id)
 	struct ads1119_state *st = iio_priv(indio_dev);
 
 	if (iio_buffer_enabled(indio_dev) && iio_trigger_using_own(indio_dev))
-		iio_trigger_poll(indio_dev->trig);
+		iio_trigger_poll(st->trig);
 	else
 		complete(&st->completion);
 
-- 
2.56.0

