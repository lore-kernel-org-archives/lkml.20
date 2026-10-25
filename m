Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897580;
	b=rrUXbUclDE/iaOvgEDHf4Vxim++E0INhrTfF2vNnP4XXOt4OGy3OfLuOG7htk573bYAi
	 t8E4AhV2zivDLGwzMSHd1IjlsGcA52MiMbnGOmVEOMDmJ6SXUD6YwA4zDLGRWcqvpDRGJ
	 +6hPHp1jjwOV1RUQ281zVHx35m3ZcGfECYYT58DHNdhldZC5jaWIMPRfYQ6zcNGhn9j4Y
	 7mhPCmcrgMBZAx84qTI1S4vcJ1LurjcsyIUfWI2k0Lr7v/FVOFXVnZABUV2SccGeO3wrw
	 GXIuxSdVBsHzLCbc7oGEagNo5H+aKxgjxcisrJMGxmA6/Bw/+EK52Sni9NHzExhs+Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=C0Kh3cbLaLA7blFbrHjQxFvQc6Tdt4901e8b+a4UrO0=;
	b=Pxd2Hf0c4Mu5wStx6JJL26WenFi01KBTgaRsq/YVRJWOP4ybhZILVLg03YRDiyzbaWeA
	 MDdyv6fj8MdznbRNgxYDZB6x3/9ftFPTnweMtw+yXWObFUS4K36hOyg5kNXxWrBGN/rAb
	 nTGtDIZ0lSe+sM7NAlB5fUb62KEnh6UFtT7PlHUJHDRTeB2o2KZQy0kuBiQ/jBrJc2B6B
	 m088WxZqGCUWxnO+8OPPMNiaNG70OvmzzT51pjFilVXCELv3dZU09QRglqJrQCaP5y9rO
	 cADamTAwyJkIUnFp29CfqS2LndQK/md0oHjGqbqAfvBHv6BbPtDMXELQR0hRhzqy9UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XS0yfbx3;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928E60A2605
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8928E60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XS0yfbx3
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so4737829eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897580; x=1793502380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0Kh3cbLaLA7blFbrHjQxFvQc6Tdt4901e8b+a4UrO0=;
        b=XS0yfbx35V88oYru9gjbGZKUkrWyabEIWBbg8svWUp0e6DhWJ76Kt4KnnEjnhA6lML
         G3eJU1mxvoK5clt0MwrEujB/Z4tnjGkvo2EAzGU877nZQTHNDfsOOHjVqRBiOzBdKFRB
         RDfDtbtob7KehnypHvdYETJNDg+Vko4qJL8Fwh73U8cHvNQCZXoYMMzbnrLrgKRUttu8
         Zvj8TqnF+DcHGyT6RvKiYOdPK53j7JMQ+1F+aN3tnFmYOH0ensKd2fXoDuCH+uWUjlDG
         awfjQT4rq+HAAKiXidlAA5n2TCNM5DFX7Fbw0p1/XvBW0sxniA0ScCYpoeguvbU8ghm7
         /SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897580; x=1793502380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0Kh3cbLaLA7blFbrHjQxFvQc6Tdt4901e8b+a4UrO0=;
        b=WZFxUypDn+7DeGBMnoDGJ1+QjLWkbkdlKX/O1gkTx8Jq9EEx+oWLs6UwnwiNNt52zj
         K+U7Bzsje6dM24QCnlUc5UR5nISqgGZz17Xje407TupnNCbX6/veV48/lRX8KEdPIEwi
         dKirSHtSz+i/h5nyxRtYDireTDSr3at6v49GOmD9A6h9pI5bC6mkTGptiDhb7fnE56PT
         +EF6bm6mJBcd6nlxhpDKdbwiGouAh32XTtoU1sHd1C3prU6Od+8Mc9DMzM4oo1ywncU9
         i+w2467tuVEL0eRHwDdeBsebymu+rb0Qx+EPVXM6TwpRSEZmmFEwdFoaaKYQZxUqeTEj
         mGAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGtZsBIVkerJ8Vq+hnG2nAStsEXJIVKHDludnyoMEzWlHko3MbNF2vc3WtWC3yJz8mWxTGJPs0X9ty86w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjYGqW0qpZd7odma3nacMdsEbC+y9DlzGArXQROIbrOzgrmoDd
	YnfWmt1cOWSjzLq30GYKxBkCF/3eBOCwv1NcjcrwO2C9LPls4O46b1x6
X-Gm-Gg: AYBFou3+D8vqkewsBS/I8L+34YWLiwwp0wQ/ZchGie7Y539WUwjL5AQU0zkB3jNyv5C
	Slh/IJ8Wp5tzwFa3zugpiF3shZH/DEwasjATo580B+g0lQJ/XLRnJ2wK01IhFl9VZ8KMiJ/4FzF
	OFkVcUzh+jBF+yV0T0oNt7StIihalQkUR2alX5WAtwRGDWgaURoK6Bs9/nzrSMQUg4sAJRnwMBz
	1ufZadwqDII5hUeKbJf24fEhODsKIwX67Gllmvbin6Xyj6z1YxT8GfIwiiL8lAKb+Jtzhmb5rnA
	5NmmFw8JsTkqPUOGT+lGWEcbp1Ro42qZpZHA3plmt1YlOmFpvLjuvOUJa/92Tl++v5h0ctJ0oGH
	eUE+N42N05hNfqcUyWdIwgWai0m8UlwP6L655HCSNiubW7sDPmwbDTE7T9dzoWKqt04XC200Oqg
	4nteuA3d94f1A+/u2xAZQFvlS77KTTCGEIpx4MwFwaHLu5mXtyQdv3GXn+Xv7TDDYDwv+tn3aL5
	FKS2ZqC9qblJi8ROlSdPSxttnlx7mjR6trpytMhSdYh5VI7ulEtzk1RAUXee1kNWWs5UYWnILr8
	MyC3QunKApRhx+i0/19qa+bnKIcR3x0zj9mDHMNRzRP5
X-Received: by 2002:a05:693c:88cd:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-369e845a18dmr4890429eec.11.1792897579757;
        Sat, 24 Oct 2026 20:06:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:11 -0700
Subject: [PATCH 08/31] hwmon: (pmbus/bpa-rs600) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-8-e81941ad0cd3@gmail.com>
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

Pass the buffer capacity reserving space for a trailing NUL byte to
i2c_smbus_read_block_data(), and ensure the buffer is NUL-terminated
before model name comparison.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/bpa-rs600.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/bpa-rs600.c b/drivers/hwmon/pmbus/bpa-rs600.c
index e364dcb59dd4..b562e1ea7ac5 100644
--- a/drivers/hwmon/pmbus/bpa-rs600.c
+++ b/drivers/hwmon/pmbus/bpa-rs600.c
@@ -166,18 +166,19 @@ static int bpa_rs600_probe(struct i2c_client *client)
 				     | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
 	}
 
+	buf[ret] = '\0';
 	for (mid = bpa_rs600_id; mid->name[0]; mid++) {
 		if (!strncasecmp(buf, mid->name, strlen(mid->name)))
 			break;
 	}
 	if (!mid->name[0]) {
-		buf[ret] = '\0';
 		dev_err(dev, "Unsupported Manufacturer Model '%s'\n", buf);
 		return -ENODEV;
 	}

-- 
2.56.0.257.gf7497c7d27-goog

