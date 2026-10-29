Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292022;
	b=DvSBZEFhkiGwyIdydbn6VHxkZPj89nGnPiGMbBmmwKHXIhFubAkRANuMwokz/0vph2Bi
	 tIbiVMf0EXw51ybJ4Re2rZL2z5stlM7MmYWtsH7Pxe6ntOX5ddQ/6y+5NdrAmV/4DESX4
	 PRroSP7mgAYLZ2hf2bzeyzJC3YGEKfqcAJzG1z09uI8XoMHYaCMh+Pc7co/u3bjPRmhyU
	 rL7h1fvOm1pBv8dCPHk3A8rc/1rD9ZRPud9feOojJc9Mp4V1Ff+GhJ9k3MDXo2hOgFsDM
	 hg0/eu+7mKT9B3d325yedXLeXwzW723YRopFXDkUuQVPcQtrfrXFTKP2AJh29oeGhEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WcmHvblESmvr3kgWLi3WJoBUGk49ybDEunYlRtQWhP0=;
	b=LGFFO5QQq4WIV2g7+8rmO0Xia+XhanXfODSM1ILpieaXMYATFuqGhSij4eoDUDduTJIA
	 fjw+DaETqmkpXa00tUQ4PpAKQagn2WopWHywHWSrXRg2GjJOjxEtWj2DWR70t1YfgAiZD
	 r1WxCYDCfHkqRGS/a7P42lAMDFoKwoQIcjDZEWHUj62cN0HVVQXEMRZJEHp1jdimwWXjm
	 vNGCrt53VMZZoiM4c7JVKGrpwQBCYdbl1Iasm2QQUM5LxrqnWC/LcAnLmsdtR7+WDlSlz
	 paex2x6pwGa0T1ZcqTEBrBSNbq23Jfyu9XQvw0/kg4gFv+1R0tKIgsRFRGzd9jOXDFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=II4UMkmO;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D5F606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D5F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=II4UMkmO
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2264586eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292021; x=1793896821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WcmHvblESmvr3kgWLi3WJoBUGk49ybDEunYlRtQWhP0=;
        b=II4UMkmOMd/xtuN6fqaeOOkoY3c6cv95sukENj370zdtkPRLzFWkvJPaM+Ca7O0ezK
         4zHsqHGBjYEinPaR1JQEQEB69zy6KONmEonYqpn0qonZiYtjjeoKZnkM0MrCAVqCusYJ
         Z98DHJ14ABZbng9DdaVuVbzhfAdwK8GsXJArbwItwDxHASB/gXXJ8OUjVXscLQJcFtjP
         nsq0N2HNAjoZsZYQeDVR3fVDIv2O0JkqUqJXicQNDEPxG8SqQWgF+TcoiB03GQUJbyan
         SNlVy9cVNpJA3og9OneGnYKmgpAMa3Iau/fdP/1RD6znPumBg56ye39+xaR9vJ85HmUj
         oCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292021; x=1793896821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WcmHvblESmvr3kgWLi3WJoBUGk49ybDEunYlRtQWhP0=;
        b=e8zfnQA2nAY/Hs4EKjHBIHWfK4q+yabTxtYKfyVyPPf0pflTwQA2O7yuCNt1nGQeSP
         Ni+nUnCmBWT2eCsrQRWmh7k3B14V14u1agz6KRKQ7n5fBIFYCO7lMZkTsEFX0VlAOLvc
         v5MjSctFmRXfA9wt/up7qzdBjoXAHfnk6/ldaNVmn6LpDaoadlWRciPu8Ftu0zcw114Y
         sCOWAxzVnpeNfphvjpIzP1U1/Reff7UqhL8QsfuEvllLUExq+hB2f9WCMYnafTRm/dr0
         iWDyftP2Wst3+V3IQT2RcbRtgXOwJTzwTuzCypp5hrd6tgHrH9h+V24XKdkduGf336eD
         bgQg==
X-Forwarded-Encrypted: i=1; AKwUvBwNbKxjS8ZZI2o/t8iIf2W+F50mBaQIIU2H9p3W42FgGBUD6G5AX1xJfTRK3h+TA7PEDa13FVVcuR52pFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyOHtsPZKJdCSFmvJWlurDtAVm7HrdVN3dqSvSGmpXpzX/tor4
	YPf5BHiiSiw3UOsr7VCuA6l6u9cmLh4RbvnN1CmQEbmANyNJdi+gZICw
