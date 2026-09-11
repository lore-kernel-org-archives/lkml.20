Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6E427A03
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125062; cv=none; b=dory/1p0IeYUvBj8QQvwf/d/42Zg7GYNn5KXhuri/Jg3HtXeJVuxDHZUhldSNFS1dhXfr8g3IWZBctkf/CRHWLzRrrZSa3FwKnUaUICzUjvreufRjaCtFpFabR1zEhlw4UfHkBVbbuBE6Pg1y+FyN/9ThnrmJ4nZtojjGl2PtkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125062; c=relaxed/simple;
	bh=pJ4vj8BCmfF1V31tX/wZS7//jdxk6ExCWx5LYoQItFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkY1q7L7xAe5Rjnrxy9tBFhOsNZD0rzGEQ31MvYIVPyAfhZ7+IAn+c8e3dvwOqtSQsl5MTe7ZKNE7gS3RSBLhKNKSDfDcxJUfe9NPp9GUyg6gbtlpl5nzT0I9L1TEioiF8kkYZIYYViY5zch89HzBrssEYMDIzrDaE7KBAa+XQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caRQwJYU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caRQwJYU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso7192815e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125049; x=1789729849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWttpW5LjqZG6rptcoUTqVDa/t+6fdXdX2MvAK+JxuA=;
        b=caRQwJYU8TP/h0sqp5TVcK8EWyqETVDBiR+DJYpnFf9pHNpFpg1V3c4TY8IbMfE8IM
         zeVKPCHP3/jZEKnH2icgkHNqTmeKFv7UWMbrlpHlFaa/iQ28XM9lJZTEYjjw0bjQ7jXS
         hS9F1LQW1kV/ocjhUdwMbHfkTYyY/fyunl3GvmxIdjcYoi6JPoH/FwaW5Ddp3/iqmIqs
         dGG6qvHrEaQGOrrlffTE1Te41+9oDY/ePcGnAYuPt/3ikBiFzXE3JP2qaWNcy3vvrM05
         32hHOV9RJUqvozSnwxIGsIQgzFYq9gBzrpl7u7U16RUj7/i2T3yTWUevkf/zZoZSnnUa
         dyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125049; x=1789729849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWttpW5LjqZG6rptcoUTqVDa/t+6fdXdX2MvAK+JxuA=;
        b=UDi3tIF8AlhJlN5IZoS/wVDC05n3zCHiKV3ZTRTebfFS/wWyeElHY567fEZDAljsOA
         wqMKCx+wiEsZwbOWlRg1HOXmnp2dpVxXrwhkTWXpfl65hecZ1Lz7IP4QaEjdC9XI6PtO
         Cj9KghbAy/yKbV+HvxgHVuApJxpNk0d5lmFhgUnfS5KLlyrWIf9HXo2VisCOUHqjydyl
         976qKzRnHXLSVkdczAEKvPNamDF3ghNd25wppHgyByp29AibTqMo61bDvme1noei9GHF
         UAshRz7g5ZSnG802f8DulKFZH7Mti7RGANY6BJUTOJuieH98s/e8yeEboNeeCxY1fWv+
         55bg==
X-Forwarded-Encrypted: i=1; AKwUvByPOVTQnn4A++bpy7guG0ImJGREMDeT3jLx6rIMat5qP0N2B+HjD+Lg2e0XiOSi+Il9uWxI4gV8Q2MIWQc=@vger.kernel.org
X-Gm-Message-State: AFuF++mbDx/CHC5CbmX/iNmeXykN2iIFYarHUQeB53tKDF4diovRPiCN
	uq8zHCFwYu4XpJrm1XwISgrx38s9Cg0Nz2/qrjvXPjQ0MSd35OudFXWgoPGPeA==
X-Gm-Gg: AYBFou39x3hca1nC91Y4EABdSgu/ehwnsWiEC2NVnJ9q3dY6QjcWO7FxAvO62DLiOEq
	UNebVyHtUNqp3FrJ4Jzad5twBo2Ojc9y0ZwHZfiMjyST82jCxzcDwUlm5l3EfFi+tLXSoXvEtu4
	TuwAWwavi+fP210gSoshLqLvzvR3F3B2Z9Iqo2Jh8Ks1iD2Nm6xm+JgDZIVM/Oog/T7py0dFDlo
	hYH5t6iqOeyuv/d5RhU+DVVZHwBqReByCN4p31yJwnQUiFD0o/p2tGKku7e+KVg7VxmxzHIeNeK
	Em7nfr0FmdzkFleoxpfiGq+edt93/DpzU/Brir+Y6YdNYiuVo9yez82gNzf/RZteNuZMWoh+02T
	0+EhCLMt2E+tfZ210T4quouZwVH2pBtFYwu+Ep1vQPXLqpAiK//xeQm6DujF2XzKFqHovKbQ+SO
	uymYvuxLufRtLIQ682dPzGGxDX/54AXUeUdfsvOh/wnTvk5cV/zZBGtTipOTf5drd72Ci/2OoGK
	5zzG1lBxY2rAIbZtic=
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbff with SMTP id 5b1f17b1804b1-49e619c18a3mr42351175e9.22.1789125048251;
        Fri, 11 Sep 2026 04:10:48 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm66109065e9.8.2026.09.11.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:10:47 -0700 (PDT)
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
Subject: [PATCH v5 2/2] staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read
Date: Fri, 11 Sep 2026 14:04:56 +0300
Message-ID: <20260911110456.24873-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
References: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
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
in the device state structure to ensure cache coherency.

Fixes: 7024425db64a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index d0355763aa8f..19da164945c7 100644
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
-	ret = spi_read(spi_dev, &buf, sizeof(buf));
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

