Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7CF431E65
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615240; cv=none; b=VROlGvpUnu7mqBDE3UaAr5YtxQFfuTia+kcQKr9fk4HIvqaI8q1Se6sXwub9AH3MP31a3dVLMa0o8+A8HQhy6McuXDIG1AaF/Okt1WLRTum3ro5Xc7blfeAerPcc53diqVy3rhJFpsxLLZK/i0pPK2cCQhHaNGo/SiPc0Hks74Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615240; c=relaxed/simple;
	bh=KCiU9H7oAsfJb+wOCJGHY+ftuBOqit3svB97TjTz8Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPphQpnNnBIcDt0rGPdUqe0vX/ejISGGeMO9lIJyScZyNZh2wLiStVSiQlNTKUGjB3av9JERuaLdIJhrxLHunuiHZUhVoeVA2b1mLeJAWwSGk9AoLIsoNZy3zSDUnhCLu/dNUH7O02C47TNemeJI++W92UsXeFINBS0w0K+2BI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjYTGa9a; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjYTGa9a"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so344598c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615237; x=1792220037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbdiTE9cW05Ir8fGL9rCBVCwwyaDuqPvBVhKoWrKJGI=;
        b=cjYTGa9ae2WwjSfLPM3nmEiW8Okrdn2JhaFUWC3E8pr0WU+tSQAV/wJOFQdve0S68W
         Dbz7g7S0LH5INJxbrNsp33XSFkfO06LaaMQcvuCHFSn1Xld12eR/btSQHtOjVVVMAj7s
         A9kZ1pUcdjqmk/PfGGnQV3p524U2sWA97CYvN4Lvh85YNLhKaUBF2vlxXAnhvuSKY0xy
         UPqWE5z/Ml0wjdL1KyuodYKDuaG/PhMVmmbnO821/xtA3kjBt83xvNkvNer437bLOEvr
         oFMmgaEOHFkYgNTx4y/FOubxyy3KyTvL7Hf2pZotjwn5HwJMiefysPj6pC5iPFb/WaCG
         +DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615237; x=1792220037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbdiTE9cW05Ir8fGL9rCBVCwwyaDuqPvBVhKoWrKJGI=;
        b=Y56DpfhTF5Y2n6cRtnULQ0WU3XvR72dE2XWpuNwGvuJg+UP9zStX7otFvssC1rMgbW
         GM7tl2ZJX8LX2MEkV/DzCrLSyRgws2SGoxOTt5mrsRlWLTlZVPfU4xpSHl5movOV3VZ3
         Qqc4XS/TqSzTmzRJvSrw5WOBtWxbLwmLgegvsGOSLF+YZPbp6Zh2W2bAoOEIiH6PkyDE
         srU3riVnZyNrD4zZLz8ad8L5iegar6IuAYSqr/a81fMWpB16l2KZnrUMqPJQJ1s/nv3p
         9RL8zKDug3XCE9Lm4ye9GQMpo5pueqlTV3EQuj3SNNr7vTe7BXvbAtW4JFxeR1woZl3D
         5dcA==
X-Forwarded-Encrypted: i=1; AKwUvByQXuUicp2avcN71bVmS4d8KcBAzcKC0MGoI+ZL7pSVqAaw+IR9wjN9+UcpMXCfhjSeXJC6nkgmV85LYc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuyrn+OLt3HI/d10acM6FhxjTJQT/Du5Q5H553TrraBr4ZfFIo
	oV6iye6FsQaRlfHLcWjveufc/LtOdQefh2NqXdE70Ksr1F6j2aeErKm2
X-Gm-Gg: AYBFou2zU1KFnifZ+vcjqmFCLAxxzXhn76W8+maolDHXt9Y0jEIMKb42ok1PUWut/dK
	OQvxJfeqFtUdH7yw7Lxx31qFZjSPZ25PORwfx3BVWuiVNGU2IKWyRLOagdWFelFUngq00CvB1w0
	hmRiOeqfkb2hNzx34wIf/mWpHaQRnGGPNzBZlH3nxkiGTgszsC6nCW7406KYpMb9zzwT1QEXAxz
	+7gLt7enSAXs0KV2ZX47qDzPbCAc+0jXKYHlaws+0UZI2+0FDjVbkMQ8Bds3OSm9O6xsURpPOtK
	A/iRWB5a9FgkkbYHB/x0tYGSDcuEO1J21uhigwAX5FboFVsDgp1gwO7dzCIW8rtroSSFopjGGMD
	yLJVKm61OqBT3difHOll+kiHlWACubYZVPOYfRDzjWi+tuKDzcTcBKN8IeQ4I7V7+m5iY5969HS
	je4xdv9jqBa8AIsayHW7JvX8ZkJkYWeMK5z+Pr+sPUsnC9ee8BD+CAe4g3LNilXEXk/zhs2W5QR
	mMrzWQB1/Dh5nrEZJ6zjHtfsmTlwfUqHTcqiOY=
