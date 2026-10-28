Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175338;
	b=ei82o0krC9knmcU1lZOTk44i9OZwEbc4JL5OVN502DwtnuFAA30De2eJjXQCOazjAdiY
	 9iVJ+s//M04C+Plf+1B+PCFnFU0HF/Gk43g5p+3Bx2D6au0DVy0+I7iG0MN5RUTiG9fXR
	 kRgyp/ylAD+LjhcSWTztg/ynW2svhKn06WbKJ9cDHgRvHFLBXWQaHQV0jLbtd/nlZbXhA
	 4MlVEbq1SHVKGjxtUmLXpx+flKSCcZxq0I6yThaU8beHD08HYsTXy/t+Zd/S3yo4LkSxF
	 ENQITt+P1W4CuDXqgLnePsYA/Nf5dfmN8lWKn9Xypo03jr7kBHMHSE+DmA9upCTJr6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lCx4BcrORJni91sIsjKBnbCAJ5Ch1lEXBg8pjpqe8IE=;
	b=EQPUEPxSkR6oiQt4PNnqO+p0ARBSFncSEjENHlG3aHZCPKlRl4jySKH6ddwQzVO7p5rd
	 xGf6b3fQIrV9nwBbj2NKrugD1W1CQS6wRnswgDUd0Ids9O36WeuroaHl4IeND6NzJBtOK
	 pnCBWZw8VNBWrLUZEUTq2/0zSPPe+2s5y+Fih0gaTGLl/ctg42jQTwibPmh5ozjr0tY/J
	 8ftHGIRyv/K6uBP311DJXhLGg2UvvKiS4r/gsQvfAMiBby7ZQCAuGDK2l+PlHk/P7unuQ
	 4PECM1Ch4HFGs3HH/Ezim+7i3hxM/+eLUPcgDy8FFy6p60GZHZI9JB8MN9A//t7rISg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8bF8AXt;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9D606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F9D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8bF8AXt
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so945103c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175336; x=1793780136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCx4BcrORJni91sIsjKBnbCAJ5Ch1lEXBg8pjpqe8IE=;
        b=x8bF8AXtwUYKMukSmmSlSOvy0FTCaMALw0lrAjREYQETLatMg6hPsmE1M4qjmSlw9+
         Val04sjHUXiuSmd/+LmB0J8zh7EsFEREu0Uq2Kpk3WzT81vsQamsq3EJa5cZ7O2Q+huL
         RV2FXdtizGR6+zS5CgJOV/7yZBLgH7DLfh+T/yi6JR05khWEvRSYmVBsoYsTd3sihYKR
         vvIlC9FMVwoKgVR0fgToaKMB3eDmBWyU44NxVzSJeULOqUDBPLLMEihKqno1ntlcOooB
         lTckuohrQPh1TNuJy4ZPqDjBGjfhfTxRXZ1K23ywKVntr+AD+PgqxJHhqGxBmh54HuP6
         V7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175336; x=1793780136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCx4BcrORJni91sIsjKBnbCAJ5Ch1lEXBg8pjpqe8IE=;
        b=ys0vhd5nLbUI3RpC9k+1xq3RyiHgbE4ipjst82aXtrqZoTJ5R604Bl2nel/9PY5aET
         uPGKgmhUl0hCNneAQH20vJgtBi+tuUN4WYedDKCNxQwU35EJtlDmh18Oiz7t9/nb0PtD
         GAmCh1XAFI+QG9bjGKdS/yah09dz8E8TqyVVQ/KzKzK+4Cv2shrk002u+GxpTVMovWJZ
         6ODZvS+ZGCbTRwDzdZuHz6rN6vrMUTc3iFQNO24aW7BYMi3r32pHO0+UgkD8edJTCssh
         0ml03ntcY3ZB34V/QGY1HOTKHUkQLbLyffa1Zvxlo7sW5nOPFHVZdE0A+yG70Uh3EQlL
         /JQA==
X-Forwarded-Encrypted: i=1; AKwUvByp6zKtK/0lF8OEEBcZlTYtADHgH3UyeHWbkypD9+RVBSx5zHvHUMi0ZozbwWN2k1lJ/MqRtEghsCToBNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2XpOfHWMk+BQ/NXzKoHNemjPCQ4QMx+U+E9ulb9DSc6gxqxB/
	aDKgo/4OhZcuHfp/Wm41wn6ML1Wx6ZL1EbRFfFyqHN8uQoWVdlnfRmJ3
