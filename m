Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB7245012
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895746; cv=none; b=f/Hw4X3accR7xhxfSBxGikKov/RIr3ZkPwiNS/BUTKfcjMp9DexxCWE9kxZL3t6o6+D+vgYUJ47bKkXNIGE/2WjG1Mpbzj74h5YCCLJXbb3lk7DNqXTNOw3KfLPxzCCu0bHkPOWtRSNS3wc23b2g7LoeduPR/RiRHokLzcXyjiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895746; c=relaxed/simple;
	bh=pNEWE+topqr1rhpsk0SHV4F0J9u5bipTgTSisRc3TTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uq5+wqb1xFdM5VH0MX1AVDcU/6CSUfw5rIp9THh7iYPNXca7hm7v0HaepTPHCVDlJksZQTZl32nFaRooTuP4sw/GG5u4TO88SOEBaH1bCm19GzJqpGT4/TpxZwD8euRdsEQfa3iYhxEkorbcQsv/wjwYtPohec/H0NwDkBkfAyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqDrx1VZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqDrx1VZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so9648185e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789895743; x=1790500543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E1cW/zqFKr4VTXcMiUtx8FkhmYjSXHe8PhD59Qq3qEY=;
        b=aqDrx1VZGfWBs3sStWEnlAHoZfvRe1XLEIcq2w7+rI7kMYBIldNLKc+qZoe42HQoA9
         6+CW0TCcLjcMancyDGRmax5WJjx+YvBS0KxVnO/5Fod0tZl5u59ptGNiOQxNwLgTqAIU
         P6JWXDiWUytAf9FstmUT4QHYBoj6+V5sLTdbTBn2iypfkXYXtm+WrEVcmdmkS9CkApfr
         GoiOAPajBtGqG/MPlo2COMGdvljK56fEaMxVeCqhgnFv4jI+qsV4v1Mg7xNTMp2ETnDF
         XWYaYHh/Yn23p54wD82ciSJS96jdHW6oioudYePxIXwbjOpykWqEbZAioGGfb6gAr2Fj
         f9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895743; x=1790500543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1cW/zqFKr4VTXcMiUtx8FkhmYjSXHe8PhD59Qq3qEY=;
        b=B9BktgLZl0BNBiLb1Rv8kW/6wiOMzapyQm+r9L7XZ8cw6xIPrLkMmPNmeegYwRcmPk
         SRmjoyqwVaEUp9ToP8la8C3Y/FlYElFYF2Ua6RfbvxxLqwpoO6+tBRqzVraxnBkPK/5w
         RhGrxVN0S4fMtN6DRfvUsrdjtn9rkZHYtD+CJABY/B4ht+g4cNF9KMOdm0RHuZvhM4L0
         x2r6jP+kV1HQt3O0TDK8Zbi16+gmaDyK4STP6ihSSy4I3lddGSv5bmzUOYEivT6B0Otv
         eD2mFCIHUEVe9vaRM+VrWcEUzDjJbebDGeASE3J+P7K4lrHB4q2QIkCYz7x+KCkRRaxM
         ioSw==
X-Forwarded-Encrypted: i=1; AKwUvByU+lEAbYDQJCfMGcfjms7oPY41KrrT8ux4jImGNKIehu1pqBFOsZ9hgmdcnTUHxSWReMLcQfPKTclKCq8=@vger.kernel.org
X-Gm-Message-State: AFuF++nN1arjdRQE0EJ/oDqKj21FRFFpSz/WvHKlczyg8iXCklPPwJVw
	VevTcgIXQvMRFz39ieg+ybzRxYwzcic8O4W0/i6EIcjk5/2XbhOgMUMc
X-Gm-Gg: AYBFou14YXBWD2roSgxNrZPaQCVdODsINjbQtwqJ2xc3hjY1DbAEqWl2jYUT88h45Y0
	xpZI05l+uCF+29p8A0HH38fycNzcXYos3d3w2JEHN/WSvddGvEqu6Yo8RuhtEqe8SxtwrqVzONB
	N37z3qIzuFrqKT75gi1Z8xwu/YwmdURYt9TgJ0BzZV2V0C6eWc+J4bZ6mP6RMdgmo5mOVJFLx6M
	/bR7Dg6fXPHrhSjPPcdSKO9bEnNLmXZTm6cJuPtbzWs38EXsWCJn6A2jPXcev1izNGgYDGvamIQ
	HMhoj+ukaH33b3I3nv2e6cuA8fytqSeHM2SLd9xKgq28MAmXi8tUdM3Xle94i1c603q+fFyhmM7
	fdct1kQduWS3aKD9ArY4FusVdz0S0Aaa+LWRJKm9MJw87izVBGCfCH/mqgOdi/rRaqImFDZFJVq
	T+ohr04NxqeSPx8m2hbJtHiVYHXbwpCqKOYMnbKNzBVHq9D5S557Trqth6jNol2rhLr2dDNOgWN
	1L91UyS+MCVuE72Xgoovg==
X-Received: by 2002:a05:600c:3586:b0:49e:7d69:83b7 with SMTP id 5b1f17b1804b1-49fc56f7376mr130239775e9.13.1789895742442;
        Sun, 20 Sep 2026 02:15:42 -0700 (PDT)
Received: from fedora ([154.182.123.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0ece6esm185953065e9.2.2026.09.20.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:15:41 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2] staging: iio: adc: ad7816: Protect sysfs attributes with mutex
Date: Sun, 20 Sep 2026 12:15:22 +0300
Message-ID: <20260920091522.15507-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs store functions (ad7816_store_mode and ad7816_store_channel)
modify the device state and toggle GPIO pins. If accessed concurrently
by userspace during an ongoing SPI transfer, this could corrupt the
SPI transaction.

Add the existing chip->lock guard to these functions to serialize
access and prevent race conditions.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v2:
- Added a blank line after guard(mutex) statements as requested by Joshua.
- Added Fixes tag as requested by Dan.
- Collected Reviewed-by tag from Joshua.

 drivers/staging/iio/adc/ad7816.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index f76f0215119a..2a15d7598abb 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -143,6 +143,8 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
+	guard(mutex)(&chip->lock);
+
 	if (strcmp(buf, "full") == 0) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
@@ -207,6 +209,8 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&chip->lock);
+
 	chip->channel_id = data;
 
 	return len;
-- 
2.54.0