X-Received: by 2002:a05:701b:2906:b0:168:6ad8:e89e with SMTP id a92af1059eb24-16a63d21e08mr4178604c88.45.1791615236985;
        Fri, 09 Oct 2026 23:53:56 -0700 (PDT)
Received: from [192.168.100.70] (host-200-61-172-117.iplanisp.com.ar. [200.61.172.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm13009650eec.20.2026.10.09.23.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:53:56 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 10 Oct 2026 03:52:49 -0300
Subject: [PATCH v5 10/10] iio: adc: ti-ads1262: support common mode
 supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-ads126x-v5-10-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
In-Reply-To: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2778; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=KCiU9H7oAsfJb+wOCJGHY+ftuBOqit3svB97TjTz8Ps=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFknHzz77dK1n8X0pfahdSv6X2ZNUDC6qdJmevSzkITFY
 ueT6qprO0pZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiR0MYGVp+bharN+WTX/4s
 ojv93Ikti4vNp65V7q5kXlO4bavwg52MDL/yas4FZNqtWfwz4gu/jaHVATvLto7X04+62vjoHKl
 7zQoA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Enable common mode regulators. The usual configuration is to have our
own 'vbias' regulator connected internally as common mode voltage on the
AINCOM pin.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 5bb41b70353f..66a7fedfefde 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -241,6 +241,7 @@ struct ads1262 {
 	u32 rref_ohms[ADS1262_EXT_REF_COUNT][ADS1262_EXT_REF_COUNT];
 	int refp_uV[ADS1262_EXT_REF_COUNT];
 	int refn_uV[ADS1262_EXT_REF_COUNT];
+	int common_mode_uV[ADS1262_INPMUX_AINCOM + 1];
 	IIO_DECLARE_BUFFER_WITH_TS(__be32, scan_buffer,
 				   ADS1262_FW_CHANNEL_COUNT +
 				   ADS1262_MON_CHANNEL_COUNT);
@@ -690,6 +691,13 @@ static int ads1262_read_raw(struct iio_dev *indio_dev,
 						      scale * ADS1262_TEMP_SLOPE_uV_C);
 			iio_val_s64_decompose(offset, val, val2);
 
+			return IIO_VAL_INT_64;
+
+		case IIO_VOLTAGE:
+			offset = mul_u64_u64_div_u64(st->common_mode_uV[chan->channel2],
+						     NANO, scale);
+			iio_val_s64_decompose(offset, val, val2);
+
 			return IIO_VAL_INT_64;
 		default:
 			return -EOPNOTSUPP;
@@ -1123,6 +1131,28 @@ static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int ads1262_parse_common_mode_supplies(struct ads1262 *st)
+{
+	struct device *dev = &st->spi->dev;
+	char name[sizeof("aincom")];
+	int ret;
+
+	for (unsigned int i = 0; i <= ADS1262_INPMUX_AINCOM; i++) {
+		if (i < ADS1262_INPMUX_AINCOM)
+			scnprintf(name, sizeof(name), "ain%u", i);
+		else
+			scnprintf(name, sizeof(name), "aincom");
+
+		ret = devm_regulator_get_enable_read_voltage(dev, name);
+		if (ret < 0 && ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to get common mode supply: %s\n", name);
+		st->common_mode_uV[i] = ret != -ENODEV ? ret : 0;
+	}
+
+	return 0;
+}
+
 static int ads1262_vbias_enable(struct regulator_dev *rdev)
 {
 	struct ads1262 *st = rdev_get_drvdata(rdev);
@@ -1876,6 +1906,9 @@ static int ads1262_parse_channels(struct iio_dev *indio_dev)
 		spec->info_mask_separate_available = BIT(IIO_CHAN_INFO_SAMP_FREQ) |
 						     BIT(IIO_CHAN_INFO_SCALE);
 
+		if (!chan->is_resistance && !spec->differential)
+			spec->info_mask_separate |= BIT(IIO_CHAN_INFO_OFFSET);
+
 		i++;
 	}
 
@@ -2027,6 +2060,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	ret = ads1262_parse_common_mode_supplies(st);
+	if (ret)
+		return ret;
+
 	ret = ads1262_populate_tables(indio_dev);
 	if (ret)
 		return ret;

-- 
2.55.0

