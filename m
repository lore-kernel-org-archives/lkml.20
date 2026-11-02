Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627486;
	b=c4D81SbUq3nzsy0A5jMpTbMvWBa+0I1vZJuwEbQ+jVbG+rUpzxBVMz2KSsIeuxyd5tMs
	 aR/UlcxujsOm8C4iVZufNXgY2+h0ACRbbEPn4jBdKYGmp2yRbLFibheKVzW/5we+dbEzn
	 S8kVPpbOH1EKsOAKwiIrk74BRb43vhFDtect2zi46NkB3HQC2Ue+baxQSUL/hY172QyXc
	 qpBNv9kacNc665aypyP339F0pZ2tJvIC6HNWr4aYy0XScIyQJPwOANGshoWuM3s6crDtX
	 CNw60a2TGB+plOEfHQgvhOGXQiSnuf56cf7iszJEKp+9MkBFPV2QUcFzgnvoMxWxWXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627486;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=csc3uWj0Keh3Pcfku6Ck/67dh0Q1joL6qQFkdr/R/gI=;
	b=h70W43pDmRLbBYYSXNLLmlR+wl6xUSM0BpQBb39tKUMgeiK46IBaPOstiLMbQMfhO3Y5
	 TTCf+FD4g1UPEhW2MmxxkO4+MGlzRfgj7LwoyDS9/4FucDCT/p73fJhQiiVArjRnximdn
	 0OWSfhxhxH40d6+EYZTfnBiO1c5+1p7Py431vujg//5cqF3QqHPWKmeCH8uyrgG8qFpXa
	 HwoNrQwlBmyuJOAyATW3YP7pDvHHpuBSQUkjvoYTPRp+x9pteVUzC7yAQRecnGNHLK7w8
	 TjcGLK565nUEmwC4bUceIOLRMuYlBS3A+MPFMCKvF6xwrIdUvzjHcnCHLfnktw4ZvNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uhct3If9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9460A263A;
	Mon,  2 Nov 2026 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uhct3If9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CCD1F00A22;
	Mon,  2 Nov 2026 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627485;
	bh=csc3uWj0Keh3Pcfku6Ck/67dh0Q1joL6qQFkdr/R/gI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Uhct3If9A1MUiCmJYqYwtvGnJKimsRID5v7udYqTL2iqfbePo2iK7trSWsa8CqkdE
	 v8k50apJESxhKFaSNAnAcSTyLrsjgYyj104dIis2avzafxOt2a+RodBFzB49nEm8Td
	 uetfUHhgnDvou5BDgr4gDxMqiUMioCNU1SmywpEYREuqUSJqkjl+9yKWEI9C45jpw+
	 EzNDJlS41XOBwCITxz7eRKN06SpYa9U1PuByys6YCpeKF91HRthp/tgh47iGL7cJx+
	 V1aSks58+u7PjowC+yQC/WZYe5fb/yLmQvwxM4W6Iwd/bZAy4BuqF1w/fi/ytrDnIE
	 tB8t7fv1K2dpA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8BFAC2344CE8;
	Mon, 02 Nov 2026 13:51:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: kirkwood: Improve clock and error handling
Message-Id: <179357946794.1716893.14766270340356142891.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:31:07 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nxWnBd92h1N7ODyUIHEYhfQi23qn4aesHrkTl4OuRyQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTI2+2Z343vSs2y8FmfMquTNONizTWztP55qTWDrz3
 Tm67+x7OkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRw78YGY5c+aqcNHltk2SP
 xGXuPTYGLkfzH0pbPr30SZyvMkWWR52R4d7y0oQLG4/ei3j+b9OJkGmdn/75T2dk7t8mkVu4ROh
 xGiMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 17:58:30 +0700, phucduc.bui@gmail.com wrote:
> ASoC: kirkwood: Improve clock and error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves error handling and clock management in the
> Kirkwood I2S driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/5] ASoC: kirkwood: kirkwood-i2s: Fix error handling for resource mapping
      https://git.kernel.org/broonie/sound/c/0d376515e842
[2/5] ASoC: kirkwood: kirkwood-i2s: Improve error handling in probe
      https://git.kernel.org/broonie/sound/c/cbe600cecb44
[3/5] ASoC: kirkwood: kirkwood-i2s: Check return value of clk_prepare_enable()
      https://git.kernel.org/broonie/sound/c/1de736925a68
[4/5] ASoC: kirkwood: kirkwood-i2s: Disable extclk on internal clk error
      https://git.kernel.org/broonie/sound/c/9765fd9e107d
[5/5] ASoC: kirkwood: kirkwood-i2s: Disable clocks in reverse order in remove()
      https://git.kernel.org/broonie/sound/c/9a5990047d40

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

