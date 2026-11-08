Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145477;
	b=VHVA/eUnNhcz4hb3ZPhHOzl0yzxi3mIlFjfsfDdljUe+ouGTEMrzwIvOApS5XnDeORhv
	 VOhCseh+DL6kJc7y9q3ijCm7mB8aiuU7rK6YzAFSMZlM6yTNM8zzkRL2y2tI0Q944s5dQ
	 IadWDWVBrd8/9qL5YJRXx0vwUpwTzHQaS7qiY6Z5tTnhUF4OoP8AX7YxeOhlJXk+F+GWr
	 aDW5165D4zjL4u3/tBr46DXIUfMXM/AI6FQkbLOKdzAkDfp8x+EvqqCBG1wiEps5uN3YR
	 AT6d+X4p0Qh6D2RpLGTXmqqytgLYoDfuFekTNiAHZp8DJNPy9nPXiPfqtAIxildVRgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145477;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Ss1NSOxWAzbNi7F7AmPOetyykQBLbpFDFmmx7SHIuxc=;
	b=WA8URJge7EpahHz694E6Wm4s3DF52hN8Sp4K3HDXGBSe6EPB4IdadwxCnWK9E0zS6H1i
	 nswaY8jwC7D1+upo/SRLKecIe8EAmFPAD/6Sk0mCgzEpO7aNCsRztZJhimwXchZ8S/BYc
	 UZ2DO47kBem1G9dfNEM7tetz8ZwM78qVIaoe0hlPR7v9u3fuMy5AV2X+rtZGqDNScwyhI
	 9SYQnP0OA/P4J9R3LBLlbrNSDeq1wsvPcvDN7RiMKeeaygF6KZWLl9OVYZTDtBGKG2D1y
	 hng6viNXitg26Acm4asDUpXUuK4TSTMyTrZYVPBszfXOauTsFkJTaRFB+O20uavmarA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvDyqly1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06374606A31C;
	Sun,  8 Nov 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvDyqly1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6361F0089F;
	Sun,  8 Nov 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145476;
	bh=Ss1NSOxWAzbNi7F7AmPOetyykQBLbpFDFmmx7SHIuxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CvDyqly1SKBiEkDx1Vd0DaciQR8IOIS/6vPaK0JrNKk+XN+/C5s3qNbRSlXjHYXoX
	 Jkq8x2sFBaEE/25ReJDenEBoJKwgVs7YILZvx4S05Wgk+j3G+VPKaO5O7sO15bsy8r
	 CDCoS/7ihjMFpulDkcnJZ4uEBUvwKzMLFLEB2IXNRJFSDhKxjO4i28L/zv0ijL9z1G
	 f8fxxjvfOTMBxT2PIoML3IX5x0Vzf3d249Z1M4CrQAUXyAqpdc3GSzjgWaq4rJboTy
	 hgfYRxrG2djMCj7grxD4Bp/PXtS4NdxfOKXvjY13r5CEkW1ISW7Wj+c7vLXBNd1JaB
	 O3RphYPAPO7YA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 6F3972C79344;
	Sun, 08 Nov 2026 13:44:33 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Jude Gyimah <jude.gyimah87@gmail.com>
Cc: chancel.liu@nxp.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
References: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: fsl: fix missing GENERIC_BITREVERSE and
 REGMAP_MMIO dependencies
Message-Id: <179413874386.3630016.5013945325715411961.b4-ty@b4>
Date: Sun, 08 Nov 2026 11:52:23 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tKqcCHWoY6p82mpbSJplpWlEcAQyyd0r0jEcbA6hFDs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+1BwU5TwtzszHI7j7qJPiWY0pb/pElh35tleoKqRz5
 /2C7TtCO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRV/MZ/ped+uk950Hmu5+X
 bxn/7w5mv60wcW9uyPPKUqHmdXybYxsYGS5b/BBhWjf56OWqySkv5JnjG09+WyjfLq3b3RGspL5
 GiQ0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 14:49:57 +0100, Jude Gyimah wrote:
> ASoC: fsl: fix missing GENERIC_BITREVERSE and REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 3 drivers, so they are here as one series.
> 
> Affected: fsl_aud2htx, fsl_xcvr, lpc3xxx-i2s.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: fsl_aud2htx: select missing dependencies
      https://git.kernel.org/broonie/sound/c/c29a99ab4b11
[2/3] ASoC: fsl: lpc3xxx-i2s: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/b5c35242c515
[3/3] ASoC: fsl_xcvr: select BITREVERSE
      https://git.kernel.org/broonie/sound/c/99c9016f6bbd

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

