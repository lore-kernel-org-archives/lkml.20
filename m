Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251303;
	b=fr30XkEcSLomFT2DfIe6WUB498oCwDx8BYXHEggEyvg3MTPJbpopP8trTMkUW1KXa7Wg
	 lYkkmkoBLSZIQ46lRPyXW7lLcpRCQFhuLRRDgAYBQkapveqmsjrHvDyzMjAr7VrxZ/PlS
	 qoYneC0Sn+DzucSG5hNLpmfUPjMBKMVqVIOQYndGZRiC9prMW4N6g3JKVTRgmYmOYV8UQ
	 qMcaryHR79Vp5ieDMdb2rLJV0Zxm84n1z14SEI0d7osRTuxKsczZ9sptgLrednaVOP+6I
	 Vk69/dC86VsUMmm/EYUHp8E/nBauh3VLMq0xXPwsgc2WRuqdgSKlOZ+zXTvYlpT8lvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251303;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Td/mNMTGyqNop3iBhfVu/oBdBU20/htQYFGTW7D/2Ik=;
	b=iT1JNZui9NTrQ3Y5xAb4t/CX9SDRh9oQ97fxZRU+PJz7RTeS+wB2XEqdeQAswdtPbwrR
	 Pp3JF6UUh4rRU8wLSI8WGynqBGihea14znXeXTNwtvD3zsTt6LX4/biYcUtDb5V68UHht
	 1k5Jftr8+V8hznhlsa7nuc8U1ZMHcHWaWt8rx95KcmRup1DsosK6N86yqi7Ar5tatXCfx
	 oU5Lo3YBG5Roh1pCET1z/hFskpXSWjd9gHW1ZzLW5USS577nFnUwcGaxUmkUvciMo4zvv
	 AlADo1iv3BZS/UQYU4g3B3GdF8uWSoCEoGmnhR71gqDUL3wqwV5EwLUxoGP9OtOUnuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IoGPdfwE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E42606A31C;
	Mon,  9 Nov 2026 19:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IoGPdfwE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CCA1F0089F;
	Mon,  9 Nov 2026 19:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251303;
	bh=Td/mNMTGyqNop3iBhfVu/oBdBU20/htQYFGTW7D/2Ik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IoGPdfwEeEvgg26OvjfpuPkE3TKiGNdlrlcyNdeOzkn/83p58SLOyKeHeNwEEynuG
	 +IB4xorOvyvIphSQJ3Fsry2xe7CfalGdZ89W6vSW+/sJ8p4KrazI65O7OWCRCF5IAg
	 MiQXdv1jXWaIGU/GqIO6FXt9aUZCLqM0ArJRQGBDeiBcVCJ+yOe4Ikiivsr3RI/6Gd
	 po2VfFTq6/NMPOfBH8uea13T5Mogt5wcTOwwVAiljoBjBxANRo+BbbjBBizXxs7Xl7
	 7D6XLfwbOypQ1lkGEfWufNrmZcRIGLt+/lBbdozbShMILQ3sotIkMvInLaQXn1TT/I
	 xHIJbL7QfUYeQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BC9B92F70750;
	Mon, 09 Nov 2026 19:08:02 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
References: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
Subject: Re: [PATCH v3 0/4] ASoC: support the ASUS ROG Xbox Ally X20 audio
Message-Id: <179422721414.3711751.4806424761629006817.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:26:54 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SMb6pABjsjLAwOsoTGarVOQ2VZnyUOlkFFcSaM8l0vY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+SQmlhhtd+huw9uVyFoWw3Q/mr1YxLfFcvPe8RMG1l
 7K6vtY2HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjInQcM/6znrHuzXehV8Jn9
 rnEccyy8/2xek7Raom/n8S0pH/jYFnIy/Pe1MRH/pSSfZsly7uY7z8RevgqJCeu7b14p+7wsvOv
 XEQ4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 14:57:59 -0800, Matthew Schwartz wrote:
> ASoC: support the ASUS ROG Xbox Ally X20 audio
> 
> The ASUS ROG Xbox Ally X20 (RC74XA) moves from the HDA codec and TAS2781
> amps of the earlier ROG Ally models to SoundWire on ACP 7.0, with two
> TAS2783 amps on link 0 and an RT721 on link 1. Its BIOS marks the ACP as
> legacy DMIC only, no machine table entry matches the link layout, and
> its TAS2783 firmware in linux-firmware uses the four-field name that
> carries the BIOS speaker ID, so the speakers do not work today.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: amd: acp-config: force SoundWire probe on ASUS RC74XA
      https://git.kernel.org/broonie/sound/c/817b86669dce
[2/4] ASoC: amd: acp: add ACP70 SoundWire machine entry for ASUS RC74XA
      https://git.kernel.org/broonie/sound/c/88363b2c5f0e
[3/4] ASoC: tas2783-sdw: use the BIOS speaker ID in the firmware name
      https://git.kernel.org/broonie/sound/c/9d28c97118d8
[4/4] ASoC: rt721-sdca: wait for PDEs to reach PS0 after powering them up
      https://git.kernel.org/broonie/sound/c/ab0fa5d151b5

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

