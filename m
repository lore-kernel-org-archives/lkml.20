Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0A49A3D0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790893436; cv=none; b=qSrgNOwoWsX94CRqNJMr2bip+cp8DTqzBc2g0eVqrOyN36flgN7J+7Qp2ASk9K5jtCXGRZx0T49hB7+Z5n1Nny0ZU3RTv5xzVUGlJTg8T/smeyIJdEse4W5RNyOS98+2IU+VJv9KNUrj/BBw4xXhcRVKvuc7ZF9IGVBuegtZyRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790893436; c=relaxed/simple;
	bh=JA7vkBppUwscfTRo/QQ62oNb3TUhQTenDc1L2khp4PY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOFWL67Ht4S2/h5bgZlW3Q6a1c7VgjJSTmFHTu7BV7pzfNmzxfbQF+vehC8KWWzSEhpV6R+jp/RyAt9CXbCkQ8mrNJGREWP2JrpA2v1sVF4HtA/1LdWhiTOrF5Oa3mn8jWpcwKCAcFRqKutQC4rNP775DapWBOgVlo0LpvxkvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyxTLsCD; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyxTLsCD"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so1946576a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790893432; x=1791498232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43gLglJ5iL7F+FcRPp3HfvnSSGf0/yIIWyejmxa6MyQ=;
        b=GyxTLsCDd6RhWwUIEOJIGtROZDrxDB/fkZAW1bxUu/BNHTMS/rCa3yTK5y7U/XxdZa
         wMbvmiPHGx3ylsm88YVpS1d5gjclfM3NrIMXW/N0URLIhHdBLsgTJfTdqAmatJNLYQHz
         wsIG0AgNGkVtvz8eWm55NA8NvPlFk8weiUCGxcXKBLfoH8gzoLDS2eHM4EsURhPJ+JNt
         syyyxj5RI/xJM/tgqdtC6DYxj+wJbEShmkl4nUzW+KXkUnEkFBmOVAViFlyezXZ/IOTr
         ABb9CEnfV2uHUzl3SftuRWoQuvLsoDjurB3QoZnIzwWzPY9Sohiltmkl2uAsgD/jf7U9
         0fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790893432; x=1791498232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43gLglJ5iL7F+FcRPp3HfvnSSGf0/yIIWyejmxa6MyQ=;
        b=dquajJbHWNG8WXrbuFBFuUBYdszaUkdCrlgioSqTW/00CjzZb/XaD1874p5MCdddZL
         4MQaRBC4MuWlHXbxP6uaaG1jWZU8zLUsZ/ZZrDupze+88UUN1uwPcpU26flVNHoUfQbS
         Z5vJ1LXpH4n0xlt239y0ETFcHvEgO6Rep2GV4yjDce0721/Ump4ut+ezanjwrNsvrYAF
         yMFDECtBLwB4oNtkzHVntJOOurBqVE6EvB+IBpJa4TouYafSOWX7PTQu+58WYBvf5y1y
         7Amxy0F1bL94TyHPX66qj0KQ8v9l4d2dIQT28nx/jH8aJ/drxkzJ/S/MfbOruAGCplZ/
         eVjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiO98K/3rBbBzmpOoMn/dTUlLdJe35g+4OjQIAOEST8IOlCnm07ZjRhcyA+orhCMX53JKNhh+DJ8xUGhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAUHm6oAvNfReWBiN1VO8EwVV1YA2/ljC4hQHwQDr9hPCcDzJK
	6tx/taeqxLXcvgiMJJ2oGcxBqgW7aV6bHOA32u3xhZee7b++vSHg39yI
X-Gm-Gg: AYBFou1RP5LXN+V+X6hsPnJn/BWFCZ9Aud80LVGVt5z46SAk+fxPyqJkhajPrhAvDev
	Y5z2C8f5eKsOnGQGZQkNcV3+YM9+h4VrfNFCcPaf9M8TZ7+TnCsU0rL9Ui3hsEL8Ts91WbFlzdA
	0GG4fVi/54ZegMtlCVlI68lWzyXAr8NsNlfRtePADYymdto1lO/Ho37tZeCSLPkZDJjPfMZexxs
	G0Fc+bLeo6deMBDP3WUKwq+e0QpyA71T7wznz1y0bUY1PsZsSZrEQrvooneudb/1c8Dh+vWiQ+8
	EzYi8n9ZlpAy+YK/DwX73QnIaOfNp3vA5XKb8lJh6SIjMkYsy9yTHfPvHnQn14xJkpM01qL+33B
	65AJSArK+cazBVTXb9MCleOaMuJ7CHi4f72i+yTFdkb6MUf78g7i52Dho1haIxGl+OMom1G2q7r
	B/bEuNt19E4RLWXSrSRBJDS2TmyYzaZwEPROTgljr1AiLpwqDuWhAZdmGc68OyddwgdfS5FEHuM
	cMqxaFl6RUREp8kjti0YAKVwKJHbyBp0dBk257IqXIijnOaGJeEnA==
