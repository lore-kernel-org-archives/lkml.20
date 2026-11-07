Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064652;
	b=ziAm+Q3vysk8sXzdlDr4wc9vmq5CAm9TNA63oNYYHnn3TjcNgp0aDNadANMr43oddiUC
	 KPg8Pexco8X8E2n3pbrz3/oF5g4Hmn/Vv0EHxaTcGBtQrEoNkJqN4U1VLCv7xb0KCuL1S
	 5yTFgH9jJdCGgxppAs37QywwjcjibZq2//Zt4DEU7g1ZM5UT4qwqgmAcqy1QFOkPfPbjt
	 t+KxfYWlvVBXGF2XexItVHl1YXFC+CsNEc2aj4IVqxJ7QitOqowSNjROx4Yi4f0Rz4PBb
	 4/LpKDoeEvCdWRopiT7lBkgNYOBv8IE5EO4R4xhXSlmNworYVyS0Plg7Pwxafk20zbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064652;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IHcP2zA/1WKtjATy35bTJOAx/MK9QFjmushPyiooQKM=;
	b=VxdzuX2WePS7qgutPfCzHM95CYmgzYNGIDRRnyMEw9Qi9G4CILcjz3FwuVEjUdWnWBxp
	 T4hT0K8k9MxFJZNQPVYrNby1YIV9djVNTgyO2snUMKQlRSKb0/lVOePKKaf+xz9ePjwIe
	 ippBNwNOmS/Cye6RTYh/ue4ZSmXqdH2HWSvTYTZd+xwlTtxiqFcgcTMNz7KZBOYDy8LVO
	 NZ7Tkq/xAC7Urv3nawQqCNLtO1rqV+ejpCC625N24httdoTgSFvPHvHZyXRd3iGlV/1d2
	 bd9BUL+0dpq55Ud7K9l+mfKsDTjyxbE2g/aKEc5X/h50NUhS7YT9MnWIEHg51Exq4VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIiTFQEM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E9606C027;
	Sat,  7 Nov 2026 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIiTFQEM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7F21F0089F;
	Sat,  7 Nov 2026 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794064651;
	bh=IHcP2zA/1WKtjATy35bTJOAx/MK9QFjmushPyiooQKM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mIiTFQEM0v2NRdhCRHkdy2hg+w14DBRtu9RGSoZdJFgvoiFnypImuv0u6kCy2IDuT
	 nWuQopx6voUlVtiPDy6YE4v3sDwE9SzZHJkyQjq825KWaNmZHGm2vQsVPCi4iMPzdn
	 4dH6my6lChCyKIcGthyThV9RfYltZ/3NkB/HPK+Y77lNA8kaAAlvGzovSypxZR+fhC
	 3JxhLVIgGTkaBcZ7Xn5gV3xMtHWqd1DS9G7gzCaGyKg5fjN69XJH9m1GX01lqMWUNc
	 Pa4yvCyC2LuKiMNuyQyZx0oAqpS6m9HqpPrE9WxfVG/p4RRI/URwKpYKQgxmTRH9Z5
	 17gvaWxb2SVeQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C3D4D2AB3133;
	Sat, 07 Nov 2026 15:17:29 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Birk Skyum <birk.skyum@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261018220857.16819-1-birk.skyum@pm.me>
References: <20261018220857.16819-1-birk.skyum@pm.me>
Subject: Re: [PATCH] ASoC: qcom: q6apm-lpass-dais: Reset the codec DMA
 channel map in hw_params
Message-Id: <179405428196.3424803.12425958325069301579.b4-ty@b4>
Date: Sat, 07 Nov 2026 12:24:41 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W3qZq+vVv5QaoEW0JZmNEswhu/a3a46gXDbVs0bV6ZM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeO3IG5+5fKxXxMF+9Pb+4ccu9a1Fbz/0XvOwW1/VuU
 Zt3eOfzjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwk9REjw5bsrysevFuZEjbj
 e7pNCvOsK/zC7x6FPtwkc61I3Io/ooiR4fxV+W28+3zeFTyPC+l4/2XrBREHsa65z6y2LmXUD1o
 6iQMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 18 Oct 2026 22:10:41 +0000, Birk Skyum wrote:
> ASoC: qcom: q6apm-lpass-dais: Reset the codec DMA channel map in hw_params

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: q6apm-lpass-dais: Reset the codec DMA channel map in hw_params
      https://git.kernel.org/broonie/sound/c/347e02073b08

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

