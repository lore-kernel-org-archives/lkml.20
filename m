Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524B4F3939;
	Tue, 13 Oct 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900368; cv=none; b=TOmBwy9o2km34GijUJT1MI4fpX8m5/VAWEP7zZYiBWoAJgBhXrTvH4EPRjyOYDa4EyM90+vs1cXryy7mOzKoVfUIotNhUZk5yCMZ3H0rPysTwHNXA9ybe5qhhHUa72ZJgLXcioz3AGnkgjjOtrFIQvTNb/5yJqfe8O7b3Q81Rqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900368; c=relaxed/simple;
	bh=QlbAfkPPFpaw58RZxV/YQ2jnS9l4Juf7CsuDwzWYkrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eTm0TKiQiLKxT+tD3JIp4MhOJknL9FbPJ/iw6+N/y6NGtPGGI2DYz84YV0vvv8g/W07dCi7+QiEOQz9wgldtatRCLgSRxKpJEREHCRlffwShQftj8PMOTa+eVy9Uz2+1QKXF7O35NucSnmMNB9isfPaCCTQx0sJhQ4hiyjEhsoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4gDerQk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4gDerQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C840E1F000FF;
	Tue, 13 Oct 2026 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900367;
	bh=QDUFgi5qXoKJKWdS4isV8ww+zH8ENZP7NGQ4t9Dfgoo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l4gDerQkCIpqyBzoZ/lSrf+5xR13Vq2ltrY+RkXbMNmQdB170jSL7gdyDodCqNO19
	 faDe4FutFDGiK/mKIR6v0xDCumFe90Y/jkbmbBc4WmrAFQZjO1aTMqGPkQ7n6n1hQB
	 FN2bPz+H7cu5zPUtZm9kRMYb2pKatdi9Y6vPrHzlsLaQYPRNBQEHRQnw2cWtp1Yv6R
	 jFoX2aFsjUsFkXhBkAwJMqjAs/LPlFVRmKg7JagW6xkqQSK90Ceshuz2JyMqGPOPHk
	 ysm9IgrzY2Lw3ffnmp26aWDNKg63CFluqW3KhGcrmGoYulak/P1u9bOMaQjTbHGq0J
	 OCp5W5goLAAmw==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, lgirdwood@gmail.com, Joonhoe Kim <26rote@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, neil.armstrong@linaro.org, 
 jonathan@marek.ca, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261007123954.1709-1-26rote@gmail.com>
References: <20261007123954.1709-1-26rote@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wcd939x: read the SoundWire port
 switches per channel
Message-Id: <179184618495.390394.12922276610796741760.b4-ty@b4>
Date: Tue, 13 Oct 2026 00:03:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QlbAfkPPFpaw58RZxV/YQ2jnS9l4Juf7CsuDwzWYkrU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOWZ222nJyiYGuqMC3iw8P6tnmL1D56bq5Qvf3lzm3M
 17FZB641FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJPCliZPgyXe0Yl0+txR/P
 vxPLlwfGdzRVPpz+sZVlfSKzSmHVP36G/0lva0qK33QvrdNX+rgmMdEmkPX87re7O3bbWciqLlO
 WYwIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 21:39:54 +0900, Joonhoe Kim wrote:
> ASoC: codecs: wcd939x: read the SoundWire port switches per channel

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: wcd939x: read the SoundWire port switches per channel
      https://git.kernel.org/broonie/misc/c/e7860dc5d8d4

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

