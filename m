Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812663;
	b=vGE9WKV4/xzoc8aWzSMMKmYH3G10oONtbBqsBuU58S9LOOi3s2YB+GqTLoctEyfMWXZG
	 fNCzHqIpLqySNTwN/pqtk3w6oQm8UrlUzJKpU/HR/R7GfP7x+vB7UAuCb38iSVAQSsjK1
	 j3jLz6cgGJQ1NqMaKwCkfWP3yyL7vKS0VcznocZQmJv+R92m1gWsYkh3sjoOgKGtBBfME
	 xfIHQ9VVI61R+waF+IgG0Khs0novUmb2B23NcJAaIFAeYM5G07TpixainOJAvwlOs92p1
	 BAD65icUdlWuS93n1FbAQPxGhxjyPKnOh3nhhQvzV40NELfRuzSw2jHD827JomTc8WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n3H//P2Xt+SFt1vuWW61mGplc2uJXCj0F7tBueU0V+E=;
	b=n/+7U3fxpgsWbkdpvvTY4217tPM2cWxGmExpP31Kg0QCY6PHGyf0Vq8jN8y6krIGM26Y
	 wnZKciGwCtVg+nPL9boLPXpVZdv4Ye+YvX0y3a1xWaKsf3MrKvIfkRAxdknZtLNeTw75G
	 xVuD30doPNrqUUVsFrK/Ro65/McC1W7dYLZ5ysSfcTDHjTM3/xfPuf2gcCM1dSyNsqhI4
	 ItTuo38WW67FswCGc5M54W+OjsUnWxaAS7bX3AG8hNGe7CDC5XnZZKZVBDJIXvHcQm2gu
	 TgHKKKBWftRQfQRyWbY5tXhP/iUURElTIdei5XZCj+u2fvTeQt8VgIC9y+HKv16k9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O9zeuA8P;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA2606A322
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CAA2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O9zeuA8P
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35943f55c06so1843146eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812662; x=1793417462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3H//P2Xt+SFt1vuWW61mGplc2uJXCj0F7tBueU0V+E=;
        b=O9zeuA8PpjKR/mNeICZ72Ke+3eAhqwzD/YRJmTXJV8Zg4sN0tU6IOIBLWiIHESCH5M
         9kFIIWVp3YFzP0PlfpdiXW0MRcER10Tz5Xx7mFdWbHeZdx2BekiAcEVAK46VQXtyiBxh
         F0JB3FGAQnTAQ2pkrEZwul06jv1vheD+Dz2zn9RQSPIzR4shLjcD5B1irWqyuog2GkXa
         PF9S+RAwu4G+uQdbUjBmDhVjtQ2opsaEKTyjFDtytP1nRRDrxM+FPMqV1EgyLvl/F9Ne
         QcVRS49rnc3w+GCGj3zQo9VMTKnn4oShM7/B3KBIfE0h+ILFQirgTs42CvsbJlOwrJ55
         TlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812662; x=1793417462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3H//P2Xt+SFt1vuWW61mGplc2uJXCj0F7tBueU0V+E=;
        b=f4EtKXJ0MCYnEJQ0XodyCE5dXUsAX3h08BPlIaFqYRzpBUCfwR7bUAAmB/REsKBVEe
         qgZ4DcycpxBUYcbeGtWL4cIvdJ2NHrN6dehi/qnrf4ULYPbQV/X2pI02tmWIC6fhz03w
         /bdGXngbQnPTUs9n39Sn6OQcavQi5/6MvZ78+djecXNZLVhjtgasL3hG8LFRTAHAbHn1
         iNAQAfUCODxSyVWJoA2TknrMsEl+FJqBouC1Psdr024EIMF50L1L18585kzRpyhad9Nu
         49zQDTGlIXBmZKMjdal20EmpV1UsI1KDhLv2a+Af9HTR46lMRXPkTad6uofiK0qVl8st
         +6Uw==
X-Forwarded-Encrypted: i=1; AKwUvBw3H0PRcjtydUWC7xsntDFIDfBW+nj2jqzYmV0712GrKs62plu3fNnw4hb1s5unktgQQ6BtD1O/d0hqWDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfr/AGdIGx7vMNZrojGCTID/HaM1xEmBcXbUo+a/ZLSjY6Lwwy
	KjmtsLGTg+l+kpWbLFdCQKXvlhu2Go95aFI57+tv3MZwOsYAb3/LaZWW
