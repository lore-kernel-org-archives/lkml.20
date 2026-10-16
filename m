Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629337F01B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123887; cv=none; b=Hd7xuaY9yCL72Y0vy0OB6JWJdgUZaV80ic3W4o859I+qs2LNxk0Pw7CQnuHNBGH0Fumr6C7VOtyCv/Nn9BSZsTW4jrudSAoksoptEfIrhRy2hhAGGIH29DWQFeFgK0JPBYNFtYAVqyyduJJv/wbOtDkqjd5UGgPLTPYUAqaeGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123887; c=relaxed/simple;
	bh=8jX29D2gDGlcFjhAzB8ItddONnlX6s2Irul3cotnAzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eL8Wh1GUmkPAnRACLCAF32XxJtGZk2bLst+a6qzfIawzMVZSvBoPEgZElDw2er5TEUaVFhr8Zc8I9bhwlU2l6F6MumeUuOlbm6hLTokrY05cyyNbosottw8NfLdjmtrDciJkCZdKbqlQSTAdSxbYBPOUjMV+UQ20ZFqW0X0NcC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J52/XoIy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J52/XoIy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2df8c28a0b1so27290695ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123886; x=1792728686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=J52/XoIyUsku4lGTywabafWXjd6d7yYCdKd1xaJ9iocA+dCoTDCbb7WjF8Aeiljt2z
         xlo1qh2bRSPnY1tURj74frmVpZvzcBD6jLCiEz5/zq40q5lZ+6esFy1LPNuKm/jjhPdo
         K2cza0icSlU+1nVU+6jcOpPgyMVLwX9i/ltW40icm5ctxXV1p1LYgAv6shvsYamMwwHo
         06pTjCR2sVDmoPvukpNojAt9BDlUbqYneQnAYwbKGxmfCyVaZwH0EsBIeI+D+MVd/1QO
         nF2fsHU8VtVDy5/AfohP0taypfgStFwmXg3PXCXzGRZmDgCs13nzUWxJBJAhBRqSvnwo
         xy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123886; x=1792728686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=KjtyORk0zMNsLjPsY7nSZN6APiBOf1wTElTJtxOJ3xU0H5+Ri0U7kOaX0sIuwqHJF8
         RIfuFUJRPhVIz+J+WbKrrvxcl929lp9UIiMpEnJkf3JUzd9cHmTS4Yf1MrmyM6D187jz
         iQ8alK0NIobQhhgoY0BnGZuvE8KWgjSwyZa1kQE+DK5KCwAQreeZ7KLPPS7u57C6AY3u
         Df7wJuT8gbwV3ptDXg5gnwC7dbwhsaP1X0xLd0nu9x++0CIwKmQ12s1D8ZseTXDPslA2
         wstpS+95ygTGEz1Kr004Bp/0DKAVZefmZwyLcjWZXA30dZjGyIaM4MOG9k6Kf6sR30j7
         7sGA==
X-Forwarded-Encrypted: i=1; AKwUvBzqiLB71x04ZPysCxeLO7MAFnQ+Fk/yYeEbmezkbOMmUeLNACG2bixAApwEgoz+QyhKZp91p8hQq6MblTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2pIe/PfPhCE1cULuRMKu8f9zuOdUogKj/eHE9fjT5ROz+1edj
	P8Y6Sd3H8cQoKQ8zBZA8WJMdH7+2VlfQrLRPYjP4PgErb3zHuzzsrSz0
X-Gm-Gg: AYBFou2tvZjTlPDx0EAHiJ2gO9TNgRKfrRYT/78kXazkIehGNnWiwtwCqAUvv6Rllh8
	UrKm5+UIWTEW6/ebfiS9D4PPIXsaI0eBqIIciIl/gbjKw0wSY9RyIQQvIgbnd048uL8SzDHpQ73
	mGxbJaBTEhXBIPXyY67prvPaf2cN0xCG6sc2+qWDMeDCyPGZObC2+ImJMCiOd1v+JNbJnDU5NAG
	gzcq3neTwtjyl2QhYs+QL/AniihnuJm0PF/M2EPqmNDkvt2gzizZ6B+yiPx8CZompbcEyA1iuBk
	OtwIeeeKGVoGxldDm8RnZI2hRAbEwtrW7Lq05mmKD3K94V0YC6YfPIatuTXtRuLd8pEzP2DibFv
	4rYAj+vRELvRVoih5Wp5owXrWuca1XkMRRHbZg4szFKa2HmvaA2DIsPhTFOKHHW1PrDI2vdomyn
	UwwZKgThPdSdsN6uYtqPDrGFsM0/bVbBOV12khcbICdxYZC55e2p6tl1qq0ui1p0PPINGRzbzUy
	5Sf2o9XpsBjKUfkC8FPcjg7bUVH/z72Jqf5EwNTMw5dxZz38N43MZHuwRTaJeqndpb+VfSaRBo9
	3TUBuBqDpLFb6Q==
X-Received: by 2002:a17:902:ebca:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9401ffb38mr56691775ad.16.1792123885664;
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
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
Subject: [PATCH 06/11] ASoC: intel: atom: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:41 +0700
Message-ID: <20261016040946.521195-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .startup() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index db1fb3b26909..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,6 +341,11 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

