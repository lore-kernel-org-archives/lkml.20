Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56458E2D4;
	Tue,  8 Sep 2026 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897467; cv=none; b=Kzj3QVCdEngtFtjma+qRP0SspuA9AiNVEbzWXMhd3xPsrzf/AeJ7ggQmojh/ECdYnYgpijXZYg2TWCxNbPn3ycI4qYa4jdCQLTm+u0g/chRB/DknWtNqX88UuRkUHKP/Ij4Fi28d+dDZ6OK5bvzDNefMLK0ZhO8HSS3iNSQffrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897467; c=relaxed/simple;
	bh=3zo+8Nplysj0uZq8kmtp080KbQxyvHUiCXaI8AbUN1k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g7h4tZB8SvI5t2+CkRiwnTAVwrSmFYhIdexiWyn1L1icWo/9BHjJXhh5TQtsQcNuOkyl+0I7+7y59IoTqYUV/aQxWcNC8D20nXAqebU+YRHtjU72OgyFGLTe3spgWDwLoIYOg1DDq7RGZOb9mQDAKDC4qqK28Pwkwf4V70UMcRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9ECpEML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9ECpEML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CF21F00A3D;
	Tue,  8 Sep 2026 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897466;
	bh=5yQ1BO63eFhwZkJmOyapRsg2D7bjpdiukfRS/IpxjE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J9ECpEML1wnZrzgqgsFOFklqjQJLcGyVBjyHCPu43Q4ah7B4fSHZQbGQQw5j25pet
	 Yrub6PqOYb/tFgjiJdbh4yXdSEZxdleZKLCZ11U/Igj4YhPxwl5Mewt9prINegN7JA
	 dgk8G7qTw5Cr70kxzQkcb2vofxkLs33KyEnq5GS8JqQIdfGqRlSiOfs0hEJJhb8ZQc
	 v2r3Okx8ZrtIJ7EDsN+5fiNiAoRx+DwkWrM/g2pJIg0beQ4kiN2zYdWR9VDgQLZ15p
	 dYxGzEv60ZiFmkHKVq0nfxpRI/tbVrsNTnRZYAdh8cmDsUhFIUa49lZ+0tsY55WOV9
	 3TJ/YhDFvFCOg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] ASoC: codecs: lpass-macros: switch regcache to
 REGCACHE_MAPLE
Message-Id: <178889373210.78527.13617267246912417775.b4-ty@b4>
Date: Tue, 08 Sep 2026 19:55:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3zo+8Nplysj0uZq8kmtp080KbQxyvHUiCXaI8AbUN1k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoGi2z49p+JEer4ne5Y0vM1u500kaW/p6marVi
 GwPAQ4LWaWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqBotgAKCRAk1otyXVSH
 0IrCB/9noJpxCdnyK3HafsvMHqaDE+k77shBTI92l9a8pn+rv1Bbfd1bcTheG0lFnu1IHt5Hf6O
 mExIGP1ahRyVKgyQL0ghRYnSHVVbGkzyHtdUBSX0XIjgA3TCrpFS38qMMF0nQWiQdgKu/9TXmzH
 3MAItLXRuOQyFxkrKOdaLzNSF1Cux2PsW1s/8jHnHRGBKqKSomFLUbeo2pBpozzgqQDZj3xL5JU
 rms90/a1DHy5z2YvtLTCMzS6OdJx2ifkkVAOQY75EN2qeDo45pnOH88G393Ue6AzIcNF4zqF2HN
 JcToTAtb9foVfqCFLiYEmXeYO1MiBxLK9YHh3lWy4LzUzBsL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 08 Sep 2026 09:28:00 +0100, Srinivas Kandagatla wrote:
> ASoC: codecs: lpass-macros: switch regcache to REGCACHE_MAPLE
> 
> Move all four LPASS codec macros (rx/tx/va/wsa) from REGCACHE_FLAT to
> REGCACHE_MAPLE, and fix a latent v2.5 Compander1 addressing bug that
> the flat cache had been absorbing.
> 
> REGCACHE_FLAT hides missing-default reads by returning the zero-
> initialised cache slot instead of doing a bus read.  The caller can't
> tell that value apart from a real hardware value, so any un-defaulted,
> readable, non-volatile register that gets read silently returns wrong
> data.  Since commit e062bdfdd6ad ("regmap: warn users about
> uninitialized flat cache") regmap dev_warn_once()s the first such
> miss, but any subsequent miss stays silent.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/6] ASoC: codecs: lpass-wsa-macro: use v2.5 Compander1 addresses on v2.5+
      https://git.kernel.org/broonie/sound/c/233d36a96009
[2/6] ASoC: codecs: lpass-{rx,wsa}-macro: sort reg_defaults before regmap init
      https://git.kernel.org/broonie/sound/c/246c785491bb
[3/6] ASoC: codecs: lpass-wsa-macro: switch cache to REGCACHE_MAPLE
      https://git.kernel.org/broonie/sound/c/ce7164c89b5c
[4/6] ASoC: codecs: lpass-rx-macro: switch cache to REGCACHE_MAPLE
      https://git.kernel.org/broonie/sound/c/384bd7cf4053
[5/6] ASoC: codecs: lpass-tx-macro: switch cache to REGCACHE_MAPLE
      https://git.kernel.org/broonie/sound/c/8ed9306885eb
[6/6] ASoC: codecs: lpass-va-macro: switch cache to REGCACHE_MAPLE
      https://git.kernel.org/broonie/sound/c/322a9e0850b4

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