X-Received: by 2002:a05:6402:13cd:b0:6ae:2e06:ab2b with SMTP id 4fb4d7f45d1cf-6af9e31de2bmr350850a12.40.1790893432378;
        Thu, 01 Oct 2026 15:23:52 -0700 (PDT)
Received: from [192.168.86.89] (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9d87399esm238935a12.9.2026.10.01.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 15:23:51 -0700 (PDT)
From: =?utf-8?q?Erik_H=C3=A5kansson?= <erikhakan@gmail.com>
Date: Fri, 02 Oct 2026 00:23:38 +0200
Subject: [PATCH RFC 4/4] HID: logitech-hidpp: support ratchet wheel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-bolt-input-rfc-v1-4-333e1f350586@gmail.com>
References: <20261002-bolt-input-rfc-v1-0-333e1f350586@gmail.com>
In-Reply-To: <20261002-bolt-input-rfc-v1-0-333e1f350586@gmail.com>
To: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Bastien Nocera <hadess@hadess.net>
Cc: Rafael Passos <rafael@rcpassos.me>, 
 =?utf-8?q?Gr=C3=A9goire_Stein?= <greyxor@protonmail.com>, 
 Alexey Zagorodnikov <xglooom@gmail.com>, 
 Oleksandr Natalenko <oleksandr@natalenko.name>, 
 Roman Stingler <roman.stingler@gmail.com>, 
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>, 
 =?utf-8?q?Kate=C5=99ina_Medv=C4=9Bdov=C3=A1?= <k8ie@mcld.eu>, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Erik_H=C3=A5kansson?= <erikhakan@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790893419; l=5655;
 i=erikhakan@gmail.com; s=20260922; h=from:subject:message-id;
 bh=JA7vkBppUwscfTRo/QQ62oNb3TUhQTenDc1L2khp4PY=;
 b=Vq1xavsggosWzXv0VfsE25iNuKC7l1Stvw+mEl+Iru6F65eu8r+nMJoklOKugVRhtyxE0CxJ7
 10ymF8zbQlfDXn7zyK2mTTB58662zD8fgR9XnlNbxM6b8d1+U9ausiZ
X-Developer-Key: i=erikhakan@gmail.com; a=ed25519;
 pk=brCZX79/H6Z7mPgiNX6TDY45ZjODPth0eXRDUgh1mNI=

Detect the 0x2130 Ratchet wheel feature and handle its HID++ scroll events.
Enable HID++ wheel diversion by default for Bolt-connected devices, but
leave other devices unchanged.

Signed-off-by: Erik Håkansson <erikhakan@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 101 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 9217ad4a97f4..6195080505cb 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -101,6 +101,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_CAPABILITY_HIDPP10_FAST_SCROLL	BIT(9)
 #define HIDPP_CAPABILITY_ADC_MEASUREMENT	BIT(10)
 #define HIDPP_CAPABILITY_HIDPP20_THUMBWHEEL	BIT(11)
+#define HIDPP_CAPABILITY_HIDPP20_RATCHET_WHEEL	BIT(12)
 
 #define lg_map_key_clear(c)  hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
 
@@ -225,6 +226,9 @@ struct hidpp_device {
 	u8 hires_wheel_feature_index;
 	bool hires_wheel_has_invert;
 	bool hires_wheel_invert;
+
+	u8 ratchet_wheel_feature_index;
+
 	u8 thumbwheel_feature_index;
 	bool thumbwheel_positive_right;
 
@@ -2131,6 +2135,27 @@ static int hidpp_hrw_set_wheel_mode(struct hidpp_device *hidpp, bool invert,
 					   params, sizeof(params), &response);
 }
 
+/* -------------------------------------------------------------------------- */
+/* 0x2130: Ratchet Wheel                                                      */
+/* -------------------------------------------------------------------------- */
+
+#define HIDPP_PAGE_RATCHET_WHEEL		0x2130
+#define CMD_RATCHET_WHEEL_SET_WHEEL_MODE	0x10
+#define EVENT_RATCHET_WHEEL_MOVEMENT		0x00
+#define RATCHET_WHEEL_MODE_USE_HIDPP		BIT(0)
+
+static int hidpp_ratchet_wheel_set_mode(struct hidpp_device *hidpp,
+					bool use_hidpp)
+{
+	struct hidpp_report response;
+	u8 mode = use_hidpp ? RATCHET_WHEEL_MODE_USE_HIDPP : 0;
+
+	return hidpp_send_fap_command_sync(hidpp,
+					   hidpp->ratchet_wheel_feature_index,
+					   CMD_RATCHET_WHEEL_SET_WHEEL_MODE,
+					   &mode, sizeof(mode), &response);
+}
+
 /* -------------------------------------------------------------------------- */
 /* 0x2150: Thumbwheel                                                         */
 /* -------------------------------------------------------------------------- */
@@ -4105,6 +4130,35 @@ static int hidpp_initialize_hires_scroll(struct hidpp_device *hidpp)
 	return 0;
 }
 
