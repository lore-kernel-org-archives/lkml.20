Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BC249BD7D;
	Thu,  8 Oct 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463279; cv=none; b=I3Fn16QjUFLiC2qudWLIlkqUXd9DElBA3IBNLL8gfAvWSY+xScZOIDJsTqcrriF0kd6MbLCKt8xxeQJAqfEYUJW3Qhsb1/7XnpDkjcBv5DZaVXQNPViEaSxjvkvVElSwzapu6ksSdsmUzJReiJmzzOM1/mHaaEkws31WK86yVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463279; c=relaxed/simple;
	bh=QY1B/YC/9U9/25uIL41mpvndoi/nxHgNpTP3ZhxQnAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rF5JUMy1gwKjRZM8xCsTdvOV8PVmdGzhwgdVt+PsBgEjjZMCx4Lb5DwU/4sH+xEjFV0/jIlYh4fZ3tP7ch9K/FBLaGXexZoo+awmoEYnLfjH8c1wyuTsePotS5yX81PFrUQF5qxNmQfyffOZ/d+AqaQuXxM2E9unzHPZpv5y0aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDEhTpZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDEhTpZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AD81F00893;
	Thu,  8 Oct 2026 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791463277;
	bh=tZHgvot9XBR6NDc7d2O3La8Sy9kro5TUOFUC8aNnoG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HDEhTpZZ6Ki0QKgJWh1sFFKBgqbKYoVJSWGWHgrHE48O8aKf1aBLavbl4dtrHiX4s
	 co0a7Tg7igbIDeaHR+6kBeCzyW1i81CjMQBsRrrfWvTxegUskgGRQYYmc5Jub8GHez
	 QQvpqWUOalJPBN7GMzQZZYvDnSnApcXI+hS3ItYjUJaQgihX/b9/SDnZ3sMDdjQJwP
	 5CtHZ+dmROCZNCjIlb93PZDYpKLGV2NmWxFGzqWG5lFA6McOfFLHeACA2/4OqWibxM
	 jb/lVsyunUQkulu5N1PQ1SEY548tETp36fIqHEmAi2AVKfXBoDw/hv+7qnINpSHhgs
	 huaW9xcnz9x8w==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 cassiogabrielcontato@gmail.com, Haotian Zhang <vulab@iscas.ac.cn>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
 Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value
 in FE startup
Message-Id: <179138999054.2423942.10212092263791353501.b4-ty@b4>
Date: Wed, 07 Oct 2026 18:19:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QY1B/YC/9U9/25uIL41mpvndoi/nxHgNpTP3ZhxQnAM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKO96cePxj5zcWdP2KJU6/bh/aeNrGQWcZnFykf3s+w7
 FhJRe3RjhIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEyEaxbDf8flor88Uh4aMP1e
 Z/720qbwgs/RDMu/8/bzXy9te7M5ezfDj8nl+t94tNdbcbXlhvSptN2tCrt05c+SpP4p91ozriq
 xAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 18:08:54 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: Handle constraint return value in FE startup
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Some FE startup callbacks may return a positive value from constraint
> helpers, but ASoC expects 0 on success. This can cause .shutdown() to be
> skipped during rollback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: mediatek: common: Handle constraint return value in FE startup
      https://git.kernel.org/broonie/sound/c/5fcdb40a4776
[2/4] ASoC: mediatek: mt8188: Handle constraint return value in FE startup
      https://git.kernel.org/broonie/sound/c/71253751586b
[3/4] ASoC: mediatek: mt8189: Handle constraint return value in FE startup
      https://git.kernel.org/broonie/sound/c/1f234d33e42e
[4/4] ASoC: mediatek: mt8365: Handle constraint return value in FE startup
      https://git.kernel.org/broonie/sound/c/8de3f4e8e811

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

