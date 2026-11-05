Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887346;
	b=UwxwXSHyU7ZlNsD1M1KoVL1JlvUcv9vbglheFFa3EMnvc0VOaRJZYwkcdFWv74F01uct
	 gINvY6x+ayymjJ5aIrXOt4nBGCySsW9oN+F0Ms+pCcehaw3991Cn6l+B63MeX51MjhkSz
	 4mDhopf+UUKJ5a92Qrxc/C9qsSCMcFcxOttEvbE79urWRvAuws3ECTjfr5y1cto96UAyS
	 sF3HkceQQFwawPke1ULPh2lZq+YUBGCA0PKK4FqTrO/hvlzopjaeBaI8pknAy3ILsNfQg
	 kAEFBo0rWVbukULCwANbJejBgYdV7Zq42N5uPWrd6ZX9n57x/+7QyXgH/RA5sKWgNfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887346;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IYWGO80spbzXnKRHLjn6hQ6ImazjezIuBJYzl9eOaqs=;
	b=kHrL6OYb3M/3e0ecZzpXddzghXaU25WS5vQIRLm6BoI1/qKdmQTc5zKPS5ivqPTd6Xch
	 mBAvYB+9jdalVrfZIjOI1wCS6vbCjiaW0emmHG6BpMpmnyyzl/wagPffuYnRcaj+PGUjJ
	 Ah+1qMYGoyrDZTMdEzDrMldG1GCP9Duc0Re5KRGMMm0g1hRVp4gedykCjkvQSU/IrjsgV
	 Hxw6pqUrsYPOphS5mkaQwO8m7kdOg++2NxDl/q6o/SXGOL+Hmxv5d/kr+M1fwNOR8q0af
	 B99lIb+ZK6EAEKV9r3S4OMCprPE6aZtVEGumpVAMgvVaR49ewIG3kiHIrCzf7qRr5GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d/LSzXBS";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id E5A19606A326;
	Thu,  5 Nov 2026 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d/LSzXBS
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 53D3F1F000C1;
	Thu,  5 Nov 2026 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887345;
	bh=IYWGO80spbzXnKRHLjn6hQ6ImazjezIuBJYzl9eOaqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d/LSzXBSpjeA75i9jnsaoE12cbhfloRfvPokG+iP3ieFoT00Jep8xt+vQpVjON9Db
	 tNPOgmyiBFILFTUW1bb3CrTjuTiOmNoUV/jhMJ/B24hQrSKg1UcmQg94CxWlBcheLW
	 9P+/Xy0uuUCrnAXr4lkBXabc2Y1dwH0JzvpkX10+0A50AxfcxdIYkia5ZdP9WtuOZb
	 ewwaA2xXWfDDSLYc844xTuG8ASHPrri7U6Opd6zWAfOqX+JG6gD+G6G2qxKqRM2aqr
	 M+RcbVTKYXP4jhR0jscAKAF7+wyt5UosAlQflYxP0OOTzCwSJulJ6ZV0LPt1trONmC
	 1NsK5seI9MmuA==
Date: Thu, 5 Nov 2026 15:02:21 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: cpcap: use the platform OF node setter
Message-ID: <gondi6b7msxkf7cjil66vrpmhofhho4wmccq74zkuxxt3p5uxd@wowar3wxey22>
References: <rc-review-20261105-v2-28-d7877b3f9c24@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rc-review-20261105-v2-28-d7877b3f9c24@gmail.com>

On Thu, Nov 05, 2026 at 08:32:28PM +0800, Yige Jiang wrote:
> cpcap_codec_probe() gets the audio-codec child node and assigns it
> only to dev.of_node. Platform device release now puts dev.fwnode,
> so the acquired node reference is never returned.
> 
> Use platform_device_set_of_node() to synchronize both fields and
> give the device its own reference. Use __free(device_node) to release
> the local lookup reference when probe returns. The device keeps the
> node until it is replaced or the platform device is released; a probe
> retry also drops the old device-owned reference.
> 
> Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
