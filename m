Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678973;
	b=rJ+y/erL8rnoDLlvBcjMvWuyQ5+yV7cTAGKVbVWQUx51Peh27ghwrVYRc8gTmvbytrHs
	 ZacBBWR110vgAQZnzK/w+FbycPqsoiphJQNejwayBbp/yBS94RoEpPnqe/IhgcPNPsrYI
	 V2fCn7O91aVGJ3pym2Oij0xSPk1rm6bgLLuS1dfElimDp0ZrWMmpZ1XuDLhlz09utamMx
	 tjrS1xiyddQEC7IMGMCxz/SatUz4KCFM8VpZ2F6oeTFhRR6Y+BYbk3VxopJgqQuMHbydF
	 JUOWVyDBr7yZEzSYFvZ7GxmCfYLkiERFh3w8wtq4wBZsGBxMFpsHyyd+k89X4gS9Dsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
	b=WraJdXkmX5KhWRZrAHtn9Rn+1Y2se+0nLCYu7KC+d7Jk+IoKOHF/pg5x3bR5M1OxM7i8
	 THGeYbMetsG6PmifM0mzxNjBMeEpvgolsmYc0tqgOMy9Wlozqv8X29O2hrEj1c0YYxAWH
	 A5CErLYQ2gPv+kIc9lQZ3/qvmMxAPJw87CK05FpYFfqT6vOwadSc8XdZ26BPm2wjshty0
	 uvhzb5gd//5JKdTpv1dEd09jZBvkoZIGq9yMAXPQP1OWBi1IoAgRqDx4+hDg8h9KTIvOv
	 FdRbNvszHP5a/x8AVmB7rTrcgPGrTh7Koi+V5g6X8k3vuYjWFyswzSJ8+U1SpoOBraA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Apu20ChO;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7EE606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D7EE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Apu20ChO
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b1478f06e3so455993a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678972; x=1795283772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
        b=Apu20ChOFv2qZwX/V1h/s55KMW9ThG/rNwR6dD60Pv7Z/D8MksZ/3qEL8w18TIsw3u
         Nb9qmnoKkNNw4J/g4L3dxxJdmBCsdDllF9wAeV6Zdd+iDecquyZHCAs+todRo/V+2YDM
         /261WLUuhu8j07gRH555XiVmAbgyIXZc5aSfEuTpcnH8b/I23Lfa06YwzW0zi4bl3QRL
         OtmX+hWcZiC6FvJdbterzs3vmLHDCE80dLRaPTNMmaQ741wRTn850pzRhGHGGPPNCJkF
         HZykVJAqMiBKfBc7oXupBP0ayU1zWSE22NuJ0U8eays8pc7aB6oWAYZt37UfVEzqxZLT
         WrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678972; x=1795283772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
        b=DQHpSbRkKfFkgQYx+S99IPULwohOB5cM54U2ZIbCaCEGEaHsuS2LaXTBrszQNrccQx
         Tp1kkCdGY7lrTPgmHr+/8yrnrBBuJmlusNde5l7QW7lyi/z0fGQGWajiuC4Y/YWvISwu
         NeI6sBz5HPzFUbwJlQ0ZH13jyo9pGeq8E2xVd6ZDdVsUgdwr/gkiDcazydNEaG+Dmrcp
         1fSuribuTkSUYHfeATxvFRVBDdM+GWgFZFZzUTamRYsUv/C7Kdu1/Iu5pB3XmTA9pOL1
         Qmw7Q/8WPSo4UvvjQ2QZZ4elrGPwwwJXCuhb3DgPVFrp6FtpwQADX+WkQqiN+oDpQBps
         gvtg==
X-Forwarded-Encrypted: i=1; AL+hErEU1U9Rk6WQK+KMWxXPyi7R5e9vNVU7Piaz6AOut1sKZjojNBZHFtt0eL0e/40er0MFFL0zMyILfryQ60s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MoK+RBIrUoYpDIXlRNvbJOO35sptV9US8Fv+ppK9qncmzcuqT
	+8TgwkD7BzPTSN2tTuidgfGW/qCbxXXrolHaFg3Z+5qROGx2jnKdHSc5
