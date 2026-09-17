Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789E13C908
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607953; cv=none; b=YH/drP5F/9DpWliQR6rygVO/CTfh+pLY1SyuvsFXv4JOq7dSL+ik4BEnmhvjAnVT0jEY4ajyRBuefBjfBbC03P6hnVuRDjs4mD0qa1R34AG8uGAgetsPH1wEIRJ49AoYM2YhXCJ4ZlYxjR/cAPpzbEr0gaGVPrF1oCIDLuAEeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607953; c=relaxed/simple;
	bh=VanYmENmUmXTEk4Wxt1G2ttVVCoj5RiHb6I3O3KIXTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GK60vmyl5uRWL+iromZEf2NzQbd6s25R/q/fWMQNGbSDFN8sd79VV2KcGiAXe3vLvDBeDXQbwOSMkzXz/BxTQNa9wqLcSm8+gbBlGYpYqBraGjjWEcUmGEHC+zhyJY280JdhkxLDPi34+/m4DH3cHts0rTQKLTZ8/FSaRLcaqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XShqMlhX; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XShqMlhX"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c537df4daaso128954b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607951; x=1790212751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dL4BHtyrx9dumsdtOgu4KHiMjJj0IqF1DGbVo0Gj8OU=;
        b=XShqMlhXz+P6DaJoXtl5zqjgu+9mmdwTgogjuaWiLSZFCMhSdvGvAdpVSbSbJBSKnM
         1zgtCd9arGzmeTxHay8g5Tumn5YWQTg6xwEHVLbVTBeNS/X1qoGWR7jAWhB5eHwNFts+
         M6Pr0T4VbPvbhJAQIc9E6MGxnvCCoijwKWCo/D8qdckjfyqUnclhzFin5yy2OoU02d1J
         hqEgYTbu7sw7f/jIHQWX1ALZLAZAGX0o8X8Xa149HEkDzAUSYVc7JhQBS8ng9EeM3MV4
         BRURBau+6y3Tk9U3y346nwNlNMX/N87S+FivZk6V8EvxD4JwStc6HQ1I8d5Ic5lgEobv
         DDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607951; x=1790212751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dL4BHtyrx9dumsdtOgu4KHiMjJj0IqF1DGbVo0Gj8OU=;
        b=kx/uFOWkWEBEBfw1sKxjyvHl4E3uOhttixk/CaXBLNYF/1wWyzAFy4WQb9PyfIw/4W
         haNZBXgY2GIUrtyRblZHZADo6s0qAfKhKJMzbt67t70V2An4npXEwip/aCdTzYpX5UW0
         /Iugc10UXiePYAvERr/gU+GprJ2E8NRLrF2IHSLHtUu6UiBjjMA9BnwIllNkblRYbSMu
         OmFbrmnAqJ50E9buu5wOCnM061f/iksBPd/7ydGR3lho9vNeMGvttz77ZCaDLcm50dDE
         fcdZBQMcOi2UhMkojNkJwOS87TOG8ps7vCGpKewr67IKDaJ8cO3BPhoDAoYey7/vd3Pt
         kFIA==
X-Forwarded-Encrypted: i=1; AKwUvBxg1dLb+9jck2gi0Z7o86ZRdIb6X1WCoLVGVHDWgbVp5X8VIBwhWgY5kynkeGzNVZSPeJ0vgyShJ78MP+c=@vger.kernel.org
X-Gm-Message-State: AFuF++m2DGn8fOr/fsqXNpnWBfCPGJnJyqLcCSYlHyHa5/QbMxXNKeZ+
	CWlPv0rFkrWLCcZTeh8PNuDtFOwO2QAGFB1iLkGmoZVs9W2vSE4E+Jng
X-Gm-Gg: AYBFou1xfo+cNFm6z3kZh+Ch4T8AQfEjT8S7kaovcBZBChBUIGqCrsQIvfZ8I7dyPM6
	kHrSlLu7NwOCHkjV9nag9V5O0lUudMblGWy5rcU4QBi2kypvGIU9+z0ykHFOLSskwL7gbhReV71
	G0ShnSKZTNhOXzwkM4A37AQ44Mn+J/fcGNvOSOmstp0MUC/79maoK5JAUVqTEVBkJY7F12S/Q1t
	s9AEKVYEDczWJRcWpMq2hq053pVLaXoOc5UB4CS1DzsTBuBj2MV3waY2ryd9jF5W0x6SSBJvkL0
	lQliBktvPJ814LQJ1mi/e1k1IRfO7UX+/3+hoD00ZCvYFr5odkTCNKHUyl6H9g5Tag1TCtCz9SS
	hhaH5Umgtpd7YYFHiHRy0+Wy9CQLAYkPtZphI8eJMDQrRKZCzLEK65DUsNEnE+kqA7AusF9119s
	I9a3/sSpldVdFYQ6bzlsbg4gqo299lkfedP10/3iSj5ewfLxIVWN6N6GMczWnw+7dpMwtt55V6r
	7FOdSjO57VZ6D1t
X-Received: by 2002:a05:6808:10c9:b0:4b1:bc2e:3f60 with SMTP id 5614622812f47-4ca4a0e12a8mr5132686b6e.16.1789607950999;
        Wed, 16 Sep 2026 18:19:10 -0700 (PDT)
Received: from localhost ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6cd417bfsm1479286b6e.9.2026.09.16.18.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:19:10 -0700 (PDT)
From: sjunhyuk1@gmail.com
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	BurningHoryd <sjunhyuk1@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add board 8E41 (OMEN Transcend 14) to feature board list
Date: Wed, 16 Sep 2026 21:19:09 -0400
Message-ID: <20260917011909.75399-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: BurningHoryd <sjunhyuk1@gmail.com>

The HP OMEN Transcend 14-fb1xxx (DMI board name "8E41") is recognized
as an Omen board by omen_thermal_profile_boards[] (so platform_profile
switching works via the generic path), but it has no entry in
hp_wmi_feature_boards[]. As a result active_board_params stays NULL
for this board, is_victus_s_board is never set, and none of the
board-specific paths that depend on a real ModelCapabilities entry
(EC thermal-profile readback, the Victus-S GPU CTGP/PPAB WMI calls,
the AC/battery power-source re-apply handler) ever run for it.

Confirmed by direct EC readback (CONFIG_ACPI_EC_DEBUGFS, reading
/sys/kernel/debug/ec/ec0/io) while cycling /sys/firmware/acpi/
platform_profile through performance/balanced/cool:

    profile         offset 0x95
    performance     0x31
    balanced        0x30
    cool            0x50

These values are an exact match for hp_thermal_profile_omen_v1's
HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE (0x31), _DEFAULT (0x30) and
_COOL (0x50), read back at exactly HP_OMEN_EC_THERMAL_PROFILE_OFFSET
(0x95) -- the ec_tp_offset already used by omen_v1_legacy_board_params,
and identical to sibling boards already in the table (8902, 8A44,
8A4D, 8D26, 8E35). Two other candidate offsets from the same struct
(0x59, 0x62) were also probed and did not change with the profile;
0x63 changed by +/-1 opportunistically across reads and looks like
the unrelated timer byte, not a profile encoding.

System tested on:
  DMI board_name:   8E41
  DMI product_name: OMEN Transcend Gaming Laptop 14-fb1xxx
  BIOS version:     F.05
  Kernel:           7.1.9-arch1-2

Signed-off-by: BurningHoryd <sjunhyuk1@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 615b4cf..f71cc62 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -343,6 +343,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E35") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E41") },
+		.driver_data = (void *)&omen_v1_legacy_board_params,
+	},
 	{},
 };
 
-- 
2.55.0

