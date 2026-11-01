Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530041;
	b=SELXWCMnl2eOTBazTZxq4Sd2saiQjUZt323U1+lGsiWBsVAzMYFFfQhxGUr+R0PnthTv
	 zkR5iA0M5YOd5eDUQQv+LmncNRJzWL5KDMqSwvwyMpUSw/bzn5gD3uNRcqfOT1Q9NWEIY
	 02Y9XR18Q4HH809TfAFKhmbo7eZ7IM8NbbQ6NbwsiDHLYQ7y9Ex2GK2sBRGeE2k6hif3B
	 qkRBDVn3Ml3ku7T9p4stxdPuOTBUy6+zzx7ihDcSVe1TUrWyn/SFe0zLnTc39HMbgGTw3
	 tOz9IcPA598aZPsk41SazLPEUg3QTSC6MUokvOBSAwVdtuOutRs4Y6WX1hNVyFzebpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AexwcsRGwzjjNvCz+2Yi3C/cbZ1yMKJ7WYhXkPSgkVk=;
	b=Q46IK4GE0vb9k4VYBwsZ1xxsIDrdM8vf1HV930TOWtXD7/Eh7L/7uXWGxEWuuNkHAriY
	 EIzeC+9YGr+d23O1rpz+mVlP1S/esPpPefvB3O5tVNNI3Ot6fKqyZ8k9LPHC2yi528v1M
	 U0wbZQbmq0iaqBoXbUHX2vNOWsP6lBaiHQ1axFFcREGXteX7/4jemzTQueNC9FnmZHFqZ
	 0Quvu/btIiMZttKBNJbi3VtTtdj+pm1i9Y0Y3I6tv1vmGG9NKZaXgovKlP7q9uiB471qs
	 6nkzc4DSlDFGqHIpLbqPiPYud5retWxUZVY5oEdbRnwdJPaHKnC/gUDj5ZLTVS14sXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aglBb8YV;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD0E606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD0E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aglBb8YV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso21451765e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530040; x=1794134840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AexwcsRGwzjjNvCz+2Yi3C/cbZ1yMKJ7WYhXkPSgkVk=;
        b=aglBb8YVKgoNb71KyRKWkL0xRX0pkCyiGqavmUrOaAz23M6tr/2ZqV7/XfnNVWKHXI
         fpAEpZxzQG+TipsAFosqLjfC6JQRFSPx+hjkvrswXLIbCfOt/0OmIvq61nIJnIq4rOMo
         VVk3Im/v373RcWAsGvJe9H8NhqeIXCciTAtsUmx1g+kva7Q4Ra+MlTkso5vNLMqB3cKZ
         OhWzBQRrn/4FtdtC33FPamn3cWPOh18xPzSm1kWI+dg8b5V1jbDHDSTdpMEUE/qlRWVH
         YmUwEHk4d/aD37MPJKqtWRDc1MtjxbeZ4DeGAcNjsM4+P28knX4+8Xwc12228gLOyoWs
         MMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530040; x=1794134840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AexwcsRGwzjjNvCz+2Yi3C/cbZ1yMKJ7WYhXkPSgkVk=;
        b=mJVVTZ2OoS7Zb6s9Vo/ZBhQ3UgnjaLElUEpimeR+X5BBTwZHsELVz4xsCJ6xLqfdZe
         vPDAkvc1Z91gGOSjUGBBRfs+3JIVwVGhbNL/G+gxywmak1YfdojlUV91pFkkeaQL1yWT
         rHVWogYwnB52ur2PihKYmtQZLVy3wFnePFhilduQSgJAgx2bAK45KtPFwzEAG3Ejy8Xj
         LCy4+AU8XH98TDlyZS03+YjAtasnOospQ/gCWeskRvj2zyhJy37NPiqSk6TNAMz6aDtS
         6OkGLYxAleJgnWlmhGWYhYmdO2g0ukk6odOAa8S4o2SeZiLfWYNt9nt+ISPySF0Kkda+
         qtUg==
X-Forwarded-Encrypted: i=1; AKwUvBxOSpdPgB91Q9cfd39IRtnA8WgOEasYucxYkyUNYDFP7VUSTxqRElPaiVTa6E0TjzPWKfUmCIpNvlhmiNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIi9nuL+6WpNn4Vwe7zaW3mibRNC3nG6qzFca0CEZZlvE1wZ5N
	tAwXhmJJnz55+8yEFGkMvCi0FehKoGuJ8dmymetW1oOawT47DD3Fjph4sCSn7LN4EWU=
X-Gm-Gg: AYBFou0ha28Dli9fbA812RvR+FkWqwUmBeLW0wUHdIzVNLRG1RAatbV8rgDkzjKPx9k
	zwldNYVr+xkDxPQ3Ike1jA3Tw0oJmVrYugRLZ/1aU7dx1xya1QqsK4pcRnquepZGXj0ULtv20Kq
	hBYwwvG1Me/r3g+vrRrwpeU3LUMHXWetk9QwE8Lp+iFnmcmxAQPkqNuqD8AElyzhoeFrpI+ic5x
	6NK4tEHPCyICfEy++czTRcWypSYSQM5WUI0p8sCO+tDUKxgkWQP9eC+qH/y4Puu5p6eP7ffxYdb
	M+0cUPM8/w6yKb98akH5kCqIAY4aergAd25rfZN+hY8aOettUUI68+BnPABfoNL9K5/pJlONTD4
	tQUS0SECX9z2ZxerGZo5Fsp2Ox25K8uqIAIXS3pl31Qiq0rfWVPOBV2u6JnJTP2WzNk5ab2c5xZ
	a7TlcdAGeCtfjDL5pWlCLcBB1szEDJpgsCSeBNLhlOjCxgkCWZO3oLkT1PwPvr6PyOq2gOJe5mi
	leuY99aLvDehy2M5Jix8qy/D5IhWSpHOQqM1pGj6sfEJy20Ua8mtMFPAweZn08tZ6rb1o7281Un
	jKHxY7uC5JiA8shCES/tqVnnUkg=
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr170505775e9.14.1793530039980;
        Sun, 01 Nov 2026 02:47:19 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:19 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:47 +0300
