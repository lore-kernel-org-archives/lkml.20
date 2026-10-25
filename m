Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897583;
	b=lqiGsCYgT6124kyo8bKkGsK7jqeBx7QX/ydDvx3k5hOzqWtjT/5hqzIJU+7xsV9A7FSh
	 nQ4pwpf5lQtGWfjsPwJOONx7zF/dCAvqnDw6qr9g7xQ0YeWoS4MVrghrAcTm/aG7C2r3w
	 1MIMSwtjyFk1DOyPyh4ziIeyYzwSBrTAb81f2FchLukv9RbDlmHy1r337AmoVbEtt8CaL
	 S+WciQHT1u8WanAxFv6VG9XR9q8Z1T2OBO/wbvLERSf47EOC1K/iCyWXP3tY3x+lGJd2q
	 FgF/ItVERnmX0zJmebvfOyil/YA+IM3Woo/kuO2oc1o6Tli/R/rHbzrW9FJ2/xSPS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=37YSdRLR2oXjp/puW74AN9pz/JpDSvq4Wpuwvp0oFn0=;
	b=FVNHYzZQgolvxLnBZCU7i4LHQ4sjRhyenwuQ+uzntFxWCeC5z9f0C5gHpaGCHRJGP12r
	 c+tEtt4cKZ6fsOSTDQe/rzq5XTw4DYuH8Fo65EhPB+qzGPHGU8iPHA+KL17AxI19OA5ra
	 RFyvlCBET7eGLVDZhuYEU3ihHzdlrkamWzsxixB3H0msITOI7qJnHIojq60D6l5KdKIRb
	 qN7V8fnkuYOv7P7zDW1s+5xOEPtp5UNHW+ESoLMUtmQRdS90LFohSTZHT+T1iRHl4McMF
	 3mNuL6XNy/qZcLJx4TQAM2yPsL0rdfjo0F7aLafmShIZNIQzu0nm1B+bOGcuOv3zMQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oAXYFdpz;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1E606A336
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D1E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oAXYFdpz
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso737810eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897582; x=1793502382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37YSdRLR2oXjp/puW74AN9pz/JpDSvq4Wpuwvp0oFn0=;
        b=oAXYFdpzDzYNtRKiQpo9zjNRCMA0SK7tY4WHGT/jYiAr7jvzW17shWhwHHtcyMBD9e
         JzKQtwNvsnp00ce4tMgqmwpNyCw8/CcbEPT/mFoNRMFzZ0BiNrfKlU4dnouOFf/jxFvm
         9K+HrmIwFF7hR/Gw0Qt4cU8rvqFTXm1wZr0s6I9XxIfrps5PTWL/siCL4pNeB2rWhCKs
         rwmA7czf0NjWLsvl6hTcQSvK8W1Sp857jMOdQ7Kl/qOIc+ObPC9cfp2PpA6xPdVHdNKk
         t5fxdTG5y8U4C/5U6BcQKzi0PSe7riUQiUxHgin/1qP0NWSCZ2rwON7TXczVyHhDF96U
         EnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897582; x=1793502382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37YSdRLR2oXjp/puW74AN9pz/JpDSvq4Wpuwvp0oFn0=;
        b=onXm6ZVyszJtJ8BYnF561NoCd8t3WbZN7Vjb0ZgwH1RRHhK3pHXWXG3hh4eu68QfpN
         Y1w7d3MEsYZfkvXLBNRP02QuZlYTx5NChI8uuet/Odhh9fXC1kpJA3UuHJUnvycF1d8N
         RVRWoVzSpWu8oSAf0KijYwC1z4cUQ7yHL7bkVUa76L0GIZLWUULzx9jxsfskMVz/qwVk
         FH2yn6vzox5JswZsjmetGo9Rjwg6RLJRtT1DBjlrBj7zZWjLUbaIVbNI574skXkgWpSd
         ONarJHHvkWmzDtLfXMnE2zyn9bxnRm76voE08n4QL6hmYlHqScGf514V14hDfg5YbANv
         hoKA==
X-Forwarded-Encrypted: i=1; AKwUvBxqf0bRqhlCUzuWSSf0avYw1oNb1ZaK3Viyyp1VYWG2GGViCDy21uTaqASqJSjq5g0eY9XbPvVi+SGRuqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmEqAepJM7NKIQqCXstGEjgCnjfGF/qdHYjrE2JuSsGXPxJ2JF
	P4aI1PE5MwxcfaWnEoluHJJ9Oq4mVUJFcRl1GzLCyRODETeSkN+7BtMq
X-Gm-Gg: AYBFou28WlpVOaY0nF9Dq4IRdjV4GXaYR6TBRK2uTiUJaWqU0595ac6KJEQlDZM+Hj1
	eZj1JQzh8nkqSBSwk4dm5dGuFPUV1B+mQ0j3kqzvysMbgRcoBRttDEUOuG9WgmU3U7W9Zrr0psT
	+l2+rRNkAil0K7HiNjUBBsUBnDkPcmFdrKcfwwJ3eEsXCA3nrS8geTP5NLLjSMCHZTgjXYoExAS
	9DyZ2Lcb74aPRhFG2mLOjwiKnnLIlFjfIo7xww8FtzReKW22WPPmNagg6UzemaN5CLaYa4HXxZB
	1qa0EaJAofjn84Ihyjnpa4OxmPHq1CVvdNOtCNa9Q8Gq+EIwLgjXJTmhvUrZXqHInV7YBZKF3in
	gZj/iK15DWwz0CU9cW0e5MVHLKC1Q7Z1ObKObd0g668dBvkRhfzE5Y/EESnmYKsEQngdcwlT+gy
	wBCnvJmzrFzSnUDeB8p9JVhyB6ViM2nmfItznm5wRy/56xosas8Z524A7i41n18d1+2ac60i0Bd
	D06CDsgrbc2LDFbYRqXpi6awhFCJ1vhAtEZmb7TXX7AoTj/JxAtxXFwPLZKD6K7fJ860TjwtR1e
	ebQel93O3vQiDypTNZaawk2UWrqMMWsDaklh/UJIhQA=
X-Received: by 2002:a05:693c:2d84:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-369e84fc4admr6982566eec.9.1792897582509;
        Sat, 24 Oct 2026 20:06:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:13 -0700
Subject: [PATCH 10/31] hwmon: (pmbus/d1u74t) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-10-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() and shrink the
temporary buffer to I2C_SMBUS_BLOCK_MAX + 1 since only a single NUL
terminator byte is needed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/d1u74t.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
index 752df3af9c1a..758464a6362d 100644
--- a/drivers/hwmon/pmbus/d1u74t.c
+++ b/drivers/hwmon/pmbus/d1u74t.c
@@ -30,11 +30,12 @@ static struct pmbus_driver_info d1u74t_info = {
 
 static int d1u74t_probe(struct i2c_client *client)
 {
-	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	char buf[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
 	struct device *dev = &client->dev;
 	int rc;
 
-	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+				       sizeof(buf) - 1, buf);
 	if (rc < 0)
 		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
 
@@ -45,7 +46,8 @@ static int d1u74t_probe(struct i2c_client *client)
 				     buf);
 	}
 
-	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+				       sizeof(buf) - 1, buf);
 	if (rc < 0)
 		return dev_err_probe(dev, rc,
 				     "Failed to read PMBUS_MFR_MODEL\n");

-- 
2.56.0.257.gf7497c7d27-goog

