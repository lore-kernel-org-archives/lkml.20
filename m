Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436393D1CA8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419160; cv=none; b=Z4FnpvwXIa5G2Xj1pmeH2BIGKhI6jfeWfdPFW4999YWW2df0oDbzYLZU81NfZHx7p0jNhJneGFTFYJouK42ob/ice3Bjd738vTsqPdfRRVctJT5c6r12ORPOCJl6dXTDWQT3c5NrjbBhmHv2++BqEOs7Hc59moogO5bGVzBCWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419160; c=relaxed/simple;
	bh=h+V6qAtLqeW/WU/IZPbSmtZFHj0DhMBYDtjWmrniU0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HmleneMQvqL2OdNCaKEaNTEP17/sR6k4ZLvqmmQXOf4efWumLUtZT160xHK7eKD+gC3AKKhuQEoLsskDRHbBJcPjl0uZ0rK33Bpxo5u4xEcePJiJcfTc2KsYyLfKqKCFXbfSq5rXn2wsYZrs4tLPCXqPv/EJap3g5v1m6awIjhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agoXyZ6G; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agoXyZ6G"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so1833035b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788419154; x=1789023954; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AR8htrDl8qSqroXyJFh5dXqeQpCBckfru3AXsX4Pm8E=;
        b=agoXyZ6GRTL1rOux0yJMK1YpjkKmWZRX1gZnFsc00IBxfp7hpkHvY4Xhf9SmiIL8OK
         pGfIqcp0eFor2kWcJJqST841DNTvPCgUiaORo87QuVYtUDKt3Oc2rgS12DIRX4/BuDIM
         wl/xgWTiCdbpBkVM7rfrajiLGq3AYq0Eqwe64HTEJlV3AZYgKpvDHEhPVNkn7KXhau5M
         gJ6ApEukrOVbW2cvswfGwyLY4kgczhQNqXWj/iHQwv8h8UCpwz2m/OAvElu3l8SePD3y
         kIyMXVu38l0KX0/dZqPeP9Vb9dD1k1X1QW7+IRU7mppLWumYFW7Pz5sitVzXHNowN6cQ
         xnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419154; x=1789023954;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AR8htrDl8qSqroXyJFh5dXqeQpCBckfru3AXsX4Pm8E=;
        b=R3rqeqhpxTebiaP44JtzoaSGyz6EQz1nKwCx0eb6wSdYXIBfkB6noDK/Z+gC283q3M
         7mn3IqS3HunW6FA+hbrgZ42FABhazCcHaFBBSrLaYyxApEp6B+G7s4nUSKOS3mrXfO97
         h7OK4Mrwj+0duX0k5Za21spwIoAP3D+NjJYbtUF3O7rGDn1DeeDJcCmmbdTQArGe8ogq
         u/+wmRCKTAa26I2K9pqv7X8muBA6OzNtUfjfm/h0z10/P3WcU7kvHqskrjX96IwLVfQ3
         JU1xrqOOLSF5R8gjgvGUkCTCkaiLvKF2JTrt2AvpukM1hMwiAJaPWzk0+GiAuztggka6
         vvMQ==
X-Forwarded-Encrypted: i=1; AKwUvByfcKkAtMvZFhRFK+xaNZAI2v+TsiUy9TN8+6GohjVdAVQAVJyuVNyfyLEy48PfKcAUgSeepp9FajRhvtI=@vger.kernel.org
X-Gm-Message-State: AFuF++nNKevqBpR141+7EUKiR0MVFr6EaC4deRNAonxqux/W+2jdgGAP
	g8EWEz1RHA2tlxOy3oLBa2Cv3SExvKsccshArr2zGdWvNvTP/hiPtj+G
