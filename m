Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875587;
	b=jwyixXo3NWXkLvD4K/s8YhRLZxMU1gX+euSUNIWDKUa9I0omZKY7WIlt47CzOMRDnGtO
	 YsBII0FJI9430WOVdVu3ZI6zvHmJCXsu1N4RS6iNcIA35bZljjLJYEvj6xhdgNhiQm+mc
	 tiMotK4GUDk+aCNQd+CG6s4e+/9ug5Q+ciK+7jQiQzR5JmOL5Y/nRdNXdaAA4qFUl34vh
	 NSz96dcaasZJJ/yPVShT1tNes+Yjc0/Jbx9ftrd0FfKM5yd2RfC9wOO5Bvwhef4RS1obp
	 ichqHfVYEU3cEgCHoLA91NAy7gzicnmqUFBEJ/S+KopwiOd9BMiXS6n9RzD0woDCV8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WzDkiyczJyz4mNLu3rtCyGgbHEPN6yDhFIklvUTjWo8=;
	b=ajCHwBouffa/GKnrXwRbl0uhmxEuOv07gZaavDEpO9tuGNLka9lN+8jtqIGWthjyidwn
	 dqU1igyZ3i2ru1g/OMN7QvvXuHwsVkytbeqT0e4Q/ZK3pBASa6zdpoyu80PUI8o59xL2U
	 nLbJ7xlyY6GH20xkb0v7Aod91yX5xe/IuNUFY+tUaMunYF1OvfwFfmgqZrQYKreduKZq9
	 JNaYa+Lh/+ayFa9mMRJqiFKjFFrW86O1dRIIBXPWrjVyRhSdpey+xz4serLEeeMk0Sa+K
	 KNDf8HuT+l8qLBU4kbo73OHhOfU2DQwxcEPtX8OqSW/PshjzVRuUZ7zUfJBiS3LULHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="roZ4/y44";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A38606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A38606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=roZ4/y44
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so11176265e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875585; x=1793480385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzDkiyczJyz4mNLu3rtCyGgbHEPN6yDhFIklvUTjWo8=;
        b=roZ4/y44G1EO27OnJPJ3sDl8ZFtcBwtcgPA6kkACIwOzj2BlHLGmNU2t97n8+6Uk3m
         Y1a02QfANryXw/VAZ59g0euXvFSdeNXCq1WvqYAdUTSSDVuCDGboBVCnV0sd0ujDKWW/
         p1Y2cyz3AD77dd2YoGCVfqEbOXHfz2ByWLA5eWcleHp7H9Z2tSVXprpy3tG7VzDhMoS1
         QK3c0F5TOeLSm+n2gHWxXUgkydr1HVheK4GVOIPiDtZTqSuSGMc+OnUYN9lQIpON9jzI
         gK4ei3pdbOlXG6I3CIRBhLuvqJUBukapPDgDAwJgSZbHkne9rpkgOXKg6PBogmn5+H5I
         Hh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875585; x=1793480385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzDkiyczJyz4mNLu3rtCyGgbHEPN6yDhFIklvUTjWo8=;
        b=OQ0w4VyPqq4JGivn7bIRW730mlMz4Stz83ysNxKE4YT8AskqYLnpXHhJKWN/4Ikq9c
         RtuWSrCFsGmxHVVuK5No/oLi/UZKdIUtZOwFPkDaD2CtuvA+6hLHx7pmlZJE4nIeRL+J
         N+RyWn3Ma6755hbBTBoDeoOfydxkGQWg+U2EW1KqnHDVh+k0Yw4fWp17IRj/bHL4dBa/
         e8zZpMAkE0eZS9KrK79+HCdiJyEPnnsME0TMynvdcXBT5Linu0qoyVYGed7nVPuhDUsh
         1rrTv7oZmricbNJwuvfhb9Ln877AgOkSn/54WzKSakbyPxKHG0KEE3xtYwww9g+SJQE1
         /g/w==
