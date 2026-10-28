Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186894;
	b=tKMtRLmjcxLliGZgi3qtVJ10M3J3W9L9MAs2I+hFhIrjcCWPncKgjZibR/lCIowDsoKK
	 rMMmkw6knIq83GhzQwEzGvUa3KIjBcMNdHfWVoczEKDGr17WwtWXFbSRDJEtNLtI6TaOs
	 rQBDs5PEfEbZwW9dQ2K2HL3z34Uv8hTAZqgRiQhOuOUXIR3NKiITp7FzdJDb+GeFTQr1b
	 m5tgdOfSrM5gOTBT9uI/7gqU0EPixNe2D+h3C0INDj+rup+l/HhcRyAPaKtw1Kme0WpT7
	 CDrcTaG05ri1A2FihmKYc0S1kkuvuT2sdyBuMNUESFMdEKr24YwjC+iKeSR4HR4BAmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y81mQESgXPYR9nS4rHXdGj0DbylaewWcxtgvMLy1Njk=;
	b=3lg60iPY+P4OTontnw6GwPyK0a/YD2cwlojyrGlNyZzjyAciNLJ68oWMeWo/17XlXkOC
	 8jFIqB3LlpEoN2n7Tb0Seqx5xyeu+pSpmiKWCNNLGs71d1RMNmea8198Cj+nbcWPX9cV6
	 8T5TSj7Rc1AEB3wCitLBsKgpvFjE2Ka0la6LKfKwAbP7VN1TJ+UFN6/uFJNhQp/kBclA7
	 Gue01AzrT8MoVFUeTdd5w7rRbZgdj51mZwObfCMAtyNVynY7Q1Eq3Oj7YRD5hx1f5T+Za
	 51j2zleJQksbpvozjFi9LmZXUCzbCrsn70+xGF4pcKJ5BjUhL7RK59xdOhbm7mNHyPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ADhlPShf;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C3360A2606
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C3360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ADhlPShf
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea7190aea1so3521165ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186893; x=1793791693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y81mQESgXPYR9nS4rHXdGj0DbylaewWcxtgvMLy1Njk=;
        b=ADhlPShfCPp4Df3UR+091lyrUhHIGE3gtoLm2cC8L5bbOV9kH/zdtgqnhLXLlYWvCu
         ASNyMJ369HEXaeOOHA7qV56QThjWKqIrTsIz9VFpWnMxOLNKCSbI5GFJnLwbqdH2QK90
         GxSLfK1Fd6v6pvMlXbzI6u5BgTFjJyhhAOz/Bj464OOPWsSK+0ZrRloflAM5IgPyoM74
         dqysQMUH/pGFdb8JajdIGiva992jvxhbZY3AHAUYRmxCLLjAGPCA0irzglRzqXTem77V
         rn+bp1OufihnidpbNegv1UxSxc9Q6sTPjhUPvVLf6jRdExHbZbOloLSYTMMNL6BY+9j/
         Hhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186893; x=1793791693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y81mQESgXPYR9nS4rHXdGj0DbylaewWcxtgvMLy1Njk=;
        b=WB/D6MRvJKVxIrlOn15C14gRySDp0Q3d8FPdnlpIEbhoHjgJIJ1jeIqOoMoA1DfytC
         Wl6xViqj5EWx9gSx4UQsw5ExyYxl0DqMNHysyXWxv7NWtT3H2Y4pAOB4H/HacxFUPY3h
         MkuHEbt+VfbvQpYKUYwX8MCe2wDYe9OqA3kL445FNvpsI/jZQ3FxSFP0pdxBJQcFkKlJ
         ouyiW09vRUz0Hw+oiYaEN+1SIdmGqOdyhECvNEjyZZcFToLDZfFOxyt09FMv0+Q5Ijw/
         iCEizXYcagQUHl0bqRtfY0Jr6mKZesbG/a/QVpoWgtUVdZlyGPOQKSPsSQ2+7IU9E8CM
         Ny5w==
X-Forwarded-Encrypted: i=1; AKwUvBzGfwOZo0VQoYOkDVQKrGcQKRc1gCzx0PwfPQ5Qxec4CD3WL81w3YhrRlF2e+pkkp6qvUd2sC+Rr4xgoag=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhz9qZmEqpQCcKUT5N4VEG237PExJSIidc5Uq0XhgF9JEDxIku
	EZrPmfo6Z3TO2viIu43MwnH2y299NaNExnFxU1Nm+SVanEDhM2EDf9wj