X-Gm-Gg: AYBFou0aWlvPkEvdvZlGMNu1aRVQ2wJvd6kwmPrGc0+FEVLRsEisCMeIzUlnQmXT5RE
	yeXPob4cDQHN5TjrOAluemrhWCsxZl2QXjFjTMaj0drbdU0QSfDeWq3N1cYAdPI6isqa6thPUWd
	VFSI20FkKa6QoSM6qlYPWRBYMtyHw2udfCWuZob0THpvTj38MDgToW3wWrzaPHbMwosLRxdXJdm
	6IoJQ+xXkkUFmPhr5bK7+gr7b2fB6VYiOnypvHzHBcMtiShYciYnnSjp9/izZzalZkqDR+DSqP+
	77ZBvAyZlZ8uuerVZwjB5VU6k/ebSAqbb3PnghLEyMSMYlxVzeBFD4CoayHy1sCGRotbxX/GMyE
	H41zC/htAw7nyNJr3YUeyVp8tFSL75CBS2RDCiZq1kss7BgHQeXkzj2ZICDsU2SBMunLNLgQYQB
	T2O28Ap5PaCDG2M91WRnrtV5O/YBIsTUdW50f6s/ulZcARbzxpdT/fbqUWXDoXJ/PfNGuq5nbOR
	e2H3/ZxqWDpFZm0gvLlGJD2do+A+3gbr9EzLQ==
X-Received: by 2002:a05:6a21:1145:b0:3d1:be60:2816 with SMTP id adf61e73a8af0-3d9ad47baabmr16383423637.10.1788419154509;
        Thu, 03 Sep 2026 00:05:54 -0700 (PDT)
Received: from [192.168.20.42] (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d4110aesm513114a12.20.2026.09.03.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:05:54 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Date: Thu, 03 Sep 2026 17:05:35 +1000
Subject: [PATCH v2] iio: light: apds9306: fix default sampling frequency
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-apds9306-v2-1-e8673986ae56@jacques.com.au>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MSw6CMBSF4a2QO7akDx6WkfswDG7prdREiq0QD
 WHvVsYO/5OTb4NE0VOCrtgg0uqTD1MOeSpgGHG6EfM2N0guG665YjjbpBVvmCFrsDVtRbWGfJ8
 jOf8+qGufe/TpFeLnkFfxW/8gq2CCKXfWErFyom4udxyeC6VyCI8SF+j3ff8CLxe9RKUAAAA=
X-Change-ID: 20260903-apds9306-bedba7b74e59
To: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

APDS9306_SAMP_FREQ_10HZ is defined as 0.

According to the datasheet (Broadcom AV02-4755EN,
https://docs.broadcom.com/doc/AV02-4755EN, page 11, ALS_MEAS_RATE),
bits[2:0] set the measurement rate:
- 000: 25ms  (40Hz)
- 001: 20ms  (20Hz)
- 010: 100ms (10Hz)

Change APDS9306_SAMP_FREQ_10HZ from 0 to 2 to write the correct value
for 10Hz.

Fixes: 620d1e6c7a3f ("iio: light: Add support for APDS9306 Light Sensor")
Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
Changes in v2:
- Add datasheet link to commit message
- Remove blank line in the tag block
- Link to v1: https://lore.kernel.org/r/20260903-apds9306-v1-1-3f892aa4f156@jacques.com.au
---
 drivers/iio/light/apds9306.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
index f681b02e4922..7dd41136734f 100644
--- a/drivers/iio/light/apds9306.c
+++ b/drivers/iio/light/apds9306.c
@@ -61,7 +61,7 @@
 #define APDS9306_NUM_REPEAT_RATES	7
 #define APDS9306_INT_SRC_CLEAR	0
 #define APDS9306_INT_SRC_ALS	1
-#define APDS9306_SAMP_FREQ_10HZ	0
+#define APDS9306_SAMP_FREQ_10HZ	2
 
 /**
  * struct part_id_gts_multiplier - Part no. and corresponding gts multiplier

---
base-commit: 940de590b839f71d6dc846160534bf202401b8b7
change-id: 20260903-apds9306-bedba7b74e59

Best regards,
-- 
Tsz Shan Chan <tchan@jacques.com.au>

