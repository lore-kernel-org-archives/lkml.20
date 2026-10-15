Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BFC488232;
	Thu, 15 Oct 2026 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099777; cv=none; b=G9OABrv/rO5aQ4XZx8SzSLyXf3K/q1xHY+0cutHMNRPWrryeww+JYxC3oTV3D+tsB1/ZUmX6a4HYksks9FvGQ/3PSBcsmUbC61KiLIyR4o/8qnkEnWqayHNG9EPiW5jAcZW+io1FBjp9+F6adMJtP/1wsN59A5QonZSJ3s0mAZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099777; c=relaxed/simple;
	bh=ICA+MXmJG/YyS2++LGqo+5Mnv644o+nXaxmSig4UzTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TATFmBPRHaVcXdBE+iDEImCsa0o7HLjVYr9wpuJBVI0EBdSSF7qI5kCV1FEywP4Dq1+AT6s4FHFXrjVw/7LEvbOU1pxC7UlWpFxylSFdGxo9RnaUnfl5a0w8el7TArWjYcl30og0RC9DoV6zxcKNVKLzfakihTxC9Pb95EWxSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWPdJOFB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWPdJOFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9D91F000C4;
	Thu, 15 Oct 2026 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792099775;
	bh=oZNz2PfouwXdYAbOjv+HkNwiXAOKSt0CCIlurqOt4Bg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JWPdJOFBGew6X8AYdyb0N/1jIhD4Mrr2nX8tHoIeEQ40mMCjRS/yRm8r80ugxqPIy
	 Q0/YMzhtC/hxwYzJVby5jmiWG6taS9AGtSZriiPtLy/wUldnEsReuCuyBV8AQA7Qzq
	 QRam7Lb5E618N603YFMVknn8oxvqEchxTwZe30smYvnDBahO4aSudEKXLyu5eJOw8U
	 S7hTKNIh6109DInpqB1X4kKuxLzkeoN1eQdobcfGEtBsJtqvtwbQ4CCrF4XcWaEGyY
	 5Z2jH4GYZ9SeBYpXh/vt5sDK0x+tp65VKX7pITaauUq9tkyMixPyATNNoSXMoC1FYV
	 DX3lfvFe0U3YA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <179203261324.2681924.5002100194676410503.rt5645-button-timer@gmail.com>
References: <179203261324.2681924.5002100194676410503.rt5645-button-timer@gmail.com>
Subject: Re: [PATCH] ASoC: rt5645: Shut down the button timer on removal
Message-Id: <179207629518.134795.889696462508486661.b4-ty@b4>
Date: Thu, 15 Oct 2026 15:58:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ICA+MXmJG/YyS2++LGqo+5Mnv644o+nXaxmSig4UzTs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIuuu755PSOkWPnXMsjVSWNTc2vc9ZlLH74heFIxNzqd
 VGvg7aZdZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiE+8x/NNfdLmXL9195sLp
 rJ8LeE5sd3NgDmMK3PN663b+gtRTOz0Z/spd+REz0VOcPb5fXN05oP9WDMuM+x2lwVxdHwqmTYt
 jZAYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 22:51:10 -0400, Myeonghun Pak wrote:
> ASoC: rt5645: Shut down the button timer on removal

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt5645: Shut down the button timer on removal
      https://git.kernel.org/broonie/sound/c/f0ecc305442f

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

