Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954068;
	b=yC1kEWgLtsJaFwhTr6h8IHYj8aI2naCYwUO5lr4G4dqJP9Ce+BbAaViP90j1Q5eSRZ33
	 TG415xCNoXGPXroXpRfxBwb6zKeYrswpN2kHvtLkE22UM6COyKwmcL+W5sUpUc0s6VjtB
	 FWXwnEPIOIueuP9MSew2HdEing3TCTMmMgpbZnJzkkKp24lMhYcbIYIoy97zUdX4Rb0Pe
	 6uS3MIPLtEW3X0E6uXMrtuUKD4WNzemADdhdE/K0Mn/F5YYNmmC9hzHydxLpGN7SpbN5l
	 QzxiZHb2A5kGtH5npO+SABhddGGy0IRh6dxau5ndCiAillD0kqfBUC6DulNr6W5AQig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MXb7pO3sdUb2tVH9tQJHPvfD0PJ6M9Jq2AVgdOqIcF0=;
	b=f5REkgljbd9NcXOsK0hNMXcKwqlRmcCUK2jCSqf30iN8RuN3fG7QRDb3cVHAWXoEUDeA
	 BljXyMTh4Y78rp5VwqiDVckHawiLF+VIMaubWCO6/V9Xc5ifgW5FvUSRZa/DBubor3Tvh
	 zR6Ch3xTSznPcQDr+X5tRFA//R3tidNu/RZ36mfiVIEdBwoLbM9qkxWJ+GoZ4UO3GYJxl
	 cRPHsfhZYI1cyTF5B8QMx0P9GRRP1ZPcXYyEfsLDh+o9qUwgBtS/YmD/1kubPGuAtum4D
	 pv31P3jm8HFvjCvsOyvFx4g32ORdIiZn7HBpiX42hFaRjx4Yj3scCmirAxITGwPUqSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AncYDq/M";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D1606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 490D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AncYDq/M
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so773687c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793954067; x=1794558867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXb7pO3sdUb2tVH9tQJHPvfD0PJ6M9Jq2AVgdOqIcF0=;
        b=AncYDq/MLvihYjaq9mD3QHYPGHU0EM/d2UJGKvW3ulkmK8iDbOdFEuuTOGeZJIDwGR
         zSsx+f16KNXCj+gTIcYkJ7ZXixdeclDdyGGKY+OktrTsUtM4a5aYco1ZAJfBAt9efoX8
         qEGrIMgq7zTKUeRh9em8fGVq3MiQe61mXr05Y9IR9UFTU+aGc6zwv/SNYqgrDw7QdIae
         UxPrMAP+Cse+pQy6QkLjIBWY8r9tdUbSYPrewWyoe0cgsf+xqtBx2phl5CsaLkBkL2uW
         EbgKqUKEx/M2rsS+8gkyGbhzyv5DbHnNzr2/PnNmRxhd7C5l2iN99KujJa2yBwBp+AIb
         9Bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954067; x=1794558867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXb7pO3sdUb2tVH9tQJHPvfD0PJ6M9Jq2AVgdOqIcF0=;
        b=DPjrNt3vkOCzQ2UjHP/3tl8JJFLdecbx1VaOeBX1Jz52oyvGxHws+XAZ6jLUHFJ1mI
         29Mt/RhS2RWlvxOabCXcN0gM4q/sCBb6gqj0vZss37xRhyJKfCB+OJXgqX58bhrR3cQJ
         yc9NEyd+QLmuW+K3SrMWleiyncL0SozhSM+f8ZzXjtAYT98Zi0jPVOX/xm0QltCI1p36
         1rVzOEZ4e0kY3wRCGtq7pdgtIToLtgCZOqXFcr0a6itJwUkdf0kWGeVIQwJVd2D7XfkR
         N9bmzEtPwG+5gCE+5ON3hZj9ub5d9oGuV2hYuVxNvzasCWTnrkemLx0/saetpgLfy1ya
         UC8w==
X-Forwarded-Encrypted: i=1; AKwUvBzjHkxlCn7updUz/EaMYpLwJAGxSEHW13UMmoSIk+xL6h6jykkeXGfL7INVI5FVaNgSPW8qMtfp3HBarjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A+Z58FJaQJO8KRY1yNouYv3idBcO2ydyFn2P1jfzGtQ/WuL40
	nVnt+SNTKp9to/ZW1wsXIBPLEdoh27hgLymA+M7eX8idpLdLA217OxBG
X-Gm-Gg: AYBFou2CYP5NoXpDqIrvqdNJeBMzUb4XkECyv4HKx8wjCMOZEfI3+Kb8+Y0eStQ9zMY
	OwwlZv/J3im8IVpybQzGRTkiwepLaJpK5zonPEFS8OecENB/mrI0UudJkGTXsVQZktmGrsvg6Zo
	QBZ48M+l/KHqHVC94deCW0rvmxYMNgWsiWnFWLqW0owWLQDQ3/Laa9YWXBv2HODGMit7cPGdDjo
	h+51wnXdf4FebzjCbOHs9v9TdhCtFOQkxPFPCBWb1BTxhN8STnSGy54RITMrOu4Pvsn+m26Rr6P
	WKLZnPTD1/b0tQ4EsPY9XBerwYogGj7jSUjyt4DohrZ60uNPc/B+Zoko7aKFf14TdYhOQWtW7um
	BKIOg2wVffpuvQVDW2HRU8bhELWCbP32bBkuMVhhMGkPDRmcY1v2BJa+yj2WXhHHxJ0NqWrCASo
	CPOJ7ij4RhIupkBK8nHT9YR6105aOHg9P7GmAp7LMRM2yZVTmOZW7bTOJuJjFVZP1XC2BHjNLc7
	GKRcPPm+4HObqqG7P5/+e5JYzOlo+2YT/hRo+B8G9h1Ci1G3b9mMVMo+gz9HxXFLkMceXyblJag
	6MrA+QMhPecMxzaZAxBIUyO7IBp8PizDt+Omt2MyHnaWbSbQuzDhK0a3/9v7KwAfmTEUaucDVGA
	teTiNpWyuu3u0JiKUEx+DlHei1w4=
