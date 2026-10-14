Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF54825C4;
	Wed, 14 Oct 2026 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008398; cv=none; b=UC31vCzYi8cIB7XjuM7XInANSFHQEWqZIwDeJ1sDq9DxmZMseczh7ghhh/D39/K2uq7LxVkH2FoZFGPKV4q2uH8NaMdYrVpX7poi9G1uz6YmccBMqDHsh9AjItnYevAjLuIg0h7XB0kpSQZtcDa8ige4CwAciB2erUh9ht1D/1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008398; c=relaxed/simple;
	bh=gU7Eab4c8f9nKiYDsmsmZMIicPBjVJGFNryY1WBE6SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIdRQnHufkIlcai85Vkj+rmlpJFqbLGHQ6HzUUg77QfhYbnYR3v1xOTjMKz50RBTBR5QSki8ISdMiC7y0KRd+GXN8DiKlJhO4JfJg2P23ZYpbRo/qIbzxsnWVwuFW8fX/AZO9zq+7jdnEym4x42ZnyjVs7WpbjoRKTFIbV8Kj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=KAW900rT; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="KAW900rT"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008378;
	bh=yv92VjnzQLlxHqOaXOFB04TvXASerabjyOUPMWK9gcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KAW900rT9t6QkNs+8oUfQCzAsz558WYVosbJq4OetTTGv1/ENg4nHwLhrCRP39jsA
	 ncLnJDmrMPH5y7EpNRTyQtoMzuSBZswpbRXFpyumo2dwqyeFBrP6kEPYOrdGbA6M49
	 mykyL9zWsAmZx9OP0mDet27DAxPlYAft5VpwHmSXrQiA/899chk0u1BlXT1UwCTB06
	 zRkRH8da5VtEiFSgYfwz9T/qNsOJ6S9MlpgCE+yCSpqyP5S6URQCU4jWvR38Y+0ZKr
	 deNbgh0d9uJfpw23FCc/Xv9SroMKLB5NNw3ZSVtnwN6SvXVumgw6fmkS/Ru0xw6DkR
	 lREZdMNihh4FA==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 8B9BB1BC4FF;
	Wed, 14 Oct 2026 22:06:18 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 6/8] ASoC: soc-ac97: Fix debug message
Date: Wed, 14 Oct 2026 22:06:06 +0200
Message-ID: <20261014200608.118770-7-amade@asmblr.net>
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

Seems like copy paste mistake, it should have been input, as in the name
of the function.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/soc-ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 5c573c8dc249..9d38b38d88df 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -69,7 +69,7 @@ static int snd_soc_ac97_gpio_direction_in(struct gpio_chip *chip,
 {
 	struct snd_soc_component *component = gpio_to_component(chip);
 
-	dev_dbg(component->dev, "set gpio %d to output\n", offset);
+	dev_dbg(component->dev, "set gpio %d to input\n", offset);
 	return snd_soc_component_update_bits(component, AC97_GPIO_CFG,
 				   1 << offset, 1 << offset);
 }
-- 
2.56.0

