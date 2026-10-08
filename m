Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE733C5DA6;
	Sat, 10 Oct 2026 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673537; cv=none; b=NFAQfdYm2DDQ7vP1MygI6yJPZbJMwx4L9intSjHrTFaqVXw8/v0IuzU1kniHRX3PYkV5LRmKm0LMsgagDuEo87NwU1e5IAmgI11etQ86SpCQF1k3NYqmJf6OepQQ+57tsQ6XcFaXMFC5LT7tJOGvF/edF6CHVbinJnv4tTP3ujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673537; c=relaxed/simple;
	bh=skJdmd3tUQHGVzD6TZQsGKOJkI7UvX0V36y4xyypgz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OXEns4w6XcXkWeKPGfWNo2WtW8vx4tuUsYmFg4LmgP+WEkAKHCOeEhlUkHCM7Z4FpTB5LWlMvF+vEdMZEksaiyDjwI1Cv5Yspqzmxwsto8SpRJbjm5XS7v4WDW3OmuSGBw300OnjI4f/q8jwFMPXw0GBhDRPGu7IYCMfj4jV3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFn7uR61; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFn7uR61"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944071F000FF;
	Sat, 10 Oct 2026 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791673535;
	bh=LWAleCpYBlToJ7/WPCLhRt8yE2399HoszrhXc5+pn3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LFn7uR61sXuM6F1QlLDwMGmHabCCyRsEvfFcMN3pktoGVHwFIXKYtE5EdTTqbYmXd
	 4le7J3X74Euaxae+4+TUGuh97jL9qZVXBR6sYN049bu7IrCzhOWJIzVQ1Oru76qYdq
	 oIjh3o7OEOi18V1B4yElYYTxwSs5giyp+uirMsmquG3WH1PUFsKjrsnnivSft4Kkc4
	 SBwwpfsMiX5zB3tS2qCjQPU6jFChE3PmdWCqw3/naMdWg8Z3q45s0vzc3Xkg2HYCFI
	 gJjaYoHW464PZtyrcxpWCfrjBKx4I8JXwlK/nO9BtEg72++03LD/C/5QIyeEDihceb
	 txcMIV07pKPfA==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 cassiogabrielcontato@gmail.com, Haotian Zhang <vulab@iscas.ac.cn>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
 Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on
 success
Message-Id: <179145062463.2423942.16590148509796512242.b4-ty@b4>
Date: Thu, 08 Oct 2026 11:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=broonie@kernel.org;
 h=from:subject:message-id; bh=skJdmd3tUQHGVzD6TZQsGKOJkI7UvX0V36y4xyypgz4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJOHdleNi2hpIbhRUL0FSYdlrW8e56+Onic74+E/DmTo
 8eWc0gIdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiP5cxMvSXKamwvzfYsz3n
 w2XGFztupbnJXpvpNPulI9vliSYzgxYyMrxpdFCYVvx7Y8v+Ksebos5y0ZtKry9ImtQq8Kl/30J
 JNhYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 06 Oct 2026 17:16:02 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: Return 0 from FE startup on success
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Some FE startup callbacks may return a positive value from constraint
> helpers, but ASoC expects 0 on success. This can cause .shutdown() to be
> skipped during rollback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/5bbd6696d75e
[2/4] ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/b6b3dbee98f1
[3/4] ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/f63317c826c4
[4/4] ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/240f11af9c80

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

