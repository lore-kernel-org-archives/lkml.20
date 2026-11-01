Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549908;
	b=KA8sZBhSYdDAlRNnCgvMKO9T7Vf/4nCTYRm0S/UDrci8WsNzWqGbyPxFCSQEKU5V8wRL
	 tyGiLQTSzArTBraUTI/vBB4TlnZnN7HPFjjct69e/5x0m5Qa+kPQ5TQ0LHXU9oBp+mdPq
	 1S9LJsXuueIPmCx+RnB+mWKycOiI0UctZ8mFkIwtBZVRnwjujT/AEVyWhMszTptx4v7g4
	 myMUtOG10F5xqUiTFRjraFKcNx4sAvUqHDJgUrfnq+akgsJi47tqt/6aH/uBMtIm6jGOm
	 uIbGJwKJk/8P00Kklnq8r7FI+uEq0N3bReV10LOCvYFkNobeoFJeCcpkGHdIF/RIDFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZI698W0fRQsxdduD1r1rY3wNAMAW/QlO4rXfvkEsq24=;
	b=BM0+Zd9w65Gu2ccYV9cuw9jA810dI5j17CKWz3i+dBFsuz52S2tZSY1XtNwOwQOmM8qG
	 w5AMkTqUBaQTx1qantSmMZsTj7nhW7YxcuJ/YAq+iEHAi/XoAWUtVJYtZLXjV6sZLt85V
	 i7sOcJRIrgbSQmrB+Ykt/T1eN/RYUko+uU5WzBDnAaY+MeYWVH0f33SwP+epsUZFAuYP4
	 mDEHSWSQ3kN+cJ61nEcKtnbUx5nwk2qYJqeAVftqHngwWxdlaNvbl9otvx3Q0zf4XvAY/
	 BzHbwFG2rEonskIj2Tr26PXFge99DrL7nGGWmrlGyHf6g038NW6U6sp7ZkTNBdLTAHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b="WDH/N4vB";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910D606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3910D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=WDH/N4vB
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso5880654a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549906; x=1794154706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZI698W0fRQsxdduD1r1rY3wNAMAW/QlO4rXfvkEsq24=;
        b=WDH/N4vBD28xeG9eQrBCR5WU/gITayyX8/DSbfD90PekosJBikBD3oRO6nDqLkWS8i
         KOHgWV8iHLoomaHGRWZuclcHUCqrf/QN4EtTDE4SrhUVLnmOXsWUCDC4mZI2NVZVQOg5
         Jhz7euE6Mne6Xqs/zozgz0jRF614qU65LypPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549906; x=1794154706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZI698W0fRQsxdduD1r1rY3wNAMAW/QlO4rXfvkEsq24=;
        b=fzzTgZNqllrh/3Ij4INt2EybsW8RukqFAyxIwoiq+I3H0xq+upki3ynNXEMu3csRJj
         TeNm/2j6GVtCUMyMDMAiAzzqd+pZ6XCdRuBe7xmrr4LhrglTwffXXJ8pIKcj/h2Kl5YV
         VQnD/+TPTjd+diVTgcEUWHIteuSRc2iraqdX7/wFQkPGyfZhh0fWgJh64l2agz1VFG9F
         1VuZmY9oJbf+QKSZtTAh2FeJVdBsxGVhKo8jDICuypIeSrbfn1Nnc1P5vD0LwrvYjshX
         WE24wjdQ2WmSRrXK77zx9SykJvOhulAaJ+thAGk+wk3GBheJyKoNOz3tCCsC5IgFCP54
         edxA==
X-Forwarded-Encrypted: i=1; AKwUvBxZJq/dB3eX0YVt9uaB9LkiELOsODDe+78d4uxWfIfNi9aitFxQtC4KqNus86yh9hDxEZryN0QvT7ilLRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpgvUCf0AnONIdHdTIovnuEqTXCzkLKXBVVe3D7/BAxIzxbVZ7
	Tg9lUsU5rZk+tutv1RROZ9ADQKQ/yg8Jw+4RRzeA6d6zbRNV4KXGN3IugbveilS6V9E=