X-Forwarded-Encrypted: i=1; AKwUvBypO2KB6KfHqW1Ri+U1q2k+7xi5tgA5c5HDeK8n3uPHIEmdKT9LQDCjQY/OH0lv+zUgFppS2m3nNz6Ax6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXYvSncy1+rFbbCUNX45OLjGni3hYcZ5IfeilIRgRl+y7DWwAn
	UTRfiofyc2K6oFXOolUcP9e/TF4Wwujj6kD/UtO6hD6/SuMR41L/ROc=
X-Gm-Gg: AYBFou2ni6uRauWOW3nWuu/rm6YF9hytHc/w3qkkDGWNs9sh7thoipK4u9Mn2VL4Aoi
	blefda+jI1ywYLUAKFQpq16clMQSouDKscuFpJReaKhYx1t4WL+P3zLIfGbclnb5YsKfNOylSv+
	WPDk8+YXgiu8pnWDiicj1zJ0xK3EEDeoaz3m/2W6lO0uhnapzr775E/HaZH62hvfYXia9KAsjY4
	9mBciuSUjvlcoRO6YmkTJ3BOMESKRWvALaKQQAEw6oB32qTxA5MOj3SjS4KEzM6qo2kOQFGCB5a
	kA3hCwyYu+3Q0NnqybpcPCJsxhmH95vFTlYoVhz2DGyeuOQ4co0hZOfOIYdT5vK/WS4aFEoipMH
	dCa+JsAlSEMUqaQP9+fHyc/a6flSEC96Rx6MVUkuEnJC0FRJQ51cLyrHb6heGIrnmq7xWTOVVO+
	FCuvg5YfSHaT93l/tq8pELgWzxLrqzPsdF4mDkhSRBEg6E2/y40Ugq8C+HGKQ1rXVbTc+a0LotA
	JpPQCo5N/TPhgvJUx9qxyb0
X-Received: by 2002:a05:600c:8183:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4a35ac99b77mr40539715e9.9.1792875585215;
        Sat, 24 Oct 2026 13:59:45 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm60326925e9.1.2026.10.24.13.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:59:43 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Seema Sreemantha <seema.sreemantha@intel.com>,
	Kiran K <kiran.k@intel.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH bluetooth] Bluetooth: btintel: validate PPAG table element types
Date: Sat, 24 Oct 2026 20:59:42 +0000
Message-ID: <20261024205942.4056250-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

btintel_set_ppag() validates that the top-level ACPI PPAG object is a
package, but does not check that the inner PPAG table at element[1] is
itself a package with integer elements. If firmware returns a
non-package type in that position, the code interprets an unrelated
union member as package.elements, dereferencing a meaningless pointer.

Add type validation for the inner package and its integer elements
before reading the domain and mode values.

Fixes: c585a92b2f9c ("Bluetooth: btintel: Set Per Platform Antenna Gain(PPAG)")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/bluetooth/btintel.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index c69a5d226e882..aeaf80e03f8ad 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -2637,6 +2637,19 @@ static void btintel_set_ppag(struct hci_dev *hdev, struct intel_version_tlv *ver
 	/* PPAG table is located at element[1] */
 	p = &elements[1];
 
+	if (p->type != ACPI_TYPE_PACKAGE || p->package.count < 2) {
+		bt_dev_warn(hdev, "PPAG-BT: Invalid PPAG table format");
+		kfree(buffer.pointer);
+		return;
+	}
+
+	if (p->package.elements[0].type != ACPI_TYPE_INTEGER ||
+	    p->package.elements[1].type != ACPI_TYPE_INTEGER) {
+		bt_dev_warn(hdev, "PPAG-BT: Invalid element types in PPAG table");
+		kfree(buffer.pointer);
+		return;
+	}
+
 	domain = (u32)p->package.elements[0].integer.value;
 	mode = (u32)p->package.elements[1].integer.value;
 	kfree(buffer.pointer);
-- 
2.47.3

