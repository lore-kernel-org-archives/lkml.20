Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380206;
	b=vHfTLZV8KXwOIGkKe8Sgzx3GujCSJJxHdUPqV8cwN/g6EyESqO9NL+LIEJ3QZlHqH4wM
	 msN5gWfSA0LvPJi3xr0S7n37Y0/bxg+Yb6fA5kP6AUeh/zxKiEvNTZha/fEa9J8BV0RK5
	 g8+zPDbciT6vm7SAS/zZ0uE5PqfU+CZIf9AL4q9hC9AHyWqVjpdZ14SjvXaDY6f916bJD
	 LIjkT8UHRiW2aOzS4IHJvxUmgFAK4FV8EbfqB64TAdksxeM54atrvl6CNDF+nAWVq8XBy
	 sWDAfwPlxojapE5T1bFLlt3y6QeSxa8xwDFiG771G8qh8i8FEABITcoOd0ys3KzCU0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tRiGUdZDbUH6e6UAZLEy4irsPtafHp9cuwISJdPL7/4=;
	b=tAdmIPO6rONlS5P6TFQRVbc+RJZyPRP3DIgnGZafUIX8j4iNgG6/nxKUR87lUz/Nq1kr
	 sIKzRc/Yy0WTvcuQz111/xdeCpn580u7QPkqF32ah0fgljqOzQ1EebkHJitmDvbmDEVTR
	 9syNrxpIX69/Hzfmc2ChwmVoV57PpKoN7IvFxu+4SbvXQQ8Ronrf37gb/clcqKkarnVs0
	 3bEhyiEAcrcCuLZ8yDjatlROmW5oHSA9y5C+XMpWJp/Qf8L3wxKm6oVd+FOTH08OF7qX+
	 DaeYV2cqSohGrn7Da279UEGWXX0sVnD2MesEW5/9sMORkCYboVaUNKa4OOSPdTdARDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzCsqm0O;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15E160A6F78
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15E160A6F78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzCsqm0O
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2810895c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380205; x=1794985005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRiGUdZDbUH6e6UAZLEy4irsPtafHp9cuwISJdPL7/4=;
        b=qzCsqm0Ov4zq78nTlrvSlkNvKa1AjVMSX2+8EyVkC9mifpb7lSSzD3zuTciPyYlYQT
         Up2WEpjuwqCeFQ2dGCRM1bD9/f+vyN50TbAebx6MZOgoxMR0EZNy33Xqz8tSow3BLza0
         NLgsIcPrviyQTei0d0br81aMWiM9i15C2LAaSXj2cnBksbeualEO4CHE+k8eEr/rsDpt
         8LqO7tSwGeTtIz1Ele+GAxDTmKwjs956NgzZCXBQFuKieKiWjowMJyE4Ds7zFLhUnjhf
         8RMhhfAyXNVeoSq+Jt1xWNeT/Hoa5qAQMyMDsEjRkLhjZG3eG0dlvJs6QIzwqPZSUWcg
         LbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380205; x=1794985005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRiGUdZDbUH6e6UAZLEy4irsPtafHp9cuwISJdPL7/4=;
        b=ucGiMYTdsR5muEZJMPBcBvUW8N0zfaMXK/iWnATDkfFd6eMzcEk0PxHL8Pz9c33bJF
         SWFUu6seesAkhdyaYGPiriKYs1gQCbl2TLuDRMl3gFAsQZEJK1c7iJ8HXmPRuZ6JTJWM
         0pMYhmJWrYsbNYUPtYLk6mfwdjwdvXXqlzs9psduTkqMuFrC96LfDoJqwKe/qr6a77WM
         3JtUhQnJK6qQ5GxjpP+jf/lIW5T652y0tWWRCNwrAc66M53I6axkgHMAj4DhwGxL7TBw
         uwrMlUgSf9zoqIiQiHInYRYwruphKZ6bk33iZ9/ZXpxm1wz0G7HdofAKtbdDrNN2G+Gr
         xSBg==
X-Forwarded-Encrypted: i=1; AL+hErGlWkcnBUH5YtDSHWQZGsy2c45WdvhPrUsvLsVz7KImL+cnjF3jBLPJqSShY+bR4P5VPrmuaX0TUr7eLDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tm4arsK088/YHw7HWzo2CDedw3gu6dri+MJiE1hM7ObSiISMv
	pClR/HhyIf/uJ9EoaUGCN+LD3lnd7YH4wdd6bbU+wiFgaLxNMNctxfBX
