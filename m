Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936410;
	b=DBNZloa2rV+hfFGy6jAUgtJHOlhjN2SRIfA5A6BUfaCdzo3vDXCHsxIpU+7EBrWOPipI
	 HqW1rS7eUvwbe9QALFGlin6voIGedvKuZL1aEIBvEndPI+Zgd1Yurr5q+bN4OFdqrsGSc
	 mCRaxXNy2WdJKLl9nKMv8H7LurIjhpGrE6V4IS27PpeHimQBjveuWkH1do9l6puEdDOxG
	 WFiWjbsCBJC7b9ZtiX5+P6MHsF4mt4peMTPgzAooMSFnlo0Lw03dg9GNNdzTL2fffPL42
	 IxTtOGR6JkFeL2TpBAYzmEiyhJ1I2eLdZ5FA+kCZmwifSp8XR9HPl4kgHM5JfyyhygQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936410;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Wh+YK5GYBZZraDTZDEjxx9fOofeflJq8EylqEBbPVWU=;
	b=Igr1wzrpxvT12iXBh4bTI97cUkQkSKhXMcycN4pAl2TTI5zkFROd6ZE6aKjqlRo2n52C
	 wNvb1iyRizlWJRNvoNaP1+Oot+c5wlXR/BDZnbOJA0KjvWlVHisWAA9XMOgfWbZrdbpHD
	 VqpxkKiA5j5rgA2FMnjwMOcTDhPsajjRnHI+DV3CQ/jgErB6Y40HB/UfAkBmogSa71LIy
	 CCZyaJWDS+p2a9CkM4uAYHYxeMYWRi1gFAOdsoSWsVSO+xA1sYMRQdSLad56zmuBTGyAl
	 pbIm8zGpaF3qWlsjEEmDmZuM/lAzDV9bsBQOtfUwbF9jjTTpovmp8r+WWwiGUuvtCDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpnSKYui;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C945606A31C;
	Tue, 17 Nov 2026 17:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpnSKYui
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0521F000C4;
	Tue, 17 Nov 2026 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936410;
	bh=Wh+YK5GYBZZraDTZDEjxx9fOofeflJq8EylqEBbPVWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KpnSKYuibRluIiM3G8ImpWk6psJ4i14a/8ojlwmASUjjpTXlSOBRoyPqJ7DZ4Lo+A
	 +x3BQUWH8SsFBDkSf7xSIfY5NGd37rdjM+Dy5WVKsjXVnRpsP7TEbpx+Yz/YeZUrjx
	 3zbVD8yLtdCyyUt1ByR58XjptFe90SLU0nskTQgVps+BaM4d9EKEDSexYiRyjMLDD8
	 u9sCmG0qxRFqeoTOXDndeAC7HUcELOPxgQFVl3zIa/W1TTbjwHnKtAeTW8SzjC5oxt
	 v1W4wHyv/CYOXuuUuQFVhdo0cYQfE4shmBf6TL9ThlmGPmG7TiSLi/fPXdsks4jHuD
	 0UA1JDdtZQrnw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 bui duc phuc <phucduc.bui@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
References: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup
 error
Message-Id: <179492904204.77896.2095522512320824302.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:24:02 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ue80le/EfxT+oTQD+M3uJbCgfZW75OdtXgjrxJ1saAo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+9IWlNR/MdAs4dC2ILfiqfcU+yd6blx1eGR1YazWt+
 9yPizcud5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi60oYGdYun2Kjk19yTPfX
 9u+Zt/sKnvpz8ORKyiZ1LOe9tfpOozTDL2bRL/s4Hi2d84mf9eyKG/xKD84dqAjmZ/g+bXrT5EW
 mT9kA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 12:30:46 +0100, Louis-Alexis Eyraud wrote:
> ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error
      https://git.kernel.org/broonie/sound/c/1d1b67dcd40a

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

