Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773C4FD781
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977388; cv=none; b=MWo4s3ZOR/HlJx85AIY7Emd7ipz/LyiCluOjzCHhe2MFw39yyd/6aHJN8qlKD62Kl9X68ZqEGotOX1s5D2s4l0PedPJvf4pgBRX9vNxh85+ZydcCDDtUOrkKC/TFzHbYCZmckeGoEyPpdZhaxQpUcHImVS/CWTbzeQCAq+/+tzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977388; c=relaxed/simple;
	bh=9vaWp1g5+ohNxdTNzyTbJOsd3dur6dmaNrd/5z9FORU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X17x/2Ivg4bWQnMMrChiCZ+jX8pccbrRQhEOtV65y66WlqWtwN8abMfKsncwvSltFnUXDk2QH0M8gkL+qeHG4xDpuqntpzD+Q4AAGzd/sm/MrBLFk4lziKCBV2Z5y9Mt3VNFuryJf/pRgzs9nzhbLZTv/EvGPAYD1y4fifjdITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di6ASZqe; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di6ASZqe"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so3024404a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977387; x=1792582187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=;
        b=di6ASZqezICL0RA+LaUKOin/8as6mA15NxkdUJyDC2lsTvjYwwxwWTH37IKEoGAPeo
         ybHWDcftlBTzk2j6Srdt91pYmf5q8CH+KrUMSdNAwEcu/zhc+rNj8NcLTDVWeIw2oPGj
         NbiHU2Vz5W7ghVOis80gGj5Csiv6DE6gC1C8ucX7sApMn4BGEtLw+HAqmcumzlop2L4a
         wjNGxPPETQ73TFQaLWNkDBPuJSlsc2xW+UhYnZtyRQ7I8uu1cjq4saJY9ObVd6TDgRko
         ifO/D7MdJRDQkncs4I7UhgXDmpbEH8PJv6A2uYUFlCOQYE/gTvDE2iYL1445uRVOXiS7
         5i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977387; x=1792582187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=;
        b=Pshi6AFmZO6AwGtH8fTkE7ELge4e/20jF0pltgYdO/QSznLLVWSrvGMLZwjE7Z97Nd
         ry7S26LeA1HdH1YTd1mtiYnQGsdGd8gs/qE7/xT0s2kdpxsRAl1UMf8Ko8Rujk0BkTPB
         jomphQckH6z94jtI/OfmqiHYHSgbilH0+MU+pfaWQZolRE3ZmPDsaSt8kGx094Bt5/jQ
         7uKyUFzZZkvMF6dYilf6gI8OCok/gxk8P9tQSkCFmD1FA/pBk4aWywuLMFMeDOcoI/bi
         6aakhT9s1Rvc5sI5rOx4yENL392UzRiHJb3ydPDtkhvuOgBsON/zUWO8L5zJpwmadNGw
         YpMw==
X-Forwarded-Encrypted: i=1; AKwUvBysABmYv4cXhbY2+Psc5tf1qVvcOVpMRw6mgdG1Ra+kcrD8K0lyTs5cFDeQCRcUVBtzXbXj8CVqBztSycM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6N5dq4BdyuKCis3uHe3pSPbgAR/uAkjN159EyT3/9u5eUAtD6
	Qr9CtZwVetwcFM9b7z7qYGdFoEV8MnLpkgD0slikxxCtpRf4No8ecV+C
X-Gm-Gg: AYBFou2hHqX/v9W/YR0d3Qbp5T4TSgPPAXDYfYhmNX/YsVJEGypoHGnf92WFwbJzpE7
	MAKK9GbaHE1vOK95Z/vcQO4xc3DM7ZAZ3NyzwsT9lZ3u2iWI5MsA7fOmYhOQ+bnZ15s8BATXllY
	uCP3T0/oNdwahmW1NtdVTJBscV/R9aG7OlqnUJloVh2mnbAVex3sbN1Im4J2PVaW1qWbOgb5PlO
	sh5XQ9JoejcUBzZ+GFNhwwyyAxj2miRh5QyBdfl5sBFeg4TrqgX3H+yXc6knR4qdOWPotS20iPJ
	E8ub8YZDNtwB9NRiBofRd2GepLgveWIJ4v0PxbjxrwtXRd1nwTfAGdqeUNLsO2RiVOKWzfZGqhE
	CcMVqlWz2Uwle3e1lsAGQWtk9CYQ4x8A57wAKhALyz7dP/q2G03KbBHY6r4UrX4Mu1LQ+28qcq8
	F6a0P+vWcfVthrA+uMvYeypSv7qLHvIxNTiSOjl27ILgXq6ymTDzTItp0U6hIZuKAsDWMn0KMs+
	yZlMc8U2OOYu2TvXrsXbl/jRpsbkHD91Yx5qAHOFJaV0svOQhRqnorYCtjZMPbUIxZNJZJ0ejce
	a3ElJ7DYTWmkhw==
X-Received: by 2002:a17:90a:d44d:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3ab3a8d0e98mr12992962a91.42.1791977386685;
        Wed, 14 Oct 2026 04:29:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:46 -0700 (PDT)
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
Subject: [PATCH v3 16/16] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Wed, 14 Oct 2026 18:27:51 +0700
Message-ID: <20261014112752.683032-17-phucduc.bui@gmail.com>
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

mtk_audio_hires_event() ignores the return value of
mt8195_afe_set_clk_parent(), so a failure to set the clock parent
goes unnoticed.

Return the error so that the DAPM core reports it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 -  Update the commit message for the DAPM error handling.

 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0

