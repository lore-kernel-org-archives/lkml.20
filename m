Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897590;
	b=QrNfn0SkGK6JFu74MnSnCYb3vnwEQ05NWjmeYSAcb8yNII/Y9BuMzCLkHhr+gfr46jAH
	 r9jovcDCntAnXsQwwhfRrq+zfrdfLKAPxJgyVK7gelvLZscb9aNE4AM3LOXNwh/jcgV98
	 +BrMG4U1TU5P12r+MU1gevwn4vdzNPeWQ70UwKQu1Cig+NmKrWT6CnIUESKQFGHn6hELs
	 21mbF00l+1lbcOo2bvynUDwK1ePav5PGCJPz4vG7HBZLC8jrMEZhPYyKicml4mtVLdJ5z
	 lE24K7T+UgQzUJJniDgO8YLz0UgxNUUN/8fY+BUKIMpH+R10eXnCre/4ArvzO+fTsEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hk1wDV3cftNul7hst1bpw8ll7MqO7jC3vQTcFnAfOM0=;
	b=LVgTLXMTTvTdkm75Z3dvpv4OYcK9r775459bVEjv89ipB414YmUwlsK+somu4yS/Qw0f
	 cURk3T+VZHNzMGI0G7bV4VttQIORq1o2bBPdrQNc4m5tYPkP/I3cIHcA43U+sJHbshMYl
	 q2qT3fkWY2eXkFUdDvTmb5ZTFo9tTGiZBNmBwMZSfamrl1S3Y3YVryhWAAQKbx7Gudz6H
	 O6xRjv/3roElccRn6cf6OuAJZVSrn4vb7HSuKw88ae7cB9QVhlqlW0Y0CLwh7RXWx7y65
	 FoCjXxTfFQaE1YlpQSkJFNS3R3N3wELwu3hKeHp2iOXmIGLCxyDhHABVYgeO76m5Oaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aN8Enjwg;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1F60A5BD5
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD1F60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aN8Enjwg
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369f33df08eso737908eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897590; x=1793502390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hk1wDV3cftNul7hst1bpw8ll7MqO7jC3vQTcFnAfOM0=;
        b=aN8Enjwg1S+wyY45qPIpVzwnmddTQSjnGLzLtTtX5aywM4Ypnn+84EIVjq/0PgRatw
         EW2bv4jFE5sb8kcp5uCn0i2nzz4Lbv92cEE+/4MnZ81zAMZnhifhkHA7hKLbedSe8Q1U
         SEdy2X9nm2FpC/lioHT8oylUbBX6NdkDc/oVXYi58HXnSEqZKwi87QPcliSyH0dvgRRr
         qv3i703MNbkZjIyMMylbY6wZ/qoWm3yrXz1vDUbM6Yhl6Bdb4vHH9oEJ0baK0yIADVuN
         GMq3wNoIR2H0lkJjqzLy1gl1pdunGPz4XmCJhCjaFXZNOQn2BESKmcNdEP6rndAmgxA4
         PJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897590; x=1793502390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hk1wDV3cftNul7hst1bpw8ll7MqO7jC3vQTcFnAfOM0=;
        b=D+Ae9sV0dNwZYneMTbLX7STJ1mp1yeleIPU4unD9yvwjtVDfyvTMxn1pyWpPSomPJI
         8YJHOd7EZ0Jhw7PmvR048boyNLFkq3Y+mYOq6PRzOC2ZY1mJUNOvpfC3IgrNUBt/uFI2
         O30IvWMTL5VWZpivvozFWzeqLW9jf0lXQOEtlMvMPAxnHconm7Pe36sCfFCeaXMLCQIs
         42+qDgZQTfVhTuWVAAwwiGlVXjpiv5g7wc+roLb+tfdVcWRShHTkIpfHPTIfwNLnP5dx
         6xTlHFfkz6zNO9E+q55cQeRpnZ/O5xss/ju1U3yJMypQYa2mHTdMX6z6U0eC3clTH8ce
         IFIA==
X-Forwarded-Encrypted: i=1; AKwUvBxU3dTWKPyzi8klYQr30DF8itu9m6nyH2qVkRoIj/4mOD2mAoRCBXCnQ0JdIqJeJgu7KiZ8X7Je/DohCMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS0EK501r1I1JOypUcjuXqhYHtYdQ5SJrbwwT6DFfpZ0MqoN7c
	9rQvWeNAAIuu5Qytp49cPU13rhC47OtIfh4y7aOsRoqSfcMOj6sFrvjE
X-Gm-Gg: AYBFou0Mm8bpjg7gNlZozD06UbxxriA4cPIROmDhhmPcrmo68dWH6124fjYZK+lAdcr
	8ft3/qw7r1WMbJjrw8h/laY/8s+UqddAphCShMScJehHxDcDODmd3Ry3uwdQQPBPOalkPEEyOP1
	iVlWtJVbszmQ50/5ufQRISY2UMQKmhm4wqt2hkdHMvP1RIXHnZEr7ujhH8RuVE6C2LfPd8wepZJ
	tfVVixlpW2HonlPTeQKaMNNwCpU+7z73QCXrfkGQOc9dz1ERw70HwSIcxkdYXS7vpfjDNDklmNp
	0MzF20QpQqTySRb2ksHj+VWJUqNjWa/hm3EXrhCsMGiZi1rH4Sq8yMiKU9SZi0zJCYxGexVfLTr
	qZuBU6kdpjrEYKcLdU4L2Ynce67bxydZWwwkvZW0vi9akoDRf9OsAYj7COTjiiXHuew2+OsovDw
	3aXLVZoMTfUe2ksWvBGGvnh09A6gWRxkf1NAhtlquq4xQecsa9oGMZQu/x3nfRbdL+LOpqvlKYH
	Pj8uSW6x95G/V+vAQtkKWR5lfT5c+p+Z8God0T0D79glT2mJ9Ni24iP95zhh2UF0qnbWGA/g0s+
	+Kmx+JQB+lITNf71WnbZxpMirOMiz4oWDaxK0ZpCvcH+
X-Received: by 2002:a05:7301:b0d:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-369e864c29emr4731675eec.28.1792897589570;
        Sat, 24 Oct 2026 20:06:29 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:28 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:18 -0700
Subject: [PATCH 15/31] hwmon: (pmbus/ir35221) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-15-e81941ad0cd3@gmail.com>
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
ir35221_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ir35221.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index b2120fc76f40..346276efff87 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -79,7 +79,8 @@ static int ir35221_probe(struct i2c_client *client)
 				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf), buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
 		return ret;
@@ -89,7 +90,8 @@ static int ir35221_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf), buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read PMBUS_MFR_MODEL\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

