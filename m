Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464275;
	b=Ys096vW+w72vg4oaSvYs0mSBezMSr69qxTBsrWYsdUNFYer6L92Que48oSLHg+7DokYS
	 aFnr/swXNHV37oB2ELz24e8/1au09RwYedbJ8GayZ7UONyItFPSYp2UEs08Um1m43Kw0j
	 UFLCYY8MUn3/OfIQGyQvOcfCMCZb8uNy7Mx0mH+8l6oyoNK0wnILePVZLR8r8ANnzzbg9
	 xgfOM0axJRngCYs1W5X60rvCJrmgfCL66Hl23uG37PVAU4QAjgdzRx0rpUBDZNbNKvlVn
	 pHH7BdZ8cOlaC3ZcBbvOc8vdosq1wW0BAkVBMTcwoL+RI6MiXSkgIEvzr//qBW//Ikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=;
	b=itoI1vBTDoia54txudAtz8ehod0fBt5UvOKP5MgSLwz+0sAz1921gy8WWT9POaPeAWC6
	 k/9gdqmLPfD/eG0dAz6wotSJq/7MX8/ikPYaqKE27Sf/7JT5deapDkeCj6s+PI7vEe99L
	 lDwK1dh3YxiUpDlQ99NPe26V0ubafRl0aFwGospl23KMChMTN7POgRNkJJz5LNHPmvZw7
	 OtuvjcvrN5Y5JO9b3Lb12Uu8WlEp5mx7rZi2EAyW28tNs8xtOsYWdp/ZXcWqi3p6vC2Lg
	 6I5+zbwFImLst6uAiC+iRjAp2Q8FofVjg81K0aPTix+Nw20v6wZj0QP9xjWWiRJJJdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFdVVovd;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473AA606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFdVVovd
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f3c89594cso301485085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464273; x=1795069073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=;
        b=VFdVVovd26XR8Hw7PPlmCXnU3GapQuadR3pxFhYsSDVJZUM6Ls0lNvxrLi4QuVzmcS
         xE/2hTKFLm8mmW4bXWacpVR8wC0oyQr6xsXCZTR/YPWsxEfJ9xZub4+EoMjEYY8CA4qW
         N3n71cUlDYiWrxav4xa34MoFoyjlrDLinlYNQGo8TrLDWyeU2nmxGzl3N/9B82P+WwvJ
         omF+imwo7SWeb/3Xd94sUrjWS+CC7ER5meuxOy+WkqW5JwjfKexSN0ZphLsKmkcEWa6U
         pNpUuM2CFrkai7ra+3CI+XH17Xa8ilMbr9GcMuHm3KDDNkjR6Cup6X54JPquoclnjsEz
         r+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464273; x=1795069073;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=;
        b=dFE2tS3kLSPBDuf5e2j8S9Owstck/xHWLQAPkrwedHxDgLiTeefE+POB+rGKtYWKeG
         ws4oOLYdpOg2+NHpPZTTTqBcZFLVzRmruwE5vsFhG9gHCOJTeomWJFTKSu1JHzAg14Zl
         kdEClHIeLv0OQjBXb1xi0M/tMA2IE28f6Q/vdqdrWgko+At7EfGDFKo+ghn5TtfFXtGK
         r/6Hrrn2wxI8YhiVqwww7PZ5GoGuDsEcDoXyqr0H7jb8ZzQCNmM2/BMKCvxBVAHtKbFe
         F96oUhyZ6MqBfx7E5y9+LcUFhTk/yEVt8d884AX04tHVFWheEEiOcMsj6kxiYPrUv5vW
         eXOQ==
X-Forwarded-Encrypted: i=1; AL+hErGZJx4e2PlzNxOa2GAE4suqLQ+izrY8SjUWF2G1IRHyIMpbE+HRjvVDwgL9JzdJfr2qSN2tiCztg6dbs2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CX75pW68GyUnPof7KINPuNqOUoBY257ADsCoTT/O5TUq//daI
	ZVaLsj5XLfgpKrqbqNkDE7QFpPAdECO0duc95km+sE3aZvWXBvKREoI=
X-Gm-Gg: AYBFou3m2WAL/ZeP49Z+j85abA39EdHlvDyFcU1iOh0EKj7woYWFoVanvgoZtb/TsC+
	vahQTvYHMY+Z+5H4KbYl3T8OPG6HPjzA0SvsGlkBRgPhsY4UzoX5sAQ3RcW2ExwaByYCSN4+wZI
	7+mifZzgcLZkRRtYBxzW1SdHD2mG2+7gNByhkIV7PyGS0Hdsl52v+g1OR5t8nMdJjAesskb15fN
	4THhmHHi8HetNMrnA5kh7W5MLhTgmNScTJPg3/xMRyLWE+fjDklXVQ8vFusmEgsDRliOiepNwKX
	XLbmGABhNHanJjUQNXqsm5EygMtCT+mXOfQPYpfPFbGMp3U5FixMlXNqLpxhrFDLpcTvCb6dh0W
	GsqO5Ne+MRGZTJ0Fo+8D6ZdXmkbFvCjsmtlfEu4MwAdziTJvk4iMRD4OlvoF0RONID80wSVsKA2
	V6Bw5Y2xW/w2wMTCtiF7IyhhuGJwVkGnKs6x5pQYxjamwjO49vtqsp255KGzNX7jEEAB6+wpQdM
	D+fWRbYQUePyLUbXr4Jj+429pNbad8khZubajdSf4jz8CNFAAqwK5ulWvVkpBGNXY1UH6oOcoqY
	wkLj+0sBGpr8MbQ5a3/RUMdLF0SxP279XtrMDHxDkbN0yof2bR4I/U//OJBD5A10vTAGVAUdcrX
	90slXrHjGPfFXgNRXDhNj9yc1XIdAo3bT1J83Ar9Uk5GaiXeMAPesrPe5Fs4oWnyAWCiVBzSIDJ
	ZSbaG0TLmcN/Dm8pU5RcpYXL1VI/8ocBGJ
X-Received: by 2002:a05:620a:688b:b0:947:a247:6afb with SMTP id af79cd13be357-947afd68101mr819573185a.13.1794464273217;
        Wed, 11 Nov 2026 22:17:53 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:52 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 0/5] ASoC: mediatek: fix AFE IRQ registration and removal ordering
Date: Thu, 12 Nov 2026 01:17:44 -0500
Message-ID: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes IRQ lifetime ordering in the MT8186, MT8188, MT8189,
MT8195 and MT8196 AFE drivers.

Request each IRQ after regmap initialization so it is freed before
the regmap. Where remove() shuts down the AFE, free the IRQ first.
Also balance MT8186's IRQ wake setting.

Found by a static analysis tool under development.
Not tested on hardware.

Changes in v2:
- Rebased onto broonie/sound for-next (cde5523c75f1).
- 1-3: removed redundant IRQ request error logs and clarified changelogs.
- 4-5: added MT8195 and MT8188.

Link to v1: https://lore.kernel.org/r/20261011222234.2098904-1-mhun512@gmail.com

Myeonghun Pak (5):
  ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 42 +++++++++++++------
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 10 ++---
 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 ++++---
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  1 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 16 ++++---
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 16 ++++---
 9 files changed, 70 insertions(+), 34 deletions(-)


base-commit: cde5523c75f1320a55ac1d55a717ccbb566557f0
-- 
2.43.0