X-Gm-Gg: AYBFou00yE8g9QkG2fOTYkKJCNxaH7n6TQqSjdpLjZ5uTCR84QT9PcfjTWrwKuPaFS9
	9HSyDGZiTjNPV18BZQg1BhvlugLM/6UWDBnRhWYy09/eyCwWE7hM5WvzobcOsfL7LLFFZRaZOWF
	ib+jxAaSypGDPUHcbMVTQ18fYwG0a03Hvh2oTpdtJ6pcKkXwJ8mkHOz9OstFejwa6u4/GE55OPa
	Ufw/BcKrjtzxf3C3jVzkKe90ZjQ5MaW/PgpmaPTuhdEPM9SzlhPX9zDtmAz0Zp2I45XBxMfJ50A
	x7f15WUk8enBSXKfWpWl45pfDS8IJE5z0ixkNxNl0A5FbzKeuSXklrQiWmYIVbwlKXCJ0ocXoKZ
	lp6WcBuSkptoB8NhQjY5GwIGP+E/KFCTpbUFHREIes1UcamJfjXTwPbmrfyVSOANQAZqv+/cK9W
	OhhlCD7MLp6dpjF77DNpPTEjbZ7oT8wj6mRi/f33aspc4+ltQaIZDOaG0/Cbct2Rrgw7pL81g44
	qNuCCSKz9EMunyvcDGUp3LLMqpxVxJdup8vWXL05pTKvf9HYB8S92SiyXP5jf6xLnJntRxavE0n
	JwiROYNCCFfWKkeQwFJB5tqp6frX6EzFzdhFIOW6fAN796T/Bp3ihJGm8QRCXoIuLDW9h7Q3c9i
	wQpiRSpnNQmsE3eIcDuv4xgPq3nBE
X-Received: by 2002:a17:906:7093:b0:c4c:b683:363a with SMTP id a640c23a62f3a-c4cb6833696mr238324666b.20.1793549905728;
        Sun, 01 Nov 2026 08:18:25 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:24 -0800 (PST)
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
Subject: [PATCH v3 1/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
Date: Sun,  1 Nov 2026 17:18:11 +0100
Message-ID: <20261101161814.1325847-2-chris@miget.com>
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

The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
and balanced-performance are no-ops and reading the profile fails with
-EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
also aborts system suspend.

The firmware passes the mode to Intel DTT as an OEM design variable.
The DTT tables in its data vault name the modes and set the sustained
package power limit (PL1) for each, by power source. For the H484 CPU
variant (H404 has the same layout with lower limits):

  value  AC                 battery
  0x02   Silent  15-25 W    Silent  15-25 W
  0x0a   Silent  15-25 W    Silent  15-25 W
  0x09   Balance 35-45 W    Balance 32-40 W
  0x03   Smart   36-37 W    Turbo   50-58 W
  0x04   Crazy   50-58 W    no entry

Map low-power, balanced and performance to 0x02, 0x09 and 0x04. 0x0a
selects the same tables as 0x02, and 0x03 gives on battery what 0x04
gives on AC, so report them as low-power and performance without
offering them for SET. There is no balanced-performance mode.

The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
so skip the AC type check.

Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
    with this series on top of v15, loaded on v7.3. Firmware mode (EC 0x68),
    DTT OEM variable 1 and PL1 a few seconds after each set:
    
      AC       low-power    0x02  ODV1 2  25 W
               balanced     0x09  ODV1 0  45 W
               performance  0x04  ODV1 4  58 W
      battery  low-power    0x02  ODV1 2  25 W
               performance  0x03  ODV1 1  58 W  (with patch 3)
    
    With v2 on battery, balanced set 0x03 and PL1 went to 54 W.

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a431d3fef774..63fae12ebd83 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -113,7 +113,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2424_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
+	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
+	{ PLATFORM_PROFILE_BALANCED,    0x09 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, true },
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

