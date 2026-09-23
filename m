Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05925304A1;
	Wed, 23 Sep 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170153; cv=none; b=duLxmaiU9P0jxFSESskNOEj35PTI150m+v10PrTbJO6pczE3T39/hLHW92a0Bc5JTY4jWVK1Nnk+T+eOfjA2je4x/GIjy31JnXQMCgtJEtGYm7CNF23jjofV8nfJMR1N+6yBsZL1Z1MpyLl1Dn/LnACUmhhnPVByTWsYfgHeoeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170153; c=relaxed/simple;
	bh=geG71kIQHu4AeAzA3LdZm2dSG80TTngPRG09cR08t3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e1Fq7ZZtYGrEpMAVSnKBrqveBbW8sh41rV6pK8P87OZ0SVcMSgBobOlWcJUROWQkiqbaAENkiYf1VX1PXDeKwOybOugWlr2uk3aLwMGnUZTzTqIWc1tXOW81cf8wFDH5BSTHrTLhbfX3x8QTaV4NPc0F3w4pmvIM1nsEgGCsA6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doRlZZsd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doRlZZsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D762F1F000FF;
	Wed, 23 Sep 2026 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170152;
	bh=wuZnGbcVSoDdUYd590lo0xP01Qx6KBsw7GVHfUbfXc0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=doRlZZsd6urMjfEKAwHUt/zzQSZjpWmWe4tUFA4h8YOTp49a6ELOpzI6Rf9fYnADu
	 4mmsIZCxEyowCv5FYdrd05mI1HSiYHKKHJk4okgBMQbro263quWEuXCOQdDZIWjOKq
	 RuaecCR+LbzX+FAntGpTtQyURfW5/aj9LfjA9qXI4ifN+Ehra8jmyo2IaZ8aklJK6k
	 cXetivXMwiXkBzy2XioadBrC5Ygd0TU8HjJ/bSJIgd8DUbX+8kNKamRsECNoiLYAra
	 R4Nosuhc+c0a6RV2hSiT5rWJ+nWzZzMsiJPX6mN1LwBlOcx1VtjoYDQLkJP1Vcm4P0
	 sBEWz2niYELwQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922183128.289564-1-robh@kernel.org>
References: <20260922183128.289564-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: hi6210-i2s: Allow graph ports
Message-Id: <179015959360.322763.6533233354859331541.b4-ty@b4>
Date: Wed, 23 Sep 2026 12:33:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=geG71kIQHu4AeAzA3LdZm2dSG80TTngPRG09cR08t3A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqs9QihWVPK4llzrDyTiHWMUNvkpVboF/jt0Lab
 YRuBw9S+ouJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarPUIgAKCRAk1otyXVSH
 0H1mB/9jDvdTOHZVbv03ObVZGwmN+Aa7jtGI6PQJFqr3gKhx3RaS+2kmC1aR/3pW61xt3OX2+zb
 oJlagwC1rso4/PSq9wKpSYlL4PWnZMWIWoHyuJWMsnk+OSWKkogSY9jqy0IpuVkM1T9OGNDC7o5
 190zTwaWkLu3wRoMMnHzWtZxZiuVdFAfDRvmu5zBr3xm2Oltkgq0Q4leIhk7GaG3veKwa7LufI3
 MR/vu2JL7nnIKGTe8B4FWTMg5vXF2SJyu5pDPTmV8SQmSw4BRoVKRkefAX4QGC1vD2fQn0Onu12
 folSzZTKK7NjuLUhernk0HLRKkSkjBhnrGfbkPfke23kNzBj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 22 Sep 2026 13:31:28 -0500, Rob Herring (Arm) wrote:
> ASoC: dt-bindings: hi6210-i2s: Allow graph ports

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: hi6210-i2s: Allow graph ports
      https://git.kernel.org/broonie/sound/c/425733d0aea9

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

