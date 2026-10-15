Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4820E3242D9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028692; cv=none; b=l/6Y/VmXdATz0lhxTbx92AclIXO4hqz4mL+8Za43+WPRmYoj5HNfMg/I+jqLJ/Axv3ybyGRBSA+hsk6Y+K6uFnsfKc8RKy3xbYusv4K3faRvrjrlSqOquHsjST9RwFSUFzjHxUFCn2HTyoAby7l46vgjcxMTu9IqlyKQ4lprtPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028692; c=relaxed/simple;
	bh=Km52EVNDvQaSKwDMYVVG/cG2sOqJGio6RIBlU/DT6nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTQkLBsbDP4mPV19jRmWcfV2jdZJKo2QXb1VgBdzpMQs11MDSu5YC9V8iTedfVwOtWdXV/GCtJIlpOXwEk2azP98WQZ0WcfeP9jOJSGP224Cqwmgum6lfmkfmOWwfd3HROWAgrMfnzFIGR+YTVhCmPl/lzkQLsdqwdDaFlqSgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPEPY8oh; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPEPY8oh"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so25005795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028690; x=1792633490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=EPEPY8ohDKviNzy7dfhjRCQ0o9Hot1Yw2Uf28WHydz54n4T2A5IpXM6X9KTK6569KA
         nfn432Ggo5eHnR3vWSzfg5sZuRRJ650YXWWQCnMI/XDSfGGOBUVd7tz2rl/4fNiGqcui
         y4nn+VXGwO2tSMxxdB97TAq1s2j+lgzs4JwpKM59MfKMf566+NHqf+R9I78n+Q4pTIf+
         4Li30fTygfPbCrD7GggYkgN9nuOE80FDFyNXcHd9C03yhZXT0Gv+/DVhwklNqprxLTgL
         bUJu9eMjwjzwI8gJWRx7MAM63jYn0HHHoSZRNCH/+aLt7e5BfMtw7VOyxSgKaSzKTaoW
         EdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028690; x=1792633490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=w1Z3UDb49Gzy49BuWxFyV/m6zCYLcBym1YwEzq3WsCCSlcr/da9f8Uma1gUF7d7g27
         +phnfNFbb5R+h33uk55uSDycsPaJpUS189xMb/EhNg7WiFzUVQ+yvaiDtyc3TFBv03VV
         YW0m9KrBO59GpIoEnmJ/DHT3duFYuTtSX9eePcGJcNmmLZxsdrDepKoji5Wg/ogTnEc5
         GZ7OPl/0Zes5opo7qO9iDVsen9xmJsly7heex5Wddclv3r33k8C1wO/833E0b66R4cS/
         LZZLNsk15bCwne1i3Xf3cU5WcpSDKtWmxmWecv6UgmIRoiP7AWN5hkNYxu16xMqZCa9O
         tWIg==
X-Forwarded-Encrypted: i=1; AKwUvByqv7tau0aXQ+y8sW/A8n0OlwkvMiLRQhgDIC47sjJppxCr8lxvYykKWAmnDA0rtl6saAB/30MlUSV4FPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoPxeqLfh2YBnp2N4yXG4PpoHCqX1W4ubnzd0VAT+dHTB6IzVC
	9ROMh7G3px3iGiM62Ri7tr+sZ9KiGCHJmfQIlobLoXRWyVlfXsu+cBO+KEE7Hg==
X-Gm-Gg: AYBFou0vtGunDfqbcc74y10kc6IyPL0KKN/bX71NssgmafYERwm9EsNFZIOvJD+GVD1
	T1WBjYROtUSkFdtSINhZBt9VTil7ftUu+tjbNhccoEE4XLHy/Zry2RkLX6RzuLFbQyFuWp2D7Q+
	fnRl1eX7YWGcjifkjrJz23rZwJDEF+AzOPRCRJDV1BKLX9ioJyOFU4qNtG1QjkUUXPmARGv18OJ
	AyE/5nk3Y+RZicgbt/UaTpM69dL3C/JF7J+s9mXX2M2Uejh7esIioNbTYRhsXolaY8etd+r+Tsr
	grzOWyNz8l1ha+Lf1LeQRwQwaVFvxOxjrOFTVnHPBXaUqHllVnK31cQtAoXHMavWvR4E+tD4BVF
	rXHMUvc6U7yZbBbfFn3r4rxfUZJYh2JrZATVGhTBRCtBXq5yj2SnVVg5Lm+sczw3uaqh+gcmrZd
	wdVMCXkZMv4Dn7yd+uJuiqqxHvcv5xlfACIsouh3fs6wTZzerrShY8SLkmqfUdV2HTho0LMNEWL
	TLfVcOvANG9jcqkBfYFaGBslxdtYBWAyfyQygatRkMaPFMbYyIecWIrOU+5H5/KhnWgb6v8V3Zc
	DIQ3GciEIRDeew==
X-Received: by 2002:a17:903:3295:b0:2e8:dd9c:99e0 with SMTP id d9443c01a7336-2e8dd9ca60cmr47644535ad.40.1792028690053;
        Wed, 14 Oct 2026 18:44:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:44:49 -0700 (PDT)
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
Subject: [PATCH v2 02/25] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:01 +0700
Message-ID: <20261015014324.5569-3-phucduc.bui@gmail.com>
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
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..12c341e89bce 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,13 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
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
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

