Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463533BB12D;
	Fri, 25 Sep 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356235; cv=none; b=YL+n5ryrX8zVXeI6q4vpp215sisfTKtSYxpHY7l37+aoLG6Uclu6VBk4xBpoEqJ6ROBRJAM+dYIgbRrVtAVPNE//qo0bGZUmQN619YLHV5TR+RizXCaQPjhsS5/KsSK5wDUI4aq4LqjeCH76Rt5bMO/oatAuTIerFxsbObwwmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356235; c=relaxed/simple;
	bh=ms+alJe0zYRhtHTH6fiIZKYjQe4B7jjV89D4uoFve00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lnoQO9PB6qelYLDT/ehXQnvTW3o6gA0fVFpXa+wh4e9xmcOGX1Bddz/XLURjf4CZ0DeMQiNSKboqid4ayumM2wbvf0Ddi/o8GQIQq0kDHsSIvJRNHgXW3SsnS+Ah3KiDWnzlGdxUAScvr9QtuSrxvSuOYiUt4TNtX6WpE4ckK04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyHfbKVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyHfbKVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37D81F000FF;
	Fri, 25 Sep 2026 17:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356223;
	bh=U2firQdSXga2Oxdw//orFvwTW23XIbwFiY3tULCcauc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hyHfbKVesXRG1nwKuJHm9f3ENMwBl6TOyR9EMWaH1u4nu6pLUZg2lrhbz6pMc0KsZ
	 PWw7Ip3xee7qoj+xUp6jmu9KLwqFHttLN8RKo12nBpntw1rIxyu6GlNtcgqbKOkKmQ
	 sfzhl9gEGt95O2n/2ct45SY2wd1ev6yU6k2QY9zrQrtFJpWXji3e2TucqZ8tLWWlEa
	 7sA3VVRp9lYYDVV3q0GmDW/2hi4KLNSdjzdoCGW7xWkUdK2IVgG9BGyFZsDKJiGqcm
	 dx17/5VBnc3wLVx5QTy0SU/pUK8lb9yipBF6Bfp7q8DmSVMhSmiFHOss3ZEd6JIgSp
	 tK7SHx5oNB7Fw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, Kees Cook <kees@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, 
 Douglas Anderson <dianders@chromium.org>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
Message-Id: <179029027295.149798.15849509210449707210.b4-ty@b4>
Date: Thu, 24 Sep 2026 23:51:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ms+alJe0zYRhtHTH6fiIZKYjQe4B7jjV89D4uoFve00=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtqr69kr5v8xZDCf+saA655wgf5ZerHyA0TvAn
 iHLaHPI7NeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaraq+gAKCRAk1otyXVSH
 0KK1B/0QoMqxmDmmJZzwx3d4Pu8uqUaJ5m3FWatvkhiyTsLNPyvzI0I+tvkODz+mTtJ/rO1UIgX
 NmDThpIErV/9WJ5JYHTOUrZ0n2Il0I1V+TtKm+3C34MJlKUv1vasZQq9IZ7ck0Gx7s5TjHBqtne
 ZB/cHop0jxEHMRUbjuN/k3/uU4t3yPU/gXpDw9aLImi6hDQp5IBzN1vBUrKrPsimGL7o65Lvmwh
 yadNSY+28PHtMLM9Q6CDx11ntsTkJ79IBk4ZyjjExDh4sZPNqFBZ3Rtnl7bKmOu2IMxl9KXzUib
 p8yE625OrGLZpOxURdOWZZ85Y2g4nlLx0Ysh3pv395NUugPY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 07 Sep 2026 19:03:03 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8188: Improve error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves error handling in several parts of the MT8188 AFE
> driver.
> Propagate errors from clock, regmap, and runtime resume operations,
> remove redundant probe error messages, and fix clock cleanup on
> registration failure.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization errors
      https://git.kernel.org/broonie/sound/c/691c4aac5ae5
[2/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable errors
      https://git.kernel.org/broonie/sound/c/a2c3ee3349a7
[3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
      https://git.kernel.org/broonie/sound/c/60a8112a088a
[4/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
      https://git.kernel.org/broonie/sound/c/1b65c13d1af9
[5/7] ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
      https://git.kernel.org/broonie/sound/c/f5f6941d9297
[6/7] ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/a79f2432ee89
[7/7] ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register
      https://git.kernel.org/broonie/sound/c/6cddf6e56d25

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

