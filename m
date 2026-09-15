Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDA83DA7D4;
	Tue, 15 Sep 2026 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507089; cv=none; b=MHALlLS96Qg80e73rYcgrY8Kb+MJx7AiGqGG4oRaiE1x3cCmK2zA8mHvSzFNaGshjyYsvIIe/7CFZov8ZVNTX8R2qBneL/BRIoU2DDs5OKcQVlqR3g/D4JpcbmLJe5ijod5X9oJDdsy6zLMKGiT4Abfw2mH0hHHR3LZv22rBhLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507089; c=relaxed/simple;
	bh=IvwePUymeJPBMNiuuR2pRocnvBoaUEKhBXwB8DohXLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ATVllxxWXoNno8kmbG3Tkm8EhTx3zVrZgfo9vOKEApZySkUdJ3QbO58hx7i/KZgegd/pI++ChYt+wpMuKBvi9npIwC7Z1yx7jJr3m1sal0A/H0UcHeKQYwhmDtStFI/NYy1gUX1JH9skOIHj6kaSmrfrmSt5f3VTQmA4ItuDoVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5d14+gR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5d14+gR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5AC1F000FF;
	Tue, 15 Sep 2026 21:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789507087;
	bh=hL1joWPhHVhVyMZu/lD3e2ynyMVG23kqa2xy10tpX3k=;
	h=From:To:Cc:Subject:Date;
	b=I5d14+gRKoONLeviEJSlSn4DilTTV82alSN1rE4BVDHMe7FHTlSjGaSy23AGiqrs+
	 jubfX9i3CSKeut22pqODEVe+Twh2RFZchudJYJq9/Zhdnhk3cn6xRD6kuC3vUE7BiT
	 Hky2U7hfLcBFVCD/rGIx7GfKPwWJU4osNO61OcyHeKgUU0OhyHK6IDdVqSxT4MCdgJ
	 6xZK1hhwEBRMX0lYyD6QcB/UwHZAi5OBJY5QkTNwmP1MPwr+B7fsyK8sTx6XPDzNyu
	 yI3LgPdETvoBC/6zrwTBZQPETEpMcryqxFFJOypRrO/pjx4tWyh5AgB4M55roa9ZzR
	 o3AdVeIrCcPGQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Julian Braha <julianbraha@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
Date: Tue, 15 Sep 2026 23:16:34 +0200
Message-ID: <20260915211658.1671821-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting SND_SOC_SDCA_HID only works if HID is enabled:

WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID
  Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y] && (HID [=n]=y [=y] || HID [=n]=SND_SOC_SDCA [=y])
  Selected by [y]:
  - SND_SOC_RT766_SDCA_SDW [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=y] && SND_SOC_SDCA [=y]

Add this an a dependency to SND_SOC_RT766_SDCA_SDW as well.

Fixes: b50ecf5873df ("ASoC: rt766: add RT766/RT767 SDCA driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d3730c4da51b..35879cf79472 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1992,6 +1992,7 @@ config SND_SOC_RT766_SDCA_SDW
 	tristate "Realtek RT766 SDCA Codec - SDW"
 	depends on SOUNDWIRE
 	depends on SND_SOC_SDCA
+	depends on HID
 	select SND_SOC_SDCA_HID
 	select SND_SOC_SDCA_IRQ
 	select REGMAP_SOUNDWIRE
-- 
2.53.0

