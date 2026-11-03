Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791360;
	b=wRvx5CjB709T+yo5Ey+APDZauNJKEj0jRnNns+cv6hKsmK8RZIDU+53AwHYQN85zypbx
	 5yRD+9uSy8FefsAOfEHOdjUU75fjPTrAcMsvnkMM5ucRIvG3mg4/9cb6J5JsbSsg8wFrO
	 +TEKoAu1PEizCe6Kace1pQDbeAV/xaGYgChyYNl2huAOcQDUtQ8P92ZuTtnDjlWZZj7Pj
	 R62aMKYmmWb0y9Hsh5FUHY4wj1ZOvXr67CyzyVSqFFcrElZgJvj/tiGMfPws3OdXtzMcS
	 QYoZZo6VlTKMp3UNUR4udyGLmdw87s2XHfMZG89PsXqqYBHQK0auYFrSt7GUpOkiklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791360;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=ztl+pbmgGYCgH6Cy8DY8nxr8DlBMb7+Zh30yCIxB2r0=;
	b=Fys4B036ZT4rUXgBQkj3QjBPut1g7xU2a1SFJFfDqt9Y01TI9Qv1Rn/Mp0kCHhpEwHvY
	 7VGBNynG9txf3HYF0VQI/k0wLBf7lHY1tdmD6cGB8TW0ILwiB9K4w62QdEHIFb+vFdcog
	 zvsuYCwz4NpNP0vV8+kSM9nxWPRfd6rkk2FJ9qDKwO0Nndrde21ifJGI1pIknmfFH0Ach
	 iae84PIdbkk6S97TSSQefCUMqqmI0boVqdsC+teoqbeOH6qA3i38052c1NGKFwuXhRz+x
	 9pNRF9GYKAc7mIRclyZ3VMFPc0owMr5hFtleErKxaALTgCZpS2i5Kw1mVC6PV9wlZkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Odf8DaH3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB6606A326;
	Wed,  4 Nov 2026 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Odf8DaH3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EEC1F00919;
	Wed,  4 Nov 2026 11:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793791359;
	bh=ztl+pbmgGYCgH6Cy8DY8nxr8DlBMb7+Zh30yCIxB2r0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Odf8DaH3lB3Xb3zWUiGnVJI/XusuvTPu5NLbI6ktQ23kihoSEa3/48M3bfvfCqz4L
	 17Q0azT8KYpXJDPQjmwpVCMWjPrQr6hPa+zHsE4uYxdsP8vADV+IhY7e7fz7cyf1ts
	 ltacVOtyHxD2xFHWEHyJcbBcWJSPdtUpzEeQ5x2Q2LnYN99dW6a5jJE9EFfUwUHCfL
	 9syH2po3qxgQlPWT9RKl839WBlD/CNdBBN3MqJItdNffOB3ZN6jM1UVbO2dSnTeswC
	 YJpKc3wSZBhGLKSmB0FsDVba/K/OA7MeZyaVgfTCeptSHhQlb6Fl3Kv/qREjaGNIHQ
	 CkMulk2LrUCUQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 38CED25D9AA6;
	Wed, 04 Nov 2026 11:22:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, heiko@sntech.de, 
 Jude Gyimah <jude.gyimah87@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: rockchip: fix missing REGMAP_MMIO
 dependencies
Message-Id: <179374840410.2186205.8917422053194660674.b4-ty@b4>
Date: Tue, 03 Nov 2026 23:26:44 +0000
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

On Tue, 03 Nov 2026 14:25:32 +0100, Jude Gyimah wrote:
> ASoC: rockchip: fix missing REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 5 drivers, so they are here as one series.
> 
> Affected: rockchip_i2s, rockchip_i2s_tdm, rockchip_pdm, rockchip_sai,
> rockchip_spdif.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: rockchip_i2s: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/1c57404bf9ba
[2/5] ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/b8284f2b73f8
[3/5] ASoC: rockchip_pdm: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/420c7918a61b
[4/5] ASoC: rockchip_sai: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/829904994e7a
[5/5] ASoC: rockchip_spdif: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/67a7e2073909

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

