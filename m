Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897586;
	b=cMyTLz669HEqigyDgd0g58gbvrBGVvi7gxR8exD/nCd/vdIRR/fC4I5NuS+nY4Ipis/O
	 fnpbgET9GYruN8tdb+vElWP+PDwoOEqSfr8qV82uDEf3w7Bn8X4cQTD3nBd5+/0a/q/Ty
	 Iwlj4lEgzfk8dYcFODYtwtabQJSf0mzkDDG7srMwRyR2UOG6pCFz/ZPHjEGbDNQsR1ILK
	 mu/V+VbqdJxuCB/BsHJuuZUg/KSz0YryYKDM3LcZXlQAIiM+xkzNYSpgfvmxcabCPdBMn
	 z6m36xthj+dWfHf0VBUSnCwGCYdIvrl9JeN9HisRjJZCi6o2tcX3/GCIDPXdqM0C+Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=osyCBuMlFwaJ7pCpXIldLLNCTTzeyf5KJ+XpIin8lLU=;
	b=BZQ+BZ7VHNF5JlYUGTPIS9w+1JkRiiZXrtPkZ0U7bFeMAHxBYfZOGUj1VS8Z4VP1zvsP
	 0ia5lkzxksLn1+0Oy3XthyiI5v8sD3ySSdFcp4R8p/2Eg3Hobhe8ynEEIJtIkCqdL8a3a
	 3IIfomHXGhvXb/aPUlCe2ENTIqtECebLMo6zi0NOiQaOL1DMnT+WioJlx7/sA+6MRA3u+
	 j9VIOBChPtXtIWTaWaXtAaAinwIKAHbgqcGAyHc10dgnKobJDdLWd/pE4B3s4q0ngnbBe
	 jxIZWwBHRHNras3xWQTnhrny601ESCEUpmJ/apVIU4POSX8u/BdraFkrLxLxyGQbm/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f3FPvKUA;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542CD60A3832
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542CD60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f3FPvKUA
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso737856eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897585; x=1793502385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osyCBuMlFwaJ7pCpXIldLLNCTTzeyf5KJ+XpIin8lLU=;
        b=f3FPvKUA3FwLxyTVNlpoN/PVAzJWJqqU64XCci9jEONr0TiI7pON/EQ9f/+ple1kzG
         lFMvf54IAfBFfZ64s05j2WQSaEzbJ6HIXxwfK/YDZm+HiWEy7Mh3XR3HuM/2ymdY/NdM
         FNPSneSMqDFvpXbaHObqEHOyNsvNtmaNjQ/1857G9BUYeg2foYxPxTCzAb94yY8UjZfP
         Yv5jvw0K8acvXEYFM+9sva/TdhffwOxL+4o6K7V55pstQaOKEDcglfp+KhM/f9wReb7X
         /Se5X1tfZoM+LWODjS3tZh14Ktn/InWj0LUJ5dj0DRL6W2v+Rr0qnC3cHulGACYjmYPS
         V9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897585; x=1793502385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=osyCBuMlFwaJ7pCpXIldLLNCTTzeyf5KJ+XpIin8lLU=;
        b=fCYcsy5Jpi3vrBMbHq0vVS2v81uzIJz3zDumsKaniIg2S8jYskGJFTfZAy7Tsx+bUc
         4Wte5TD8FBOiQzAeDTRs1EwiRFZANAN2xIYXlkS0A0ZWvPO14ZvrE06aJGulFWX4CD38
         o9vjOxzllymBzaMX+0YeKmScMWZyyqPdFMG/mPfgbAWAnxs6NFxUGBwZCVJh84v+wm7Z
         UC6W5xm1IfQd4Dp68erfwcHIdyMqrsvWt5xiMBZJn68dM2LlCpQb4MrSyx2E0gzpAS6v
         mCQqo6lAaqxfRqMpOFDCcLMJr7Ckxs93jWJ7JLlPCbjv9+YpAs7HrVUP/HbNaGV0khpE
         2Ngg==
X-Forwarded-Encrypted: i=1; AKwUvBxdq6uvg/2yxXoq9rBTsvMewz6y0Qb1Ep8ljrgmCZ6oinP+mlbeJhkgiIAa/bJwQNLAOMmNMH5I1dVyvNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqPGNY6RydWplJGrIGfPdM2PBjoPRLMDPk4geJNep5pHBKKAXo
	7CTkFW/vqlKpOdJi/m0NDuvF6AM1B8AtIiENygNJ4XNIc10a++lovewo
X-Gm-Gg: AYBFou1zmoH7kWx8nFfbcdB5uR0yRmvw7umXL7/IKpEnnv7fjB59rBjmcBTKgj8dWw3
	ZduVa+7V9wMwVR+EvoS7Usra2wWX8ArczYdvONwtOGLPBvW84AFhKcyrV5JKgloqtZ5njdKK/0F
	LAGqMok/A+RgtbkIYz9ntHE7aMTrLCp8SSb0yqgIFGIxVZqtcCQMVjsrzZ7+RJN0s+iKZdbZnbH
	6/iUgRTvvV5X73LDzt4SazzIhjJt4gLl5QMT64hHwYQtWbEGGt1CL+MLiDqiWsEoHqRJkGXQyQT
	iMQmdCH3gDwKaHO8FlOmUVbMpFKkJOvTZEb56Umkl4Z4t5ZcQTJTCLPD2y2clEJkK4tI77KWLQE
	7MZhazlpVwK/OwPGJsQ+G6ykCILdQgkm9xTkhhnBti+nlDN95PKTvJPkluRhwliilw4XoxH+ih+
	8PNTl6T0PYmIRlRcuSW/HPqYw1X3BTp7Z+jMRvPq8BjRPPxVUgNLWYFOm3STY8HRqk0CNivWRK7
	Zm+ED4C7q53auSJYvmpXTRITceSd5vTZchzYXWd2tQPeVKodxqucGXca0z+b27A0nutt3C68YEh
	JyM5NMKNcFfliopp8GdoddhMwZm8JwTVSPaBDJx5V+4=
X-Received: by 2002:a05:7301:7bc4:b0:360:51af:3146 with SMTP id 5a478bee46e88-369e861475bmr7532937eec.14.1792897585448;
        Sat, 24 Oct 2026 20:06:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:15 -0700
Subject: [PATCH 12/31] hwmon: (pmbus/fsp-3y) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-12-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in fsp3y_detect()
to leave room for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/fsp-3y.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
index 44cf2db9364b..c59a58001c48 100644
--- a/drivers/hwmon/pmbus/fsp-3y.c
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -205,7 +205,8 @@ static int fsp3y_detect(struct i2c_client *client)
 	int rv;
 	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
 
-	rv = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	rv = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (rv < 0)
 		return rv;
 

-- 
2.56.0.257.gf7497c7d27-goog

