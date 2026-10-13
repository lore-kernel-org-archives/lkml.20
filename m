Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D575172EB;
	Thu, 15 Oct 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060325; cv=none; b=HzTkmySqzG8ZC0yc2TkgCSH4RviO6Cm19wEX2phuh2cxDFoE3GY4Re/NI/s4bqfoZgJ/2hYH7Hhg0Sa6qCvViHdYyLgqHV9HV+TU6bWda4zVQXhKPC0vbE75VPDBihdyj4hWeEfoRTe8g45o2pd0LM0Zv95a06amIFOOzjwLQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060325; c=relaxed/simple;
	bh=nGe6k58I3oJCWTNecGN8SY+3eIvLr3w09JkHMiZvKmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IOwpF3KkFsCjrkz4pCJYkod9gnOmzY7mPV+/6ztJFEEs4BzmJG81I6IQG0bDJaCXPyW6r+yrBTXDm4D8+XagqhKDyN83/QO8Ad/nJz1pJe4dgsBl/0o10MbsAbTGxBIY/Tv4W0smKq0R2O6bKezZX8XVZlr8cVUhkckonNRNT8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDYch1M1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDYch1M1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6951F000C4;
	Thu, 15 Oct 2026 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060324;
	bh=g5fAL6BtxNcOQIXnaFA1UzDQKFUzFJbXS6uRSNGokOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eDYch1M1AaI/BrViyUWrp4VT7eVkXE/di0KdS1vbPLmmBsmvXiN2+iZ+woVZOBvwi
	 9gIRThYB+wugKariNCuJ2BHhcRcSUVxFAQGmEfKd4z5MsZ66IAGbW5R6IX/2XJgUS7
	 nzvS20Aa78IcmM9P4vulC1PB8vNmUJyf8R2Dv9SLYM6Y1QkauenQb+4jyxkbq1GHYs
	 hToOtTQFVj0coxS6trUj5r6mLT9Jh9CHQeI/o4C/f5x8Dgcc2+bDAFS7fj4Yteq5Ig
	 pjqFGa1KTGBr2kZjwyZXwNU2WJgcqyTg4yzAQdDMe1nHhRksecxG97ohlH7Z5PtRpi
	 tNz4LicR+GzPQ==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
Message-Id: <179190773817.42298.3099194075465995539.b4-ty@b4>
Date: Tue, 13 Oct 2026 17:08:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nGe6k58I3oJCWTNecGN8SY+3eIvLr3w09JkHMiZvKmo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurJ5/s1776Kugc+Ub+Hb9nmBUXWfR+Hpzqknjkk+MM
 0x9e+R/dpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi/18z/OFaqvVf5r/fzy3i
 l5sdH3vN6r3032/1549Htp7cXtGyc3M7I8PZx16HZPJY1rzQlqn9e6LjQYHNpW0MLKrcZprHnDQ
 Pv+MEAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 02 Oct 2026 11:38:51 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel-i2s: fix clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes clock error handling in the Atmel I2S driver by
> propagating errors, using optional clock APIs, and simplifying probe
> error reporting.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: atmel-i2s: fix MCK generator error handling
      https://git.kernel.org/broonie/misc/c/2e2da92de9bf
[2/5] ASoC: atmel-i2s: use optional API for muxclk
      https://git.kernel.org/broonie/misc/c/be952abd69c1
[3/5] ASoC: atmel-i2s: use optional API for gclk
      https://git.kernel.org/broonie/misc/c/b431a055fb76
[4/5] ASoC: atmel-i2s: use dev_err_probe() for pclk errors
      https://git.kernel.org/broonie/misc/c/5421a0a39d43
[5/5] ASoC: atmel-i2s: remove redundant error message
      https://git.kernel.org/broonie/misc/c/c501f9873aca

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

