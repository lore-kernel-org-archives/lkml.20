Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622079;
	b=FrTc8BakhDOFoAtxQ38QhW6FYSltFJvp0HszEXOQIKiEmELqoNTNG2gGpRu5KwQUtdZj
	 rAd+B9c49czHM0HUv50Sh/sE9VADsE1JClOlKJ9SO3kQ7gMNlCByW7mea3tCQiikaMVd4
	 UGmY4XAQOfKI6gxbu4LyQXh2hwUqByfZWagyTMKE9YOBvK0DGQ9Rcj6ib0QSgiOym4gdt
	 R06sruU/A1XeCtSpH+3+wJDFzR1fPx9qShGEgF6LMb5s8LNylhlQX6tnp6LzKOwVB+AIw
	 HIyehMwcJ2isiahTsJ7qw9Bq+I5YyhAcaYaZdmxRguKVwDNOM2sovIBecCfOaM6woxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gZoi50CU8duaJY0qeyDAUF2hNEQ0g+BDDJdFh73HKoU=;
	b=vvzyvX551Zimqy+ZhS1t0awtrLXl89ydXcTU9SNOGJh4xMuY2B0jOt+1UBO4uXVqVsZM
	 uZO2/Z19I9+UWyI/SWgb2NVzz0BBmK/yMEfCOfPDmKgIm53EIKn5mma7MwKH6kgL/Stzn
	 Yhb8aS7cBpsRq9ikkN7KYq2FPdyLQNj+ap/BT8O32SrDtPl1y1OdJAtX56JhBnCR3tleH
	 6wyYKGeR2kOiukMIxCsY6GluTT//VUE17m4uL9hLWxr3iT5SFf2EtGDWfoIGXWoMMNRaC
	 4yuU2YPwO8wZ4RkgmLf3uL1s01jGP4VOHl0IHLI9IbIugkSLojLVcdacWWen0DNfkdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TqyyZwxs;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5FC606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TqyyZwxs
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1133223f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792622078; x=1793226878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZoi50CU8duaJY0qeyDAUF2hNEQ0g+BDDJdFh73HKoU=;
        b=TqyyZwxsrH3FM9EerDE9wCxSyDymTB3iGm5QLWBZ+qPbpQlpFjca43QK+9c6ioT8WF
         IcJBQy7EeLkHaEzmEab7d05RJF9vi6jDxdpS2a+bkqhaRalWGiTEL/LcABClHcxDjESZ
         KKF2t+DZSlYzfFHL8QFVboA4HGlL9alUlt+z1Vgk1lCnsyr3srd+rdwG7hI4VCcm0zNg
         NdWqvgsGKE08tOBTkqsXcpZ/QAYfH7eOnsk9V8Yp65B1xAGlVaqUASu63ulnG7cCMwek
         GoSY6ui8IECYz1UXyyn9FBRaNGylEZd5MwotX5i134uF27VshLh97ut7Mcavj6zvpG1e
         An0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622078; x=1793226878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZoi50CU8duaJY0qeyDAUF2hNEQ0g+BDDJdFh73HKoU=;
        b=nSroHNyzxo08CVoL4t2O76WA/Fzt1eeXaeVLgnRDNgqhjMRtD7ffw0KSnI73/FWlpS
         OyEt2jxNdj8gvEajXlM84Yyp7GtOYAeX3pZU2nXwohvh3i5/Nhl+8850RoUuQcFbiucl
         oQGUlQi6z/VvJqDOO6b4tlZhHisuqKGovdIdLNzGvTbkjCfZM18FRBfaibLOAbhuw35a
         kLfb7xamlJxKA0wC3fptDewd6CPgy1puoDvR6SZyESypz0YhBvDUn1vh9nX4JWDtcIib
         1phJdSFgHKV2yu3k9hevjd27m5UuOKY/9mJsKb3rKTk9n9eT2nvmXHI8EwfQy5CmGK2T
         lFIA==
X-Forwarded-Encrypted: i=1; AKwUvByjSENytrcR5Z8U346vp90s8141fl+iV8GYOTz0KysDMc7zmgVAZn20JUt+IPXvnPnYQJP0StQulUAbFCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyejFSL0EtogWNhmA11hwZYXiQfC7/h38oo97fNHEWPIHDHBpK
	pqBRl5mo6bywomibTI874mw2uqOzJSnjpV0IFJNfDPCbRGAc/tXP3h2E
