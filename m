Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940885;
	b=fiM4a3Nad9UB/I6Ds2n8u8+GyTC6VXPb+IT67lcohgjw7yWQhk05zYRVm4c/7DBm1UhL
	 IuUzguo90Q6F3KNrLEp9PHlvLrSr2oExkY0pBI8+wIvEzGY3lds8NvfoPMP+iADBmEiOu
	 u0w8iGyjqjbyF4g1s5O1IPcmt9Qu6KJhu0LqXcgJwNVE1PnkGX56MN1yyxhZ4uy1xyYXe
	 rVxFMA8LgVR1yOYAlvOxl3nVO0V+tywshgVedqGZFrAlbIc4tULiXLx2E+A/AKCMD6Hr7
	 sM7Jo/y0QcZW6hA1JJ+uxs6qd5oaS75oKWdFpxfSXY1Rr2AkphlsK2X3howCA+AoZPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ye2GSFYgQJI6uzYdumiexWml4ugTi70eS2dKM6j8ho=;
	b=1DhDb7Kqaip/vQ2OfurBLAlEVkKrVPxho+ShRg8CkBuSycaUV00j75S9UWo9X0ihEy8/
	 2LyC5WaFRAYozViBp92QSRhMs59l3L1iqcxPJG/MLw+CIpXLIqPxX9J0PamxkqLUyUlzn
	 ceq+kRcCaGDu8hKcTTNUuOP7eYWeYefjpwdSMkcp1SbF8RnRj0aAi/pBKG+Pneeuzrjqs
	 pMX3lYbmip28B51TaID1QisCecYFDrJdsTyEkRdUITadSoO+lHyUA1g4EpAocv5AbbgaX
	 Li0MxqxHj1zAkA4hlnYUZyXUNPustxJG+gIZa3RQC+fa/5fTA2uP+Af/oXeN0kf3O4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JMcqAKq5;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CEC606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JMcqAKq5
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1438d9363fbso1699611c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940884; x=1793545684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ye2GSFYgQJI6uzYdumiexWml4ugTi70eS2dKM6j8ho=;
        b=JMcqAKq5tdN1skeMEUXr6VDUqt9E4RCyh59/xCx5JIJ9WEjXRKylf6Mz/pfLPzul5c
         iY+QjMYPLgHdYnqEfUcxh7CM983rPSYy0jFZnKL5+0Q/qUS/ewaKbXL9hFk2aKFBNTDL
         9kLN6q8JAjm/23g6ODgM73XqpwuCtYe+S870Hg++b3nlv7nXsx/C1s6QBttEAj4uGICQ
         e+Niujd2qrKw98y61+V8fcW1j9CSxGDNg0UeAn3tEVHpcDY2fHb6ukKJ1CUirdg/V6LI
         TYmFMcac54aVyWOZ5TZVDFMXUnysSllgpkpm0bEX9xU2WiyiArw4EdBrCWH0BFHztcWq
         ibJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940884; x=1793545684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ye2GSFYgQJI6uzYdumiexWml4ugTi70eS2dKM6j8ho=;
        b=GtkJc0Zjrn3CE6ZlM/if0bC/MQ1MPBOFr9hVVR0fxEronkZ28ngtKJOqeTKoDECQPx
         AIMG2JAoKhpboTvEXh2ejawhodzkkozwuA0L4d9XpUvekp9B7G/HrkXys1dxlEpNvZNo
         tZBelHal77W1f0bO2Agm5h1bKOgi8GBXg39/3ogAGQf+h2zwjYpr9KnZ+WbCGuLlfq1g
         M0R9bNr+zoGZIebCTuZA2WVw/skLt0VEFajP1BTKC1EZ3N0EnPl1hdIxjK2BHyrnGU4N
         05n287V7t0edbMgMCcgv5d8ApPtomygBmVth4YKMFr2bc83+/6TCiy4ICJGoJpjwQ20H
         PTpw==
