Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405AD4AAC7D;
	Fri, 25 Sep 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351189; cv=none; b=qhxmjaBOt+vC480P7zCBcPPPM2WwvEr0r/AEkVerP6WnLCCYqCaJFtNtrEJVl6Q7UW71E5dHaMt9Q4VwYvoKtez/AHh2bt9JlKpbcssoEmVVJZKX8K7xbyaHogDPPQc+XPBfivWHjEAcCTEFrY4U5J+Hjm/M+6XdTA5hjKs1uUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351189; c=relaxed/simple;
	bh=IpGhm7OB83Mc4FDks2ZZojJhYfOiJVZR76Qz8mBKRVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CWa3U9UR933kQnnwgFpQhcp8vK1Hknyfzqhcq5PPkY/nl8NU5EUyTPuxm22HaofpMDEAX5hzcqPeuV5dr9IwQBxpbo454S8dfqOozGKqnWzYKW5Y+LbwidU6zJOhI67P1ezEvkwrsiadUiUZRsOnuUozUcTTw3QyoFEXTaQw7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epsJhhEj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epsJhhEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485601F000FF;
	Fri, 25 Sep 2026 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790351187;
	bh=wYCD6N4Tm0W6NuF9x7tQZrgnHtkFSq9peIOsy5rGgqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=epsJhhEj5x+IYDRT1Cz9qYY+tK6yRyc24+r0REdhATGYiKiHQtpjcDaVGAKmlC+49
	 I2Sieg2UxcLrnTAg6MBILLcgbSAaaOppdxGS6jr65iEXs2ho/tdOGC4he1w0fCek3M
	 Imn1zmR8I1TnbsmiBxk4H9KCpngSHFwjS0AEF48OIfj1DMxZwh6++9MnSP+qlKFXux
	 2qmg8OCSIvHIBnmSsTqfb2glpJNAnhAOA9QCaeYCo3k+iGowaJHYrglDkw54llCnzU
	 Yh4dY5OJtAY+hVnZfFD+M4imgd9dAoEKVwLMZaCEFB7OYppKCM010kJhTSHHsCui2s
	 jwejHgnl3psIg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
 Kuninori Morimoto <morimoto.kuninori@renesas.com>, 
 Zhu Ning <zhuning0077@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 John Hsu <KCHSU0@nuvoton.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Shuming Fan <shumingf@realtek.com>, Derek Fang <derek.fang@realtek.com>, 
 Jack Yu <jack.yu@realtek.com>, Bard Liao <bardliao@realtek.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260902013256.93072-1-pengpeng@iscas.ac.cn>
References: <20260902013256.93072-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH 00/14] ASoC: codecs: propagate component resume cache
 sync failures
Message-Id: <179029012313.149798.16242855051587544939.b4-ty@b4>
Date: Thu, 24 Sep 2026 23:48:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3309; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IpGhm7OB83Mc4FDks2ZZojJhYfOiJVZR76Qz8mBKRVM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtpdNVvzfaESRV5vz69WkATojpsDntnHAmAaRO
 r+l5yYJJdaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaraXTQAKCRAk1otyXVSH
 0F+OB/sGyRCsKfFQp0uy1T9Uc9Z9nP4w+8ytofUaOrOvvpxdSfg0VqNzr20Ol3QpyRMsUwQ63Ae
 8kyyLPaQ6rnQof93LMsbBDWDYvYB9+PjshMorIznp9ZrqJRB0XAHmqaB7skpZsEMKFxF+HA3/2K
 ishvfaVqbyZAXE4TTfjV9kNLn5w2GURTdndnvtGx11wt0CL2s07ER2pyWAn9jEU+3yKPNPlzbwz
 cOxct2vGHzDAkZ9RmcGiXxZaozKG/ALFC1yhkAUDZeVVS/nTXRsfiKwYXeHpMTB2V0t2nixajJM
 PuDeWTKJUxnFADtnl4w/b5ImUUckJWBaE6WaR+kS97XH670X
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 02 Sep 2026 09:32:36 +0800, Pengpeng Hou wrote:
> ASoC: codecs: propagate component resume cache sync failures
> 
> Commit 951af101c730 ("ASoC: report component resume callback errors")
> made negative component resume results visible through the existing ASoC
> component error helper while preserving best-effort resume.
> 
> These 14 component resume callbacks still discard the final
> regcache_sync() result and return success. Return that result so the common
> wrapper can report a failed cache replay with component context. None of
> these callbacks has dependent work after the sync, so the patches do not
> add rollback or retry semantics and do not change the successful path.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/14] ASoC: adau17x1: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/8ca84987c11d
[02/14] ASoC: ak4642: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/7142c34ed92f
[03/14] ASoC: es8316: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/243d0c47e57a
[04/14] ASoC: es8323: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/b7c3f95915a9
[05/14] ASoC: nau8540: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/0bf2b3411537
[06/14] ASoC: rt1011: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/432734a00bfa
[07/14] ASoC: rt1016: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/98ace05793c7
[08/14] ASoC: rt1305: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/30858325aa90
[09/14] ASoC: rt1308: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/3db3289178b9
[10/14] ASoC: rt1318: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/a5735b341c6e
[11/14] ASoC: rt5616: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/8fc9d353d537
[12/14] ASoC: rt5659: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/3a9b5bce85a1
[13/14] ASoC: rt5660: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/70fe8997b030
[14/14] ASoC: rt5665: return cache sync errors from resume
        https://git.kernel.org/broonie/sound/c/9f2933d9a437

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