X-Gm-Gg: AYBFou3+yZwiFr/vDyE2pGFbclxiUbetBV1OqNZQDHN/nQtbWgTiY0Kt1+5pyDabR6D
	fDTe5a9U2q0fOEAuL+9agCDmux477xRepB794jd26yT96kEaXLjq2+LK7xlMXHNAFD76J7Y2POj
	XtcEdYa3qReIYjA+PA+k4H2oDM+xXhTGuTCNNB5MPwkKUIpUpplT6lCnryVk+rSkvaqCnX06mDG
	7ixxe0M4WDylcMuwXQuVJ1jEFj5DpDRb2SnkRePcEHpBayZ/r//4TlynRRN+uUzNS7CmNoD05iN
	XGQRDpWldmmc4JCb7/j3ih7+hS8TMa24Oi73C05QR+1CnhdDBSmrJHgEwkDlzsYPtxFBhbx/Q9j
	2TgExoYp0BQugPRblh/MgGcH1K09moRzSwju5uvoCbhvy5TFUtSdq3W0U8VSxS3akvKfBTWvYVP
	zedG8E0RiLn2J7ngp3LohOkXvZZSGq4dESvaPVCG3SIQybQAx3g5DzR/0O54TDdxOoNbZqQY6qc
	YCw+cY16WJXw1Pyt5+ElGzji4rnrkVPztojj4X7c7K2tDTE+hCFK0ntoeF3jsnmlVkRcnSQ/QuG
	BabPmP2QqvUe6ywGhXB62Mz75abpQkCvtCg=
X-Received: by 2002:a5d:5f92:0:b0:48d:eb6b:9d0f with SMTP id ffacd0b85a97d-48e2647cf56mr7748471f8f.11.1792622077705;
        Wed, 21 Oct 2026 15:34:37 -0700 (PDT)
Received: from hp-omnibook-14t-fm000 ([5.112.131.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254efb2csm8744742f8f.2.2026.10.21.15.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:34:37 -0700 (PDT)
From: Alireza Ahani <alirezaahani1386@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	Alireza Ahani <alirezaahani1386@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Ignore status bits in thermal profile query
Date: Thu, 22 Oct 2026 02:04:30 +0330
Message-ID: <20261021223430.26229-1-alirezaahani1386@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On the HP OmniBook X Flip 14-fm0xxx (board 8D9F, BIOS F.20) every read of
the platform profile fails:

  platform_profile: Failed to get profile for handler hp-wmi

and /sys/firmware/acpi/platform_profile returns -EINVAL.

The firmware handler for HPWMI_THERMAL_PROFILE_QUERY (\_SB.WMID.GTPS)
returns a 4-byte buffer: byte 0 is the thermal profile (EC HPTP - 1),
byte 1 is a set of status flags and byte 2 is derived from the EC MODE
register, which defaults to 4. hp_wmi_read_int() returns all four bytes
as one integer, so the value never matches HP_THERMAL_PROFILE_*. On this
machine the query returns 0x00041000, 0x00041001, 0x00041002 and
0x00041003 for performance, balanced, cool and quiet.

The same value is passed back to thermal_profile_set() by
thermal_profile_setup() to sync the firmware's OEM variables. The
firmware's set handler (\_SB.WMID.STPS) only accepts 0-5; an ACPI method
trace of STPS during probe shows none of its cases matching, so that
write is silently ignored.

Only use bits 7:0 of the query result as the thermal profile.

Tested on the machine above: /sys/firmware/acpi/platform_profile now
reads back each of performance, cool, quiet and balanced after it is
written, the "Failed to get profile" errors are gone, and the STPS trace
during probe now shows the matching case updating the EC.

Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
Signed-off-by: Alireza Ahani <alirezaahani1386@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0eac5e1d9..8f8a1165f 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -110,6 +110,11 @@ enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_QUIET			= 0x03,
 };
 
+/*
+ * Some firmware returns status flags in bits 31:8 of the thermal profile
+ * query; only bits 7:0 hold the profile.
+ */
+#define HP_THERMAL_PROFILE_MASK				GENMASK(7, 0)
 
 struct thermal_profile_params {
 	u8 performance;
@@ -2116,7 +2121,13 @@ static int platform_profile_omen_set(struct device *dev,
 
 static int thermal_profile_get(void)
 {
-	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+	int tp;
+
+	tp = hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
+	if (tp < 0)
+		return tp;
+
+	return tp & HP_THERMAL_PROFILE_MASK;
 }
 
 static int thermal_profile_set(int thermal_profile)
-- 
2.53.0

