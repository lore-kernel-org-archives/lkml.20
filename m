Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747842;
	b=w0Kd5Y+GWDLYGIksMuKBBKE1Iogkn2lj/L5BFSx13ngsAImeAKtHwEEOQewjghGNx4qA
	 cjRKkP1cBqn7HxSLklcUXNJQSjAGkoTcXMTxjCo0ynYS/OdWfOnPFzAQ8k8OIK2+5tXEs
	 rb3SbKUpfRuFrvgCqEy/96ibffO1r2wWeOyiA2clP7GIv3NXg6im6wWTafXjqLMPr5hWn
	 tkuhlqHiOdIyIHJzyBAgeLyPq244tVahMoMRkS2RTlsOP3HF2ZtZ8R4B6bxPHV9VpvHiw
	 pxLQPR3RQ+U/ai6k6rFZF9Lva3LkzOhw/GVQsYDosJxHfcrTTeulwCQVaX1d2tIYJfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747842;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=B+L1Uuxz2fs3fhKfYISIYRyVaqaMEuSiqTjLZMDu2i8=;
	b=rgi5QPwUktFH70t1IsmJKCPdJF4R5gIG4ycCaqFAMmXvzJvLTTFYo4LqEeyWPdhe+DPX
	 XZU++mtkLwnBTTmpJtrTTAxQNfoDwAMJm5GjPoLM+6swiTK4l7Sa/YRHL1MXRmLHXwHc4
	 InueyotIBDXOc76qgQKUX2GUMYUtq3VEDHhb9sqRCwKiOFmhYkttjSIH7OWwOSn6ThKM2
	 lSmtITFvQ4UfrGSsGu+jxS8jCHucxgFEw0U+9PPerJ3pmMV88FtjJ/mbDLrjs2U/GySns
	 nUVDEOK/hGWoZyCkLf7j9b6HOk/y2ZOhQQNSc3vp6D64EDi9TftPONYVXi+24jPZS9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FdKh1Pl/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A7606A31B;
	Tue,  3 Nov 2026 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FdKh1Pl/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621A31F000C1;
	Tue,  3 Nov 2026 23:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793747841;
	bh=B+L1Uuxz2fs3fhKfYISIYRyVaqaMEuSiqTjLZMDu2i8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FdKh1Pl/J7jiQ8krqZCeiLgdT9ousS5+rAGtG4u1faXwOTyaM+iAGKCnqGNUbpbth
	 tmFsNXF4aVdv6ski1ohAwUt0xZbpYhfPTKSuy5A8/bgxIxjCaITpj6WquEt8QQx31V
	 Po90oP5SxMr3kLV8N0ooHl+kqHlP9WItWfgOKJMFvx66ngp3auVm5Do5zYRvybtKOS
	 40FNNt5UqEaYgFdamx13g97sj6ktc+qTb2L7qF3MeYkZtCuA/op+6WbQliHGVmTpEj
	 2AU1Dv9d4O1Jw/1WPtq3oqhE3laPUD7W1kAo3Oj/inVfpDl+Fg7xih1ZryGGKIQ0bR
	 2C6cvaWujVA9Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 82E0225BE0AC;
	Tue, 03 Nov 2026 23:17:18 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bob Hui <bg9oxa@163.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-es8328-vol-init-v5-0-9c505c97a8e1@163.com>
References: <20261103-es8328-vol-init-v5-0-9c505c97a8e1@163.com>
Subject: Re: [PATCH v5 0/2] ASoC: es8328: enable capture on the ES8388
Message-Id: <179371988157.2270148.2933912415392447667.b4-ty@b4>
Date: Tue, 03 Nov 2026 15:31:21 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=broonie@kernel.org;
 h=from:subject:message-id; bh=74AfnBWAFk+UWrW7DvKwzDhGPvn8BluiWgcvBglnPUg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeZZe2lXptOBLFK8p3Tl9FJlbZxyfnulbnwiVLGOa/m
 tF2f9W9jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzk3imG/7F575W6pjQe8fj+
 tc0prJHhh+znxuksL1JL/XyVtF/938zI8Kr/61Qzj8VF6+8qu3GqT/269eN5Ph7N+vf5ESJ6WY9
 EeQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 03 Nov 2026 22:24:02 +0800, Bob Hui wrote:
> ASoC: es8328: enable capture on the ES8388
> 
> This series fixes capture on boards built around the ES8388.  That part
> shares the driver with the ES8328, and the two differ in eleven power-on
> register values and in the meaning of bit 7 of DAC Control 21, so the
> driver has to know which part it is talking to before it can set either
> of them up.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: es8328: reset the codec at probe time
      https://git.kernel.org/broonie/sound/c/ba61f5733094
[2/2] ASoC: es8328: set SLRCK for the ES8388
      https://git.kernel.org/broonie/sound/c/bcc60bca720f

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

