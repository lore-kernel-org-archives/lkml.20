Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600832;
	b=B3Z5SfRcHKWvYx+yPbCR/sDYEy0ODnGNukoCEjmOMAlyaype//tMcD/eH4sMNzZLLrj6
	 5P+FiumkrPTHQVToaf3g+/wJPM8OMXoazztqhD1fOX2asA6LXhHsLcJpiiSCYBqxv7zgX
	 CD1Q2GzG3sfnlchHrka6U9k3DOCIPba0Mzw6IUDYVzFkwhLtI2kSgJXzR5+VkOJV9fsj3
	 EinzeF54BOnpQuS06Z9lDmSvjVx8pFg3wQHXA1McAoFR1StoLOVaIgnSOlc/QDH7Vt0HL
	 oTatoPGEqUBtVeHYtq80iOU9kfp5MNDodFHBkE+eIj72+fszRZipYTUIePyzpXKv9Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600832;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ev1ownRP4CVJIDcMp5EYAgateqOpAXygtidZFca6gS0=;
	b=Y1pkoj5V1zg5t+i6zjqylg60uEWAniJUWCrLRjsneo8s6JZgogZsEH6cy71OpqTB2zk8
	 t+lPDg5VyXpd0F15Sw61P2Vkw3q/TRpBmxbzWI3Dk+15lPxlzjjyjhBKPMoZaEJo3oypu
	 4HZoL8/ybKsBnb/W3w4bKMJFm32nEfVK2C3KnYq8Nes3xlhwuBdZIDIxswoQStwzbcann
	 GL1AuLfTtXI82YApaOmfKGXYx6DoujC0bT43fY18X2tRjxWbxrEr85Fg5wvsK+hzPXKcQ
	 N0AeWx3oefd0PZgbOGZ4geY7QzcsMxs9A3/EPqEiFY95b/NGjJY1I6/ZqYNTejlx0/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lmj7u78h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69561606A319;
	Wed, 21 Oct 2026 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lmj7u78h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277F91F000C1;
	Wed, 21 Oct 2026 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792600832;
	bh=ev1ownRP4CVJIDcMp5EYAgateqOpAXygtidZFca6gS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Lmj7u78hzam2fkuJx1VdbxsbdOx9Td7YjsXdNLHIsSqONzmhLR0ApkZC/1NaTsVZg
	 XJIuWKXR7UzdVlOEJz/rWdWv1zq+Cqu5ofnvqqvc0h6Tt/pgi9N/+TegFmpq9Pm4HY
	 DSdeiDfCK/yatt+OFTuQVs8q6wncwZBYx1E/XXWr+8Lli8/ucIWUHXNyRyrvImhSm0
	 Qs+7ch3/E0jnxEqHKWF9uZ8k3HchZtYVfI6DKdSgkFwjrImm4FHuEq2KTqmc96N27H
	 PkP/kPQVWNYqidmdr2EftJzBZNgmDvewsUu76A2zJI69CfK8G9fcFwiXzombSBmWcm
	 QiArtvTVbweaA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020084656.2725461-1-arnd@kernel.org>
References: <20261020084656.2725461-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: amd: add ACPI dependency
Message-Id: <179259346580.3850049.2591614034883345876.b4-ty@b4>
Date: Wed, 21 Oct 2026 15:37:45 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3mH2amkY7rjyqbuo5HkaA7E6Hyb4TLV6Xv1mXzjjIFs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJuvPoRwyw/MfhJtabAzuU7uHuvfzfYe5Hped+EF32vD
 N8Hvlzv2lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJvFBiZJhktZHFksXSefcL
 wWf/r8gUKNpePL52/q071V9KtyS/ycpgZDhb11vbLJv8Mdfj/B0Jw03X/SZF/V67IG/i+l/rXLk
 Y+pkA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 20 Oct 2026 10:46:33 +0200, Arnd Bergmann wrote:
> ASoC: SOF: amd: add ACPI dependency

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: amd: add ACPI dependency
      https://git.kernel.org/broonie/sound/c/bef34efba74d

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

