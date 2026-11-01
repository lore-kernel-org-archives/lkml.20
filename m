Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544072;
	b=lFboCilLEtobgOI/vmSB5fm9S0gKubrImLldLszQhKwIi9ltOV9whtkXn4IBd5dl7UP1
	 k5h7gt3kW6abJRAUIUtj8GlvfNjO1QPv9XBsmGeqsyzDc9YEZyZj5+ra5Nb4+0pehKpUj
	 QovouBe6M3EvlVxW1+Q0cMsh5BuNxVvSKiDn3ITfqpIz9AK17pCA/KNXgSAl5hTxM2O9h
	 mgP1HP5VImTjsqPjod5yKZqsdcwhIlwWpTRpVaW0Sh2hZdIbgUNTumG7nxGcoZATXQFiE
	 9epy4cB5Q6OemqzOfGp31s62FA86c0k1i7hYqGlgWaD4HDO2KJJN0tDJWfIqWCQy5Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mnSYrptRMC/FkWaFEkTHqDgg2uSj3h2N3QT8hvMorB0=;
	b=pDVEAGRukfx+7A8EiELIB8cdmvgNuW2rXAloPoRv1iOTuMvYY/SXhZAf/ybzfAO5ORPJ
	 MKIBp5hJQyYWNwB6Z2KAoL2fvVCUSrKihwiuJTpuFcpoKyiH5CA22kynsrN58vrUm1dYe
	 ugp10R9B5wlriQCLZofF2esNsN6I/1WE2lejsoEXc5OaYGoozsAy3ZCGD8oDF5DH7e3lJ
	 eshkVOy40MLSkOFeDoj6cRIc3TbSSOnZ0xazixjBGyDejppae1aIOwOsuDntAb2OzR81R
	 KjJHO0aqKtkthIDNLs6EFV59e8M8HonHIxCvcIodS9EIDHvnxqjJWVuFvUZ6+Ht6QFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=VD6J8csp;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049BD606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 049BD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=VD6J8csp
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4c9abc1824so336212266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793544070; x=1794148870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnSYrptRMC/FkWaFEkTHqDgg2uSj3h2N3QT8hvMorB0=;
        b=VD6J8cspc0NNmny+qbMZvGLxpDGUmpsaX86nfBqAzTmDkZPhljuwy5Mu9euHWOzkPr
         LjbO3mZR7pLmL8IqVpG3y5V+ZXh4nCzB1zbjMmh91Gz6kBgQXjv9tHTWebklnnhML16Z
         lR6gYrvwakuhZUH/WSZisCwWfy+5tRas4dNWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544070; x=1794148870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnSYrptRMC/FkWaFEkTHqDgg2uSj3h2N3QT8hvMorB0=;
        b=swHRg2wz15lBhIGVsdnKRu5rZ/44oBls1m3yF3eya3RtqphmXAmmrM1T+JhbMT5iCF
         8eibeHjDN8137VWxhjEt2s4WOyrsO1kpyPVTFMZjUoOaOjUF0iwI6PfjCKcnqBWcZ5zv
         94n1qk8yyJyhlIhA8l5U8QVSNHp/NJsRrX/AAO/TRTJw75S8Sx1jPWLUp3NKxvXg3nDP
         gndqkUDzfcZAnM8UC7hEgaujcNhOedEZzKgywsoZt5QuEo7l0T+L1X/2ZMnT6XPZ5aHd
         nG/ScO4sqZVEDZ2wQfVz4p+hHYtlksrWG4tJGb91gpsI+OeiwGWowXvVfgqwhjVL31bL
         e03A==
X-Forwarded-Encrypted: i=1; AKwUvBwA0uIIkb1X0pqr+5QJ+SLh9utaHcjyMcsnwxu2MwK5mfobh7A5Dita1QKrHDqY4e/d3OsIHK/rPO8nbno=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAr1Mc0Es1TlYXOUvrRwMi1wU9U7lSveVqvQqCIdNLXCuBmQMB
	9MpTjGny54QA836bHGTb1wKs/aVdNavxj0vJ38ogtu8XNKylzQ/ApLvjOakX2OHFmDQ=
