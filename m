Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D9B3B7777
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559878; cv=none; b=rhwjrYCRtObku5232uc4z2sEAjFyOxd8dh1gBae9EFL3u2uGQothK5ktsWWvHl7lSWayK2+Upwcd8zxQFgwnChAzkaFmhJ36kFU7th2uALZ1m/0wAR83n+RW8WHsUWgWxnCYKq9VQd8b/Sw+lb+loxDNebRNldEwQ6E1sVGGdpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559878; c=relaxed/simple;
	bh=0jleKfSV4x8zSuizbp6O6ni4ujngh47YqjL22y19AbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8GLU3IxNzHyyOJl5NCOuLfGPAecrnJxt9pCyeGcAJEsYp2lWNXPbHWBAror3sxcCzz9+UCXnff4uZffd4Z1LDmFq8ooIfCNSe37nTYI2G+xn4LKR9z1ee5O5Z/qrLAmyAsNp1XBU0f2L2JrXHomRl89CFBBNIRRFdsPjX47/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DQNwjgXn; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DQNwjgXn"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4a4cb36ae00so1377117b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788559874; x=1789164674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEY7r8lduCT2nc4feVvWUral7NtsjaDfgRTqImYybck=;
        b=DQNwjgXnWiOtFHlMl8xLZa4sXlaR7kUJdO/pYZhI2KuGZCaHKhVxwyTpJ4bPeiiIJc
         jpyBdnaj19jWe422z9wwDb7Si8PcG29KDJzg79MX8RLejXsVYo+DQfHh1zxHZbVKfTnF
         vwk09ktfuArRrGSkW7r+QG0AfM/7xAnuMMXtkH/qUd9Psx2HK1iY2dExM0G5uHgRA/CB
         3S03+HBdVoor9lAhqDy0sVAyY0ry8Z3QR1guJPWxE7059O9PBwBtHAMAAFtskmrZ9Kql
         mEtpIqYum9Errv8o0PPtKL71cgZ491gslO2CkT11NLEITIkQsXWo+T3uj7jlGPj961DJ
         L9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559874; x=1789164674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEY7r8lduCT2nc4feVvWUral7NtsjaDfgRTqImYybck=;
        b=VfOeLE3F9trGiQ91HMp+sx2xltpGy6IUO8biT//AQMSmUYuAupxpBCK5thMBtZvAFM
         q8WYswoGdKBi3qiBE3alxysfKF9Cjh5zyZ/S2vwXUCO2MFepHTLl/3Ixy/o53FvnEXf7
         opOVHMX7+wwCMUyavXkq72Jg983Ji+1D6mljbmh5IMfHMDkoLaHWwQr2EfSO3RyPrxR+
         s68Qia99W3XLkMz9LDUynqWmiY9ulJgmFbtLATYzAoNvEBraKZeKqXq3/lL3Fxg2hUxB
         us7TGzS22V7uGjX48R6p71DtciQdgkrBlm62GbFCpQhf+uGJggKEonJEn+m6My+HMbgB
         5euw==
X-Forwarded-Encrypted: i=1; AKwUvByrQDrSvKs5bnVYS5bJR4HXMSOEdxKMTe2oroGSQq0osWNPAOq2MzEbQyDhYpeDPPBZsGbTeNhl3fSyAxw=@vger.kernel.org
X-Gm-Message-State: AFuF++mJRJjmYnO9nvjw8UQ/dGDoBtQlyC/I7B5LkmlUJYoBgT8z2DXe
	6m7DsLVxHu9vSqYoXq/H1Q2zh2d9uXjbQUJ923yFdoaVKUjI1KqfB2woJD8SB6l1Tk4=
X-Gm-Gg: AYBFou0rpw9bkjKDknYRZLKt3OudcxrQWMFohbHH9Ycnr4rjSXII2W2dfmMz3SK1lOs
	/oV8MHzitOY7WV73q7DsNfB3grZ/tcl7GQR+7cyYXY/IVqhPTaTh5p4Vrlx4GFOEQOIOUpYVf//
	KWSyX/cfz+6UTIc9G1qLXvBg0B5Ymfhb2F07yRgU55bo/A0YSscj2sC+Uzzy3SmUr52DgmcP7un
	mCdb0b6Uvf0o/C0rJGI+cWMYgPOufKmnKM+ev8wkQsqdDs/BbIwWxH5OZCrUZ1ZXrTolguzHQs9
	+WDS9eT8FMK3eHNCQ0TpbP/gjE95+I9RiOcT94yhjVJ6Akq0d0ndOqtnavmVKXzrrQeX5KA+nHE
	UeJ6qtTC6dFRChqNEqKQKJzugxWc/L14a9ntu2yUHF8Ee/Mn0BFPc417rH1jvp32jA0hsVBXNNx
	60Mg6rOJNCcaWsl8ZOrgTwzeLPP3ob9xFaQJalu6mjdxKCaZjSNsTyfnpik4y4IvSgOlMwOXVh9
	qyg
X-Received: by 2002:a05:6808:c165:b0:4ab:2c58:4514 with SMTP id 5614622812f47-4b95c5ba1f8mr6679914b6e.0.1788559873783;
        Fri, 04 Sep 2026 15:11:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:4324:3ccf:e2bf:d545])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d1ff95sm3187113b6e.6.2026.09.04.15.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:11:13 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 04 Sep 2026 17:09:47 -0500
Subject: [PATCH v2 02/10] iio: adc: ti-ads112c14: create data read helper
 functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-iio-adc-ti-ads112c14-filter-support-v2-2-f86592360658@baylibre.com>
References: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
In-Reply-To: <20260904-iio-adc-ti-ads112c14-filter-support-v2-0-f86592360658@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=0jleKfSV4x8zSuizbp6O6ni4ujngh47YqjL22y19AbA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqm0G+ncKbLAltqxDm3KwBMxwEmv5L7xt+NEwPP
 hm0vKE0HWaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaptBvgAKCRDCzCAB/wGP
 wKtHB/9lhh+sMAjNSzNihwUyAb9ZCOTVvJicjbzhuEClzuyeeer3Ys2JKgOUF+pVcE7q6MucRPp
 NCcGra1aWi3a5qxRr0BdOdB/EhNgihlAExslS3GLSYgt9nKAl7uDawQD3i5XZ2AZBexBVS6UfIb
 gQlXFbruTs1rWpIqCe9D3+8L7gnFxMMFmwzYd3Fj7hq6djaetTz1QhHIubrUkkcv8LdOHlMmbB7
 jEReskh7EJZchTf7rltywUYMNNfway4LFO+05OhEyTnovw42GKNIL+1lZ8wwKr1t51Ksfd8ht0Q
 9//egdNS/S8YxozxeA+RRQyfu2te2QOztRXFhbIw5a3cANmn
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

