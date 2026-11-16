Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873100;
	b=ButkqvI0GkemeK05Spt2vFWZVWAGFf4F33YGlUt3xmzLMCtBQEw5uF82c9vQ1XsHKs0I
	 l5dyEKncM20jjmtixNibgBa+brED39EicBYOVn8+vvj7S2VJOrvqlZFvHRsU/pkeOnrlE
	 MKt5Vh3XC3+/xA98+BFKiPMLzzJuGyBWfS4YWk0xq6kUQRz2Iaf29z8XzOT7JVSJ5iXky
	 FXtXmS+0SOPEobXzDKQJ73/kcdqDGnIfzWsk3IQAPAtnIhMP5w2jSv6nIDrL/rF3W06j/
	 7TLFXeV5HHg2u8fNKhyIlE0rQZ82RFWbZWguse/1C4+bZpvuO2G/IJiOR8bMGI7boww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873100;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SQt0eL8qfHalFpnfDQ9pv6oy1Sj3m08sH+lj37/D/0E=;
	b=Rv7eoZoeVn630gY5EqQf977DErvYr3G68LiWTvh+BZE5NnXn325h0SDIBgMgkmiSj6p7
	 tV8L/UBUZ82+AVREqj2LWuTREyXJIR6JwP8dtlEkD8+SpZlpm+wJS+9gEZ4HQDSXf5JB+
	 HyiY6lGXPuE1CqUyJh87L5qXhJFtQ9isEZ4LETAEF5YjXQDw49+B8kcr/N7OmSpkw66qu
	 EcFhocnYZTa6bh2UUXYFuAczj8uJ3JYRzIcXB+ErydQQum7vQGXEP5Ie3y5u8XeD3YAw3
	 dZBxFi9xhhNWs14Sh4gdN7oFG741xz/x7vMAc/EHSYJaBZFd5g6AGlJGMHfH+7+aSyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9EtOQfV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F15606A31C;
	Mon, 16 Nov 2026 23:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9EtOQfV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C581F000C4;
	Mon, 16 Nov 2026 23:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873100;
	bh=SQt0eL8qfHalFpnfDQ9pv6oy1Sj3m08sH+lj37/D/0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=G9EtOQfVsZhDKPGkBpvRaOqvMPYaxHB9s813GIN8z1t69GuqaJpTdOOqwF8lIjv2c
	 Ghtf4yERblL6A3DZt1IkeXVVxVs8a37b+KwlUBVC1Yl59EpQMD58pKQ787IX4+PiWc
	 cQsPOHmTfEywRmSimtOz3bmgooPx/U4cweNIusaAzLjpxv4vfrdJYbUres/gVFD92C
	 vUqFtNFPVWwoihYvO50mnH+oV7LL5o35wKYuz0dH7MCe0OtugjjxtQvYk1zJ2TK6wC
	 ftdL6WUVDggBp3LBiJecWV6PhKOEpaD39xH7fHt7GvdHuD9UFHLBZSXS2HYFjcc3NB
	 +mi6s7qoxJzPg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261113112935.2926431-1-rf@opensource.cirrus.com>
References: <20261113112935.2926431-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Series to stop writing ASP
 registers the driver doesn't own
Message-Id: <179486201075.2504946.7882006843579510289.b4-ty@b4>
Date: Mon, 16 Nov 2026 20:46:50 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aMeR063A5fivQXeThX/izflwbRwxkIc7eE6KJTnb+1o=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+T+fcbV3vxnBmAmN5xozrTA8OxM1ym1hpW16v9Zjb9
 4G5QYF8RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACaia8PwP7ngw+5Erb3bp10V
 3Bgxb4LUpYNyObJmS+J5rs59n/HmfiIjw/a78ZaNJ6683VOz2Mz2x/HnHYsPhK/OPOSbzc7NsFR
 kPS8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 11:29:33 +0000, Richard Fitzgerald wrote:
> ASoC: cs35l56: Series to stop writing ASP registers the driver doesn't own
> 
> The driver was writing to the ASP registers on systems where it didn't own
> control of those registers. These two patches prevent that.
> 
> There is more detail in the commit messages of why this problem exists, but
> the summary is that these registers are usually owned by the firmware
> and/or a secondary (or tertiary) host using the I2C/SPI control interfaces.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: cs35l56: Only write ASP1TXn registers when widget is powered-up
      https://git.kernel.org/broonie/sound/c/0085428e834c
[2/2] ASoC: cs35l56: Fix unwanted writes to ASP config registers
      https://git.kernel.org/broonie/sound/c/396c5d8075f3

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