X-Gm-Gg: AYBFou1JamglQ/assmZv17e6kdHZoesvmx/noUngtKOQsDdwCXAx4QvKKHXgNhrPVBV
	ReadKV8tJDoUNmM9KiUgmnuXtPuegHEw8fK1HrQ34kOPEeklcLK+lwjEJXlAZEtdcPWBUrN2o+9
	gvbU4oRXvnjdTGDV0nSuo0KzK3YKbqt1y9FCOVVSRViE33FwwvbLzuyfFaj3QK/XEDHlIp9BsKW
	ouMG7oPv5obsQIu97JdiQWwuNXw+7wDTgH3utUxV3AdGzLVrHv7p/O7PDgVGQaSCS+upmlcUwib
	rKkHL6RhYpj3fanfwvQ/4nAB+hZbctRHY30KPqvuq7scw5jQwNb1s16mJRO9nx9Q++JFryzf0h/
	uNrN9IyEJ43fdYMCOE8pDTpE/hZknBx8y+yNeIq6dvBIemTZnCMzsgLHTPlyQZsDaxEDyAW616p
	7y8Mp1zEduGux0FIbe8bgGW4lfXw6NE2slmt0ohqFbBr0xLhxRhYdp6fBqsrtrAwJA1n/xd3VLI
	YI74G2u3JycGRyYBw+cjVKNz4WK1AxR5AVMXa9ALfR2/l+Vidk4d7tmGrsK5lB1R3G7It0OWzy9
	qu5jdRaiM7Y6iPKdRz9lMOWUtafcz3LC+89fH9NxbYUJKDZB7KeeHonY8OsT7ULvyzFUqXGH282
	4QlgD
X-Received: by 2002:a17:907:868a:b0:c40:231:6eab with SMTP id a640c23a62f3a-c4ca7a4e651mr602881766b.16.1793544070508;
        Sun, 01 Nov 2026 06:41:10 -0800 (PST)
Received: from xia (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabec09fcsm280158866b.71.2026.11.01.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:41:10 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
Date: Sun,  1 Nov 2026 15:41:00 +0100
Message-ID: <20261101144100.1043263-1-chris@miget.com>
X-Mailer: git-send-email 2.56.0
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
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A) on AC,
    with Mingyou's v15 and my two TM2424 patches, loaded on v7.3: four Fn+K
    presses step performance -> low-power -> balanced -> performance ->
    low-power. The bitland and SoC Power Slider handlers and SystemPerMode
    (EC 0x68) follow each press within a second, and power-profiles-daemon
    picks up the change.
    
    Depends on Mingyou Chen's v15 "Merge redmi-wmi into bitland-mifs-wmi" [1]
    and on my "platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support"
    v2 [2].
    
    [1] https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gmail.com/
    [2] https://lore.kernel.org/all/20261025195456.43414-1-chris@miget.com/

 drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a72569d810e3..8a994f5b089e 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -99,6 +99,9 @@ struct bitland_mifs_quirks {
 
 	bool return_code_at_end;
 	bool skip_ac_type_check;
+
+	/* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to the OS */
+	bool cycle_profile_on_key;
 };
 
 static const struct bitland_profile_entry default_profile_entries[] = {
@@ -125,6 +128,7 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
 	.profile_entries = tm2424_profile_entries,
 	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
 	.skip_ac_type_check = true,
+	.cycle_profile_on_key = true,
 };
 
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
@@ -168,6 +172,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
+	WMI_EVENT_PERFORMANCE_CYCLE	= 40,
 };
 
 enum bitland_mifs_event_type {
@@ -216,6 +221,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
 enum bitland_notifier_actions {
 	BITLAND_NOTIFY_KBD_BRIGHTNESS,
 	BITLAND_NOTIFY_PLATFORM_PROFILE,
+	BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
 	BITLAND_NOTIFY_HWMON,
 };
 
@@ -792,6 +798,10 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 	case BITLAND_NOTIFY_PLATFORM_PROFILE:
 		platform_profile_notify(data_ctx->pp_dev);
 		break;
+	case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
+		if (data_ctx->pp_dev)
+			platform_profile_cycle();
+		break;
 	case BITLAND_NOTIFY_HWMON:
 		fan_info = data;
 
@@ -921,6 +931,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 				    const struct wmi_buffer *buffer)
 {
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
 	const struct bitland_mifs_event *event = buffer->data;
 	struct bitland_fan_notify_data fan_data;
 	u8 brightness;
@@ -949,6 +960,15 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 254b8455d8a7f56b730e842207d91bd6904a50ce
prerequisite-patch-id: 9708c81da6b4ed6c2d47eb927efcd64ce4ed2ecf
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
prerequisite-patch-id: 36137eee73ea8cee3db81af887f1f0859ef02b3a
prerequisite-patch-id: f0ba644539dc52241b96a74d6e32a6f06241e577
-- 
2.56.0

