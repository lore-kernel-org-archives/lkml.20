Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20547A0A7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934597; cv=none; b=nnvRFpWhj9O4ov+gJaB88Pr2k+WmOl+w6Iw8MpZ3e/fW0WoSZEcmJd1WnACfxgvw0bSP6cm7GucDakq9uH5CYqxikGhGrCGQ/OfJTttFK2VOdHoJqjRb/W2nrRRqrwgy0dYblNEXIVeNOomDxjUefnu1LEXUgraKSvZL+kQjCXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934597; c=relaxed/simple;
	bh=3lOlktFAqnyOdTTnxV1RDi3COlBrsI3NZw3sXEpqQYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEA5nc8f8TLgYGk2oTXYYcffyQvONGXsXbgV9eE6fXKSrcuo0ovdnaFoLbqI8LTJqOUD3bepYPnwIL3+aHQ6oynwW7tRcY4NsRKj/STypWizf8qnBIFqBtn707+DKgD1ZpYUJhCp/HCpAes/JCz5ETManhAHvJaolw2rva5SfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=p1tlOw1+; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="p1tlOw1+"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so3023467f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934588; x=1791539388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwpDabsocINC12W3N5eBh0bHuZzo2UoIUzRt8IiGg6Q=;
        b=p1tlOw1+jSEtCEh3ol9yZdBWpUt0lygal/yA4Dbyivo3/sU8/UmEDahI7OPt0yIq2n
         0h+mo3Ff0RuFwfAZ/MXeDdMmJY3Ufzybkw4skpe8fAf6S4NiRJKTnJdKg03otGkwSM41
         cM4hlMhGlR/50SOFlVBTnYry4QkthrOry1jlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934588; x=1791539388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwpDabsocINC12W3N5eBh0bHuZzo2UoIUzRt8IiGg6Q=;
        b=xLCA28vpMbaokTriGHymrOmbn/7AlyoPxPJADkzGifCszFUQ3Ya4JOmUcoXTBKE3k2
         dTaGFOYJMxwC0W0m/76RyoffFy9yqJxKJdDcKVw0RNLf5z88Bp7k7sRbp8MLeXnWrrUt
         3lMYvstyYl5PVSHbzp6To91rrRDjj3491ZFb/ZhlR3ScRqcncVvTFCf5EwDE0dQF1R91
         jnq0j9qg2ELs3anTFk1W25votV/P1jyTzR62rhmTgCtWfN2Gb9aqSzBIlqTxTUnWV9fL
         HQiZFg5n015fB7Ex+s5NYNcKrB4qmt9ZbcZdrm8SoGMH3LXwtnqYpZWbnj3Tb3rQLUQT
         ABFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9M9YBHsWORgkArscfkaOz6oAqbbE/dyHX5eOQQgOH9aCBmlqzf6A2Vy4HwMmhAsammBRpG76gZTFOVbI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlOu55OYVEIAP6sBbu2+ZY9r2zBq5mTYFyUAnZtLbxa3lHslpo
	ffzY9IpKx1GXUWQuBDR5eK1JnNWXdUgySiKh9zjcyGhSdsBbZzq0Yt4iGM1hN5hmexc=
X-Gm-Gg: AYBFou2utHTnfJg4bJNRu0Ouc+yl0g7hs9yMLlJ+Yqv5Cyr5lJ0l2FFpYDnzCu+cqkD
	osk737fK1XY1+x0OoE5rlBC1HMCuAPgbMXjN61ZmQYxiLUmO3k7h8JUWYj4/TlrrDSAF+W0G/LX
	1xNSLMCwa7/Qcgg16it07FVSvICh54EWxz+vWHKqMl9VHPa3tF1d/tyCwYdtfDqOXgIFsWw4YgA
	+zs6AgYd+q9s2c+CTIMWy1O9Rfz2zldzGEOWClVcZpgYLMbOCev9JsAUH4XEwpgB1p3kuKQXtKu
	P1dOp2q05MgAPj65PLRKXq5alhTZD6HTJjpIHNxEVxDcXkpLo3PX9vkG0alUFjFb89DAZE23zh2
	LBTA9ixL3B4HmeuIGprA6trfjUqOiN+jEEx9AKYJ5t7636iVyktPXC+zuhvAVioEdeTNWiyNXpF
	G0tAp+lDe7d1a0fUF3teODxPpLSp0oUJCcAMYNgDyBDNDqB9PfKQgFgsNYWjoX+53dtoHzv3TNL
	PcHv9ayXWkC4g==
X-Received: by 2002:a5d:5f8e:0:b0:487:bcc:2c08 with SMTP id ffacd0b85a97d-48b1271cd1dmr3972478f8f.14.1790934588564;
        Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm4149829f8f.34.2026.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:32 +0200
Subject: [PATCH 3/5] ASoC: pcm179x: Add left-justified formats for pcm1792a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-3-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

The left-justified format is supported per the datasheet, but was
missing in the table.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index 61b87dab3266..c059e410cbbe 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -75,6 +75,8 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
 	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
+	{ SND_SOC_DAIFMT_LEFT_J,  32, 3 },
 	{ SND_SOC_DAIFMT_I2S,     16, 4 },
 	{ SND_SOC_DAIFMT_I2S,     24, 5 },
 	{ SND_SOC_DAIFMT_I2S,     32, 5 },

-- 
2.55.0

