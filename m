Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8E4F30C1;
	Fri, 16 Oct 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.56.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164583; cv=none; b=kBMIEn6FQlXv5Nt95v82uua/WjsaMRAZJYzYSFYoFUIRtNflBH0VjLGNgIEZp6DgbukvVubffhcpLtVrAazNClw7Is8XOX1jhRxv6JvNLFvjpFIjacP//apxUE2kPyBv/udmqrY4qjbRvXTab8KYoEv2UTt1fSdw+q+nHeSMcAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164583; c=relaxed/simple;
	bh=Bt8M8eUxLv8PCrynRZ6XcXmCZSIt8DfEppvyqBX6IhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKh0+H3wwgjCfHk6Q1WzwXL3tLo1Gb6DuSNcmVCiXI8JljKQKvH1chu0hNmEqjPszlKHboSm0yoNeNj2tZXFys8atl9qEjHsXVXs7KrLCLb0NgMPPqdPhSNdwK2koSEZIXUuxhozblgwLYykwG+QkFLUDdVo8ik/5LZwrz0WZVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru; spf=pass smtp.mailfrom=ideco.ru; arc=none smtp.client-ip=51.250.56.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 2F3FF2032131;
	Fri, 16 Oct 2026 20:29:26 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 9B90D2030E86;
	Fri, 16 Oct 2026 19:33:52 +0500 (+05)
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
Subject: [PATCH 0/2] ASoC: codecs: propagate sdw_write() errors from bus_config callbacks
Date: Fri, 16 Oct 2026 19:33:34 +0500
Message-ID: <20261016143341.417876-1-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wsa881x_bus_config() and wcd_bus_config() (shared by the WCD938x and
WCD939x SoundWire drivers) program the clock divider for the next bank
with sdw_write() but ignore its result and always return 0, so a failed
write is never reported to sdw_notify_config(). The other SoundWire
codec drivers that implement bus_config already return the error.

Both patches simply return the result of sdw_write().

Andrey Karelin (2):
  ASoC: codecs: wsa881x: propagate sdw_write() error from bus_config
  ASoC: codecs: wcd-common: propagate sdw_write() error from bus_config

 sound/soc/codecs/wcd-common.c | 4 +---
 sound/soc/codecs/wsa881x.c    | 6 ++----
 2 files changed, 3 insertions(+), 7 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0


