Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D03B8413
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788215630; cv=none; b=WYR0UW5FDGC5ztmqWOBakwo/Yo8J+QDtvIsGkxpRTFZPRsy0PnQ0/rWA3WgmBM98M9gOpEeCZwmnVNcFBGrqQS4+5yUJnYLpjiLBnJxSEPtPQQJcOCokUF5+S19kGcqclsJznpWqZ2RMT3meXwazYL+46q8YiK5ib8D1iufSoFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788215630; c=relaxed/simple;
	bh=0jleKfSV4x8zSuizbp6O6ni4ujngh47YqjL22y19AbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwlrVEfhzRh5LTZQSGNMS/t9ii0bs1zUzavew2axhrE4h+twdhEa3CZMef/SAPin4A+XDWl3qgpW2ol6K1AgOVBijYDyn/bUqA6FioBDAFDzC9fwiMjPgl4MQmMmz6jc7JWJepQDFaXa4ARJGoGGI22dvyDC35yhKpnDnB/7fCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bcak9rcC; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bcak9rcC"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb6573bd52so3940947a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788215627; x=1788820427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEY7r8lduCT2nc4feVvWUral7NtsjaDfgRTqImYybck=;
        b=bcak9rcCdTn+FzUmIuL+onyCyoZfIKuzd4mIAhotwnzg0OMeMCYDDT37++oauu1bMW
         YgAmm+I8ZDY9weoMJ49My0xTBln8QsTj+PqlgYp7Cap+PShZ4/gOnja16Bk2rHOmSHu5
         iXM6K+TMnpP7wvy8zn5kV4pX8S9isMdoQtqmZDtRDAbBSek4QhBD2lIACFB4nBh/IAHA
         z1yEMc9ZxjugS7JF9R22Tk55o4+6dWcaquuvMVnrD8aWUB62W5HgOQTzpH2f21dwaNnV
         k9scCyGabIzhulGzoO0zPSfb2BlXia/yjy2oPlFaf65FO2VdrTZmCJO8JqkIxYqacBVC
         X28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788215627; x=1788820427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEY7r8lduCT2nc4feVvWUral7NtsjaDfgRTqImYybck=;
        b=Vw+NH3AC29uFkZ1KQHkXWA+wmhEbR+zCrvTnveztX5RnufG3VFL6Sh9BsnA4U2RsYr
         GBV2Ot1zQ9gPEZ1xne3fuFaCdMpekzlL8MqqJDDW64EhphZ/RXxOzUq0iFdnLdFL8hZB
         9MPtfLFqKt4iNP6ibJwLkv6FeOywFGXUI3/DF9sQ3MkCA4wlUD4DKmtXb1SxrHlRZjyg
         kecnWNlNf9P++VWnsWYrm/QKnUdoyU837Ywot4iPBP8JEQIBSBQSZGMn1hSCeQQ52x9s
         p2xpK/LYI1pGFvRyS6H/AJKPf0X6DR8vLGC6vpsQjMZ4d8hPkvd7g+oIipn1Wu1NA1hT
         2ugg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5H01As9RAQh8XmaQDiLLSxnSx4Qmjb+icYsjFJdRm3k02uiZD5Ws+xNvzQGuFz8IBrB00FbTEc3kWddY=@vger.kernel.org
X-Gm-Message-State: AFuF++lZbw/Tm6Z3xcSGErgKPVEiH4MVV99rY1fOM/X0FZaLwLBifNKO
	Z0oxj2sSCFjKoMVIfOJ9/sIeqKCK8B7/vFdei1LvczO4SIMr1E3yFhcbl1OG5QJeSeu/sr5EVLU
	3/8gH
X-Gm-Gg: AR+sD12WlO1eHkAu4NXAIE/3ZqpvRx5bzdajTbexAdTtGQ0qQa6rv4iqfgNdqKmW802
	EHm+andjz9jmQkefIKQDVaFBQoa5ozKtcG6gEcvsB6KaUVV56YXvhgQs8GpaHhqBvBwmTb2AVE7
	RiLEsHQp7NjNTudQVD2Tj7TBwZyGIDXfKuBCktNKrw5cz8+8bmz19Kp1fzb4NqtmfQmBnn5DFWD
	ZYSYeNZlCrKtQ3cHJ2h6R4ZMqbpRK4cTEvWi4LZGjLNEESLid977aqXoIbBHCtOBYKAGp6vw6Wr
	JKMLmGsICLcPYf8T8cSRbTys+E+JiPWW9vCmahzeMpdnT/b1p3iJvK9OQUVfmyijvSUEJ5L0dZF
	0+ngviKPoSzz9JmDXxTf9B1Xw4R0N/KnQLt89D2iuk790sHRD+MvNWeu0kzOkGQ1cpCcPfKJcPm
	6qN17yVb64YlqVW10+Sn/Ip4LBXIqBLbQeSF9yKVbTtgl0nLwG0rcvmSfgz0XqeLQE
