Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F1A4E0B9F;
	Thu, 17 Sep 2026 20:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676341; cv=none; b=r8zkRxESnM+Nk3ndbb4WVJW4HEXilUE1LVUho74qEYNYD1bKbwgAcK7xDMXkLf0RZjBgMIBsPXMnAKm9BJI0h1ED2D1QaqeRR8JjUC+BpvIocbsHsvqYG6Qs8IPQNn/FfIJOek06nxMr5qaYRacLZqu0U4jgTSHS4UpTYyqy9UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676341; c=relaxed/simple;
	bh=B6N29faaJCK6SK/WLxAepG277VEZLSk0Tnz1uKrxbME=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YM/yzD3emTZCmjzmT3w8seIzQalOyR/pF8quM71TDUgXA67z8pJq+EtQETBXpl5K2dekv3h9bIZKxO8M8/rd3wJs3+dl+ewY7GdrI087TuUoNCjhb+ix0atq0kXOI/7bOL/eFlLwuVFGiSKWSKFD617NW3q6GjXXHju7yF01Hcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aH51wQfn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aH51wQfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877071F00893;
	Thu, 17 Sep 2026 20:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789676337;
	bh=ShicaotVtyyTH0yAQTI+YBNR6GA9Tv99pXySqq7eqKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aH51wQfn+jnwCuclwIIy4xI5dpIq9pW/MjbMbZdVt4jjFir6ITWez4A9MxUOg041D
	 lzqSyWNklgf5BSgmvwecY+HMwPAxm84hskODcwLqvw8nMWMEF6pvEiBP7KSTHVJ1EI
	 WBCrXHm8081/kudyxyGSiL4jN3KPo98L5QvLFaFzEmD4gomomxEdFnPnb1apX4KD3v
	 K4AxdHAE/p4Fw1jmBpTkDhCckypfQ5etaNn3jc90AF9QVrgMcqLAkFsul4M/1U3oF/
	 OiofvFrbbPiIIDOSC/ZK1tPgDRWsAYaLEqBtJqNg/sx5eoBYA/8p/QuWHgd5QtLX+O
	 S9Fvocni+raXw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Andrey Golovko <andrey.golovko@gmail.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>, 
 Antoine Monnet <antoine@montane.tech>, Robin Everaars <robineveraars@pm.me>, 
 Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260912163500.8412-1-andrey.golovko@gmail.com>
References: <20260912163500.8412-1-andrey.golovko@gmail.com>
Subject: Re: [PATCH] ASoC: tas2783-sdw: stop describing the Latency and XU
 ID/Version Controls
Message-Id: <178959295621.414407.9495709219767307557.b4-ty@b4>
Date: Wed, 16 Sep 2026 22:09:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B6N29faaJCK6SK/WLxAepG277VEZLSk0Tnz1uKrxbME=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrEss9lbQRYezoP3fDWVA3YNNKKn63H92jNOQW
 Yc/g5zBcleJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxLLAAKCRAk1otyXVSH
 0DXUB/9M6lYf9BJL18J3XlruU9VIeFRBucJ0IzCrcNavq6orQ5QYTYq8XqZWaJI+ejUK4mSpFgv
 j/e5Lr1bXGo6gX6B0SsyIYvu+B0yoA7FxCt2B/qefUP408e08loeSnKxYNFY9pg+HGWl9MEBfZg
 smpfx3jOmIxkflJ2tTpF/f2eel56OOn6o+Recpis//XZuushPX7b77fxmPnBA39fB1BSC+eK9TX
 NsQBaHne6RUZnUBXN6ymlpxrnEQjeJMfC2ERmGADYB9DO7oGCD8flezU+hWCq1ZNuMli1JTYNUx
 HYhbm6HAV1fyC/z8XA2qkFGOaTYbWL6mExnrDOoN3ZBq2usE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 12 Sep 2026 19:29:50 +0300, Andrey Golovko wrote:
> ASoC: tas2783-sdw: stop describing the Latency and XU ID/Version Controls

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2783-sdw: stop describing the Latency and XU ID/Version Controls
      https://git.kernel.org/broonie/sound/c/b2c5435300c8

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

