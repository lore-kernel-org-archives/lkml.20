Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810177;
	b=BpSS4JtxT089ex5RSXw1B8EVvdDZM3aIFhJr0YDRUg21Coyg4lsm54fi5nqDdrkvo6qh
	 2I1fFsgakQpw0svQG/75FDf2mGaHQqyjg/dqHYdvibTHS8nNaydB8GmyhhwuD+IQXPvik
	 dqv4BNXHhGuxGfov08a3/6DbCdVKEAJerB5HxQO0UEutm8Ftp24TNuN9Faw+6UwnjTUMh
	 gPHoymW4FcGY9HzxpJpb8HVq2qxuzf8/wBDaEJj2i3tW7HZ/G4z6VIgsD4nXKfDPL8qqX
	 G81mTZ3SMpDQGM6wIxVNXNBwYhMdSMwGA7/cvfVsLRZh17EHdWYWTEgte0xisHtiwiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810177;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cDbBGbbkWjMCN3YoXpVfQqChD+m0tIhfsBNrMkEf1Ck=;
	b=XGrkTuugxMzGOex2r1LEbqrrootAaPRWTHUMUnn6vgigtDNJ5hBTPTIpveGrKV6Z8DfH
	 IOas66XY84gomr/J5OOGNN1FbwZYYnYgt1vF9geonuLY+6S1Zp9ydoY4HblFvkSWsEfy8
	 kRaekAT7VA/v8smUFbwxh+IJF0KZp3YLyp2aButGiuWo8umq9BDBO6si91kroOQMUEuIx
	 Utxa3DyPaRemnqk1p0KCEoYdSfe3bRBnE0B6XCkXhgAX46TsRPbPvquFO0NRdc88g9+su
	 CDKPD0ON6It8M/20Kv4zGE+AAssS2+8GJGJ4S3ZIMiEVg91Mr8xAiUnZv+Zc8i7E5dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hu3PpFEq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24894606D802;
	Wed,  4 Nov 2026 16:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hu3PpFEq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967F41F00A02;
	Wed,  4 Nov 2026 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810176;
	bh=cDbBGbbkWjMCN3YoXpVfQqChD+m0tIhfsBNrMkEf1Ck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Hu3PpFEqr5f779u7yB2Z2s79tJ3zFLorX9Y4hhr+SkKLNq2sKtf1PSghB0x/z8gZJ
	 /WJz4jwnkGENzOnAdLCYLhFftYtiiomx8t8DqHDuwe6uRgNkqc9DOwjcSNFbOX2+D/
	 IQazj6sG9NMRHo105Z0V/HGDB21RF9HwA7HXjESdOsOb3RQjOaKZP9IHrR6ireXCFT
	 F/d70+DjAQgv1/EzGlZRpYA548lQWy1AgEaQ6tXm7HCYUoJ9dOjhcuUo7yRZnH06Ox
	 OuaFnh0SWN0gBSA/5GCeQ5RS1DdOPY8nGAeblKHaF85vCCZ6dDaq0MmtlxLoNtJgZ0
	 6CDZO40IAms6A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 5E8AC260FD69;
	Wed, 04 Nov 2026 16:36:14 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Yige Jiang <yigejiang86@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <rc-review-20261103-07-1337c123a4ea@gmail.com>
References: <rc-review-20261103-07-1337c123a4ea@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: pcm030: release the platform node reference
Message-Id: <179379246392.2456854.10933132535673763460.b4-ty@b4>
Date: Wed, 04 Nov 2026 11:41:03 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UkkLwJ+LYkDLbS5A4697Il7nAUQhqXO6ao/iZgou5vM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJex/27fUIrlN1hdf6VDfVtNZxLbxXIGUsp/Xrp+v79g
 9KLN15ZdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiZ38w/BVKbNjzn78iOlOO
 94p2Z8q93azt0cIi2lcF6y7ZZZd3+DP8010ZzsbJvzlEP3sLW8cp33mlJ7+/jIyST9MxP7FgX48
 HDwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 01:43:33 +0800, Yige Jiang wrote:
> ASoC: fsl: pcm030: release the platform node reference

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl: pcm030: release the platform node reference
      https://git.kernel.org/broonie/sound/c/c526eaad1ada

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

