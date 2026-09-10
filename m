Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46242BE95
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074883; cv=none; b=lMmBA8iMK6Yhqkyqy+dX2U+wsFC3CuHuF/BZE1LnFBfVinBwrb0c7oNvqa0Qe9EMLPyTpD0NuuHgIDegPQkAqyiBD4MmGPoudAQJ3JFH79h8GDIyzDMwu86ZkX/HrZVEMh+YaCFV5bxLZE4gGNWe67PqwEqVhUZu+OrpjHyhu14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074883; c=relaxed/simple;
	bh=yI4Hk3lgmAclykhu+CF4IfwMFXOwKo7xr12Yxb8s+vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4KeLKg2HUsYFsMH1IaWFpUac19Vw0YBq0hdfRdGgD5FBrxehmVkjZdl0OXpC6XyeAxCMYaVqsq0AKygj6/USWkcHE7sQU80+/bPo6ZMEqd82q3mAWY65GS3h61AvYzQQZmW/uohj/IfmpD9SGcqUDnqapyRupmmHnDmXASkpNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LUA4weC/; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LUA4weC/"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b381337e1fso326520b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789074873; x=1789679673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Lqb73MWiqVxTq8osVaR58AWy47UTsGolXWTeVg1RTI=;
        b=LUA4weC/0J2nvc/ZX7bYOQXDG+oXdIfkx12oJYBY6jGnGm9UzLIQfq6aJYKwuUB2v5
         KAvGS+xViroFsTlAsBWEJ0SuO6IVZcetpcyk/vxRZjTM9G/45vzDi4gH++KNAPaoJYCv
         lGNuAdrvdJImmRRF0OfkrtQfefLayB+XafQ6OMlv3SWyYa5xM3aLC3s/6AwCYCb2qM6g
         B5wwIoKSnLNUV13KQUkdmKoBslRLB2rGQujpPee3vkHuQoOHicJnE5F7rdwcqhYwSXAP
         GApU5Gl1eyBYJ1dW/zI393LMppp25HKpc5oPjqwSKm4Qh7TAyCotmcpvuCmJQEkMWSnw
         giTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074873; x=1789679673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Lqb73MWiqVxTq8osVaR58AWy47UTsGolXWTeVg1RTI=;
        b=nmpoQYCFsYJPCp8wBU8Ke1XviApkz+lvBDDy/qigeayqlk4TtILpBLqyhk1pgTc4cI
         N+BCTyTpY5o0n69kncoZW+p4isfv65oP/xzPQ9WEZTDG2g5pCoEqcBjIdjkYFz/V9rXA
         WIdtKJjSZ6syMlyQJvgFNmG9hkJWI+0Bz2cy50JZiDFiJgLUqyIpG0QxxX/34XHureuj
         y9ivw8hGdcXe/82p7cuRyfJzE0lshUPV8cbwU/1UpICAY83ASyzmJqSIrtVntf6WWDuK
         xADNyXtGmvs4+0o8EaVoNHvs4j63Y6XkP1EGgTsctnTHDUXT65N6cyu4rwJzdIqBgz/+
         A5+A==
X-Forwarded-Encrypted: i=1; AKwUvByMFpcdEOViYnlRVKW0QJCVjaQ6hA+IJUtuZAswJHARcAWk8EcV1dSpP8AVz3vR9dKClFui9vci6WkgxKg=@vger.kernel.org
X-Gm-Message-State: AFuF++m6dhPtClkiIsgtIt7lnz9C0LHUpdrey9JfR7VwiCeLY1LVYNA3
	iDyVOxe8m7qRTnuf78R1Bgfple0MOlWUfUTrdIH+dE903jZ6BO+dHe9jZRvT8HIlnBn+mOMGMKv
	8oNGU
X-Gm-Gg: AYBFou0lVdzeKRpJ0+syjrcI1ZwfFTyTd8zyMu8aSpNQvDn80C97e0WgpexW5AZbJde
	QlPfF67r+ZPVPFn7XBJ8fE2knuvv/m4r2AqCsYc34nsi8bbzHhVNlDmL7MwP7OW3bflnk7Q2iVQ
	LPbwFf8mQldr8u7e7KAlKcfEMlsYtp1xZ+2jnYIYFRhXk0ZV8211ndw7r7sy2Cc3cigIcpA93T0
	e17ZQeUZj/ol4zPX+FGn0/OUM+FhbcEUrTrF1iDc5guPtnnI8lcwX6em4WoZalkDjsJQ9qbQdTQ
	dl9w2LvpmyXP+Vxnn0VyINHbDDv9Du3iZ593CSM/8dwPgb47nhLaY8rUQn0nkMYtRM/lPE5H+uz
	AVoNLeeiehTXroGWOvzYc7+MbtsCCQZGadt2+66Vk5f5HSaz/EF4uu5OV0b6nTHowuiVitY+5kl
	kNNg/jNEzbxk/Q/LmZjnF2c9epf4wnAcEFkmkkQ04kT41a8Aupm3s+bw5UD0dJ5HIhFJ/cMe23Z
	7DG
X-Received: by 2002:a05:6808:d4e:b0:4c2:dd8a:fa46 with SMTP id 5614622812f47-4c319a4f5d7mr676216b6e.16.1789074872995;
        Thu, 10 Sep 2026 14:14:32 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:fbf1:d0da:69e0:11a0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c330daa42esm347315b6e.4.2026.09.10.14.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:14:32 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Thu, 10 Sep 2026 16:13:01 -0500
Subject: [PATCH v3 02/10] iio: adc: ti-ads112c14: create data read helper
 functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-iio-adc-ti-ads112c14-filter-support-v3-2-e5a9b27ddb1a@baylibre.com>
References: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
In-Reply-To: <20260910-iio-adc-ti-ads112c14-filter-support-v3-0-e5a9b27ddb1a@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=yI4Hk3lgmAclykhu+CF4IfwMFXOwKo7xr12Yxb8s+vc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqox15NIzRzXG8xctuhvC/NL85GoIo6+4MDso3a
 G0oJUKViWuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaqMdeQAKCRDCzCAB/wGP
 wGY+CACXYZ57zGgdJRSF2r+iC+IQwHm+q11Hg+ZWHf10JIRnoxLxd5tgo92Z84B62yFC2t1FE3v
 MXcVUFOfsbDLwlLnwooMjHjM8H6dHpHXVQEL5pFF7z8KliwiDICIYslKPaETpewZ6DAfU5LMbIH
 BfEEzYkzqlCHE9ROYikkTjFDar3n+bgNQAtz72m3aRV0apIKmS1KmL3KIi60nnPwhW29Mad1Xvk
 tMSrKcOhNKLbxoVxokKTLHhAJ6nf1cNS9cLg/UFxSVxT+CrH9EyX8e61bcgb+18v7iIDHsVXqaT
 XPkukubrhbuePjac7htbsHTvCV0sjg/XkF7tTW2w6VxFpB+I
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Refactor a few bits of code into helper functions. These will be reused
when continuous mode support is added in a later patch.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads112c14.c | 51 +++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
index 9058ad34bc06..b2940b5d3c99 100644
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

