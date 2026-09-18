Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B61A38F9;
	Sat, 19 Sep 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789809403; cv=none; b=Nja85eThY0y4zHl9Gt3pjn3jgSi2HfH7AEKPh2Qz+71Mtix5qeWXnXhyKhJt1EvSJFTosfh0Yoax4OpHQMmU9JUttDZysJek6wFyvTtxKvgvMDPzjRUIkDFreyJyAQ/e0kkqMDr+VAdig3l1xIF5KH4XrX2vbw8nxmrNvDNfNDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789809403; c=relaxed/simple;
	bh=qnd/nkXcuexVseV8EYVmcbGzT1DYZ2xFuSzOikjh8y4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BijCwVzDDp28x5Ma8HK+oYX6hkxKYInahYEWX9RAn29yrk7FnwNniYiUQd7+81Qdjj/EXephRuty3ZKAdT/MFLAAAxsoMJ/+pJYEzIENZ4juR1CIqzdP5omzXmjLN344clSMIcuA7t8MjuN+bwF8FlEV5QqqJ++aARMS/9CTigU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6bTLqfU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6bTLqfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11DF1F00898;
	Sat, 19 Sep 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789809401;
	bh=Awg67cxHl18a2D/zvjxAJGydZiXsMD2cX9Cd0uol1eY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=D6bTLqfUcwgwHXNN2m8iiQmju3ywMCqfUeA8Pxi83jxqjKXay6zBuctYKlYwrKJhA
	 Ooni5TFUpqMA9Sb5sSEvvwXHNLyzfJ+cZ5X72yu3cv7wwZESuuqCEFd+t4ibZ10NEO
	 Bu+UJRtBBMGOFdgZKofYdY0rDHQZ/sO1WLtuE/S27fEqXuJ92zZQDexgbIbStF27kY
	 cmolrPno6YL/0ofzxDFVaANbY87g1ti0ihrIJobilNiO8imtHCDFEBC3eR/CfOFC3h
	 qJTCN8JcY1idmW2VjWjUN3TsfcRgkjOuRPPq3d7Ras1fjmcBqjpBEL1g0swX+iL2Eo
	 xYouV74JzK4KA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Darren Ye <darren.ye@mediatek.com>, 
 Rosen Penev <rosenp@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
Message-Id: <178976668737.1863384.7459518219395606759.b4-ty@b4>
Date: Fri, 18 Sep 2026 23:24:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Tue, 08 Sep 2026 11:04:42 +0200, Christian Marangi wrote:
> ASoC: Add support for Airoha AN7581
> 
> Add all the patch and documentation to support Airoha AN7581
> sound driver.
> 
> The card follows similar implementation with Mediatek with
> the codec present on i2c but with a simplified implementation
> register wise and additional frequency supported.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
      https://git.kernel.org/broonie/sound/c/78da571393da
[2/5] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
      https://git.kernel.org/broonie/sound/c/8fcf0497e6da
[3/5] ASoC: mediatek: common: permit to provide dedicated regmap for irq
      https://git.kernel.org/broonie/sound/c/b49799e40313
[4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
      https://git.kernel.org/broonie/sound/c/4974ffa0d6c2
[5/5] ASoC: airoha: Add machine driver for Airoha AN7581
      https://git.kernel.org/broonie/sound/c/272d6e51bc1f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