X-Received: by 2002:a05:701b:2506:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b25d305837mr2299612c88.12.1793954067223;
        Fri, 06 Nov 2026 00:34:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:3827:c357:8cc4:f558])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm4594322eec.1.2026.11.06.00.34.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 00:34:26 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Nikolas Koesling <nikolas@koesling.info>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH v2] HID: pulsar: print errors with %pe
Date: Fri,  6 Nov 2026 14:03:18 +0530
Message-ID: <20261106083419.29334-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

%pe prints the symbolic errno, which is easier to read in a log than the
raw number. Convert every print in the driver that logs an errno so they
all report the same way.

The prints that log data bytes, battery readings or a byte count are left
on %d, those are not error values.

v2:
  - convert the remaining errno prints too, not just the battery one

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
v2:
  - convert the remaining errno prints too, not just the battery one
v1: https://lore.kernel.org/all/20261104150055.33028-1-sinha.aryan03@gmail.com/
 drivers/hid/hid-pulsar.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-pulsar.c b/drivers/hid/hid-pulsar.c
index b0b34849f..495ce3b5c 100644
--- a/drivers/hid/hid-pulsar.c
+++ b/drivers/hid/hid-pulsar.c
@@ -162,8 +162,8 @@ static int exec_cmd(struct pulsar_data *drvdata, const u8 *payload,
 		spin_lock_irqsave(&drvdata->raw_event_lock, flags);
 		drvdata->pending_event = CMD_NONE;
 		spin_unlock_irqrestore(&drvdata->raw_event_lock, flags);
-		hid_err(hdev, "failed to send command 0x%02x: %d\n",
-			payload[1], ret);
+		hid_err(hdev, "failed to send command 0x%02x: %pe\n",
+			payload[1], ERR_PTR(ret));
 		goto out;
 	}
 
@@ -295,8 +295,8 @@ static int read_power(struct pulsar_data *drvdata)
 		if (status < 0) {
 			ret = status;
 			hid_err(drvdata->hdev,
-				"%s: failed to read status: %d\n",
-				__func__, ret);
+				"%s: failed to read status: %pe\n",
+				__func__, ERR_PTR(ret));
 			goto unlock;
 		}
 
@@ -320,8 +320,8 @@ static int read_power(struct pulsar_data *drvdata)
 
 	ret = exec_cmd(drvdata, payload, response, CMD_TIMEOUT_MSEC);
 	if (ret < 0) {
-		hid_err(drvdata->hdev, "%s: failed to read power: %d\n",
-			__func__, ret);
+		hid_err(drvdata->hdev, "%s: failed to read power: %pe\n",
+			__func__, ERR_PTR(ret));
 		goto unlock;
 	}
 
@@ -411,8 +411,8 @@ static void power_uevent_work_handler(struct work_struct *work)
 
 	ret = read_power(drvdata);
 	if (ret < 0) {
-		hid_err(drvdata->hdev, "%s: failed to read power: %d\n",
-			__func__, ret);
+		hid_err(drvdata->hdev, "%s: failed to read power: %pe\n",
+			__func__, ERR_PTR(ret));
 		return;
 	}
 
@@ -584,10 +584,11 @@ static void pulsar_init_work(struct work_struct *work)
 	}
 	if (ret < 0) {
 		if (drvdata->type == TYPE_PULSAR) {
-			hid_err(hdev, "failed to read device info: %d\n", ret);
+			hid_err(hdev, "failed to read device info: %pe\n",
+				ERR_PTR(ret));
 			return;
 		}
-		hid_dbg(hdev, "failed to read device info: %d\n", ret);
+		hid_dbg(hdev, "failed to read device info: %pe\n", ERR_PTR(ret));
 		snprintf(drvdata->battery.model,
 			 sizeof(drvdata->battery.model), "%s", hdev->name);
 		goto register_battery;
@@ -615,8 +616,8 @@ static void pulsar_init_work(struct work_struct *work)
 	    devm_power_supply_register(&hdev->dev, &drvdata->battery.desc,
 				       &psy_cfg);
 	if (IS_ERR(drvdata->battery.ps)) {
-		hid_err(hdev, "failed to register battery: %ld\n",
-			PTR_ERR(drvdata->battery.ps));
+		hid_err(hdev, "failed to register battery: %pe\n",
+			drvdata->battery.ps);
 		drvdata->battery.ps = NULL;
 		return;
 	}
@@ -639,7 +640,7 @@ static int pulsar_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	ret = hid_parse(hdev);
 	if (ret < 0) {
-		hid_err(hdev, "hid_parse failed: %d\n", ret);
+		hid_err(hdev, "hid_parse failed: %pe\n", ERR_PTR(ret));
 		return ret;
 	}
 
-- 
2.46.0

