Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1E444C513;
	Thu, 15 Oct 2026 22:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102021; cv=none; b=vCIkQ7yow0joAf12VDhDFcYyKjY57xMh6hgWcIh5PAkfxSCxYw9Mu1OxEXZZdjqkEfDG+QKuIysSt1Ypk7kMQVZpLYBn4kuEZanBoHh5ClxuhfYpzTvDf87v8x8OhMm49Ezm2hcaCPLI7VPYnEWTCKR5jhYBQ4iKpNSOKzmqfNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102021; c=relaxed/simple;
	bh=Mg6sR5il0RShpzOVM0ickiyTSt5ZzLBb2bLUeOy+Oo4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tZ+SFYwR3UbYG6UPeQr9snIphD1SkneRq+QO0bN+JItImL0a2RLyUc2utNqKHRNM1+v/7fDYWcii4/ujlkMYiYDsV8FUEJB8DhJaoV4Vw1cuGYHPSs+aoulnJeL1Y8XapI68+oPsxaGE5ySEYgTafII5ssTBY4++d7hKAFSQpvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls+O6WCJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls+O6WCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887181F000C7;
	Thu, 15 Oct 2026 22:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102019;
	bh=gKW4pOkXMoKUBl72JvPKMspWV3kldfu7FbHkUiioGXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ls+O6WCJzrIu7xjHpoDoI2KxPlFXRf3NCMEiroH4VkvZgTa1otElzibw4LD5qlcNM
	 JuqKkula66gu0i9354QGLI5eH0WAhavxd80jtITYDj8KT+gWnDB+Nt09Aianf4CzbH
	 7liSV+9JRlif8adb8x6xrsNiiBcXki/6yOq2IfD/QPnyBvCcv3+BPog7Tyv0KpRg4V
	 BtoEEmOmxhahFcgatAAYLMAktRZNWElNuw5JAs4LWloxdQMwWCK6w/LjVbY/ocJtuN
	 upK9dEKr7DvRxyRRit/65V61HBHsFhcZNjWXGZ2KHcpppRZSL9hUyhJVX6H2UouZTB
	 GS8kB4/LfD5IA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zhang Jiaxi <Z1529105815@outlook.com>, 
 Johan Hovold <johan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261014162703.10172-1-tvlad744@gmail.com>
References: <20261014162703.10172-1-tvlad744@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: qcom: qdsp6: report the position of a
 drained buffer
Message-Id: <179207977800.134795.6981644438030253996.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:56:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Mg6sR5il0RShpzOVM0ickiyTSt5ZzLBb2bLUeOy+Oo4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIu+tXznZiUeq5y1pwY/Qc9K8WOrs3Yu1p9wuUJ0jU5J
 cZJAsqzO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRT96MDMefG0Ud3xVilfos
 etULXp+/VhMYghlWz5JemGXJohJ4vJfhf8BaoXA1jvwmxmu7pqxo2FPz32lKjuiTkpkhkjXnXHL
 6mQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 19:26:59 +0300, Vladyslav Tymoshchuk wrote:
> ASoC: qcom: qdsp6: report the position of a drained buffer
> 
> Since commit a93dad6f4e6a ("ASoC: q6apm-dai: make use of
> q6apm_get_hw_pointer") q6apm-dai reports one frame less than the
> position of the last buffer the DSP returned, and commit 44432315444c
> ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") did the same in
> q6asm-dai. When the application stops feeding a playback stream, the
> position never reaches appl_ptr: ALSA never sees the underrun, the
> stream stays RUNNING without period interrupts, and drain ends on its
> timeout with -EIO. On a OnePlus Pad 3 (SM8750) this left PipeWire's
> PCM stuck for hours after a stall.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: qcom: q6apm-dai: wrap the position of a full ring to 0
      https://git.kernel.org/broonie/sound/c/0ea3e0b196f9
[2/3] ASoC: qcom: q6apm: reset the hw pointer with the fragment queue
      https://git.kernel.org/broonie/sound/c/0337b8129cf6
[3/3] ASoC: qcom: q6asm-dai: wrap the position of a full ring to 0
      https://git.kernel.org/broonie/sound/c/222d04cf55bc

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

