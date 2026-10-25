Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897585;
	b=qT72dCmlXZVAlIGafVK8ipoH0nG3j2fwIuam2R9YL6WzjIcWieQEufOV5SYCy01kJAWf
	 KMobE6+r7N/5d9rcjatpazSSr3s23V6K1a/1vXltXkj9YxFZh828QCfl06B1aL4xCVbK4
	 FetefIj8csVg0A/mnwoaN3ImUY/n65i+0euVCSzrj9TSpnfr3ySupfmwHo+MauU4Ml8Ih
	 wUhha4qYew87GU65Kn0Gaqmqn++aMCDQ5rV67jOL1RMPEDYkiQO6V6xtvwOMzr9VD+r1A
	 mn6v9T+DP0G+TvxDK66kJn62F2fh+K/Xdkt7GlSWj/trSGEiwrMoiMrdZYsJcxrqHCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=s8ijpeWG9F9tf3Qp5MwZtZwDcNML0+WlIyWXigQhgYE=;
	b=ObyRdm68gldk1ThrHk+0uba4fxLsf8BJ41HkxI/88W/ZqTqva1DEfA7kgq0PJMxHA2sq
	 AvRDMNoI0vh2lRnWm/F3o/NFdaKQoO96h9jDTsWq3oFEMLGuMuJopmJRozQbZFMsGI7EN
	 ltvkYh+3ML/IHsg22+GKQvEd0Dc5lDDb12RZ5DdG7soSOv/SPXNs5NSbOTvxrCmOJQKbm
	 SzdAaDu5tzmtYhPFmS3K2+sp+trnA+xX0MIC8uPMsD+rxy7ruh2ehnb7WQ6jam/K0LB+3
	 KaavnfpzqD+39ElhGXDTOivywHdhUusnxMpLkh7WUT6vH+0+PMnxy6ap7XJX6d7aQ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXuXv7RM;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E99606A337
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E99606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXuXv7RM
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36681e85e87so1519770eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897584; x=1793502384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8ijpeWG9F9tf3Qp5MwZtZwDcNML0+WlIyWXigQhgYE=;
        b=RXuXv7RMEUB/YmVbaoavTEmt4PecUl8tcQCW+a5iCg0HriEb99qoj17We/+5ZSasFu
         23aiWJWG0pE5kcxjCELSFELtQ+77if6SXil2IeiXaNDOUyUr5zhOyWuGEkEjBusjVT18
         wGmpsptxlSmAP6sb2GD/Fdu217sSRnb0q1lvLEI4c9K7DHisEsbXXwBmr1hrV540rAZQ
         sxLCuIcrlwshzFEdmKICBe9rC3UvBxgFj49A/FQ3iHUnOAr25RXMJiaNKL8vCrn3UVmN
         ePMdGeNoiLHLat52SNQr/JXNrwCvwPZtDGXMmjzpn2xHgaJXMrhzndc286BMJcEAfL1h
         xnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897584; x=1793502384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8ijpeWG9F9tf3Qp5MwZtZwDcNML0+WlIyWXigQhgYE=;
        b=ceVZ3BZhfisODtLz+huZ4Ar2ynYgmM9/hQMDXw8hOV7QAcXf4z3PsgTXDj8NQGMrU1
         9IFDlK/ZyckgwqW2wH29s81mdWwnexCHU8KrLAjWoWeJ6YoypZrv9yJtwId6vDcEHX0K
         Awjef0vwW1IjWmojjHqa6QoFhw6MDlxe/3FrVkqgUxXch4I4YkJ8HwGps4AF8uvGTkjm
         KuHc4GU/CCfxE836xu5S8smKDha2va07UMMpVN5BO5KJn3ewz2NhY8S3yxK06hN0C30X
         5ZnIJLJWST0vwoVbt4YrlAOalJBoB8bi4hbUVEbWe9ockixuO8SpvqVA567sJitVujvk
         vQGw==
X-Forwarded-Encrypted: i=1; AKwUvByyMJP54Pb5ptlYzSq3hFQ4k0yqGYL/Vrlyqi5dhpielKfnj4nhu6USd9w1+TAaVeL5XAiOW9SXVu5zCvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+7yPyq0kjihSXI0f2ZSwHr61qVeMMCdI6KnD+OUXQsHUSmXHd
	WAQUpbkIMDqtZgCjcU27xTlxcBK4yq386M7K2stp8mhxqyzJRjjO5gKe
X-Gm-Gg: AYBFou359GUXNxuO3h9IAYnchxD9ydiO3/KwWU8vB+8o5yfjbg4IeFkYrEO44cMjG7d
	CLTfLuL+WVryhsf/DMohfaImXwKymgJOd7xw22GWp819tKnZnY+NCDdPsVCax5wtAKfDt3YoQKd
	SGWDMyqMhqCKvKzAfAwZjWZdZnk/6r0eP3ctCTSACD8zs8vyGJsG1kyh/Lv0g+Cbc7SD9UuDTFq
	H3Hp+YTYqn/Jk8UoUfrD3KsjiqiX1J7x3mDA6qDEQRr1zETqJmUEQfhYpAlqponKK+pj3VZGnIr
	QIL+jerJzGhm3edUchOijHa2a8Cf07r3rr8kgLCc1nOCIwwsf1PrsqpQ7+7BVP8rvsvm7PyEYvY
	DKl8GVwp3kncTMV+qMB61jrEeFHzoQbLUq7AilFv4sqrE5oQJYUeyFgMOZ2SlR2gYbSziZL52nw
	ordd/exljlH0/b2C7qFRliKMnbEbL+3Sp69HsuWNSuKqfEzeMHuJ0waHvN11jfxExzYnmJBV/dk
	gFXGkGJLsQsUmaOo21/AO7aL5YobS1UuSnm8hIlCjpsKjI92guonwL4iscNKvWLpTN9ZPnmCxra
	xoQ+rTgdSl3mrA620dqC4i4xGTbNOqj0pPxaY9D6LeySyk+njW6DKT+p174S+6xr
X-Received: by 2002:a05:7301:2284:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-369e848c506mr6912678eec.23.1792897583849;
        Sat, 24 Oct 2026 20:06:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:14 -0700
Subject: [PATCH 11/31] hwmon: (pmbus/dps920ab) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-11-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in dps920ab_probe()
to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/dps920ab.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index 0d2901c314c2..694b5f386df5 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -143,7 +143,8 @@ static int dps920ab_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 		return ret;
@@ -159,7 +160,8 @@ static int dps920ab_probe(struct i2c_client *client)
 	if (!data->mfr_id)
 		return -ENOMEM;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

