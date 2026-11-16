Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821913;
	b=NzMR+X/qk/4gfvxR54Sa4kUvkHhhcer1Bw41zkL+D1IWbbAI0NQ7xEtX/jAqp8OlPBcs
	 69Zk+3OK1x+mCzsmG6XsBxpN9D/rHA+40ZkzeitmT2TNmv6F7jYwUyso0e+OyGcuDfcrn
	 2G7LAZFcR/fQuxYOTMw1siGuweDJe73XOu34wbqucY4xzzbg7T4EDFwMnuOUEiG6VW7rG
	 97hMfHl3PYgVZN0jRVgogV5hoIdSLRFw4KBAG9e6n31lM/tyFkohGm4KCghVhEw1/Td5A
	 F+aK2wXldQnyPMVOcDPuyeEaBGJv3lz/1wsilywQTKoZc68Vi3SwLqRw6ZATr0HuK0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
	b=HsXsa0OVuhoYMaI7ht3wXSMaQpTzMMVOtWaVUv7VAUlZcWswMM8U49dcPUxaQgtM9rSD
	 2VzEd4op6TV8NSuJsPn4Vazqq/uAEc85Kj+fZysv2yTik56Mc6HYFR/Q0Fdags8RSdymm
	 rkLnVz8K6/ZhYp720Vl0x4Ok76sLR0yvvM8F64q5XjOQXJrehI/yTWIa7uMJT2QDU9M5S
	 Lm7B0v7Pjz+EQ4h9T00MitGN3NLTDUPGeDESkxW6nIQqY7Vbpr2gglAQTXj9bXFSnpPX9
	 snx4sLeAwxIUZYtPASu4mxrje8A3UN6dmGrsCEAqCaQdJyWGK/NrAqxrJcEo9uEE9KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYpWc1sh;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068E606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4068E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYpWc1sh
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c45551fa84eso619700266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821911; x=1795426711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
        b=UYpWc1shzf8kBKXESlt/rmRtpLOuJDihEpFizMS9pLPsKgILSIB2MQiINeMJgSACZb
         vThq3hMHZMZpT/BZSTNfPPdHQOLPP6iuQ9Ot42sHnNwrkMyw6NDbqq1BqoqfMNVS1iGx
         8CBbPn/da+IbGlMvtMTvt5bBAdXjFs+fnSzmDF+FVAVjM+2NvO5SydpJTLDE0PUei/1X
         X8sNNO1XFi2ozqqXwBKcIQhQ5GsofOsDc1CZ4WTQThrlDvA6cuXd8M6R/AfHcUng3vV+
         G8+pIWUKot8EbVPzXtJKnlR0hw6DOr0vl8TBudSZ7mcQqa6jjOkMtviTr7u0bT4LAZMY
         214Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821911; x=1795426711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
        b=aQ3EEi5YHLcG3Wh3p507k4zJ7dX99Of/ciefKVzFJftbLj1bAnY6dDgYUEB9hPvKsE
         Rqqafahrx1WdQGKjhFXTIDSJM5sdzIOyJjiAZeECVTboyjVjbKKFggXEnbVYj2YRviTW
         dVh54loDEGPr69FNY6e2227jdpwR8j7gSi2Wll2rdHSeFEsLMhK/K/de5af0UBWxlkJV
         gh+tf+Vo4+v16nCZJcereJ8t9qEsyZ0pBZh1l3IOdskjHhuw/LBZ6Gt3QbSHEBuYemYA
         p+38+YkJKR9zlVKjN9ByZOY2EHnzY/yDJUe3TxXIL8EvvQJGjK17vH6pRq+O8DUxw+sQ
         W/JQ==
X-Gm-Message-State: APuU4Z8V2OyxQEguqJS8/gu05aqJmU7CSvXzTLav0kkQMyijaZ6tdJe3
	AVMhOtjH3rg3n4bTEXZ49NNKRySWg9vtZRnge9WIltRuY61HNP7vhTJo
X-Gm-Gg: AYBFou1tYvz+GnVktlLatC0iAoCusenODpnZHEHe46aZk6nExkAi43LvZWDmQPFwUY1
	3mkZ7tacAD9SSK4mG+5qZeQWN3DxKV3M28/kepMqRq2O8cqH5pSFXb1WNnGObOyKf9zcfn8a8HQ
	YEmznpu68au2rn3robbcTjgaTbh2oSRjWS+ZHJVCQ1WRywy4ae5BOGCC5Ze9kL80yrr+PsG3Yxf
	+F9DKIimYYIBeBG2HQK1q1TRvm32UQmn5Fn0HZ1tj3UPJcf7cBqytz0/2kD7mh3DnBQnQ+Qf9xo
	Tkae0kLfawULiPT3j/xbK7ij+zWZ914fvP3hqEvBD0hxCOcQYjIjLTn7wUgkfTvCObswFKKndem
	liOPc9coaG2CaR1Z3E0qQ53dWeIwWWZryPHsPhL/K3Fe/PBgbMJZCplrue35LeSb4zSJwhh4DCg
	w5NN3xXLH3VP/1mx58R33R6RDEOtUdfHdTeHR/ExZYM6HvprXP+u/99hEFYBAfjhOOeXIbDT9lq
	HNKcBLsihYTEK7NTAo7uQstTYorL6vQ5zE6W+vx8vcrlco8D03VZNcOeoOmEWtCjb78cB1BMveg
	gIzxdYSxt47UhFzAhw3gxbmAgMxuFz37971B6Pk7oOoQnVO3sxQJX6yes9whCWmOAGzzUlXAjnQ
	DfjeAcaShuw==
X-Received: by 2002:a17:907:9349:b0:c50:4720:4aec with SMTP id a640c23a62f3a-c5096398b9cmr726615066b.12.1794821911427;
        Mon, 16 Nov 2026 01:38:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b72868sm379906166b.65.2026.11.16.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:38:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] ASoC: tegra: Consolidate and update tegra_asoc_machine
Date: Mon, 16 Nov 2026 11:37:58 +0200
Message-ID: <20261116093805.73715-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is based on 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-7.5

It requires this series to work ("ASoC: Convert last few codecs to set_jack")
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-7.5&id=30b0682691a3709441146311a4f695b08eca567b

Patch set consolidates remaining wm8903, wm8962 and wm8994 partial machine
implementations into tegra_asoc_machine which now is possible thanks to
conversion of codecs to use unified .set_jack callback.

Second patch removes repetitive, boilerplate codec-specific initialization
functions with similar content.

Third patch is just sorting, no functional code changes.

Svyatoslav Ryhel (3):
  ASoC: tegra: Consolidate remaining separate codec machine drivers into
    tegra_asoc_machine
  ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
  ASoC: tegra: Reorder the codec structures and sort the machine OF
    match table alphabetically

 sound/soc/tegra/Makefile             |   6 -
 sound/soc/tegra/tegra_asoc_machine.c | 510 ++++++++++++++++++---------
 sound/soc/tegra/tegra_asoc_machine.h |   4 +-
 sound/soc/tegra/tegra_wm8903.c       | 188 ----------
 sound/soc/tegra/tegra_wm8962.c       | 165 ---------
 sound/soc/tegra/tegra_wm8994.c       | 175 ---------
 6 files changed, 344 insertions(+), 704 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_wm8903.c
 delete mode 100644 sound/soc/tegra/tegra_wm8962.c
 delete mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

