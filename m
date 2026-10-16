Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D44219E9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135538; cv=none; b=beaJxFT1VK012r8grAYOXdBRDOcTK4GNASI5d3PPfzUUwCz2LogW7Nwm2ZB4mMDDsIWxD0XJxxYJ7gZh0yhKG7pMn8IueKAlahLV4YzrB+9dlStGlZ4Fq2FInoWHR2fTVDt35WxVle0EyAgftRL7oq4/RvyvNsDIzCFCT+OoZJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135538; c=relaxed/simple;
	bh=VezvnPfAFk9BE26q/X15JVkhgpA/qwbmXTUd7w7R6OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZLCprq+cBK8xmJ2Tv06FAqUKEzpgXB+TICZlkqvfTDqe5K5a8mDcuIYDOyt7CkNXLQ8mF3EFXEzp8nqQlFJUynOl4Ewi1eHET1tWFrBliQRFa4YDTlrEieI1GCFSlrwHvYwnNSaHqAzrjC/R74OHcZr6ML/CifoosJwYG5PI4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdfEXCvO; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdfEXCvO"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1508152a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135537; x=1792740337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwvQmXJD2Zw06QmGHQhTYptB614fchntA9Grpa7lwMw=;
        b=WdfEXCvOxBYnlU82iv4NQaLZVlEr4CK/9CGuWG9XDAJyO6dLp520oC/G/jB2VqIoQt
         a7877w0IvKrCoLImugVusA+TMJyHgXpJfa40BYaX7Zbi7DgEv1Wuf+gbTiPZZS+Sw2/0
         n006u79hI5eVoX6ckQzVfEwxlYTbSModcVVE9kLC66z7f48fseTfMMj0EWrhUQwdU6yx
         S0Lii/LTo/UQYLc77Rpr6CErH04a1dOHf8syJFAvZsmicGCYFjl7TND8pRQ26rboXNE0
         u8IIZ5JKEAq7ZgkAJQg4PQmedFp91XTKHpZjLRbeayQTpACP0H0XwHdxyzNxGxOcfpg0
         Q0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135537; x=1792740337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FwvQmXJD2Zw06QmGHQhTYptB614fchntA9Grpa7lwMw=;
        b=1sq07lF/5Q7C0cVGsY1w+id/4NHrWGIuKAMU6AGLa1Ol7x0Ukz7zGCVl45ffalnSWU
         O5zw+itHLoXP/LZU9KFLTmvmMHJEZxDJURYNnU2D5izfMPnYGzb/8jOFFfEYiQw/AX5F
         FW0GbFtc7ZMK67o+qv5WLet6xpfZERbwe0HNSxoBAiOmc7nBh5tzGyiRKbufS2c3eLau
         8ftWjswMKiIkFT478qXSLTMs42UVOwFoUY9u91cgtgiZAXloBT8/YVpYrZUWbRid8Ub9
         LXAfnJWJYyevJTfPNNqZJk+jcQga5Mu/Ocv9MAAUO4UpY2KgJi0+Wa8SwovrEsa8sZV1
         HE4g==
X-Forwarded-Encrypted: i=1; AKwUvBwJi/MnGKo94gjGTR1+agH9T1ouxXAEMwrMk15R/hCdZH97fHTJIltmu/t6VJ5FMujB8tZmwFbBs/7bAaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJCvprKSKihQjlm7wOTlRvToCVDMMwAT4Bnor2rFTTVnrO5a5h
	1hv7K9YySgrf5OdezUd1ySo1pFREj9FU6QkCtpJEkv2Ys6WMpDmg4Pep28Z+bJGd
X-Gm-Gg: AYBFou1hwvZmEvQVlImqtk8BOxw2xoPXUxonLut8/IH16LAih10zCh29KQxiSPpRXaJ
	dFXTcgaHg1bedzRZVKSNXhBiU4WoX6AaoOyH5s7C126LjASMWEKjdnY7+04GhHdT8cpAULFfukl
	HymPQyXFMC/6k9OSIqbCAG9beCZXyjpB9We2+6eaEVZv5XfCGdb3smCUW6+R3lTbcpaJqU85gvB
	z+H0OZAt//yqfregP4DRJh3n4hyVwsWzR+HAm3m5BEzdTw1yVEH6edHO9Jn9WwTIf9HOkBDaGXS
	GIf9ksARHqn5tbRtr6RG+YiWFg2HJ8yrw+ZyWz3A4X3fAHcBHahWWnGUVDAo2RXWwHREQ7UtYJ+
	v68ztVhuwQAunn4HzwQpAMUklYcXmX/cV4r9ocC5Xj0Uj1xowsEy7Od0AvrxGDW0e/Sf7CrGdgx
	U+r4ZRRRs62AlRB8qiCVt9I92vr9BJGY5cV+O5utpAi540xAwIxg9sHe8WAAOAVlokg4AYuWxSB
	l2mYmJ8zQmnLyJukd+9u/+ALe6PN0bNMJH14KIYG0GI48Y0rzsRF6hukZM8WNT/OBgDmOcxia0=
X-Received: by 2002:a05:6a21:1585:b0:3e1:1faf:eba0 with SMTP id adf61e73a8af0-3e16be93a96mr19817283637.44.1792135536737;
        Fri, 16 Oct 2026 00:25:36 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:35 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	support.opensource@diasemi.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: codecs: sta350: Fix definition of Ch2 and Ch3 Volume Bypass controls
Date: Fri, 16 Oct 2026 16:25:19 +0900
Message-ID: <1107a42a563459b26038bdff4d8f6e2423816d0a.1792135144.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135144.git.sammiee5311@gmail.com>
References: <cover.1792135144.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each channel's master volume bypass (CxVBP) is in its own
configuration register, C2CFG and C3CFG, not in C1CFG, which holds the
channel 1 bit.

Fixes: 2439ea1f0f8f ("ASoC: sta350: Add codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/sta350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index d2b6f73d5e10..95aee5aa2bff 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -477,9 +477,9 @@ SOC_SINGLE("Ch2 EQ Bypass Switch",
 SOC_SINGLE("Ch1 Master Volume Bypass Switch",
 	   STA350_C1CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
 SOC_SINGLE("Ch2 Master Volume Bypass Switch",
-	   STA350_C1CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
+	   STA350_C2CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
 SOC_SINGLE("Ch3 Master Volume Bypass Switch",
-	   STA350_C1CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
+	   STA350_C3CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
 SOC_ENUM("Ch1 Binary Output Select", sta350_binary_output_ch1_enum),
 SOC_ENUM("Ch2 Binary Output Select", sta350_binary_output_ch2_enum),
 SOC_ENUM("Ch3 Binary Output Select", sta350_binary_output_ch3_enum),
-- 
2.43.0

