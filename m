Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.0
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517512;
	b=GUAI8LJtAv1dceJJl7rWwZOAaQCUYTMAA2nvpkXLzn4nPU9r13HZTr3ZualA2fspv113
	 MjW+b6rcHyJAs+1b7xF81qgUprsiDXONS65eVqHaap+pEIctG4OZzRKhkBouzU8RyNVla
	 2QqnLNOkFdLFlwaz+j+uiBXoYTZca77nDOeb5c6e7GZYPonFlDQUbf5mAAOqzqjOLIqEj
	 ZstzL2mzuAsP30iY8MoE2SNGDiAEwcEXPeLQ1ALJBqBmbmYWvQHjSaRU6C67SEXI3pqWR
	 SUwm6GYymDBaeVnlYhwLVFAQJ8kdX7ezG8tSv/C5cV9y1Cr6TK3RqBPrkukcdJ3E0bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hJ8t74G6PjkYvphhbVRv9I2mF9huPrhkTGoozlSoI/Q=;
	b=X4eDDc3VbTZzPUcPHTdsnQx9VlTYL9Efn9DR3muxIG2UnPAd49cF5C4jp0ifBBROggel
	 yNo2+GM6EZYukL4hkbXy/OcWtKIaypY6vCVCfdlGiHeoVBjhxWH87UTHzq7BzdEMq9nmn
	 MQsk6g5gtjF3NB8lseX9pYZemQqh0+7G6D4g2OVMgGgHbKIvTw3uiIcAh/oR6Uimg+1Kp
	 SUGJUnKuXAY6p9h+3HU8C19VdVT1CbLIlf65VvR1rLiR+CD5PbItUsAyDnlozLAkAnnJF
	 WvTLANK5vXBtfwdIBX7r+RZH/4IkcO+3TEE8zFcUXT/J3npD2DMPEdamZs153EMKVQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Guq6jjwU;
	arc=none smtp.remote-ip=74.125.227.0
Received: from mail-vs2-f0.google.com (mail-vs2-f0.google.com [74.125.227.0])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D1606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4D1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Guq6jjwU
Received: by mail-vs2-f0.google.com with SMTP id ada2fe7eead31-7565f2f85c5so560047137.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793517510; x=1794122310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ8t74G6PjkYvphhbVRv9I2mF9huPrhkTGoozlSoI/Q=;
        b=Guq6jjwUTy97WcRmKyfssGanRmy4Cgzjxn8AeTeIadPIDswcDYhqdDuNAJak6mljDZ
         roQBz1Jhnznuy8rIPsUl0RRCepY0BBFWCY66ujBiuv5MixdqWeMbbqiDV4+1NG87a09n
         v+d1ScRAAH9q7XAAJoY2sLkkpO7Zaix2aJojcKe4oavI+mCAfopgwm/sFJZfb6Zhzp1O
         ypaPvC5pKP10DOraP4oqQw1i2eS/Ou2Ik7WQt5GiuD38lT5QFU8kvKJAJ/VKv+pKRZO7
         JfYBMcTt1O9KfPVvIvIynN/RWmndA2KRNL3N36Pnr87Spgutd7pSeuRGC2HSoYuRI2tK
         9dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793517510; x=1794122310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJ8t74G6PjkYvphhbVRv9I2mF9huPrhkTGoozlSoI/Q=;
        b=HaOSW5X/aNhrmnjdDP/pDU2q7UQixCXsBhxFwgsB4RYEF+gGPTDKr32KC01BScyf+y
         vO2nYQosVpzA/r9eRI3nVOb4afECWEA4mJtYhHuOQXBuvsuOLOoPNR/THPUs3o8ztAVU
         BqEXKVzzuPksPutSVrjGmBLJRzmJgGtNUUXhwv3CH0MBpmY75IeUZNeUuP5MAnTKA9Zc
         HBg5MlzKlj4YaR3TuYsQ6WCieyA1MYy9YfAF5huPOcYtdTRHC1oGsZ0MhuhEkLu4KVnc
         a3qv9AgjbD4n9ZjveLxXZy3NdbaIXY/bQCTIqjPNuJoScjR4GUcVM8yAwrvyYhkVN2fD
         xn1g==
X-Forwarded-Encrypted: i=1; AKwUvBzuvaYMdvOyHo0w4Nf/99nrJrpQomLnJiaTaRwFRVrM+E9r9er8piJQzq8/FEyhBNMcUs2T9sTKH91ExwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMpXNXqqmxLi2ACZXtWyCQ8cdCvny7yeQxHrli+2XVWzPoQcYH
	HjViRhbFPk6a+1RWHxIX88h7C0xxD8n4koRcpb/IIU05LoJR7Mv/jiD+D0Rdv8DK