X-Gm-Gg: AYBFou33hLKNpVbQWJNjtodT2w7qf3LE6hbAyhlgkTf8RAj2DOzp6IGagGTASpOeLxS
	cdLFMthdkcNng0eO/Sj8EKryy2TH0cDcaAHs7N2Zpp+mmfyurtmfYPGDuB2zXsVj/GrDeOYScAT
	DoPKmu9z+HX2ZZ6kMvUKGDcmHrBz4lDerifkeedBVYrwzrUm4G91xtS2pzBCXUY2FwgOW6Ri6yJ
	uqmHvm6qdoYnEXXlrJ+8+CToblJNr14LF647cC8WCiyQ2zxDp0eAp8jvnc8jErwvba9SAWw8kOX
	fTh+O9dkVcspzNXawe5bLQqDVEDfrkpuu8hchD8jvFVFwf2WToVUHtdBgyA08rcOr5YFFdnfWuD
	Hh/dVXFSO5jXiIvk6EQNxNNI2INLWfPXMQQtQYifBFDTzrQGvIRA5nCNKXlWQc1cTTXKwRFKJZT
	FgQDv4JXISgoW54lm1wIogO/JCQtJX8wqtDdxoiZRthXI5PofSbQNWG986iFUUp6HNb+6BbkqxT
	EsQoxH2dnnbj3HCSsIhhtQmGNBTuUaf5uniyDSFgtGxIni7rA4FgieG3RkVaRIuPqprUqwAUEkQ
	kHtSwKHvOTPAG1mST8eG7RtUT6EktwKc
X-Received: by 2002:a17:903:1aef:b0:2e2:df9c:ff71 with SMTP id d9443c01a7336-2eb0051e11amr17106455ad.49.1793186893288;
        Wed, 28 Oct 2026 04:28:13 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:28:12 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v15 2/6] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Wed, 28 Oct 2026 11:27:38 +0000
Message-ID: <20261028112742.674847-3-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
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

The bitland-mifs-wmi and legacy redmi-wmi drivers both attempt to bind
to the same WMI GUID (46C93E13-EE9B-4262-8488-563BCA757FEF). This
overlap causes a device registration conflict, preventing one of the
drivers from loading properly depending on the module initialization
order.

Merge the event handling logic from redmi-wmi into bitland-mifs-wmi. By
handling both device layouts within a single driver, we eliminate the
GUID ownership conflict.

Tested-by: Nika Krasnova <nika@nikableh.moe>
Tested-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Reviewed-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 153 ++++++++++++++++--------
 1 file changed, 106 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index dd1648b7de77..9afa2e2764b0 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -35,6 +35,11 @@
 #include <linux/units.h>
 #include <linux/wmi.h>
 
+#define BI_HOTKEY_CODE(id, low, high) \
+	(((u32)(high) << 24) | ((u32)(low) << 16) | ((u32)(id) << 8) | WMI_EVENT_TYPE_HOTKEY)
+
+#define AI_KEY_VALUE_MASK    BIT(8)
+
 #define DRV_NAME		"bitland-mifs-wmi"
 #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
 #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
@@ -80,9 +85,9 @@ enum bitland_mifs_power_profile {
 };
 
 enum bitland_mifs_event_id {
-	WMI_EVENT_RESERVED_1		= 1,
-	WMI_EVENT_RESERVED_2		= 2,
-	WMI_EVENT_RESERVED_3		= 3,
+	WMI_EVENT_SWITCHVIDEOMODE	= 1,
+	WMI_EVENT_SELECTIVE_SCREENSHOT	= 2,
+	WMI_EVENT_ALL_APPLICATIONS	= 3,
 	WMI_EVENT_AIRPLANE_MODE		= 4,
 	WMI_EVENT_KBD_BRIGHTNESS	= 5,
 	WMI_EVENT_TOUCHPAD_STATE	= 6,
@@ -100,10 +105,11 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_FN_1			= 19,
 	WMI_EVENT_FN_2			= 20,
 	WMI_EVENT_FN_3			= 21,
-	WMI_EVENT_FN_4			= 22,
+	WMI_EVENT_PERFORMANCE_PLAN_ALT	= 22,
 	WMI_EVENT_FN_5			= 24,
 	WMI_EVENT_REFRESH_RATE		= 25,
 	WMI_EVENT_CPU_FAN_SPEED		= 26,
+	WMI_EVENT_CONFIG		= 27,
 	WMI_EVENT_GPU_FAN_SPEED		= 32,
 	WMI_EVENT_WIN_KEY_LOCK		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
@@ -607,18 +613,54 @@ static const struct attribute *const laptop_attrs[] = {
 ATTRIBUTE_GROUPS(laptop);
 
 static const struct key_entry bitland_mifs_wmi_keymap[] = {
-	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
-	{ KE_KEY, WMI_EVENT_CALCULATOR_START, { KEY_CALC } },
-	{ KE_KEY, WMI_EVENT_BROWSER_START, { KEY_WWW } },
-	{ KE_IGNORE, WMI_EVENT_FN_J, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_F, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_0, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_1, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_2, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_3, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_4, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_5, { KEY_RESERVED } },
-	{ KE_END, 0 }
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0), { KEY_PROG1 } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CALCULATOR_START, 1, 0), { KEY_CALC } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_BROWSER_START, 1, 0), { KEY_WWW } },
+
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_J, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 0, 0), {} },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SELECTIVE_SCREENSHOT, 0, 0),
+		{ KEY_SELECTIVE_SCREENSHOT } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_ALL_APPLICATIONS, 0, 0), { KEY_ALL_APPLICATIONS } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CONFIG, 0, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CONFIG, 1, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 0, 0), { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
+
+	/* AI button has code for each position */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0), { KEY_ASSISTANT } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },
+
+	/* Xiaomi G Command Center */
+	{ KE_KEY, BI_HOTKEY_CODE(0x0a, 1, 0), { KEY_VENDOR } },
+
+	/* Fn Lock state */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), { KEY_FN_ESC } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), { KEY_FN_ESC } },
+
+	/* Fn+`/1/2/3/4 */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 1, 0), { KEY_F13 } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 1, 0), { KEY_F14 } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 1, 0), { KEY_F15 } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 1, 0), { KEY_F16 } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 1, 0), { KEY_F17 } },
+
+	{ KE_END }
 };
 
 static void bitland_notifier_unregister(void *data)
