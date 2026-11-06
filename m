Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965394;
	b=JS33DfDwKVQkuAcHYfMDXyp7CenAY5R5scO58DsYXavfE+0afL64yWXIyP5g4zN8Mpif
	 x7Z6TCCmgXHrCfLlTNRuzVZ/p/M8pIRVzw3oDprx8YbLbtOY01j0J//ItVA/6wT5DApcM
	 us080iG9TeToqQO/XwHmECpI3zr7lBYR5FbCh37omezk0l5KPAvtahQOdrn7Yfur9iHxt
	 G3U+yksxssGNzv3DjZ6iCJIEitPz+VIXbtPZ90xGM878yVVw1a1CtdYEDHiLCZgOJWuYZ
	 O9mtCdDfG3QkRq9nr9SkDCTveoIJVK7r9BWc8ypq1RDt+vqBSNxzE1hcfbovkR33MUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VvltagtRFlSaR5juyoaIfz6fk6xoC7R6iygJelqiFGo=;
	b=bxEDaxgTFfIrABvnLcNpzkfUDHc5VgCWoz6hcIxcXzEP8qjQgx7stp1NqXcDIjELnk9e
	 HJZBYE7HLOYukbG5t7Cnyz8PgjzvvJ4pQzjwyw/d9Gnyb2lnPadffI7zLztyy2bayLg1B
	 r6wPenY8Qnetn7KJZod2JEAnPaUGOAcFuvMbsINIg6C8655xVHZz2dVmk9gi73qmm6MYO
	 JegXmdoLZiESUdaiooubbTXY5foR+MQyFg7gf0Y1iJL2HrpqI8UIFpppIhfJuU/TlLQDO
	 c8fmPunPFZvQ+KiKjVxp4f+adBMQh388uNeAXf9YL52hLGqSFd78dQxXWG7IKvNKKag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=D60vlBkY;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E08606EEB8
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E08606EEB8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=D60vlBkY
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so495558a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965392; x=1794570192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvltagtRFlSaR5juyoaIfz6fk6xoC7R6iygJelqiFGo=;
        b=D60vlBkYuKtEqin4bZZJ/HOxOok5oZjszT1y2CO6FHmh17Sun87rGX71po82rRLn+q
         lwj2La/3xfeoaLT+qk4l5qT6xZrwmbjGZccMDYwzdu/0xPiJWqIhlxWdE+8Y2NXbViRE
         o7vqDjtn44xmPj8WU/wUPOtrdU3DV1ii5wqF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965392; x=1794570192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvltagtRFlSaR5juyoaIfz6fk6xoC7R6iygJelqiFGo=;
        b=EiJ831JdmlE2b6Kl3BNtI+bq5t2ALOtHgmzn0XUKt27ir4d457d0UtQqgQHNyVZf+E
         90+PA16ko2sVlIcbyACAr1Cy4Y6nYSQXvB5+biZzBBo9RfFixTdaBUHwFJbWRMvTc+ca
         qnZ0jGEy55+MfgH8i/S1vlh6DMKjdieAW5moo9MEniepr7hYxvKaCCm4Io80qZygWCBt
         LPIzh7Q45LR4HaxNXYu2NjopiEeCNmKaDJhfi+woj8jLEzqdHVEWGCTMqtMq1cHn8PTa
         WCTLvhpFjBpe1MHdwiRE/m79/YsiMJJ0HPPx5xkYrWGg1TZC2rs7DBOCtiYbIbR4v8Gp
         mKQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd5QZCEQBmHBBTacFWWA29B7UVCWPq/J0YlYXQXFnicDpjsFirJeAmoKQif8gXKgnIwOuW8gH1G12+q20=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dzsETq3WR+1N/e2IgLR05QBBICRCq3OkNnbtYqw+3F5GBFf9H
	+OeDYlIGvxqJOXLLnSztuAeAhPkRb0osm0zO/n6bDEy/rPGwq+tcpPPF5tOWLnoMT9c=
