Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897600;
	b=j754/BdPaBwtjt8aQc76p5vq7IO38Zh6WSg+/qD8qdpDXxS1pXlOoimnwI4E62yPx3XL
	 5Q3EMZZI3E95vIwxUnsv8mzI/CUXFMGUaLH7HK1ZnD+0e27doaMil+T7ogzJVyqMh62n/
	 r/rXLahr3kjijld3HYuP1Ebr6kzjrHINHoTn2VoYH8DdJlMugnMVan54jUg2LHZmMyblC
	 G8iRToEpgeJ6/yJyTrSkeLIt17ibX5BlP6sAZiwl4kzXs7/u9XldYxjwZrFPJTV3Tfk/Z
	 lHVCE98RrCgaWigxlQ7qLpRtOq3ez1l/k4Xi6tpnRI3lzVwlmTxplnudJ9h44wR27mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=S8wLBTM9/IEgUegL5oR1lik8LOtauiSAmwjN7IuU7Uc=;
	b=nR5VSNs/7WfSG9QMWC47npG4gaUP+2HOvlvr5yO06z1QRaQV3IEFtnww0iGXDvEjmZVz
	 iqvj/FolObE6qWV1+EBPAfG9mUG+h/xMNLnyJSejhm0oFa9TG8k4JjP6deAV4/E3ckNRl
	 v2VdiGuXx3DDnE+3z7pcZ8EUyYHtpKFg/c5wrp6EUM76gz/pETQTwNzrf+colfhtkJ6+2
	 B/Uq4WaGfRusgRXj2FsEDto2SJuLxMVzkHXxw0DQvw/77CP60VzMwC5tBMh9N1zYtZMvF
	 PyptcujE00kRaaDJ44NmYtkwte3Zzz7OZlvmfFTLyOdW1fv88Pc00gSIQXkcTiGkdpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QYYua9Ul;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F39606F5E0
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F39606F5E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QYYua9Ul
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso738066eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897599; x=1793502399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8wLBTM9/IEgUegL5oR1lik8LOtauiSAmwjN7IuU7Uc=;
        b=QYYua9UlULATtIGaoQM3O03WRhcGFUnkL3lGEMAL6NsM9jaNjSnJvnBzMtDXHMdH7N
         ZKdm55UOq17CKXnWybphKg0UWWuQ0xBemW+cnyKUmn4e4L3ImomrNrdf3ePAR7mgy6vq
         Bw8epXvkZSMhlScxW5OP0NIXUU9TFw3OYF15zEgLtO0zHsoJch3jV7b2RtiOrU7+OayW
         UKcC1PCFTQbd66axrIPMQN+dx4xeZ6/tb30oa00FpPRYb4sXrMvVkY1W9KTbh7B0RFyX
         LcFYeFSdC1sjMqPTrrs75iLgRtvCr9FJpeipZImx0gnJHrzsI2H/25bApRfWIJsSm9IY
         JUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897599; x=1793502399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8wLBTM9/IEgUegL5oR1lik8LOtauiSAmwjN7IuU7Uc=;
        b=yt0NZedWSKjWaageXH+uIXM27R6Z+2Gd9voH2CxL2Gs/lZTXqPt5IMqZy4IB/S3w7d
         vWQTM8dg4rIgtQWm9Ac8fz9SQXD/KEHrKidUTnJ7WdRfUVn2+0TSvL33kJcRI7XyMYgu
         ZNPLEZAeNuwjuNbeTKgZ0B1337XC4LTcMa8q3Wf3qnDbbgTa3LPLMaLTfVXkask2EwnB
         NR0wndeL1sxHYq7Ubgl1IkrWUe8hTeGzLXyZu5EjVHF61uhz7dDP0MohCnj9vIcMKmiU
         JPKXFY7QvQI724ss4dKjmZIe6LjsHeNN+4bq1GucMMI+KLbR+IpooyLLLQh+cCalwCMi
         SWsw==
X-Forwarded-Encrypted: i=1; AKwUvBwIc6Tw72Q82gQwRuJZn+/KjHZB0Y741PS5v9J4ZZnK6ZC2mN0M3eJDvDGz+kpB3gKaHhYQRUgLysjp0u8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/smmW0Ca21PIpKUXd+AquSERfMzGJPBWN92QzGk5yWXgBZWGb
	dSrL3GWCU4sEoUAznTlUlFZj5xPe5YHM1tIHjHXM7kiDNvW7zGEdqho4
X-Gm-Gg: AYBFou2qydZhFQCun5sLgpD6HFeUOgenlu9JfkHKOGEnBP5bQQaMVLd3+plhFn8T1kQ
	p2cYUWq2GcgMnErCS+7ikTsFhv1/Dzls1Ag6xvEYHgudhaajV6aU6KB6ofn83te/HIcDvGEZSxI
	59pNIjZ0Nt3TCSlTUGkMYzjIfUqvYBlMTPgGnIfjM28WKrLv7sX4vDYMafPa4sYCmbI16Jjo3SG
	E04GGRleNk6FOiOMPM6hp5K+VUWQ3uL7ADHa0+DXCoDL+EHjn6V31Sizc6b9Ld4sKvOkKn3bNI+
	tOQoj9IZOR+SQb40eRIBjpNb0rYkcJv0zg7ArMgia4XLAZUs0AmlbiG3ufwenbvF6Y0KX/iNZ8M
	R+k1IVBPzAydkXHJskD/mHDSUh+WibrCt0uAg6Twk9MX4KGRp3VSlwYv9qlc03Zoi0wuduPmWGZ
	u9t2+YfrbC5vwRKKk83NeLJ2bx+EQQgz1ilAdHnpDw9aHhLEoNGAmyVoEsl99Rmhc1+Cp/Duhf9
	DSjF/JSQrJ4CoiFsfMO2h7JaJTYrWLTp+cTayAeJ34g50Kl2GpwFhEx/zmDHRXwWtyrF6UolVHN
	aGnzjz7l/MX23pIEOdSeADSvUib5yXfSXgNxhhQZpjU=
X-Received: by 2002:a05:693c:60d1:b0:35c:1567:7966 with SMTP id 5a478bee46e88-369e8645a90mr6116187eec.27.1792897599315;
        Sat, 24 Oct 2026 20:06:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:38 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:25 -0700
Subject: [PATCH 22/31] hwmon: (pmbus/mp5920) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-22-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the size of the receive buffer to i2c_smbus_read_block_data() in
mp5920_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/mp5920.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/mp5920.c b/drivers/hwmon/pmbus/mp5920.c
index b803f3ddf8ea..5c61b3c610d1 100644
--- a/drivers/hwmon/pmbus/mp5920.c
+++ b/drivers/hwmon/pmbus/mp5920.c
@@ -46,7 +46,8 @@ static int mp5920_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf), buf);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_MODEL\n");
 

-- 
2.56.0.257.gf7497c7d27-goog

