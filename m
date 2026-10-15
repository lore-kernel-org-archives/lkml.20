Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2791419A4;
	Fri, 16 Oct 2026 00:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112398; cv=none; b=SGlN3xhFrbzmGtVSCbfbxOdyIe+WxBA+3u3gAJTeeWPCviLUdXX1XQuXv++ANfyLj65ZGFrC/ZFzdLBovPFg3guafQlmYg809o2F9dfjh/unr/mStFR2P4cV0GtGxxE9r8PbJfmvHcHtotmNRk1OzvBrHTL1p3rw+F+tMtcRLRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112398; c=relaxed/simple;
	bh=ES3DEjYBi3fkr/ffWh/eluGTsyZV9hZaEfBkWdV9KaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KmqCxHpBJMIogIrtNVku53p+ghu0rk9KANudeJq2ooF0nErnyiBbjQEsqU+nvQBc6Q6wex8T8D5bdfr583+jkjO/zEEPLpYhyQzXAHWrbvzlRhjDqvZYgmD3dFuEEb7H7VKbqmpWkDO8lgrmbjyvzwmW7JhMNNGLe6kTIXghZBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCVt9olO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCVt9olO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AF91F000C4;
	Fri, 16 Oct 2026 00:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792112397;
	bh=hePxlXzcrZb3RzajKoeJNalf/u8W738ud9xWbFEhjsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MCVt9olO1tXWAAeeRsPWjIkQHhQtIyNFnNdQsSrOhlvhqvLpZxoKt9Ypmq/xt2zBt
	 EtVW0CB3A91LI8Cq28nfotbbdCO9PAZS5u0PMg7GjBR1mvjkvtz7i+aRZTO7n5YOxs
	 RDYH2yNk2W0R/KaxSmSTEjpPhDiLyK8OGSEcyv3c6mGhNIvjGaEvdXxES5dFOMtBNE
	 IoCBoqkpcNryazButUflokgQrLqHzBgI4/Tnns6VPxoIyWE/Zb2Tn/Vxq6sacROVh0
	 78TYRwHr7XWoN1ll9jBw67hs8SqCX+8QJCfzlMwOYj37XrGzeA3lVs0hGtE98GjXbs
	 MjGANuIJhlf8w==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, yoxcu <mick@yoxcu.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013204549.3115830-1-mick@yoxcu.de>
References: <20261013204549.3115830-1-mick@yoxcu.de>
Subject: Re: [PATCH] ASoC: qcom: sdm845: Disable the quaternary MI2S bit
 clock on shutdown
Message-Id: <179209202719.134795.8161800657984229854.b4-ty@b4>
Date: Thu, 15 Oct 2026 20:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ES3DEjYBi3fkr/ffWh/eluGTsyZV9hZaEfBkWdV9KaQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIulnP9ljsSEaYsv06tXYp3F09vzqwn1prveS/oOudLa
 3/T0z3fUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIncCWD47/59UYSVVmzftAkL
 7T5LZPueLviq+eJtnQkX933XJv0PXowMv0S1WC4U689TYwr/91lV1jQkfNb2xrT1CYIWK0s/VE/
 jAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 13 Oct 2026 22:45:49 +0200, yoxcu wrote:
> ASoC: qcom: sdm845: Disable the quaternary MI2S bit clock on shutdown

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: qcom: sdm845: Disable the quaternary MI2S bit clock on shutdown
      https://git.kernel.org/broonie/sound/c/cef5d087d681

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

