Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897604;
	b=DqDu5vBrVusrVFf9G6wPoey6tPJPQtnLGke+0o24Uofr3H9gHGFAtPewow5a7nyROHTk
	 SO+8c4QWRE0audgNpvIQHink4Q+Q64eWPpFjrb1c2/JNjw22RdySogqJpJXcng4d7q+ZG
	 FCuZbCqUHtIi15YqezA6NmX3X826hT2BgHUYdNIElZ/sTdN33vUtuhzCnHEL1Tb6Vzb+N
	 Vb553OlqXZ99AXv2GTcKYp4NgzCytRmdbFvxc+KAiJDf2a8WA4uOHZly58112C/6X0Yea
	 lqLF1Rj3JSYoBgrwxXv48lzj02MFbxSgcSVvKh1iZcS8MlpkaxAUgwJurXRlAmu9gKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fBYi8O4QA07VQKy3pEcvXZ8VFsZZf+PXW/6Hkw6BDHM=;
	b=qEzpJpDf4VEgHGaa3ibXwqDUwP+cmWxLGIyYmxDiZ4QtEI91RhmNtSiw7eDbfXXZfLMn
	 p6bQ5n3etY1wATbYc9AOxfUvKtze4cgduvBtDB2Mc1UWJtObydhIq+Uc2AwoKY9qHyoW7
	 7boTbwICjQFkqXYZu7QydTnHOgIYV/wYU9i5IbfpfkExUbwCQSO4jOg91+xlbXmpu2/vs
	 6uKJN9I7rgSjjN94E0xEBGf3JZGuonvWHD8jbmyNP0H5JkM7F+ReJ5x72ujUddoQM5kg4
	 sUSPcslvwwdeYM/B3DdG/np2XpkMF5Z4u5GQcfRxCmHOQs3uDXIMJQNtQ1vdiYs7Xpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AsbqCkTK;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756B60A3826
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3756B60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AsbqCkTK
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso3604411eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897603; x=1793502403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBYi8O4QA07VQKy3pEcvXZ8VFsZZf+PXW/6Hkw6BDHM=;
        b=AsbqCkTK17jaZVsh76plonbQ06LU6YmOCPtpEi7BEl27mBMCwRRyi8hxLNdx7gbiiC
         n7FygJCLaYepeeORElpOfDNHDDZRxPuu1pJZdKuIjNdQpR4wgjLiLL2qc/zuzL85AdAh
         C0D0uGtZThFuE0+/51tq/EIuaduGsdgjR800KLxsgkTmF/BVZMIRo+kfu6eKVq6nj3l8
         dv89X2BP96zqd8/XmxZkJEyVvx7Is+48f7NYabHnBNWRr3+F9nZu8N5DVzWZ4zwwACEl
         0GYP4wGGs+/8FalQ9xA9lH4+BLJ/q96n5VkjW0UopI0rJwA0QziCTRhmpn1RQkwPCKeW
         S42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897603; x=1793502403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBYi8O4QA07VQKy3pEcvXZ8VFsZZf+PXW/6Hkw6BDHM=;
        b=0OMndBDcEdKW/7oL3S1ik3zjhPWVgtKihApfi67aEYJK1bKkKUw/Y3jAmve27G6FMk
         Ayl3+VJWQ37tVR11l9ShNeQigiOvWdUNa7Or1W8J6PeRtP+bHs2o4iLgFU8wUuqI2lY4
         ZwndXLR6h6u0/g7lKq0dPNgElfuhxkCnbpTCWFjLIt9mAev/BuDrSxIcFYjOTnowe2aZ
         +aNgJvz8lAq+D4eM6kRJl7rT7s5qa2kqOGA2DZGYqtVB8A1i0xWgbL1/vHWxqJmWeaJE
         B3+A+7TzspDZYEMcXtIVZ7pNCFN1+J9FHGoPwD9nNuX5YELfCIB5+rMeI7mMSW/dzQXs
         A+Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzfBpEqlChpmfKVZcMk6zS1YTEeFB5ZrO0wszspRBJlHxo0ue5rgt/sEPHIhhkew2h7fS6//x4e7TBcN+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQLYtUsIHKqHw+1wSsqOp5mtWNAZN11F4E/lUTxgi1TKk83Yvh
	JhFv0vv7lWXaY3B8vqZHsp8cH+R6+d3yPPyqRvBWYNF5Q1fkX+P3ePmQ
X-Gm-Gg: AYBFou2LtMVd5c4UuNbdjt+4vVi4g6YTeeSBrVNSOrgjONG4T3kkJ1Nz1R6vJcPuF4Z
	dhxcnF1eG0n7G4YQQW+CbzwYnENxo+ervSjvWww/pWLhxZ9MoDjSWBrnawJ1fUebwIZLyPWYDWJ
	NmYEStXxO8V9B8/x6VBs4n7W5Y76N7MMKQj+1nHQRho0tETKi/9mLDC35TiOVvr4qv2TFFdKrs7
	I3ZKiaPz7Z3b9rkDVdxBGEKp20NVMcCDQWZrNSzmpEDZw9aKVy/gY/rchewoobEiP1jtkf59fHw
	6V7U6dCzC8+2AEv+ERc27ykKPi92hx747cWkYTx+1F/RxDHValY2wNiO+Xb7On3IbWdESm+xUGt
	kFR+FNyxiBQdnWFi2xMB22GLEagywx+Gvq7dWcvpB8t6WTvvDZteCqmZyF897d0h7VdvsF2wKfq
	YILulN8qpHiouoOFHTaNH2YdiNONs09nVuuDsYt9XEhTld3g7aNm6VbamoX/3mlVqpG5DjYNuCe
	uEa10m44dKQ8qGKdmTyA+EG2tgwlrrkhGI3Pv/wkgR3V9f6t0R9BweI1+BFIxdpr6hzjTKrJ54x
	ul6/cxcaPAcRyiJ+Vm92wyK94/+d9YAQWG1dmrd5fZE=
X-Received: by 2002:a05:7301:d183:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-369e84dd32fmr5875884eec.25.1792897603370;
        Sat, 24 Oct 2026 20:06:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:28 -0700
Subject: [PATCH 25/31] hwmon: (pmbus/pxe1610) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-25-e81941ad0cd3@gmail.com>
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
pxe1610_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/pxe1610.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
index 6ba2b3e0e565..6c1d362661ad 100644
--- a/drivers/hwmon/pmbus/pxe1610.c
+++ b/drivers/hwmon/pmbus/pxe1610.c
@@ -110,7 +110,7 @@ static int pxe1610_probe(struct i2c_client *client)
 				     "Failed to set page 0\n");
 
 	/* Read Manufacturer id */
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, sizeof(buf), buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

