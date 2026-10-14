Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF74F392E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977342; cv=none; b=fiWjFBo3fSbC3rBlsDvJfkgyBJ01nskrsf6/FL4XKCZFWvISe3atFjQzneGvgvs5M2W1hX9y/2QbrrUvEH11j5vu8dXqeowOscUdHvvijK7ZzYnHjaZMk5+D2K+cAWzqzpLf6+w1Cs7mCzqM274nSejlV/7KSKLv2+Bv/ZQ71os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977342; c=relaxed/simple;
	bh=EfqEyXGvqorGIOi3nlEkrgwSNHUn/0ZDowiAGxNh+Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msS84F1EATfxKpF/BANkWb69f4fRWINfEjNT7x1O78XpqtTLRO779gKMQLloDllnzVFvf06c14Od2qdzbw+z3mODNi6bKYBcLOMaJkeQglllIYxdFUnFQKegVke43VnnncnPzur3cNk9ecVASfvCsJmiJTdyGNA8oNRALYUTpHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSMajkKB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSMajkKB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e915887d9dso11563925ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977340; x=1792582140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=;
        b=qSMajkKBROcAE3YqKmcs3c56hygsg2ruOHWCFNSq8CXrUtDUm5MzMnwlJCszL3Oj6B
         zS/HSC2rb+9LopJ4Tm3h+3WXYQ0yNrnant2i4ranWMpY2Wu1/lT1YRocYVaTmok0kUW/
         aM35HpWCTMbO4aUNZFDRLnt+JnoviEj66why1tNLawIBc2hRNn3CSMzUh3v+p8jcwyAl
         S6X5kDl1Q3Varp+5pj6g1t2INToaoRCu0yar7CGKalIS+pbLAAxWws966Wb036LPnr4L
         GaeJbLstjTFxdhGOxSTDgm+4cSSglN5x19s/ChWGuGH2wDlr3JLm8DOjJcN8lBjJ73x4
         M1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977340; x=1792582140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=;
        b=Upxo0degj5kb7YiqdCiIhYVFcAyPpLc57NA6n3S11PB/AhIHBrjambjwqwGy9eUQxM
         M3qBv/sCL+WLsScHf+ctpJpgsv4CmatXnkoD8e2eeu89aFWxEeIk7yac3joSA0V//65f
         k1AB/ocYFkohvKQDUYDU+HbyMWC1pMz1rkwAQgzV/NfSiBtAh4BVVySWBy0Bsz/mckH/
         ry8Yl9iw1rFz72+51RJMnz4q50+qowBp0IGJirSTCoyvj6K7XoukfwdkLMyzxOos73IL
         Fz1GU8i77TqbteBX4LJ3ND2CGd4cxMiUOQiQSFPacsOYqS09c4qZ7h6cNnMTt527lKcs
         b6YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmIvwOOTKNIvVrAezJylYb84N73uXxmYfowo026zp1753z4BBuKIyu+FYe883Sk3utL1TcQ/ieMSFeEdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3eOOrHCZ1X5WM0+iI7tVCjYuBtzhq/B8xIMniYNMxtGcRfML/
	GuifDLuONNWuo+oCau4iDVvUtH5YUhrAvdeZErFfSGO26WAabP14bnLH
X-Gm-Gg: AYBFou05KaHA3G3S2U8SbXUVA0QEAeKkENlMKMW5EkAH5cSCsc6Fvy2BQgj7WDB3Z6r
	qfFqWdx9GSk/RPxgzzDUqB6tiQnw0NzXFoDHntFFbb2TtiIb7BwzJGv98yPkI5kyZw7JpLdDvuO
	CIcoZLBInZNPryhoBE79zGEf1zzpkvcR6FOdenZAmAEDxJxY3iG6ZjA8v3jQYPhJOZNSvRCnLPA
	ZDjSBd0ymfJjg0zQaN5CrQgVWt7k4cuTsRq9+2rwOXaojnywnv663lrEvV0ynNHEfCIohndb2Wf
	Vix3XdOucM/MRyCrIHmVjvbSm30pbM6geyk96s5M/AFm0QcMaqTXR701LC9PZSSaeWtmdzxA5MT
	LwjUakEVaYm+Sttlr8r+/3OXypbjXtLkdVrJ8QBryrRp7VXjGfbQBYrjLm57z4t/nDCoW11C+iF
	5NaxxWlojSjAVQVGTRiR40k8NQj+8jDdwN6g6wG0X/4gUY5nHFH4DJEie/0HyZP7jMDYVGQLEgh
	afn5j0+UAoIneyGKo1oUunvUiFMe7oSjavuBaz0IuXOyorSHEQFulwP8n++PLzRq5o1bpateJWG
	IQ5dtBjeKYYquQ==
X-Received: by 2002:a17:90b:48c7:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3ab3a3596c5mr12440768a91.4.1791977340498;
        Wed, 14 Oct 2026 04:29:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 08/16] ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
Date: Wed, 14 Oct 2026 18:27:43 +0700
Message-ID: <20261014112752.683032-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_paired_memif_clk_enable() on
START/RESUME. On failure, stop the MEMIF and disable the channel
merge before returning the error.

Also skip enabling the paired clock if mtk_afe_fe_trigger() fails.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 02736949ae6a..4216c47a56c9 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -466,7 +466,14 @@ static int mt8195_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		if (ret)
+			break;
+
+		ret = mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		if (ret) {
+			mtk_afe_fe_trigger(substream, SNDRV_PCM_TRIGGER_STOP, dai);
+			mt8195_afe_enable_cm(afe, cm, false);
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.43.0

