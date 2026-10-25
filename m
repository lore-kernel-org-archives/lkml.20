Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958108;
	b=nlCiYGVjwiflqADT0wFmYe7BrX4j+vQfHKV8lPC2J1z1u/6xEYzX7ee+2dLp10VEJE/b
	 v/kGb9eHYUfNi/PB2BhfZmiK4cMv9gckVruXk96XTb+rHMabkzuC+dLSFI8MC/FBhn6te
	 xyGjRq3f9HX78j3jCCScipKkEF3hl81iEyLY5V3BFFAdFPa8HpFYc5Z9rZlHCCT8tQ+P9
	 FO4T8UbLkZ/hqg1LDrLeSX2WoU9cr8Vyqh22kGQzlaYJbbh9sWvKSHhBLq2JkbJ3gY6LH
	 GypuipgFemqd0c+MnrqMrthuo4XKYDuwZDtiVTKtR+IbxtT7R7ds4N44B2JJ8utQ8mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YCtinZZLLMBS50Lr0v2EbMBwCzHcQ4oLPsSct33j5+0=;
	b=q2ozi9sqlrrX093YMpPoWOX6Jer38Mi1Tg5d0p1KWRJBcOjOtLR6Asg8/VWrWdHtQZq7
	 /n4VoHQ1RK28QpRha39GLgN2i/hgG6RDsn/05FZ7gD53xVxm+SGbjAnm8Q/a7wt2fQl2p
	 hfT4qJZABTByVbCSyObdAGRwWalxvM5FJaBwazwQYlk/+Lo7gxkDo3fVThiupLYX9XrkK
	 RiY6LRLMlgf4cnrCmsQaTdTfe6i1ZwEQ40yNZihDIacZ4wMJnpdhT2QzMUtPFaLgYOhkE
	 odbQyA+hLegXjakyOuS9cTO9P4SHlO5/0uliuA/DMmGQ1fl7ON6IcYDxn8bEyYSG7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=K4ln5pb9;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196CC606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 196CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=K4ln5pb9
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so298143966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792958106; x=1793562906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCtinZZLLMBS50Lr0v2EbMBwCzHcQ4oLPsSct33j5+0=;
        b=K4ln5pb9ler+wgRksMMbPfU5TRBXnjhlM1VrSUY3WVtQ8S8N4PqGFk4ZfvbXLn1ZMC
         a99x/eIU8+D76mlNneZUuz9nLerciSusO4n+N6MMFwn6o98LpT1gixy1MbSN3Gn+AeSU
         dHr5CVMq1LCpJ07A+h7EUrvM+lm9Gj5W/i4EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958106; x=1793562906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCtinZZLLMBS50Lr0v2EbMBwCzHcQ4oLPsSct33j5+0=;
        b=pJ8ZZaXPvQH2400tx1n9FLm7P4cS8gZGmyuenYp2v+eBzm44uKSyD5FQnLSySvjh0b
         bVwRNGaPPvra1dnLi9vcd8sjemUHdaVksPUESwp6KbRD4DXpPDuV/yRC0xFN4a7RjkMX
         5UDfYoLeFNRX3OuAGn+mo8lgzCJ1zj21MS5hj3+W0tjWe9M+AWP8gE7udMF7/Ihod7MH
         SIJOTWKUxd3J6QBfhxFjujzzVxADSWtWKMXQEvNSyBqMC2hVxUkFH16V537b8Mm/0z1M
         oTqx51PF1lKkecEMqBwq4KudUk607DrBbv8RqlKny9ntgaXz6GQuPNa3N/5uoENZttQ6
         FGxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGu9t2G1rEcJuqKJJhexotY7tYcutrlOyUSif48AKrybk7wpobOAZDmcDz3O/d0u4B+3Y1ynlcT9EPRBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzsczkLd9C4VEQqa79slRYR1IgEOy3hWufD3xHMjeJyoZc80QM
	mBrQHKQ0+SHC0IqfdxEuSIVZU8cgVwE5IWuDOgSY3VrC78QGpJ1zDMZLyMwFJcYjW+w=