X-Received: by 2002:a05:6830:2b0b:b0:7f4:daae:401d with SMTP id 46e09a7af769-7f6878a21f0mr5338278a34.8.1788215626889;
        Mon, 31 Aug 2026 15:33:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:778b:da9:a8a1:bc78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa7efe09sm9190551a34.11.2026.08.31.15.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:33:46 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Mon, 31 Aug 2026 17:33:06 -0500
Subject: [PATCH v5 2/3] iio: adc: ti-ads112c14: create data read helper
 functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-iio-adc-ti-ads112c14-continuous-mode-v5-2-76f80a04b94f@baylibre.com>
References: <20260831-iio-adc-ti-ads112c14-continuous-mode-v5-0-76f80a04b94f@baylibre.com>
In-Reply-To: <20260831-iio-adc-ti-ads112c14-continuous-mode-v5-0-76f80a04b94f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=0jleKfSV4x8zSuizbp6O6ni4ujngh47YqjL22y19AbA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqlgEx+aahE+cYocqs2efmRZVEAwCyLE4ueayOX
 YCZ4zl5g4uJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCapYBMQAKCRDCzCAB/wGP
 wAAKB/9xHTeXLzRpeOEtix20REwMw6zmGeJg51rZOWxL7X05ayKgnlN1M5Mh0juAwfUQS0UScTq
 +kNh7PBZiBAIFfX+mnxguDvtPNZdw0lEQNLTLm/FWnaw4qPQplpQwJUEJXY4u76ObGhIlAupSQ6
 IGBrnbcVmmPgSYNKymnSEDJRQP55cHd2g4CBaQoekfQ8zTrjyKwfKxZdIgYljZAUsKMdUqKda5Y
 9HtcQ7u2tDjFXjVOIgm1adYjVf/JqZD+aMQ0mLfYJWSd7dI1wLYRIo62VTDl21ZhdsGoTEUYMua
 M/p+gTs2+NhTPoEGzoeVyLos1aO5JhIJDheH5p7wg0X2VOhY
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Refactor a few bits of code into helper functions. These will be reused
when continuous mode support is added in a later patch.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads112c14.c | 51 +++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index 63b819339788..23f15be303fb 100644
--- a/drivers/iio/adc/ti-ads112c14.c
+++ b/drivers/iio/adc/ti-ads112c14.c
@@ -601,6 +601,32 @@ static int ads112c14_prepare_sys_mon_channel(struct ads112c14_data *data,
 	return 0;
 }
 
+static int ads112c14_prepare_channel(struct ads112c14_data *data,
+				     const struct iio_chan_spec *chan)
+{
+	if (chan->channel < ADS112C14_SYS_MON_CHANNEL_BASE)
+		return ads112c14_prepare_measurement_channel(data, chan);
+
+	return ads112c14_prepare_sys_mon_channel(data, chan);
+}
+
+static int ads112c14_scan_read(struct ads112c14_data *data, u8 *buf)
+{
+	struct i2c_client *client = to_i2c_client(regmap_get_device(data->regmap));
+	int ret;
+	u8 len;
+
+	len = BITS_TO_BYTES(data->chip_info->resolution_bits);
+	if (data->i2c_crc_enabled)
+		len += 1;
+
+	ret = i2c_smbus_read_i2c_block_data(client, ADS112C14_CMD_RDATA, len, buf);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int ads112c14_wait_for_conversion_irq(struct ads112c14_data *data)
 {
 	unsigned long remaining;
@@ -644,15 +670,9 @@ static int ads112c14_single_conversion(struct ads112c14_data *data,
 
 	guard(mutex)(&data->lock);
 
-	if (chan->channel < ADS112C14_SYS_MON_CHANNEL_BASE) {
-		ret = ads112c14_prepare_measurement_channel(data, chan);
-		if (ret)
-			return ret;
-	} else {
-		ret = ads112c14_prepare_sys_mon_channel(data, chan);
-		if (ret)
-			return ret;
-	}
+	ret = ads112c14_prepare_channel(data, chan);
+	if (ret)
+		return ret;
 
 	if (data->drdy_irq)
 		ret = ads112c14_wait_for_conversion_irq(data);
@@ -667,17 +687,8 @@ static int ads112c14_single_conversion(struct ads112c14_data *data,
 	 * with CRC errors, but rather leave it to userspace to decide what to
 	 * do.
 	 */
-	if (for_scan) {
-		u8 len = BITS_TO_BYTES(data->chip_info->resolution_bits) +
-			 (data->i2c_crc_enabled ? 1 : 0);
-
-		ret = i2c_smbus_read_i2c_block_data(client, ADS112C14_CMD_RDATA,
-						    len, buf);
-		if (ret < 0)
-			return ret;
-
-		return 0;
-	}
+	if (for_scan)
+		return ads112c14_scan_read(data, buf);
 
 	return ads112c14_i2c_read_bytes(client, ADS112C14_CMD_RDATA, buf,
 					BITS_TO_BYTES(data->chip_info->resolution_bits),

-- 
2.43.0

