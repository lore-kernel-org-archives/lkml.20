Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A257A17B425
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694970; cv=none; b=SkYevwg5z4vW4TmQnk5P07EXhpNnncaq5V0iG/oRv8WON+E2yvWQqggkE4RYDL8PABw5tAAtWzOgMnMiwvFYsS774Lrq9HU4xmKYO+HlRxfZrvT8suy/hRVP2J+NBxODHhL9zb8FocFRQcdKGKKCz/setanVVtfq2CYaUhgTSdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694970; c=relaxed/simple;
	bh=NIQQl+i9frKLvSCB+7kcoSU4oLwDtFg0IeJm24mSZqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0OPPX2lBfGKgC1XFsGZlViW9zUNT0Ydh9QSxhsLwRT9dW38xcaar7WU2AvauYFhtACyUgSi0BaT9MNAfCZSwObQoDZHmR9q5OLNM/GjUodzMIPSNtiIKjp+8oSNm4jqYHrKvyxJDNvn3L1VME/6l7NHX03xHf9Jldi8oVtQa64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALzEeLS2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALzEeLS2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e257a23aso1710408f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788694967; x=1789299767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bT/+VklbXB9D3LLWbRPzUjVHEWAbPJFAktyLnI06KDE=;
        b=ALzEeLS2A+kgS8TRj9q604puuXVaKrL8rRsDByZQDcCztimGft5KxcnhjdaWuzlvCL
         bIPxXwUJU+aKzFBOl/bPJI42pCYnMvMfk1rw3HjQx54Hc6M4l+iJuRjOkeL58t8VFnwa
         ckSL7K3RG0psz13smyf+QxGY1gOBaZoSJzytOGK0DdfWVnkJOmM3Rtw6lU6ywIAaCDNf
         G28RaUnLVstdJhXDdqWAWOD3tM4wHfUvxbBThwsp6YBbYwfpmvT6AjwKtL+PhrBSaTR6
         qcuQOc4qssHbtiIAvgAwj0ie1lzSkJMf0Al6PWOWCQUH14Evar4KUwT+UiC7QRoG0cze
         srGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788694967; x=1789299767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bT/+VklbXB9D3LLWbRPzUjVHEWAbPJFAktyLnI06KDE=;
        b=RL9UIIT4xoMTW8KR5l1xdEPiEQA8qbJvx4by2UI8WwyeXy9d1HJ+ZbqMgEJ50us3As
         Ll4tJlSEIL5RfMLv7k1/mX180y9HW1Ac7yxUhbrnsOqkCfARHQavvkyk9iiLRd8aB8Qt
         rmXGJDGqflscOJGbCVg1y00G/t6iSauT+tzWVLxoQ26SIMlDaTMxUnXd8uhjxXYytHUj
         NjZbH+Gs28HIR5xEn32JLNHBy2mXYA/L3GdmU5/GwueVoA0FZ8PTLxidv2VxBSdBRdd3
         t6r6emxLeR3mtZ7ELCnqtRGEi173Oy91Cbd/CqujATer1W8KJD+YHKT41GCMW+bSI5dU
         Cvsg==
X-Forwarded-Encrypted: i=1; AKwUvBziGVdd62uxQ/dNcAA49Xol06/ZDc5xBIgSbydC+0Edbrbjo+pg5ZDWfg565pe5zPDkwaRL2DUaGiKpV9A=@vger.kernel.org
X-Gm-Message-State: AFuF++mdPGBDHL4o3C4UOkBKCUYBTCCriHv+dpi9VpgPRrou24eI3prV
	RKCcxEsmQd0IZpmzF7g5vvXLkz6qGrmB0rCVdBfAAOvDWoUDcxlsUBzi
X-Gm-Gg: AYBFou01r85BqCg10Z3yCxylYlnnYOIsztZ1RzMz5pCH/y0/SSkgGeD3VjH+A++P8h/
	t09dKQjUU6N+Kyh2wPp31j8u/ej8s5x4i9MggGuHBP5V0kMCszDcx5ReVfGIxjSUvdTF1Yrj0hm
	ZS99yAzILAxmKijNvZER6IppLPYsIx4ZFXbahNNr35SHDNW0S2f83Bd8Lj1d7zFfdt3sHG7ExgK
	QsO7VJOONrsZJV93mD/vAa6LJPlC3EyBBmf30SQVuqA78O/ImJoM2iRXZTZSaK88VA3fJRSLmMW
	Rxdd66ydPXtDcwC1cGWlEkCJpJ2mPLTtDvq6kAKexzIn0pL5IlG6p5bXn8htk3q9B0rJnAx/VKs
	PyqOPN2cMrdl+kK7v7dGhr2VdLBxUll54Ajb0GabVKm7wlIYghvyeOjftYjlMKpA8stF30mkkNM
	ujqLln/5G2tYigVarXFvhTKqV4F55x4yxO2NQdVOEhIKTdV5gFSCro/9LHrsvU3MqZ1wHwIb+ol
	g2ia5ud
X-Received: by 2002:a05:6000:25c7:b0:485:8a46:b3ba with SMTP id ffacd0b85a97d-4858a46b4edmr16892697f8f.34.1788694966717;
        Sun, 06 Sep 2026 04:42:46 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm19356223f8f.22.2026.09.06.04.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:42:46 -0700 (PDT)
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
Subject: [PATCH v4 1/2] staging: iio: adc: ad7816: Serialize SPI read operations
Date: Sun,  6 Sep 2026 14:40:48 +0300
Message-ID: <20260906114049.32912-2-abdelnasserhussein11@gmail.com>
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

Add a mutex to serialize SPI read operations and prevent data corruption. Used guard(mutex) and devm_mutex_init() for safer and automatic cleanup.
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 0e32a2295990..ab80b3a889bb 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -14,6 +14,8 @@
 #include <linux/list.h>
 #include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/cleanup.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -65,7 +67,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
-	__be16 buf;
+
+	guard(mutex)(&chip->lock);
 
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
@@ -360,6 +363,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		return -ENOMEM;
 	chip = iio_priv(indio_dev);
 
+	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
+	if (ret)
+		return ret;
+
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
-- 
2.54.0

