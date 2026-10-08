Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486F3BB12C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456156; cv=none; b=bJXR4rWkPa7Pd7PrlDXpeGR+XEP5qet3bXJldBEmB04GAlBjW+szUpJmRY/pR933LCB0KCSXkREgoBc9muBHQvPVn5yJav8S1TMWFzdCBD+clB7db4rBv1crk9cFwOaMvmTE1eTmoObHFAS4qQAyYHyigzsBbQvlqNRfXVk/+IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456156; c=relaxed/simple;
	bh=jz760ztqgga0RO/+vAvDuVyLPPNpmX23pq1M+Bivpxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fU5efp+hEe0e3JJUO366XpX+hwgNaplDkTPgoWebk8lmvGb8zF/V8gt8d6+wFYzoU/0crpu+JbB9rqihVgbatpYUyTk2f7oQlDMC0kL5Ih2p+0UUtNeiN4+D9mHtG9DcfGN7KRKuYSuG7WwYkAs2H3X9xrHTvkcxnAlcCaw2YB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1/RigIi; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1/RigIi"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so892119eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456155; x=1792060955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uc00trQPX7RuBM3kvjd0hrBbedJ5QhnOwvfpAMsSqmQ=;
        b=L1/RigIidDe9b6f1eq2d8lq1qPCC42BcSjCm1Wqbe6Rnhg7fTQ695jWveXlQx515bC
         mP+Y7FrUqiPmKmIbz5qx/bGqK2DVBMWpt5JsYKxcJhxEK5CgrodWfnTwf4f6PWdlGrIt
         rgFSjPdZuuk6admcjRXBWJQ6pxShwL/6gulJT3bOr/ReEvmKH3CeJ1+mCckm6A70Cbt4
         V2AUB+qDPreuEMFpzEc/RczaW7vvBHC8yref9DddyhK0kmgmGm8rBu62HtVK4+6t7J2B
         F2HNyXW22o36q6kRdaWlEKuxAuhXLkQG08bG9aamTl3U41lTgfLAQOR3qVm016Mfa1GU
         Xk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456155; x=1792060955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uc00trQPX7RuBM3kvjd0hrBbedJ5QhnOwvfpAMsSqmQ=;
        b=x4drHROqg17RO0t44P6UeyhzhQs9YMK3K4qTUFlZdmJzmg5VAQxvSWUwYDF0RyFOvx
         /VHqMFZGidoE5Q2+uvIMl6Tx2/Q+CxKddA3GP/mH0NDrIi5wgevdWJvvz9WNr1FmNyri
         gGzg97a+3jeS6UQsrpbB6Oi3uiNbwUTYHQcxFWRXnC+W3zep5uttX1KztgNComSFfZR9
         eH4AHGjhYVaF36QxHc9E/B5AIz+ebYccghNtNk9lE/papDgQYiBwod+bagh7+5zSn7HN
         oaUvmhzdnSutjdWQDAYlC7WRprgXMVFfazLgfDbo0l8gzzjaWa3oa5TKXcZEOVbmjQBE
         eW+w==
X-Forwarded-Encrypted: i=1; AKwUvBweAQrCzoqNW0G+uMZuUoEcDMG4k3IXx6IO+Oe4GgzsAPc6CKO98M1Nm9faATzB1i7B+5E6jix6Ztiph6M=@vger.kernel.org
X-Gm-Message-State: AFuF++l6TUqAzAknAfqnCNAPf/inBv78P+Cd2zNYWdBAqE9Ekacy8pCl
	8kZD+VxoX+PCxXaPQjl+ZLlN0mH3WYRWDEmEZjN8+Lu1KZ/1/reM7ElV
X-Gm-Gg: AYBFou12Aag8VDYsKdBpBB3ciju2b0rTFOtjqEIyzmF1CX8rnMO1bBe0s8hEb7m2jyu
	Po6PvJnPBIlav5/nhbea6UMaZcJu/nxcRuncyD5bxZJM0TzFiZrRR9OPZVYqx0pD8GBGI/gg1ww
	Q+Mxw54kphAcZC2f/irJziu9gEStkHx8R+Sjf17amYc0pXBmoPNg8NZpKxPx9z6a+tieE+SvlPN
	71nPv0eSY0TSoEEuioUhTX+uj47hF2k8Qi7GKYnIPZt7ECTM278gBjsIo/E3aNxXJcRQ9z2wtdy
	RMMyfDx7HbXy0r2JrHFttnPj7SKhIg48rpFNVSjUYJtCj7jmpTcfod1YIJlmfxKbretZ+q38Pll
	wP/uoeAV7qJs3P7ZsqnlIGOSdLfeaxmvoRw8vnVT+E2hh1FYJyhm5mtoGUrHf9A8f+u2BCcoGTG
	4WZr3tfUJJ1vw25Dn9CHkYYDQ+0Zkn1BgMiFcqVbrhmVoWJly+lrEQRswZdL5uJkdcOS9oytRT3
	g08H+SVob/iBEuCl3Gi/crorNxIVmPdjHou/Ql9AYTXQsZ1T7055LHoIgl6V8uQ4aVZYnWOtlfC
	Xu+6WYafF46U/A==
X-Received: by 2002:a05:7301:d194:b0:351:28eb:8cd8 with SMTP id 5a478bee46e88-3515ddee11cmr6279341eec.18.1791456154501;
        Thu, 08 Oct 2026 03:42:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:33 -0700 (PDT)
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
Subject: [PATCH 14/24] ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:21 +0700
Message-ID: <20261008103831.542533-15-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8824_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8824_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8824.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 853eb9472af9..c89889aa420e 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1061,14 +1061,19 @@ static int nau8824_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	const struct nau8824_osr_attr *osr;
+	int ret;
 
 	osr = nau8824_get_osr(nau8824, substream->stream);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int nau8824_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

