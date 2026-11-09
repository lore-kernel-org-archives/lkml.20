Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196401;
	b=ayEKTLffquKilze33zhl5+4rmc4NpzhnBszKqe2bF/pod1uiEe3AFoAkWFtas53ipFiF
	 3M9erTqbr1L5e0Ksv809Dh2clRa6wOJU7ofDtXAXIidJAxPoxByiCNRXVQOAYEhJFM4sR
	 JhLkTIyYMafqIM2ngjWlqycvg1Sxfmg2EuxpLgV+lMBxpozcx/ka/RPgY/Z4fyTnE6C7s
	 1F8gaPwona2CA8Emy/BV77JcQ4RaPeIwO6R0W43c2VOPVMXD8FaEXrUldpQvNND9QL7Sx
	 vDP4nDqsnzHDupwHUj/Y3bckTPmRrUotoMOROYhoB8TOBCdR3uFz8HjJK70mYHvxxjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196401;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZdxUSqo+w8YeqJVaUlbjwzQ0LSd0yO3WpZRV2w3VNNE=;
	b=DoBmqv63r8Tcv/CWV0D1h3bWp9k+y4NCtNREW/8FeeTfGRLg/CeDR+ZOuVHvVr/fk3DL
	 ity5DPIHMmlaH7IN7jz4Qxq+CH824HgM0FHSI+A7gnO6S+Lnxdz+R3eCEKWMa7hMYDBBx
	 s2VGxQqBTUPszkJdhohrX8DcWIe6KhMQULBam2HIiotoSjMExcpAjP2c1TIHsWk2q/Mcy
	 BLaT4BTKOM7lJre6LNZVkVTj6lT+2Hx0YEk8S06A0rXoGSw/0jIiTE+U7isuC61TsyPE3
	 HLw+HoKEZVP1kPgSm3joFSEt9Ou+ZLRLHGC7vJmiyjzYqPfQh3AlpquxvyY9kB+ijSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DMY6fKuB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF444606EE8A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DMY6fKuB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5DD1F008BD;
	Mon,  9 Nov 2026 03:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196400;
	bh=ZdxUSqo+w8YeqJVaUlbjwzQ0LSd0yO3WpZRV2w3VNNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DMY6fKuBB/NZgbJokfdnj9M+b967QMAbnCbgcMkZHW+cem1d1XqXOIoM0pYOG+A+8
	 N4v1MPFRcvnIFEQEWhi7xHL+sOXb2hrqvDRDQ5pLuH7vWrwFn2rwNQCyHcKNThD+0I
	 su6xlTo+cRPrV649AeNCmgRJLXXylqhV6VuAiP4lw48O4Y/fYFSlWq4hlfQ7pi7tR3
	 4AGj0Xi2QAEonVlw9tG3QeWLXK3sSZLKw0dC67K4M+Va/OMVThNxlwv3QGMYWEhzvb
	 dMHqL5LYY7AYbOPj4cosXBCJjlswNqa1O5j9quejvwKeSg5jG8M7ApiU0K/bu1Bpsn
	 QwRZeNbN0TVvw==
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
Subject: [PATCH 10/14] iio: chemical: scd30: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:48 +0000
Message-ID: <20261109035252.1295926-11-jic23@kernel.org>
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

Keep a pointer to the driver's trigger in struct scd30_state and poll
that from scd30_irq_handler() rather than indio_dev->trig. With the
buffer enabled, the interrupt is only enabled by the trigger's
set_trigger_state() callback, so it is the driver's own trigger that is
in use.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/chemical/scd30.h      | 2 ++
 drivers/iio/chemical/scd30_core.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/scd30.h b/drivers/iio/chemical/scd30.h
index 1ac9f3f79271..bdec5cf62a26 100644
--- a/drivers/iio/chemical/scd30.h
+++ b/drivers/iio/chemical/scd30.h
@@ -9,6 +9,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
 
+struct iio_trigger;
 struct scd30_state;
 
 enum scd30_cmd {
@@ -57,6 +58,7 @@ struct scd30_state {
 	 */
 	void *priv;
 	int irq;
+	struct iio_trigger *trig;
 	/*
 	 * no way to retrieve current ambient pressure compensation value from
 	 * the sensor so keep one around
diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
index 770571c21521..ca824436f60e 100644
--- a/drivers/iio/chemical/scd30_core.c
+++ b/drivers/iio/chemical/scd30_core.c
@@ -573,9 +573,10 @@ static void scd30_disable_regulator(void *data)
 static irqreturn_t scd30_irq_handler(int irq, void *priv)
 {
 	struct iio_dev *indio_dev = priv;
+	struct scd30_state *state = iio_priv(indio_dev);
 
 	if (iio_buffer_enabled(indio_dev)) {
-		iio_trigger_poll(indio_dev->trig);
+		iio_trigger_poll(state->trig);
 
 		return IRQ_HANDLED;
 	}
@@ -666,6 +667,7 @@ static int scd30_setup_trigger(struct iio_dev *indio_dev)
 	if (!trig)
 		return -ENOMEM;
 
+	state->trig = trig;
 	trig->ops = &scd30_trigger_ops;
 	iio_trigger_set_drvdata(trig, indio_dev);
 
-- 
2.56.0

