Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F93D3008
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176014; cv=none; b=EE59JH5KZwm+hlFaZeOB+u4mu6BihDVMkbzNx45BhwctLNz0h9HFmndEhL2Kr8uedHi0qXwok0wZDeYx2bEafFiY0AwfuMeiG7Y/mFn/dLnv4JvgSeFRhEKnauU/zh2NzJQAkxgb2fj608AlF0MgbaP0mGpbyJSQndkF5zxyqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176014; c=relaxed/simple;
	bh=iTXhJnYnvUyhcSvEeSQQcBq1TiwCB1jc+QCIXDOLjsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2/fZy//FGqTm7QBLXAQstTsjMR8UjqCdBnVnuf7T9wqX0CbpxvNzy/yeyenjRADyfkCAZZuM13QNZ3U/faGV+3O4N31CrCT8YxQ7rfgVM0H1pbmdKttUR2oCnm0yeVMcE6vyzyCSzwc6wOepgAq9cfMiky/pMahI4qJac+8uvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ/PGBCn; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ/PGBCn"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso2432081a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176012; x=1788780812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=;
        b=YJ/PGBCncuwkFmT2dw/SMdaLEdiTnWr1hQkYh0AAmVXNiC0KJb443983Rgr9aPDxfC
         RUIk9lLCM2Z+dxMrbPGEB9wbLzn3lcdHrLelVfOaFqn/iEHRS4ecVDrAPBqLhLsyVfGg
         5xltS8B5iUk3scWzCkwkwWRLZr+AzltZevUz7qtCua/wyIbNbN8zHz5xcDROJSoIA4m2
         ETZoWeVaR2KUC65x34/liMg2JivQ/UU8lT950o6hyS+2wUKSurx5NmxOVzduETfidcB7
         m10aobhaZ+j6ANrkNPXvS5G7KqXGSYd6T5ZCvanLAd/55wFwpza88WdlKPCJAIJGHUSd
         dIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176012; x=1788780812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=;
        b=Id0TU7yHTuwnBT/amTEYv5Pw9o868GZikdGbOWPHCYU7fXEI5JMu7UnOGPj0S82Rlk
         GWJkgji1H+MEY2CJez16Nwrqovv0UzwgbX6IPfc7Xo/crE2E3o9w/htE0Kxf/xkvbjIw
         t1WOHh+d5PL3w7aAUl22l3oheWKNdUEO3sqcz01Eq/WDeDWxEcYpViMBsl+XtvBy0iKD
         jLK/Co2VPHKtuB05vnJ+QQr/UpqSTp7a25cRxF/gYvWsA+tWxgsnw4FSMiva/PNfwdlF
         nXidLpWUe7tWQPeyQdJEfBT5PCkzuWSuuriVf1+Trr51424GhT+AvBugCF81OEy/XYJd
         YbYw==
X-Forwarded-Encrypted: i=1; AKwUvBziomY/HDC7CJOGcquENnG+o/bMi1DRrgUjI4L08cpcduCQAD9WSoZniy6LYGGyuZuI/Y7gzzVHHR6emoA=@vger.kernel.org
X-Gm-Message-State: AFuF++mUjw/QPyf30AKD1FTJ98shenBne7DB9c9Wts3CEE4h2DwUWnvp
	khhQQIXLWVNYCT8aFA7BdNf+f0apPtiPWtiSodddS+7pX2b1qcY4bYiB
X-Gm-Gg: AYBFou1UPc9UGcG8yV3jdNFe7/3AlCNjLcog7bUcHl5PahMCFCzxxlWgzrZRt5T0seL
	9A/tRfNAgotajuv0wh1yO1FeHi1EzYa+COAiA8uIbATFcuTXEKRfPWNjnlhiczYNq642iVrXvWc
	qWhvxyhLa0aBwI49ZWudye1Nu3MA0v176Wjeq4EYguK9QSpSH9LKsNEBooXEArTxmdiFl6wfQDD
	ZKxMyub+R2/XUgmPQU8C6bLRa+zJfejAVy4bn1lkOF7t9WeCrkgGO8DXWzuVzZP4RPtJYV9r38b
	ODzgnKaiK3KZ4Xi/zf3dyTH7DrNgUwFvnbXbZnXrA5AOZP9JffdZRIn0gq9+TMdU/9lyH8ZxLB5
	+YiwO1kyg3Ex8rzBpBYlGrKUPs9I+41gzRdqKJlWp8jQtU31bhOzQE0azO6gCg3SXg8PchyPI08
	qUBi6FGkReo0yTwE9HYGSlDOO8f5250l5EX37WciDeSgcpjloNQmnxEhnBOAoqJ8M6vfXwfTGM4
	sdRb05BJWDUWVROxAsUDFdYF/DQJVtPz1DaJBGu464eHscA8Qdv1bXl0NCtwAdaQ4nZsK0Du1hB
	7KzY9oL/Ha1d79eUXjLB2tGcM2kfGT/B+IUc
X-Received: by 2002:a17:90a:d646:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39907231958mr322558a91.0.1788176011913;
        Mon, 31 Aug 2026 04:33:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:41 +1000
Subject: [PATCH 3/3] ASoC: tas2770: Initialise SDZ GPIO low
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-3-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=iTXhJnYnvUyhcSvEeSQQcBq1TiwCB1jc+QCIXDOLjsM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04p0ojMTfJ47b7SRnZUfffPPzFsJ2mILz5YKajz7v
 DCFiZO9YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX7BBj+2Tuf7OX2/MlUtqT1y8kYbgfvZ2sehv49cGLzGy4/i/pnZYwME77mzdr
 ycp8ic9rElYYiz4IcBZ6ZaqXve/UiTX3N7LlBnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

On Apple Silicon machines integrating TAS2770, the SDZ pin of all
codecs is connected to a shared GPIO line. The kernel's shared
GPIO infrastructure relies on the first change of the GPIO state
being marked as its "default" state, and allows any consumer of the
shared line to assert that state without consensus from other
consumers.

If the pin is initialised high, the shared GPIO core does not
allow the line to be asserted without consensus. This breaks
resuming from suspend on Apple Silicon machines; the driver attempts
to restore the codec's register state and fails because other
codecs are still holding the line low.

Initialise the SDZ GPIO low so that the first state change on probe
asserts it high, allowing any codec to pull the line up when
it needs to.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index e79754edac5c..ecc37d4ac00b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -886,7 +886,7 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 	if (rc)
 		tas2770->pdm_slot = -1;
 
-	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(tas2770->sdz_gpio)) {
 		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;

-- 
2.55.0