X-Gm-Gg: AYBFou3TLxPQz/cyIhmrtlFYCLbu7BTy7T4Yr9yR1Xy+IDp03piVFi8X8YSTHAiqCIJ
	YogJMW0ldGV792U33TxwRUtVMx0A0X8C0aALRfkP935mcAPeCZumlS9P5gTdKVc86eA69J7EjfB
	0JGsPZo2/G0I3/OvxLAPQwTCiLmtg3emhxON26RQK00wKV5R2uK98kvRCWMuUVtGi6GCHdFHhQt
	oGe0tT7ySM7akGG81bEZRDASMFdHYIJQPP0abyFOQrVMux7pR0+iMNb9TFLihfORjJWpm/vdhSB
	cAinazmXqzdhzu6F2nIMH/0Q/YqR4YK5PqJYiRdxMO8EtkgHqFC9WZ6gSdifH6D7Nd78BW46zxM
	QsOwy9Fi/IZniSy6YBWnGcYrpbApGemZua70zfvdjVvz0VEHMmQP93cxY1axgTvij3kc/S43uMo
	z3wRV34Q+3nsqeCsXFpiYt5OmmgJ2IiKyCBOaWNTAuz+D66cqG1DprQ3PWpJfro/F1+D+Jlqqpx
	s0qKoofpNajU+qiM6SS/JDTA1nAn99L8/Br/Qllog0Uw+kzOGNjVn8m+6T1XxsBHf5HgYdCZ+7q
	283xPYW9JHuW+V/tNP+tCmXac+Oovjgp4kYkc16+W9kJ9yh2yGgMIPMxMRHm2mIBVrSAVWJTAu0
	AJcINKsrUtBIzQ4YJWA==
X-Received: by 2002:a05:7023:a47:10b0:1b3:b67e:9fcf with SMTP id a92af1059eb24-1b3c03108bcmr1532997c88.17.1794380204475;
        Tue, 10 Nov 2026 22:56:44 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:43 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:12 -0800
Subject: [PATCH v2 14/33] HID: logitech-hidpp: expose charge_type property
 for battery voltage feature
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
Message-Id: <20261110-hid-logitech-hidpp-v2-14-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Commit be281368f297 ("hid-logitech-hidpp: read battery voltage from newer
devices") added support for the 0x1001 battery voltage feature, populated
battery->charge_type, and handled POWER_SUPPLY_PROP_CHARGE_TYPE in
hidpp_battery_get_property(). However, it did not add a placeholder slot
in hidpp_battery_props[] or register POWER_SUPPLY_PROP_CHARGE_TYPE in
hidpp_initialize_battery() when HIDPP_CAPABILITY_BATTERY_VOLTAGE is set.
Consequently, the charge_type attribute was never exposed via sysfs.
Furthermore, hidpp20_battery_voltage_event() only checked whether voltage
or status changed before updating cached battery values and notifying
user space, ignoring changes in level and charge_type.

Add a placeholder slot to hidpp_battery_props[], update the fixed
property count in hidpp_initialize_battery(), append
POWER_SUPPLY_PROP_CHARGE_TYPE when HIDPP_CAPABILITY_BATTERY_VOLTAGE is
set, and include level and charge_type in the change detection condition
in hidpp20_battery_voltage_event().

Fixes: be281368f297 ("hid-logitech-hidpp: read battery voltage from newer devices")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index cdeb1b3c2f21..fb9ad4cfc583 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1553,7 +1553,10 @@ static int hidpp20_battery_voltage_event(struct hidpp_device *hidpp,
 
 	hidpp->battery.online = status != POWER_SUPPLY_STATUS_NOT_CHARGING;
 
-	if (voltage != hidpp->battery.voltage || status != hidpp->battery.status) {
+	if (voltage != hidpp->battery.voltage ||
+	    status != hidpp->battery.status ||
+	    level != hidpp->battery.level ||
+	    charge_type != hidpp->battery.charge_type) {
 		hidpp->battery.voltage = voltage;
 		hidpp->battery.capacity = hidpp20_map_battery_capacity(hidpp->hid_dev,
 								       voltage);
@@ -1795,6 +1798,7 @@ static enum power_supply_property hidpp_battery_props[] = {
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY, */
 	0, /* placeholder for POWER_SUPPLY_PROP_CAPACITY_LEVEL, */
 	0, /* placeholder for POWER_SUPPLY_PROP_VOLTAGE_NOW, */
+	0, /* placeholder for POWER_SUPPLY_PROP_CHARGE_TYPE, */
 };
 
 static int hidpp_battery_get_property(struct power_supply *psy,
@@ -4398,7 +4402,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	if (!battery_props)
 		return -ENOMEM;
 
-	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 3;
+	num_battery_props = ARRAY_SIZE(hidpp_battery_props) - 4;
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_MILEAGE ||
 	    hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE ||
@@ -4416,6 +4420,10 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 		battery_props[num_battery_props++] =
 			POWER_SUPPLY_PROP_VOLTAGE_NOW;
 
+	if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+		battery_props[num_battery_props++] =
+				POWER_SUPPLY_PROP_CHARGE_TYPE;
+
 	battery = &hidpp->battery;
 
 	n = atomic_inc_return(&battery_no) - 1;

-- 
2.56.0.542.g3ef89b7020-goog

