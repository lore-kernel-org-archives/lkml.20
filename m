Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648359;
	b=cHOjU9aAXpjWn+CqcuAA3MnZSl5lJaVgUtiHs3fSIULcI0QdzpNBcyu1r5Zv5HKwW3qz
	 vlLnaiDYYByF0RF+lPqFrTJhec04aUdsOsHAFT9aBcuhjJiDnC2HbCIN8hbIdIQoZBMZg
	 oAHNrgZwvfPoZoVC1y/+M3VFbXsbmLPVrf59YUk7b7g/e96c2J8MRAs466NQ4K5L1aGno
	 uIwSfTSSdomg56LlhtvDqON01QCFUOMQhCCE6UPa1aNvq9DxNAiU2cseG/Q+d13G4/e0B
	 vUsi5eeSpFSgtBgODrDQ/ucDALKWFcDaGP8MJKhxXtxsT2oUo6+3Z4BZp5/SNJIS1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648359;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JbMEaLInfJZTikyj6sTbndfICmjNer0efXBtfT3t/z4=;
	b=JD5R9OAbg13jKOF1z7pb5la//662h+/qeUFJNaWDiXJX40ZM7/ksPxU6hvF2FWFibSbw
	 n6KKpLsRmCnejzCZlmtLGQJGSicSJgpdCsT0JpfdLBj27+YS1oIfF9cqRiyb1AEf3tczz
	 /W2/RpJ/SxBRAfXpEafsPw/ygkwX7aNyUFvnBdqxnIhyHN0/CuZWmkI5htTAs9bHM6Wpd
	 hzcwlE2vHB/n8Vy6eI8pp+Rm8YgbjTwuKasaPcoW/iUjkMGdtp6fM49FJlzIsiEROJxBi
	 TDdqd6zcGEzwFFgY/BHGhTEDhnri1zw2Ee0es9GElB5v3HEX/IfczIK0zqU3rEkZ5hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e97rt7+f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEA606A326;
	Mon,  2 Nov 2026 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e97rt7+f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D78F1F00A16;
	Mon,  2 Nov 2026 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648359;
	bh=JbMEaLInfJZTikyj6sTbndfICmjNer0efXBtfT3t/z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e97rt7+fYVS06nnercX285Pb/2VysLZOY5Ijme2sohfOvFOKVsaY9E+Sj+gwD1ulJ
	 MwHVa8aF8UjhGdwWt6QruaR9HA5g9wf+vblucB1NXg0ntlaPNV8pCKSbK7EKJZJbhj
	 zRBjZk+PFYGFAopr5Qy267xd1sfVGJ47cnOoXhlvJ/l/z3cd/9vSaFncABJwO4cnjO
	 CuNyvBrhvCCa4/+daiTyMDJtQb/QBXebIrXSPGThAUhSZbUAWdFqWPrVyI/W9+6Smt
	 DVsFgeuwQY7sDdonzE79SifCG6LQ5fO/w1Jd/ABEy3AxivzLCla2acQvpmu2cPOg2F
	 SCXiL5BaSRCqQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AAFE323DFF18;
	Mon, 02 Nov 2026 19:39:16 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20261101080926.267041-1-jerrysteve1101@gmail.com>
References: <20261101080926.267041-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH v3 0/2] ASoC: codecs: Add Everest ES7202 support
Message-Id: <179362860891.1990291.9978990707739127303.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:10:08 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593; i=broonie@kernel.org;
 h=from:subject:message-id; bh=57IEY5sLI0R//srJiFo6NAVqvbCrI7pKU9CTHZdofwo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJePHuyJNJxogH/crU1D3XeKQRMSdjfd0tpc0Gtj68L2
 ybVs9ULOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARW1tGhp4iDlnNYNNJTe6B
 KQyXPGNkilY2peq+PNW045HB5mUbJjH8LzePqJoYY9eeteDFyua0U0W8fHuPrnrbtfq9BZvMqnR
 9RgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 01 Nov 2026 16:09:24 +0800, Jun Yan wrote:
> ASoC: codecs: Add Everest ES7202 support
> 
> This series adds support for the Everest ES7202, a 2-channel PDM
> analog-to-digital converter controlled over I2C.  Patch 1 adds the DT
> bindings and patch 2 the ASoC codec driver.
> 
> The driver is based on the Rockchip BSP driver, reworked for mainline to
> use regmap and devm_ helpers, probe the device ID, and report the actual
> per-step PGA gain.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] dt-bindings: sound: add Everest ES7202
      https://git.kernel.org/broonie/sound/c/ded65056b6c9
[2/2] ASoC: codecs: add support for Everest ES7202 PDM ADC
      https://git.kernel.org/broonie/sound/c/063273b18195

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

