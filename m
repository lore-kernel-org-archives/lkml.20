Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145477;
	b=YdP3EVJ9v7IzKz4DokNoF0AIeHzuKytN1rpzTRCAw+VQ2am1ChcCnGgXqIKdUJNW8J7Y
	 hkfmivXB6cvPHR0Lq+r9l/G9VlyNLvSNAPGqRSXKR3d6bwkbxl99ciUzTMEhPeXxN2IfH
	 QVA5Qxypf2FTZFlO1ydyGEpgli4nx8+mxxA/RZyX5GWkPPsbXuFSDjgoFBoU546QZz3eQ
	 PEHlMpzkmhXLrfyMUkhT912rPUV3t+wA3xAGp7FH+dpMIWjivxaRq0xMqIU1dPWCI57/c
	 hAOJARCbtpByKJVSRjpP1cHBMyacnc79e3PUyhUq5pxKrVCmbjDhoFSd1d/qNDv73Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145477;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=A+3QXez5hXJ+ayjKDjl1I9e1rtrnLR+Lcr3Xxi/T/SQ=;
	b=Ra0A6qBKEoQt/aK5NcufAkU1LAbBhL7A41Vl8cXhteaxTYPFg76q6GEmIkZaz5eVH6rP
	 vqGsIIUMYFClCZ+HBqI2gSj2xJppgdbVby4fcOkqaFFdviRsq4yLHQtrQ5e1qdxmPBqp2
	 RSKEJGrTBy5Cu6/svcmRaaI/dQb02loy0Lo7MomvG36psQ/Z9nWtipJ+BBGytf0Dl2nSs
	 l0nd2XgLZTfvn+df8wFMXMHSSJN8+LDzJtYieBwZoZsaDdHpJlw7w0264eNqxNhPzJz4L
	 5w8pXLiqMcFp8PccbruEHjGNG7lfBV/nnc1IUz23zCAbbOzRio7DCriSrS8KCwQShNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZ41GiMZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C73C606A320;
	Sun,  8 Nov 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZ41GiMZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C411F008A1;
	Sun,  8 Nov 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145477;
	bh=A+3QXez5hXJ+ayjKDjl1I9e1rtrnLR+Lcr3Xxi/T/SQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YZ41GiMZ7LsOgeLQxKQKzEetgdrn06s7GBXpW5tTRima1s1Nqvbclj8ChgX2bNFvN
	 j0CbbbClZjWFNbAXD3/NvFj7dQph9BSgQWgPpdQteDiqcrrDUWuwRoTHrd9dCASmE0
	 58TTOghF3xGWVTCoSFrTVTUkDKuJNlYAdFGsOTI3rEg8k79VCpTP3uRPzET5+vQc1m
	 OrKL4wIl22LBXNh7zd+Kf+i1WAjhkDpq94Te1vcj07uO6M1mgSguHwlnCvwrQcoD38
	 53zI90g274tKn2kXvzWi44MUSJpZaZDljRw1t/k7wvXujITTK2Sqa3ZKvVBNCVXB7j
	 gfWPjytunBN4A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 111522C79350;
	Sun, 08 Nov 2026 13:44:34 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, wens@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, 
 Jude Gyimah <jude.gyimah87@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104135300.3723057-1-jude.gyimah87@gmail.com>
References: <20261104135300.3723057-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH] ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO
Message-Id: <179413865613.3630016.12205411582383893622.b4-ty@b4>
Date: Sun, 08 Nov 2026 11:50:56 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ylsVSqvchlpBGitrKoVFx9daA4azP/C+WV10mY0Rnr4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+1BzUuiZTIrVp79LVu/btuubYdahFp5P3tU7yt8b1p
 in8hgvdO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR2NMMv9mTBC2PaLk5Lj+p
 +FJmF/db4RufvJwvPK8ttDvzZda1CecZ/unsjnC0j+hOS/947upc15mtPVw7045Z7tG85sWnqro
 5mw8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 14:53:00 +0100, Jude Gyimah wrote:
> ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/4267121a564e

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

