Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871954;
	b=bO5gFWtGJ19eYjnHTooR/biyH4TSNmNGp96GE7HpF+fmcaOmG/sZBmMrcccIMpm7gA1H
	 bJr6liXPODfqvTuPo/yy6dN+PpzVZiDaK1e3BwfNsEGYqAHy9wvQQ9ncUS1RguO6Cz8KH
	 /RK+0EVsQfromdCPQKT5uHdHQ7a7Ju1mIOCVQkWdgIetbq5pulaiNoBmTLpGhQ91xy6NQ
	 4I/CwsMoS3N6telBcYPyd2Zzk2vEYJdPr8l+BxA5RylwJRgf8cAoq0+8XEnWR9lAlUCji
	 EKcr1BBRBCTT4SKf8t2AwQrjNXjRfw9E09ZjK/bv75Q7/VzdzD11X11asf6jJ8FVWKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871954;
	h=Received:DKIM-Signature:From:To:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=axD6JuqYYkHzHzkkogAs5CL/17/Z9QAyU95DACYygPA=;
	b=eO3LzKAqa8fd7MEpyP0c7+iYlqaELmq3w3UJLHG1AadwTRjdlYb/8qzjBSNuyAXOCEzh
	 D0uJV7MrZZb9eTFeHFgRUIgDhNjdpGSFTAgdIWACsu0Xm+rDsDBJn2D/WySJiehaTAxAC
	 DMQa4sVrCnldAEgegYXl3hwUjro9amzDfqX6Qsf0euExPtej6vxJnPea/s8GNKtxVjnGK
	 f/9ffKccSm9EZlAHkbhPrbVR1b3MGdRgl5VTLbHvpRAv9q15UZXzTNT5A4AR138gKZP1+
	 E4kXd3EUyk2yXTok2Aw3FXN4xffLdfe3F1MUERTlPOuNcC0Xf2Fdh0x8d5S4R4qm/ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmrF1IRU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932C9606A31C;
	Mon, 16 Nov 2026 23:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmrF1IRU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29491F000C4;
	Mon, 16 Nov 2026 23:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871954;
	bh=axD6JuqYYkHzHzkkogAs5CL/17/Z9QAyU95DACYygPA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=SmrF1IRUbYwqe1+x6yB4Ez/4EaMOqP05/mxdGLEnNuvKAKoOsYGtm0z75f3Bqs+hk
	 VM/l8fit9ynw9XP8rVSnF4YncYEakYzNUK3XeXFV4fYqyV1oXh6hx7Z4403cRJUecd
	 eV2wA+zUzOWmTfr/hPBWVY/bYEZYf7V9qOPy5/irD0ABiejdGDKHs3eJToxh3ySwVc
	 NwhmdqFRLM7oUHC3MuUr3YdZ/durabFO9HQTzwPqjnnmeIKwizF7N0nVrsLvzDolRc
	 YTmsXB8rREUDdzlX3+UYgWC+ThWcwmcXXNbYA88NWmhLduMpTD9RMHU8bIQR+TXoU6
	 LsZlbrsgbQZIQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20261026101026.34318-1-ansuelsmth@gmail.com>
References: <20261026101026.34318-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: an7581-afe: add support for reset
 and secondary IRQ conf
Message-Id: <179486030880.2504946.8819617613005483492.b4-ty@b4>
Date: Mon, 16 Nov 2026 20:18:28 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aGoCOZP/Q4l/zUrAd/k8dCC8y4drCbim83cX8HAtjrI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+T+oL67Sf+a67bvIDOUHrhpW7AuRWngtX2Ppq8qIV1
 vYp/ktudpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiJrcY/orFTpRtaG7pLt30
 o3cGs67hiq/Gq3wcwn6XB9qsyda7a8XwP8rqQoyFBLdQBHNos2Hw1lyNx3sXiCy9cOmwfPxKj6c
 7eQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 11:10:24 +0100, Christian Marangi wrote:
> ASoC: dt-bindings: an7581-afe: add support for reset and secondary IRQ conf

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: dt-bindings: an7581-afe: add support for reset and secondary IRQ conf
      https://git.kernel.org/broonie/sound/c/2efe1bb1edd3

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