X-Gm-Gg: AYBFou1hgZypRrayCP2B2mug9dfItrDOeYoWpZ7o4YkdgkDH/pN51sfrQ+ViMDSXVOA
	O+G2+JkZA1bj5fnP8vi/td5NE83nO15n7JacpPUF+cr3PkLrfVEnyrk2x2VNjMcCgQTwg3k+L15
	qUjNce/A6JurPAexsRmNrbKsL1oQyTSb4aIUGLxWvyK0qa3Ea9jRKigjsgnBZBeq6PGn7IiFgs8
	iykGqy12PVS9mgihFmgBzFn8Rp/4a4VsI4cT2i0pv4N+kjDbJ4OLVdvjho0kDlO6rbYXyOw5ZUo
	FHzbkAcFBnnYXyXPaELTMOgvi0UuhoTdQKcjm3nWIDffNBFMRJiVM9i/3IWvJSTxifpJTo4p1Up
	SbDObWn4ULLR/F9ZamAMLEZBD317IxHln3us0O6t8/0b6Ihiyw71Gu18SxONwJLVxL9P7Avg+U2
	WS3QSAU+XbmNaKqBzxPJoEIV8//F6J44r8u2A+sqkui4r08jP97mXfDzxdlvFq+4RJseGZ/Xl0B
	/WTJ/gqPdOGi6f6TQKSX8xZVanos5UOvFwp1mVlC9EfZJNspfX2qG7elNn7Xq9apXEQiCHyOru5
	KXZKiuISoIZC9JbXn5QnuJIeDPo19ESaiBgWQJlxiONZI04=
X-Received: by 2002:a05:693c:639c:10b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-36a203fec83mr8634646eec.25.1793292021009;
        Thu, 29 Oct 2026 09:40:21 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a410faa87sm264319eec.26.2026.10.29.09.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:40:20 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] hwmon: (lm87) Propagate sysfs write errors
Date: Fri, 30 Oct 2026 01:40:14 +0900
Message-ID: <20261029164016.338450-2-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029164016.338450-1-pocj8ur4in@gmail.com>
References: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
 <20261029164016.338450-1-pocj8ur4in@gmail.com>
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

