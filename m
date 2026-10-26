Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100311;
	b=OKm4vHEbreWKQZ3Lyyo1jc1+ye8/yfYrT51QAImzKUc1ASpNwacOmAqB0SW49mDf63mh
	 ixUbim3zWfjRK1zcWVduXXjT1CgRpL0YfmxuQsuMb6Qj0/wWYM4acDT32uKtiGzX+RacB
	 Lf19s9Qq0L97pRqQBhCaaHRppyOGLPDdVDKtmxATUOshvZEA2fHiNY4lDDzn9+HwBrqOk
	 nXPXcsrVFKxNmI0bMgP0Xvu7eUGe+aPbauJc8zD4U310Aa/ul3dRNJK0m9yz4CM8gzs5z
	 Lr378eutXZmbFydcHRj5aCVBto+ErjHcQwlNqUvjhKIjJA17B4TOMK6Op99daBWFJGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100311;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=T/WpRqfuHu2gv3vu+doh/Uuv45D1PWs+wpgNwj4r9Ko=;
	b=LATJL54Rva4mXimpmT6uVyejaLgDU8R3Mu2AtkG9ncXTN2r2DEPgV6IzcxW9e2iDwkIE
	 J3ZwTgZQsUpg/iMa3mMCGtennK18vWJeh3rSnj1FX3X4cOXJ4QIKJzCmKiVqTvnAsnZJO
	 a4CwAYGOwIhwd2BKnpEX6E1US0D7OaeFbmF5z9Zaxh1CdhgZ+7oXyt6YcXPddoQxnQVoi
	 AhdXiB2oKsTbGRyqrLr5fIvTPFLGZAUdulNmIOcxMptKxOZGiMzPQm3U6FqGne+7/Tkgt
	 CzyWLOErGBWqYLVgboztM3bwT0F1qnuNueIgGAsKdZsSw2enJ3aFkUjmFLDtiS3hEKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2NBjHGK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DED606A31E;
	Tue, 27 Oct 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2NBjHGK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D221F01828;
	Tue, 27 Oct 2026 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100311;
	bh=T/WpRqfuHu2gv3vu+doh/Uuv45D1PWs+wpgNwj4r9Ko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=X2NBjHGK9KeJP0QtGq2dHlO3OwNQnNUcS/qaLaS2fzQI7R1u8kBjGmPN5LsNML4nl
	 OhvkLjMeTfm2nE19BHfd3oOEukEm4R5qFrEnpQPD/gE93jQ9xAhf9gRb9REWT97sqV
	 9MhjUZVh46CIHyKxthIztZACvY6nPOq/xp07eYGVoobCm3QLpCMpVWJ3NfHt/iZ4en
	 zd17R56JhPenw2YMDVhTZcDtxDYig75WXG0b6VZem6ZDHN3sL0uCJh5ywn3MNOmqzX
	 pPAPEEOlNpazPyVYT6gE18Ibd0cPX8k+jfqxjeNYBX+syaHRu+mD8U4f/Zut8UyjIn
	 I6+gu953lhtQg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 782841F4ABA8;
	Tue, 27 Oct 2026 11:25:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261022090923.769464-1-m.szyprowski@samsung.com>
References: <20261022090923.769464-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] ASoC: codecs: wsa881x: Fix shared powerdown GPIO
 handling
Message-Id: <179304588839.199157.4465723406365442315.b4-ty@b4>
Date: Mon, 26 Oct 2026 20:18:08 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BVwolA7B42yKEIHFUITAoKlWaO6Wjiu7PRPTyW7hYtM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIedIk8/+EkkMDl06mRGWSclLlj/+Mmw+N3r5TvzXK89
 6C6Pzeyo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNRE2FkmJ5WdLPbPWkDz6LZ
 t9K7Kwr1vP9OSDg0vWed869aV8/6Mob/NSGdm5qXyzVwTV7muuQfv+uf08Yze2enLeqRm+8TFxT
 KCAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 22 Oct 2026 11:09:22 +0200, Marek Szyprowski wrote:
> ASoC: codecs: wsa881x: Fix shared powerdown GPIO handling

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: wsa881x: Fix shared powerdown GPIO handling
      https://git.kernel.org/broonie/sound/c/c80f86ed857e

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