X-Gm-Gg: AYBFou2wzwHnFUjJv/uCzGGUk2+5YF85fw2J8ujsD5jAR6kS5YS2kXlIfCFHN+7UGdK
	r3isoTLX7j7JmUft63MYNbkxkUMy+3rho8w/Lc0P1lk2zahR+XphMBVXh280i+VUOhfbq2/zb7g
	pkPhB+jmCfDz+1iS9g+1B7Erg7FOvadxEj7sxI1Qit9TnwWNrCZ2F2Px2Idq3TGYtF5oNho7BCa
	L8v/lB7BdaZ2HKmJpksYE9tqrn14rcjTNg370ziICxkisb6tMpS8Qj9Pxdlm8ie/EKIMTnLMrne
	WwFSBWC9Ci2HQmZteUJRLCRVOLoykCPOTp2Wo/ZNWrIrLtjx7reJiZE4mkzSY2vRJ+Pxs1IlEKw
	n8UEOfi4bz7c4Pe+OGioXqsFFBumKLR2KfsV7oGz5/N9FjPjraIdVQTVYYEIni/pTUak4Et6ov8
	5H47CRe0ZX/R8LkgVgSFtKDw+ihWQh083m8PJuLxj4GCgxEiR0O9fGXtvNv+G2M5ncHkCasVvC3
	w9scakscQ9c9ToCBQsXo2y/IUH/0SEUxwprIAnfJpsPLMXM+3KumLqNJ3v0L7WNZqdVOPkgT7Xw
	KvLgt/1tsghP3uhNszWxjScyAAJSeNbP4R9o6MkiXifIh+NELo+6DHlxUAi5
X-Received: by 2002:a05:6122:1d46:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5ec68295940mr3359656e0c.0.1793517509948;
        Sun, 01 Nov 2026 00:18:29 -0700 (PDT)
Received: from linuxmint.. ([2802:8010:9a2b:a201:7173:4fe:efa8:f823])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69caeccdsm7408536e0c.16.2026.11.01.00.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:18:29 -0700 (PDT)
From: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
Subject: [PATCH v3] HID: wacom: replace sprintf calls with safer alternatives in wacom_sys.c
Date: Sun,  1 Nov 2026 04:18:17 -0300
Message-ID: <20261101071818.529598-1-nehuenlian.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101054830.291749-1-nehuenlian.kernel@gmail.com>
References: <20261101054830.291749-1-nehuenlian.kernel@gmail.com>
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

 Replace sprintf() calls with sysfs_emit() and snprintf() calls in
 wacom_sys.c, which are safer and avoid buffer overflows.
 Also include the header '<linux/sysfs.h>'

Signed-off-by: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
---
Changes in v2:
- Use snprintf() instead of sysfs_emit() in __wacom_initialize_battery()
  as suggested by Sashiko bot.

Changes in v3:
- Pass sizeof(battery->bat_name) to snprintf() as suggested by
  Sashiko bot.
 drivers/hid/wacom_sys.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 628372ab818a..7d9bbcb13ae0 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -6,6 +6,7 @@
 #include "wacom_wac.h"
 #include "wacom.h"
 #include <linux/input/mt.h>
+#include <linux/sysfs.h>
 
 #define WAC_MSG_RETRIES		5
 #define WAC_CMD_RETRIES		10
@@ -1838,7 +1839,7 @@ static int __wacom_initialize_battery(struct wacom *wacom,
 	bat_desc->properties = wacom_battery_props;
 	bat_desc->num_properties = ARRAY_SIZE(wacom_battery_props);
 	bat_desc->get_property = wacom_battery_get_property;
-	sprintf(battery->bat_name, "wacom_battery_%ld", n);
+	snprintf(battery->bat_name, sizeof(battery->bat_name), "wacom_battery_%ld", n);
 	bat_desc->name = battery->bat_name;
 	bat_desc->type = POWER_SUPPLY_TYPE_BATTERY;
 	bat_desc->use_for_apm = 0;
@@ -1928,7 +1929,7 @@ static ssize_t wacom_show_remote_mode(struct kobject *kobj,
 	u8 mode;
 
 	mode = wacom->led.groups[index].select;
-	return sprintf(buf, "%d\n", mode < 3 ? mode : -1);
+	return sysfs_emit(buf, "%d\n", mode < 3 ? mode : -1);
 }
 
 #define DEVICE_EKR_ATTR_GROUP(SET_ID)					\
-- 
2.43.0

