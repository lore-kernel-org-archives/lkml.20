Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274090;
	b=zWxH0EkQB1KoSgX0i88Ffn4Ypc4fSRkBsazRwqMzKZjYKi94yL1Izv1OenmDyk2wvVEs
	 +LVlDkhLb8HLWPot3m2Q4bdA9hFa3wom9YRDeEz1uyyZGCD9zydE++CQXkJww+hCFuOQc
	 vjx8quR1ARLoddkQci1W2ojLT4eOvelGAh1VfmuvfAZiue8kG6cDNwzJ6wg4wqwol7C9v
	 sqoGK+SO2duCdB3plNBj9UwQ9Srn5AOIT/rWgue0nBMNZtNjWI4EDdk6Nlk+L8JAz0LOO
	 TUW/G1pSuV9mm1ZGrYAkryyarcYH4d16DO5nmNtmJHCAzn4jV54EqgQHtCy1MhkR90Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274090;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pi2nVApqlKwx0joef1xugg5ItvXufYozQ1yREpi+wtk=;
	b=IG+gSQIRAZUZZmMBNH2xoSbAHuMoqpoGd8uebsSHOIHB/zrh+oe818kCQDk4EpkM4T2i
	 1H1N951tfU+C4heFWsAwXkLFnj0uqlr1B+EtG8HP1mbEPgKWX/ZTSyTLfibZurRjU8c2q
	 4srWo5Wmw4bYkudUfUBRGNp0yS4p3tt3pZNEVFOuKDbnxVc16v3qKQkbHWW0mxNLcUx1j
	 sshG+HhrB7P7rtuNm4xzA8kwup7nRhHnk570eknZb63V3i1EmdCpXlL9+nuuaFL7oui2d
	 nMX7MAsRSlRy8TpYMXsxA654hCLtA4dVVRckUhfvsN9/8C9zyju5TNDg+8/YIYerBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gihb8kIs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CA1606A31A;
	Thu, 29 Oct 2026 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gihb8kIs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73EF1F01825;
	Thu, 29 Oct 2026 11:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793274090;
	bh=pi2nVApqlKwx0joef1xugg5ItvXufYozQ1yREpi+wtk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Gihb8kIscXZQaR+6XpnWpr2udrlNsTsIhNfVuRRa969B9agMDR9LmItW9XyVcFMf0
	 ZuBRARQqtrjUDKUuyEFzHSvpdFlNjUD9AeiDsXeLY/eLncnuRrBf6xINMALu3ZnS9i
	 IBTa+sDCvx9cakUTStbcvsuwUlMCjMzIey5fE7LugsDePlQeLfYWe7XSByr8eyuH1h
	 ZW2J3rbABl9+ivFiwWaBQy9iArDMMo7UnzRTQQIdmwbWMWdTxzwRpZwRNb32QLJONc
	 Vi3RAptSULVoDFvNhFGznyH1jY3SogNC4mfuYbolxtJrmn1Be7jcjyjseC1heYLJFb
	 VQF6x1Dcs2IAw==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Sasha Levin <sashal@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028144446.992948-1-sashal@kernel.org>
References: <20261028144446.992948-1-sashal@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Stop the controller before
 freeing its DMA buffers
Message-Id: <179327408341.62540.12883770899649017703.b4-ty@b4>
Date: Thu, 29 Oct 2026 11:41:23 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VoP8bYW+khu29xNYswZNHpexAi0sI2RFBpRM67cmIR4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIeGzwNexQZmX+4PuEh99IM62PBTX8e7ze+Y/k+1k9XI
 VXmzbLmjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzkORMjwyRFDZGPsr0i125/
 Xns//klO4orZuU4XJty3FWByEvN2u8zIsLN28+HHtsd1C2qUGw+K+T9izVb4LRjj45D/asOEq9/
 4+QE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 28 Oct 2026 10:44:46 -0400, Sasha Levin wrote:
> ASoC: SOF: Intel: hda: Stop the controller before freeing its DMA buffers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: Intel: hda: Stop the controller before freeing its DMA buffers
      https://git.kernel.org/broonie/sound/c/11ae63bd9030

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

