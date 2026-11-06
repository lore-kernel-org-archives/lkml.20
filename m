Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990366;
	b=x/smpNyP2g68Z3ItiwGdM3n0qmlWM4NqwQfLuqmjDu1YQLCd7bQc1UkH8rjY9EUvirxr
	 j/HGa502TfzFJaz3PXZ+BYgkK7KSYUPjL4FQOD8MLpbH3x7BTD05sXIGdnt8Kl5S7IOpM
	 BTADZYHABRcVNfDkYz/sigSzTZJX16xP65vKRWxe6YIKMwPtViVvJQgMlg21o4wTIk9Jq
	 De2xHgYqplR8RLYNvPrfwqo3iivd4jy0n2DfFXHH79GddlIPBiWwCaAuynlPQdkWD1bua
	 AziH5lHdB7KLhmdt2Gyx3I/Xcl5q3KJicx6CuwJ+vTnukCxqdg+FPUqPAKCRfMRHbeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990366;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JLgjZ0MjFD0gcNhr8kplmVGc16m3SOIboxAq1B73rYA=;
	b=Ou7Gl98Bgk8kTRlOedWddvrh8tFLQHkwjI4mW5GAZd53XEnD5mkqHW1rFHXBuECtj+Hu
	 VY9z4SX/TkMFxJwLRm88aSi/1jcj94ND1A1t7cGL1ZXjFcukrZ5bIcnHNbDrHhYMdcF3/
	 TgkVYUzuNT9fIeeejWiF/ckJLd4e6rTjvcZWEbJVV1Frxtb2CwpNXYkV6t5735t7j8VxX
	 fqalNkMJZ4zdpiDlYu52kxGshn7kNAHO2nj+5fU2p0Qo9LUy2rnnMc1WXQ3fGSSp/t1Am
	 oMAOwZPYe5ZEk9xZ0kr93Zh1EE26Wun8r+KJHYwYGcZ71qyN2pBg3sxtevMJHVHEKng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q25wOIXK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A0606A326;
	Fri,  6 Nov 2026 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q25wOIXK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB191F0089F;
	Fri,  6 Nov 2026 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990365;
	bh=JLgjZ0MjFD0gcNhr8kplmVGc16m3SOIboxAq1B73rYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q25wOIXKmzioC+Da3PBO0rQaylwf8rIoE7/ZlRL73aaVaaBvrOEVwRqKTSmlvuliv
	 6EsBD/080i7BMtIq6HrHDjOhnL+n5gJiQYfBy8a89raj5JLNmTGWPC6xkUn67rORkE
	 MGRxfZZa4ubxu5UMM7kRtLhQFIzHYMyT2zLxjCeOZIDT0hTcGRTfEYOZvsIy7jIV+S
	 JZViFr1JR+ZFulSqEuatjt6+nvFQREa6vrwNoM/cCHo6fzbC/eMEdcGQlQNqNHmwxS
	 EMbwKF0K9uHAn4pSXd3YwH8SEoTvh7MqsZS3TNGNwGdJvV/sB13P0qHiH9lZt60s55
	 NOoG0Yb82FN+g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D35B328D1020;
	Fri, 06 Nov 2026 18:39:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602113136.49494-1-phucduc.bui@gmail.com>
References: <20260602113136.49494-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2] ASoC: sunxi: sun50i-dmic: Reorder clock enable
 sequence
Message-Id: <179397725282.3231166.8283157647826593719.b4-ty@b4>
Date: Fri, 06 Nov 2026 15:00:52 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yQjjetjtLV9VTAhhJNfE6e0bY5qQQ7dcNlDBWzZd1Mg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeyd3e7fHohMTD0pfMum91vrlszJlwo9rpmGim569FN
 +5VbPz3vaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT4Shn+F/xyVDn+dWVudPZ
 k9WeL8uXaPxeeuCK1+2jjefn3Pt8ksOT4Z9x1wLBjbW2T2LzVE3XPjpUXxp3xMQlarr6/Jd/n5v
 qyPECAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 02 Jun 2026 18:31:36 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
      https://git.kernel.org/broonie/sound/c/86778727e320

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

