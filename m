Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E5F420898;
	Fri,  2 Oct 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945928; cv=none; b=St1Oay8wvXDWyjryLc/131/YFdHXxBoDLnDHjHRIfNerWZhnHbDtNmjjgyGWMXDG+6TgXQ/QEm1YgUIY9R40fFejaCvb+z2gDYW/zYO2RdNtZa2p4ET5c2rUchjiuJ5WDOYw3vylvnbtxIGDuHAz0a1wbI1Ayk/3iuvxmn6zKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945928; c=relaxed/simple;
	bh=Y+Rtrc8J0oal32o4l3ds2RR1jg/GPbcWfm/RLqegbPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tzDbhGtNS4lMEhh+HFVNkFJejG5NKbcFJ44CFUNNqXWvmJCWyAhrb9N1IiOg4ix+RhA1URn4d7zCWyC0E/hi/XrAPUNSCiLKf+3nbvKvXFv7WhYXfppFr5zCKcywYU20wyyH83HQ6XEjiHml8ezVqJrRPFkrtCHHkkbdxoL6plU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FO87h/0c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FO87h/0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84E21F000FF;
	Fri,  2 Oct 2026 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945927;
	bh=hJwNWlOWtKBMogwZLPlA8tvbDgg0gOFsJLczUeA/flA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FO87h/0cWgITgLMQIVug6Shpq1ABoVFzq2W4Wizg2s1frJ5npX+PxzfUVsPcuIgL0
	 /TapvhOmvA41bx1FO/nSDWpM1Vsqj5aIMQiS+N8Iafxxtt2yLivWf7fILDGLQuvNaT
	 krWIOjtr2jz4BIga4jmiY7wECzieUg8VMV5RJp0ZWjYLLd6guyCBjTqnO+xUZHFt/W
	 81hgVV4qct1uozmbk2VETx+QNZPeUjklsvaI1T40Up3a784e7vNLsRy+NAIHeIYZp4
	 kkg+uQ6cCmlSaIlYUcj4BSasOEqTRCBVGVMg/pXH7btkY08mLnr0ako47zSFx93x5o
	 KMC+y2eALZ1Mw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Yuri Zaporozhets <yuriz@vodafonemail.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xingyu.wu@starfivetech.com
In-Reply-To: <20261001192552.2904-1-yuriz@vodafonemail.de>
References: <20261001192552.2904-1-yuriz@vodafonemail.de>
Subject: Re: [PATCH] ASoC: dwc: Use OF match data again for StarFive JH7110
Message-Id: <179093939752.83544.13483549514980783237.b4-ty@b4>
Date: Fri, 02 Oct 2026 12:09:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Y+Rtrc8J0oal32o4l3ds2RR1jg/GPbcWfm/RLqegbPg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqv6qDlUnW1J32Dab+rOKrc2F2kOz2Am3Ee82wi
 IGzseHOH4iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar+qgwAKCRAk1otyXVSH
 0MqOB/9B/lknKOmSv1w0r+f5lsdXrpWxMeGUu3OpVZUNMvRlx9eN7q/bsdIZmKguLlHyZVrMqTf
 B39djbsjSlIRtv3gfk54Gd8BjwrlKhkvnN4OrPb97s0MUZJhATSZsTYZhSDlhX7585o4sq2RAjn
 npYozUJNEkPGHCD7aWAWJh7YoCmaSrjYR64sFUaCaZ4h2zmqgb6uaE3NlU5XacLfityVEAjP4MJ
 pH4XjPEmsw3vaO2kBEazKDh8K0Y1SwWlI70y2/BudYP8Aky4KKH6T51A1v/PadvsTcXjqDG8G1Y
 WxsPAhgsEEsLitbEngi7vagd8xvCZNNuWKg7LhhEzhXiZoV1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 01 Oct 2026 21:25:52 +0200, Yuri Zaporozhets wrote:
> ASoC: dwc: Use OF match data again for StarFive JH7110

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dwc: Use OF match data again for StarFive JH7110
      https://git.kernel.org/broonie/sound/c/d532e2f5c288

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

