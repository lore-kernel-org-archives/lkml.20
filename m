Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292025;
	b=Q+em80uvssGItS7fcA2KT1b/1Sr1SSwyyn7QcCDvJLmBMheiWH3Ai//btir159RCMrzr
	 ENz5krGnqJa08uoUTHehsoQMp6MhNBddXUcfENUdcWyJgyPRh+noePHL9f5ABo4eVXzb7
	 kYE096u+rxUXOeeP3ntN7zqYHZM8y5+h6U97LXHqkWQ5qnfovGAGNQUJjuz5gyEobJy/B
	 NIVlIfgMuEyl32ksG3GqhIiY/3QIWuQXRbOdW4dOuZopBVSDGXaq5JiUmg9Yl5MxMMS0c
	 hmIAdrxRjr8oSdLzjIjN0PNLJxoeFHXroEiXWwGWXb79pS62RbeIQEin2oFnb+MJ1Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EnHcyg1guBpqRLa2mp/z3Uj8gNSIJFUrX0ZJsKC6wbo=;
	b=Rz/H51Z9gV4gCiJEfPhMqy1+3AJ26dEbGunVbio9o15Z8dD2ySiFBAoWJuN49oqpsvaf
	 38juEG4gtPe/2qtkjKBNlu/r9Z5TdGRNGURiz+ro9e+icETXgL3ZaqFbJ4Pa+20s+HPHe
	 9HnXdqvtzLvLjA6SJWDh4hpLkWSw91XsgLqBG5GRjlVBhDZWA33oHztV2m8VvViEDZymy
	 3CzsyEY2FkA75qCbXqMUNiCdq/oc17uPlBkPe07F78uTORpplYFYaZ7LutT33DrKH+9pt
	 I8U84Pi/I2J3hPP2PGpOQ24yrbD+2e9oiZyMvb9SiuNS8Jf2qduZVbOteHvEGJ4982A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQYa3NtY;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADD160A2605
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ADD160A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQYa3NtY
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-353804b591eso3611132eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292025; x=1793896825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnHcyg1guBpqRLa2mp/z3Uj8gNSIJFUrX0ZJsKC6wbo=;
        b=EQYa3NtYFX1z/ggKvGoPMocKCy9l4/ylOXsU+UaREtdUVlFcj9Arq4X9hoEPn1FisI
         PhXlRoGhWpdGzbtPWdwKXy6JKqNG6MSZPzsketM4Q3DH+4RoJsdrgkVDElwwBe9B++Gw
         97WtMAcEioay7HSQRMLyVkA36x+MPUonMHdfAz9nLzx7Q68FsoIi+VpTZXEJXERDSbl7
         1IhWeP5vjI8CeYUy9LUOG190TRfW3HGGZOqd9yyzctaV/3XT07JMBFdLHQXD7VvmzrN+
         hYl1AXFfpA+y2GJyVvo4s6LJSqQk8YqxGLtWTiQ5U5i6Og0BZ7F1JUolmoLzmQWv6OpY
         ZR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292025; x=1793896825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnHcyg1guBpqRLa2mp/z3Uj8gNSIJFUrX0ZJsKC6wbo=;
        b=TPMpt0ce/lZPcEtUkOuZ5VGhsgrV8XddDbQN3kgtG0c2bAo62yq311ss99mWEWFD4P
         6tM8e8Hf5YRLxIGBudOPbXZgNJtPVhbpg44zRuMoC+PJjDMWTp0BhWPQJgn6zPhcwHQ8
         4zIKfha6LQBoANz2lIs5Ph60igTsHo1ABa3T9i1mNxWt0Gdvx/aRP3lT0QsXW/Qb5cWJ
         Q7aqFK7AVyOMq+ce0TVkCAHjYZS23aB7zpyKMM9J567FYZGLDlH+U/ej11Xj5YUz5KqC
         pQeFEpkMjLLm/UMV0bzMYlYZIHJy2O/q/7fT36Tw8SEd6+O+9dd6fuayOaJa3hpBr1un
         lwWA==
X-Forwarded-Encrypted: i=1; AKwUvByJVzdXtUTzBq0iOD1ZiELWyKiG+VSo242oZfD0+/PEMwFa/Mhfu6XDINHzAAg2yrc1mLj+eIGlV/zyVVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmsIUFIKjgC870O+GCsagKQrNsjHLoszF8ezl4Nshrilkf7kSU
	dx4pNzPx7OUKG82/wByaxxYYJ3mzPI8TZUU/ImfyC9ColgoZXlQ1lMNx
