Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333784;
	b=mtpe5gQ2Amipefm/XDw5W7o60HEE/r2HRRvsIcdjD2WJPZSWNEpTnYF7bp+7cZuI5TR/
	 eRPHFDy45me0xwKHq0xaoK4L8+Ma7JPDLFrGp9DBSRWJhw8n+QsynslAZs6CmnBkAk2VN
	 BnJrR95GwkKkur263427gyUogkKvcDQ3WC5wsZBRBM4UGW9+QdpRyrJq8pRAPMMC0Gwaa
	 dR7TaRLR9v4plG1D6NQdMEXX05jMUmIEPUVmGwEUoXe0C2T4G09OdoGH0qWgYzSAk39iY
	 0EL9cCTbmj/4TFgUk77mAkx6Ld7ZL1XSnTXuLJTH1Mmc2HzUI0Xdj1sI+vQIrH0Kdhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333784;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FdrF6gRb5kv3fMUiNm0TDXE3caMdIIRZAt7cwY9vsd4=;
	b=ifVOIkThjswFbkcN4Z2MHJA2Z8lNeypoSl6B68TFJEAcBUqfjWjIzzln14nnBHh5CA49
	 o2FSUzwiePB7qPpG8rBgnpn+bOwoHSNAaLKsRA1X6n/YG5mfCUlEkUtgVpD37WyNbakW0
	 m5dZzk1/hrlcRZ0jQBGfFNqqyEDXylqO+fSV3ZVTCfJADlELzE8nohHZUlZxJvqiF/oXC
	 2BVFYK6eUvI/bLe6txxH2B4Dd+8bw2eeKv1VatX6EvsB7dBm/cq61RsvFreSD3yVkro8x
	 E4IoOWaWQ7EY2Y/+LkILxUsl+RxuGPOHDJN03Kc3coiLYj/9yiYrFlqmhouGBXxApRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSAsQhPh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B30E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSAsQhPh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A951F0089F;
	Tue, 10 Nov 2026 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333784;
	bh=FdrF6gRb5kv3fMUiNm0TDXE3caMdIIRZAt7cwY9vsd4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jSAsQhPhEtYDWxk+k5+6vO77EtudHG8+iEH9B0buqfrNjXVMxVLfQsNPDwtUq2eUK
	 qU3lPFBFSS+yE31p3iKnd0KnjL9BBZLGSKRq/94JeqZe+Y6g64037JUVfEVY+YpZ5M
	 v0JzJDbfjQ6Q4l7qSztpmSJveIynKXFhU8q36PSlXz15xYc0ca7wVO04Ey9gJN6zmN
	 yF9Y7P6zzWfXzraT6rgB4djo8CT+vQygMl9zNGSsKU6UHltVNeQQx/2CX3+7hXUMZG
	 XV1zSdAO05mmG3GGyjO1/Jl9AiOjc10fGtx7HvRQZvocOsFetSW60XzEKupfIc760R
	 Md1aMV5233kgw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 12A223167791;
	Tue, 10 Nov 2026 18:03:02 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] regulator: mt6363: Serialize BUCK_TOP key access
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261109-rgp-91-mt6363-key-lock-v1-1-ea3b03a76997@baylibre.com>
References: <20261109-rgp-91-mt6363-key-lock-v1-1-ea3b03a76997@baylibre.com>
Date: Tue, 10 Nov 2026 18:03:01 +0000
Message-Id: <179433378119.125181.9313475186309265540.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pptdLPFeSS4LxiB7AY1YPgt3NQJtNKvPqiI9Z4P4EtQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+x4S+reWY2RJfd+Z3s1B+p4EVx4NtOVyb/mmwzxCJc
 AmUUnnRUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIkY6zAybOqan7S/70AEv/Oz
 d80LLAqfmMvHKu8WeWH0W/0Ex6bE8wz/9LdN2V1oWzt36dsYph9vOzwm5qqZXUxW0PLOsni2beM
 MVgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The bits that select the FAST mode of the bucks only accept writes
> while the BUCK_TOP key is unlocked. mt6363_regulator_set_mode() unlocks
> the key, updates the bit and locks the key again, but the regulator
> core only locks the buck being changed. When two bucks change mode at
> the same time, one of them can lock the key between the unlock and
> the mode write of the other. The PMIC then ignores that write, and
> regulator_set_mode() returns 0 while the buck stays in its previous
> mode. mt6363_va15_set_voltage_sel() unlocks and locks the same key,
> so it can also lock it during a buck mode change.
> 
> Hold a mutex from each unlock of the key to its relock, in the FAST bit
> writes and in the VA15 voltage setter.

> @@ -508,6 +519,8 @@ static int mt6363_va15_set_voltage_sel(struct regulator_dev *rdev, unsigned int
>  	struct regmap *regmap = rdev->regmap;
>  	int ret;
>  
> +	guard(mutex)(&mt6363_buck_top_lock);

This function uses goto for error handling, as documented in cleanup.h
you shouldn't mix the two styles since it tends to break often in ways
that the compiler notices and errors on.

-- 
Mark Brown <broonie@kernel.org>
