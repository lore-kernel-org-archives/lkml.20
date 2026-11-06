Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000940;
	b=1Ta6EwAw9O6uVAeZDF/KZkyjmTsmysbOuFB+u38M9xq6Q7vTX8EjNjXgITROc3q5FADm
	 44HlmZtdHpAdkG4o+eLIfgmtlBQMgMRQ4Dh361bhAiyCifKFZyAfv0+jR5I+gNwJeYGi7
	 WnLr7be6UvKoG+JIwxFjtwNG180LHy8ZHf1II2cJFdCzcZhEJ2OOM5VOPRJl6Y2ZEsvDC
	 UOjYGyUGdtQ4HLjoeegEaUTX2Oo8ms1zlyRL6JK0sBi7FhSwOTFT0xaliMjt6NQFpyzmX
	 Y7KOv2IqZ9gRBParuwnGrvQkZk9/DLTg3LuiaczdB9OMtwJ6iVQZT87fWb/CHLsiRgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wdxh+aljoFBv60+IjwtRPv+nHnuCCpie0lKl0KHTOho=;
	b=puNpPVZLeHthrqbP16ue/YZUT4uvxGLTVr0CubNLaG6YyH7lY4lyyodxPBCK03hUtY3L
	 aTotDiZeJtkWPNCKNjBDZLr4azhWqFoRB4RxkjWBYbi1B/G+fg7w1ZKKT3mDdNTw/5Q8Q
	 fjRwOgx73ApVlVtD3rQ5YwNt8zLOjZbNSXRG+pcJVx5Ge1sUn6/JbFstaC2f6THVp7OZV
	 NBa0VG6NLXqG6zFlU/0ouc2FbQp/bmKq1C/F87yq/fB78tJnPOwV0D+4++EAi/uQZTc5i
	 gr9S/Y8au7SOI6YE28txpSBcuma7r/B6OkLQX//O+C+qp3piwSeFbtn21zAK80+HAgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbjcMn5a;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A6606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9A6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbjcMn5a
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso775470a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794000939; x=1794605739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdxh+aljoFBv60+IjwtRPv+nHnuCCpie0lKl0KHTOho=;
        b=gbjcMn5aR2wOI66yF8d+3Zdznq6J+xtRck++4A5CylDDKDYFMD1vrtwMjIXwoAMRPV
         7PSHfZM7laJuwt7BTSoG4hK5GtRYoreSBHXcWlz8iwKL/r7Uu52MnMXY3DFwfYz+++Zb
         xgBq+ZQsYZUR450/S94cTt7zKKlZbmAuz8ffMA5RvOpGAPScO3qXhpXLZooh95yq6sRw
         CKM1ybYpMYJP4N8QJT7zS18I8LJMfLiDRTnzEleICPtfBaLVxPkdOg2xUlN0nmcbVuzV
         LIkQI+4Jx5bN2tiTuxUIc4VXa7Qb/xXrc/1xZV7Z+uqC1wAR/YcHSEwrmqdw+mSA8qEy
         7laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000939; x=1794605739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdxh+aljoFBv60+IjwtRPv+nHnuCCpie0lKl0KHTOho=;
        b=t1JFpkz2B1Msr527TBsfpBOPBqJ2Re1zgYN09raFNn4pD4s6/sztrY0p7OzwBagCj4
         wOkOkDgiBOZ6iE5wFhiLrfW9enXU0W6hOexSDTz2RtjwheFTyfJydMapMetXLy9l68Fd
         mHBqcFV4zhwK4Icx9MxtUCIfWqJKXqp/ZgI5AQZxwsAh3xEyfOmwsNl6GuK4HKBj4BaO
         UZzvA1Cx8+7Ard+pikc2MRc36fAzbgsuUZc23752YqpiFiiz1OO2J6TC0PnOOWXxo3aT
         EzEoFcbMrTP6CWaSFPscBw45k+A5bl6vbb6PYwRnYg/V/nZ3LRuikHX7IKxhvbEBfJDo
         GheA==
X-Forwarded-Encrypted: i=1; AL+hErEEAvjbk7U+XqwITjhki7Y3HMIbXQO7dTsw383jasyq6tAhc65of83GbjWRuElNpCtEqlj4KdHolncCVFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9apoKILZC3GBoaOAelax9cWHZ5Z0qahcd2ReqUZEoXnFgQaMyW
	xJ2R7TUfJdid+xP3gEPgtuYlNMqdhgSCW1TO0aNzrsWTprjrx394N8u1