X-Gm-Gg: AYBFou0iKw28gacgT9eI0W4XPGo0gW1hC3zbrHpdpFryYe+HGV/Gun9nApOdTA+X8Fj
	cZvpboLS4EaTs8dOqVseM19DHCDoaVs8auYVJW2vjgAsdoM8bMB3moANWRKHvfVgnzjRxubdKIo
	KWdEQLEe740I6pGStJaIxIb5Y1v5bA4jNkhoOBM7Y+n2cXNIGNyZSGMGpFoa0Eu+1YUcFMlGdfg
	w8l8thJzfL6RcnmcLl43MUZT/uIsrUWXDfSJGRMGCLc2WpuWG1LJmVvVJvMLpV0yR83LeWZeUNV
	wA6UIy5qtNdfuaJibviSYAB22j+mAsa7Ez9iJfM/b3ONiPCwdRx6bxd+p//nxZUs++B2qZjIDIN
	j/x1MVUYBBJBOS7A4CU/gbneqRdBGthlwd4RzPQ5Qyg/vtdZIA6RouARKaauoiwNMVlITeQc9h9
	V7LtG6CklXb1/dVvs+XcQ1ULCveojLGVXwzvxSXLY0MbXiLQrm6j68a8zXhKfXQEZ5ula9qiwzz
	SNsHidKxidmHtu3HqOmbx+d6BK+hFupb16Tzx3wVdb9aQXr3uT2LR0RhJiw++aX5zCHVVKi+axi
	LlZJ2kz+pxgKBJd+H/vWj+Xn5ce4nQBNx5wX7i4cOg/8QXFa
X-Received: by 2002:a05:7022:1703:b0:166:3e26:c4b5 with SMTP id a92af1059eb24-1a6ce4ea2bfmr2235088c88.18.1793175336081;
        Wed, 28 Oct 2026 01:15:36 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c2d:4ec6:6994:85c7:638d:44c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm3355296c88.0.2026.10.28.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:15:34 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] hwmon: Fix minor style issues
Date: Wed, 28 Oct 2026 13:45:04 +0530
Message-ID: <20261028081504.127535-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Add newline between variable declarations and executable statements
to address the checkpatch warnings.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/hwmon/adm1031.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index 24d0d4146c87..45d75a6383f5 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -212,6 +212,7 @@ static struct adm1031_data *adm1031_update_device(struct device *dev)
 static int FAN_TO_REG(int reg, int div)
 {
 	int tmp;
+
 	tmp = FAN_FROM_REG(clamp_val(reg, 0, 65535), div);
 	return tmp > 255 ? 255 : tmp;
 }
@@ -322,6 +323,7 @@ static ssize_t fan_auto_channel_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", GET_FAN_AUTO_BITFIELD(data, nr));
 }
 
@@ -387,6 +389,7 @@ static ssize_t auto_temp_off_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       AUTO_TEMP_OFF_FROM_REG(data->auto_temp[nr]));
 }
@@ -395,6 +398,7 @@ static ssize_t auto_temp_min_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       AUTO_TEMP_MIN_FROM_REG(data->auto_temp[nr]));
 }
@@ -425,6 +429,7 @@ static ssize_t auto_temp_max_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       AUTO_TEMP_MAX_FROM_REG(data->auto_temp[nr]));
 }
@@ -468,6 +473,7 @@ static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm[nr]));
 }
 static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
@@ -569,6 +575,7 @@ static ssize_t fan_div_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", FAN_DIV_FROM_REG(data->fan_div[nr]));
 }
 static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
@@ -576,6 +583,7 @@ static ssize_t fan_min_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       FAN_FROM_REG(data->fan_min[nr],
 				    FAN_DIV_FROM_REG(data->fan_div[nr])));
@@ -668,6 +676,7 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
 	int ext;
+
 	ext = nr == 0 ?
 	    ((data->ext_temp[nr] >> 6) & 0x3) * 2 :
 	    (((data->ext_temp[nr] >> ((nr - 1) * 3)) & 7));
@@ -678,6 +687,7 @@ static ssize_t temp_offset_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       TEMP_OFFSET_FROM_REG(data->temp_offset[nr]));
 }
@@ -686,6 +696,7 @@ static ssize_t temp_min_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_min[nr]));
 }
 static ssize_t temp_max_show(struct device *dev,
@@ -693,6 +704,7 @@ static ssize_t temp_max_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_max[nr]));
 }
 static ssize_t temp_crit_show(struct device *dev,
@@ -700,6 +712,7 @@ static ssize_t temp_crit_show(struct device *dev,
 {
 	int nr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_crit[nr]));
 }
 static ssize_t temp_offset_store(struct device *dev,
@@ -812,6 +825,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", data->alarm);
 }
 
@@ -822,6 +836,7 @@ static ssize_t alarm_show(struct device *dev, struct device_attribute *attr,
 {
 	int bitnr = to_sensor_dev_attr(attr)->index;
 	struct adm1031_data *data = adm1031_update_device(dev);
+
 	return sprintf(buf, "%d\n", (data->alarm >> bitnr) & 1);
 }
 
-- 
2.56.0

