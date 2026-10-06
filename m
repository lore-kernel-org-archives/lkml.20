Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9853B9DAC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281814; cv=none; b=gUQtEAeJLp3Kebnw/FHuc7tapsxXH2p0NIIoEIZUTXNCkIAXvB1rPNGXv11KNJlFU3Ic73tUslfXdh57SI1geSzJ10fxt11J5M6kXeulEGHDqGMbwAn0vkWMHgjh/EIZdO66HqgXQsWXLwlIo3b23ryPSETOGvekwMVpQgbtxjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281814; c=relaxed/simple;
	bh=H3PDzDrtO5c8WYmCowPyg7cQ4FV1kL+eaDhtUert0sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVEtjO+ApTz0yIZMAE5p7d8ndo87+bZ1ucZ4RSOijmeXo2epIlKqIEZ2B+82QEaZ7AewBQNOyjVaG3sevAlVytFFjhIYumN28aUppFQURAiu5QF5XR3jrSlGAsFWx7aK9418d6iNvgNODUgT0cYHl9cXUnctDe94OUXgv8yWXFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADvQQykl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADvQQykl"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-884062f3296so247091b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281812; x=1791886612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=ADvQQykl1LchdSoLvrzhY899sxtdDcGqK7duvhOAm+5vTGZdeE9rsKm7NrNYHvL/bb
         WMmhmW2Dkq4hscUS3Tpk5zqVrnyFC5mKIo5eyiX/wCowHSe5VOCJX48vHpFe7/8nPvKQ
         JCsrtVn5Cxbh7pEdSIy4gPIj4B7uWDmuBOay1lJrgUV+YzJxcSQSI8uY3Vaj3w1rVnKU
         vvb797q9wzGwR1nVRV0g+0y8FMMlkUgXWhcRp8UbekiS54Zfr1odr8Fbx4nAdlYGB+N0
         QnH7EjilExwxxVZur7uHezwt+JysddJEheWE0DhPoeg0hugDSdp3nqCNaAA3W3UtQGrV
         FVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281812; x=1791886612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=U9iTyrqWK2HOAxiTPQw0G44/eTpd0DMhijQv9US7GjciEZKl/VTi8Iebm5YFVx5e2w
         BL6XQlcqIzN6jLgOFqir3U6Yr8myOKwmAEy1VZV2pllcR5J5gyXefuJmN0FCbCCX/3AJ
         cnklw4yy7RU9xVZs96RWxfM8lsfh6QkZAJbwSOhs+Ar2UyRiDCQ5fMFJN1xFPgdDaqzY
         8IfBpUw6SRZpDd/NsHeyntBl8wcjPJLnJG7MHjY2w2DDq45MsEN0ZzhX/cLSLkwSBDGl
         S0LMxvCIMFOMCnqczOSKHGg6VhsWe0kcnBaoq6pP1f9lfiDcyl8bgU+oUXABPkO51vOM
         mIfg==
X-Forwarded-Encrypted: i=1; AKwUvByg8CsY0Mz4NlF2qC1xENRGk23/EyK+EkNlfvMZsNhQmpWmImgrh36oIsVGrrrTLuhUDmXSLTG8JbwMHcY=@vger.kernel.org
X-Gm-Message-State: AFuF++mSbBiJjWIusHa8sMit7TZIu9PduKJ8oovYXh7L4pVVCs22SeNt
	TYa6prbbiHsJaDyaJNcGOUeWyhTyweXhnWjPuVnDzvCniZLo00ogI9uA
X-Gm-Gg: AYBFou0LGptMspvd9JYeDbHfpdTzoLRo/BG9SyDAcaXLTHPDDDcyd93GiACZPe+KrzA
	Iz1zScGSu0P7zLDursQaC4fcO2HwMCnbwjz/+ps58qnfgdsKQbLqaSzz5/gqQUPnRrOVw6qgyJn
	0B/rgQ0sNhg679ySpNkeSN1jIbh+TTKeH+qNP1LjU4akdmQ8gCnIkoSSgpL9DOVQd/dnDo8gHtE
	u9kvGpSOVzwehrGraXYPzCz4+0cbISGqJc3NoFfZ4qkQd4GVc/QoNzk8e4Zse8NnuD/EB8ZNbQY
	H8EBRJFXJy/cCLSnacJMcdzsilRZ+3umxTU6miVKvpBKQkV8KNdkNNjV7wfq0UGh7o+h8QaV7VC
	RORWgCfHYqE5UoeJKXp1a7L5P4dN7vwtiewQmq8OQ4B8zONM2nniRoHs3ZuZstLNHXk+vzYstKf
	ByAFV0CTky85xUfjpz+p/fezQzISvo+Wm+LkiSwbkcSapcJNoxTwei8lVSAt59+OyEMATvih6tT
	0MYLmRbelvOMG6WGx2QuvDR7tHaVyQWXQvRsaG7TlEWNI4WatvtA2bdiaJTmm+s0+9QLSNCVx08
	F9yhAYN0CzNcLA==
X-Received: by 2002:a05:6a00:2d88:b0:888:add:a74c with SMTP id d2e1a72fcca58-890db797184mr887589b3a.4.1791281811950;
        Tue, 06 Oct 2026 03:16:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:06 +0700
Message-ID: <20261006101606.54079-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8365_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index e9497246f37c..314235557fdf 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -514,11 +514,14 @@ static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
 	snd_soc_set_runtime_hwparams(substream, afe->mtk_afe_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	mt8365_afe_enable_main_clk(afe);
-	return ret;
+
+	return 0;
 }
 
 static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

