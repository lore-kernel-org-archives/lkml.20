Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DE9492E4A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045135; cv=none; b=nvboGOqyR+aGu/cSncBUVSbzmuF6mZNIxK0dh5alht0CYkFVZe8YkFGDNSa3DT2amYh24H36pd84ygeOVXczPXXaICIWdWSMGQ5a0bYKaYpnBDO8a27MLmTACscY4dsmPlfzfSUWi5D1OACpt7O7AozYnPKU6ArcnMo60nN1BmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045135; c=relaxed/simple;
	bh=1dO6s+nzXLmizG7uTVM++KB2+NBkZYoja2P36FVZ+3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReMa9IsyfTBMsakaAT8gORsLoa2+sbeBTS3Qe6xbzGNzOkcro0byaE4DHaFrUNCX00z+o5S1sfSvuFtF8SbSo5e5LB4aks38SQ2jbPE+qf9MhKiHIgf+vFZmZN/wUxa1c5zA9j2gM/Qlq0Sj0QHApRCCf0ZHvhFPBNvRZNHXfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmTQlJl7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmTQlJl7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso5488945a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045131; x=1789649931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=;
        b=OmTQlJl71DndygFybkTVyLn72bpPxKFhrocG7ObEYqCG+6OSiBYAqgZnRyYLCULVdC
         tKbkp1TPz2oEVZV/RguuLSOcbeY/4sqE8k3NkP9aAE8256P6Pidyq8f63v8Hl2EqP2in
         u3ea4YJFSlvsa5QwzPtt4yU284iBcnrLoNQtWqkc51U8ar2GIHsV3mCvqJnP+e8Dv1Mg
         8Tsm5TNsbp8BdlITCBOmw6vvDQ0Wijc7L3HhN704vVvMeNVxCYZxLjuWSGA0yNuPmHzS
         Ca29JScanFjqmHuYv6Ck2MXp58sPv+LcKk86td5Lhi/W/11Weh3psMrbjSEek6uTfeH4
         LtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045131; x=1789649931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Iq4XFZgztZ/SSg/JPxbN63E3iQJmYKZr/24Kl0mWDQ=;
        b=nBMU0Ps2EgkpWAPW4mTNSGoixxs4dnpFJ+/Pb8Wnf0bCxRv4MlH6bzcZXuKCvBWnJl
         HkJ5BRjf/S2n0ZmAlidW9rCoSeGeHXaBbCM4XwiOJlf4Sbuk2SToXA8h6ssELNUt1psv
         lLYPMckLSqJRy/67YUiUM928HQrYGfDRC8C6ReeLtIOwn/JLLGPNb7oKBu1WYcPXMcM3
         tPlwSO/YjvM84RM5CqlK1eR8/4f060FVFnsqkfNlYqd0NowyOIGDnN4HcWfs7eYUnCWv
         CQiNWPkIv9jzdMqVctux/rdDBlo0GowDfqOBujiDV3AYRPQFu1/t1XZsrx8KFws+62wz
         hmBg==
X-Forwarded-Encrypted: i=1; AKwUvBw3L6jzPza3E/LYV9LQufh17AZa3zggYREF9rHKydQVIvowJ7nr9PxcT0MWVTJrLJddBAdn4U8V0Eg4qNk=@vger.kernel.org
X-Gm-Message-State: AFuF++lydZdXFp55EdwzVpWBV9RDJflafyHEOo8AqKNhR/Vw9k2/zElh
	gxUGJYfo3wiuHchCS+pJbDDkIoH7wI3LsmINHJqayLMwCNER+5UqMuVC
X-Gm-Gg: AYBFou2K+gRsbHU/jOSqLdBllZnoOEKIGmlnjDNEQ3xXPJPIbqK9d/al3Ni421vdng5
	I6alB9WKzwPWmUO4zn1mb2t76TN02MZIevFYD6BT7Zt3UN9yzWpmbI8gCFoBi09vAjgDiqhBKoA
	cUKEn/CiYd7FPpjALSWCdDSpQLKB3vcff9fQCSeZkgjFsYG2KWabSqij6zlbCSB6Qqsq7g9pxBR
	fEf2aESUU/+dEWJhe9ZDBC2qibSgnBAYgtgGOPEJKejX1/Oy22kuIZx7Dd4QX4SCcU1maSM/ksw
	O5GmxsHVsZDHyvIerKJuRYR/oJJY7/6PFKK+IyOZiG+s/oi0e3oHp7L/nInF+MLTbBzwPXKtOvd
	VOPRci67F57jIBFrZ3+/AxZYbXXZXzGsFDIGopZsvqT2PcGL5gGClKWPK3kudEAkDpyS+pNDpbV
	q/gZDr2UQFR2nlo0wvOOntIEudSI2H5iXK1vSxNbFmgwI/69DuHEjp1J3NS/r/xkeJuszfU1Zoe
	5SRfGjA38oHyNeTkzi/X6jQ8u40T1Y52z1DrkmvkZOGfAtAUVYTOU4mIjaYCTuKS/ASenqB/DCG
	BKxAEfMMjaC7zsA=
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr60419743a91.25.1789045130914;
        Thu, 10 Sep 2026 05:58:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Thu, 10 Sep 2026 19:57:40 +0700
Message-ID: <20260910125742.150902-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the I2S clock.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index f20dbb410223..ca7d786cdeff 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1286,6 +1286,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0

