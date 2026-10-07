Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5C64519AA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363049; cv=none; b=hObrBLZfLCh7iC3hrc0Pdf8Vx4s5d7t86HlHKcnLg8hf1pISoWfR7WB5R+ii7CN4PUatQ/WTkIjMRykCU6OIKOatEuXvPUnID09TBhV0yOH+N85Glb7h0twgO5qxqJc9yYn2tuCftAi6KFkhyO1H1Y1lpvl9T1BM8l/zF/G3nhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363049; c=relaxed/simple;
	bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KfWP8VfaaE2p8sKLUJr/slsHzvbxO+rht5nDkdZSNx2xkWIYNvhY7WkRj+RBBJmmOcdF0PmPQSLEwL8pNggQOpJILJseDJHHlcDlm93LjUtKlkG4W17dzgrClfMKH65f+Y2z0XVjOsOJNgkw9xTypwkpgd2IplKYZq2Eipz4VVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Otk+qGT5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Otk+qGT5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso3131971f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363045; x=1791967845; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=Otk+qGT5X3luUwt9EMp/n1Bmmb+Jysl5xzLTVNisJC0ctlcibqEmUIAxX6xtzpT0BE
         PCiTD12lrNapau+/hVigUT0NhsygClGJUc1f55c4W/aiFfbcGI0acf5vKuzo0DI4IPk7
         bfEI0jNadIsADsUEMWl5jxlP8aFHyQXN2hf3J5nzRukKCE9VzbCLUvQLViBh9ywiePX8
         2ukkUsW4n5Add691FwY90T5cHnrIKm1z+XJH+NUZifaKEE3Ldgdac1qDmOzdrIR3VIuP
         5cVAPW+3vYV3UwWHLK7bwSj3WUmi91yGglTfYY2JFyfJHokgdOfYVjx97bjGqP5wmg+f
         tu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363045; x=1791967845;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=u4EkQVhtBDQFuyaSwEI3O/mRVKRRP7X529ThQeXIZPRSYGfgAXhdkQJx0WzJ1zHvUj
         Omj0bCF0Gpu89b8UFwhNzWMd/Xw91MF9uIrF5yrG1xE3OtDEL/95Qzd8gAwKRlFB3XDr
         KrPQVbj9Ayhu2zaCa1sRs6eRhZtZDPqEzbg+7AanYqnD+BO5yurQmWJxFlGw4bwxPfCU
         0TMhH3Jlh9PGa9BOQa+Eg89dV0f/nQJRX25Q+wSweIZmagzeHJ1UqaGkLwQehRQ58Tnc
         u5AB3HEJfeecRWK8BysKdPupkOoQXou4342dBYq9Bn1NuWxeew0afRoZsaQglVvnLKY7
         QrmQ==
X-Forwarded-Encrypted: i=1; AKwUvByuloDGlFQpn3a/j/IaY1bZkT0KmzGP6c7p5941wWxK5pkI5AWdeUBPh7AakOWc4NBkF+LaViKuggTfq4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWBL0n4matykpMw4csXNG6xKyBES4RJWx7C3HH81TeXKddTWJD
	e4qJRMnWvRiSv+gTbmgBPZoGv23TiLXzo4I+M8slJY8abEYoWEWF5+rYuLaC2ZtEq0I=
X-Gm-Gg: AYBFou2h/BLxENvhm2VjwUF+v7o70IVtPhle2xc1ucKuxvsF2dSGG2+EsTHfvZlsxzp
	7hAyPRGCmou2CN0+ih2vrqsP+JXJBN492HmASyLIL/UK6frvhVeEMsTC6AuLfJbofcDMTHv4M2n
	ajuAYyNiywM0fbZdelCMXEqwmM5nWgQQlM9C1MxXjrwnuOWnk5jX1lk0wmfyl2i/VOApKV6F9s0
	Dqo3YeZsLpPGk7n/Abhx/e45W7Sw0v0f41C3zWWvstu1l5dEi1whq39n4MasOmkjlRb3SsSnQl4
	atW9y1hQtbwyfZCRVei48mRtxnX1njTmZNr93McbUtoR0/7kqBX+/ZmwAO0kEGwRpbvidSpdfID
	qtCpK5xCFtFAEpHDrz+K6AGaliMvuqhfODUDs4TrkILLSsuXwB/WKWzRXTHeUU+lXvTnUSD82CT
	GHciimwXW5RxKMtFwh9ODf3X8vlV5Xd/vvyaRE/hhSBVI8gYmc/yK2OR5vti435FUEvtnbrp4tC
	3jvdXhrINyso8M=
X-Received: by 2002:a05:6000:46cb:b0:48a:fd58:a7dc with SMTP id ffacd0b85a97d-48c72787725mr1780822f8f.12.1791363044915;
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3050asm3959269f8f.50.2026.10.07.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
In-Reply-To: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-6-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:50:43 +0200
Message-ID: <1jzewpyjvg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Slightly modify "gx_card_cpu_identify()" by making the compatible matching
> string an input parameter. This allows to easily support also AUDIN's FIFO
> with minimal changes.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
