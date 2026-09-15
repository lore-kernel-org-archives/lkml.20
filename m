Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD0D4B1272;
	Tue, 15 Sep 2026 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495726; cv=none; b=CH3yBLltmcCMim6qZrCs7H2GcRRKnQOuy+s06D84hnpDHsLMX790oFGnelmp974+fP3Wxr0DShGinr/9OR3bIKufnQ1huoPiVVeAUZC6At4N97EDPL3h+OheGVRxhwEeSuWe036ENqCIUu94+zF8FS+WBGMwnWCbri5avsrwQME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495726; c=relaxed/simple;
	bh=T4kFFumux9Xaba/3RIzj1k0b3xh6wq4hjzDQYidDAH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WuSwm1NdqLFhgyc5NHVumhKM45X/0PnSL8gsvasbAdfRGcXgKrTTQkPRnid21vl/gBCZN4G38N8jGxtGNIBMgok05gU1tZ0fu1V4RI7t03gm2H4ELWPX4I/5AQZGEj8d/9iz7xijntaO/P4ceMc8ycsleBh5hs8Xh2AK3R6xBcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD9qnuXD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD9qnuXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC63A1F000FF;
	Tue, 15 Sep 2026 18:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789495725;
	bh=CnyYD2ktYXJC2QD/i9qf97SGs9XLKDPIG0Vh1+UhMZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KD9qnuXDcnq13E24gPKB1HSVbgC61GZiytF5fUiJh8yBn7RD+HgEBzVaup0X26C45
	 VGBp9cVPdd6XZv/wpFTIoO1uEgx4EgJUe3FxzFjzgZIk9ee+4nL10UtGGbT2Dv0BDZ
	 eTuoL5JIKJdfCJI4hb46SYGG/ljYMXcOM5VTpF7xucwmVTAmSMtOw+ju6ca1VShBEL
	 JaNsxCnvQMjpdjs9QGEC+ayG5X87c1asMgmMCj0+p2wjyGQ4zYL5UN6dDr4hZ8kVZq
	 ngcdwKYjckczpOQCzM3p1cX8ro5GMUU7Ic0zOxFU7QVQQBbshPQ4abC9Ik44D7FOcS
	 XkuyTgFLhy/Tw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
References: <20260913102502.2805912-1-chancel.liu@oss.nxp.com>
Subject: Re: [PATCH 0/4] ASoC: generic: Free jack GPIOs on card remove
Message-Id: <178949020844.151760.2511095576041942941.b4-ty@b4>
Date: Tue, 15 Sep 2026 17:36:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=broonie@kernel.org;
 h=from:subject:message-id; bh=T4kFFumux9Xaba/3RIzj1k0b3xh6wq4hjzDQYidDAH0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqYmpUqgctjdV8Q/ZX13y8y23eGJVyb3H7OKWc
 tfVgDZdsN2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqmJqQAKCRAk1otyXVSH
 0HMAB/9moejDF3X2/BP0cUU2oRnKY6fCUAlWUdkKiZQQARpaT1gYSXPgnrIpBTTN/YappAFO/5W
 tuN16Hn+g4FI1jI/oLQrMmGdviGwgNPrTojSBw/u1FLIMkFsKmZpRJZN2tNYMIDmy5sTaxfN2OK
 ObP4CRK+Mxv45+bk55KDnx+jcyaFvqHQQr/ruhpZ78wVYWS2avENgyMupLoBq2yeG76cprwT8m6
 d8Ivl96ki77GMBLabM/vOcRrZD51son9tjf4Ew80SunqilztN64mS8KDZl7DlraCdO7sZ84c8ln
 ZYCM7HSzFjPPTVv7ctSwm5NDfSbLxRSxrZQ7rAMLgIpZYQsp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 13 Sep 2026 19:24:58 +0900, Chancel Liu wrote:
> ASoC: generic: Free jack GPIOs on card remove
> 
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> simple_util_init_jack() acquires a jack detection GPIO with
> gpiod_get_optional() and passes it to snd_soc_jack_add_gpios(), which
> also installs an IRQ handler, a PM notifier, a delayed work and a sysfs
> export for it. None of simple-card, audio-graph-card or
> audio-graph-card2 implements a card->remove() callback, so none of this
> is ever released.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: simple-card-utils: Add simple_util_remove_jack()
      https://git.kernel.org/broonie/sound/c/c7420dd9213d
[2/4] ASoC: simple-card: Free jack GPIOs on card remove
      https://git.kernel.org/broonie/sound/c/b59a20808727
[3/4] ASoC: audio-graph-card: Free jack GPIOs on card remove
      https://git.kernel.org/broonie/sound/c/698fdd31522c
[4/4] ASoC: audio-graph-card2: Free jack GPIOs on card remove
      https://git.kernel.org/broonie/sound/c/df0afa439044

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

