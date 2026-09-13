Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FF142E419;
	Mon, 14 Sep 2026 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377816; cv=none; b=pDx6tDS2jjnI19p9p1ZChZpM3E0NbkF2YRr3Gss8WRUSLZWtbvGpXITQ44KexEZfIze3LYqAdfURLvrx3PbwmLKYjQH4Q66N7D/EwVVkf3bEC9rkDed61m3xWG5woleS/K20/zJ/MdD0PRzt894ScmFwO5SkLt5xGTCuACbaL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377816; c=relaxed/simple;
	bh=HjpOGtolQywlOwqplC7XFFNhp4q3M0bRcONfhUjtQy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QEq39+06NkrRarIu6n/I0EpFzuOELfgRsDEshkJ8MgfnGvmL0hbbHoocBXO0jp9VX/O1whti1eF8hQqwgFVS11JxlCAzNhsxPeJ8/CDEK2s3Py9hKi0S0NDPfKLudRL4vELZbV74vWTo3SRZG2pmQk3p+EhcnZ5G9gfMAs5sV+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbLHGdP6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbLHGdP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F381F000FF;
	Mon, 14 Sep 2026 09:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377814;
	bh=qt0nOzoRG+vnyQNABbt2IqkRhYShwwyNOo2r6vzN7dw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JbLHGdP6s8pGGmI47YoDeKgMIWpxm4jY34vB2VJ8mzNx4lLVnlTyMQ+w9/6JEGe//
	 Nb0Oon2ol29m9CYQMd5Fxfi2kPhCDro/IURdEbvfJTDFUrisNvJoqWtnTbfjd+VzNk
	 oG8lpa7oUxFcWoyd2i84owH4aGWrKmZG1RL25a7PBeWzeXEsmZQyV6BZqkEI3GgkWd
	 fnAgzQKkXuJR0ZylljRZuT0qpjmClOcYYMyqtnCFZCB0EnE3C8kgrVYo1L3oc2k0o/
	 3672OgTZhGAEC/FJkXMKmdP6WTca4J8KbkcM/TvJ6PtWLL/Hdky3EcBPqahjrb+bD/
	 hnxx9PnFFqM3Q==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260910114500.1586637-1-rf@opensource.cirrus.com>
References: <20260910114500.1586637-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] ASoC: Fix missing channel fixup for codec end of
 ch_map
Message-Id: <178934268155.1239410.7094209954466763561.b4-ty@b4>
Date: Mon, 14 Sep 2026 00:38:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2009; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HjpOGtolQywlOwqplC7XFFNhp4q3M0bRcONfhUjtQy0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqp70SMtIrvGSzjQDM3Ys/s/kprJz2czuQE5Hd/
 IF/Z+5vdvaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqe9EgAKCRAk1otyXVSH
 0EJ6B/0VumgZR9uEjRaGSuWOGHUh2pKAZ4ExA2afNGhjq9laRfClqWqHoH6EAu4x4eddLvT2E73
 PryhG+9RZA7GkAIJe8K0wVI/0l0WsxeqZ0VOu5/D0BL9dMQhiEBkx69+Kt8UztQz2wTcaI7zBCJ
 VVN/tYnmaZAaj+wib5L7f5rCWtLZOJQtnlcZzEU5ZidJKkHyz0mAe0JoGQVummCqosF0aZglv53
 xrJaT6xc0+qLoJ17k+Yo9u9DQZLlN/lcXcMeQLkWmvQ3HId7CEqv59OsT1T9h28j/SwwvPWlvn2
 ktuusMTXHIuSmHRXef66r7qmzWgNhn36SH9JtONxQoHT81cO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 10 Sep 2026 12:44:55 +0100, Richard Fitzgerald wrote:
> ASoC: Fix missing channel fixup for codec end of ch_map
> 
> Struct snd_soc_dai_link_ch_map had a single mask member to set the
> CPU channel masks. But no fixup was done to the codec end of the link.
> 
> For example if a 4-channel CPU capture DAI was made from two codecs both
> supplying 2 channels, the hw_params() of the codec would be passed a
> channel count of 4.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/5] ASoC: Rename snd_soc_dai_link_ch_map.ch_mask to cpu_ch_mask
      https://git.kernel.org/broonie/sound/c/4d855d747521
[2/5] ASoC: Add codec_ch_mask to snd_soc_dai_link_ch_map
      https://git.kernel.org/broonie/sound/c/88b14c0d0bab
[3/5] ASoC: soc-pcm: Apply snd_soc_dai_link_ch_map.codec_ch_mask to codec params
      https://git.kernel.org/broonie/sound/c/6b382bdfe26a
[4/5] ASoC: sdw_utils: Set snd_soc_dai_link_ch_map.codec_ch_mask for capture
      https://git.kernel.org/broonie/sound/c/290845e151cd
[5/5] ASoC: sdw_utils: cs_amp: Delete bogus and incorrect capture channel fixup
      https://git.kernel.org/broonie/sound/c/b5b00a57868b

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

