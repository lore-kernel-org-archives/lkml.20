Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C084FE2D8;
	Tue, 29 Sep 2026 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690032; cv=none; b=A3Zd9G0pPQPGuWy5eSq+VKXCV9KrjehdU5hu/MDD2EZHX8vn1WDKROfwpgFdwFt+7WCu6I1+KmVuZ2jlfj7JnJjeo+jyImu9AYXYNAI9HAqWYoZ+XJcy96gwRN6a+RLZG4BW21VlWWHVY74+pqfsG2v5sMCyH4BEF6pu7C0SYZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690032; c=relaxed/simple;
	bh=trHfwgjqhfOA3e6fWzHvFIkjQa+Z1BzTcPbrcEAZRoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oH8eJoSEsUUF5tyd8f8D+38CDnuLdS/mfbOcTbid/MZBp0hIuhKpeGZeh2cPzJ1WQlYkxdFRR2fJkgbBhWZXfU1n/ebXe/LI5uNSIfA4BhThkQ7kAjK7y3je1cMr7IZ1BsoHfwcGPj5DDfelpXXiQfXZP/G6Of8aj8Cv5lHD8Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duXqOsgM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duXqOsgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841411F00898;
	Tue, 29 Sep 2026 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690029;
	bh=FsdXnN0+/ulIeKkX2UEqj38vf3XEJDc/7/TK8JZfUYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=duXqOsgMoZ2DGkGYV5iFNprvhk3vU5IXXeXe7ZEd//FRxFyJQSRLizFwEJQn1EW4y
	 QJEVrsptcWn/YVd8WSFf3Xqvae36kD09X+ALnhiITA+OuFVGRVXwmnusM4XKIoVJmR
	 YsQVJsQgb3GzQuwJeNaKCsnbI9VvhbbxogB28IUY3zXkutdK1Pj10heBo7oTRgPqGQ
	 UXO+jefqHxa3Pq4ivvYXiwGQ/+jthi5Ga2p1KZiVWbWV0FLMrE8fjx4ZnKI2Ic3aHH
	 6Qtmd/5LHF7allm4o+ooN8JHLlO21TtzneCc0Bz5FzbK6QdeeBBngi69ws9dx9M2cF
	 gVMR9KY4kgNtA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Khanh Le <khanh.le.xr@renesas.com>, Alexander Koch <mail@alexanderkoch.net>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260929090821.1476257-1-mail@alexanderkoch.net>
References: <20260929090821.1476257-1-mail@alexanderkoch.net>
Subject: Re: [PATCH v2 0/2] ASoC: codecs: ak4619: Add PDN pin handling
Message-Id: <179068238503.115027.442123554881087547.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:46:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761; i=broonie@kernel.org;
 h=from:subject:message-id; bh=trHfwgjqhfOA3e6fWzHvFIkjQa+Z1BzTcPbrcEAZRoQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu8LnpSQyRj2PwbhS9Vw1QDnIRr5ZPungGBKot
 LkmC5NfmwuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarvC5wAKCRAk1otyXVSH
 0JrTB/4lnyzwAFM3WRXsTHW6jCN6NR4li5iseNip6rUeGougjF4OU6sdyWRuuQvS2XEMrcUKTkj
 nWxxEK6qaEFVutavvyJsZUk7MPLEirTiNgDhPPr8i90uiuiyMtDYirNKhfSX0xSpHCfDJQ2yvZc
 JuDvjJ7NEyCX4ULlPdKr4FE3bxp3Xm9s2IBQMqrmAIiYiWpl1nR7gYtTr2gvO81gJGgh19i0m4x
 oijPwQBHCMPyGhXwdKLUV8JUozrANJE74QUuSsySrz1sPUJw/X1jJAlm0vWEUgnn9KOi6Sj2a9i
 wh5y/XcuhL6AmcpQq7IGVlZOM9P6Dl4y49YAdqF3XMSY7U0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 29 Sep 2026 11:08:19 +0200, Alexander Koch wrote:
> ASoC: codecs: ak4619: Add PDN pin handling
> 
> The AK4619 datasheet describes the functionality of the power down (PDN)
> pin as follows (p. 39, 'Power-up/down Sequence'):
> 
>   The AK4619 should be powered up when the PDN pin = "L". The PDN pin
>   should be set "H" after all power supplies have ramped up.
>   At that point, the reference voltage generator block (REFBLK) and LDO
>   (AVDRV) circuit are powered up and the control registers are
>   initialized. Control register settings should be no less than 10ms
>   after PDN pin = "H".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: codecs: ak4619: Add optional powerdown GPIO
      https://git.kernel.org/broonie/sound/c/f38638f5181a
[2/2] ASoC: dt-bindings: asahi-kasei,ak4619: Add powerdown GPIO
      https://git.kernel.org/broonie/sound/c/b224c8932773

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

