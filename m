Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725418;
	b=2d6ohnoiS6b8cy2wnN8GbMgfwGCYnkwsckSedq8ldp82EefRcK/Ud2ft2aSWA58/wITl
	 ZuiAiNfWPGWA49516uuWpVh5IC1oXZm1yZKvbQYfiNOr3pTxI/yZTqiBpcmOwVMvc5BNe
	 xDaEv0OkioHOwdQjHEJkLh4BICpHFTod3oLdvihfbsf/H4HWinevM1tYVldEq/AHgtVFL
	 BY0I5dgjP00Sgt/nKSmukltVjHn0OHmG53mmsiSR4vNuZWVvGJ2akOHaxUvgXXcdJp/JA
	 Qmt2WBlE7Wj/U7UGI+WXVlbCHBR8eMD2pILtlg+zng4Skpg7Eb9JAnKRHzcs2jcFCGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725418;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UGlBfdtTI7DRdYb8AG56P7w1/F098INCkM1ZFPGKrvY=;
	b=qOOn7ROFy0mE713mBlFh6edNRT0GjCSL14rW2bUyzhlFUvP1FhyHcZ7mptPLlDFvMX2C
	 sLDviT6TgCb85GasVjm9WR0Xw02Efex+Q+qQEAogcB0TJ/Vh3djrWMAJRDfz1E8KcziJt
	 rEBzh/078KKq0hO9dtTCN2PNnzRwUW/tFICNgu9ilMGNv/Nhgref//37E0NlydE4zoPP1
	 HfxHRJXuuMKETUB103FTKEQdiGYSjlC3lCRV7MA4xMZXbRAJcT9OyQb2i6RIspR3ZzyEa
	 Ru9NYPApEhk8fD9YWdfaDqJ5VQ740FvltPaGBzre5hvHwaq+4acxGI2r4kL4rPXof4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpHHRdJI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177DD606A327;
	Tue,  3 Nov 2026 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpHHRdJI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922D41F000C1;
	Tue,  3 Nov 2026 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725417;
	bh=UGlBfdtTI7DRdYb8AG56P7w1/F098INCkM1ZFPGKrvY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GpHHRdJIbHjqUfSmLL5k24RJzFcyygCBWWSrOOwIya5mC3GVMGGaOAph5/1b+N/IK
	 +jEL/y56L5ovcZfTeaGqGge2oZ/dF0otuplXBeuIQwpZwudDomGUOm3BySK1vs5f+B
	 mzhhb8jIKvUaXH5hS0ZxXz8oVAQm0DyAeDwXEk9uut4bwPf+G+ImXHPWb5wPgYOiWl
	 XA++c0x5r68UtC5vhq31i3y6sUJeje1RNSIUqeKX8mjdyvGR9XLkNqYR+/koCRDn/Z
	 uEbdP1Dof0qc8qbXIatFlPgiBN71/Lr360ghmaL90SW2hGGunjAhpjdyQUwmHUz9p1
	 CQfBmPDzEhxcQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 360D82557265;
	Tue, 03 Nov 2026 17:03:35 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Pengpeng Hou <hppiscas@163.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, John Hsu <supercraig0719@gmail.com>, 
 "Fang, Yang A" <yang.a.fang@intel.com>, Yong Zhi <yong.zhi@intel.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>, 
 Bard Liao <bardliao@realtek.com>, John Lin <john.lin@realtek.com>, 
 Derek Fang <derek.fang@realtek.com>, 
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>, 
 patches@opensource.cirrus.com, Stephen Warren <swarren@nvidia.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20261014032452.13456-1-hppiscas@163.com>
References: <20261014032452.13456-1-hppiscas@163.com>
Subject: Re: [PATCH v2 0/9] ASoC: stop dependent resume work after restore
 failures
Message-Id: <179365943058.2186205.6922291136572761907.b4-ty@b4>
Date: Mon, 02 Nov 2026 22:43:50 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DWIGyEvV5MXjINobRX3DmdNlKykWtOqu7HDWbTNwsH4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeCT/n0AnlK7fTYZ+7r+6T3K7vT38H6iQ/cRLZZOaoy
 MMoNOlKRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACaywI6RoeldYe369WnpVxnm
 PJukfpbN+Ar/2nXnmnbdNDR9xX373imG/2H3rz6/urc+u852l7SzV0zoJdmq7UE1S0zj9vd99Yt
 X5wQA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 11:24:43 +0800, Pengpeng Hou wrote:
> ASoC: stop dependent resume work after restore failures
> 
> This revision addresses Mark's cache-mode concern and Charles's WM8978
> bias rollback question. It also accounts for the next suspend after a
> failed resume: the ASoC wrapper reports the callback error but marks the
> component resumed, so leaving an IRQ disabled needs driver-local ownership
> tracking to avoid disabling it a second time in the next suspend.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/9] ASoC: nau8821: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/924b88cec6b5
[2/9] ASoC: nau8824: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/230d0320971f
[3/9] ASoC: nau8825: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/6bfb1abeee3b
[4/9] ASoC: rt5663: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/7cd349171991
[5/9] ASoC: rt5682s: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/9561e9be8996
[6/9] ASoC: rt5682: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/083dbbdfee9e
[7/9] ASoC: wm8978: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/947f7c8b9728
[8/9] ASoC: rt5640: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/de80fa166b95
[9/9] ASoC: rt5677: restore safe state after resume errors
      https://git.kernel.org/broonie/sound/c/d9dd3f68d6be

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

