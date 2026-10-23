Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751320;
	b=3Icost6DYEg/JnJA+Kw6/AW5ywoIe4ToOdckGtv0COIvlhzPUGMp/RGagsXSYEJ/Pbud
	 69sjq4AMKbi+vzTTGBVuD4rz1rXa+T0s4tTy8iQazWz5rrCklum+WtHMOOlhtgda5d6WM
	 Q4wLEks/9Ep5VmguyxAC3lR2DvzeZnxs5D2I4+Iz5esn2ahovE+pP251fynS5El+QG39B
	 bFQUH/naVheEVBTuYC1Gpj3fjSS8ZPJFNw37eh2+m5PI0+iFgoEWoSy97ngmYWqLomvDM
	 QDd0a5EfAOULGz4hBKGmO3ony63m+eJkrqjHwntRZyO8siRsEuEPA4sBbelrawxiicQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=;
	b=Ewko+9zEpC8Q7snVceYUGElauKxS2Tl3KAjPVc6aFh5Lw+SF0bkobaKuwBIswdXWjtbJ
	 qYN0Huh22X1dNhWQsoPqkrOg8HTq6Y/FMZS7f6/uTXU+S3Hx+K9tBLgJCvTxqisgKVnsp
	 DSem03rUF6DSJ4iwrSbxBWOD/ImzxVznNWoLiUHRYv1WVgpbF7ISrai+TAdWyWqyjxOxN
	 +cpKPUvHLgYlJg6l8GD11s12b3Nq00wmwDd/Xt+zNzmZg6uCx2+107qcrMaewPscWNlts
	 hYM0j6FzSlL9HUX2PofbLwOlEfLmT7cDzVCkva2P/Mps0DWGqGH7yklj/VNC+LtmttA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H9aJsCpt;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A79B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H9aJsCpt
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so567808a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792751319; x=1793356119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=;
        b=H9aJsCpta1HcQMZyGsva9k65fBRiHIKNlWEtbpeJxhwa1ZwRrWlWH1EXNdkvmkVbAP
         8kykDM54MThG3owuPigfW2euoL0Mx2fqraJAgvBSTTrG7FAyPGlSciggdpFLRnTlN3yw
         cKb/w8bFvr6OFrGBm7rs6UW1wAWVkhpXNK+el3cgNY0u9I6hf+7dU0rUy5/uUhEFNAA+
         0r56WZmYhQ5L3hpDAlvN11nv//HstzvuWW6jgrXQyL72HVXm3I9vIL2Ze5lJghZ+So28
         8GcOMZ2fnyiiEgImBSD43bPoqqAjjJYl0QSTOmkarkGNJOHogU/g7awtqDc/RrzkOeHN
         rt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751319; x=1793356119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=;
        b=w/+mt5WzA+jB1e1+TetdAywdkIrqbdFE6iBi6JO01a6cQYd3sY7Tp6JvbrWIAStv5k
         8kdGlY06qXXZDSvH7PoSveMyavS1CgspLdJz1Y/ptRAH4TM/T2OQelDpOOOOJdXleR9a
         vcnAiV2rl/qgN77IyxBsCOVXB7WBWuqPs90JZ1J7NUb3RnqtxjMDwFdAufsrgh665LSJ
         p7/Cyi8it+6DW3iygk8afVmW8HRMuS9w+bPmyVw7a5K2Qi3L6UPBhCbCXBhMorbsj9cj
         7bRAMwXFERj+plG5aFzBTs+5OUHRJYnMhFU3L1RXs+FDskMMu00C6Om0sKZH6KU+1oGK
         YcJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqeDdoYpzxm53X/I1DJabZLCBRdv8oOzxXScPH6Sxo9rlB72CXb/DSqToMh/naMjD4dgXx1DYk/dlApCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxm0PRRiC+qePQpVxhV6YiZXbP2i+DojOX7ZD13PQTcmFoQ0t4
	YCKq88iPHJcRXTDfwYuwqbfsou6PJvcJPRDaoazOKDahUclHC4lYcsTL