X-Gm-Gg: AYBFou1+Cxqw8fuJwqqkqosaVFkMZGInNIKJ3n6lpFB8kO1Rr1aGsNUZ8fQoPbhk7YI
	Nq3zMBvhpMjtutDuupkctnvlblHStlB5p/71QX0fcBiGVottzZWxYspRntVDXJWH7HGPVGkLnQV
	ZxEujChDSAHmtaUmnl9B3OQCSxHD2zKWH/gUu1l/lXBDZuMdT2r4l67yC5LbF+hdGDOd54WakZP
	Yo9nqOW5s9khLQvKHwjri4qGwzIBOkhaudqVyjM1Fez5YOE/YEyt3hUV28iBkQsca9O6s2exFCR
	QPJIjq1YfXYFSv7M6nW4aDlYfdEGzd7w3vlMmNPj83Gy4Mp9heatHNAPs7Wxi9puDLTOE5Gfgbb
	jR9IYnQd4jumpwWj2H9epG56esEqmwoEVnkshiFIWVTQPWo9854FskHrD8WC0T2/yofmHEZAP7X
	HRiDoWM/zP3OXncM66hidQZWPutndKgkbBG2QVSmRzkSicNTMaN5F6QQm9f3vjq3oz0m+sxW+5X
	YOsQ6g9BYu0Zwus0zPFCjqK0SLxzkRVqW3ygkz89QZjT+AfKi17i2mvNg6dCUsRE0tr2KKWgXo=
X-Received: by 2002:a17:907:2da5:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c46bde088d3mr598807966b.28.1792958106466;
        Sun, 25 Oct 2026 12:55:06 -0700 (PDT)
Received: from xia (user-46-112-84-81.play-internet.pl. [46.112.84.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea620sm238279666b.23.2026.10.25.12.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:55:06 -0700 (PDT)
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
Subject: [PATCH v2 1/2] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
Date: Sun, 25 Oct 2026 20:54:55 +0100
Message-ID: <20261025195456.43414-2-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025195456.43414-1-chris@miget.com>
References: <20261025195456.43414-1-chris@miget.com>
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

The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
and balanced-performance are no-ops and reading the profile fails with
-EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
also aborts system suspend.

The values were identified from the WMAA method in the firmware's SSDT
and by setting each one and reading the sustained package power limit
from intel-rapl-mmio on AC:

  0x02  18 W
  0x03  37 W
  0x09  45 W
  0x04  58 W
  0x0a  18 W

Map low-power, balanced, balanced-performance and performance to 0x02,
0x03, 0x09 and 0x04. 0x0a is only entered through the firmware's own
mode cycling, so report it as low-power without offering it for SET.

The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
so skip the AC type check.

Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A) with this
    series on top of v13, backported to v7.3, on AC: all four profiles set
    and read back, and the firmware mode (EC 0x68) and PL1 follow:
    0x02/18 W, 0x03/37 W, 0x09/45 W, 0x04/58 W. These match the values
    first measured on BIOS XMAPT4B0P0909. s2idle suspend/resume from
    performance restores 0x04.
    
    On battery, balanced-performance and performance are refused by
    bitland_pp_check_capability(), although BIOS 0909 applies 0x04 on
    battery. This patch leaves that check as it is.

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a4c341ffbb9b..73be63146fd5 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -116,7 +116,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2424_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,              0x02 },
+	{ PLATFORM_PROFILE_LOW_POWER,              0x0a, true },
+	{ PLATFORM_PROFILE_BALANCED,               0x03 },
+	{ PLATFORM_PROFILE_BALANCED_PERFORMANCE,   0x09 },
+	{ PLATFORM_PROFILE_PERFORMANCE,            0x04 },
+};
+
+static const struct bitland_mifs_quirks tm2424_quirks = {
+	.profile_entries = tm2424_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
+	.skip_ac_type_check = true,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2424"),
+		},
+		.driver_data = (void *)&tm2424_quirks,
+	},
 	{}
 };
 
-- 
2.56.0

