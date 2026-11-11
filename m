Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428255;
	b=E7IIOGvJmufL8uL9DmYZK8HtLmbupvag2cFU+1KQbj2Qu2auTNf0YEsGl4g29YdJ8mFD
	 3tKXf2tBKgyv4IJlgFbvBmUvuRisfNY9OvmkzqdbXV+zfrBQdipGrWpFKzqb9BFZa0ew7
	 cK8CJF5gTkXNdZJp6pqeSh6nHpShH2R3I3OswAcCEq5wSPwK6B+/iSwa3+xnw89yRXjWM
	 QrntfjYFTJdttpI+K1S8teIIA8YLWOmkD/VgRpCODEDgPCb5QxJc5K9pH+6nMzNGejaJR
	 9fBVRHaBEXIRcFXCr8U28e+f6nuJDFSkyWKVTX9NxhCMIJtBO9xZrHd7U+ixeJ9DYjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428255;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PwBL61PJ01ugV2zKaAESuvCkb0ROmr9+qKjPxuNeOAk=;
	b=BwSyERCPSAftnz1NzUVqWm5UsKAVClp7hcf/F+5vxLYiX58w2nMRPwpvj7bu6gHIHYXq
	 5tQ1bLTfMwDGInuTeRl1PTx/GpFj8ubsSHyi47QwrFgilIR/DFDy0XF2BjO8pu7buAn3E
	 htbW35P8DxLp1poeikrZRFW2d6ekOApY4dfKWXmvfndwksV+LEeXNQD27IOegsD0qGxR2
	 MVSiC3tGSJi0QAPAotFTkCkSX81+NvohnDLQRsd1pdfSSq+pu3vxiLYM+FxUdgjnk6Hax
	 lh53MvW3CWiUBipsPNAoIfSW6ePVBp55I6A+w/VDy5BfgvqQ5juCjA250qTBnMhxkxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWrhXLge;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89FB606A31C;
	Wed, 11 Nov 2026 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWrhXLge
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC8E1F00A05;
	Wed, 11 Nov 2026 20:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428254;
	bh=PwBL61PJ01ugV2zKaAESuvCkb0ROmr9+qKjPxuNeOAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SWrhXLgeE+FrYfKyBsU6DYfAGhooVIPFk0Co+iwIkOeGT/88SfGOB02fVpdK9iUjo
	 tJsV9YYKyzWDY2jK3xyqXS5TB307Y0uInW+s8x7Ioo+wyxMghlRV3zHskqD23gIDZG
	 kzgP60EQYbLlih0sGhbaz8HtNn/+n+w/WRFdxC9Iyt9f3UIRvKvXPTqa9miFdOv8iu
	 4CtN8IfNoY3ur55pVxSvWHSUR7cFSa/F12+C82TySfelWjIUPg0PjjH/6VeZsv1BVC
	 qWwkTshb/bpDj9T8xXAIHZ5rSETLBO9Xp+JjGoDwdqC3VQsKzDvsndGse2T4pVnZRT
	 VlgpTiyHcZr2w==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
References: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] ASoC: cs35l45: Adds support for brownout
 prevention engines
Message-Id: <179441367703.393238.15653744808554406033.b4-ty@b4>
Date: Wed, 11 Nov 2026 16:14:37 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019; i=broonie@kernel.org;
 h=from:subject:message-id; bh=drDyoQTvnZT8AmPzGgIiJUyY5+pOkn1FRpCvNmmWt7A=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+nI3KfLh39glxx8WzOLiNWU1XxF4L5vhxpNhRRHZH3
 Z/7/6V1O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRA7oM/+NMzTXurMkw8ewr
 y968Qy9tTf5ODSGBChVBz+ePPwhyNDEyXFFoy13Tei3RsZ/bj3H3Qu+LdyJePdr02PD71bDlbtr
 /eQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Nov 2026 11:57:02 -0600, Ricardo Rivera-Matos wrote:
> ASoC: cs35l45: Adds support for brownout prevention engines
> 
> The CS35L45 amplifier has two independent brownout prevention engines
> used to prevent system brownout events induced by transient audio peaks.
> 
> The amplifier brownount prevention engine (ABPE) monitors the battery
> voltage and applies attenuation to audio output in terms of either
> decibles, voltage, or wattage. The ABPE response is configured across
> four thresholds with four corresponding attenuation values. The attack,
> hold, and release parameters of the associated limiter are also
> configurable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: dt-bindings: cs35l45: Adds ABPE properties
      https://git.kernel.org/broonie/sound/c/58439294499f
[2/4] ASoC: cs35l45: Adds support for ABPE feature
      https://git.kernel.org/broonie/sound/c/4b261eaa7e58
[3/4] ASoC: dt-bindings: cs35l45: Adds Boost BPE properties
      https://git.kernel.org/broonie/sound/c/65aa9fa9afbf
[4/4] ASoC: cs35l45: Adds Boost BPE configuration
      https://git.kernel.org/broonie/sound/c/ac474574e54a

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

