Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71665476060
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040645; cv=none; b=AdMEs5tFQyfq0lpUFF5Q/Ky1oBgT3/gxeqm9aQXwhJMMmwdcrwMlmyc3u+I4lESlFOsM/X+1sXFrJvu2xxZrefE3lNhaUyeaecb3H/xC9DtsFYwHFfYkGqqQsLFAAG9kyAO1of6+/eB1ROILBkiz6c6eRTu9I0B+kg/zuldg2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040645; c=relaxed/simple;
	bh=PWJqb0oR0SEFtUil+dz679UOpPkGYh4mN3pxmk0E1Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAIfdDkBNj8yDK1zr441e7Ib5iS5Mi3aOtRaDZtWhpGf+PxoY9OYNZjYBRW/Z0283JBBtJk0mcyv7IWWP26aT4gbbnM91oSTCCm2j1PfFw004bmEv28fy77iNhq6FElYgGwCnUFSb0XEbdr74NdVQoBd8NEPdJ9udiBZ4JdDjJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3YCYGr4; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3YCYGr4"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06b03so13178875ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040642; x=1789645442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=;
        b=B3YCYGr4ucbwpbDiS8Nt4xwKx4hqkqH7K4yW2/IuEkwhEV01ZQSQ5RZcGHemIMrbUN
         t886S2021BHWWRz41hVl0y1PMi0k1jlDCl79xWB+WWwIu/YalYxnxh4f3KAFFvAeyu+4
         3s28cp2YVFc6JuBlx2r5ddYHV+7qJZzo3q4GsDg0e+MmoZHcI76OwUcFcM452Ker0ezx
         zapxrRFCeAeQ3IMy+E764UP+6Lm33gd7VpDAaZeqmI9/lRUjLwTeQpwlDQKRVc9y+d9q
         hlMw0wyqV3lU27g9lkFayvm636EYvCVC7A9CWR9ysYWeTsDuszcaMKHHCMCtxDtonGx/
         cNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040642; x=1789645442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=;
        b=RDY3faBIB/upOAg10NYCvTB6ZANbU6rtHFif1Idv2L9jkifQMrs4S1I1iqeOez+EK7
         SO4fWBzhz2kLsxSSn3jVIMJXw8E/AoROmpitrf/mYJqjYQlTIfKN9U1M2puoDaU6dFD9
         ZGMpWup4eC+yKlM9c90bNRWwvyrZ3Msa/zB9a8Pi/NkaSdK1RSW+k+L6MzI7S42ZVFDU
         EIpLXZ9zSSs6799yrwbzykJkMmnVbth7jwU4zyfZCPBlpExNITUsFn8WH+vHjRbI9eEc
         QOtou7RgM9fWvIlfpzOE7QNgZ+m1T3HnnwkYYt0SnCiLUa/VyxHR8nOHE3urI+3UTlSp
         HBaQ==
X-Forwarded-Encrypted: i=1; AKwUvBygG7SaHh9L/WjBiNfU7QN+FWO5QZdN+KqBCob9GapgQ65hFI+mClUI2AizNUp1craT+s53O6PjtrRlW6g=@vger.kernel.org
X-Gm-Message-State: AFuF++n+AC/aSwqCkQ2/vSFqS9JLufM2W6giExR+I6I0XiamkwNU7CT2
	M147GJdQm3pzCWfwe8sWewmB2csKcJescl9WYBb9HrcZh2GavGHttpLZ
X-Gm-Gg: AYBFou3OLem4zLyesgmcwSX64x86UzNDgC1gP+q/rGh54lhKXDZz0H9oxfzb57N0BoP
	xQxkJwBsoEpZ6vVASasA3ri5wQtQpb8tDROx8nP1OLqdo8LVmIr+Lxs9UH+YUwNd5ZJn6vzmz36
	PHnW1uCVffM5IgeW/FOtzbP7VHXUzQ0+7q5YMDRw5LSTpOGA+agFZD/zpMPDXNHKADjW9LNEksT
	Bj+H+xgDjCXazhJMiNQP241tBJzyn/LLHqQnjxSAynXGC4r3mbShUV1v4rLc4VES15cQuMnWGwe
	DipqUUWxb2429/ch/PTXgRVIQ/DbJ3OGpXX92rb06HIm+LRt5Egr3YlJllsqoeZ4Gkw42/F4lbZ
	Efs3+qD6gmSemYRcOGxusnqv5RuWOwM2KtM1cUj8t97ZVziPJBm2hCMB9W8ioL7pmYEsV3hi7k7
	79QJIRNnkH1aeVkG8YCIGwpo6KyXYXUSbGvUl3zuDoVA5zO9EjwGVliIAKKkJ7ZB6ISPsD6aQqa
	4WoSCxcb6PEpHWrq3FOVb6K/mDjO0tFsfv0fcL9mf02tTOiiq+NAoI5k5IrBQI3OTYXzZKo4Vbq
	V7yid7upGK5kSKnWLrCks8pxug==
X-Received: by 2002:a17:903:1b6c:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2dd0dca9c9dmr43423175ad.0.1789040642448;
        Thu, 10 Sep 2026 04:44:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959fd2sm87427155ad.23.2026.09.10.04.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:44:02 -0700 (PDT)
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
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: mediatek: common: Propagate PCM buffer errors
Date: Thu, 10 Sep 2026 18:43:38 +0700
Message-ID: <20260910114338.142682-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910114338.142682-1-phucduc.bui@gmail.com>
References: <20260910114338.142682-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_afe_pcm_new() currently ignores the return value of
snd_pcm_set_managed_buffer_all().

Return the error to the ASoC core.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index c1869b38c9e7..84218d137143 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -151,11 +151,10 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
-				       afe->preallocate_buffers ? size : 0,
-				       size);
 
-	return 0;
+	return snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+					      afe->preallocate_buffers ? size : 0,
+					      size);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
-- 
2.43.0

