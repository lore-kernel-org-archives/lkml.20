Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623281;
	b=rM/u9BpuivqWinZYBpNB3Loioal906A0EtP6ftpiVP1IUHuLIDQ7ic2TK5TDU0hSXrP4
	 BMPuq09C55ifymo9xVTjZ1Cx83v30Ux56nAJbu6rvGsveNi1Stp1CjsZwwLRtJmxNBatP
	 V9VXI0nnbZoM3msNXNsDsA3K5oSRKg9PgHlW9RnBHwWjV4eA9eXIcx2yo1jvqZWUZZfrC
	 AJKbxiI4pKDiSwvd+HMP6zvBfOfoSHXdHWHTDusYObBAR7t5rhBaDgyFLGAeCYnKDbq7e
	 DbMOCEYTycTIaCAvAmuACq/i2Brj5j1HeM0nG33j8ZQdUgugv0bq1plB1kEgTBTWMhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623281;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mmuPKWzXO1c33pw5udmNtMkv7LkB1IidoTVJiyoCz7c=;
	b=hLwwA/xNNJ4e+OlziEdFmk1FfhfmfOVnVT+xqNWuAEZCvWzJs3zyX76e9f5WeliCAmMS
	 9qAYyI7RxWfpA63aN6FAgNaIRHMfbfhHZVKP4NEptlGx38jAlr39t1Q3Jgsny+iJhgbBY
	 fsxpgfJzSuIYq8rwyaDtapI63+tnA1xORrXxs83Ey57AQPgmUaoT/Sogz0IEryWaKLbzC
	 fyvSQErJiSNRTRsMA6JZJmVhck58xv7q31D2/IlYPF4DNEzvx7l88QNOEXmMFDZJYtLS8
	 EvMjEAOAJQLrNGMSYyy+5BKHuSIJ0myrZcI0pjhXEoifsPPJY6JusFxHGyPaaZ2dhCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfAiHBt2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AAA60A2616;
	Mon,  2 Nov 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfAiHBt2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A381F00A1C;
	Mon,  2 Nov 2026 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623280;
	bh=mmuPKWzXO1c33pw5udmNtMkv7LkB1IidoTVJiyoCz7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cfAiHBt2g539/xQ3vi7MSYHqnt8foW1Rb/mEhpHxALRNM+E/jfxyucY4yztFpugGx
	 sILX62YIJKIzxWeEqLMZqV2y8muOyMOnLPMFy4Ofo04+oycZcGyen/LYaCuihtMlo0
	 NMFpdM3hphPLvD4aQQoWc4FlqSHefraevcL8ZZTevxyBHv4uBLV3W6vFglkV4uUEje
	 0W11jFwmw7ODFQyIiNTWjw49xcCMKDipqvBoOKmqqS6YsoiDaJWsVlDYGRjOgeYYc4
	 sL1ZCHLcRq1opfdWT8mG7j6vgfhbcpuR9EJ9KUr7+MNgf7G6gKxtLkIERGp4FwGndK
	 hWU6lQA3XKubw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id B45B42310383;
	Mon, 02 Nov 2026 12:41:18 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hardik T Shah <hardik.t.shah@intel.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, Mastan Katragadda <Mastan.Katragadda@amd.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Rander Wang <rander.wang@intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 sound-open-firmware@alsa-project.org, 
 Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20261030104840.3361217-1-lee@kernel.org>
References: <20261030104840.3361217-1-lee@kernel.org>
Subject: Re: (subset) [PATCH 00/21] soundwire: Fix Critical and High issues
 reported by Sashiko
Message-Id: <179358165248.1776482.12038496822899818324.b4-ty@b4>
Date: Mon, 02 Nov 2026 01:07:32 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2453; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uyMfxyM/MJQnOHUzf3ZqarIO0UrhTr+zO9u6qaate8A=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetLyz6y9873rvtgn7SeYS550n5SYtFHVxk1xqbqe0f
 mmvQFJURykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACYi9YHhfw7bW8d8ibk/9xeX
 LFdcYfY+auItlxAnUaOG2JO29b4sqowMizIvdnaWOH8yjHp6juGlyOLi3Nmy8xbV63mnvI/KZLn
 HDwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 30 Oct 2026 10:46:39 +0000, Lee Jones wrote:
> soundwire: Fix Critical and High issues reported by Sashiko
> 
> These issues were reported by Sashiko.
> 
> Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Hardik T Shah <hardik.t.shah@intel.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Mastan Katragadda <Mastan.Katragadda@amd.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Cc: Rander Wang <rander.wang@intel.com>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: Simon Trimmer <simont@opensource.cirrus.com>
> Cc: sound-open-firmware@alsa-project.org
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[05/21] ASoC: SOF: Intel: hda-sdw-bpt: Stop active DMA before closing BPT streams
        https://git.kernel.org/broonie/sound/c/348bc756d912

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