X-Gm-Gg: AYBFou1Aq322Cc7O7vIk1NM/SuYpcdWuV1JS2uYl1nl3xM55pczWcW9x923GpgAT1tf
	C2t9t5kizwFVwO/xVvafDV+qUeufondHuaB+EnlSNSgfEyjgbW7w/ndiIcc/zL7PyqtPCTEvFgu
	GYNfu6qcMD/I8At3QiNHI8nxLmplDliIE+JjlPoHjbgGGMuZyV1KCVX8jA+85UHILiyYxosSCIp
	0RcZaJDrbGWm4IMtu8aJHY8/6vZaiAUGC0V0dQdvCjTZLVNr9McLUsPg0pPXf0HTDIlQepkUOxn
	ABMiQZPwgdnuh0A03F32km2fPE5oYim6o5AvvimJrxoJYmJV1l9O70bzrioZAV/kMQJgA7IShD5
	gUlAXRvvW89U3PyZijzSPClkRkznkDbcNpCTl0WA/BKsF+nsxeH6kh9+c9hh3Laik14YQOli3ZS
	WOtQXLOgxforjw5J/WDXeMKnILUkdZc39xusCYKb2skO7+uKscRtlmziS+FNqDCnZCAbIE1La8Z
	uzK72IR2V2meFJkxJ9C85Z9YMNHeppNU4LQqfducUlzzqQF2qHqnkZsR83kcze/LOo8mL5p40lG
	dyVjWhxVG+LZeZxByMt3GNK4be+OA7kvnWu2qBh9H4qx6cI5LGLkgyzpLslHL5nSdY3k
X-Received: by 2002:a05:7301:488a:b0:36a:ebf:5816 with SMTP id 5a478bee46e88-36a2039d162mr8365200eec.19.1793292024262;
        Thu, 29 Oct 2026 09:40:24 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a410faa87sm264319eec.26.2026.10.29.09.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:40:23 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: (lm87) Check I2C errors during detection and setup
Date: Fri, 30 Oct 2026 01:40:16 +0900
Message-ID: <20261029164016.338450-4-pocj8ur4in@gmail.com>
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

Reject devices whose identification registers cannot be read, fail
initialization on transfer errors, and report configuration restore
failures.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
 drivers/hwmon/lm87.c | 86 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index a66d486b314c..32ec44f583eb 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -955,17 +955,22 @@ static int lm87_detect(struct i2c_client *client, struct i2c_board_info *info)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	const char *name;
-	u8 cid, rev;
+	int cid, rev, config;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -ENODEV;
 
-	if (lm87_read_value(client, LM87_REG_CONFIG) & 0x80)
+	config = lm87_read_value(client, LM87_REG_CONFIG);
+	if (config < 0 || config & 0x80)
 		return -ENODEV;
 
 	/* Now, we do the remaining detection. */
 	cid = lm87_read_value(client, LM87_REG_COMPANY_ID);
+	if (cid < 0)
+		return -ENODEV;
 	rev = lm87_read_value(client, LM87_REG_REVISION);
+	if (rev < 0)
+		return -ENODEV;
 
 	if (cid == 0x02			/* National Semiconductor */
 	 && (rev >= 0x01 && rev <= 0x08))
@@ -989,7 +994,12 @@ static void lm87_restore_config(void *arg)
 	struct i2c_client *client = arg;
 	struct lm87_data *data = i2c_get_clientdata(client);
 
-	lm87_write_value(client, LM87_REG_CONFIG, data->config);
+	int err;
+
+	err = lm87_write_value(client, LM87_REG_CONFIG, data->config);
+	if (err < 0)
+		dev_warn(&client->dev, "Failed to restore configuration: %d\n",
+			 err);
 }
 
 static int lm87_init_client(struct i2c_client *client)
@@ -1013,16 +1023,26 @@ static int lm87_init_client(struct i2c_client *client)
 				val |= CHAN_VCC_5V;
 		}
 		data->channel = val;