Check the I2C result before updating cached values for writable
attributes. Handle both writes in fan divider changes separately so a
failed second write does not hide the first one.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
 drivers/hwmon/lm87.c | 96 ++++++++++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index c09074f44708..c118a7ff718b 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -305,6 +305,7 @@ static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -312,12 +313,14 @@ static ssize_t in_min_store(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
+	reg = IN_TO_REG(val, data->in_scale[nr]);
 	mutex_lock(&data->update_lock);
-	data->in_min[nr] = IN_TO_REG(val, data->in_scale[nr]);
-	lm87_write_value(client, nr < 6 ? LM87_REG_IN_MIN(nr) :
-			 LM87_REG_AIN_MIN(nr - 6), data->in_min[nr]);
+	err = lm87_write_value(client, nr < 6 ? LM87_REG_IN_MIN(nr) :
+			       LM87_REG_AIN_MIN(nr - 6), reg);
+	if (!err)
+		data->in_min[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
@@ -326,6 +329,7 @@ static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -333,12 +337,14 @@ static ssize_t in_max_store(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
+	reg = IN_TO_REG(val, data->in_scale[nr]);
 	mutex_lock(&data->update_lock);
-	data->in_max[nr] = IN_TO_REG(val, data->in_scale[nr]);
-	lm87_write_value(client, nr < 6 ? LM87_REG_IN_MAX(nr) :
-			 LM87_REG_AIN_MAX(nr - 6), data->in_max[nr]);
+	err = lm87_write_value(client, nr < 6 ? LM87_REG_IN_MAX(nr) :
+			       LM87_REG_AIN_MAX(nr - 6), reg);
+	if (!err)
+		data->in_max[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 static SENSOR_DEVICE_ATTR_RO(in0_input, in_input, 0);
@@ -402,6 +408,7 @@ static ssize_t temp_low_store(struct device *dev,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -409,11 +416,13 @@ static ssize_t temp_low_store(struct device *dev,
 	if (err)
 		return err;
 
+	reg = TEMP_TO_REG(val);
 	mutex_lock(&data->update_lock);
-	data->temp_low[nr] = TEMP_TO_REG(val);
-	lm87_write_value(client, LM87_REG_TEMP_LOW[nr], data->temp_low[nr]);
+	err = lm87_write_value(client, LM87_REG_TEMP_LOW[nr], reg);
+	if (!err)
+		data->temp_low[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 static ssize_t temp_high_store(struct device *dev,
@@ -423,6 +432,7 @@ static ssize_t temp_high_store(struct device *dev,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -430,11 +440,13 @@ static ssize_t temp_high_store(struct device *dev,
 	if (err)
 		return err;
 
+	reg = TEMP_TO_REG(val);
 	mutex_lock(&data->update_lock);
-	data->temp_high[nr] = TEMP_TO_REG(val);
-	lm87_write_value(client, LM87_REG_TEMP_HIGH[nr], data->temp_high[nr]);
+	err = lm87_write_value(client, LM87_REG_TEMP_HIGH[nr], reg);
+	if (!err)
+		data->temp_high[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
@@ -502,6 +514,7 @@ static ssize_t fan_min_store(struct device *dev,
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
 	int nr = to_sensor_dev_attr(attr)->index;
+	u8 reg;
 	long val;
 	int err;
 
@@ -510,11 +523,12 @@ static ssize_t fan_min_store(struct device *dev,
 		return err;
 
 	mutex_lock(&data->update_lock);
-	data->fan_min[nr] = FAN_TO_REG(val,
-			    FAN_DIV_FROM_REG(data->fan_div[nr]));
-	lm87_write_value(client, LM87_REG_FAN_MIN(nr), data->fan_min[nr]);
+	reg = FAN_TO_REG(val, FAN_DIV_FROM_REG(data->fan_div[nr]));
+	err = lm87_write_value(client, LM87_REG_FAN_MIN(nr), reg);
+	if (!err)
+		data->fan_min[nr] = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 
 /*
@@ -533,7 +547,7 @@ static ssize_t fan_div_store(struct device *dev,
 	long val;
 	int err;
 	unsigned long min;
-	u8 reg;
+	u8 reg, div, fan_min;
 
 	err = kstrtol(buf, 10, &val);
 	if (err)
@@ -545,39 +559,47 @@ static ssize_t fan_div_store(struct device *dev,
 
 	switch (val) {
 	case 1:
-		data->fan_div[nr] = 0;
+		div = 0;
 		break;
 	case 2:
-		data->fan_div[nr] = 1;
+		div = 1;
 		break;
 	case 4:
-		data->fan_div[nr] = 2;
+		div = 2;
 		break;
 	case 8:
-		data->fan_div[nr] = 3;
+		div = 3;
 		break;
 	default:
 		mutex_unlock(&data->update_lock);
 		return -EINVAL;
 	}
 
-	reg = lm87_read_value(client, LM87_REG_VID_FAN_DIV);
+	err = lm87_read_value(client, LM87_REG_VID_FAN_DIV);
+	if (err < 0)
+		goto out;
+	reg = err;
 	switch (nr) {
 	case 0:
-	    reg = (reg & 0xCF) | (data->fan_div[0] << 4);
+	    reg = (reg & 0xCF) | (div << 4);
 	    break;
 	case 1:
-	    reg = (reg & 0x3F) | (data->fan_div[1] << 6);
+	    reg = (reg & 0x3F) | (div << 6);
 	    break;
 	}
-	lm87_write_value(client, LM87_REG_VID_FAN_DIV, reg);
-
-	data->fan_min[nr] = FAN_TO_REG(min, val);
-	lm87_write_value(client, LM87_REG_FAN_MIN(nr),
-			 data->fan_min[nr]);
+	err = lm87_write_value(client, LM87_REG_VID_FAN_DIV, reg);
+	if (err < 0)
+		goto out;
+	data->fan_div[nr] = div;
+
+	fan_min = FAN_TO_REG(min, val);
+	err = lm87_write_value(client, LM87_REG_FAN_MIN(nr), fan_min);
+	if (!err)
+		data->fan_min[nr] = fan_min;
+out:
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err < 0 ? err : count;
 }
 
 static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
@@ -640,6 +662,7 @@ static ssize_t aout_output_store(struct device *dev,
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
+	u8 reg;
 	long val;
 	int err;
 
@@ -647,11 +670,14 @@ static ssize_t aout_output_store(struct device *dev,
 	if (err)
 		return err;
 
+	reg = AOUT_TO_REG(val);
+
 	mutex_lock(&data->update_lock);
-	data->aout = AOUT_TO_REG(val);
-	lm87_write_value(client, LM87_REG_AOUT, data->aout);
+	err = lm87_write_value(client, LM87_REG_AOUT, reg);
+	if (!err)
+		data->aout = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 static DEVICE_ATTR_RW(aout_output);
 
-- 
2.55.0

