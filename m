Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA6D4F55C2;
	Thu, 17 Sep 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653599; cv=none; b=aVT37E6PtkFrdMhH1vh9JrV7/M7CnLikDJ+jk7oso4i9VsSLcSzQ8LBm4yMlIoGcZYAAm9qA85Ot4rdenm1kS2je7Rc1S/GFOxGj3GQyV7Ma53y0F4bFwXgMKip+ugu8Xp9BZoRxclE1jVuuSL6+x8MQluh745Gp/1GUhGjLueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653599; c=relaxed/simple;
	bh=41APIPiDwNLyCoRynVUqJyFkALdwIcljHzQTQUJ42ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V0TO1pwuX3xiIJ9xOWrjshJ6xmhwIJX1qSljRgrjtQnGs6zB/uV1k86jd1Fa4CFlNv9IQIYqr2de9wDH4puTk4R5mOAwnnDs9L/r31lY+uxP9c+XGIjH0NYYgQK4wfK2lc5jfUWXs3A7vAjpYNERWwXMjFCIyjJ3B7S/AtHEBJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a62qPWsL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a62qPWsL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A159B1F000FF;
	Thu, 17 Sep 2026 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653598;
	bh=YMv7NzaebzCtt1k7frWIon/WX9SNk6RB6KvCRpGtXek=;
	h=From:To:Cc:Subject:Date;
	b=a62qPWsLZ1AjKY6u8vZ4UKez6ynqtC1Tz/WhHvy6C3IweC1Q5M9itr3WKEDuShhfQ
	 9Vk6mCBQWHb+IKM8qpnwq+1Gl2PZdlcmntYFCFYGtC4rkClJrQn7dxfrs6cwoaDepq
	 Kp0hkxDvulMFW2z9DDUP/R/b9WHWtrVE2xKukyvpn4kLdDQik0y1qe+8PwYafhogL+
	 GruFvl0kl4siPYuTLbNlTIKqetLzrpAfN6k8s8xyYNSkEwzRSCba8D9MieoImulaXl
	 g7xcgf2Sc+Bh35+kh3FZGAlXz+LKP1XwycTPzS66LsTbU2qBNckq+H1lCTo/IsTST+
	 /7+2HAEN7bcLw==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuming Fan <shumingf@realtek.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
Date: Thu, 17 Sep 2026 15:58:51 +0200
Message-ID: <20260917135950.405423-1-arnd@kernel.org>
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

Change the dependency to require SND_SOC_SDCA_CLASS instead, which
solves the problem without extra selects.

Fixes: b50ecf5873df ("ASoC: rt766: add RT766/RT767 SDCA driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: replace the original approach that added a still insufficient dependency.
---
 sound/soc/codecs/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e78d725e61e2..f88381523ea3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1991,9 +1991,7 @@ config SND_SOC_RT715_SDCA_SDW
 config SND_SOC_RT766_SDCA_SDW
 	tristate "Realtek RT766 SDCA Codec - SDW"
 	depends on SOUNDWIRE
-	depends on SND_SOC_SDCA
-	select SND_SOC_SDCA_HID
-	select SND_SOC_SDCA_IRQ
+	depends on SND_SOC_SDCA_CLASS
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
-- 
2.53.0

