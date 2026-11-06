Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965393;
	b=WqCdRVC+u0Ty4krKjkmpNpjfAA7ENzOXoiTPZcJAbuRuggxm5wELbvnowxg8XZtAeNHT
	 YzXJ3zZqXXZygccvGVXNGj8Uj/KBlka1IvKc560YxKdVgxdjrsn9shxB4m2lpea3dupnr
	 J9Mp7/LIPDBuQxWrKTXhDYEi3nIKvOlms48xlPt44paZ7YMDhp2uISk3U4au1w/Pakr4I
	 4HD4XzxIvtjfYX+tKteJ4RSPEvabeEacRJmb7PAMJvIabK7bVXBMKauB9h3CnwDDtzUHD
	 V3BxiKI3UMVu1AN126OH62sFGBBTo6Yrc8N22T6Lyb5tszMHFDZp2pt+gugGoLI2Odg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vGWDvyTZcD/X4Tcli9Wn0Aq/2+luEsPmy4hQ7ZtpaL8=;
	b=0jeFDSaNRXg9VPLc6SeQTbGMh4TexzLUEhtVUV8zWfbMW9OHZI75Xel4QXZ/p91GP/aL
	 Bvg29n45Lp71AklhbzQEF/Fdfg03dD/3CcKgVEsvXffKbx8CH8kNfunmysIvGM2AaDTu7
	 mDybEL3nFKsfaUbJ1f3gCAxpqMct05tYasXV3av23YAavFqVjbwZBzVPAkfn+BVSHksEA
	 Xc0ZU9YBglS51RBw8B04a/9ChqIL3SRqIZhPWIQCJ7sltoygPtm3s8JSd2ikUcC/IqB7l
	 sB+2Vi689l0H2+t8NT7CPYZY5ieP8vFh+446uhnE+67zOeYkR/XItwLNOlnLFHu1PbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=c1KQp4gq;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87388606EE97
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87388606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=c1KQp4gq
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c45551fa84eso78234066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965391; x=1794570191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGWDvyTZcD/X4Tcli9Wn0Aq/2+luEsPmy4hQ7ZtpaL8=;
        b=c1KQp4gqdZGxoOCGa/RfgQZ+zO07LYra6iMg591qnQblSZcT1F0fUywCGO4BdaB/t4
         QqR5qFNTheKqi5DAYz+UmqQdwOE5s9bfohMp0eDs+ecHHCHu16M9wNxeU/VccdoKsarq
         3fapVuynIHn8TZTK2AK6K71YsbnIrlvush6Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965391; x=1794570191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vGWDvyTZcD/X4Tcli9Wn0Aq/2+luEsPmy4hQ7ZtpaL8=;
        b=oqcV24JqBt9htCRDF4Sv1hqzNmcn1mAC0Tv7bvF21TeJDQAI0Fx1CAESHRq9xF6fB+
         qdalFocZQL3A8/zYI5ZJuJfEOzXSNJNhR2D07aOwHldYN3yyGqHh04nlUnl103aB92W7
         dbQcGYRdmUGV0d8waXWfWGckpsem7PjGcY8ryGMwgZYiafHBSSA/nxk/qlhUzVRMGq+w
         9Ur2VGtKEGfU4fg0ousgMXu9v5vLHUjqFQcLomnCfEBgtNTSg4f6Mxx9Xp2fvKBDXgI4
         1xGtTpBJEWJqoOWusZSx1BCpx+V4OLYRm6NevzQJspAjKuBIrkkhA+ooevcS94RHWHiZ
         Ep/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlni/oLUEDJ1Vd7ahgs4iGhO2s/SLUAZARtWMmDKyCBgYXFE+/JhvWAIgI4LwKOoe0JQD4n3RzrYZkwfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QIlnz/p4F8QGSa5HXQ05jl/FFCUGcNLQwXJy2Mhi6dI8h6ekS
	yth6XQGlHNFrmeaB/DdCTwMbVsJEkkFAG79iRuaH3RPw2YtNweYDm6OkcvQzQliW6fY=
X-Gm-Gg: AYBFou1YSQu95E3so4o8TSLRX3r8szwVI3sF0UjVcN3DZAZ18JbreoOCAU3V9/gcNo4
	9wLiNiFEmhEXhDn7eM7BGLtJ9nqBW2viwMmX3v9xyGxAzT1iXzgrC3VKJZ2JE6alDKGecHOw5gc
	9rHTXBH95a+4wKdhTRW4Abz0YRDK73Fet+2gUSLbEWF+RokJD2mkPKCIhFbbUwLJkwjEtKVl6Tn
	iMUmqspecW3B7gC5zr/kwNseKX0v1x0V3oHqB3sxNKQLR43VLRsgFvTmb2LYURN/vhCJ+fCsHqi
	6vjpTWN4SpfzoysRE+9lzVj0H8HcDOcyrfOWcPiXF66TCEEG/PCaQxC6KuPmyf60zsmk8iex7SL
	/cQOW7QrNtLBQT8tr4T7S+p2JxcDAEDb2ey6zd3x+39zq4UgTBAl5erXze4XQ/FXgvaF2iSHewk
	GsDjrCs1U3mpYsE7zmiJGl9bcgAuLM+zv9xzTTvawKpL+m0xAnSY4qs3OEDmchBsyC3j2uXN7PZ
	o6tZ6kj89VzsXoHBpN5wAckhsLVS8XKA184Mxu4LHNm415wQnEnJM4z/T3/GsRjVEHq8pkyom/U
	CgMixc9v/0ZivIaqfjvKtQ8gLIOuHcIcc/iLnqEW1nA+vv0=
X-Received: by 2002:a17:907:7b86:b0:c4c:f85f:aa12 with SMTP id a640c23a62f3a-c4d35538423mr176866466b.31.1793965390484;
        Fri, 06 Nov 2026 03:43:10 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:09 -0800 (PST)
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
	Arsenova <7z0423arsenova@proton.me>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v4 3/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
Date: Fri,  6 Nov 2026 12:42:59 +0100
Message-ID: <20261106114300.936782-4-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106114300.936782-1-chris@miget.com>
References: <20261106114300.936782-1-chris@miget.com>
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

Map low-power, balanced and performance to 0x02, 0x09 and 0x04, and
use 0x03 for performance on battery, where it gives what 0x04 gives on
AC. 0x0a selects the same tables as 0x02, so report it as low-power
without offering it for SET. There is no balanced-performance mode.

The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
so skip the AC type check.

Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    v4: moved after the battery support (Mingyou), so 0x03 is the battery
    entry from the start. The code at the end of the series is unchanged.
    
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
    with this series on top of v15. Firmware mode (EC 0x68), DTT OEM
    variable 1 and PL1 a few seconds after each set:
    
      AC       low-power    0x02  ODV1 2  25 W
               balanced     0x09  ODV1 0  45 W
               performance  0x04  ODV1 4  58 W
      battery  low-power    0x02  ODV1 2  25 W
               performance  0x03  ODV1 1  58 W
    
    Rechecked on v7.4-rc1: on battery, balanced, performance and low-power
    set 0x09, 0x03 and 0x02.

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 97dafd510ba8..4d02cd9e8a6b 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -114,7 +114,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2424_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
+	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
+	{ PLATFORM_PROFILE_BALANCED,    0x09 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, .battery = true },
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

