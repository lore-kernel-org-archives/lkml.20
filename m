Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC344457C9;
	Wed, 14 Oct 2026 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008396; cv=none; b=lMBOpRmtU7esGjqs6n1J3kjvy1kiJaTIdOoBUoL/l9rtVGuWxw5sC8pUGgg52RbI/e1kFPZzLhjzZahJp9Uj2GMeRYcVYcHsb+4UFwHKq7Tar2Vi1b7mbX/2LwPitMC+eno766nOsUFlfmylYN8REZwYBGsmgoN+wL6lnVm+96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008396; c=relaxed/simple;
	bh=T1fDisrsXnpHwDpcsIajQNo1HqgvlNZ/iwQrk6pRNUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0Emj3wZ2cHhS5HMIEW9Pnp+ZSQvAPXb1mBdBj8f9YhF8EN8LgcYwDGakdTzG0Jzmbz1QiNAHsZT16PuVH65i/KBca8/McjUhseQjtjkqt5UhfREHauNU4w33Yn8FOXoo5MfowlDb6B8fUJTUV1FjIdiSvKq1EAyLYYrCzy7ba4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=mYAT42sJ; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="mYAT42sJ"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008378;
	bh=+c9J74pPyeQT7T0uRaJkgFdwoZYZGnRPWS92v1Y33xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mYAT42sJSoYfZTRidJfyt3meCcGXAtTvpNuhpBuFfrSGWmt9/FN+csMLJQ/I+1LXE
	 utCqs3CM+TZxeKB2bVPPeWrmD5WgZlNjtpOgh6PmnSXpBjN4WHQ/u7ic3DD9RomSZN
	 LVyapnx0CiMpBFjWmdVnRoWcm7uTqOLQOzvKA+8y+BDUToTBwnIKzVZb0vicqo6Lzf
	 fnSdzYLp4osqO1qkMTqQIzOtM5iELuH8ZLJYph2KLUkMYd75hA6Fi6vbAErXx/rBf1
	 F76o3zuq2hpt3xPV5xA4LA3Z+VwfjdSvDdidIOsTSXbeglTEFY6/ReeCP4uGyxhj4E
	 ezimc+FOVQ+nQ==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 32B051BC50D;
	Wed, 14 Oct 2026 22:06:18 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 5/8] ASoC: soc-ac97: Fix error handling in snd_soc_new_ac97_component()
Date: Wed, 14 Oct 2026 22:06:05 +0200
Message-ID: <20261014200608.118770-6-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014200608.118770-1-amade@asmblr.net>
References: <20261014200608.118770-1-amade@asmblr.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If call to snd_soc_ac97_init_gpio() fails, proper removal procedure
should mirror snd_soc_free_ac97_component() behaviour and call
device_del() before put_device().

Fixes: 9bf5c3d11f1f ("ASoC: ac97: add gpio chip")
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/soc-ac97.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 5f81e3606655..5c573c8dc249 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -241,10 +241,12 @@ struct snd_ac97 *snd_soc_new_ac97_component(struct snd_soc_component *component,
 
 	ret = snd_soc_ac97_init_gpio(ac97, component);
 	if (ret)
-		goto err_put_device;
+		goto err_del_device;
 
 	return ac97;
 
+err_del_device:
+	device_del(&ac97->dev);
 err_put_device:
 	put_device(&ac97->dev);
 	return ERR_PTR(ret);
-- 
2.56.0