X-Gm-Gg: AYBFou08ElhUo5wuMjfkDlX7TzFPIYde4Z7YmNr7ZRy2Px7o0NKVPxqm5r8NmFuti7t
	LKceOgnfl2Vpw/FG/3tbrKbHcna91z2GspT1MRGnGY4jPxLmLE30cx3A6/NSy5lpnRpwqx7Uwq1
	xVqtRLdS3b16SG/CKSlU4dW/mUU5LEKR+OTRb14+yjk7ocUYS5Bb5Ad/8rm1zL71cgZkFB4Sy2i
	qWH231PNRtFfHTuAOXLbroH9JQ/Sqfbsi5WqRsgGltHwSLJnkebyZ56VkPiILhzDSf+GlclSb30
	UXOiUBn7d14y3v9Yc4Qcy+5ls2EyAxRXhUgPl0gvfMRAkTFHxrxZFmq2KS4FYi2HGomEKlZbGPX
	wqtOvtWbM8cKuilLZY7EoRAs087X/CrvO/spZHXFZfafjedZLAVRYRLlgkAqTOJMum/KuaxG4wJ
	OTaYTjwaXNFq2BWzz8HA8UsIzWVCTxfrLh+b1DzTUVGVaWrdIaj0Re6v7sy6Ul154X+7KyZGlNT
	6BdgURQwRoD2Whk27Zz9kYscQWZ4yxaea3XwspC8z5PJyTL0ufzTFBKtLrsHXFU/vzk93fBAwaM
	Ue7kqYw6fNC9iMf3EoT59cj1a8XsvUHRDTANI39LN5N3+j+kyNsrMdqlwH5W3kVfGksLPU1mRWC
	teVP/8Ugn9S0CcJxE
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1612715a91.37.1792751319402;
        Fri, 23 Oct 2026 03:28:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add263384dsm1074082a91.1.2026.10.23.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:28:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params
Date: Fri, 23 Oct 2026 17:28:18 +0700
Message-ID: <20261023102818.523331-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

xlnx_formatter_pcm_hw_params() does a read-modify-write on XLNX_AUD_CTRL
but only ORs in the new data width and active channel values without
clearing the old ones. If hw_params is called more than once on an
open stream, these fields may retain bits from the previous configuration,
resulting in an incorrect sample width or channel count.

Clear both fields before writing the new values, and use FIELD_PREP() so
the values cannot spill into neighbouring bits.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Compile-tested only.

The field masks follow the Control register layout in the Audio Formatter product guide (PG330).
https://docs.amd.com/r/en-US/pg330-audio-formatter/S2MM-Control-Register-0x10

 sound/soc/xilinx/xlnx_formatter_pcm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 304220d9aaf5..781508aef885 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -6,6 +6,7 @@
 //
 // Author: Maruthi Srinivas Bayyavarapu <maruthis@xilinx.com>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -55,8 +56,8 @@
 #define CFG_S2MM_XFER_SHIFT	29
 #define CFG_S2MM_PKG_MASK	BIT(28)
 
-#define AUD_CTRL_DATA_WIDTH_SHIFT	16
-#define AUD_CTRL_ACTIVE_CH_SHIFT	19
+#define AUD_CTRL_DATA_WIDTH_MASK	GENMASK(18, 16)
+#define AUD_CTRL_ACTIVE_CH_MASK		GENMASK(22, 19)
 #define PERIOD_CFG_PERIODS_SHIFT	16
 
 #define PERIODS_MIN		2
@@ -506,28 +507,29 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 	writel(high, stream_data->mmio + XLNX_AUD_BUFF_ADDR_MSB);
 
 	val = readl(stream_data->mmio + XLNX_AUD_CTRL);
+	val &= ~(AUD_CTRL_DATA_WIDTH_MASK | AUD_CTRL_ACTIVE_CH_MASK);
 	bits_per_sample = params_width(params);
 	switch (bits_per_sample) {
 	case 8:
-		val |= (BIT_DEPTH_8 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_8);
 		break;
 	case 16:
-		val |= (BIT_DEPTH_16 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_16);
 		break;
 	case 20:
-		val |= (BIT_DEPTH_20 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_20);
 		break;
 	case 24:
-		val |= (BIT_DEPTH_24 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_24);
 		break;
 	case 32:
-		val |= (BIT_DEPTH_32 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_32);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	val |= active_ch << AUD_CTRL_ACTIVE_CH_SHIFT;
+	val |= FIELD_PREP(AUD_CTRL_ACTIVE_CH_MASK, active_ch);
 	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
 
 	val = (params_periods(params) << PERIOD_CFG_PERIODS_SHIFT)
-- 
2.43.0

