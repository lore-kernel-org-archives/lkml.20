Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5633E35C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123850; cv=none; b=XB3ZpxDJMFL8qOkMlZb4WaULY3YpfkfTZEx7AJGHboY+zKxu9Rmjz4UKJlR/6KHSOwm/sEpvVjdNPYuHmcXOGRJDsYUEmq5/eoAXQzSHp9Pw4uQMPnDt5zrW+unAe+tC5oTneKk5pVYLpqkUYeCum24GIiajqdVXFoKgW9uUgjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123850; c=relaxed/simple;
	bh=vdLtUhxLS4lGvufa56SD+uGcYjQygq5MJ/eIX5HtXec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmVchzIdga+9ls8tlXksfKFsmFbGeY7ZCiNYq+9k3aE8Ea9pdC9gFR9tG2FdCs6BN0kOPW3ABTBHTnM331QUu8kZnx7i4bpV+SQy3lHzmtCF0JeW0YOEhiaEl9PBAs1oAOgrh/SB5doMEwBxDpnL2BmKjEmBEiTGBQZK/Wg0cwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrXREDEy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrXREDEy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e49fbf92aaso35795415ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123848; x=1792728648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRXMnaMYG3V2xMcW/3gwqdrm84/mm5oGaOhlRKzj2Og=;
        b=OrXREDEy4e8LCR6YNk+OfX5+0ZepyfMKD485p+FFBs9iuoNX5695HcxqHjBfUsxjiz
         tKZdaK62mKivx4RTknU0w4cu2Yq39hfUhn+wzlJyHSZ1BIW9eK1RqpB2DxPY0k0n2MEQ
         cDSPdezfrQj2AFFDbLP7CPml50PPcPMqHAxKQ+zfeKhR8JsmnVR6P7XxageoaMeLVflP
         rFn7USMVE6uBbImbYbHcaUmrIv9ejQ9TBd/2zu8hKArHTKSRXLSwgNcGDHhZRqsy6gnr
         xn748H0ho5iquKqM8GGa4ikw71Db4EBFzNeHiQ1c2S0nPErR76rnXGgSDiN2pXUFvPfe
         o9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123848; x=1792728648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRXMnaMYG3V2xMcW/3gwqdrm84/mm5oGaOhlRKzj2Og=;
        b=MCM+gmZnz4gMNYeX1SCWUPB8yOhBmrZcz4DgK0aqoBloH5mHX1spNSYlsVIIIRy2fH
         Fcl9mQ4Vm8B2CW7JMI9n38VwCOENlyA4Urz9+kFu5725CUGVGjZQAzHVZGZuRNISPsCa
         uBg/HT5/0Np5fSjB18pFoohtZpAk5UsvdUf8+ABjFIi+0mxKbWknJPjdoUwpgXtQHa64
         aEEzTcvRp84Z1sQ4fhhP7Luid1BzFWBkJvb+a+LwKnAn++qEEHWBezX3IzHRblNHf6iJ
         89MsDKQRFd1aSU77q938wrsrzxOsEnl6jiDcM8COqyG2BVl3ELgxFdnfrU3gBnQk/zOU
         sBZw==
X-Forwarded-Encrypted: i=1; AKwUvBwrhoRr9Oib7bTUr/DFKDqvZ7j4EXn/V9ujlp5CYTBqp/hmRkZAJdW2/uPt5cZsIvcyCbzsPmL/fhbXQ8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlAxNAks1M3+ljjm13RewHE0ABXKF0BJURrYc5tiUTWbOe70sr
	N5wDONW1rAomfH00INbE/RsJq1zyGtHuCw41rbGiXMPGloGC8ihKMEMX
X-Gm-Gg: AYBFou2ZsJtvlEC+hnUHn9PqI/20liNaZ6YqR5mawc0G0zD5PM7cwKewWGzB3Gc6ap5
	t4LbMhwtcvU96+9NoFggWBk8v5nwzFfGflLbTiGxoiY/DazblJB2anK+B5wvIJfr6rS0DcDXszu
	mdRm1inI4FeZ/15GLox45F8JjxqZOrjEbOZKhg8AM3NW65Y8LyQhrAd4RRXyRJckcLhJWaNV5ke
	Y6RUUZNCcKlMuA4ljDbHGXJ7cBO+uKfwEXAHcyFYQdk0RPvmvy5skS5eOghLNZt+VVpAmZzTj3D
	BprUofE5BHyIO6CeNXZNcjCHuj0HlCyuUQ8yrUIOcbDsJT2GwMX9ezBnyWm21l2WG5GgN2JSN44
	VqivUDtMV8I0jlYp4jDZQfiaDGdi0KvudpPCljBdiXSQj9g3ApCDEIcd7txkCT8KSH/FjHL5kEM
	RX4dKFW7ZoEOgiSKyZE4jKZKnC5qstqv7/wH6PQWkAFj4XuCx6hRWRmPWMkTcteYkZ/2b1wHobC
	dAsqM3GGroETR6f0K+oCya7IpDFKgeAKVmhT94c4tQqDV6BhJCTE7PKO8bFMGP9kZklrwoUUVMJ
	UVb9Muksb+44qA==
X-Received: by 2002:a17:903:181:b0:2e9:842d:3c34 with SMTP id d9443c01a7336-2e9842d3dd5mr10658595ad.13.1792123848458;
        Thu, 15 Oct 2026 21:10:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:48 -0700 (PDT)
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
Subject: [PATCH 03/11] ASoC: atmel: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:38 +0700
Message-ID: <20261016040946.521195-4-phucduc.bui@gmail.com>
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

Add a comment explaining why .open() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 552bfa30d4ba..4cedf2ad934d 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,11 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 
  out:
-- 
2.43.0