@@ -736,13 +778,42 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 				       &drv_data->notifier);
 }
 
+static bool bitland_is_ai_key_scancode(unsigned int code)
+{
+	return code == BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0) ||
+		code == BI_HOTKEY_CODE(0x19, 1, 0);
+}
+
+static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
+	struct key_entry *entry;
+	bool autorelease = true;
+	int value = 1;
+
+	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
+	if (!entry) {
+		dev_dbg(&wdev->dev, "Unknown WMI hotkey with payload 0x%08x\n", payload);
+		return;
+	}
+
+	/* AI key quirk */
+	if (bitland_is_ai_key_scancode(entry->code)) {
+		value = !(payload & AI_KEY_VALUE_MASK);
+		autorelease = false;
+	}
+
+	guard(mutex)(&data->lock);
+	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
+}
+
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 				    const struct wmi_buffer *buffer)
 {
-	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
 	const struct bitland_mifs_event *event = buffer->data;
 	struct bitland_fan_notify_data fan_data;
 	u8 brightness;
+	u32 payload;
 
 	/* Validate event type */
 	if (event->event_type != WMI_EVENT_TYPE_HOTKEY)
@@ -758,24 +829,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 		blocking_notifier_call_chain(&bitland_notifier_list,
 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
 					     &brightness);
-		break;
+		return;
 
 	case WMI_EVENT_PERFORMANCE_PLAN:
+	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
 		blocking_notifier_call_chain(&bitland_notifier_list,
 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
 					     NULL);
-		break;
-
-	case WMI_EVENT_OPEN_APP:
-	case WMI_EVENT_CALCULATOR_START:
-	case WMI_EVENT_BROWSER_START: {
-		guard(mutex)(&data->lock);
-		if (!sparse_keymap_report_event(data->input_dev,
-						event->event_id, 1, true))
-			dev_warn(&wdev->dev, "Unknown key pressed: 0x%02x\n",
-				 event->event_id);
-		break;
-	}
+		return;
 
 	/*
 	 * The device has 3 fans (CPU, GPU, SYS),
@@ -783,6 +844,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 	 */
 	case WMI_EVENT_CPU_FAN_SPEED:
 	case WMI_EVENT_GPU_FAN_SPEED:
+		/* Redmi refresh rate toggle quirk */
+		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
+		    event->value_low == 0 && event->value_high == 0) {
+			payload = BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
+			bitland_mifs_wmi_report_key(wdev, payload);
+			return;
+		}
+
 		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
 			fan_data.channel = 0;
 		else
@@ -793,27 +862,17 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 		blocking_notifier_call_chain(&bitland_notifier_list,
 					     BITLAND_NOTIFY_HWMON,
 					     &fan_data);
-		break;
-
-	case WMI_EVENT_AIRPLANE_MODE:
-	case WMI_EVENT_TOUCHPAD_STATE:
-	case WMI_EVENT_FNLOCK_STATE:
-	case WMI_EVENT_KBD_MODE:
-	case WMI_EVENT_CAPSLOCK_STATE:
-	case WMI_EVENT_NUMLOCK_STATE:
-	case WMI_EVENT_SCROLLLOCK_STATE:
-	case WMI_EVENT_REFRESH_RATE:
-	case WMI_EVENT_WIN_KEY_LOCK:
-		/* These events are informational or handled by firmware */
-		dev_dbg(&wdev->dev, "State change event: id=%d value=%d\n",
-			event->event_id, event->value_low);
-		break;
+		return;
 
 	default:
-		dev_dbg(&wdev->dev, "Unknown event: id=0x%02x value=0x%02x\n",
-			event->event_id, event->value_low);
+		dev_dbg(&wdev->dev,
+			"Unknown WMI event: id=0x%02x value_low=0x%02x value_high=0x%02x\n",
+			event->event_id, event->value_low, event->value_high);
 		break;
 	}
+
+	payload = get_unaligned_le32(buffer->data);
+	bitland_mifs_wmi_report_key(wdev, payload);
 }
 
 static const struct wmi_device_id bitland_mifs_wmi_id_table[] = {
-- 
2.56.0

