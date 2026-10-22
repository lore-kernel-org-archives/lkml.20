Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690477;
	b=rWC3NbYYIsJ2xLnoleBJlhqrHzjn6osqGs8bYjcDsZF+GhCMRfWlfgKuoR+k/A06nV25
	 FSUxyDd1ONNtFXslbRa+CP/qzyDN295ANFQHAH1dMWWfygdtmhYaxfKyfCYBxO0u/NY9C
	 Pf+46NsXTtcwdpRrsE2o5vl0a0VMY049TgeiD23oeWR4W3QUP41DP4azGDO2B2+DqGUKT
	 FQ/Kh046EpQsqwe/gWt7xwaWRmyM4tkILtcNYP4NEpQ/tpbplPv+rgq78PilbbWa4BI+/
	 Zz583XsGXW5Ddw9vmgCddbffItv9+egg0b2LA+NzCiyZGAs75XeptV315H+JK1YNYTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
	b=YTeeO7aoKSpraY+pmlzm0nM3CgDLhyDbSS5JxVA/EuX7va/2qIKL5K7p5QKUiBvbKO2i
	 ERdMMgj0wpyrsfeN+V/2l5sma3Qquqx3jS/dvMWLhaa3996CUjmi+GAZfcwr/BWa+JjCj
	 03DbiLdb/Wm2Uc3Ba9jrctjrlOLgBt6vuZ4SlPUQbivu2yK+4tELYQU1Ewzy6ubxE7KoI
	 jjtQYXT7R9JQR6+4OBBbImh1Wrz5lT8D3jaA1pVdX4Pd6IPm1r6ETyWuu7TFeRDReknVl
	 kLUuNL4eht6X5cyNeEWS6Bvija17Wwmrrpunsm6MNkBS3SnK6jOJundPGOirZJAAeGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Hz8jK3d+;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5260A2627
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF5260A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Hz8jK3d+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso528385e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690475; x=1793295275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=Hz8jK3d+/7oEwRtXqRZMtdhfq7MFY8o/ekyuqOcEE7muK94sJhmnUcxBQ9dqOPU+kw
         lPKv5D53LnTlvPmLXFiFsew4Hl0ljGdeGGbMx/TNOpkDTVmG6646/pNjjfcR5grueRKR
         fZRfj71/1PdrbVJyKenanHLh2JbKLWIOIOQQs0ADAdXsgkUGG1hQ+KW5J++cFTAWziVr
         5DXgKELTQY7RKM5EX7Wrw/bj6Y47fkcFTd1TWYBM15JIkYoEoCQS6PaPwvFIgq4FnysS
         y2GErTSI37mqIeqF2j2TS2Vq4k6aA+SxBdZtKLrxde/ujHMkkMoIsaoNwZedrraMGDHq
         9rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690475; x=1793295275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=D8f+6Xlsd9zN4wc8+SSyrL5AJTaIbHixJM/adblAkuslDlB7dMdXNm1ecnX3pHMAJ4
         mKiTcBCRoFCmklWv8Ia/BDE1xQZY/iHManZ8NW9LoIyflUxyg/Q0Eiw9KITHSM9r1nje
         Bcuwg5oz4/+au7gr4a4V4+ZzdhIvSzXAmW3YOCTU8kAnrOJ+FI02KDDQb6QRGS4sokog
         U0yOREUlxVMn7pJxV/bZVe73VFI3C470C3oUhV1nbiqM/sb2B+oamQh9ANp8h0FFJkwS
         N6Zs5X3+TaLdkYIWUj0D71s1r8rhfieENT+Aq6d+bfU7nmkIaympB5JKcNmh2k+YM1K1
         7MAA==
X-Forwarded-Encrypted: i=1; AKwUvBzthE9chEZWWWnKkhJDhu8KmX8XVfFmMXmKw/3/vGHbtV8+dJVf3z/35X9ZJ3Ur6jJzpiAmrsxGi/1EE+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQvF76jtAjAz3LDyQBSZ5imXz8t5Y2IrSLOzVFetTN+bzgBf6X
	KxW2fn2OFYCADBQa2dkcM9JQ8EVBQGyu3SdSsBBhwtCpDGnxiyJQJonIjAJaPIVWofA=
X-Gm-Gg: AYBFou3bESWM6iHnTPyLGtvT3ewR+jDrKUr47GQI2Rq8RsMiUV1haFemTvlvxPYn1+N
	oG/bRI0Lsk9Xd5TC0bOlTh2JdaoS9BHfvFJ6pK46MZgEOhzAQAB1kM5qofqd0ls/GW3NFA2P+QD
	lMMwlaBoQXX/M/5B92u8MF3jkFmeVQ64Iy8VtZx3QA0tN4Pxy7fFW0m/TgJj+dr7ACww60wnn8M
	rqYebAQ0zjHwgz+P41S3TnvPRUEHKn2QS4eZ1vZB/pmt/J+hb/HsxQHHyeNB/X+BowwJoz4qvjM
	VN+/XHuQfeLtHM69LFYSXOJ22ae7eQQTns7H2PbhhUD0xu+K7OldH55l2C892Bb3Uk10Ds9M1jl
	GlhfS63w9VJoM+33JDkQ9V1Ui8c2kWqegdBBk877J1+OpmwSgXbLI2PQPXP+hYrlHVJdlO7WZoz
	sT5RdBgDFUMR4YxouZb8JkvObXVQe20IxZ3W1P1XDsO/uLX3KBPaBo3KjzwEbtwUB5fsu+lV52/
	9dikt4mkoXmMqftIHQvhx8P4vvd8ND2FQ7b4OwIvFMUpddzkRDQKYDOi0XngXCLC02eLhChzavJ
	nCjmaucMSjj4IWDYR3ceeEd+LqT1bHQ=
X-Received: by 2002:a05:600c:c094:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4a1fdd26e79mr104625315e9.27.1792690475189;
        Thu, 22 Oct 2026 10:34:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:34 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:00 +0100
Subject: [PATCH v6 07/18] media: sony-starvis2: Correct the exposure range
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-media-starvis2-v6-7-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The software reference for imx678 lists register SHR0 setting
the shutter sweep time with a valid range of 4 to (Number of
lines per frame - 1), and then gives the example of all-pixel
scan mode with VMAX=2250 and SHR0=2249 giving an integration
time of "1H + Toffset" (further defining Toffset as 0).

The driver defining STARVIS2_EXPOSURE_MIN as 2 would therefore
be contradictory, and doubles the minimum exposure achievable.
The maximum exposure is derived from STARVIS2_SHR_MIN which
is defined as 8, when the actual minimum for that register is
4.

Correct STARVIS2_EXPOSURE_MIN and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 340f2ff0ef87..84f3978e1eda 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -62,10 +62,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR		CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN		8
+#define STARVIS2_SHR_MIN		4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN		2
+#define STARVIS2_EXPOSURE_MIN		1
 #define STARVIS2_EXPOSURE_STEP		1
 #define STARVIS2_EXPOSURE_DEFAULT	1000
 

-- 
2.34.1

