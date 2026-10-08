Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865C3BB133
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456026; cv=none; b=VkIJ4tjBL+RijEhbXPfo0LIP7XxWRqvBxdVEVwK5qGIY2hboaUBwXvt+YCMUHNReNTYtbw9BsZZvrqIJODbqHhNPnfYlUs8RJC3A6Z9Sj7+uz3T9rqOl7aBkzCWF6+AFUn4RsNlH4wCKkF02RV5nR0lIWaoDeEtSzesjIq2yaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456026; c=relaxed/simple;
	bh=aAJwqH/KKsd5BFgyPNOpN1XC3DMyvJ2Ee51+WOeaFBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lj9v2gcYXzofTI+bTe2oIX2UFZk/uwUKW2SmG70FlFX33T+GDy1qFMwC7hU5iVJ9N0nqrYS4szl97Zsvki2PwVo4Ev8Y0GSORdcc3CuRiz9aI1tEl/YzOqmIEPN8czro0Tttf7/vF/AVwKawWU1QRqIH52TegxYitbERtY7A9uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SS7a1pS9; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SS7a1pS9"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-34bb8b31647so7925351eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456024; x=1792060824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9Ry8JRaSeFrVq0Ud0+uxs62YoBNOy3ejKA8MS9Fs2w=;
        b=SS7a1pS9DBoSlm0DhOS/1fAUJlyZFY/I9+lakaxya9J3d/uP3acYqCvTzd0ky3Onrj
         l3nxhwvE+9mbFNX7YRkNKKjywakb2Js5DlkEZ6zc1Grhb/LFvi1/PsgPzA5K8zR44+76
         69Bo7O45zkjAJl/XgxhWHm9G8Gz20foj8YtZudvqxWYHhidkAIRH0DdjoamoDPXzb4k+
         p0XN0qpBHoGYQOIdrNcnR/cJmy7/WCpQ35E1z7PrVoO8NDVHZiYW7w93ghBLp9cyOJXN
         MCkNx1YPmQwsJHxSx9giqWXWYjE2hNxSzn1CIXGkM/1qiQ50qkuFMrnFQFnlj16t2sxM
         aWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456024; x=1792060824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9Ry8JRaSeFrVq0Ud0+uxs62YoBNOy3ejKA8MS9Fs2w=;
        b=R13TDhPNpWkjOwUYOTu5+wZtk8FqiDJPE/5OcJGgvRucKbdD498AtwxOBX0/UNAXdI
         3ZgCuNxw7ljzUjAh32tlq3CCu9o3pmXr3KPXl7N9iRAxzPmphLYVWmCYteQZ4pvWS8jx
         9cQFQCgTVGirwtvLskMxfVzyVGeEiEJclE11iW5d38Lp9TPBIL4ZAb7uwFGPzJXOX6Qp
         LNATbwCT40pHbVn4OyHnAtJ97nUgXgox2MQ1mSolTLvHfLBzZKrO8cpZSk66fb17CKHJ
         7PDE1/RCRJjxUznfv6Koeu43sHJ4d7zBSHL/HlR3xEJFzWrD9hnqtuGrkmHrlf10MtOt
         lfLg==
X-Forwarded-Encrypted: i=1; AKwUvBzEFHpMPHje6VbuwQAQNHlMrJIyqKgS+UthtVXbGistSGVUnMx/uLFlq1rRxfL1pMxDKVWMZ42o+FPU/K8=@vger.kernel.org
X-Gm-Message-State: AFuF++kqeDv9NQk5E+Lhqka4iRoLHxVDRrm3QtCT2yK+O95e07xIYo7o
	lTsIkrkRcK5lSv+b07+vZbH1c9Os9hOlzd/pzhjd+6fMWSiWQqqv0xqN
X-Gm-Gg: AYBFou2kyQdXF1vG4y5yc22DzhZPb2j9xmPUkf6r+0UhnF+ivIWNBgYoSrrnmk5qoq0
	Lmr8nsviG4c9lT49IsDy3o9dnuQKA6HDPf6KahYQZhFTE144lmWy5KRfjo9lAX8UNNYjdZ6KCYM
	QjfeAXHysSqtAYvdYKEchsF0LZLB4sQYuHOzSqs1s9aUvZGwc8eOxqxn50vWZzPftx5kZMShbbF
	aFBxGjZjL4DZqyccKmyY+gjTpaUetYoxEyy5Lj3oZ61ulpyW8xPHRMkFkAzTyzaZMNs7Jwnrmya
	dymasr8oAxDZkWKxBnc9oOEOvWIYXLwZuObmZy7InHyvsBdOsw9JneR4ujmuThNgffuilCwW9N9
	xYQKQR4/RZBcnT7P7Yd96m2Is8DskoEK8v/8LcdRdkscmCx+Tm7yxFlbjD+jRrZ5kj1bsaamrrp
	KquQYyy4kr9Ps+Ygy+frDLO6CWYXxjheDhbzCcceXY7haRFg60vZPinjof+wpmTuJNS7x9z14VT
	HwlkOVsSFHRqoJBkoBoRixgZX4xLDVgCu1bHrUGRiYPSmEQkuNclQGajaY+oYMwV0vexbWnC5jQ
	TCTpz6n+ig7IL81XTjcfKNTf
X-Received: by 2002:a05:693c:414b:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3515def434bmr6671263eec.23.1791456022013;
        Thu, 08 Oct 2026 03:40:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:20 -0700 (PDT)
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
Subject: [PATCH 05/24] ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:12 +0700
Message-ID: <20261008103831.542533-6-phucduc.bui@gmail.com>
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
from acp_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4a767b1d039a ("ASoC: amd: add acp3x pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 3f59b753243d..c0481a9ba858 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,7 +233,7 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

