Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623294;
	b=wU8p4P5nrTb0lrqDV12UKuRDW8l9RkPfx4d0uZ1j7Hwt/obTcZ64pFDMsjUFh8498uhf
	 hBpfwjaviLxQQfVb3zA+oSFM/sYzhSLAwGu3/aJ+mm7X+jIUAEGwV0Jxotm4NE5smH+hi
	 nwSADt8NpOJGvUJKvg6ft+JNdCECTJUuPWp+V9wZzn45vRP1GDM9kKvYWRPcHCOGICW2X
	 WDnSRrdR36HtnhR4hguEB2DKfB4G1sO5+v1Y3REMw7hJqCABqlGdYeucTvb5LY6m8Mey7
	 oZsu8hqHvHTArpqXfhkpRfLv1Ih08cR3bEks/+2Fxh3WzGxLmZvCnVxAqVt21k+twlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623294;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qwweaaO/9eV5EACI9PAPLjEqv5QG+I42z9y/iV0ph3U=;
	b=POIneaSn1gX4UB0086KmbMkgJsxRzoKOYiXbQ+7CGieYsGSTEt6So1htsmjlQAgJvvBU
	 /a6RxXoOAd/PfB9lUVkL8dZ30rUHUOpA8fVhTdN6LpB3+wDnmGueeU/OelwoS7H9ARrf/
	 WlcVicx5XOGPRnoEBBMTNu8FDaypOgVDoNbBYqmb/HxHWTFAQOoqAAG7+sOXv9n/97/0q
	 fiCRZxxicNeTnWjVXIYNYPh1Z33Wf8z98B4grDG28+4iWnHB6AuiVcKGiDRdX/iYqGf4n
	 0sZUSFPvZuyTtIfuESd+FFbS4HgkmRRU4Vux0jqDvgHXc11rRxZ8jVdVm3XLglCf0rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BprjTH+/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249FE60A2612;
	Mon,  2 Nov 2026 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BprjTH+/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D951A1F00A17;
	Mon,  2 Nov 2026 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623294;
	bh=qwweaaO/9eV5EACI9PAPLjEqv5QG+I42z9y/iV0ph3U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BprjTH+/5hBcBv/SdLZ/LblFZXyfjqHlRCXB3m6df+/Xi0vococayo7dSDyYB6J1X
	 CFtyuEjzOx3SbcdBRGZa1X1p7XJWSkYmJ5BdmDrOi+7yzm4OLD4M5sdRWztcBxfxhT
	 x44yQk4hsOfYPLNEYXLM4FwoyV83sIqmxypoFEc++/EtmA51q3uNSyQazm2yQe5dcv
	 tVrya6/1rIZjQh3oLGZg+TRKExcyOq3Ol97W+JFy/9xyktH77GA1rpXW7zKU0z1zU9
	 KTeMpQXvA1kCFFxCU2yBu57ziXmVxppSVKtyccnwFVBxfpOH6lT+pP/OVsqlpolGCz
	 d2s+3+BM3qSzA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2D0A423103B3;
	Mon, 02 Nov 2026 12:41:32 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 HyeongJun An <sammiee5311@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 patches@opensource.cirrus.com, Zhang Yi <zhangyi@everest-semi.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261019051321.2973771-1-sammiee5311@gmail.com>
References: <20261019051321.2973771-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: core: Warn about controls whose register fields
 overlap
Message-Id: <179357841322.1716893.4726450758642440493.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:13:33 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=R+r+PP7Qx7ZZjyPvenfww4Ib36StC+B/qqELNmRyFoI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetPxReKbc8PrhuWfXdDq5V941YDTc4zNPRyis2kH13
 te9em4zOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRx68YGc6b/+BLfP9hZXaz
 d/a37DOWv4sdU98s/c2hftFKwlzqrgQjw61LlvHGs5a+2t0sd+j9jOfHWT92GMW1Xz7UysC7aKa
 GMjsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 19 Oct 2026 14:13:21 +0900, HyeongJun An wrote:
> ASoC: core: Warn about controls whose register fields overlap

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: core: Warn about controls whose register fields overlap
      https://git.kernel.org/broonie/sound/c/b00ec42dff99

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

