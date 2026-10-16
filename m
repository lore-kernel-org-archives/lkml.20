Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6722A4EA368;
	Fri, 16 Oct 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.56.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164599; cv=none; b=ljsrvZViypH8iDPWJR8rusrAlZrQAxHWMOeQmMvMiuwTtV+KPd4vRtD8dcMqFgkoMtyFlZwXfvtrGhSSYquqPWlTXraqAFtkA/KG1lT1ScwdECKEfLsVW3vUi5n7iwyNGw7GefwwHGZbkvh85P9o4ZFeFwElUZb6LoZs+VVrjlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164599; c=relaxed/simple;
	bh=Qb0W2kR84yVAD7t6zNB7Uss3BTzK7qbE6rP6hBbgfQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqNv34bhR69X1uoGBJqmhEkHBrunSpxJPOeLTZIrfqe+dNfKOCl/wLjegMvlbikOs8aeXSqc1+OtnedBoedLLdAioiP1MILeiCMq6VDjfWQ8v9tkZLwsN4xV7R7A6QJRgqQszaIKq2h/TDh6ztpmiUGzcx7zX6hQBPOPV7o694I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru; spf=pass smtp.mailfrom=ideco.ru; arc=none smtp.client-ip=51.250.56.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 6C2B32038ACE;
	Fri, 16 Oct 2026 20:29:54 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 5869E2050D23;
	Fri, 16 Oct 2026 19:34:26 +0500 (+05)
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
Subject: [PATCH 2/2] ASoC: codecs: wcd-common: propagate sdw_write() error from bus_config
Date: Fri, 16 Oct 2026 19:33:36 +0500
Message-ID: <20261016143341.417876-3-a.karelin@ideco.ru>
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

wcd_bus_config() programs the clock divider for the next bank via
sdw_write() but ignores its result and always returns 0. A failed write
is therefore hidden from sdw_notify_config(), which aborts programming
of the stream parameters when a bus_config callback fails, and the
codec may keep running with a wrong clock configuration after the bank
switch.

The callback is shared by the WCD938x and WCD939x SoundWire drivers.
It was moved to the common helper as is by commit 59aebbbb0b47 ("ASoC:
codecs: wcd-common: move status_update callback to common"); the
original per-driver callbacks had the same problem.

Return the result of sdw_write() instead.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Fixes: be2af391cea0 ("ASoC: codecs: Add WCD939x Soundwire devices driver")
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 sound/soc/codecs/wcd-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 9016e974582f..74bd718b8a34 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -115,9 +115,7 @@ EXPORT_SYMBOL_GPL(wcd_update_status);
 
 int wcd_bus_config(struct sdw_slave *slave, struct sdw_bus_params *params)
 {
-	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank), 0x01);
-
-	return 0;
+	return sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank), 0x01);
 }
 EXPORT_SYMBOL_GPL(wcd_bus_config);
 
-- 
2.56.0


