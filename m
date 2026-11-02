Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632423;
	b=4zvR2Rcz1zSJSVYehzOhRjcizATTxFSlsnA77SyHfpOG5cV/hbirLkm6v77gpJQ4r0OD
	 3OdQY6EjdzJ1pOG8eaEXMnWfgo/9a9DDHYjxm5GNmaYJrdXzDvkJJrdYBMgSDrvwV4333
	 /w6enUpkvS87bLxENxYs5djHN51I0amrUJS1nJ57NQcieWWXPYXJircfRlcXFtp5qjhdk
	 C31tqvChabJkg9VgFyb66yu6IvcSHQHcLxTfsecJ2Ga0+cwvWITN4bGj6vUPuvsnN2RD3
	 y14uFxrNra8jQQKEv7tyKKPHLtP16MO4RCuPthY6l3TBK8MYjG00JuUvZOZHcdhD5sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
	b=SGZlxGkoG8pxKGIdctoygfRWjKGV/L/QfN4OKJKZO6nbTMXE1ct/ke+twPvnAB7ZivZg
	 Ndm7ZMVbZl2q5waXso6I15emRAX/e+64RWgc5ZFsm0tFvlMcI0GI7Y5tnJ3p6nnzfvlzf
	 qhbUUaCQ5F6OwNP1l/spN2hw5Y7yZ6v2RXsmGr+M+cEX8lTL6drNpqNo95TBg8PtewwD5
	 PfSib9+ekkQtO56PyCsmtZtXx4/IeIeK5+9BaV28sCcs1INUFMiwijHJxR8WnbeVuxUiy
	 APUtKHEuTw8qvB2++oq2PQoAwC2kpyXcNBdEuDmC3wHuz5LQLpZOYL80vTcb8hkWjPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HShl6aUg;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7958C6079907
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7958C6079907
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HShl6aUg
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb0c699769so10624355ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632422; x=1794237222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
        b=HShl6aUgVwrE59N6fYNuPaLhljDz5RBWdUG0z8ZGXIScUNFAPcqvIiSX+RDT5CkC6p
         xwbK7hFveHiKl5bchzg5pSDGwriUIdGlB6SGyilI9GriHdVIJJrE3CoClQ8T0OaNodp/
         LZ6RLj3Z5EJ61EFXgCwYmzUw60uR0kkePsX9zth7cqPQ4rYI8TD7hw5pJGw0m7EquCBX
         OQ9KVxH61w8rw+OUfpPPiS1KKnFzek5pHZuNHx/wC7TrMl7AKf+C0hWZgvNokJcz1zeN
         HG48roWZXt2TyscMS3NrLBruVnwhMQK0tESLiOFiF2YUMPwgAukoTDc3NWxt4ubcKBZg
         ZCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632422; x=1794237222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
        b=h+m9j+h4r8AbcXOzoVMPAet3IrBxr9dYx/zLWonWgkneVPul2k/TYXBnZMBGgcG+08
         H8vtEn4gSxj85R8Tci5BQMdPxfaF7hWgh28tnpro2bET/g+Xaz6r2au2Yh7e4zDnhy5N
         Gmd2MHl98hiQsmCglPfYJIDOF1nadXgFwCC931gWM9g04NtKtRdq5oT9QDfDWhkRycVu
         vABqVdNiE6ukhc4lGKRj90EzriF484FgpEUTe1IWOgPWuEqHfcDbcKTXpK9nLIGpHVM0
         adTQz5DZGT5cSLmKiT9EKEQdKZXS/6hbKC0upexmCEk1+yl919HjkJDWyHo61J91xlim
         esSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1okVX41suS+CYXaA5IrmZ+VW0OgAGPihNvObQxhm/gtOZF1Z/2GwPhSbMolh9NCwwpde0U/wdcdm0zMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D8DKhlvcJ1KRxpB2x6SeYcQm0J9sfQIKweGXoU3jyVBCX7GA3
	uh+y2ZnXGXk1+06ME9STVJc60L6v5Baq0Aei17Qz8BTrmrMtPTFfMltd
X-Gm-Gg: AYBFou3FuST+I1CydIJBAOifHIQFKgN/C6HjwYWIXsQAcHTP6ntYmvD8FsawcaID7vB
	hLLvD+NGrVYq0fj0i1S3l6de8PWs/jdGiKd9958J/z21Y/4XqEOCo9zkmOt12MGEKvsUgo+WtuX
	k1ssj/9v3prOXV7WT/VXYUMBQLx074q2I1KsvWveEkWjGIcX2acxUd06jEo+0gWnJGbMgsygO8I
	pY25d0Oh/uYmqKGPmb703qQYy+P/wcWpzct3aCMF5mjZYO0wf4FhJowimDzfq5meOwpo2A55Kpl
	n06m7Up0GasNLghZuiSXhKG7M9kP3KVk4j8noOcGeY/dN6qpZTT6s5pBtGuNcjv6FsTbPm2hyZN
	cM2oUj6rW1q+OIfcgstzypJ8A1EkiiSH3mj7e9oIqghhFpVIm3hOyF5SQCSSoQgz7DBLZRjMb00
	rGovasxO+XMP9ha9RcCmKDHHx/8TNbXJb2ySwMAfkcQVeFg1NwUe3fVt3BTomR0wXgQE87kya+j
	31Z57xX560Q7foXJp/fG1c7RbMv3tzL6ghE/QFGj7Ux1JPYSa9nX3KFvbl5vszCTgQkp+QipC7R
	dJX2lcDIynl0qJEcRswDtJfDcGlREe70KNVZqLkFNEArem8KZ2EQFlA=
X-Received: by 2002:a17:903:2f06:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2eb3650da0cmr99597675ad.54.1793632421903;
        Mon, 02 Nov 2026 07:13:41 -0800 (PST)
Received: from ThinkPad ([240e:46e:8710:e4e:e10f:cd51:e533:58a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c93fsm30567675ad.34.2026.11.02.07.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:13:41 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [RFC PATCH v2 1/2] platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helper
Date: Mon,  2 Nov 2026 23:10:18 +0800
Message-ID: <20261102151211.40701-2-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
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
Extract this block into a separate kbdlight_notify_change() helper, in
preparation for reusing it in further changes.

No functional change intended.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 41 +++++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..3260eaa62 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5313,6 +5313,29 @@ static void kbdlight_resume(void)
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
+/*
+ * The EC cycles the keyboard backlight level itself on Fn+Space; check
+ * the current level and update the LED core state.
+ */
+static void kbdlight_notify_change(void)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	enum led_brightness brightness;
+
+	guard(mutex)(&kbdlight_mutex);
+
+	/*
+	 * Check the brightness actually changed, setting the brightness
+	 * through kbdlight_set_level() also triggers this event.
+	 */
+	brightness = kbdlight_sysfs_get(NULL);
+	if (kbdlight_brightness == brightness)
+		return;
+
+	kbdlight_brightness = brightness;
+	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
+}
+
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
@@ -11581,22 +11604,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
 	case TP_HKEY_EV_KBD_LIGHT:
-		if (tp_features.kbdlight) {
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
-		}
+		if (tp_features.kbdlight)
+			kbdlight_notify_change();
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
 	case TP_HKEY_EV_DFR_CHANGE_ROW:
-- 
2.56.0

