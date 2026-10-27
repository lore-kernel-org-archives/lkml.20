Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186893;
	b=xFunJSQ7a8vaCM9LTaYpXVPPQa9HPdG89wH2EfV5aDkZbieYwuid5Ksoc+BjOyCpjDYp
	 a1BkqMpc33gFXw0KLgCg4/d1Adux7MI58aWZL1wjcvZoWvTi+Qe8TzlQZMArFqMQmJnGm
	 iilOr9PFIFUKUI1469DcEFqEuhsdA//x9LNvgvCxjQFIh+56Rpsgj6tPND4aESkszpnUR
	 EdlXW/zw4mSNkuqV3HkeCzW1AXHSV4CaHiZg9dwewCAPrklVEuY5Qs+kqR256jwbiMDfh
	 wQRQ3hHRrAUeWaSnmNtnxu8Ay3RHFyikAgGMCLUfdziKhVl2QgulhD90x3uWpUPzA4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186893;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DwZ3RVMiQTAuP+GZ8Hc0hnOIdJwPtlJFIaiRjOM9wYE=;
	b=sW7OJH9wYhwL7ZfHtzVCzUOgbFt5/gnP2MOoMj6nFYqysanUvJgdfvGoGVtICzPaSnmi
	 iRpqeioU3v/uY8mInCDYk7tE+zkRDjIpP7ZgKnJD9n3BenUPQoxHiO51UDY5F73MqVRg6
	 L9int3HqYWxPBYHv316b9XOqyfA58R+fwh19hA8PZ+qZg+VAL23POd1/jLwtEtMwznSb5
	 GzKQk/7L3CzkphXOfZndb6I0fqqyvE7H8Fv+PWV/LmkO2WI6LcvuHopXOxpaQjE9n5rRz
	 7hc6hsy3jFye9Xh4leV8IcVC65f6O4qhvryA99DSzIDaZ96GLTLLOPrCwGT2t1sFazw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOmBGoBt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FF606A31A;
	Wed, 28 Oct 2026 11:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOmBGoBt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3081F031E1;
	Wed, 28 Oct 2026 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186893;
	bh=DwZ3RVMiQTAuP+GZ8Hc0hnOIdJwPtlJFIaiRjOM9wYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gOmBGoBt893TaQzCu8MV5OPli7hFcrYAjOw+80Naqs/mSitJDCDKGIBwNum6R/rXf
	 IjhYEupgcXAJBR7s17W7xZKhKPZypp7nZAc1osVtxxtIGDSyjKvOx3GJ7EzZkOWcUV
	 +q93Wx3hUVPDhxIscukdYL8yG4uQp1VRE8iBQKa6hstMXqm2pE26sOvYlpKL2oWgNY
	 VmbomhwNXXhnM3v0Lk2JT6B5cmJvPS9qYsc1bypTMqbiDvKi2Q7YsHb4HverIcW1yI
	 3CsK1S3kqiaO/+LC8F2EH7PbHgx98QbetGqhdP6GxvSV4KrtitWKCvTstqZ75oaO+X
	 qMRYOiCWxfi4w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2E0F31FF23F9;
	Wed, 28 Oct 2026 11:28:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Filippo Falezza <effeffe99@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
References: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: sm8250: Limit RX digital gain to 0 dB
Message-Id: <179310138476.199157.12004558971024027004.b4-ty@b4>
Date: Tue, 27 Oct 2026 11:43:04 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dTlSEsmiJQPp2W18QXY40obJ0H6L3X/HPCQDrxajihs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIe3vG+sOp/kuERvsv89VFG+wX//tdWuLWFSXV/9EP5v
 o8fzD6v6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE0h4y/FN3PXFtxcvb094b
 BSc82si8oEDxneDVBUoBy57t1dx1Y81nhv91LEw2N8qsRLZrue9r27SBee2OB42Ftrbze/9/72G
 3M2ECAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 27 Oct 2026 01:33:56 +0000, Filippo Falezza wrote:
> ASoC: qcom: sm8250: Limit RX digital gain to 0 dB

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: qcom: sm8250: Limit RX digital gain to 0 dB
      https://git.kernel.org/broonie/sound/c/55df18877471

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

