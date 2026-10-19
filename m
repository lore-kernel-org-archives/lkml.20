Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424842;
	b=eVZ0fNyvzjaOPLW6qSCu5RXSheAMv6+T81VqfaWmVRus5L/G8kbxfbMIekMmCvsu53KL
	 jqc5ht09dgB8N3Xd9mN0qihct1aoYHKXdTXSeiUVWotetOpHS/O3EzK9xHAyUp4FdSe2W
	 3Rj2u3giK7ST5ByWzEIQUBwcJt3iisWLOPslkS/ZFU+JXTHEqJkStiYyma594Ne4e2s5u
	 10GzReKlkMEUOJcrnz3L5tBvpyaPErNbwyxXlejZZqC2+qC/M6BsPehVwGCsmnLCnzP1I
	 mZ3Q27vg9p2ZjhgMiV9gGzPAUOWDidKJ1dgRJ++XfO9DYrUJTyeAjoCMFzQapiQP5Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+QU3ElGvdYqdRAsqMMP4vBLt2gMtLEB8tbeLeTev/8U=;
	b=NBn2O/FCSbJKdvBPTuHuUCcXkf+5ZZgDtQAn0c/33HIjoXGtV3qL9GtfE7XjI/dZNCL/
	 iF+pohZMbEwd0i9fFqrItHGrjpjtlwXa+gLSDLxcs0B/FtRh1PoP5Kfy/YX7YAb3dfrY8
	 duNFwFsReVWO740+rfyONq/SniMw29ZIYd0GIgd9cZuZDbuTHEmOfAfH00ql7D4N7iybY
	 b4SJ9tU4AtF+800PpznQT49k+T5se8irUkbLGUZk5QQIpfw46N+68Ymug24G2fgZvA/Gu
	 XCNAjpCti1lvuzv6cvJ3DVomDipqFYkOmnsd2M8Fs8MoTDz2m9xEuyKtUqGsPiu8G5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ltOENgfJ;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C1C606AFB9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C1C606AFB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ltOENgfJ
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1463530a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424842; x=1793029642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QU3ElGvdYqdRAsqMMP4vBLt2gMtLEB8tbeLeTev/8U=;
        b=ltOENgfJKo+HBDt5vHk2fu8vtkCvEx0FnXvObxZFRfOQHZANLAmEdvHMCLVYcwi9/m
         vdtB/vBAjL3ZJvdZWyTXtD7e54AY4W8MinF73Kb+NnkEihmK3ES1xlhG1SXsZMN2P6nq
         fd5uvOkUzdcMHTRely91pcdfEZ54LredhMpy/kDlNQtOUqCkTEN81hZBDAI0/xTWwWmF
         t5KztGmZtRr1zXaVvTSRajPxt4BnEOAQYv9Cb8O5yfNIj+spr876VaM/Qw5vQ/CSxPlL
         HAIN5O7ld5Q3dDrxm+UUq50AOUUUuHWvWEVCRpcWCaHTIjDIMxjFk7b3OCqrdL5akQSr
         Ib8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424842; x=1793029642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QU3ElGvdYqdRAsqMMP4vBLt2gMtLEB8tbeLeTev/8U=;
        b=jSCVLdCfdZtq66PgszwyMbQRmgjhY3/8b4y0orN9/VHLOwW9BLRTojx3+Yi6RonHZi
         /lS87EvqhC7vR907y3/aDYOOzyBmCCrQfDnyUoTNXeKEIDIZKseBlpISpsMVyBb6kHPB
         OuCpqVzG5aCI2XmGW+205IvTV2nuLcXf1J2RcVB3XdSi47MYZqfbDphBrh3cayY3PcyS
         8LcUS2m1FnM87X+wWXAIlIT9hbvVoUwoWJALwSAHLectcTZf0IaLQ91IUxdzZNppzEvG
         RHr6F23GTrytmn0prWVfb2MCFW4NqBZpqpw4+kV0Jo99TqDlmRkc4mV+Dd/gxX46iL4S
         8SlA==