-		lm87_write_value(client,
-				LM87_REG_CHANNEL_MODE, data->channel);
+		rc = lm87_write_value(client, LM87_REG_CHANNEL_MODE,
+				      data->channel);
+		if (rc < 0)
+			return rc;
 	} else if (dev_get_platdata(&client->dev)) {
 		data->channel = *(u8 *)dev_get_platdata(&client->dev);
-		lm87_write_value(client,
-				 LM87_REG_CHANNEL_MODE, data->channel);
+		rc = lm87_write_value(client, LM87_REG_CHANNEL_MODE,
+				      data->channel);
+		if (rc < 0)
+			return rc;
 	} else {
-		data->channel = lm87_read_value(client, LM87_REG_CHANNEL_MODE);
+		rc = lm87_read_value(client, LM87_REG_CHANNEL_MODE);
+		if (rc < 0)
+			return rc;
+		data->channel = rc;
 	}
-	data->config = lm87_read_value(client, LM87_REG_CONFIG) & 0x6F;
+	rc = lm87_read_value(client, LM87_REG_CONFIG);
+	if (rc < 0)
+		return rc;
+	data->config = rc & 0x6F;
 
 	rc = devm_add_action(&client->dev, lm87_restore_config, client);
 	if (rc)
@@ -1033,28 +1053,52 @@ static int lm87_init_client(struct i2c_client *client)
 
 		/* Limits are left uninitialized after power-up */
 		for (i = 1; i < 6; i++) {
-			lm87_write_value(client, LM87_REG_IN_MIN(i), 0x00);
-			lm87_write_value(client, LM87_REG_IN_MAX(i), 0xFF);
+			rc = lm87_write_value(client, LM87_REG_IN_MIN(i), 0x00);
+			if (rc < 0)
+				return rc;
+			rc = lm87_write_value(client, LM87_REG_IN_MAX(i), 0xFF);
+			if (rc < 0)
+				return rc;
 		}
 		for (i = 0; i < 2; i++) {
-			lm87_write_value(client, LM87_REG_TEMP_HIGH[i], 0x7F);
-			lm87_write_value(client, LM87_REG_TEMP_LOW[i], 0x00);
-			lm87_write_value(client, LM87_REG_AIN_MIN(i), 0x00);
-			lm87_write_value(client, LM87_REG_AIN_MAX(i), 0xFF);
+			rc = lm87_write_value(client, LM87_REG_TEMP_HIGH[i],
+					      0x7F);
+			if (rc < 0)
+				return rc;
+			rc = lm87_write_value(client, LM87_REG_TEMP_LOW[i],
+					      0x00);
+			if (rc < 0)
+				return rc;
+			rc = lm87_write_value(client, LM87_REG_AIN_MIN(i), 0x00);
+			if (rc < 0)
+				return rc;
+			rc = lm87_write_value(client, LM87_REG_AIN_MAX(i), 0xFF);
+			if (rc < 0)
+				return rc;
 		}
 		if (data->channel & CHAN_TEMP3) {
-			lm87_write_value(client, LM87_REG_TEMP_HIGH[2], 0x7F);
-			lm87_write_value(client, LM87_REG_TEMP_LOW[2], 0x00);
+			rc = lm87_write_value(client, LM87_REG_TEMP_HIGH[2],
+					      0x7F);
+			if (rc < 0)
+				return rc;
+			rc = lm87_write_value(client, LM87_REG_TEMP_LOW[2],
+					      0x00);
+			if (rc < 0)
+				return rc;
 		} else {
-			lm87_write_value(client, LM87_REG_IN_MIN(0), 0x00);
-			lm87_write_value(client, LM87_REG_IN_MAX(0), 0xFF);
+			rc = lm87_write_value(client, LM87_REG_IN_MIN(0), 0x00);
+			if (rc < 0)
+				return rc;
+			rc = lm87_write_value(client, LM87_REG_IN_MAX(0), 0xFF);
+			if (rc < 0)
+				return rc;
 		}
 	}
 
 	/* Make sure Start is set and INT#_Clear is clear */
 	if ((data->config & 0x09) != 0x01)
-		lm87_write_value(client, LM87_REG_CONFIG,
-				 (data->config & 0x77) | 0x01);
+		return lm87_write_value(client, LM87_REG_CONFIG,
+					(data->config & 0x77) | 0x01);
 	return 0;
 }
 
-- 
2.55.0

