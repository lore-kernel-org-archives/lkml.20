Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627483;
	b=Qr+5WmCZYw5k9ivoLcC3m9517PpIRh2jgZR7R5RqSm2Sg4c2QGa9AJU4dP0hPEe3oOfc
	 pLpqXRXYwoch/vYQ8hRSghh4YFBXOEsXI7q9/DmgfpKQ/L/fGZ9IYrEsljXEwyVmaflNH
	 V7ay+dJrgBgrddasTcQqfpR6HUvC2c9mjjjRVXh19jsSPV9cSn21mPsRO03IPj0AQI02a
	 uUVxs5cprQPNs04l1BfwU8paMkzyEo5096ZIbcDZd3YRtNQ+xpokrO4Y5GN4JLH4dpkpD
	 /vXNlvtNlC23Acfa7o91cgsrEurPVp58Fcry9S86Z8hV+qBB+PM5vqp1TmviDo+XVfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627483;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Nz3Lt3cMWewh5i72SDzg/4dkkmv0TxEXnsP0DBPQjJg=;
	b=iNg2Mz4WO3xzfTzfZu7/sQ50/xdr5sYO9HSEKD/z10U1chN4natg/Bp1lB4ZG0DECjL0
	 41cqzHWHSG0R2DPQgeIN4gRQ+eKKLLhjIaQYq2nRSPm9WGEWYMRaGoIkGEXA6/uVJVVW4
	 VfB9uGI8P5X4WAI6dEMyhULvKpDZ36BRwQGtgwbtTXM/RWXu1EN93gFchIFsfTH7fsbtF
	 olM1PmV//jet8BdSBWzxFeX5nItauJUliOafaTeL8VelV+HAq63lsjmG/eL28CFv2sM+X
	 kMYROw4On0u5n0sy0P9j4PgByB8zWmykLGFYuxRbDZcfXZPvpRCu1cUNlc9aMSITvOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBVhYpYG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F3060A2616;
	Mon,  2 Nov 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBVhYpYG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805CD1F00A21;
	Mon,  2 Nov 2026 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627482;
	bh=Nz3Lt3cMWewh5i72SDzg/4dkkmv0TxEXnsP0DBPQjJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MBVhYpYGuWAigX2hvezKTp3wh1nremTca7Oh/AgfNzv1HlJlyt/qEMkhFdKMU6R/j
	 GyjC4MeMeyW7l7Szm/k44+rH8mLgKupBRkw/KPq91RS2ZEBTrfwjbAAsIwIZCV9v+k
	 TV7L9qytf9GGFHtsSj3RRHhX1bBC6G7qBOrwSDdLKh0vIx21ag6w85leNanMNwc1CF
	 zyeag/ZDfP4NomauQISgc1NZZZtBb/7onY8tifskqdNvF47kQ+7eSpRY5hpny65OTv
	 pf+ISmnisbhZZdP1M6XbszkEv0kqTsxI/c0HC1CSWGvKuqfxoshcctYKb/YGucF5rG
	 0uDLzU/if7nhQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C13DC2344CB8;
	Mon, 02 Nov 2026 13:51:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Stephan Gerhold <stephan@gerhold.net>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Wentao Liang <vulab@iscas.ac.cn>, HyeongJun An <sammiee5311@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023090157.518032-1-phucduc.bui@gmail.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: codecs: Fix hw_params return values
Message-Id: <179357894578.1716893.15632830053231500019.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:22:25 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682; i=broonie@kernel.org;
 h=from:subject:message-id; bh=La5I+/wfOQV32DXC+LkuJlW5b/uNREDjWJspDW7VL5M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTI1IZLq4TL4wL6Yttqf+f2vS858r73i6GG9ffLTv/
 flNXSGXOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRkpOMDJPZo26Ys2Zf8RKp
 cFoxdf/Jj9cOngxN47b7dzmG+avy8sWMDBcXS6l35bYFSRSq6P65L1nQcSqi9v6ClN9/pKZfu9m
 uzQsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 23 Oct 2026 16:01:53 +0700, phucduc.bui@gmail.com wrote:
> ASoC: codecs: Fix hw_params return values
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> These patches ensure that the codec drivers return 0 on successful
> .hw_params() callbacks and propagate negative errors.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: codec: cs4341: Handle hw_params return value
      https://git.kernel.org/broonie/sound/c/b622ec286008
[2/4] ASoC: codecs: si476x: Handle hw_params return value
      https://git.kernel.org/broonie/sound/c/7b2c273dbadf
[3/4] ASoC: codecs: tfa989x: Handle hw_params return value
      https://git.kernel.org/broonie/sound/c/eddb6aa0c3b8
[4/4] ASoC: codecs: wm8994: Handle hw_params return value
      https://git.kernel.org/broonie/sound/c/d310df0fb2ab

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

