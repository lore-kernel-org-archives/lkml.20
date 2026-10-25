Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897601;
	b=xDyNe3j5uFdfds/D80AjuPOD2hYIJIrmcTuyhZBXEWQWQ88PJuyI50QNYMkfoemCEibY
	 chGa7cHmGNZn9xjR9qpUznSTrdvaRXCgX76uFi/q1jMEBQbZG+nGhhYJxXqcyyw7CqQTm
	 Fn3RNHTRoYugQcJp/7nhVo94IlCOtrHQHQIKdSpyjhssok34HGXAs4Ukn5X6zgpzOJ0ay
	 5WFL2UxZnlN8PenQZCYVSV8OjWVI5Lk/M1wqdTPeCO3PfBdtemotqU8sBMP5vaoxqWcYA
	 Wsv8V2bJZn+IW5YqRTQBM7MhGgMthYGJHYCCYR2vymhquedk84iHukw7rW+lCt7OzVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8/bj1I5+8Ds5SsfUFlF9atJ0KblL+C2h4CW5CNDZOnc=;
	b=O14dqfjYW/iNavjBx4qrhAoFaqdP4ZV0GUH5hZKgNAvYAIC2fhi3m1KpD2s1G4rfoD0N
	 7gnZBa/BJaLXpfIkHOI7H654YZUqnVlAlIc6qogP8X59+65wENawNTze8zIsDorMek8WW
	 mYZSTORZn/IndFVzMvuQIaJ2M9qUUn7mqrQ2IOqJzzBolNDbc72bq/9waa98tDtfSnppl
	 jVrMMq0BH+8lexF1suWPhsJBaRiUwIFXz0OvEF3FyrXynEBJtsKKBkN1oR6p7F8YJmUmA
	 uKcUOXe/VumJdsFUiOJ5s80JE9/ERjyLTuJAfETgA3Gb7d/tlHs+qaGrn0PHMrJ+yvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fLUwIUzq;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D89606F5F5
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D89606F5F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fLUwIUzq
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so3257273eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897601; x=1793502401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/bj1I5+8Ds5SsfUFlF9atJ0KblL+C2h4CW5CNDZOnc=;
        b=fLUwIUzqK3Z45xydi9dSrkmmJeqxNm3QHbUHO7p4p859IgldDZLSDjrCOKt4GH4M5e
         Zk9AXcQsSxHuQqngg5XZW5KL3UYgIFVCUchKPo9WSyDBlPt6KiLRJNGanaIKWn28ibip
         dPo526Z2yL0+h5IS+sD2gvHgTg9P9hS1K/Tui60MULuoFko+OvtO/eKDv03WICURXz8H
         yEN5VsPOjrifKhwzwITkr24MEP84zlb+1kCEJQVBFiQUg44DzrgYYZTu+3orRVlaibyZ
         D7IRQ9HWBM50YTYb5lGzIOep72gkaPHXAHwtfH0tYNzXtzoAIP3IPdm72K/y2g2OsECf
         2vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897601; x=1793502401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/bj1I5+8Ds5SsfUFlF9atJ0KblL+C2h4CW5CNDZOnc=;
        b=UG+4eFK7d0NyjjTwvD4i6VlwJ+eTU7nVcbOg1mqBpTTxAIIDNz44pvcS2CwCx/oisD
         AkXN7HSxTcLngnXJM0odTjVbma0LQYjFns1tn8Ne9vdcLGObS53Zv09vxH1qGzXFgOlH
         hu4KJpoqH7QNtrPg0sdW7gIwvX7SKGIJ5ZpRJcJNecga+9bx9yqQo5LS6Fp2ESDN9O+c
         JNBzVEKPP0lmPqOFteGwvttMd3sJkMvUEu4WEqG1zfHrRAWy0MtyE0VAdss3jGJSNh21
         JYBdAdoeN2gKnP5uY/2MoiAK6hQjeYCfOrz6FI9cRE+W8yhp+NE41gS2+5stvBJJ8JNj
         qnqA==
X-Forwarded-Encrypted: i=1; AKwUvByh+CIisGW1v6qfCTXsz21WX0JXU3fwtXTami4+z6PaQJqYf9/gwHWSRGJrtzavKmH9jrKKjcW4wvfwKWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsrgSOy8l3mOq0I5iHO1gpRHjDykOIuFl9CbR0ToBe91p1IMPr
	ds+qn/7BWVgbtr1HoFmkfPccD3OSB+HDmHEYi8EMApHepMNH5heX+U/b
X-Gm-Gg: AYBFou1VUTPqalTSWqkvvmRhD3VkDfBaTIrkbxJr/15xhbsBaSMWKXr7AoVa3pDinEP
	bAz1EtOOnHWUdko9wPxc3P8KFDqJYfqBHevvcWHIb4Vpjr0IJmTUUW0/XBKuyyWN1AQSBDLo4/+
	1cM9MVarQU1OFr7RlR5PgkC8v/9aEQ0RKneR61cZfpkW37/0WpeOhC1L5Z657RRBoYIG2x906cj
	n+PrbGCc93s4Z48C2ngIur+6kKpV3leDVI/JYySdCwiNAn4mJ7i7fVUSSieFtNQ2+EQ5iKVBbz0
	eaU7IFwjFa95bxFHE08qnJlm5ZQfNymPOuL+sIvn7mI6LsQ706aG4eBcPdCgqCjvU+/Otbjtbew
	7LglWOgJ8GtikXlHlR3y0df6SKC8RrEOUzaG1Lw1JYTH4I27vclcv+eRBrvXPjShmKwALYhtkSK
	/c1ckZmoQgrLS7F7Wjr/qTa2MpAEen2lcDR8Fm/wVCspC2szrR8ZRT4E5u5s3ci3uNubYxphuBd
	mMFA/i6XDrRYysJeG+d93L4OJPRZeTyoKYS8ZvNbsglTpnYywIUXBGSHbootvbV/HgQB8KzSsw0
	Olj4jn6NMgVQD8yrh/J8sKreDax9oG2vYy/C3oDPABg=
X-Received: by 2002:a05:7301:dd8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-369e836b28amr5517833eec.1.1792897600725;
        Sat, 24 Oct 2026 20:06:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:40 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:26 -0700
Subject: [PATCH 23/31] hwmon: (pmbus/pim4328) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-23-e81941ad0cd3@gmail.com>
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

Pass sizeof(device_id) - 1 to i2c_smbus_read_block_data() in
pim4328_probe() to leave room for the NUL terminator, and ensure the
buffer is NUL-terminated before string comparisons.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/pim4328.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pim4328.c b/drivers/hwmon/pmbus/pim4328.c
index 9056dc387e87..2216f8db7ccb 100644
--- a/drivers/hwmon/pmbus/pim4328.c
+++ b/drivers/hwmon/pmbus/pim4328.c
@@ -150,11 +150,13 @@ static int pim4328_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
-	status = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, device_id);
+	status = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					   sizeof(device_id) - 1, device_id);
 	if (status < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
 		return status;
 	}
+	device_id[status] = '\0';
 	for (mid = pim4328_id; mid->name[0]; mid++) {
 		if (!strncasecmp(mid->name, device_id, strlen(mid->name)))
 			break;

-- 
2.56.0.257.gf7497c7d27-goog

