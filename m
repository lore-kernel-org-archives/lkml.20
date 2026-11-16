Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861968;
	b=RX+gEdkG2798hdDN/x8gINCB+bPh6LPEYU1KmdXpiqDd/X1Xl+Y3+rLIfnbSEUkMahL+
	 4m30CSynXWV9vGdrMPgeja0EIDrZSwvL2M8ELHVQu2yyD4Py0J7886BKXQXa9iYjUqrZ2
	 4P8FiIt9/KXo+KtMzd/Ykrj9AB8HyxLBsoBGD0hPi3c/G6k5+n4LHeWviVHqqGvGavNj4
	 qRClDAhLMpZYkYFDjbJP7gFLu1Y6YcNwsp1wTYx+34X2TIQBwUwXlNNFZryAp++2t/wE0
	 KAirYW242k1ncNfxM5qNuj/+wOcPWpmb8eet5lPDFW6f36P17Gc7u4KEtoKWStbo0RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861968;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KYZtzZ/8T16mNenVO5AdmDu4ONsC0FXcrecZ47+qcNw=;
	b=fitsVQpgBwg1+bN6mStjGRlHIQR+TLZqpS4dfR4c7eeu4g0HWcxgidifZ2Dd6DwGxZhY
	 yAltGM8R9a0VngZE8Kv/bGSair1zTvQiQtWhVtveBpE7KtbitN758mS+vG/5aigINHzMH
	 nRPorMuoqQ/r4LXwZVJwt5akbXG33BfaoOnL8BgB0LUnDQEs4VMhw7uqxqHWJsuzsHLHl
	 Ii7198Vj7ZgWQRMvTu5W9ZEFSSCzOMIuvv72HOMOi0Sapg1FNxLm+pTBmOhzkvmWD/pEY
	 poyGNUvQqRzu0Ys+i313boHH6v1L5o+jnEi0Jlv0onGeUXxQWIiMjl9A7BE6AD6UlkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQlbUWYg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5444606A885;
	Mon, 16 Nov 2026 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQlbUWYg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742F81F000C4;
	Mon, 16 Nov 2026 20:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794861968;
	bh=KYZtzZ/8T16mNenVO5AdmDu4ONsC0FXcrecZ47+qcNw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eQlbUWYgeooD7bTd8K92QzYoovy0miEuDp50W4JkQX7WNNX1mq3WgeILZi7VERtL9
	 Azisw2ToQvPmjA6ds6nm0Vgu7OqVjSHIqCmb12bMybCDv18dru6FdCgZN9VeIGsflj
	 EKMYYWtmKiZG6ywBs2+INw3JMQN+odkBBjNQc3m1vTETA3Gc2+Ee1PltRVtJ16Ajlh
	 l+qk4KoyWddZxE6RU3IRj2ML74k9emR3+gp4jaT/1t85tWfAVLSvtJ0V3tU3XwhN5U
	 wjylYE2GzcLYFRRLvIYwe+dcArf/xUQam43D528uwRxdO6ThfwL5X1nRqR6Pq5K/4U
	 qmUNy5Ade1WbA==
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <D6339FDC262A33B1+20261116063032.3348732-1-tuhaowen@uniontech.com>
References: <D6339FDC262A33B1+20261116063032.3348732-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: pcm3168a: Disable runtime PM on component
 registration failure
Message-Id: <179484007307.186909.1024185034665315374.b4-ty@b4>
Date: Mon, 16 Nov 2026 14:41:13 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/w+UZ5+sDejafZE/JlBYCTn7z4kcFxjMXSnYXIpTW48=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+Z/coZ9zl59VUsA4Uucoa/vjDx18L+zp9L6SZRsgW/
 o07mdPfUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIl08zH8d5glx+EzbcfW9M+b
 8jcWn7fNOVMm/2VXS966d3d4Y3JbshkZlj76v3Xhw7+3k94WR019HL+pOzsw1vD/wgVL/h+q2p6
 ynQEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 14:30:32 +0800, Haowen Tu wrote:
> ASoC: pcm3168a: Disable runtime PM on component registration failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: pcm3168a: Disable runtime PM on component registration failure
      https://git.kernel.org/broonie/sound/c/9b963e4a921b

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

