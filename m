Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D53A4F32;
	Tue, 13 Oct 2026 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886993; cv=none; b=lRTQgObyY8rcrlnJV3tsMm3UT9IWJKVBMsr8ek6ncjW5WLpT1son8Jmavp1bx20awprosqiAVMQM9nSsES1g2p2BwgNvVGL8331gFLLvY9WhXbY8mUGjQNjZiuRXkuJrcBcA5gmO/fYBgPR4U4xKkRkH+N9FZ3YBIf4qQajqQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886993; c=relaxed/simple;
	bh=7auzHROxwCa0x3P2VrRV0vJTEms8q47s1btmheBl0JE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=duU/DE61aWasUyX3l7NMM9EX1x+IfJchmPtgKxFGG+cFz2+ldJthRDIanydCBorREy7F8Wbb/GjL7BoSMyC+EwkMTP3tWz2Bu0Cyrhcb6GYPy6jFUFpDSYzJBNet1SzXd8UEz23GXoTcafFM2r12j4cb1o+BnZf8do0vE6yu4xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEAKpzXE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEAKpzXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91FB1F00893;
	Tue, 13 Oct 2026 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791886992;
	bh=nGd/gnG38xb4r55IKJgw3DekjfU8cgdyygoiic+d/ig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XEAKpzXExAJMGU1avUw2yu3GxuAK00w7NsXpWPgW12XxBtdRsThcXS9DwQON1UFLf
	 5H1pJWjiGG9iV2nnjv6zlMQEx5U0oLoLral4+KTjijYb68RS++JOU2MATCk27qEIXf
	 K2qjI9MFswF8b30ZpfWiz2bP3tD4F/w7GsQEl5vTHvdtStAwBpUynYpZ0zpDJYV0iP
	 WhWyjIZajzJ4Jb8k5uoLiQ+FDKbm7HGwyjpFhJfjOb0zeJUCJpJit80Uqpj4CQyCow
	 NU3gMgx6YJduaAwvRo5r4lHc0KnzV4+3ubYYPoAeby072+yaxMrxfapbw2SXpFE3CJ
	 SyAt8uGONCaCA==
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Subject: Re: [PATCH 0/6] ASoC: Fix controls that write another control's
 bits
Message-Id: <179183114142.390394.17556910038919824947.b4-ty@b4>
Date: Mon, 12 Oct 2026 19:52:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7auzHROxwCa0x3P2VrRV0vJTEms8q47s1btmheBl0JE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOsfXWOi7W8EreZaMwtyyqk/eHm4BSVNvvd/0Xnp09M
 Wem46SNHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZgIlxbDP8VvH5xnF8Y5CYWy
 Hz/AfmDiF/4NHXxrV6W+O9/w+DjHwy5Ghulc2/g1Ozv4toUlZDllcq5Szy2fczZSYHGcs2vzFuX
 1DAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 08 Oct 2026 22:09:46 +0900, HyeongJun An wrote:
> ASoC: Fix controls that write another control's bits
> 
> In the es8316 thread Mark suggested checking at registration time for
> controls whose register fields overlap [1]. Before adding such a check,
> I wanted to see what it would find in the tree today.
> 
> A script expanded the control tables of every ASoC driver built by
> allmodconfig and looked for two controls in one table whose register
> fields overlap. It found 80 pairs in 33 drivers. Most are real bugs.
> The rest are deliberate, where two names drive the same field, such as
> the AC and DRC mode thresholds in sta32x.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/6] ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
      https://git.kernel.org/broonie/misc/c/203436d2aeb7
[2/6] ASoC: cs42l52: Fix the NG Type Switch bit
      https://git.kernel.org/broonie/misc/c/8b08b98796d2
[3/6] ASoC: pcm3168a: Fix the DAC zero flag polarity bit
      https://git.kernel.org/broonie/misc/c/b26edc925c1c
[4/6] ASoC: max98371: Fix the Speaker DHT Min Volume bits
      https://git.kernel.org/broonie/misc/c/f7934340c56a
[5/6] ASoC: wm8978: Fix the 128x oversampling switch bits
      https://git.kernel.org/broonie/misc/c/d0567ca9a2fa
[6/6] ASoC: nau8822: Fix the 128x oversampling switch bits
      https://git.kernel.org/broonie/misc/c/4db45fc1da3d

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

