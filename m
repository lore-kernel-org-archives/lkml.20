Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145434;
	b=jZhNOGxzN60GuwpcBmqbbrR71wINxYRKikbZi6Qhn6hPZ7BFmGhBEqXSiRE891wKnFg7
	 +bkPW5Eb5qWPyWJg7/EVNFQmqXpcmc0ULMfQOjXzaXhIME3HLzJO+G9+4TlnokUxhHxZa
	 PcTIe/gI9DF0X7XLUNTcSbzIvENGmRySmpoaCdFHQ1xDJPelzxnOJBxOF9zsCmtai4UFk
	 UqilpqiDQ//c9c/PzQJ+QMdsdZiLynhLED6JKVVqyEUzq4GJLbYUMsUL+vLHqxQUezozj
	 p+OA6UiWRZCa3xj3jliDZv0WbPeM22kF8MmmrPCGpOH8eau4ov0mqfGRBRH5ikXFvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145434;
	h=Received:DKIM-Signature:Received:From:To:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FiqicRgGFFmdN/zUTJYuWA333LJrRHYqatW2CdxXaWU=;
	b=V4ek9zJXErALnd9lyU3qVvNigWYb3xEOJMh6IonIUEO7TZ+xL1POKrseSANSCpVJ/Vek
	 hkZI+8UY3Ax0/UYv5TUlEpwAFlAa7KQxq4j9mkicvNHaXfb8D0D2V5bmjjJ2Gza4hoSHt
	 q/5TEIsgPN3gqRKA7wn2EXdcqGFkvbEfA3FEaeOoWT0XgOccxZPZ6GnwO7Lrx+H2TuKIm
	 rv+QSetpVxxjAQIyIEMTy9PqPiTShi4Tkx8FMT33lwCwjt6ocIWkkjzM9cMDuFFiGQN9L
	 8WcpTI/YokiG86pWUgyG/cL7hCCVvfPzfBFPWvvBYRzHcWhBRZr2iaoh6G8G9b9bV6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvN+ldnk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BC0606A330;
	Sun,  8 Nov 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvN+ldnk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC751F008A1;
	Sun,  8 Nov 2026 13:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145433;
	bh=FiqicRgGFFmdN/zUTJYuWA333LJrRHYqatW2CdxXaWU=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=IvN+ldnklVfjckmSa8v/QBmd3v4Z/h2SyprJcN8nMSkNov+9JghSTnGjC7m+ZqaGK
	 O0pg5F4bG3Y5jc4VumpHbnK2/IpD/J/X2aV0CmRsZkEpCBvJOvqM266hlHvLV7ZrOa
	 TAsJ8h1VKevss4Qsmw6dcJul/Mvtdl9IHnko/5aa+U9bBFvoNJFNgq16xYOXaqBUYP
	 sX0I61z5q+5di8ttgvUA24pTzmXC1ItwZrMKqJSgriNVD1kv3nAjMPVGr936vAaGQX
	 GldAkOxQagVI+UQ5NKRA0UC3KkqmmhEPpsfN4rusG7/rHQT13S2NqbzaP7XvUj8PTH
	 MyIg6naQNStSg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 016582C79261;
	Sun, 08 Nov 2026 13:43:50 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@oss.nxp.com
In-Reply-To: <20261028025921.4155551-1-shengjiu.wang@oss.nxp.com>
References: <20261028025921.4155551-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fix error handling for DMA channel
 retrieval
Message-Id: <179406738653.3424803.17185079246753708576.b4-ty@b4>
Date: Sat, 07 Nov 2026 16:03:06 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qfnAP/FwyAoEO8cGoqqKsMFVyL4j6Nx5ZrB7pkI4f/8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+1Ex10njipqc4P6LqndxP3c+KrFMfsVySiJUonaVxz
 TXu2WGmjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwk7A4jw5mpvguslvEJPwqu
 u3CX/23AlOioh536alK7f/LO271hWTfD/8zr3PsF9+xT+lvMUrO366vSgSUXZmaF2B94LWduaxI
 1iwcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 28 Oct 2026 10:59:21 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: fsl_asrc_dma: fix error handling for DMA channel retrieval

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl_asrc_dma: fix error handling for DMA channel retrieval
      https://git.kernel.org/broonie/sound/c/1f18d4babdf4

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

