Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42A489FB0;
	Fri, 25 Sep 2026 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331302; cv=none; b=CXU58Fy/rOQ7wdXMr9XyIRXQadah82CnyDV/gs9cT3JnnZrLDP5Q8GxaG6L10ZWMov/i9wJQOirDQUUHfmj9FGehvGOx/fawcBA/VsnvdP9RXp8D8k9LK1wcZX2a21pHQJX8LSA6U2a+r0Rv5roLD7Zr+S1P5bMYxTdVUlKtqic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331302; c=relaxed/simple;
	bh=UIbX8sE71CNO3QHetSKjRNnf431f2UIk1CPHYiezPaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H1PU79yE8nTOOSNzqI7D1gWHtU1oS9os8ZC8CfmdugKJKT8vLtGm16Gzd8Did3Go/r42mE9eanWyXz1SkXBgBTYTSyf0L4sSsQnOtmGDH3Csb0QXr0o7DeZe3RllBHKkmUAZFtkwOW4icV/WoW+CHKtC3irRvHS/pb46cN/nitQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q77Fk2u9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q77Fk2u9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCE61F000FF;
	Fri, 25 Sep 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790331301;
	bh=Luzxda0LMTwI+lNnOaEuam6CW6l68AEeAnvFnRbtWUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q77Fk2u9O0xNWUlImGgOgRCgiDtvA6RdIYjdgMAgLHsFQw1M/4qiSWbPJhGl8MLWs
	 tOqpZyEV5OXR0QZt/QXdGsct5Eqaoxxn8IVCOmRk60dZwmOVKssPVk6dwbU+zG24qC
	 +GMBowFSVwnCGFYGsaYoanFlNwK8Nzb8ZdZqucQCjoj4OF0sEi7i/6DpC1rN0gNpy+
	 qwREfVvrZfHvFd9AasxP6cuRtvFzSYLCSx+Z31esz1a1Wi2MTaCXCE6Xu/J613vwkz
	 reLYrB3oxu5BOKhfBpXQoUihGfry1ycIi2EH/JgRymxk4yWJgIyNcABC30iFfGlAZn
	 QX7y/Xfl/TlNA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, anson.tsao@amd.com, 
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 kernel test robot <lkp@intel.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20260924124205.3376083-1-syed.sabakareem@amd.com>
References: <20260924124205.3376083-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: fix TAS2783 SoundWire codec unmet
 dependencies
Message-Id: <179027616368.149798.2746642245159861526.b4-ty@b4>
Date: Thu, 24 Sep 2026 19:56:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UIbX8sE71CNO3QHetSKjRNnf431f2UIk1CPHYiezPaU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtkmfj86nWNpG1r4tDdxgcxVYyT26zpJmZ0Uqk
 D8Qa/qtyQqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarZJnwAKCRAk1otyXVSH
 0IqFB/9Ys8JHtgW0C7Y2iTh5Ad7UV6jYSEk6X0kofBMTfNnKRurOin8MgSGlrYFatkilgxJ7dtR
 f503TTieFLvqAgaRKbjG4V6fa/0UgqtV8TdJZRB2pEXTi6R7d1T0HoIu/Ri0uaklpLIkjGiu14F
 FomdWS42V4u71FYcuRNk74LtWqllocnvbi58Z5HKNEvDiOlPdwv0v7WDj+vS7FSbczO69BkItxA
 tgyx31+Y29yHsnM9utJaI5qVQYlW6o0t4iMpPw7lLK3AhImAq9S54Bi7k7g+BRfUWY+t+CZDZyN
 Ybznsfxhtec8+x0C5U129OwlBRWQ+5yT6VMrcovVA3m/jx1p
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 24 Sep 2026 18:11:52 +0530, Syed Saba Kareem wrote:
> ASoC: amd: acp: fix TAS2783 SoundWire codec unmet dependencies

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp: fix TAS2783 SoundWire codec unmet dependencies
      https://git.kernel.org/broonie/sound/c/d06607bafb36

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

