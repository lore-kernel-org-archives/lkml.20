Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA324353A66
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028762; cv=none; b=qGisap/ybD87XeoOqcuw9DyV+6j4KboVtzXHHfmUPjn3JdanS876DHC/gnw/RUSn3og9Gvu9I9pSZ3ft7k1RwKTEKoFj9+LRv3yPEQDL9QWGOj7JV0/puYv9BlhHVYpUwSr2ic8mp3JnYvY3vKuA+7Dp1O2SiUHVZs/Gt3R9md0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028762; c=relaxed/simple;
	bh=MChSqGnxO0vcLQoIbJBZYB9F790qawBg1rHdme95xaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+QCrR45FQn+9yeedSN6QPo3WEzlt9czbxKX6OFFTZcyEmpb7ltHaHnbHEagCA0xbopbDSt/7/B7xn2wlP+5iIgDLv5dTI5PRmHBLMDxXTv9SRnu7cWRhsxeeXpmNaBk2ZX9lcG8TmkxxlqhmegItRQ1PwVdvRoQa5sjUuvYsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwX3UICF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwX3UICF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e95bd1c14cso1944035ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028760; x=1792633560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+glVHzZv3mmREWfVKTa0Xbh8v/mgn1NgWb1AqzOGiM=;
        b=ZwX3UICFyz/GbyOGlt4Joa0eIN8JVA9a+6rDY0CrlJh7p/6bMiDZ1xt1QT0VYidwCD
         mAGelWvLoIK0NtUQ3J5vqf1KzJ98YC3OCWPEo2OsS5EGSQc0NeH6HSDHFUL3V+aTmOQS
         3/md2hXIFK8MNOZAVbYIXFOJRPOuEHA5uSsCAIKvT4s+hvxM8nKshMEguyxsUVd7/Uv/
         bDSxSbiqefsuDZkaKUp+EXDcR5sBf+BwWKMgPSIwYnBVfUnBVNejSvWRQWiieg+0SoOO
         yOpXVDAOem3eHQCcut8bfWs/GfRgyL0BTjowKUSxquZlT+JVcbIMfzywe2u6HTIZwXEe
         6yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028760; x=1792633560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+glVHzZv3mmREWfVKTa0Xbh8v/mgn1NgWb1AqzOGiM=;
        b=UtQbt3ySXFZj4KPDHtFQ6MM27kL0m4xFxhf3di1+VZy81NnaeCLeU0IzVPAyIYsAol
         DnZbUXGOSM3QfuQ3DcM4Ot8AQtW7RL8rxKqq+IL9ZiuLwxq/+iCLfA9zwgD+bVQLNO6g
         0qLU2y1d/WLHJklY1hJPaFxho3v9oVTp8J4b0ihqV1AT6o5lxvaO40XCbCJaN0OAxyt0
         8cLzA8zi0VL9EZVD/75x5tV0JEbitsjwn7zGt4dXvEjdpSxpcxphiuBpsn/8sMA1+zw/
         5bDfDHQEMSr5vY03VtpBHfa+RXQvxKNIq6QwvkNRWP7ozr7xSpiiq4eiq0tLBRd9jxgw
         H+WQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+qronBzlRh3vltcpjQEdzyC0yxRcyr29AkNXeX8KHPCSCM/dRiHrqEeNynvLHSqLmhAbCHNjvG2EHJjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1PFrZePDGzzm2YOhcbh9LReeGE54ngK3uRj9MgfB79V3EM8aI
	6E57xSgXmQhuLA2LI8eeVfrMpmDLY8tXG0k4nwfMRvO1nLIArVhb1aMj
X-Gm-Gg: AYBFou3LM7Dbv29F2oV5/PUFLnBHe7vvfms2J098Nad3ZHpOd+Qt+MdguVEi6PBBWdj
	wXSrWE3LZZ3L+e/UBJmj+kLYo8cB8fRLU8C70vjydKZ8sFY4RflptKAPmHGVAn+/ODJnWo0Ofza
	ewTjE3UNOPQ5Jl4MOVgqm1d0vZy8/p6YY1NZAV6SRb6b+utNWO2k/Rea7vFEBZYlLgH8Grz0qJR
	OXTQ08gAyqO2tVMK+dD372zA/vkcWiz93byrgIZJTk4XJmet1OFEdLImaAODitavNwUO6t1ET3U
	557qtXFWeHo/+9TNk+4ldBsKwmSvH2BHBoINTNIokltSvP033BnWrLQXdyd6eY6jxNPCUCr7hmC
	7dIBQXCmhk1WqWBa59gmj9P4Uf+IRjfM3PuO2Gn8FANOTqCAfxImeAoWfnFdiZj0nQQMo/hNKf+
	BlVX9KrbwzUcyow4FA4RCIe4Ptin2LsA3V0WNqLXwi+M1MP3K0sDPDO8vsA6ENuJ/PnZzHkrFBB
	40wKv9AvLP7+NhyLYv/WO6hhBG/BQ7F0AOmS54DhjmfUod1t+LuJ5W38+sa/8AmekC6GqLbR/xv
	lB0rQmzjdyKzLRU=
X-Received: by 2002:a17:902:ccc4:b0:2e8:695f:96d2 with SMTP id d9443c01a7336-2e8695f9ae1mr130100745ad.25.1792028760086;
        Wed, 14 Oct 2026 18:46:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/25] ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:06 +0700
Message-ID: <20261015014324.5569-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp6x_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: ceb4fcc13ae5 ("ASoC: amd: add acp6x pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 40c4d833f4ed..cba2509faaa1 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,7 +209,13 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

