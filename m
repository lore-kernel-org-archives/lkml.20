Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549919;
	b=ne4sjpkqV+StU87uLg+CshErcxq531vfsRGkS5MJsI5le1ayldGack2rpmFQ35UiFXJg
	 mGr7EfQUvsPV3iqK7PmNstyE653wtoXe9MSI2jmsRbloxW9jXydG1+yIZEL5PwL5uahZ+
	 uZbn9vVD01wmQUWPEplx6YOLVzkiycOuh3PKFZI5RRgIWMOiBqGRoNGfR3Za+NTr//1I+
	 yAGW/wyS5Vg9MDCCIBGmIVzUsRnm3dZIVluNhCvEWiwZ7/Gk6z+mqJ81LhL2JYCBO8n57
	 3cw8VwaYh8N/YMit1/8MMu5Z/4X4iVEO9MQJrqiVgRyI0VbsWpiJ0OeGhbuc1AxFk2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KD97VjyXdQClOVo1RSdQ9q1bT41yOQD/nN6rmJRrC9s=;
	b=gbucdwnXUs1vjCq0UmqtDF33eUGag7JMfx4GUfKUqxFGsf3eDi8fC3ahid66k953pRa2
	 HBZmkEgixOWLfi3bzSkykiRkrIiJVORkcBhEuFprDp7+d+MdOCxm8u3PbaMwICUZnsNcu
	 x0jNbhAKcLvc61oVWzRCEQ+5F6pRgfWWdtUFD9pUsZQegX6lIMdtagPAcrHM9DMV6aH/B
	 pP1zNLRZjCH3u4HfP+MvvMdxIZXJLbI7cmPGe4+9PmZxgs3+CjCDDdoRw0SK+v622Q3H7
	 6DDKagqixFjWi0cZo4Ad3AH6s6Na7KUnt8xP8jgbWTNGitIfnd2+ojEddG7UL7tBBGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=J0VtC2JS;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BAA606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14BAA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=J0VtC2JS
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso2472976a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549917; x=1794154717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KD97VjyXdQClOVo1RSdQ9q1bT41yOQD/nN6rmJRrC9s=;
        b=J0VtC2JSILMBXs6fmWROB0jUpEzC71nU1KVw1y/1qF1LVDBcgCnrMVBrW+BouYpAq0
         rhVlBbiSVie+KkvABkZ7QNSs9vzOtGnPcKgb9uWNpVDjjvdw3W5bZPOBpuP4ZBdLJLiz
         qIPLK3JEkltOwbv39LNqL+OeUV7Mkd1w8ObHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549917; x=1794154717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KD97VjyXdQClOVo1RSdQ9q1bT41yOQD/nN6rmJRrC9s=;
        b=pI2lWgjDfw+PhrQJpX/Pn+Q5Hs1wMTtZRa9uUplmpW0oepQAJRyWSxAff7mK2Cx7zK
         +qG5huVMwblnNUCqwVLGvPH1WfQ2Tsqx7+SMFv5B4NIvlsiWIG6eBn9sGqlObKJzbpcM
         o5H+L9vneV5sjFohovBdwH6RolIPkRNv1KiHRn3jCHJ/bzmZs8lNMjrBKIJG9wsr6nqR
         n+FRHD89W4ZtEf16oAifPCkldBADe2Z3/HPbH6gl2sokAHXw2OlwZ5vjgPlMxs+FtRuL
         bspAqzYdL2Z5re+gih+J5t9pGET5/fEse4eL59tjJAWbNmsUW1IuPP1ahfSVQ30nprHA
         8RBw==
X-Forwarded-Encrypted: i=1; AKwUvBytFmxu75MIIBHbYhIw59qJBtuyLGqO0LvnGK5p1jZ1p+PYfOcINg5uutQwcwhXNxKUVwdto037f6m9LO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/LwbkBub03NBJdPg7SzR0pvtX553T1X2cSoAMvvIL84dvDNgJ
	r5EMqBmdOt4mNakK4KqyR5ZFbXsL7OPzKWoya46ZuGo3y/lBxfV9xNcNEMV+83dWc/M=
X-Gm-Gg: AYBFou3UBOivbHNFmShVJ/ygfjXHrjixiQp8Aqmj20kVaw5YMoLZxm3Cxss1TBNnX/8
	TTVaqkNeO1AA1WWVp0laT34ge5/hGidEc1WoBYzO3V2c6jBbZFd8OkMo9BDpItpzpy+0sYvUz0l
	CqdGw76SALVGNITNhKVt9MtMCgo3DDv7zuzV+rMWPgUW1l1Qy42V5/QItCXm0DOSQuzX2DPu3Hw
	slhLu0jHyxCVXrkpf5YQ0MC3JhG6+wsWPlh9rUlPRJpPTc4A6jlmnqDHSg0qo5quHN1eWOz8mnE
	BGoAaq/b7QQbvrrqPOEViii90Bq9n1l7x3CcER5zFsrgymTeemUI/3bVOY1GPVdW2N+M23j8Uf9
	umeBa0q034Ltjh3fta9nGt/zP5vrd0LqTedn4pRPtVXiFdR3pYm1WeQkg3QY7NXDEPBUTLbfa+C
	iGl+rIr3QfIqqYhjD3gIH8RcuNGBJSo9SFJrNErGm4nsItmAOEJ441OlufedmPgRuRgomOO6zS6
	GNXb+V1Wp8xGmPVNzovzo+WevZPgaCiefipGqXxfy6tHJAqkihvseiJg6FksMQ99spWGGMmp5fx
	zV8tmGxWLhPiwaZgTLLOsCOipszxZkI1tfX/cHOS6DpLOOOYb/VpwRJqM1HGuWgGCkSzz95lWl1
	/nBBn/J/PlikNzDm3QOFWYONR3YMc
X-Received: by 2002:a05:6402:c514:10b0:6b3:c74e:b287 with SMTP id 4fb4d7f45d1cf-6b4d4c70be6mr3682070a12.22.1793549917477;
        Sun, 01 Nov 2026 08:18:37 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:37 -0800 (PST)
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
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v3 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
Date: Sun,  1 Nov 2026 17:18:14 +0100
Message-ID: <20261101161814.1325847-5-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101161814.1325847-1-chris@miget.com>
References: <20261101161814.1325847-1-chris@miget.com>
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
    Sent on its own earlier today [1]. It is now part of the series since
    it changes the TM2424 quirks entry from patch 1. Retested with v3: three
    Fn+K presses from balanced step performance (0x04) -> low-power (0x02)
    -> balanced (0x09).
    
    [1] https://lore.kernel.org/all/20261101144100.1043263-1-chris@miget.com/

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

