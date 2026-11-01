Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561110;
	b=4rx/ASz0eMFQh2S/Bp7w1OO9tFIpoj6T+B7SF4jKEn+qAncwD0s97XGl8Y8GKXg8WQGt
	 xTVoJh/G4UGWlE8SES9R3P1OqdO4uSHl7sgpF3HAGwZApe94OHr9OOixygeTUzmbuZnMX
	 UOWavg+lcI96LDZnFoIoutmRogzLKL/nslOM1x/thKKsbeZVIxaEZtdvcOQl8YTnsLq4Y
	 Xh0usvkgxW1lQId5jXRbIA+LUOM13UQdF1YMFRHGiqtCoDlaVSbRjEnFHwr2iYXN5OP3p
	 O3uAsVPBEUglCnLHl3JdOgkcNfbx5WEREl4avtsPyaH6NsO5eosWYECpMPIR9fj8z4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xXV71PcODW6FyL159mGZh1/JIAVBGIw9B7bUXiNfwTI=;
	b=Y0KCSDnnLYupqBKHKYgCtd49GXjQ+ctWgtfJtYcoOMRmGyQ4jM/qVk/ZiButl+EEYFUE
	 7etwuCFPFRxyF0SwEcWmW2NQomnJ61/j12B9lXccdj7zgS8M+Ro824w2E5aZhetRtqpnG
	 R+jcUChUL3zSZekThdgXjpimpM28foLm5mvuZEcQtU9GJMT8xbWdLWaGi7AqYw9fA848E
	 qpZKIcWXIFTaxxWeHfe7lJ/44ok0AQA6bdLgpju/HhtEZZ9MPQeuHUowC4ESiw5czxSrT
	 MPjhed61mj0tqx1U2KbS9y3SYH4mbEFA4vkBPS8d1z6oXcjR7b9TOcUD2Y7Ond5JlAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGBKXP9I;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8EE606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8EE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGBKXP9I
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ad98c3fb15so19082967b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561109; x=1794165909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXV71PcODW6FyL159mGZh1/JIAVBGIw9B7bUXiNfwTI=;
        b=MGBKXP9I7UoSqv3lSgZIQdK3vGpqts+w+Ei2ixXGxRZ+rZfTZKcjYZsaHLRktxU7c0
         DR7AP7vVOqdGd6FTlK66g3jSONNRBnAcW+hZX3FhX0dbiF71VoxL2HcOn68SA0bwrgmI
         HEuH1xrbZM1y/GAhwDQbvg5RCK4cPY069AsSPHzMsAkfrBL2cvontgYWstyFJcD4gpiX
         8P/XyBa0oVOQ2WSxmWEE+WbwYRTwM9OGLSBYZIHcarQN0oRe8QmIcToMRvOPstTk+vjy
         +C/BWw/McX4V0JImSVOex9i1qosn9K+JMpwkB+FcNsxIb5hEE+cvMPYmbnX6fMUwWKz6
         nZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561109; x=1794165909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXV71PcODW6FyL159mGZh1/JIAVBGIw9B7bUXiNfwTI=;
        b=pV8Dass4B0G2xQcoDS3lc2jFvjfqQxFfw8/rF0HKXshVZ9cED7x8lL7so+jupyD9Jp
         1/O81/2cK8gpR0BxA31ERy0zhLQlUQM9FLlisWlraH1uVzr3ujHAz4ctyCQutJQfH9mA
         6Lk3OPbBO+NtK6tMyxc1+9p+3iX3TT64QDqoxFvkrwTWhknSW4whZneWGAIqKGzq+AN3
         M0u8SZj9RKtrvYKviP78+dsab1nQiaNSPod/mbhsdRGLpldHBwU6a8LEds3gcAoSyDd8
         zq8KKT+aW4niTlmOF1iBT64qdlPiLRRh+CffRlVBa90ryr/acmnEO18F+y/krnK2+Lab
         wnzw==
X-Forwarded-Encrypted: i=1; AKwUvBwwVHIo+4PtUdqHGm7o2sXXBn2FircQ4w5PcmgVRi6I27EdYv26WOCV/uEXFBGs9UnbU7R8gacentWDbCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pH8c30AJ0VWCq4+TX2tp+3tfghhFvJuT51QoojuqMIP46rPpu
	Y66dcbSoGW53gTSzcXxfsnmZoZBecu8lHILVmc6SdoMDdYEARcxhD4pH
