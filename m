Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196404;
	b=t4kaJ0oXHpjrPuDUksKdzjNLsPcb0oHRcHB3Lo/MsrhA4yDyi/fyuEA9cYp2VP4eq7BZ
	 UfcVp6tXEujRKKbEK84n7ELfbPxRW2gozz/0S9pwBQNo9rlsxe6VzXdhFThCKiXdyWRG0
	 H/8z+JdTBjQeM6tzPbvUjTeVuiLq/DHA8rXaUfvDsYNtrahXOOKt1u3WhLtQo8t1g+z5K
	 NqCGBxu1rsiVTET6fC/qO7SDKCBXwRe+iCAF2cEsROc+f5Uup32ps6n/cqnrVuE/ARkdK
	 C0j0r4V+nTaJMhHU4hS8oEw6f9vw2yVyCaA0M8J7VsYk80hH6cPoHIkriayo/RqpHAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196404;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=EfFmOf0f+fNfNklcyJtZOIJbh/mFnJlDVoVYHmduvz4=;
	b=V/hIsXmaYEd5r013Ywxrmd8k4ZlS2Wuuz8Slal3GQOQEFGY8jNWOGBNCb4co3BB/745V
	 e98SIVoEKtCovD36jy2FxofDXs0cUaBrsoCk0XD8U9jiJLs2Hjs6CEoEkp60iRS4PddYs
	 AvGAbpRDk2Ttt4braJCymThPIhIUN8U8tSzNBy/JrNWPp7tHj+3Gcj2gjYfFKvDICpo6g
	 1+RaPlwsVat8mOL3T87gT3Gn+MVb/7MpGZlLThxy+F5NgbHsmLIbif3e/cBCHwjoUJVIt
	 3iFMnH/sjwr/Eo76mEGcAg7pj+xT728HJLn8EA+tBGUYiXuqNg22AinJdptdKpPnkNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ag7mDn3P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F9606EEB3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ag7mDn3P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F411F008A7;
	Mon,  9 Nov 2026 03:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196404;
	bh=EfFmOf0f+fNfNklcyJtZOIJbh/mFnJlDVoVYHmduvz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ag7mDn3PKY23r+R8xTSD1HcJ1rPjG7OFERV87183di4vK9YNyuAhLRti10hwSrrbW
	 gppSLV6n6u67rJAHvE0ADOXxFyzt8LaDB2AJZWWzpdZoI2VSPo5TdBgpbxfeoULanB
	 2y1OXdmiIaCvgcHv4Ps/qnQ+qKmsn0FyEal6isv0i/yL3VunolRNxR/ynV57awq2SS
	 mHz/dHJMK+Sur6Nz/iePRMqUJ+YJGEb1wddf+eGwt0B8JBLGgpuNUyJDDztGhzSRvm
	 6Antph3AZmih+v542QWW3pEud3U6g32B+keCUGqutXTBRk/g8AxCcYkfJ5oRTP5UOs
	 O8LObhzI8ty4A==
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
Subject: [PATCH 13/14] iio: light: vcnl4000: poll own trigger from interrupt handler
Date: Mon,  9 Nov 2026 03:52:51 +0000
Message-ID: <20261109035252.1295926-14-jic23@kernel.org>
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

Keep a pointer to the driver's trigger in struct vcnl4000_data and poll
that from vcnl4010_irq_thread() on a data ready interrupt rather than
indio_dev->trig.

With the driver's own trigger in use this is the same trigger. The
driver does not restrict which trigger may be used and the data ready
interrupt is enabled whenever the buffer is enabled, so with another
trigger in use the data ready interrupt previously also polled that
trigger, running its consumers in addition to when it fired itself.
Now samples are only captured when the selected trigger fires, with the
trigger handler clearing the data ready status as before.

This removes a dependency on the trig field of struct iio_dev, which
is to become private to the IIO core.

Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/iio/light/vcnl4000.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 911f8d1c74d4..cab6e0af8c7e 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -206,6 +206,7 @@ struct vcnl4000_data {
 	struct vcnl4200_channel vcnl4200_al;
 	struct vcnl4200_channel vcnl4200_ps;
 	uint32_t near_level;
+	struct iio_trigger *trig;
 };
 
 struct vcnl4000_chip_spec {
@@ -1547,7 +1548,7 @@ static irqreturn_t vcnl4010_irq_thread(int irq, void *p)
 	}
 
 	if (isr & VCNL4010_INT_DRDY && iio_buffer_enabled(indio_dev))
-		iio_trigger_poll_nested(indio_dev->trig);
+		iio_trigger_poll_nested(data->trig);
 
 end:
 	return IRQ_HANDLED;
@@ -1893,6 +1894,7 @@ static int vcnl4010_probe_trigger(struct iio_dev *indio_dev)
 	if (!trigger)
 		return -ENOMEM;
 
+	data->trig = trigger;
 	trigger->ops = &vcnl4010_trigger_ops;
 	iio_trigger_set_drvdata(trigger, indio_dev);
 
-- 
2.56.0