X-Gm-Gg: AYBFou2S58azfNDe8esdnL3SI+WBgv2bEByoTJyDoy4iq0FIxTT4H7tSgWTFVfTLgnq
	gsKDUwgPUNPmSgdEfFK1ea9meSMde8BS0Oi9aH2WiEDHEJxwMuKPlFq/RhnbsR7numJ3KZHHfGk
	oPSRjTGZE+Rs5lBX3WVBLZnyhNz7CveuW6o2urwuSI72rhqZcIH9qAagxtcndS/Kz+ClMH5+xXL
	MORN1Xdw8qJa368eQVm2ukv+yfhBYdSDjYwt/F2JI6h38XHKvuJUBA17tTsarZog0xvYu4hj/5S
	V/qZ78AUhlqgcRr7N8myF76ZfXW430g5g4uHTfS61U3dm3JBjRMAnwcem+NIlOcPH9J2N5Z0/cc
	2L1aA1cya6GWkULw/W3kNjEjWSmzzidV3lkSxqJigalUIsHYJzuDsx6cXWNYklXHq8cPeTqldHN
	siHyvR87F1ZU15aJ1G5yYdsa4dIakqbMz0e0oycXhn5BkSSdSxDkvQHhdWgWEQwRDVFTxiCMCQL
	xjzes6BTGYzHBLqDlX7JEsbADyjctnBrqyT9YhSi82YDpEd6VD397H7ayiuqW6vgdExvhZ/p8ml
	a0Y7YuL7xkeXz9A8v4fFDA==
X-Received: by 2002:a05:6402:28cc:b0:6b4:5a98:2628 with SMTP id 4fb4d7f45d1cf-6b5977d5c9bmr2608295a12.23.1794000938821;
        Fri, 06 Nov 2026 13:35:38 -0800 (PST)
Received: from beelink ([186.247.78.219])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad2cd6sm1118836a12.7.2026.11.06.13.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:35:36 -0800 (PST)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Jason Gerecke <killertofu@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] HID: wacom: validate battery range before scaling
Date: Fri,  6 Nov 2026 18:35:26 -0300
Message-ID: <20261106213526.3393779-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CANRwn3Tt0VguzG=_azEZAP8vfxr0BbyWj=Nu-R3a0TA1nNGqog@mail.gmail.com>
References: <CANRwn3Tt0VguzG=_azEZAP8vfxr0BbyWj=Nu-R3a0TA1nNGqog@mail.gmail.com>
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

Battery events divide by the difference between the logical maximum
and minimum without validating the range.  A malformed HID descriptor
with equal limits can therefore trigger a divide-by-zero exception.

Move percentage conversion to a helper that rejects non-positive
ranges and accounts for a nonzero logical minimum.  Clamp the result
to [0, 100] so that hardware whose ADC occasionally reports slightly
beyond its declared limits still registers its battery and updates
capacity normally.

Fixes: 37d160193834 ("HID: wacom: generic: Scale battery capacity measurements to percentages")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---

Thanks for the feedback, Jason -- you are right, the s64 stuff was
overkill here.  Much simpler this way.

Changes in v3:
- Drop s64 widening and div64_s64 as requested by Jason Gerecke.
  Use __s32 range with a <= 0 guard instead. Keep the clamping.

Changes in v2:
- Clamp the computed percentage to [0, 100] instead of returning
  false, so that slightly out-of-range ADC values do not prevent
  battery registration or silently drop updates.

 drivers/hid/wacom_wac.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 361738b..36bab07 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1960,6 +1960,16 @@ static void wacom_wac_battery_usage_mapping(struct hid_device *hdev,
 	return;
 }
 
+static __s32 wacom_wac_battery_percentage(struct hid_field *field, __s32 value)
+{
+	__s32 range = field->logical_maximum - field->logical_minimum;
+
+	if (range <= 0)
+		return 0;
+
+	return clamp_val((value - field->logical_minimum) * 100 / range, 0, 100);
+}
+
 static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
@@ -1973,7 +1983,7 @@ static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_field *f
 			wacom_wac->hid_data.bat_status = POWER_SUPPLY_STATUS_UNKNOWN;
 		}
 		else {
-			value = value * 100 / (field->logical_maximum - field->logical_minimum);
+			value = wacom_wac_battery_percentage(field, value);
 			wacom_wac->hid_data.battery_capacity = value;
 			wacom_wac->hid_data.bat_connected = 1;
 			wacom_wac->hid_data.bat_status = WACOM_POWER_SUPPLY_STATUS_AUTO;
@@ -1981,7 +1991,7 @@ static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_field *f
 		wacom_wac->features.quirks |= WACOM_QUIRK_BATTERY;
 		break;
 	case WACOM_HID_WD_BATTERY_LEVEL:
-		value = value * 100 / (field->logical_maximum - field->logical_minimum);
+		value = wacom_wac_battery_percentage(field, value);
 		wacom_wac->hid_data.battery_capacity = value;
 		wacom_wac->hid_data.bat_connected = 1;
 		wacom_wac->hid_data.bat_status = WACOM_POWER_SUPPLY_STATUS_AUTO;
-- 
2.53.0

