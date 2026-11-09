Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204676;
	b=qClQgRsHqOVwg83rfB6p2tipjzscIWRKCK4KoB0a2El1ReWYPXHGRhtP0w5QLPctH8bb
	 3v2R3HFGSUicbLNKmGqRHe4SnG5GdApC4i5mNruSDou2K5GEv5qrzERBumfn+g0WlnVac
	 uP+cwNg8KE+Dal1hQn+5OhZpXDXshBo8vr+/bTf641LdJdBewpdmlQrSYIXDE5FkaneCX
	 zHO/tqYrw9cJBuMcXi3v/VsGgODKQz1Fqrz7ZcMqFIUviF5iSXzfYQdCaGrSJEXYti2Ql
	 J8AU3a7IU4YKMhwVSgD7csKt6JacG7F6txKhp0eUukVNbq35xsDwHvKrmoynuqYLCqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gRO41KkPTWNlu6Ttf4a7LMDPUy2i6YOIbXNUx5+ygKg=;
	b=2Fs3K+dcgnkAZS2FpAUrbmijoOTefd/RiRMmYPoCblNqCHM7SV1R0UDjMo5s4PqGNjv3
	 +F2upnMoAtuhRx7UZJMHMK4o0EyooWLv4FbtHRKOOthKGAYu4U2W/aY13rkGYxSjAXcTw
	 SeKqiHU6p6jcBUDugjk1/c32swS1aZaa36OT0+ZE2ZU+HsYUDzlBpAbsYAET94DGD5JXl
	 7kM/viGMRV28UoDKfeaAXq+t2k60GmdWwVy8oWtkclcygI52Q1nLZFoI7OR0JbPYHT+nL
	 M3iRq+qHrHX9CXlIey2IyWcuJTP3TBrSrb/ys8qg6qP1m0+FARPsCY0VXrKCMXr/pcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s78dRQHK;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C99606D813
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C99606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s78dRQHK
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso780826eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204675; x=1794809475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRO41KkPTWNlu6Ttf4a7LMDPUy2i6YOIbXNUx5+ygKg=;
        b=s78dRQHKrmGkbkFTEGhJa1F7eP8rMbI5fU+ouoXkgaEJKTNID9Ltx7lleGGcQfz1Hr
         lNEYRrkWukUStXb6nCVOzsk4Ug7wkf7D7nWxfCZTt6H+RR3RAbVfEm3lR4yvEQ/HHpcB
         TZH5vOqyvv2OQoC7NGEEhQ5F5U3dzslZCQMK+f90XhvbOxgPdKUV2fTSJ0k1DaraO1TA
         kzI3XJCj5C6Bu9CGpxX0DklMj/L4nMLkT6IOXjedx5Zk1DhW1qSUUnuDZybmXBsQmNCB
         r/vOQF1THKWLJsC2Et2H1fcP5JqHnGRF65dAbzYrOEdn6IlwyModH9Qx3LftIY4UxtwQ
         DOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204675; x=1794809475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRO41KkPTWNlu6Ttf4a7LMDPUy2i6YOIbXNUx5+ygKg=;
        b=qRF9WHn/8ZFi0obc4adn5mJU8MvIkL4eEX4Co0PdGGPevEHOj2syDrmDyeunXZV+5Y
         QBQ/rbLl6dltCtMgM3YY1A3y+uzYPdHv1EEdnjYSm/oK00G06hoPR0zO4TBh1jSyyJLx
         leCL5ch262IjzY+yf3bsdtUCLsX/4ut3/YG9UdEUxjm/UjlDS21UnKG4InqjFmBhYcDV
         IhCUJrth4n+N3jeO0UzKDpj+gO73kLTufSB5kjCH5hRjIlpnRdHwCu4zsbDEXGSSjeGi
         r0OQxL7S0ErJp3J3pyKIld9tdahnZHSOxBqvgXTQvN+SjJPk9UyouoLSlT1JMUaEZKEY
         qFnA==
