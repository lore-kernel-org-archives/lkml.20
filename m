Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C963CAA25
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869422; cv=none; b=f3MdSmSt0Jd2k9Q/y3xodlp8fkI3GH1iXDXQ1aE6T4S0ifEZMsYcJhvVwUaX7kWQqTY+qS3zlfTLjDTENZHKFN1s9xEhbZYfzj14OdSpoSfArdjIH66WIhZ778TFMXLj/ffKXWMAwcLKiAmGwR2FNXMNdy+QZ7QNzcWrNq4/NXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869422; c=relaxed/simple;
	bh=0jleKfSV4x8zSuizbp6O6ni4ujngh47YqjL22y19AbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYlP9+j/xb2Lp2msKHmKtWGSw9gF9LrfSfuXK92Vv1lQULLgLR3qVzzCQgDX4YY3Xa29OzveU55cPaRZZkfZBqIHUfWfRD7upGTuGmEvuiYifCM/pxJHaD0CpZcW+UOEAj6u/i2Isnvh4asvWr/xm+bKqaXEXL3fxSwi61ZwG5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d/gLtfZp; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d/gLtfZp"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f4cc6797b7so76124a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787869413; x=1788474213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEY7r8lduCT2nc4feVvWUral7NtsjaDfgRTqImYybck=;
        b=d/gLtfZpjDN8EUweE9273ciG25S1rmPJvfzppvj0Vus1u5l3PaRs3lpqLFwXEdAzEV
         5MN16BefFFNhZIwZBL4AI6erYIq943I31Gaeicc45s0Fu+uAjuM8odFHknbZMYDoPXAC
         K0dIBoHYiXP09f/LEF8jxDGER3JUfZRg0y5ehy7B1Rq+t2Jaq+6woUyxvJHmNzdHEsKB
         riZCGU4TjaQk6U2ySaaEpUjoDvm9xTuAehG9rmMiMtmYp3s6tm0tMOU3hhfW4nykgISV
         8umfZsTE6EdoP3yOzPDGtEvYetQr6TIUpAqmdNTvBUDvVFzcE4fK0YCS1SkdAa9bzgSZ
         VkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787869413; x=1788474213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEY7r8lduCT2nc4feVvWUral7NtsjaDfgRTqImYybck=;
        b=tOGvRk2HOsN2e+MdDZHIQdYI50TjgU+oSNEhhUY7eRoLhTC02+EUo/H5ay5s1Xk5rx
         /SS7K8PPZxbFUyTy2VeaL9xqCgAtq76j8PSJgR+OIs6+xA5QG0Oo8KWye+FrtK3Hm20j
         j9SxiOetbTABotDc9U3GibOD34YF0yE3qhgka5zPnGr3YtZHi0Ehsb5oXElUzy5KRA1L
         cAEYqaVWFvzqqJBOiADtrJJ+gokhQs3lBQltz/7TZcVIpNM62i8ieUMMdL+lKkNW/Jbf
         ksRoFsQSgjMkXA7DO08Nm4cmjvJEDtQ8zklI/irTCRuLIeLJJnEa8QCv5FpN8OnaXi8j
         CNxw==
X-Forwarded-Encrypted: i=1; AHgh+RqEV6+ZZe5kw0Mia8ApjKkGMcP39Y5DPUwiv1bC7yZe1AmB/y1eGqSD6r218JqTY6HAoQnFkqqRYJtlNOI=@vger.kernel.org
X-Gm-Message-State: AFuF++mZtae/cMLYiAxqiSs/1O4bcHrhHW0ruXfO2qZniz0QEGS6ysDj
	fIs9WzJVQDSghL7u9ltSi/KunTfn5N6JXA1IPIJKxegPGg/jyeywR8A9Bni/k3abbKE=
X-Gm-Gg: AR+sD13GqgJ7NwExlffqR4aypDEpDuHaiG2UqZlbKMLJiBqh7cwZB/pNYb0XdzXZBue
	jzCnHAft5TbBdWfyk30mwa7ERJ5UWj3x80jokDsYmkivcM88u2GcAcwAUx2YFGJmOf/KCb9pw6Z
	BVZRI+cc2u6Z/VVqnpG6qaLMBZLfP1M0oPATrSFG9w69aFpGm+Qx657FZxlbWF4eQ+/Lf4ijgvQ
	jtj+R2bHmf9rcz13R2zWnWxo1yHSgNeR9SVWC1sEcwPDzJjul+Ts73ArH8jbHtlOtfu+TgFBBBu
	beD2FQVLLyljB0jRM7u+e0meZy3ydr+Zy2C9xtaoUsiSlzA2jqeK4L13Nq4viuc8tnwO5XKIdEo
	WTrXy0W6LNiuUauLImK+2B1QNB+ckx+9+RJecCAV0uR1TrUZpLzT2S6Ik8mWX88nPD8gcNmtJ1Z
	8ym+Jl08Xh5+2+Ef/GhNF9E9gfiJ+/gVPgoSde4KVavkzLEPbvVZ68Gc7B0HVntXDI7w==
X-Received: by 2002:a05:6820:180d:b0:6b0:589e:42f4 with SMTP id 006d021491bc7-6b1c66b745cmr2087523eaf.20.1787869412938;
        Thu, 27 Aug 2026 15:23:32 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d288:6f77:e285:6925])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46736445d6csm3176880fac.2.2026.08.27.15.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 15:23:32 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Thu, 27 Aug 2026 17:22:54 -0500
Subject: [PATCH v4 2/3] iio: adc: ti-ads112c14: create data read helper
 functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-2-1e51a6e20a69@baylibre.com>
References: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-0-1e51a6e20a69@baylibre.com>
In-Reply-To: <20260827-iio-adc-ti-ads112c14-continuous-mode-v4-0-1e51a6e20a69@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=0jleKfSV4x8zSuizbp6O6ni4ujngh47YqjL22y19AbA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqkLjRt+57QHCBq9DY1dUxKl9CAbewfpRgKexdv
 ATvT2wVQuOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCapC40QAKCRDCzCAB/wGP
 wG1rB/4/YNCn57DiCj4OkZtFS5CtosxGX9k49ZBaandtp7f/c5scfN6rjqMEVPYLN9phPgMJbwt
 PddvBwQNGNA1EHRDaXztfOgXS9HKzzOlpr7TVft3t80+DscmbpnNoI8zKZz5tiYONnemJKZgtw4
 4F+HHBVAyDW+sD2ck2btRdnZECy0RIP7dxNbgrSFQ499dPKFw8f/mRnGSd6lRf7EULMqP7DXOtK
 Hv5Z1CDaBcaTA7du0Xga9QrW6+MtC6rWOA1XLsI5IZjeutdv/oABHw7Fs4+sKeeHP01PieburaD
 aoCZm4ptT0JbA4POrRHgALL9fwoiYYIpl2snU60pVdp9lvr0
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

