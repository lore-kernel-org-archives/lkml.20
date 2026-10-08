Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300C492E2D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455980; cv=none; b=XQwUG1G1KbENcQGTp+bAL3wjiS+CknU7SscpL84m0+/JCauqhES9oJH8mezjnppFjfGIg/S5pvgplg9L+wKH+TGsb+voYE29CsyCIvw4NUOIaJqe8ZSY7ya/xiKl0cGadoNLQVJJtk14MxulcR397dpXKLo+d+bLN7ztk2ccNbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455980; c=relaxed/simple;
	bh=M5phZ5RgYLMwqgmoz0IyXZlTFh80R5DGK+A0fLhzSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWWGG5oPRm0MlRayj9223fsejdTXNW/vSgCcSJ3src7OPWD2etSd7W7VWSpkxV+k1TbXVRRJSXM/SdrvcwTAxpIa6WmZtMLYuSUY6og0t8F9NQpZgSRP66BRWOk+ra/xJJ1IdlRDjqRU4dRBsqrUT8oiuJ8z0ZU8KMDNWn+axU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJuBPBY0; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJuBPBY0"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-34ceab2900eso4961841eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455978; x=1792060778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=ZJuBPBY0UzWetl1adpdQpGpjTZM8MzEW3PeoI28gQvWvGtuP4FGZ7iUu4ARvksXjkj
         LY/zFtWahOB7JyHJ5T/BKwk7YF5Lh3xpsiBtXqzlc37bd4yJaGlKBajMWNDIVFLV9DDi
         3S3fakrlmk4+D285Cb9Fej6TEEzmssAIYFxDWqlJmVisbXyAPGOrF9yYXwEIG2mRLa+4
         xEJA0VHZ3u2N2SruQYyNvCmOd5kV+Ew2ECHn9gNdNH+ZgWgInTVJeY5S0PLBGySZ5Tsl
         /fahBrWsZjWwdsWUqulMhSkhJXTMB5EPf8wJE0c+dcOroFQYix+Ytdr7rCSYmZKhWLEx
         sP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455978; x=1792060778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=zJutoUxdWMB5aXoZJkYi7eTCTMLvlACyghVihCmo58Zy29Zc4B9X0nPK+mwzvu5hhE
         76iaDgbUJn3HK1oUNUJJQslf8s9TjtCsh7Ogbzvo7el3NH5zunmyZslZjyzDcqDYyzOE
         anUFXpG6+oPcr/U2St9oi4cmyaJPxJpnTT0Z7TgJAThxvlf4wJ4xtJIrFsdk3pEiwC6u
         lGERn9LAritnNaJQZvnJhLpNl/BZWCo7nIz9Vc8yw7Hzxc0fSQuIXtkK6qJoXD6nvBWt
         5eTXNpglwkaWqh+BhGEiNc6T/fwwyFCmNcxj4tsfteAnfTj9BTurtcU9upC24pUejRfT
         eOiA==
X-Forwarded-Encrypted: i=1; AKwUvBwVt1+jZHqajX7kgGiaFg4vBCY0OCdJhqdARF1RfSjnwCDLWZDn80OHEwi5NY0FzpK35h8seAThZ5vHFr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlIMxZG6Wp++JI0HAES1N61EvTo5cTjDVTG2IQgAMbEDMe/j/E
	YximzEBBtWiyvM0MGStTWSrcZhyY4zk48ZB7oPBnwPs3KEFB1qp9/pF+
X-Gm-Gg: AYBFou2Du4AturzhJNNW1bTQnOUrp7R0To1Gr0slJcpE3oLIHIOCdrSB8XGSGHC3n5D
	QbrAZhDI2ZGEGuH0ehWLCeLJZoruNOkx+CVIR6Ft6qjXHRWXHMskpYXZrDjEls4gg7PJMd+M/K4
	HKsXRYkQMhCTb/VqBgt2l5+dBUei2JEXRYeolbQZHywzmW/OmQ3uUslLXdy5tu3c3ic09aw8E3x
	P9FnWFWxETk7qo2UnpRdgdrDRcrrkN3LQ95rw2KxUxkGJpL2MqQzalXTQlKYeNwkBXGal7NWDLL
	/FmaC1QgP3FqI3VzyLNPBp3S6v3oIiXdghXK2xNAvX9eG98omtNs+IqY8Tu7oEY7aWTyMZjN/L3
	Uyjc/du7c4yMJZgrE/D8f8DGqt4hoo7BlKS3tK5eAnyVl+MtfRmctpi0tyQIdr1h0sW40lv98KN
	xJYg4w9gAslEcPGtIJwyrck7hzM4b264V20Gj677H54c0rcactRQgxKZAYUDMFCzJDICuV5+ua7
	KYtBWiR/CAJm+Xgxn1uebqDWMtRErO58K2KAbsNSz5dSvHfcZZPYXAJ5BX06ciCZIibbrwcjpKd
	lBYFOxUuJ1LfN3lUAJNU+MQ3
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7231654eec.9.1791455977867;
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 02/24] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:09 +0700
Message-ID: <20261008103831.542533-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..28e0686e9373 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,7 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