+static void ratchet_wheel_scroll_enable(struct hidpp_device *hidpp)
+{
+	int ret;
+
+	if (!hidpp_is_bolt_child(hidpp->hid_dev))
+		return;
+
+	ret = hidpp_ratchet_wheel_set_mode(hidpp, true);
+	if (ret)
+		hid_dbg(hidpp->hid_dev,
+			"Could not divert ratchet wheel reports: %d\n", ret);
+}
+
+static void hidpp_initialize_ratchet_wheel(struct hidpp_device *hidpp)
+{
+	int ret;
+
+	hidpp->capabilities &= ~HIDPP_CAPABILITY_HIDPP20_RATCHET_WHEEL;
+	hidpp->ratchet_wheel_feature_index = 0xff;
+	if (hidpp->protocol_major < 2)
+		return;
+
+	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_RATCHET_WHEEL,
+				     &hidpp->ratchet_wheel_feature_index);
+	if (ret)
+		return;
+	hidpp->capabilities |= HIDPP_CAPABILITY_HIDPP20_RATCHET_WHEEL;
+}
+
 static void thumbwheel_scroll_enable(struct hidpp_device *hidpp)
 {
 	bool divert;
@@ -4213,6 +4267,44 @@ static int hidpp20_hires_wheel_raw_event(struct hidpp_device *hidpp,
 	return 0;
 }
 
+static int hidpp20_ratchet_wheel_raw_event(struct hidpp_device *hidpp,
+					   u8 *data, int size)
+{
+	int delta_v, delta_h;
+
+	if (hidpp->ratchet_wheel_feature_index == 0xff)
+		return 0;
+
+	if (size < 6)
+		return 0;
+
+	if (data[0] != REPORT_ID_HIDPP_LONG ||
+	    data[2] != hidpp->ratchet_wheel_feature_index)
+		return 0;
+
+	if (data[3] != EVENT_RATCHET_WHEEL_MOVEMENT)
+		return 0;
+
+	if (!hidpp->input)
+		return 1;
+
+	delta_v = (s8)data[4];
+	delta_h = (s8)data[5];
+	if (delta_v) {
+		input_report_rel(hidpp->input, REL_WHEEL_HI_RES, delta_v * 120);
+		input_report_rel(hidpp->input, REL_WHEEL, delta_v);
+	}
+	if (delta_h) {
+		input_report_rel(hidpp->input, REL_HWHEEL_HI_RES,
+				 delta_h * 120);
+		input_report_rel(hidpp->input, REL_HWHEEL, delta_h);
+	}
+	if (delta_v || delta_h)
+		input_sync(hidpp->input);
+
+	return 1;
+}
+
 static int hidpp20_thumbwheel_raw_event(struct hidpp_device *hidpp,
 					       u8 *data, int size)
 {
@@ -4480,6 +4572,12 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 			return ret;
 	}
 
+	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_RATCHET_WHEEL) {
+		ret = hidpp20_ratchet_wheel_raw_event(hidpp, data, size);
+		if (ret != 0)
+			return ret;
+	}
+
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_THUMBWHEEL) {
 		ret = hidpp20_thumbwheel_raw_event(hidpp, data, size);
 		if (ret != 0)
@@ -4828,6 +4926,7 @@ static void hidpp_connect_event(struct work_struct *work)
 	hidpp_initialize_battery(hidpp);
 	if (!hid_is_usb(hidpp->hid_dev))
 		hidpp_initialize_hires_scroll(hidpp);
+	hidpp_initialize_ratchet_wheel(hidpp);
 	hidpp_initialize_thumbwheel_scroll(hidpp);
 
 	/* forward current battery state */
@@ -4852,6 +4951,8 @@ static void hidpp_connect_event(struct work_struct *work)
 
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HI_RES_SCROLL)
 		hi_res_scroll_enable(hidpp);
+	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_RATCHET_WHEEL)
+		ratchet_wheel_scroll_enable(hidpp);
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_THUMBWHEEL)
 		thumbwheel_scroll_enable(hidpp);
 

-- 
2.55.0