X-Forwarded-Encrypted: i=1; AKwUvBwEQ2Yp8U8/xLY3W+oMgn+shRjfYTB99vZ0dUfQ1j7eswmaETaEZqg5MOLVEmcrtxk0K4cLiTQu/tLUGSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrqphINqfdQBAOmytmd2ToERf/4zB490zSHYAzCekQTi1PK6yz
	bldlKlyzQv31KZqeKPJ9wz2FYV4yXw2JU2JdP+MSgbX2g4r2l9CYQorh
X-Gm-Gg: AYBFou0DLTkLAo0V9Du1WUR120mR3BIZuatawBI/dWCvxF5Z4xOiYndA4t5JTjAvH2v
	oghC5jHZ9/iBh4iY+FE8qkLumMFC6YT+OQQeH3Tjaay29DV3g0vbuvvwQVj+E4IaquQ58xGQcJE
	M/SihSNq5Ue/IDrZjV3dWKBkxx13LKIpgbwdbNAE+OWiV2d5fNaplU/FnhbL5MaUndgQFiWYtv+
	pLNOWIf7ukluVS1qe0dKIVJVJVjwgyd44Y/gi7ujpViThv/jwdg8s6fWcYlUIXdN/QwBiin025A
	fOWmO0XPwlR3H7GSQZKn4Omw+hoje56HvjbeDOovA5YH2utEMpcu8LOItYqkFN77yquJW1/FYov
	QwceBhgwQxrMJIItJlRXg57IIYgDmdqONjmTEnAbmeCBNMmPQim8ewblmYXs9mXCPZ6bBgdIoxy
	4pryhbqDQbfWF0w6CiiEhtuNvBgrhE3X5m2Ndh0E+yadjoqR08RaCH8bMm7XpqmOrYHWRRDmNsj
	yMxQmXGtkGCJaL9kkmmcT0j8Q==
X-Received: by 2002:a05:6a20:43ac:b0:3de:7f6c:b871 with SMTP id adf61e73a8af0-3e22607ded2mr5611265637.36.1792424841593;
        Mon, 19 Oct 2026 08:47:21 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8c490sm4213095b3a.10.2026.10.19.08.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:47:20 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (sht3x) Return the consumed count for heater writes
Date: Tue, 20 Oct 2026 00:47:18 +0900
Message-ID: <20261019154718.2328055-1-pocj8ur4in@gmail.com>
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

heater_enable_store() returns the result of i2c_master_send(), which is
the two-byte command length on success rather than the sysfs input
count. This can report more bytes than were supplied, or a partial write
for a fully processed input. For example, writing "on\n" returns two
instead of three, so a caller retrying the remaining newline gets
-EINVAL even though the heater command succeeded. Retrying the remainder
of "off\n" can also send the heater-off command twice.

Return count after a complete command transfer. Preserve negative I2C
errors and return -EIO for nonnegative incomplete transfers, so a
zero-message transfer is not reported as a successful zero-byte write.
Keep the existing boolean parsing, command selection and locking.

Fixes: 50c22cd154e5 ("hwmon: (sht3x) add humidity heater element control")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU with an emulated I2C adapter through hwmon
sysfs. Successful writes return the input count, and zero-message
transfers return -EIO. Retry behavior and negative I2C errors were also
checked. No physical sensor was tested.

 drivers/hwmon/sht3x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index b46de050e20a..a0f5ba5c888d 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -543,7 +543,10 @@ static ssize_t heater_enable_store(struct device *dev,
 
 	mutex_unlock(&data->i2c_lock);
 
-	return ret;
+	if (ret != SHT3X_CMD_LENGTH)
+		return ret < 0 ? ret : -EIO;
+
+	return count;
 }
 
 static int update_interval_read(struct device *dev)

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

