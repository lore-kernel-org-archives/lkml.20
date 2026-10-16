Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C072F40DB43
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146861; cv=none; b=Hf6M3nACKOf8Qdxs+d/hpza55lWDCwNlH5zmXRupY2THy7KoAHcfGDmH2uWrm8qOOmdRktZqhd7HVQVRDXeGTBHtuhy3UNtmlIio30Vd45NsPPGdXopeBGwPRiH6Kv/9Kr6d9KowVOuGmU4IbrREXt0MEqA8BLdSYF9/UapWf48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146861; c=relaxed/simple;
	bh=Lsm2KbIv18HV4RCeIQXLw9roJ3XTgsVSD2Ch+2dPVdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFIi9QeWmaY8qHgh+HeGhgcGqm/hbafNTS5w1o7+hs5UN+Nyc8Wi7RAGxTO3bdiJGNqvlFQT6d1bEt5q/Nt4BgD/YkInESaQjg5jc3PnFYkqpMCtQEmZB0mChLR4FTycbTiuW3l73wLbdYVCq3Z2/yr6G4tDWltLRlgtMpS4S0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=l2IBIhns; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="l2IBIhns"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dd33a7bd4so1764358f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146858; x=1792751658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuytrU8KqiyHK1tk1s97o+LClKH4kGJgltp1buUdAgk=;
        b=l2IBIhnsEQXOcG1EaKLZG6TpOcSjNq0y1SPPxdVZbU8Skv9W59zhDKJCqocXYmMGb1
         RpcqmrUpyRLAJCoGqkFil/1JTuk+L6DZQ2rsDxrkGOZvxwN3U2NpJhQy5sRoUq3PuV8o
         UrpUWKpVraeCGdcEmX4CLLMkDtxDTWppb3vG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146858; x=1792751658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuytrU8KqiyHK1tk1s97o+LClKH4kGJgltp1buUdAgk=;
        b=etyUjjq+W32KbKXLNF1LC+5bxwTSvGRhpavd0EQinw3dLkFSiHPoTMNEXstg4NHB2G
         1LDb4uUgsZhNfLDF3f5SG/69HGBNr3DFGs2hmysICVHrEZamEO2Warn3hB2T+GYt3Acl
         Dyqvavw83isS8wpqBhYIWkBr9EAte4jooAu87dRMvnGgkdaKLHgJYCyM7apSNsf7D4IQ
         AHndQ9QxPRxMF+OvRYYuwLTWi6y36A7oY3QZmD+qV91zi3j+/bcdkqukSz+dVZbNAnaK
         JVDfw/bAeq9YUiAj+GzH5Eu4yv25XGGkdq5rPHuD0KCyy1dJkvTx6flo0ZhjRrUhL8CT
         p87Q==
X-Forwarded-Encrypted: i=1; AKwUvBwB364bXZfX+OTGPy3hXrXfw02JmshigTZfIz6NquObiNQTOnHs02h74lNZ4+YmQr9foaZjW1JH4PxR9T0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYtPLfYt5ni6raT0f69C2a70/L4gERU/sv6N1/gRlv9fYV+FiH
	K6LIJKPlj345SWGc/INk5WEHudfvwzuiLECRqaWbWyiFbElxfbBlXlx4aWwc7/IyONA=
X-Gm-Gg: AYBFou3yveLZPqd8KSQd/zMSU7z1a1hJLkLy40T80SS48q5E8dtrRFIYKmGFd+t0MDV
	dnIpdJ3T3Vy2RT3YevEiXlzOXyVdj2HWx/ix4FRrf5VgSwjrPAPn6GxcWOcW13UFsveZHaNrghU
	ZDF5lKIe4i8Z+NxOrM2vZDzu1AJRKac1vGqZ3+/s/KTEacHYjA+rbNm1TfiU0PzsRCsqqohGs/X
	LQ+dE1br0KtpVYx+SRg06wyGRaKVNqXeLkqrQcniB9EsmdvEkLxXQ73GylCwQj3Eqb+Cyyb1tpj
	8WuHQulIrugv1MkeRf43ATtCxsk7WeVkNehfGHwwnnDfE4IqdGmzs2dcigsjWL8ywf+5NmavZyL
	M4rukD3+/m6NJof+VXeU5AoBz/iKYJJ4EMZ+J9rzARZWVzx8jLVlvkR9zGpmrQBKtQZ71O4PJsO
	IyLosTBJ8YI74mhoeErKRmk0VEikeJ/7oluNspe8jxcnQ0OuB0/r8ctQ8SJnKpRMZJp6V41NQrB
	WH3wSPzbwkWSuvQFy4ZozIQltR0xeqaFKkIcc1VN+1u3vUm16mMApkO
X-Received: by 2002:a05:6000:1868:b0:487:27f9:834 with SMTP id ffacd0b85a97d-48df014fbe2mr15102029f8f.41.1792146857960;
        Fri, 16 Oct 2026 03:34:17 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm4024272f8f.58.2026.10.16.03.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:17 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:56 +0200
Subject: [PATCH v2 3/5] ASoC: pcm179x: Add left-justified formats for
 pcm1792a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-3-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

The left-justified format is supported per the datasheet, but was
missing in the table.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index 61b87dab3266..fae5de318b6e 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -75,6 +75,8 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
 	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
+	{ SND_SOC_DAIFMT_LEFT_J,  32, 3 },
 	{ SND_SOC_DAIFMT_I2S,     16, 4 },
 	{ SND_SOC_DAIFMT_I2S,     24, 5 },
 	{ SND_SOC_DAIFMT_I2S,     32, 5 },
@@ -144,6 +146,7 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 
 static const u64 pcm179x_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J  |
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
 
 static const struct snd_soc_dai_ops pcm179x_dai_ops = {

-- 
2.55.0