X-Gm-Gg: AYBFou3RkQ9qWS7/s7j76fiT7bOkJFP9fwAOU0XpQsQoGpNBJYhAsNuTbkREi2Wv2ue
	czQnjFwZxbAjY3ZJXplJGal7/jl2P+uDFpqz6xwt7an/WThYN4ZXVN+d3tMOxZKEEz1kZcCCfkm
	qduNCz14fgAszdDsl6XBiwMczasGtexzQ2I+P0CJbQi+5w13Mmav93lEEbcFBQxTNf8OR4JqBF6
	oY0s/JwRhClhRl1VaMkkUSTwTpJOOR03a5vQkL6eoaCZZ4ZeaX6Ziclqwk4tF2izZSJD57Aqxlo
	SI1Kscz6W+siGaKY5ApNP2Iw+ttQoyxY0rG9qb/1G0ses0ePUDk9TxX+FcFvC8wdN3T3ZorqMyt
	ksuVChMu4mCkNwm/rtkRbGLSNp9RBBLsLE/ThDUjjRtULkr6a+uYubtaZdIrgM2FX+3X0fyKylb
	U5o2C5Jyky3B97tGOTg5FSFQnI3lq2yPbZoBB843hsScMMKO3ZVmWY1H4yoy1HaphVZxOIiZd09
	hM5TqXvDa+9eUyJYkN4O4LiqHwk1raFGNKEXZ5wiFgudb8JwK1cz+ihHlXwRM+WLv4BMo6Bcncl
	yzM/qAMOcl+UJnP3jzKKcG1cW3M5tlNVK8odazc=
X-Received: by 2002:a05:690c:fd3:b0:8b0:76e5:ecf0 with SMTP id 00721157ae682-8b2b65ba33emr54625067b3.4.1793561108916;
        Sun, 01 Nov 2026 11:25:08 -0800 (PST)
Received: from acer-pcaldeira.lan ([191.23.85.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7165abesm40430797b3.32.2026.11.01.11.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:25:08 -0800 (PST)
From: Pedro Caldeira <pdrocaldeira@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pedro Caldeira <pdrocaldeira@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: Keep Bluetooth powered on Aspire E5-573
Date: Sun,  1 Nov 2026 16:24:44 -0300
Message-ID: <20261101192446.5615-1-pdrocaldeira@gmail.com>
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

The SMBIOS type AAh table of the Aspire E5-573 reports a communication
button bitmap of 0x1 (WiFi only), although the laptop has internal
Bluetooth.

wmid3_set_device_status() reads the device states using this bitmap and
writes the result back, which loses the Bluetooth bit. Any write to the
acer-wireless rfkill device therefore powers Bluetooth off, even if the
WiFi state does not change. Userspace does such writes during boot, and
Bluetooth cannot be turned back on as it has no rfkill device.

Add a quirk that adds Bluetooth to the bitmap and to the capabilities.

Tested on BIOS V1.37 with an Intel 8260 card (USB 8087:0a2b) replacing
the original one: Bluetooth survives boot and acer-wireless writes, and
the new acer-bluetooth rfkill device blocks and unblocks it.

Fixes: 1d1fc8a75fec ("acer-wmi: replaced the hard coded bitmap by the communication devices bitmap from SMBIOS")
Assisted-by: LLM
Signed-off-by: Pedro Caldeira <pdrocaldeira@gmail.com>
---
Reproducer without this patch:

  # rfkill unblock <index of acer-wireless>
  usb 1-5: USB disconnect, device number 6

Runtime-tested with the same change on v7.2.11; only build-tested on
for-next. Not tested with the laptop's original card.

https://bugzilla.kernel.org/show_bug.cgi?id=190641 reports the same
symptom on an E5-573G with its original card. I left that model out
because I have no hardware to test it.

 drivers/platform/x86/acer-wmi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3a018fdf5..60028fe9f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -406,6 +406,7 @@ struct quirk_entry {
 	bool hwmon;
 	bool platform_profile;
 	bool pwm;
+	bool commun_bluetooth;
 };
 
 static struct quirk_entry *quirks;
@@ -430,6 +431,11 @@ static void __init set_quirks(void)
 
 	if (quirks->pwm)
 		interface->capability |= ACER_CAP_PWM;
+
+	if (quirks->commun_bluetooth) {
+		commun_func_bitmap |= ACER_WMID3_GDS_BLUETOOTH;
+		interface->capability |= ACER_CAP_BLUETOOTH;
+	}
 }
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -454,6 +460,11 @@ static struct quirk_entry quirk_acer_aspire_1520 = {
 	.brightness = -1,
 };
 
+/* The type AAh table omits the internal Bluetooth device */
+static struct quirk_entry quirk_acer_aspire_e5_573 = {
+	.commun_bluetooth = true,
+};
+
 static struct quirk_entry quirk_acer_aspire_a315_58g = {
 	.hwmon = true,
 };
@@ -663,6 +674,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_aspire_a315_58g,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Aspire E5-573",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Aspire E5-573"),
+		},
+		.driver_data = &quirk_acer_aspire_e5_573,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer TravelMate 2490",
-- 
2.56.0

