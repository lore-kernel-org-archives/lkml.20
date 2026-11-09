Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196388;
	b=Rs/0PxKpPG8ZpsU/Jb8Etr810doHxvqlj9wTZMnUNW5aA7ZNRxWdKsEQVZkwVjQ438R1
	 hwHpulYqXdjyMiWbmBvpLceqvUHvJBZmmLLPLOgyipO6EoS87kDyVwfzsbztNAgTxcTMO
	 /+4T5B61OlD2g1JvkDnznuqoszJyT9bHzWI4DDf+zAIqn5Bob4hs6XL8H8VYjIw19r8Wx
	 z3kgmkwENkJB0D3Nd1w9pUwXdRTwtQXm9lr74p692QZ4ubsPDnQdG2YHbibBbS02au/c0
	 Qd3kybTM/qxjZtL63EuogKNXSTJIF4UT8HqE2iZzE5QI1Sh5h8f6zGMxLJWTgaGyiQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196388;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2TNfnPdK8OCQ55KXkxrD8Ttgxo05/cSe/OzFy4EXz3Q=;
	b=AkQ/mcvJoDSYr9280P4xRWpWvhlCncUSuWYdiymJ+xzvqWcdTZgInN727mO+Wm5vwR47
	 ytIMePXEKGAefSPoErz2piJXEbFFflEkP6RBa7zewlHsce6N1C6UoGJHtYlPhEuEHJuL0
	 l7EvkwRk89gU7mKCsVAJSKtDGmLkW3KALYW5TN97QT91z73o1syUeJMZ2Fbp7R6uycfLA
	 69jOSz/Ixwj3neKwAfXAkp2zQUlrLdTK8XKhvxQPEHGoTbAeQ0K+tRG6UdkICvQJPZRSk
	 QvaEv0FreiLvyd+TWqagBOhGCW4/w7qg6YLQPTZGoZHnwsSVLfeOWC/a5ypHmE2/luA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsFBgmuJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A255A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsFBgmuJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208A01F008A3;
	Mon,  9 Nov 2026 03:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196388;
	bh=2TNfnPdK8OCQ55KXkxrD8Ttgxo05/cSe/OzFy4EXz3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DsFBgmuJv21emLqe6TjIsErUA0smfzUs47c/JSAoL5kYJ3fVWi2I0G4Cyd7CRNmsd
	 jLm4ForVRBZ3+7XMwDSDg+Jr1SxkQ9arU4+nx+gDtij8GqjsPKj375hoUWKFdb9NFb
	 EeBrtYQqpF/4W0PMknC0K2ZpLGgo5bE3HOnCpU/kVVS6rt25X1ZA3jjzdB4ji7tgdJ
	 vKpVTWZ7D31NRDpUFuBmPh/vvKlh7xi02QIUmSy2EZZ7IrPj/Irpre/expgIDYcB3m
	 KOb6yKLlQQ4PnTGQI7usSJ88vqRoSSfzujwwQVA4bsVj56fkvcV5PcTZ0tMBxVLJKI
	 j/cRa/8ylSDsg==
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
Subject: [PATCH 02/14] iio: accel: mma8452: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:40 +0000
Message-ID: <20261109035252.1295926-3-jic23@kernel.org>
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

Poll data->trig from mma8452_interrupt() rather than indio_dev->trig.
The data ready interrupt is only enabled by the driver's own trigger's
set_trigger_state() callback, so that is the trigger in use whenever
this path is reached.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/accel/mma8452.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index f9abff3842fc..44962ac7491f 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -1099,7 +1099,7 @@ static irqreturn_t mma8452_interrupt(int irq, void *p)
 		return IRQ_NONE;
 
 	if (src & MMA8452_INT_DRDY) {
-		iio_trigger_poll_nested(indio_dev->trig);
+		iio_trigger_poll_nested(data->trig);
 		ret = IRQ_HANDLED;
 	}
 
-- 
2.56.0

