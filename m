Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627487;
	b=CotzSS9IOP1LPX8j8lfDNjNHQQcroK3WnPwEochrhEW/d56uuqNgjusF2nyJN+oEx9I+
	 cp0TgqROsh0ivUJ5io/aEGSzZnOCIx5foeu9NypUAz9F0FkriNA7lGbolrTBpbNSZFFDO
	 z6+Ou0Rs4c2s5eR84zR62Vh+wv3OTO9UqTDPhZLa0YM5g/jV4mHEAVUzxloNv/hzrL8B6
	 MaPpD9lQwq+uwEkJfzE+o3bZiB/UIVxKlbquDdtEgCVnRFusu+c6pK/FTEzrX239sgYBk
	 CrQamr9DB7uUOhVqBQ1gP6sGTBwYBzh/LpL+NWbZT1sfiJ8XitCa/R8k+UBMRpJqv5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627487;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MIWFmMLW93k47fb5UBDsgzQjITQvV0q4tskATo6TpXM=;
	b=wws7Omj9rVmUE6VTRhFktTAJChUqP2OYVmWvTrZ1o4R2XOaBy5knlERpDmkURHRkjddc
	 5ZvZEgipG9wCImn4zNSwlNThR/AztKdD1rmrkR0N7rHZBtUrmn03dB5xX4LICEqmeeqWE
	 jToY0nm/KGZzUodlzzBfq6fxcuUtdws4YGMkWfsTZCM4XEl3CV9izNzkCIziKWG8EdYWz
	 IemR/JBEl6pr8R/6DcTeib+UD7if8LN9nS7RRY23u+bvtGuMyiSekpcjPixA5Xnh8P3bx
	 44aHNUqYy3OeSwXXBRn/CeSwQHT1Y0mj6pGTuXsT6+qq5PvfTr7mLykpYeATe1KQ9hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8y+yH8d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B760A3808;
	Mon,  2 Nov 2026 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8y+yH8d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF181F00ADD;
	Mon,  2 Nov 2026 13:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627486;
	bh=MIWFmMLW93k47fb5UBDsgzQjITQvV0q4tskATo6TpXM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H8y+yH8defNywMcvhsMB/hwcaP7NYBmdXpEA/9l9pAbbKr/9bsDdtabon+kIqk9Fz
	 TMjWxk+CvaJEVfiTH3+u73hppqS9YprvxEjlapO07UyDLmtyVnOXAz38iGdfvgLj+4
	 +bYmaVcWkJxDjCr4xaOszdwbyEAol5rT9ptxa82KCc4DdethHqM8rA/ocPPHXV6/LE
	 PX4IBUBG91aCIuOgBCWhQ85HnHMCTyfesZsYbJ5hp7gGLredy/OjL88196pvssfxhH
	 w8gWegaS3ZaiZH4QAJsm9be7jrpxeZ8MApt4BQeLvRR/rV2V5uD5BNoof+slZXqehe
	 A3C6rcrH0xn4Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id B92412344D03;
	Mon, 02 Nov 2026 13:51:24 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028104223.27007-1-phucduc.bui@gmail.com>
References: <20261028104223.27007-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: img: Fix clock leaks on probe failure
Message-Id: <179357863295.1716893.1397247055226897912.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:17:12 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nmMeTtgqt3y4v0aQ6rx2QODEWFAciEG7KgsUFXRGJrU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTI1p26NiF6lT+VIj1vnPr/NPZBj8X27ZJPtLcn/li
 7pvOo0mHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI8QpGhp6bW5eEFjl/M5wu
 q35ebbbEFqH2J7477/PXOi8ti3pgvYGRYcKtDf7xP/YaKe6f42YwbV5H0YP8O/c2B0tIu/vPcBT
 fwAAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 28 Oct 2026 17:42:21 +0700, phucduc.bui@gmail.com wrote:
> ASoC: img: Fix clock leaks on probe failure
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> These patches fix clock leaks in the IMG I2S input and
> SPDIF input drivers when probe fails.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: img: img-i2s-in: Fix clock leak on probe failure
      https://git.kernel.org/broonie/sound/c/6171024a3593
[2/2] ASoC: img: img-spdif-in: Fix clock leak on probe failure
      https://git.kernel.org/broonie/sound/c/28cb2aa75c34

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