Subject: [PATCH 7/7] platform/x86: asus-wmi: show the effective duty for
 enabled curves
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
Message-Id: <20261101-asus-fan-floors-v4-v1-7-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

When a custom fan curve is enabled, the embedded controller executes
each point at max(written_duty, floor_duty).  However,
pwmY_auto_pointZ_pwm reports only the stored value, diverging from
the duty applied by hardware.

Return max(stored, floor) from pwmY_auto_pointZ_pwm when the curve is
enabled and floor data is valid.  When disabled, continue returning
the stored value.

Because the controller operates in integer percentages while sysfs
uses PWM units (0-255), the reported value is an upper bound of the
applied duty.  Consequently, reading an enabled curve is not
read/modify/write safe: writing back a read value commits the
firmware floor into the stored curve.

Trigger sysfs notifications on pwmY_auto_pointZ_pwm on enable and
disable transitions, as well as floor refreshes, so pollers detect
changes in effective duty.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-asus-wmi | 14 +++++++++++
 drivers/platform/x86/asus-wmi.c                   | 30 +++++++++++++++++++----
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index 24931cc97ca86..36b633a5dfc49 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -281,6 +281,20 @@ Description:
 		(0-255); the driver scales the duty to the percentage the
 		firmware expects when the curve is enabled.
 
+		While the curve is enabled, _pwm reports the effective duty,
+		which is the higher of the stored duty and the firmware floor
+		of the point (pwmY_auto_pointZ_floor_pwm).  A disabled curve
+		reports the stored duty.  The controller works in whole
+		percent, so the reported value is an upper bound: the applied
+		duty can be up to 2.5 pwm units lower.
+
+		Reading while the curve is enabled is therefore not
+		read-modify-write safe: a curve editor that reads the points
+		and writes them back stores the effective duty as the new
+		curve, and the duty the user originally wrote is lost.  Read
+		the curve while it is disabled, or write back the values that
+		were written rather than the ones that were read.
+
 		The embedded controller binds point Z (Z = 1..8) to the
 		temperature decade [30 + 10 * (Z - 1), 39 + 10 * (Z - 1)]
 		degrees Celsius and silently clamps the threshold into that
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 74476904cb99c..bae5a528ac5d8 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -324,7 +324,7 @@ struct asus_wmi {
 	bool gpu_fan_curve_available;
 	bool mid_fan_curve_available;
 	struct fan_curve_data custom_fan_curves[3];
-	/* protects custom_fan_curves[].floors */
+	/* protects custom_fan_curves[].floors and .floors_valid */
 	struct mutex fan_curve_lock;
 	struct device *fan_curve_hwmon;
 
@@ -3754,7 +3754,7 @@ static int fan_curve_load_floors(struct asus_wmi *asus, u32 fan_dev)
 	return 0;
 }
 
-static void fan_curve_notify_floors(struct asus_wmi *asus)
+static void fan_curve_notify(struct asus_wmi *asus)
 {
 	struct device *hwmon = asus->fan_curve_hwmon;
 	bool valid[ARRAY_SIZE(asus->custom_fan_curves)];
@@ -3778,6 +3778,10 @@ static void fan_curve_notify_floors(struct asus_wmi *asus)
 				 "pwm%d_auto_point%d_floor_pwm",
 				 fan + 1, point + 1);
 			sysfs_notify(&hwmon->kobj, NULL, name);
+			snprintf(name, sizeof(name),
+				 "pwm%d_auto_point%d_pwm",
+				 fan + 1, point + 1);
+			sysfs_notify(&hwmon->kobj, NULL, name);
 		}
 	}
 }
@@ -3797,7 +3801,7 @@ static void fan_curve_refresh_floors(struct asus_wmi *asus)
 	if (asus->mid_fan_curve_available)
 		fan_curve_load_floors(asus, ASUS_WMI_DEVID_MID_FAN_CURVE);
 
-	fan_curve_notify_floors(asus);
+	fan_curve_notify(asus);
 }
 
 /* Check if the capability exists, populate its defaults and read its floor table */
@@ -3855,15 +3859,28 @@ static ssize_t fan_curve_show(struct device *dev,
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 	struct fan_curve_data *data;
 	int value, pwm, index;
+	bool enabled;
 
 	data = fan_curve_attr_2_select(asus, attr);
 	pwm = dev_attr->nr & FAN_CURVE_PWM_MASK;
 	index = dev_attr->index;
 
-	if (pwm)
+	if (pwm) {
+		enabled = data->enabled;
 		value = data->percents[index];
-	else
+
+		/*
+		 * The EC runs the point at the higher of the curve and the
+		 * firmware floor, so report the duty it applies.  Only the
+		 * floor table is protected by fan_curve_lock; enabled and
+		 * percents are written without it, so this is a snapshot.
+		 */
+		guard(mutex)(&asus->fan_curve_lock);
+		if (enabled && data->floors_valid)
+			value = max(value, (int)data->floors[index]);
+	} else {
 		value = data->temps[index];
+	}
 
 	return sysfs_emit(buf, "%d\n", value);
 }
@@ -4059,6 +4076,9 @@ static ssize_t fan_curve_enable_store(struct device *dev,
 			fan_curve_refresh_floors(asus);
 		}
 	}
+
+	fan_curve_notify(asus);
+
 	return count;
 }
 

-- 
2.56.0

