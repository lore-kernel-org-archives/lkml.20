Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897579;
	b=i2LtgBzCvXtxJDG2j7uBmvmt8ozcMwIb9U/BTbK5DDms3pts2lH21U7NGRWddLKshz6B
	 9cdXtHLzXCqvgsBrSKWNnARBmdW7soi0MW0Acw0uuvXrBKwVwGix8klbLgVs9VH4B+s60
	 bJYgBjRvsqTzuNZsEZvhzeVGDAjO5zuD/v+vXY2rEUuCtw28tk/Mz886tZFNDPXyOQuIB
	 bVIpvjkWZmGTD8RbDl6PU6T2IOie1rGsOXqB27a5Lsty4LnLZtBbvzMNoZoFqp9e8JLIJ
	 emFQ/Rx3SMpI141M9lAlDEwTCB4PuMb4IkbWMoNOcLuSR0+ar33lWHJCcRN70h0xHBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FF8w9zVu4AP+nPNl1ALaiTw8x67GRQ4wpz3rkS2M2QY=;
	b=Xh+rlS6TgiAd1hY9KEf9v0eUJQ0FZ/1JSJ/guFYoWMuox2YsYLw6k/6ylhhFYwOKtCSH
	 x58ooFn+usQmjqehJeSunH9FgdEO5EBZX+/5+4b3iRZaUq2JAF5X2z7ErVw+M01IbXtxt
	 5mTiXsZGu1Zhauamfk2JjHKYQaJxxNjnrEM6tCtVSaGnFsJSsuhQIqI2e04nM5amabdV0
	 5yM/1IB6076TRbqPQWdqqamknhs+HvSQtoejMtC96TiMVFxsnh+CyitaE0omPyCEyo2rq
	 s58EmOw2+PTm7DA6tL3HErsYFwA7d48GO2pKvYaGBRHWKJ3FqXeUxKQhWCVJx19rKoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W74iyBgN;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5313760A262C
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5313760A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W74iyBgN
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36681e85e87so1519634eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897578; x=1793502378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FF8w9zVu4AP+nPNl1ALaiTw8x67GRQ4wpz3rkS2M2QY=;
        b=W74iyBgNuvhBA96Gi6tsTdhdZgNkOIC3Zu6tp5KSv7uu9rqwZgpi+29BrT74+Hbgm0
         dgDOgGGnV2Q9wIoYiZpdxuTYrc/4lE21Bhn+Bki2Lg7cUDz0xVFA9S4fAUbKR5MfU+7e
         1ieRPtMVkS/4J/tCSoGkX/eBOkw4rMeW3fRHPFsXzCDbZLGY3fjP8nWU8dv4Ae/K8B88
         dTPIfmksmhvAOH7QcvYtwFfNuYQb24ytJSg9hGAToKHwbA+q+tyzgfjRadzv+JDmSNUC
         QZO6C74nE2ABuLe9ADhAv0YxQeSGnGjRr85F2AdNGMnbdWbUURqxnIU2FPa3j1k0rq09
         0Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897578; x=1793502378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FF8w9zVu4AP+nPNl1ALaiTw8x67GRQ4wpz3rkS2M2QY=;
        b=AtYLcM3vmC6t7acIFmTdu6trz70QQuYgDpbqGw8GxyuqNQYHrOraUlx85s8BPpmuCk
         4xA0kRc4r/PLsgQ7bt88tDmmDZRwCzVNyIi2YNN7KveMyF7KyQEYBmqci4A5XWe0rEO5
         HvkHJeEJO7KVswy9LlbJNsMII/rkZxPR16RXQipZF7XRO1Vbeew3BzCKdJALG8MfI8FM
         fRcGLSbTKLUyLRGaQbRYEo65lEWw4sJN5JLvyrTJviJ0LYuvMg9ehRmg+XHB2ruShMqp
         akndW7QKbUGyGDT26kOgLaYDYHCzFYqzFRs4VlTWs+yuVw80FZooc7jXZrYZsFABb+4T
         Kuvw==
X-Forwarded-Encrypted: i=1; AKwUvBz5NvnrPXjMVZ0GtaLYtkwJ0bp6h5PbT4Dx4VVnOX+VDiHhpj59l8jJdnmxt7DZovGD+k16iF/O+vVpYzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVCG21K0OB8ztnfyX7zSzOlaD0oqNgtiJ7fznwJwXJ/HodAtr2
	toMl2frWlxBSQ9dL5yraQ/8pt5CTp5JjnLAVS6sQlboddYhNmTHhmCnG
X-Gm-Gg: AYBFou0TU4z3NPcqsH6mPBDcXKBPJjEupJZBid4utsz6sC66V/nTQpZS0LOrjt2Y6pX
	sqOgseaOTu+ORi1wJcuhDl1QG9grW8+fgMNT602ybt4Z69oP13xJC0DFW6i0Yyp8j4E9x6t7gJq
	s+yre+rvfUv0pM7R4mIAo2kZK0xDOU2fmg4/AhjNVVw4JY3dhmr1ru/Kez2LSMfFwaIXmSZxe5F
	fFdDbelac0OtnBzAsefILjYSoqt8a6aTtN5YkOHdHyh1eCRR6/Juatu2gNBtejt+9gXRuUPCNu9
	3WdI6mzOeJ3T5p+ZPjYpz4ImzU1DjnYvrANYxupVv+RfDhe+oVfLUif2Wu3H8CoMIr4yGrjpWMn
	vjFsGa/yCMBbkDxipcYn7wC/XRE8jzaCodCwS/r9oiqEuyrTIEwrNZi8eEvT8d2Uo9juXGnqUmZ
	hYhyhED6wc9z6WAjor8qLrRentoXDLV7O4zEFl37FTeg9pcJ69theDy5EpXT1TjCHEmaL4rVvja
	cg4OwTgw3BYRsgu0ccLj5Jc4baVnmptUZ18BMZjpf+jEmTrOmJQEXdcmRoKo91osDxMxNpTwvs4
	crMSlsIZKz3fZUu6dbl6WmEOZveqUs1ngE6S25OfNEHz/XKOZEUlq1kS7/FYnMVI
X-Received: by 2002:a05:693c:66cf:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-369f18f376amr2467244eec.11.1792897578383;
        Sat, 24 Oct 2026 20:06:18 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:10 -0700
Subject: [PATCH 07/31] hwmon: (pmbus/aps-379) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-7-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in aps_379_probe()
to account for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/aps-379.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/aps-379.c b/drivers/hwmon/pmbus/aps-379.c
index 3ec0940ae564..a21213c21f7d 100644
--- a/drivers/hwmon/pmbus/aps-379.c
+++ b/drivers/hwmon/pmbus/aps-379.c
@@ -117,7 +117,8 @@ static int aps_379_probe(struct i2c_client *client)
 				     | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

