Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259606;
	b=5VpuwRjLzI6opdVkGLuBSGyhpo3WdMe4TQBl6x7HitG9uU1Z7Ez4dX1+H8duzWrqPMJt
	 tChup1ocUyaUBXSZUsqNbxOTV34O6ZlBXKyOSY6A6V6pM2/UZZXTeg+6y9ddJaSpvccMi
	 u2l9Svv13hiiJNLtPIq0VTfo4/Rkgv6LHtbUOrnq24Slf0fy6CDnc+K2vDY/vk9hApT0y
	 pe8A5TCnp/AErrJgBf7NLHc8JCt31d09PzBfX6InW3QcdAui2cOYF3bzbhIkpYBwBKqmE
	 5rVrkCq+tDbyuUOxJ138rfmKzJ90Xr6ntdBga7UgfVmEuiBaftqlLlE/oK66OVGYmPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259606;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IeL20zffwri2QEDJY4S8vD79Aj6Kzet8Q6gkziCyfEI=;
	b=fh2s9jGfNbwT0UwROos5Xb8DQB0KoX2pf9qprwEDHdDK6+1wPepYAFE268sQzikB9tKq
	 X8GuNzMHyEuSTgoD6WzI25rdiAShw9cOKQooHJsvYwHIfoc5GIu02zzsnHbHpcnn035L+
	 7GR9hc61WOP9lgyMUXVEzEVfHiaW+yPpZFKsHvg1gX5vi37XRkR1xKIwna8BVBZX0YMsI
	 ntPFnIyPOo2N7NCL82mI1+xcdTYYVlcTYdvmaNzAqB4E169KaiHEtDXbq2SRx8ekRz486
	 qzroHD1la7W1+jxzJgfVxLvF4nnDHUoa7DXzKraTr9d2oJqELh9LDRJt0XJJ7nNrQKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJE843tZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08CB606A331;
	Mon,  9 Nov 2026 21:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJE843tZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BF21F00906;
	Mon,  9 Nov 2026 21:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794259606;
	bh=IeL20zffwri2QEDJY4S8vD79Aj6Kzet8Q6gkziCyfEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TJE843tZMJvDkZkZhzeFMq7/WzZ2ynMba7QxPwSHivmYkbarlQTo5KItiqeEc2k0p
	 udFUN+U07fO9+WrHHqg+dtHxiXmggEZKE6ALV6HPs/GLa2XayOSyyhTRYSAcU0z+rf
	 Hnmdw3BkT41PwyO9U5cPu5UX9gvd/6Z06z07ckrpk30k3G/OHObgyH7g8uJU/+X5KD
	 cUO2w33HslzPuTT+1fbz14H5KKowu8IFG1eJj4wJDS9VlJPjXa0ppCUmWRr8PcGCia
	 5oLywuD3V6NrsseuIomYdUWC7yc65xPUYyy9jyBUnmNCgo15rlJW9VZjEg87ZKbB51
	 RohhXsfG6J09w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AD2C83021AF7;
	Mon, 09 Nov 2026 21:26:32 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: jbrunet@baylibre.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Jude Gyimah <jude.gyimah87@gmail.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
 martin.blumenstingl@googlemail.com, linux-sound@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: meson: fix missing REGMAP_MMIO
 dependencies
Message-Id: <179424961953.3711751.2485850214120950980.b4-ty@b4>
Date: Mon, 09 Nov 2026 18:40:19 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=broonie@kernel.org;
 h=from:subject:message-id; bh=scQ/NZ7UXcdBK6jHeXkafGF4axf0CmZWt+PDuXO6Y38=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+WXXsii9b+2z6OU22tW4s/7teGs9908busUvKOj79/
 cwvdxS9O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRW0sZ/hmoF4jft13BuGaD
 Usft6Rxn+D3zpPUmtc+sd593sSNH/D8jQ2PStxgjn5g3uxa3Hq8vWRH4f06Jjs7GL8muwgeVZkq
 d4QMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Nov 2026 16:41:16 +0100, Jude Gyimah wrote:
> ASoC: meson: fix missing REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
> 
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: meson: aiu: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/cc2f13940cee
[2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/12d753e6ca1d
[3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/4603b51f1dad
[4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/10ac156211d2

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

