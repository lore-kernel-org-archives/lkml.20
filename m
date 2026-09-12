Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2F247DD4A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219572; cv=none; b=EnE1nWpniC4iuPljtTn71yGmb81R0f8xtGGWgj3e28pDNcOMZ+DbxwiwkX4HoW//TX5xkT1fH1Z44zxXYDWBvJiQU3r1DbcNzWl1XfJfCzyL58YzAJt9UOhrDxqivv7W8Jg1goauaGHkttUWhYsv3E6QXWhsaWQ394OutO40t0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219572; c=relaxed/simple;
	bh=7CE8YwlilBd1VM+J4eCukboYD8vi5XXt1Ru2qxPspMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVX2kpljklw8SAQjHtB6a/pHUmZvGRFs2DHjkypWwaKvO5Gk8MJgT6H9a4f8iQKGgJ6hR5w3axac3LiZEN5s584YJghlW2WuF/NTkWQ2kyXh64dMwkA/1mo+ipyzLbFCb6V0p/cFkRJGjBPPPf0S0nwF22tSpRk4fl0KxJV7yjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsSPNRXH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsSPNRXH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso554973f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219569; x=1789824369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gF6cpu2FDuNRXYtVifufQ0jbLZ5i7EeoWxGFjWtrGA4=;
        b=QsSPNRXHO3sNcUQcvzjcsDydz/thwet6ipyU+WsKG9HetIrkV1U+5XXooO5xyRSl+G
         6H5WJG65U39D84va9vfQ7BvzDkLft3gvSQLGE6yqzk0R096L7s1xWcFmKEUYkKS+7ySM
         fhfnknkzC0+ZU3bka8d4cI7m9De9YA8m1iSYcNjlW+xf+95+4wB5tuT4Lyebw+E6CwEg
         W2Ru7o7tVVH0hOlRh2C4QD/cvamqWZGqwj95EItZjW739xlL1Em+6Zzx1KJbxhLs7HwI
         lsgLXZUc5ggpdmJ5sQz/AtAhg1lGOExmw9rduRa5eEwhv9CFrSvl9CPuU3TJrQlfB06t
         tiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219569; x=1789824369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gF6cpu2FDuNRXYtVifufQ0jbLZ5i7EeoWxGFjWtrGA4=;
        b=C9XJi+t3jX1SJYBtJmEE8IXHXmU0pdDeYtA7S9mu/bOD8Qfnfi41Zsms8Exn/Qie8G
         o09ldvvsayfpca81nS4Vh/Oq+02WbC4L6v3deX+8rvGSuanbu1Cydp2zBSjbef/ZPdik
         35JHCtBP3VIyI3U0cdjtzQ+dhS7tEVmMZT56Io/I82ORPcMOCLBvq8CdOrzjRwf8AZna
         6bYlN5HD4i3R4gl9NFRMcR5px33JUre/6dI7WTj/4A5FY5x7pYCWphWWfI29h36vTiOL
         /4en0bOBAV6kms3sVlbxDwTigr7vnZbnH3LSBO/h5feDm8/Gy/LdNIs+UpSLFxoSDMW6
         sZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjU/KeneDr6OsyUE6Su9ZLeQR94MwShMEqlktoH367riQc1yroDGoQuLM9IKHOJhj4VhgOsor+ANS3tMI=@vger.kernel.org
X-Gm-Message-State: AFuF++kO47kLP8v3aJ899ceLQfYus8NvX1/45rjrRmruFZzdF4jLjfmS
	sFK+cgYaBK5FWvE1bxxsSRlJQ0GHysYGudOgRTd9lldo44eVUm86Tya0
X-Gm-Gg: AYBFou0mv1B1UntnpfPfObv0Wj7uDr6n1V0Tv+ZUpuNWuqdMG4XYwBW3o0NSRJkRXDi
	HlaSK7Z68f1afChxbLW28mMCL2cHp2p3l8qiztKXFOw+2o6PLODM+JIt8/qC5S+CVgCGEMyXN3G
	DUODJ6rEl46RzkgO1d8rFzagLyRwLQnlKlaN+apgWtaTg2ZJ908Z1rwRlxCY/Z4AmziInrQjWdZ
	Y8823+lQBVzTkdKaqnwQ5DPhrMCjyMYwZDkQ/yoNKHMMyn9xLFzj9mMSm4YW/+qvbSv6CazW1en
	GfVH0ZV0id5ag5uWRCFlG4ZqxEph/ijXYMY8NzbSwufpRDRRS+bdTNPgN84pcs5tPOduh6ho9wm
	YffnJsNi2H2aXk+SfFEzVbcZ3RWS2k/yeUR05Z14hhjTtmZOMosghtE0oVQs0M2DvR9Z1xW7Lm5
	O+R+TTMRKB4qVviEWsCvJQ/XrpPG7FETHDnoLQGj4eQun/HcEFqoU/KiVnx/ZiP81Jqyj4nHT8t
	oRIbY39Nm8tR/98p32MjMENqxrh
X-Received: by 2002:adf:f9d2:0:b0:486:e6a2:2d7c with SMTP id ffacd0b85a97d-486eb31b1ccmr15058844f8f.15.1789219568859;
        Sat, 12 Sep 2026 06:26:08 -0700 (PDT)
Received: from fedora ([154.182.88.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm12684503f8f.15.2026.09.12.06.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:26:08 -0700 (PDT)
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
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v6 3/3] staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read
Date: Sat, 12 Sep 2026 16:25:17 +0300
Message-ID: <20260912132517.55686-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stack buffers are unsafe for DMA with VMAP_STACK enabled because
they are not physically contiguous and can share cache lines. This
causes data corruption.

Fix this by using a dedicated rx_buf aligned with IIO_DMA_MINALIGN
in the device state structure to ensure cache coherency. This also
corrects the size argument in spi_read() to match the new buffer.

Fixes: 7024425db64a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index acf26c5a267a..2fd2d6796603 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -53,6 +53,7 @@ struct ad7816_chip_info {
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
 	struct mutex lock; /* protect device state during SPI transfers */
+	__be16 rx_buf __aligned(IIO_DMA_MINALIGN);
 };
 
 enum ad7816_type {
@@ -68,7 +69,6 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
-	__be16 buf;
 
 	guard(mutex)(&chip->lock);
 
@@ -96,13 +96,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
+	ret = spi_read(spi_dev, &chip->rx_buf, sizeof(chip->rx_buf));
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI data read error\n");
 		return ret;
 	}
 
-	*data = be16_to_cpu(buf);
+	*data = be16_to_cpu(chip->rx_buf);
 
 	return ret;
 }
-- 
2.54.0