X-Forwarded-Encrypted: i=1; AKwUvBy/bn85whHm28PHDVHUoAIpICe9eZdw0XzRWt0MX3YMoWmgUxTHO1Rm25lgY/OJnbbcEEm8DZ4047ByCSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaGs75asjZR04duhA/HEEn0jhSzoSsuv0jJqQsYypn/m9ly4+N
	l8MUShehz3stwsnSaosjzeSoUOqrdDcmJ6g+qggCzFSjUK74HL6kEd6f
X-Gm-Gg: AYBFou15Dhw5FQNumhbAfeoVQ9zp/cJtdM3/0q2w79Ht3T/TkaZVEYWDjgP+GKvhKmP
	z7p5TrV1YuQmO3PYS96c+8OOSBmumbpsGeQyPD4+2uEsYdnm3Hd8Xc8qswl1lSDHvQ4Q5iIZtSi
	rKgWYU5L2jAdNAYS+mWwwy8mupiIVT4ZSsveLdvn9zuMNDY3g1J3QDfbW8U8ZgjZOlDvHfQ2RFA
	2sDZEaDOhS/rUzsV3XvMot9n36tPpKyK73KVso2FrBhonssI5EhrE+6nz0Zybdcwg5kvdhmaoC/
	dnIr+ARmNSc+5eCbQC+tFMkn4wA6907k3r0jf/XALBH+44Pwd4Sq/D5K+hZaG7BP5F6DMBXDQA5
	1GWwtzny/anGajfXuFnc/hXxqmnfB9eHoulu2ox69EE35/Po6TGyJHqnIuxp9+PdXmt+Jkvs4PT
	Aun+wB86Zc8o80WTkEpjS2xKTCgAvh7MJaAGdHKew86h+YyCK7wIVsr7e9fZBra+7BsMTmMF8s2
	BsOPnEArM9JeMp3jrkzfWPYiklg9VTS4KEfnXGyvwB1OXW+1ogNCzDdBPPj170IPKhgnXTp
X-Received: by 2002:a05:7022:5f14:b0:146:5f73:d45b with SMTP id a92af1059eb24-1994cb430a1mr5812181c88.3.1792940883317;
        Sun, 25 Oct 2026 08:08:03 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm16876956c88.20.2026.10.25.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:08:02 -0700 (PDT)
From: pocj8ur4in <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (lm87) Propagate analog output write errors
Date: Mon, 26 Oct 2026 00:08:00 +0900
Message-ID: <20261025150800.49041-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>

The aout_output store path updates its cached value before writing the
register and ignores the SMBus result. A rejected write therefore returns
a successful byte count and reports the requested value until the cache
expires. With a cached 980 mV, a rejected write of 1960 mV returned 5 and
read back as 1960 mV although the register still held 980 mV.

Check the write result and update the cache only after success. Return the
bus error to the sysfs caller.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested on ARM64 QEMU/KVM through the lm87 and adm1024 sysfs paths,
using an emulated SMBus adapter. With 980 mV cached, a pre-apply
-EIO rejection of a 1960 mV write returned 5 and read back 1960 mV
before the change; after the change, it returned -EIO and read back
980 mV. The same behavior was checked with -EREMOTEIO. No physical
chip or analog voltage was measured.

 drivers/hwmon/lm87.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm87.c b/drivers/hwmon/lm87.c
index c09074f44708..ea23206b3c81 100644
--- a/drivers/hwmon/lm87.c
+++ b/drivers/hwmon/lm87.c
@@ -640,6 +640,7 @@ static ssize_t aout_output_store(struct device *dev,
 {
 	struct i2c_client *client = dev_get_drvdata(dev);
 	struct lm87_data *data = i2c_get_clientdata(client);
+	u8 reg;
 	long val;
 	int err;
 
@@ -647,11 +648,14 @@ static ssize_t aout_output_store(struct device *dev,
 	if (err)
 		return err;
 
+	reg = AOUT_TO_REG(val);
+
 	mutex_lock(&data->update_lock);
-	data->aout = AOUT_TO_REG(val);
-	lm87_write_value(client, LM87_REG_AOUT, data->aout);
+	err = lm87_write_value(client, LM87_REG_AOUT, reg);
+	if (!err)
+		data->aout = reg;
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err < 0 ? err : count;
 }
 static DEVICE_ATTR_RW(aout_output);
 
