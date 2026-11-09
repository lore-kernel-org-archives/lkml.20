Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204690;
	b=Vy4P3rq0z+LI/Om9p4D4Sce/hNQfjXMJbOiHnkbhQZF5+0SP6S/NbpYJE2ZcZ0gfhH0f
	 uFnC1sJgbrniIKqB3gizKlOyc1cB8waGIH0M4tlXkqcB9XMnTQ5waVrhnUmSiMmuooVxA
	 jVGoUkTfq96zuZ7Pa1eXna19+I82R/2HirNMpUFe9hJ9YAhxqdM7y9waCqyjk0i4VI7+0
	 1e3AwzbPUIcFQna+RMV+08NlxrdTP5saav0L5wICOu/DEiKnkrgCHtl/LVdY0MMMICRRA
	 r1522Q7voQbvcJVcqO/FROIMMW8QSdzmEuZW3JYSkoOdsQyeyv/WrqizCiyKAYNpjaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qGxoDwXtI5s4aPxzK7UBEGdxPrnksTKaa/8jWSRqto4=;
	b=12fHfUdymyj2bdjimj8k8DQtCkyoKIkyg1JSWinbsebPo12u3SeMQTUt5J1Jfn7bTe/g
	 6YDaSp8C8zw3cUczovdXu0NW55GVQcRFWIZMeEo/lcNAgvCBAFzNHcYr7zV/8hpuax4p7
	 41aib0AsqZZjsFYXmiIiBhD9dHOjbXB1soxoGXe+jMmJMc0IHJpqmMAWnTUjCJPAj+pOp
	 kV6VHoZXciyiaru+YYnnwK1QfJDaBvyqO1Q8HypNatMqx7h+8XWpOaFCVG7oL9s3bFO4J
	 oy23Wt/bQPb+0ypvBCtocmLmENyqK1MXEfGocTBMWVu2aFC7GjBcazGUInanCTIlLOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0730psI;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E14606EE90
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E14606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0730psI
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1230928eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204689; x=1794809489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGxoDwXtI5s4aPxzK7UBEGdxPrnksTKaa/8jWSRqto4=;
        b=l0730psIBA+rgAiCstbBKk7dreIcCR1GNcMtMDZIoxQm79yG6U9FpaDAw+h6UqL1a4
         3+cg5FsgdaFZSUSomr5IUDBrNqBPuOLExu57XiJpqAvYyAS49VATWIQ6ZANsA4bUM61s
         YmD5okjOt+naB1CTuN/3rcvyVMpZMRNyFkd1S5X6Q4Y3Jbsa2Fhhb/11f9aZH66OjfxV
         N1meJKECqRnOGIni7xZ0LFWLswQwV4Z+4jH5kG0VLSiL3xQ3AEjedZ4oG4P8wIol5faX
         PPU8RlLqbqe2pl19f+5vlBdym2n+8CLR6m3miQ/8J/v7q3ZDkI3aqlzo94E7kCEtlIfy
         vBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204689; x=1794809489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGxoDwXtI5s4aPxzK7UBEGdxPrnksTKaa/8jWSRqto4=;
        b=FvtsJ9mSaQe/uxcGW4TWEHojijvvLKtga6aVIWZw8xEB9+SCx/YO79X6Ncl778ZTqD
         yn6znggZqkYmqBPSKRnKMTdsckR+ZKtmD2MpcjtPzxIbj9MI8LyVtYYn763MQajrW7qS
         afeK3c8DC4yvdSY/Gyuk4DYen1IBzcArxyQYuWrrH1YnntRed1HBDZeXNFIlD1v3abd7
         1WxxPqlNRfi1rstTNdijgHIlakRpwrOWBYCYj9dusAT8/iKo0pg6Xzldrh8gRbn0lz0q
         3kJsiWLdKx5P5hLVEJ6P9sobqQb8Sdp+1Z9qftgvaka9If0a82IqM5Ix6qPIzTa1DwDz
         /CfQ==
X-Forwarded-Encrypted: i=1; AL+hErFHrnferNxB8Bh6Jqcuev9/yTyfyyifL+Ex8HsHmJbdG4rmRUVuCbUgFGBBpdrSZRlYD1S5lcYTvFh5YQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MR22r5fOLlX7LQiWNWgOh1k01VTI/txLlT2kX2Rkj1mPVCHSz
	KIZnCygNEAK1cw8cuNmHzbkftDKuBIsGbfacpeFA73FhWVk34opnU1qQ