X-Gm-Gg: AYBFou2QHjRij0bVX5B0xYY3neFGj4AWldU/OexWl1oxUh7dd1/z2HEm7/m/18Oy+9o
	Z4XjCbIZEkv/bKp46UKBm3r0AaPzPuXeKoFQDDbqdC6Y0HttHWLvEZO3/3hRhzzXNW8gyl/NqPu
	OBXn5dLEr2gli76PI+aKYdEg8fXIS/m84Kz48TrRWseUJHCqBD/uHXNErPUkF6GxnmlH7PVlHjh
	1Hox8Qj5Ybq92JPpVjmVGQurnZSK3GW8Wiegxo1A/oZbCdoBmgubtIM0WvcayusRLrvz/UJ0BW5
	3ZrQbN+XZdArtSpizG3sI9QTLbeqXOpIqsO86Qs43JkE2Bn6EgGJHVFevL5hbrEQ1ZHeFjHr7iQ
	IQVvHF8mve79665RVl9MA/x3qwfJxiCWXJzDgSzvI0f3KkErz1kZIs0ZKGz5UcBSCkMeSGH5DzN
	qbW4yPz20obwknqgUVm7OPV9I8zU9AxJY6F4GkLIfaXBZeRuiHcETdWMdwfLGMUH8ty7NK7YPA3
	fljmVDrn4y0rKWHXpMZ8hww+SyR6TN8WNREnd2Qb4qJQIt+3l+WaZ1Ypo0k/9WBXaf5eAbDuygu
	oHzwvPy25tFvzAPjj9Yw0OM4ZyVx
X-Received: by 2002:a05:7301:1a05:b0:361:2a55:b94e with SMTP id 5a478bee46e88-369e84d35e0mr1251819eec.15.1792812662302;
        Fri, 23 Oct 2026 20:31:02 -0700 (PDT)
Received: from jmoon.tail8e743c.ts.net ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm2827283eec.27.2026.10.23.20.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:31:01 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH v4 6/6] HID: wacom: add NULL touch_input guards to remaining touch handlers
Date: Sat, 24 Oct 2026 12:30:40 +0900
Message-ID: <20261024033040.316652-7-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024033040.316652-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261024033040.316652-1-jinmo44.yang@gmail.com>
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

wacom_24hdt_irq() (also handles WACOM_27QHDT), wacom_intuos_pro2_bt_touch(),
and wacom_bamboo_pad_touch_event() dereference wacom->touch_input without
checking it.

As with the other handlers in this series, touch_input can be NULL when
wacom_setup_touch_input_capabilities() returns -ENODEV during an
otherwise successful probe.

Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Cc: stable@vger.kernel.org
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index c4d6295f57c9..38003e0b8083 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1489,6 +1489,12 @@ static void wacom_intuos_pro2_bt_touch(struct wacom_wac *wacom)
 	int num_contacts_left = 5;
 	int i, j;
 
+	if (!touch_input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: touch_input is NULL\n", __func__);
+		return;
+	}
+
 	for (i = 0; i < finger_frames; i++) {
 		unsigned char *frame = &data[i*finger_frame_len + 109];
 		int current_num_contacts = frame[0] & 0x7F;
@@ -1660,6 +1666,12 @@ static int wacom_24hdt_irq(struct wacom_wac *wacom)
 	int byte_per_packet = WACOM_BYTES_PER_24HDT_PACKET;
 	int y_offset = 2;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: touch_input is NULL\n", __func__);
+		return 0;
+	}
+
 	if (touch_is_muted(wacom) && !wacom->shared->touch_down)
 		return 0;
 
@@ -3430,6 +3442,12 @@ static int wacom_bamboo_pad_touch_event(struct wacom_wac *wacom,
 	int x, y;
 	bool valid;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: touch_input is NULL\n", __func__);
+		return 0;
+	}
+
 	prefix = data[0];
 
 	for (id = 0; id < wacom->features.touch_max; id++) {
-- 
2.53.0