X-Gm-Gg: AYBFou0ZLZOnGXyUxaoi752fSWg8slPRCx9et8ZwSX7q5lpYjSnpggwnxmEBP8Wvou9
	0LQKu+al+Yn0L1mWqnVeM6zwrTOASZNc+WCsqGLNbe8HFR8OMpq7Lm0XE7nzU5MEVVoy8gt/Ns4
	WUoPTAfkQqeXUhJy6gqSWCu4Iu2VNIfAPX75V9RVwQ3OnmoQMCci+ZU+pbqXS+ff2uHlHzbcEYf
	CUzDgm7jUex1GIV8Muc9HIGBjI2vQ86wB2I4JTRwGna/UHG5F0rUrCQISvQ1tBS+f6OlSQGjwuF
	/40CvZVht/+dQWptNKk+v6jc/vmTKCaSFXMMWN5ZPQbzRBVYgBUj2wuzpuvvbbMJ7a26Z1NRobw
	V3vtF5UAiNrGfkkJY3q3EL21fGujnd4gPHJ9qQ+GZC0jNoCo9XcEtA33koK7jZJ/h6qyCd2KMwi
	sy/S9IzatcgXh2SZHM0LJPjFDG2lCM0bmM3fi6vQaU5F/dDsqcLvgDxzLDIdIOBx85DCGX2ksuy
	cJKzsvZACGBl0bnTw+9UjSZs5yLoUEh8HRpGnlmvul5xo89gF+udAaDL5QLeJVwAapNKKYKK3E6
	NhuUOlxILk47bIjQPXifH2c5wH38Iw==
X-Received: by 2002:a17:90b:54cb:b0:3b0:ce1c:e74f with SMTP id 98e67ed59e1d1-3b1b0a3a251mr5483199a91.27.1794678972435;
        Sat, 14 Nov 2026 09:56:12 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:12 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 2/7] platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helpers
Date: Sun, 15 Nov 2026 01:48:09 +0800
Message-ID: <20261114174814.62153-3-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
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

TP_HKEY_EV_KBD_LIGHT handling in tpacpi_driver_event() reads back the EC
level, updates the cached brightness and notifies the LED core inline.
Extract this block into separate kbdlight_notify_level() and
kbdlight_notify_change() helpers, in preparation for reusing the former
when writing a level through the proc interface in a subsequent change.

kbdlight_notify_level() expects the caller to hold kbdlight_mutex;
kbdlight_notify_change() queries the EC and notifies under the same
mutex, like the original inline code did.

No functional change intended.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 40 +++++++++++++--------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 2c3f8cf32..c8098f317 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5317,6 +5317,31 @@ static void kbdlight_resume(void)
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
+/*
+ * Caller must hold kbdlight_mutex.
+ */
+static void kbdlight_notify_level(int level)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+
+	/*
+	 * Check the brightness actually changed, setting the brightness
+	 * through kbdlight_set_level() also triggers this event.
+	 */
+	if (level == kbdlight_brightness)
+		return;
+
+	kbdlight_brightness = level;
+	led_classdev_notify_brightness_hw_changed(led_cdev, level);
+}
+
+static void kbdlight_notify_change(void)
+{
+	guard(mutex)(&kbdlight_mutex);
+
+	kbdlight_notify_level(kbdlight_sysfs_get(NULL));
+}
+
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
@@ -11586,20 +11611,7 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		return false;
 	case TP_HKEY_EV_KBD_LIGHT:
 		if (tp_features.kbdlight) {
-			enum led_brightness brightness;
-
-			guard(mutex)(&kbdlight_mutex);
-
-			/*
-			 * Check the brightness actually changed, setting the brightness
-			 * through kbdlight_set_level() also triggers this event.
-			 */
-			brightness = kbdlight_sysfs_get(NULL);
-			if (kbdlight_brightness != brightness) {
-				kbdlight_brightness = brightness;
-				led_classdev_notify_brightness_hw_changed(
-					&tpacpi_led_kbdlight.led_classdev, brightness);
-			}
+			kbdlight_notify_change();
 		}
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
-- 
2.56.1

