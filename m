Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F135533E37C;
	Mon, 28 Sep 2026 21:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629372; cv=none; b=XZyC2HhPGJwK1YoTzAU5BD1r9oFZ8mI/r3OU8Wj5ZuhOzs9zTxMzP7/o69tNmBzYncg65HhGw0VVbNNEcpa5GYRWjHnUn+cJMXrKKAMF5htUsvp/TzwtRju5Pw7lFkcMokWKt5setnBXIDLZ1xaAwDDsNj/8VORPctZqVKQIFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629372; c=relaxed/simple;
	bh=ACi8JP1vy6pEmHMH3wBg18s78sTNSpnED25N6K88Ry4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=etzWWU505TvSPxovdxVabOYL/r5EC5H6EXeLVS1hXvORaaWo1jpkxlVTU/3MT1+AkM284b4iDgJIX3C4cctXqexyT+St1xkNnq2LvHzCiG0lvptsoGoHg+T/GLx2UN/4RxbnW1JXIgIBJzq4K2AxFOhuayPsYwkLkOL0ZB1m4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKfoaQeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKfoaQeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3E51F000FF;
	Mon, 28 Sep 2026 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790629370;
	bh=BJub/QLss4PCxue6dTp7Qay2x2SBMIQEP+RGEAOArhs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WKfoaQeAwiu9apB4SaSRWSnWvEjK7QClBBukAo/e0RO29oU6nOD7T8+Ghz8ARg4gv
	 cOhbeTpKo0V7FDPG82aUAJ0G7L/J4/cG10N2aKwrWbyVMFKVqcELuViGYZYPOtzT5N
	 zddl5KosJMDKI0YtpgG82M+iO43sCkE9RlH5PUPQsZ1VxHqsClv6gllaYdsXLccuTU
	 NvDPj0sX7+IIW/r8qmJk2XM+uO/DnFwI/dFTKcMLMlzVnyn3fp/90d52gIJFL9C40w
	 XwJRFcd5Itz0jiQr7z81wnZpwr9nP9uxwjR2D3X54tI72RoRQE7n9xYMoGykszIOSS
	 gf2JI1FICz2wA==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <frank.li@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Chancel Liu <chancel.liu@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260927-sound-dma-v1-1-8b06f971ac0e@nxp.com>
References: <20260927-sound-dma-v1-1-8b06f971ac0e@nxp.com>
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine-pcm: use
 dmaengine_get_dma_device() for DMA device
Message-Id: <179060508048.139547.10887610069011248983.b4-ty@b4>
Date: Mon, 28 Sep 2026 15:18:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ACi8JP1vy6pEmHMH3wBg18s78sTNSpnED25N6K88Ry4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqutX23SVMo7KRtNZw/LxvXt+r0/C0D2PAQnGzU
 MCbwiP8eYqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarrV9gAKCRAk1otyXVSH
 0HGDB/4woypeTz5xntKvruJyYg/P2Zg3z0Trx40LGgxepST9evykHHkL1wRMxKZb/iU1aPj96cS
 +TT4GlgAnoJm7ivGEguibi6GBYfSG+L+RDlmNVZHsBK/sUtUVWqPEEvy/zoGnnYD0fwGs+n5N2U
 LH7JWBPvqnvtFxT67gDhievjMjq32zykSkzDtpS3E9sHHXJ2yN4l2x8dPfethW20U1X9yYcneJS
 ZrSIfxaTr+vthzPkJSKdh046K24Q7bmyF33YD11zXry4h+wB2oGuljJFSlK/YqjodxTQ2QH1prj
 cL3PZValrOemm41hgj9Zku2cU6MhHceaHegBAOvQDS21CRNE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 27 Sep 2026 09:36:23 +0800, Peng Fan (OSS) wrote:
> ASoC: soc-generic-dmaengine-pcm: use dmaengine_get_dma_device() for DMA device

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: soc-generic-dmaengine-pcm: use dmaengine_get_dma_device() for DMA device
      https://git.kernel.org/broonie/sound/c/7103a8c7b2ce

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

