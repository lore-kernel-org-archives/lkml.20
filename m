Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10452AD0C;
	Sun, 18 Oct 2026 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345643; cv=none; b=INVe9HhUJtG7Cao+zvRrFPL/YrG6Fo603T2BNQn3T3Xfw9KLdMazaXWm0QaNfQdwTCFK1qMEwqOfBHRSyrcGsCn/8argEB0b2K81TWyupVYYWCDYYsUEb8VczGUoOn7R2sHq2HB1eGTNsZZgoLYPoMmgBHcl8NK0Ar50V3//NpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345643; c=relaxed/simple;
	bh=0GaUDWNHboICjjntSAfmKBuvkrmebSUBPg7VWN/KRnM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mq0/Tvo/G2bsunOhSx1d8DS2Z7XPqLsm5KfBWwhRj9BCejYVdaYh2GcxZRdNiTmG21DobP5kAIFCcMCInEesGES/5pOK2JtLZ7/VxZUbmNCbEA0apNnsY7ZU//alb172gT/f8mzOGucXfbE171+Vbj0KK0I0kEw+ZJuvEwQsBuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=es0ULFOT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="es0ULFOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE2F1F000C4;
	Sun, 18 Oct 2026 17:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792345641;
	bh=3PWg4wFyY/5JtUeMyFYwYokLNsNA3wvyEJlGxTodazY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=es0ULFOTibsky7FRB8ZberxpwkM+Xch4mX+W2Od3KkZwRDYcn/DLA1C85O5Kdbc1k
	 78Aje5RzYs45YMMaH7kVM7M0fRzjNxFsh/Xt6FcrsYTpv9UYpdaU5ugfUBv/FgobXg
	 JNhJ39VT9yl2S4y1zTwckLWudiLpo54j5pP498ryDzinTLSgu4bMKCSA5LR53JaHSy
	 dDFAeu61hYh7r0QJ9jVH/EI8nCEIOTwbEThgazkUyOXKGemHbyrL9f+E0j7etmEx/b
	 SdRIv74xcyXcQFmTDNFYFw8I8C5UDF8prAWIzxBN42jVZY5Q3FMJXOVterfJA/zSd1
	 4nXo9uPzgkgnQ==
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: lgirdwood@gmail.com, support.opensource@diasemi.com, 
 shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1792135144.git.sammiee5311@gmail.com>
References: <cover.1792135144.git.sammiee5311@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: codecs: Fix control definitions that write
 another control's register
Message-Id: <179218524120.3162228.17240342868117542010.b4-ty@b4>
Date: Fri, 16 Oct 2026 22:14:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0GaUDWNHboICjjntSAfmKBuvkrmebSUBPg7VWN/KRnM=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGrVBhOiKqU1aBijXDCXfIPaTIyq0QF/KiyeKp6xlRLEp1VCw
 4h1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmrVBhMACgkQL+9zsLPQOIk6XwD7Bznw
 cc71VQRQsJ72C5XF7uFPiytFNEN2PjTMBXn0muwBAKFQxpICG+P/uGPK09x+JxPkkJRS8Pt4jBJ
 tZoZGQoAH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 16 Oct 2026 16:25:15 +0900, HyeongJun An wrote:
> ASoC: codecs: Fix control definitions that write another control's register
> 
> These are more fixes found by the overlap scan from the first series
> [1]. In each driver a control writes the register of another control.
> 
> [1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: codecs: da732x: Fix definition of ADC2 EQ Overall Volume control
      https://git.kernel.org/broonie/sound/c/ebef9212cb46
[2/4] ASoC: codecs: tlv320adc3xxx: Fix definition of AGC Target Level control
      https://git.kernel.org/broonie/sound/c/0a9efcb663b5
[3/4] ASoC: codecs: sta32x: Fix definition of Ch2 and Ch3 Volume Bypass controls
      https://git.kernel.org/broonie/sound/c/ea53ab9003d8
[4/4] ASoC: codecs: sta350: Fix definition of Ch2 and Ch3 Volume Bypass controls
      https://git.kernel.org/broonie/sound/c/7308ce7c8459

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

