Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76BA357D10
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538500; cv=none; b=TDmEnnDInGya3WrTESPS4Vlg7ScJ0jb1gc46WqINEmd15rBa3ZqIEDTSBl6twEAmWmI+O2cqHlC/cIs/hXoo/DNWcSLY5nI28uqG3HlfGxCNd/R+9Enoi9nXaHnW8aBYYP4dpdGNDAsaBTm8UazxNLlw/hGqz15Us03P169AcNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538500; c=relaxed/simple;
	bh=2Orkx/0NqOZ8km/RXqu4dfyHpd6v/U3IDJ3+BOniJQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ra8PD94XVdqulUH+ZYUcSIT2F3P57STJHwXpn0SnftZbmwBd1TXoqOu1klvm+jTLmpaw+gc9qwGcn3DuXvXJG4G/3+gKueEeRvnzyxrRwGZ0bnNulXAZZ/Igtu3g3fIq2K17r5QccDf5ALG1Fkd0RwrIo9bBkvZuHOgctnoBfVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flLMuHXS; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flLMuHXS"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-39647184c73so1510096a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789538498; x=1790143298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJ6nkhLgAEtz5X/dBEi4fkLEohVcqre5Sm/6ZumIFn8=;
        b=flLMuHXSOD/zg1Vapzhp9UKzusQ8Ge4s9ybg+vkIUE+t246JiqJKz+nQaBimQiTF4q
         QXvZNP5w9szjfNzLbHBK3EqW3dsfQs3BTn/K+bkcil8hFnsJhUfQVwYppUQj413gEqvL
         EJn2yR907VYDbomAFjMZj8lHT64TB726KX7D2o52GemR9c/D/9Z8aaMLvaStqLHfp97H
         +JtxuaRfvE9PCu9YVT0ron2uvRRNLOW0XWMDc3bItVGvEtrPbL+y7rxlwFvX2AVCSF7J
         P4eGxNnvnTJu/VddevjruktryLwJZqDg62oPl+lv/nRpRiA7ySD8hvF3i3p6K9P1dxBM
         KPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538498; x=1790143298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJ6nkhLgAEtz5X/dBEi4fkLEohVcqre5Sm/6ZumIFn8=;
        b=e1u8vgXOtw/pVqzjQcBP7F4LH8rE7sTgUIMtdWll3OymAFLARCPvHCWhtDhQgOIseN
         GILFTRgR0e14BNr97VCEeBJGao9WY654lE/fTurm/6DXsXAic0ho30nYAaDhyIHT0g25
         BDxaEyXBtTRolf78qQhpkETp3u1DrtVm9MyyD1Ws45r7GZk/HBUrbngzeOBM7dqooKxo
         tHjC7nxjDiRaZo/jwJKD4hrJxmKHeO1oXRJ36CI6hXh0Dnz+6Eya/7+sbNI9ZlH/RSfo
         WmsyuGB/FbJUVGatVpX2mMddjsq+6qQrU5aswnaeAVfNHF5mf3dMn6ErjEluWOCCrkm6
         /aJQ==
X-Forwarded-Encrypted: i=1; AKwUvByR1aS/kQzofVlLo2abWTokW7hMBh+jNJM07uGy4sHC5QvPpIT+Bg0fScKBHX+AyySgSG5/3EitPNvQ4vA=@vger.kernel.org
X-Gm-Message-State: AFuF++nZWytkm8ZMes+2yd0of/vf1KmqpnGwD16zijTBGX1g3ddg7nRz
	LIPo6cSGcJ5wc0NtpbB10IXKYB6kBih8KPLRler2cDmLs9wzBy8TEuze