X-Gm-Gg: AYBFou09Y13UKlT58Z31DINjrhPDnww5WF1QfeITo17aJDnj/xzhRf16Dj5t129Xtxr
	itm323CUNhfXUt8HcpRxSSXBQfZ87YpDs+QQsgiAiBlOlA6SuPP+z0B3LnUHcBC9hyYOswVI02k
	oEVltDPqjybnXNBswizbSzrlTpNGKrwh/SIzvZU950cUU06ixBLCd2e3Al/R+6nXcck+6AdRm4u
	fuarNfTDaJAuj1LV76Fb/lsFTqlQNiaJrbjT+b4uxlFTfFAE0floBoptZxAlydil2sOh+qnfqbd
	Vc5QmRaG3Ms4eM3Y1iJjAyu+Ae2MwJdfCfup0tf1te0t65doL5jT8XY1e9ahWfOocGwhn/Gmwag
	XcA/aPT+sK68hXqiwATEyCyVNpQa3N6Fq+tGvrV3hBySuTHZ15w7hHlDi+uUZ8MJ9DarlRmhoaP
	hbrkSeTOeEI927KGL2PI6xqYsKkXFj2GDgP1X3OdJDkkA65nfu+DLMdz5qqJzuMHbkF454a61Lx
	bkVAcljm4HPXvWpXFMDxk4bhh5SylL5FK/IyAgoi7/y2cjT4XLq9KD3vOPTBw5hSFr3LbJh1RSC
	NxduG8CZWe7QtcN6/STFFyYeRtdwvsAQ1EtilbqLd4f2J/E=
X-Received: by 2002:a17:907:2d88:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c4d34a71f0amr201745966b.17.1793965392124;
        Fri, 06 Nov 2026 03:43:12 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:11 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Arsenova <7z0423arsenova@proton.me>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v4 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
Date: Fri,  6 Nov 2026 12:43:00 +0100
Message-ID: <20261106114300.936782-5-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106114300.936782-1-chris@miget.com>
References: <20261106114300.936782-1-chris@miget.com>
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

On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
the firmware does not change SystemPerMode itself. The event is a
request that the vendor software acts on; without that software Fn+K
does nothing on Windows either, and on Linux it is currently logged as
an unknown event.

Add a quirk for this and call platform_profile_cycle() from the control
device when the event arrives, so Fn+K cycles through the profiles that
all platform profile handlers support. Models without the quirk keep
ignoring the event.

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Unchanged since v3.

 drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 4d02cd9e8a6b..84d1223d0ec6 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -100,6 +100,9 @@ struct bitland_mifs_quirks {
 
 	bool return_code_at_end;
 	bool skip_ac_type_check;
+
+	/* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to the OS */
+	bool cycle_profile_on_key;
 };
 
 static const struct bitland_profile_entry default_profile_entries[] = {
@@ -126,6 +129,7 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
 	.profile_entries = tm2424_profile_entries,
 	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
 	.skip_ac_type_check = true,
+	.cycle_profile_on_key = true,
 };
 
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
@@ -169,6 +173,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
+	WMI_EVENT_PERFORMANCE_CYCLE	= 40,
 };
 
 enum bitland_mifs_event_type {
@@ -217,6 +222,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
 enum bitland_notifier_actions {
 	BITLAND_NOTIFY_KBD_BRIGHTNESS,
 	BITLAND_NOTIFY_PLATFORM_PROFILE,
+	BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
 	BITLAND_NOTIFY_HWMON,
 };
 
@@ -869,6 +875,10 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 	case BITLAND_NOTIFY_PLATFORM_PROFILE:
 		platform_profile_notify(data_ctx->pp_dev);
 		break;
+	case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
+		if (data_ctx->pp_dev)
+			platform_profile_cycle();
+		break;
 	case BITLAND_NOTIFY_HWMON:
 		fan_info = data;
 
@@ -1015,6 +1025,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 				    const struct wmi_buffer *buffer)
 {
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
 	const struct bitland_mifs_event *event = buffer->data;
 	struct bitland_fan_notify_data fan_data;
 	u8 brightness;
@@ -1043,6 +1054,15 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 					     NULL);
 		return;
 
+	case WMI_EVENT_PERFORMANCE_CYCLE:
+		if (!data->quirks->cycle_profile_on_key)
+			break;
+
+		blocking_notifier_call_chain(&bitland_notifier_list,
+					     BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
+					     NULL);
+		return;
+
 	/*
 	 * The device has 3 fans (CPU, GPU, SYS),
 	 * but there are only the CPU and GPU fan has events
-- 
2.56.0

