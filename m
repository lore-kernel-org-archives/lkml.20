Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8244E5342;
	Fri, 16 Oct 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.56.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164588; cv=none; b=joUH5y9B66EbM2qgurfQhQrVCBJqCR7S8fSyO/QOBuQ2UWDCkG0+iyuAWK3d+V+GjFxZxuxl5tC7BtIa06K9NpUea980TMbdUZlHXk0P9ZXo/mdXh/55khFKLcYoTBizaDVlY1SrSrUhGymETQZ1hKYdv9/22EMpU7HKRQrXUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164588; c=relaxed/simple;
	bh=Kfslu1dCXmPnXz35ypjj7ABPhPeATSy5mff4anrV34A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYUzvZT+uGGDhFQv1buS9/4E0CN9JAHtfIzYDxlCIxF2V6h/ODwciASypWiJp4QrN4fD7stNTxDjSEk2GFd4DgS9O1CRrBycigm3Rfkc+BJTXhla/2dF0CnD6fm5PlCNykgYPBnVvS0M0/I4+30sbPxFN2Ln97sIFcxNNY0I+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru; spf=pass smtp.mailfrom=ideco.ru; arc=none smtp.client-ip=51.250.56.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 831E3204C20B;
	Fri, 16 Oct 2026 20:29:38 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 8A08C204C242;
	Fri, 16 Oct 2026 19:34:09 +0500 (+05)
From: Andrey Karelin <a.karelin@ideco.ru>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 1/2] ASoC: codecs: wsa881x: propagate sdw_write() error from bus_config
Date: Fri, 16 Oct 2026 19:33:35 +0500
Message-ID: <20261016143341.417876-2-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016143341.417876-1-a.karelin@ideco.ru>
References: <20261016143341.417876-1-a.karelin@ideco.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wsa881x_bus_config() programs the clock divider for the next bank via
sdw_write() but ignores its result and always returns 0. A failed write
is therefore hidden from sdw_notify_config(), which aborts programming
of the stream parameters when a bus_config callback fails, and the
amplifier may keep running with a wrong clock configuration after the
bank switch.

Return the result of sdw_write() instead.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 sound/soc/codecs/wsa881x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 47ac3e4985a5..0fc7132c0a9c 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1093,10 +1093,8 @@ static int wsa881x_port_prep(struct sdw_slave *slave,
 static int wsa881x_bus_config(struct sdw_slave *slave,
 			      struct sdw_bus_params *params)
 {
-	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
-		  0x01);
-
-	return 0;
+	return sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
+			 0x01);
 }
 
 static const struct sdw_slave_ops wsa881x_slave_ops = {
-- 
2.56.0