X-Gm-Gg: AYBFou2rF9A9R/VhGNGHgs2Zn++yiEPYwZwtgIkEyZQUbob/tdjiVq5hcPu+X2fS6kV
	5eOfcqNKwthLg25kHzCm3uLQSk1sZzpOH7x/WskbD4YRn0ZX5fMbSVU2QigG5By6fAoQzz8u+r6
	O6hRNh2M2ZViJNc1prdbzWj5HplGBO8veysMVY8VWOkP8PpOFnb87kGlHZN1AK4anSWMlUJp0oN
	MMhYSvFHmCr+deVYxPkfpE+YMBUn1z8s1ICD5xpfgSdBC9FiwhdYibP2jO8MdOPxnEnoohBh3W6
	A7zfxMWS0EzGltXzUPSZHbv/5NGU6YydCWQNEgbNzrrRvlI4GMjB0yGsD2lr2YWoHEOjz074PXz
	srUHl90sxdSyRUxe7jqP6UAH4ugEGjyzSjGdkZJ4AWsyT9A7UOPQJP/x7Uetl/TcES7slGvh8FU
	cVihigaD8o+/msCgoDAjV9dTXxo66m9dJlN0Woq3VxBIjUqKhjgziGx10ZV75KpS2aIwHA40Fbr
	0PfZljk77c6uI8QK9Xnp53pQRiQXb5mkXE2kQCb0JfgwyRFmhLFJhOw5ea0J76qiCBSEjStqpHg
	J5jvAZe+vv7gxIxELAyimTbtEQR0pWSYwkcnxiulbFrpcptVFE6bXwlfbk0D5lGg5uGihxy6iVZ
	f6mJSKDxK6Y/Vh0hY
X-Received: by 2002:a05:7301:1285:b0:343:9eb1:9940 with SMTP id 5a478bee46e88-3725e33de65mr8596467eec.26.1794204689085;
        Sun, 08 Nov 2026 22:11:29 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/18] HID: logitech-hidpp: store device serial as a byte array
Date: Sun,  8 Nov 2026 22:10:57 -0800
Message-ID: <20261109061103.2887636-14-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
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

Device serial numbers are read from 4-byte protocol payloads only to be
formatted as raw byte sequences with %4phD. Storing them as u32 requires
unaligned pointer casts and dereferences that depend on endian-neutral
memory layout, and the FAP-based serial helper reads from the RAP union
member instead of the matching FAP payload.

Represent device serial numbers as 4-byte arrays, copy the payload bytes
with a fixed serial length constant, and read the FAP device information
response from the FAP payload directly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index c4ebfc4d66fe..3a3baeb9fbb9 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -48,6 +48,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_REPORT_SHORT_LENGTH		7
 #define HIDPP_REPORT_LONG_LENGTH		20
 #define HIDPP_REPORT_VERY_LONG_MAX_LENGTH	64
+#define HIDPP_SERIAL_LENGTH			4
 
 #define HIDPP_REPORT_SHORT_SUPPORTED		BIT(0)
 #define HIDPP_REPORT_LONG_SUPPORTED		BIT(1)
@@ -889,7 +890,8 @@ static char *hidpp_unifying_get_name(struct hidpp_device *hidpp_dev)
 	return name;
 }
 
-static int hidpp_unifying_get_serial(struct hidpp_device *hidpp, u32 *serial)
+static int hidpp_unifying_get_serial(struct hidpp_device *hidpp,
+				     u8 serial[HIDPP_SERIAL_LENGTH])
 {
 	struct hidpp_report response;
 	int ret;
@@ -903,11 +905,7 @@ static int hidpp_unifying_get_serial(struct hidpp_device *hidpp, u32 *serial)
 	if (ret)
 		return ret;
 
-	/*
-	 * We don't care about LE or BE, we will output it as a string
-	 * with %4phD, so we need to keep the order.
-	 */
-	*serial = *((u32 *)&response.rap.params[1]);
+	memcpy(serial, &response.rap.params[1], HIDPP_SERIAL_LENGTH);
 	return 0;
 }
 
@@ -915,14 +913,14 @@ static int hidpp_unifying_init(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
 	const char *name;
-	u32 serial;
+	u8 serial[HIDPP_SERIAL_LENGTH];
 	int ret;
 
-	ret = hidpp_unifying_get_serial(hidpp, &serial);
+	ret = hidpp_unifying_get_serial(hidpp, serial);
 	if (ret)
 		return ret;
 
-	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", &serial);
+	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", serial);
 	dbg_hid("HID++ Unifying: Got serial: %s\n", hdev->uniq);
 
 	name = hidpp_unifying_get_name(hidpp);
@@ -1030,7 +1028,8 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 
 #define CMD_GET_DEVICE_INFO				0x00
 
-static int hidpp_get_serial(struct hidpp_device *hidpp, u32 *serial)
+static int hidpp_get_serial(struct hidpp_device *hidpp,
+			    u8 serial[HIDPP_SERIAL_LENGTH])
 {
 	struct hidpp_report response;
 	u8 feature_index;
@@ -1047,22 +1046,21 @@ static int hidpp_get_serial(struct hidpp_device *hidpp, u32 *serial)
 	if (ret)
 		return ret;
 
-	/* See hidpp_unifying_get_serial() */
-	*serial = *((u32 *)&response.rap.params[1]);
+	memcpy(serial, &response.fap.params[1], HIDPP_SERIAL_LENGTH);
 	return 0;
 }
 
 static int hidpp_serial_init(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
-	u32 serial;
+	u8 serial[HIDPP_SERIAL_LENGTH];
 	int ret;
 
-	ret = hidpp_get_serial(hidpp, &serial);
+	ret = hidpp_get_serial(hidpp, serial);
 	if (ret)
 		return ret;
 
-	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", &serial);
+	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", serial);
 	dbg_hid("HID++ DeviceInformation: Got serial: %s\n", hdev->uniq);
 
 	return 0;
-- 
2.56.0.506.g506a7eabc5-goog

