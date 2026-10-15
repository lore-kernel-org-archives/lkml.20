Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CC619B3CB;
	Fri, 16 Oct 2026 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146545; cv=none; b=tvlZT7C1XHYgg9bIAS85iVxDwhD3e3Og6qiiWk7A2nXRWDPYjJtvVQZrZKdqqFL91n8Y1Ged1YDTC0Xe+zgY+Vs5L5CZaH9YCwaEmzDN+Ozw9/O6MblrZh0nZz2szOWVGQUTL+Nlsav0GyaMuHvYMl+BbkicmcAR9uTUgTIHSFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146545; c=relaxed/simple;
	bh=6zqTom2WlZPTwEEtyh3GxcUXytYw4YtB15LlXVi6qP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bWQ2YtiQlFAKYd2lHcugGW2ZxQ9yFK9Z3IPgxFWCkzmQfFp3klpQkTB3WvNDB5+1U5sqT2aNVvspN6mOZCJ6MikkhFI19VhoidnFQG2aJhEO4VIGvm4UNZXzk3LDhoOJ8PrBWDtVMKfChDkGEMnHfF6XTznQq1oawBEfNVjLmBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGPQfZVb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGPQfZVb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5691B1F000C4;
	Fri, 16 Oct 2026 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792146544;
	bh=Fupo3qVQI2pxjW/yxgqOTHlZPzPsqE2ts6oU7cgw2DA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VGPQfZVbRThd2e8iprQYEPOUs0X+ngE0wfYnIyy8UEx6+zOguaCbIiZBhtzPsjicb
	 YsGQSs1bBQqy7bj8GCRiA7MQw9gmzRGpGN/7lfooSOh0A0HQcUxIStioTnApgg2X4X
	 PP917JW0LTzqTasxVWsumro6ZLXivRk4imnPbYVWj1CxOCHkN99LtOhbZn1yVddTeb
	 thfGihva+3KaTwK1XTadhCfjeMZQEdBYYxlRkyrJUX9/MV4bxLONLnq7FTOARG6285
	 czuKceIbFBxohW+rGVP56n2fh+J3vV/KOeBWf0V6lteewshCyyH/Uw3e6JRNlvRENc
	 sdIxKHO/FlUTQ==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 cassiogabrielcontato@gmail.com, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>, 
 HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v3 00/16] ASoC: mediatek: mt8195: Fix clock error
 handling
Message-Id: <179210283368.134795.1901521604596560361.b4-ty@b4>
Date: Thu, 15 Oct 2026 23:20:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3281; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6zqTom2WlZPTwEEtyh3GxcUXytYw4YtB15LlXVi6qP8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIu/sm+ejBlzx6b75GzeiTOSM154fpUbf+8KVxXWHa47
 P0soTKltaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATUd7LyHBi2v1rgTuv/jLj
 ENK4PGuj7LPGxQs2L1us9OvBwikfeOasYmTYnSs09yqjeJ6wVnQBo3O1Ypbhx+s3Q4QO3X152yh
 J/jALAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 18:27:35 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8195: Fix clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves error handling in the MT8195 ASoC driver,
> mainly by checking and propagating errors from clock operations.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/16] ASoC: mediatek: mt8195: Fix tuner clock error handling
        https://git.kernel.org/broonie/sound/c/8e5a2eabb0d7
[02/16] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
        https://git.kernel.org/broonie/sound/c/ad1617e53609
[03/16] ASoC: mediatek: mt8195: Fix register access clock error handling
        https://git.kernel.org/broonie/sound/c/c23390ecf5c0
[04/16] ASoC: mediatek: mt8195: Fix timing system clock error handling
        https://git.kernel.org/broonie/sound/c/f18c0a8e528e
[05/16] ASoC: mediatek: mt8195: Fix main clock error handling
        https://git.kernel.org/broonie/sound/c/9f1b48c658ac
[06/16] ASoC: mediatek: mt8195: Fix paired memif clock error handling
        https://git.kernel.org/broonie/sound/c/c0ec135cf3fd
[07/16] ASoC: mediatek: mt8195: Fix FE startup error handling
        https://git.kernel.org/broonie/sound/c/b1db7408c8e0
[08/16] ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
        https://git.kernel.org/broonie/sound/c/a2ae972c75a1
[09/16] ASoC: mediatek: mt8195: Fix runtime resume error handling
        https://git.kernel.org/broonie/sound/c/933fbfb66488
[10/16] ASoC: mediatek: mt8195: Remove redundant error message
        https://git.kernel.org/broonie/sound/c/9f9ba582ac82
[11/16] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
        https://git.kernel.org/broonie/sound/c/9d5dedb285fb
[12/16] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
        https://git.kernel.org/broonie/sound/c/91dce9c7eec2
[13/16] ASoC: mediatek: mt8195: Fix ETDM startup error handling
        https://git.kernel.org/broonie/sound/c/8e67c67f3fd2
[14/16] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
        https://git.kernel.org/broonie/sound/c/1d6f1785d903
[15/16] ASoC: mediatek: mt8195: Fix ETDM probe error handling
        https://git.kernel.org/broonie/sound/c/ca3ac9a7eec1
[16/16] ASoC: mediatek: mt8195: Fix clock parent error handling
        https://git.kernel.org/broonie/sound/c/a4276a80c62e

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

