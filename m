Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594133;
	b=I/Yh+KCv9V4PATCnX/xSvzLNXroWcJOD/dV3mvKSQTZi2Y8jGWS57f1I+E55oPrOw7YL
	 kQS8VNzdtQETjmOrng4TYZd5bV1PDOZepYxQUZxeU/zLRTEHvgSDviHHQo7Cnr06Cm95h
	 eDTpw1uYlthuUlkQHail2YGUsmcwg9z8td/z437yg+FID/5ngezpgDlJ4Ox+VvWQjrQev
	 rz12WfFrXRfn9WvO3w9Z+rwhRLkKd40tyJ1MjirxHI1HbMsIVXHDfjvrY+uN7mCITCkmE
	 WLZW2gSaOc6/G7KwCresSZdJIGoE2pGP9jDZZyVG1rjgU8wR/Na5gnAy1PSbyMyP7Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594133;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lKeO5wBKz9Oqr83sxAb6n9SuxRRMqKVsRKb7CdgJ7nQ=;
	b=Hlb0oF79bHGoskjM4Rq8/jtnBcBeZqk8wAouUv5cAYsLfsYZzNqoJZ3bQWeaNAJ+0HCj
	 punLtllCvSr5b3ML3PdAmwcyhBNv9qyKzmgf+bAasT8H/JPrsmFmFMbUAKd9S/5wxPPo2
	 L6N2sE/76J9Frm1GFZ8aiiUPuaAHsLC2NL/RI9vQn8kOPUGicQPbjn+mFMu78crV3SGAM
	 s68JQphhe/v0k2xaAi16bLFXYfuQyhXpsOXUpp0r/BBfpzL8Ti9SywZof9f34TyFdPcSQ
	 oP3ksbU6Y1OK8/JD71/B1brcdwKziNliJ9/ciYY6oa5XJG2CWIJfk/VJQOQ+GJvkYzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zk74AJ+O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D68606A31A;
	Wed, 21 Oct 2026 14:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zk74AJ+O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EC61F000C2;
	Wed, 21 Oct 2026 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594132;
	bh=lKeO5wBKz9Oqr83sxAb6n9SuxRRMqKVsRKb7CdgJ7nQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zk74AJ+OjHl+Bnq44/bkIbu3qA/cwCxE33A6xXN/wRxYb78g9HhojEE6GilklPcFD
	 cGeQOXfL2Eab6vAXndXgheKno2TYtUen+ByBfSeT/R/Ufcdlsvy8e7+bLJdb6i1dXI
	 0M/lyCIjxUvgHKsZ5Yw6LCUgFMkoVls2cH3wHmSTJU+w6iHU2XxwJZiKXFPOOXVoy0
	 +4Uj3nc4iSIQzmCrqxUCU3RV+MVE/EQUBOyn7LDIjU87KANJ6CpeFxTrThkh1V5LBU
	 Y710+MaDq0jvjFwayB04ITq4pzDeBOkpkQgZISaRfFvHR5TMYfvZd1dI8mbEzxYP4R
	 CYCXqyp5dsIZg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 HyeongJun An <sammiee5311@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 patches@opensource.cirrus.com, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261019124022.3410793-1-sammiee5311@gmail.com>
References: <20261019124022.3410793-1-sammiee5311@gmail.com>
Subject: Re: [PATCH] ASoC: cs42l56: Remove the ADC Mute Switch control
Message-Id: <179250415475.3599968.9193295333989268090.b4-ty@b4>
Date: Tue, 20 Oct 2026 14:49:14 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2KSZBc3KmolXt+s/7SUZo1qWS4hPHfNLl2xxh//miig=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJuXDhr3Jj3SYHr9u7Piw4eFBPm3rH6gHBo6mPhfCF/t
 4x89oveHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIQiNGhouhBaHtSx+Z8iUv
 blXZEafzc47B+vzbktMmfL1+Nn6VjC4jw/xNP9S/LeGZfKDrsYzmKqYzX1Y63+C/Np3P+fN15vw
 Fd/kB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 19 Oct 2026 21:40:22 +0900, HyeongJun An wrote:
> ASoC: cs42l56: Remove the ADC Mute Switch control

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: cs42l56: Remove the ADC Mute Switch control
      https://git.kernel.org/broonie/sound/c/ff404ef11b97

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

