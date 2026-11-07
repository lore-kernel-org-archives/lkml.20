Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064650;
	b=zFtfA8C4K7zu2euBTVy+wN2ltiIa8qTxuRPr8AI1bs6+obsPrMHZUUFNex55WfpD5iPW
	 hnz/be65ivJ1A10X3I2k9Q0hDQdvF5weurZaM8bHjWfZ/nzIBxBCF7HKCDCmk/05yjPHs
	 m7SxPn+kSs7/vDnCnqZLqwCjENfwnwza0patNh6ANZyRri1ERZhjDYouqS71GCuqLjXLQ
	 T8gSAw7BJhoydLbtOXyvkb/38S1LfFCFFDvQ4r/f/4uIkk/hdhkfBd68POx4r9PWQhLVc
	 yz0iasUHM2GPzLhQ105CiTMFftME9dfGArxr0ckWnHJPyzXsosMpf6EVqABjRBqGdgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064650;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=F6q/MsZ5jDBuuA4szE84/+BxFmPAPx64/M8+UUIYUAE=;
	b=lGEr0TQNxbF/Aqi1HFlOOoauNdOwx9lZ8kKEgMxccgQQYle266jO6gG2QjPJi4NmMAP6
	 hEOEgllQDKQi747edy4t5DxRo59Rxmkj5/b0upz3t9torLJ015NGtGvQpioWyL8e6yMa0
	 zmcWcT0eQcl7vQ3wOsyQK2D4aCdidtifSocIpA+6pvVZTM3iMVkvKXPRQfiLWHzdjXYNs
	 rD1LdiPaRAvFvF5MaaIjKTTSYKmXtb0fdPjQrzZUwXhCOW+S/tCKO77A9YFyW0Ykrykmq
	 /HCzAHdFZDXghTxOWQzYevm1a8XcdguFyYw9Gz6Umw8NoC9dpvu2bFi1WXa2fuk0ZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CS8qps0P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436AF606C020;
	Sat,  7 Nov 2026 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CS8qps0P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E7F1F0089F;
	Sat,  7 Nov 2026 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794064650;
	bh=F6q/MsZ5jDBuuA4szE84/+BxFmPAPx64/M8+UUIYUAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CS8qps0PV2S7q/9M8Krw90/z0ppwy2RL1OvwvJjd1L9+yqaH9FGDn1WdfckLto179
	 Qh3VXPpFjXTHMlbGAB61rgnG6wmXT45Ll4HY+m9jqtpYbR4zevkH/h85VHdDkVYYNv
	 oZVeWeDpwWyT8X56lxzQC37LBZIWsrd6KKxuDSJhs0CbgrcpiDB9SLp3K2qZHRgZQb
	 otCww9tDSKbtQd7N3AZ/nie8UgaCKPN9MUqAKzkrHqeDiKaGh68bLOJrlr+YAEBQJL
	 O8okJoKJGTtehRru/KCGNgu9k1YzdM+3Lygm7Dtj1NWG6vHhY3TeC+RZEmlxTme0dN
	 ljieQ3SFC3i2g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 1DC9B2AB3127;
	Sat, 07 Nov 2026 15:17:28 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v3 0/3] ASoC: sunxi: sun4i-spdif: Cleanup and runtime
 PM improvements
Message-Id: <179405444330.3424803.15883456865264287709.b4-ty@b4>
Date: Sat, 07 Nov 2026 12:27:23 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YZvUmFfdUmWuzhzoqlmjzL9oD0KOHNnuLRk/oEZ0bfg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeO7JneE4oF2d6P/nKVPYdOmemv9/fYPnm5TdPo7/fn
 /feOiYf0lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJuK1lZPhhP/PMhbO9dcuO
 xHyePb/48dTnqpsUkq5sz7161OvLAdcHjAzvuB6cZ2ieNbvTzOWm2lHbLyu/yDxTX/qKN/u0+RX
 z/TP4AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 02 Jun 2026 18:44:34 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sunxi: sun4i-spdif: Cleanup and runtime PM improvements
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi,
> 
> This series contains a few improvements for the sun4i-spdif driver,
> including guard() conversions and ensuring the device is resumed
> via runtime PM before kcontrol register accesses.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/c5f9ddc7d2ec
[2/3] ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access
      https://git.kernel.org/broonie/sound/c/f003dfe0842a
[3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
      https://git.kernel.org/broonie/sound/c/a4a9384fdf2c

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

