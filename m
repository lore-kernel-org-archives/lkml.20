Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196388;
	b=U3i8cIUUcamxcthTvZj0V2IsH7Z5SXVIyQVU48uoR4Vk9XizYey0NwD79BcjdlAcBT6E
	 v+8KFucX9xCX5DQE862YPvk0qujjqRe+nFBPRbbEtOcJUafCOMc8kGnECfWCWc13R/3WR
	 7OmcyfnAmVSGc/4NKVfLVrUSJoPdtQB24Rma8m/37Tgtyn9mYiKRsEhu+DCCK0Id3WTSu
	 GNReDXhsJX06c6PGKNmjpWSXJYYkoSti/PzVCL1OL2rQC27epLUUmoJbAytkZLSusDE/5
	 J/bkwmoolcgg7faTFrsp1gcN4gyvExA3wCCoZxGrtxyL5V8BpvcZ0+R7MPbDd/G1LQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196388;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x3jzOQLigBho5J81n6LDGsmGn188K/UxRQeYxDtJpco=;
	b=NrVz9irEsKUNdTna5F7zAHjb4JB3Hi7V9AS9jdrLjmWHVXa+tDkn4h6cYZhqO//0xeBM
	 RNp1fUFA2sAugmsis+bb6J5m6ryBitGXGSTIb35dAVuvDxF9fSu+NVW3cXd1OWXprJJ4L
	 dSC9cqaZ0U2wNwwnVvQ5e58QNdYr8g+brARcGiSU1CfetWgCrfo1jfBvs5WgCG9Ed5xAy
	 eHrFqn6qvqnOMkOSLu6quUkVfSgaMJMl8Ez1Cdu58fPcigi9vN3haF7H46RbzBYxxuapV
	 OoDeVaa4KWJzlvhFYORLlB5UVmc3x6vLPaEyP5X4CVndgYOMG53LVar4lTSPMF0kimA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYOKGccd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FD5606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYOKGccd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2591F0089F;
	Mon,  9 Nov 2026 03:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794196387;
	bh=x3jzOQLigBho5J81n6LDGsmGn188K/UxRQeYxDtJpco=;
	h=From:To:Cc:Subject:Date;
	b=WYOKGccdywTOi6ZOtyYWivG+OljXS7NXE5L8aIISDTcdv8ZhfJpmfojLQhN+W0nbR
	 X9LJ8j0q/tqnV1UYIxJQ9R38MdBNWWP5tuNiRpNycXZCz8ps39o7TF7SS90ndcOt/0
	 zCCSG15QoM+6ShhTTCUUAawXc+pbLnJZ1DzzMgvOFjYx3kqr9fPxBo4A/r0ggWLI6o
	 mfOVtkK7727wS0Yk2Ch+QHLFtehyz9eZzSCvj7H5mYjrqFXF5Wd6fSMO09l4p99QM3
	 nL2xIrWr4BhBaj9nlLCa9NXDyjz+DKV8iDY7qVtZwzyPsIKZP8wZ4O/RBT2PlcYeuZ
	 3SG+0KgyM49Bg==
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
Subject: [PATCH 00/14] IIO: Ensure iio_trigger_poll() is of the device owned trigger.
Date: Mon,  9 Nov 2026 03:52:38 +0000
Message-ID: <20261109035252.1295926-1-jic23@kernel.org>
X-Mailer: git-send-email 2.56.0
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

The primary aim here is to ensure a clean layering between the two sides
of the trigger / pollfunc (push to buffers) divide.  The caller of
iio_trigger_poll() and iio_trigger_poll_nested() should be using data
relevant to the trigger, not iio_dev->trig which is the
current_trigger for the device. Most drivers got this layering right,
but not this set!

This is also step 1 in a plan to make iio_dev->trig opaque allowing
more control of how it is assigned and avoiding traps around lifetimes.

Includes one precursor fix that has been broken long enough I think
we can just merge it via the slow path along with the rest of these.

Jonathan Cameron (14):
  iio: accel: mma8452: unregister own trigger rather than current one
  iio: accel: mma8452: poll own trigger from interrupt handler
  iio: adc: max1027: poll own trigger from interrupt handler
  iio: adc: ti-ads1119: poll own trigger from interrupt handler
  iio: adc: mxs-lradc-adc: poll own trigger from interrupt handler
  iio: adc: at91-sama5d2: poll own trigger on data ready interrupt
  iio: light: vl6180: poll own trigger from interrupt handler
  iio: proximity: vl53l0x-i2c: poll own trigger from interrupt handler
  iio: adc: ad4691: poll own trigger from interrupt handler
  iio: chemical: scd30: poll own trigger from interrupt handler
  iio: proximity: vl53l1x-i2c: poll own trigger from interrupt handler
  iio: proximity: irsd200: poll own trigger from interrupt handler
  iio: light: vcnl4000: poll own trigger from interrupt handler
  iio: adc: at91_adc: poll the enabled trigger from interrupt handler

 drivers/iio/accel/mma8452.c         | 11 ++++++++---
 drivers/iio/adc/ad4691.c            |  4 +++-
 drivers/iio/adc/at91-sama5d2_adc.c  |  2 +-
 drivers/iio/adc/at91_adc.c          |  6 ++++--
 drivers/iio/adc/max1027.c           |  2 +-
 drivers/iio/adc/mxs-lradc-adc.c     |  2 +-
 drivers/iio/adc/ti-ads1119.c        |  2 +-
 drivers/iio/chemical/scd30.h        |  2 ++
 drivers/iio/chemical/scd30_core.c   |  4 +++-
 drivers/iio/light/vcnl4000.c        |  4 +++-
 drivers/iio/light/vl6180.c          |  2 +-
 drivers/iio/proximity/irsd200.c     |  4 +++-
 drivers/iio/proximity/vl53l0x-i2c.c |  2 +-
 drivers/iio/proximity/vl53l1x-i2c.c |  4 +++-
 14 files changed, 35 insertions(+), 16 deletions(-)

-- 
2.56.0

