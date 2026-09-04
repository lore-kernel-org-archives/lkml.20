Received: from e3i605.smtp2go.com (e3i605.smtp2go.com [158.120.86.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E43340B11F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.86.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788497237; cv=none; b=OA0RUNV+lmTtlkbLsKZ1QX87LGDx3W8nNpTi/lAo8oDcYQOBi9iQgNU14vMeegDildNjlSyW25evk9t6OStYmQcjrNGEq4QMb+oT6sLfLyzpukk/GUQ7SjWACUowjUrD9/OHEu5ONMqUXHozwWbxf30Ca21Y8wqHwvILo7NZyv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788497237; c=relaxed/simple;
	bh=9E68qfCxaPzmD3m+GTXzaxJVndMAABhJd88SvAymKvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFfqlmyvy+Zl7SBudqQh0kzqYEHAQEYrgpKJV4LjwUHppmVkK2azaIxm4UHLw/UpIvWOTdsUzPUUh4TQfBGXevjb5lW3nBtZaG7qrO+GfnHMLVrEmWAJFXF398i65xh/f8zoi4tETl61waumNB5+ci701w6pShhFk8CQk8VYCHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ait.place; spf=pass smtp.mailfrom=em943033.ait.place; dkim=pass (2048-bit key) header.d=ait.place header.i=@ait.place header.b=bpGDptHv; arc=none smtp.client-ip=158.120.86.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ait.place
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em943033.ait.place
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ait.place header.i=@ait.place header.b="bpGDptHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ait.place;
 i=@ait.place; q=dns/txt; s=s943033; t=1788497231; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=621XTYcsZ6zvvOUg6Eb3VR5r2xUBCu+A38ELVbjgWac=;
 b=bpGDptHv89T7VhMlOy+YawNQssOj7B8QDzPg2KYhCsyQ5QffK2VUV2RP4hh3LLA+vtmrX
 PKj1wIYNCUCZG/u/B3g/ddt9t/UZfpLr0RnDDUDkA8A2kiZHTnw/YMnokRdkV4qDx7DzhK4
 WBNIdrZtUUC0PWQr2Enlc/YTrUKyyN2vPwpdrGXUVWCqFUzFpYZGq5cHWbdyQTNh/xC2doS
 eWsDCmYzZPOLpTYM/z4Abdi6Lyuj5k5Vo1BBMU9+7ClCBLLPQHK+XTI7yfmKixmfoA2FrMU
 NItRfUI7vpWjdkNJOjdgNPQZpiWeXGFbiGEvHI1fuYbGJ0QEvz7BpCMKJ5mw==
Received: from [10.191.245.51] (helo=omarchy.bb.online.no)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.4)
	(envelope-from <jonathanjansen@ait.place>)
	id 1x2LpT-4o5NDgrjDEn-oUeG;
	Fri, 04 Sep 2026 04:47:07 +0000
From: Jonathan Jansen <jonathanjansen@ait.place>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-api@vger.kernel.org,
	jonathanjansen@ait.place
Subject: [PATCH v2] HID: input: map System Microphone Mute LED
Date: Fri,  4 Sep 2026 06:47:05 +0200
Message-ID: <20260904044705.1060507-1-jonathanjansen@ait.place>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904022903.607880-1-ait@ait.place>
References: <20260904022903.607880-1-ait@ait.place>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 943033m:943033ayMjrpg:943033soucOInEYf
X-smtpcorp-track: WIJsAmxVTzu8.OCUvS9wtYeXj.BoSJxwFW3zB

HUTRR110 defines LED page usage 0x57 as System Microphone Mute.

The usage is currently ignored, so the indicator stays dark and
userspace falls back to per-vendor code in hid-lenovo,
hid-playstation, hid-plantronics.

Map it to a new LED_MICMUTE. It appears as
/sys/class/leds/inputN::micmute and uses the "audio-micmute"
trigger from snd-ctl-led, so the LED follows the system-wide
mic mute state the same way LED_MUTE (page 0x09) already does
for speaker mute.

LED_MICMUTE takes the next free code (0x0b).

Link: https://www.usb.org/sites/default/files/hutrr110-systemmicrophonemute.pdf

Signed-off-by: Jonathan Jansen <jonathanjansen@ait.place>
---

Notes:
    Changes since v1: rewrote the commit message; no functional changes.

 drivers/hid/hid-debug.c                | 2 +-
 drivers/hid/hid-input.c                | 1 +
 drivers/input/input-leds.c             | 1 +
 include/uapi/linux/input-event-codes.h | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index f44e6e708..92a950105 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3550,7 +3550,7 @@ static const char *leds[LED_MAX + 1] = {
 	[LED_KANA] = "Kana",		[LED_SLEEP] = "Sleep",
 	[LED_SUSPEND] = "Suspend",	[LED_MUTE] = "Mute",
 	[LED_MISC] = "Misc",		[LED_MAIL] = "Mail",
-	[LED_CHARGING] = "Charging",
+	[LED_CHARGING] = "Charging",	[LED_MICMUTE] = "Mic Mute",
 };
 
 static const char *repeats[REP_MAX + 1] = {
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index edd6bbf83..727374dd5 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -990,6 +990,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case 0x27:  map_led (LED_SLEEP);    break;    /*   "Stand-By"                 */
 		case 0x4c:  map_led (LED_SUSPEND);  break;    /*   "System Suspend"           */
 		case 0x09:  map_led (LED_MUTE);     break;    /*   "Mute"                     */
+		case 0x57:  map_led (LED_MICMUTE);  break;    /*   "System Microphone Mute"   */
 		case 0x4b:  map_led (LED_MISC);     break;    /*   "Generic Indicator"        */
 		case 0x19:  map_led (LED_MAIL);     break;    /*   "Message Waiting"          */
 		case 0x4d:  map_led (LED_CHARGING); break;    /*   "External Power Connected" */
diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
index b08d1d08d..6522079a4 100644
--- a/drivers/input/input-leds.c
+++ b/drivers/input/input-leds.c
@@ -36,6 +36,7 @@ static const struct {
 	[LED_SLEEP]	= { "sleep" } ,
 	[LED_SUSPEND]	= { "suspend" },
 	[LED_MUTE]	= { "mute", AUDIO_TRIGGER("audio-mute") },
+	[LED_MICMUTE]	= { "micmute", AUDIO_TRIGGER("audio-micmute") },
 	[LED_MISC]	= { "misc" },
 	[LED_MAIL]	= { "mail" },
 	[LED_CHARGING]	= { "charging" },
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 3528168f7..bc374821c 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -983,6 +983,7 @@
 #define LED_MISC		0x08
 #define LED_MAIL		0x09
 #define LED_CHARGING		0x0a
+#define LED_MICMUTE		0x0b
 #define LED_MAX			0x0f
 #define LED_CNT			(LED_MAX+1)
 
-- 
2.55.0

