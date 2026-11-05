Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879343;
	b=PwkR1kOQdq0KKOi83A1v607M1Al6EOUJBSnN2jYGNIoj86oY2iv1HFiogojlV8CS7Tvr
	 UjzNv0UFSoqeYkLJD0OeRWPL+IOvcnQlljZBRRJlFGSAN49g/PSgTCsK7SlkRU5ld84MN
	 WNn0+KEWknOzhRHfbWlm/lTzkF2d+FvwHJzz/Qd6R2Q/rLp28sAenhbQbii1fv0A7N9yN
	 baSmSjIPqJG6vh8BmUu3MBajwlXtHk3gQgNW2O3VbeNW6MaO0WCvx2syILR2B5Vkx71jR
	 hNffAU74oDHW2N8PMbWWJxwJfxJ2KAgg3CnDQ0KvCKxUGF3YOx0jVzER1hBVa2ovwVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879343;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uaayokCbVv4A1cXEEvxZH+uDqBX0dAowaGyg2mb9XGE=;
	b=qKd35V8i6Xjj4CO0endWTeqWigMFchK2FbDH8Ba1Ih2qk5RgP0z8z2z5NZnJ2vHdbbaL
	 gLqUM5z+2W82JMbaypDcxAyzvC1BFG8ACma3llrTZkDW/NQL2ZsmzIVzqOvFF+n3V0qE1
	 8zoLN2xIBS0UNfqxN1xolurLwOGOI/woLCGvqYsPC1fY3FTBy9V4s3+EfbasY4H9DVZ0o
	 2tzwPT25qhRK7ory20taMSu/nzXVhqmV+DU0waPDiyNeLPvCCX9vd1eeolFwQ6f7FbFLP
	 DLTQKnb3vNfClc22/n43chqgsxPeujDmGUn4qncxjlxcQdM2OqkXVXcWSdTTFxWdMqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VlzrjAG6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F51606D831;
	Thu,  5 Nov 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VlzrjAG6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DD61F00919;
	Thu,  5 Nov 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879342;
	bh=uaayokCbVv4A1cXEEvxZH+uDqBX0dAowaGyg2mb9XGE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VlzrjAG6sSMU6/B47taid7cNtATcwGb/YZBNLb0kTEkIovnLvfxXJZ5AaFkpyQAWR
	 ERalTfZ7mReUasMFW32jlz8YwIh4pLflfSXW9g2QmhqoLtn9cUnvSX3Vx+NYy0/qsN
	 jwXijCNswfFXXAy7UA3K3HlC2dMXrHTXiJUii+IIqR7rn/QEVcE+EnxyQKUtYnUxCd
	 ADYMeWP4s+/BxFUEmy3y2cJog62v4I2dVnEhLXHIcpToQihMLSXs1A752aZ681njzv
	 OY/B9S7IFjn5xOGebzsDV9Phw+jw4fdS59ZL3ueglFJtyVDRgqFownDiEeKJ5750Zc
	 IHzEnFgOIgVGg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E4842272EB49;
	Thu, 05 Nov 2026 11:49:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
References: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
Message-Id: <179384086702.2186205.11117953235004783694.b4-ty@b4>
Date: Thu, 05 Nov 2026 01:07:47 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dsgrxpy2KP6cvgFm7+hbIpNnopwMFJSlB/+wS/jcktA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe5OqEc28Rqo8MWMv8aadtytRZQvO/HDeev/z8jnn3z
 hW9byid0FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJcDQx/FMMedHTplIk+11d
 Sycw7LCUhuT0Wu/v4u5ZD17plMzfyc7wT7/S+ehC2XM6DD4T1jpU+zt3fnJ82/T7rM0zkR/htzp
 k+QE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 19:32:28 +0800, Peng Fan (OSS) wrote:
> ASoC: imx-audmux: Convert to subsys_platform_driver()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: imx-audmux: Convert to subsys_platform_driver()
      https://git.kernel.org/broonie/sound/c/aa56acd47629

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