X-Forwarded-Encrypted: i=1; AL+hErGq89aZCXrwO9gmnAjCnJs4Vux24XBwOvrq2m+6NkPd58agsz8HF4/k0Om9oEqBRgbAE4ENdECeqTMuuFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nkKXWCtXjurF5UzWW+J0Oe/tf7JCvdt7r95rCyhzRvWk2l2fC
	MZGm5Ok1Q4WNuvoHJI61L1qhB8/t40L76pCiJipr4n3NfGIntu53fbLe
X-Gm-Gg: AYBFou30FanoSdQEKm3CZN9gWARAOh0eqVl25K5UpZ02n8fkB7m4tA3N32HHXeHL4R5
	Fvw7SMwCBX1AXSPJ4aCMdelehe7LJCMnOKA4qIbesvTzk9+ZxblJRer7LoborbjNUdC+NTA1w2r
	qB1B4zJJg8Go5Q41KpgDwsmMyQhmEaAb8AHNPOv756x5eD7V3eGzOOlmvBFM6ZON6ei4oVVfIOt
	UP4MxDv2OvLCcohu775j8+mliNaPMYKWAxwbwPVl1iY61HC9SKBUmN5kK03ODAvqYtM22KK2ePQ
	DJflH0/8a3y8xgjV3po/JEM9n2ggXiU+QJWBaV0eV914N/mu5aBzEF0R/OtuMZpY49y6fmdH8Ib
	WeePmW68+Ks9pbf59foJaUtR6dzVnacxx4KQM8o9e/VonznzdXMVGLEGbI3bONIkmFQIcXE/hbq
	M8Am99n4b13QikMAd7/Al3xTnZcy6F00Hw+WRlvyMNTYF8DLKhL1zN4VTk54bty+rowz8iQSfJN
	mSPydl77iLJJpQe9eylT4HsUVx4R4VQT4E0lItuLm5OpzLGRblDim3JB0cnrBmungNuPySHCFya
	FpgNutHAwAqeU1fIgLHIXS63Chygj34kCr7LhUANFpRrpwbS53d7ifgE5LiAsCycmBDUd31cHpR
	+n5BT8aziSYbV9eON
X-Received: by 2002:a05:693c:42dc:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37255a514c7mr6461633eec.25.1794204675440;
        Sun, 08 Nov 2026 22:11:15 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:14 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 05/18] HID: logitech-hidpp: do not store ERR_PTR in battery->ps
Date: Sun,  8 Nov 2026 22:10:49 -0800
Message-ID: <20261109061103.2887636-6-dmitry.torokhov@gmail.com>
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

When power supply registration fails, storing the error pointer directly
in the battery supply field leaves it non-NULL. Callers such as the
connect handler and battery event handlers only check for non-NULL
before notifying the power supply core, causing an error-pointer
dereference oops and blocking retries on subsequent reconnect events.

Capture the registered power supply pointer in a local variable and
publish it to device state only after registration and sysfs linking
succeed.

Fixes: a52ec107fa81 ("HID: logitech-hidpp: create the battery for all types of HID++ devices")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 4e0758cdae64..9f3ae8724dd2 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4327,6 +4327,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	struct power_supply_desc *desc = &hidpp->battery.desc;
 	enum power_supply_property *battery_props;
 	struct hidpp_battery *battery;
+	struct power_supply *ps;
 	unsigned int num_battery_props;
 	unsigned long n;
 	int ret;
@@ -4407,15 +4408,16 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	desc->type = POWER_SUPPLY_TYPE_BATTERY;
 	desc->use_for_apm = 0;
 
-	battery->ps = devm_power_supply_register(&hidpp->hid_dev->dev,
-						 &battery->desc,
-						 &cfg);
-	if (IS_ERR(battery->ps))
-		return PTR_ERR(battery->ps);
+	ps = devm_power_supply_register(&hidpp->hid_dev->dev,
+					&battery->desc,
+					&cfg);
+	if (IS_ERR(ps))
+		return PTR_ERR(ps);
 
-	power_supply_powers(battery->ps, &hidpp->hid_dev->dev);
+	power_supply_powers(ps, &hidpp->hid_dev->dev);
+	battery->ps = ps;
 
-	return ret;
+	return 0;
 }
 
 /* Get name + serial for USB and Bluetooth HID++ devices */
-- 
2.56.0.506.g506a7eabc5-goog