X-Gm-Gg: AYBFou11OevY+zVZ+I2HzZmuRfQwBfoYw+H5ARdc1qszrVpurANc8NTrct4SdEEYmMj
	8NqsI8ZPoNQVsg2YXeKyBFTu0nlXqyoMYR4TWJPRjjOKM7Hx2nrk+ryynjPP9fUmv0pUEOaWY7x
	CL8VMFRmOlJFiXEA891JYXjn2ZMTtY+/FELQcbDRX+2R4WGi/JGDTg+ZBIEKnqi2SALYtAwBaHs
	E9OAWmilalRBLkvoOKaetXhxDI1ngWtUVZz7bHW36E65Wxt/7KJ1Cgjgf/PpBe46S7PXXl/S9TI
	L/g6tViTocAGrtgKrWgfR+IarP1/6fQipKOWPgj77v2GWL+/xZNMgrCEjf0/WACb7hH1r+V4Rqn
	vncSnEd/jdGEYTAXkZj2EpJvpv7iVaf1NneF9JjFMEyQD7ylBR2tgVnIL/pgWPOBdvUYafAFz46
	C+3Z7px8llXyjPRjsHXlvLQCRDGsrJC9P0XCI1OAMQPjZqbCQtO5pWxmMF2QSOjnL7MeT9cjndP
	sT/1dBd2ZlouLisrS8=
X-Received: by 2002:a17:90b:5706:b0:39e:1a96:bbb0 with SMTP id 98e67ed59e1d1-39e1a96d303mr2976100a91.29.1789538497871;
        Tue, 15 Sep 2026 23:01:37 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm5150929eec.14.2026.09.15.23.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:01:37 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: linux-iio@vger.kernel.org,
	linux@analog.com,
	linux-kernel@vger.kernel.org
Cc: Shehryar Ahmad <shehryar.amd@gmail.com>,
	stable@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v3 1/7] iio: accel: adis16201: fix channel order for buffer mode
Date: Wed, 16 Sep 2026 10:55:31 +0500
Message-ID: <20260916055547.15206-2-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916055547.15206-1-shehryar.amd@gmail.com>
References: <20260916055547.15206-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reshuffle adis16201_channels to ascending scan_index order to avoid data
corruption during IIO core demultiplexing since the ADIS driver builds
the buffer in channel array order, while the IIO core demultiplexes it
in scan_index order.

This changes the raw buffer byte layout for existing adis16201 users
reading buffered data directly.

Fixes: 591298e54cea ("Staging: iio: accel: adis16201: Move adis16201 driver out of staging")
Cc: stable@vger.kernel.org
Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index ba0f97944..834714fb9 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -202,19 +202,19 @@ static int adis16201_write_raw(struct iio_dev *indio_dev,
 }
 
 static const struct iio_chan_spec adis16201_channels[] = {
-	ADIS_SUPPLY_CHAN(ADIS16201_SUPPLY_OUT_REG, ADIS16201_SCAN_SUPPLY, 0,
-			 12),
-	ADIS_TEMP_CHAN(ADIS16201_TEMP_OUT_REG, ADIS16201_SCAN_TEMP, 0, 12),
 	ADIS_ACCEL_CHAN(X, ADIS16201_XACCL_OUT_REG, ADIS16201_SCAN_ACC_X,
 			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
 	ADIS_ACCEL_CHAN(Y, ADIS16201_YACCL_OUT_REG, ADIS16201_SCAN_ACC_Y,
 			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
-	ADIS_AUX_ADC_CHAN(ADIS16201_AUX_ADC_REG, ADIS16201_SCAN_AUX_ADC, 0, 12),
 	ADIS_INCLI_CHAN(X, ADIS16201_XINCL_OUT_REG, ADIS16201_SCAN_INCLI_X,
 			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 12),
 	ADIS_INCLI_CHAN(Y, ADIS16201_YINCL_OUT_REG, ADIS16201_SCAN_INCLI_Y,
 			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 12),
-	IIO_CHAN_SOFT_TIMESTAMP(7)
+	ADIS_SUPPLY_CHAN(ADIS16201_SUPPLY_OUT_REG, ADIS16201_SCAN_SUPPLY, 0,
+			 12),
+	ADIS_AUX_ADC_CHAN(ADIS16201_AUX_ADC_REG, ADIS16201_SCAN_AUX_ADC, 0, 12),
+	ADIS_TEMP_CHAN(ADIS16201_TEMP_OUT_REG, ADIS16201_SCAN_TEMP, 0, 12),
+	IIO_CHAN_SOFT_TIMESTAMP(7),
 };
 
 static const struct iio_info adis16201_info = {
-- 
2.43.0

