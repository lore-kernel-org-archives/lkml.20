Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0538236E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694997; cv=none; b=eV8DVAmS5zvm51ZwjMPWlJZw0efntAQe7c/v3LxCeLLDAiHROSMCmVcdZhqz43YsYdIMGnC63IdhMxhGUvb931LBBcxtTod6Ax3YgrqvBi7cNkErcAdZ25lLn9fnFOcXNs1CHYQobcw0LcOMslFwADenhnSiu27LvFxjJqPL1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694997; c=relaxed/simple;
	bh=Tgs81imXHXxl5PUz46cTacwZvL65MXU8w2OLv0AdJH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQls/mzXZMXU4cKOTQxeKTVW6LF0SXZBtcM4jMbxn6/AxSccsRKo5GoP0gs6LkNLeRBJvwoqTMgqU98lHnLQiBUQqhcASkqiOAzCFp1Y9+dj8iKbM6jeTSF+bfZ4FhIuVxtfBwFPzjZtiYWeyQvaZ+JQsQZvcXo+Ie/s6Sa2Nmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5oJ9LOG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5oJ9LOG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49557167508so30753815e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788694994; x=1789299794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kt+nixPnxV+vJED7IjIV2XXQGlXwwe0QJtiMVPgU48=;
        b=W5oJ9LOGDiQeEod7fUdyToNv9hRSbM1NlUGq2bWQZtOwZ2LENjSnybCJjQ6tZ1znhM
         eqNlNNP9n1uN32okJ+NvB2N74f5/Xn0cmCQgB6mMPTdPu93aM057xILVd9GFPb9X56sj
         wEP+FLPPQ3wWNcQYde8265lFEi4yYVDiNoFlrt4DZeqtcYHIQxuRy55zm1i4U3hCjKss
         RZdMNNvT66NXmo5gEouTqi2KYJOKS/IfQVUky3IWeBfv2EQtQ2vdZtMgOkF9pZBk/2Rj
         O6h9FY01J3TQlOfZovq+ixqJbhIr/0P+xryEzLs7AEnt6Rf713jJd5oWv/iP91vJwzAh
         iBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788694994; x=1789299794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kt+nixPnxV+vJED7IjIV2XXQGlXwwe0QJtiMVPgU48=;
        b=NfVIkVGF13G9Ubr998TDHnx3dwvpWl9cTn43NEiKSpH8+8qyGZ4lw/mTHkh4+sNgRs
         nxEU75XynbZGYlG6xbCnsGXqHHIWhxWB7Gmenwp8iN7XccCTYBE9I+5ToNDUZgQn4Zt5
         lelCfB4OWiQlev//QH9uY5mjFjP5segngUxtpmvoOeM3+TwqT4gM7uBbUP64ZWf5TkLw
         PZqyqPzRpkAZXmaVLCF9ib4wxHh5ycpkW3gqHvyrshbNRCg+JMG89g/AB3h1p243ZZWa
         VYrJLB+o25xLiMr7cZckQYjzhOu3zkWBG9x5AzOs2cMSMFd77wLkmLNa4SYbXvzBfIvy
         3K5w==
X-Forwarded-Encrypted: i=1; AKwUvByyS3UAybMrSUXrpg8/r04AtiT16pZ3waWPjtCFS9hSeR94F+QNcxJSfjrG1ceuVmV5FB7bdy8gBfzRU8c=@vger.kernel.org
X-Gm-Message-State: AFuF++ntxUc/ZvP5vFp3mWBdbDUpaaVO8R8uC2SE4Ip34mbONwdfRTyE
	wo+KydBGzOpFohcDz01FdEyPSRIjnnJXtX4pofr0JiG3FtH37giav6p6
X-Gm-Gg: AYBFou3HcU0qCS7FxdX2w1L36YRDCp3dK00UbGOl7hCm/indcsAfp5uiZDDXeQJjROy
	otNEIeUK2EvgBET8F1Db1YTJ3YlgXsRDl66fM2fe9pi8hiHuiMThSFvgqhgiyjLvwIfY4u0l12I
	T+R3ymPFONd4z/0dfHpiCVLKNP38tTXWMbBdv9sgUH952/YbxkSGrGdPn4QMxqn7r4YORNQIAo5
	VJ7YC1Srp9ZyXzxl357QQTgqq4ubypPFKNkdkutjxjSiF+8h28jpwII/aT6Yy2mQeiZ5zWsmh1F
	lxdeDqemgX9qoeW6b0xL5v3YcmtsEEGJAgqzrBe01LVQNpZwpEsrzQ8SaszbPjavgEbfLTmjv04
	M1YRfDgfaKkSHFzhIkMMwH0PH9k8Ombyq+j82efLToDvKGVKOsKMmis1CV3BQzrO+a+URH3yEgJ
	FwFKaV6hv2CgB7eYGE+HoPD4/vOpzvq0nBBGasAPOV8kSNP9R+nqoiUruNOLBrNaSlAnvEjyGsV
	GvPqM0T8exK0h+am3U=
X-Received: by 2002:a05:600c:6383:b0:49c:e88b:b7ce with SMTP id 5b1f17b1804b1-49cf823f147mr327098175e9.11.1788694993614;
        Sun, 06 Sep 2026 04:43:13 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm19356223f8f.22.2026.09.06.04.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:43:13 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 2/2] staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read
Date: Sun,  6 Sep 2026 14:40:49 +0300
Message-ID: <20260906114049.32912-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stack buffers are not guaranteed to be cache-coherent and must not
be used with SPI reads, which can trigger issues with VMAP_STACK.
Fix this by using a dedicated DMA-safe rx_buf aligned with
IIO_DMA_MINALIGN. Also, correct the sizeof() argument from *data
to chip->rx_buf to match the buffer size.

Fixes: 7024425db64a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index ab80b3a889bb..e14ae805f076 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -52,6 +52,8 @@ struct ad7816_chip_info {
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
+	struct mutex lock; /* protect device state during SPI transfers */
+	__be16 rx_buf __aligned(IIO_DMA_MINALIGN);
 };
 
 enum ad7816_type {
@@ -94,13 +96,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
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

