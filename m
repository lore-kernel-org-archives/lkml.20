Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648360;
	b=m4TVPEL1Ceuv8jl038EsPfxSfCskQa+xWybOSuR5DXtb7X9ZNWhJxQwF8hZoKFY/8cek
	 cA2ysydPwbFsb0sLaw23RhqoRjSmGk4L/KFG8nXx/Npu3RCZY72KanmUCKQxxPE0yceDB
	 rmJ7XlD+8R+gurWDbc7O99IjXWXgEZBlNDoqKcE/P6eKGCUhYS21gWQQAcQyF+3QpRpW7
	 h9NP2MJdnifQpzK0WT4d25fTLKegPpteHn85CyNVSyUzXHCSP4AomgKV8jhWzPEIN1FBP
	 W2n9zL+eJqZLkweFlI/gxC44qouw7BlFX5DGuX8OOHOrYvM8sN2crMwxlt71qwJVEgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648360;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ySXNGRRh0WYNYfo2MorNeZTqVe+YyehhjkouIUiW2i8=;
	b=jNVgT6P+uc/I/S+zvIre/OZrojONddwn39mih8A4i2P6KBAXORl/XU37/fH7iHihYCqu
	 HiuoYiE70wNzlM1oJRW4fJNsOaZ7H7kDufQcC+7amoMs9hdJU/m/MjIlEp9fpug9l3+Kw
	 uH2NVIjxKDpsm+lc+Vo3mBfpkLSyiCSriAiHvaSs7Vu/sfu+g02khVuVys6I9XE3s6Zxh
	 kyYx2iHF3MX1LO3muy1UGEa3j8X3p9SQMyq2L17HV9vJHGBLiTX/7QzSCzEwid5d9CV/x
	 K+U4tOU+78a0nU+wv5au1keD9aAoFAq9CBL/GphffAXVvGj1hV09xKzBEakLDyvnd8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHs4tkz3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38480606A32F;
	Mon,  2 Nov 2026 19:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CHs4tkz3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB7D1F00A17;
	Mon,  2 Nov 2026 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648359;
	bh=ySXNGRRh0WYNYfo2MorNeZTqVe+YyehhjkouIUiW2i8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CHs4tkz3K2J/Zu4kswPHz2fbsKS+LJgpSTYUwqGQSDPF1uJvkfDWBZOn/+qiARaj8
	 sefoROaV8tIxkXgdXlLlb9uhjVrXDvx2wlfQbtvgQWwNId03LOGUSTIzJELwF13zcf
	 dr0scj99SdOfiKqSDvvbtwM2V3wpNW3PnXtWJDOgpSPbvzUeXQSzvT1ckDRk4jzJ+2
	 cRjQeS7kgbxi+gcV13f8SFQ4PhRs+glZ6F8RXq3+AokrGCu4YD6P8xF2LBnu1AZkMT
	 MVMW3h8CStsI2SWeq5a6em5/6w0boU0Oy+m6rKpYEOfxsFHevb0yCP/XnRwlxHcc4B
	 BD2bXG+325yUw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 10FE223DFF22;
	Mon, 02 Nov 2026 19:39:18 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: rt5631: Support an MCLK clock from the
 SoC
Message-Id: <179362755898.1990291.2052812221395248416.b4-ty@b4>
Date: Mon, 02 Nov 2026 13:52:38 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4JcP79LVo77JRqGfD9ZQDr1VK32gFGrzMuM8CyrkQwU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJePHsqUqOSI7tJwKDNdL1dt2eE7JHz7jqVxeJTHxx/Y
 duhEqrbUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIncjGJkmKt2TXVr4mwtv+Q/
 0k97pEJ/bWwoW6uzftfle9E3/OSLzjH807jqd+HyiVOTKlkuZfFwXrYM03IMCl6wx2wt743YzX3
 evAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 01 Nov 2026 15:30:33 +0100, Romain TISSERAND wrote:
> ASoC: rt5631: Support an MCLK clock from the SoC
> 
> The RT5631 driver doesn't take a master clock, so when MCLK comes from a
> SoC clock output, that clock is turned off at boot as unused. This
> series adds an optional "mclk" clock to the binding and enables it in
> the driver while the codec is active, as rt5616 does.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
      https://git.kernel.org/broonie/sound/c/4ff0de1f4a82
[2/2] ASoC: codecs: rt5631: Enable the optional MCLK
      https://git.kernel.org/broonie/sound/c/595aa5f68e6e

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

