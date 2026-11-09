Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270894;
	b=qAG7sJN2gIxiwzNVwn+zXBTzxvwlORgznacaXlBeqLDgzwmYTq/tmBkbZyD/nMHZ2ckx
	 +6DEB9MS5lEsiA4z1EsfWpZnEpx9jTawwZu9dnTQSArSK623//YbWzH4FRaj0uc3t+Gb1
	 Np+SUfqM+DjNNeDvg690hdTHZegnxZLU8sQx0YQpd8ri5m5p7b/FlMIk9x1R38dBCozNo
	 vw6FclLJ0MX+RYptkYBwzzgbpNf1rLBKHTsx/KwLtYgfc0OLKzKSYY1iIevzhMydS8gDR
	 yiw6vLdBZVOEZ95eIALIWn+xsM5nWgVu9XqfrV+X166KBOfQA2SmCuqh2usCb3awAQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270894;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GhpzuasWndPMLRSqacM6yezR1B8MC6IofbTz7uVXRuU=;
	b=JnEgco2z3PLH4yc0xunHEN89SeCo6FdTUn04d37O8xS8RmQlO/EjIT9phUkM8jxI/7w8
	 aEQ55CfeGL+nZuIH5CQmpBce2tctYW1oW6VWoZGr7GULFqZAhOWIPTcqoxzfVnzbv8nY3
	 AeO7GGUndjlfcr9QwGFpq62Mmfp/JdmUtWV7sHOa8tbRK+9P2abXcrTKa87Uy89DLQ9Wh
	 exe4s04aDN58YvhdqtG5tM6bqsY662csLlNKswEJCBaAtV1njdIhf3zfgCaCsyOb3kXML
	 tKHOqJJfuIu/ItyAI+qyjgIsAlgSWInHTv7zzGlAXQ01x53NrRYVQEAt4b2DkUPEj/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJN9ALe3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C860A2602;
	Tue, 10 Nov 2026 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJN9ALe3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E971F008A3;
	Tue, 10 Nov 2026 00:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794270893;
	bh=GhpzuasWndPMLRSqacM6yezR1B8MC6IofbTz7uVXRuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HJN9ALe3bpd/K/UpJDH0cXalvyZr9mR2YVSdXJ43nhUzaQ6UMRxF4G+bQER2ZPIoH
	 APJSUmRKU2m1331ibMomSvuOccF+cwfqHHjTKVYXDw4zjqNZZFOdPe+6fWhibEVewv
	 j1TC1pTfyPJjIV0n3CNO1myGa6XOCLj2S6NCLwTEshdPHDetBAm+qpe/bhiR/f7UcY
	 YOHU7AGEC5MyanxFJE9Amz12uppVZIbqZ4A5DCs7hSm2sqJQ6VB1oM6qvGPckRH7HV
	 1b5SeEqemg4b8AfXic8iyqu7y5Zcp21LWaRCjVD1GVPTUpV3N8a4iH7AwfdEmDdP1C
	 u1wTSVI8FxSYA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 3942230AC633;
	Tue, 10 Nov 2026 00:34:51 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105-superm1-lms-sound-v2-1-33327881f4fc@amd.com>
References: <20261105-superm1-lms-sound-v2-1-33327881f4fc@amd.com>
Subject: Re: [PATCH v2] ASoC: SOF: amd: Load alternatively signed firmware
 with an "_l" suffix
Message-Id: <179426512962.3711751.2986145227493941683.b4-ty@b4>
Date: Mon, 09 Nov 2026 22:58:49 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IsRHc3f2R8UD2i0XoGlyVlnoMV8QFcb9O7h/gNZ1KXI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+pa0W/Gqzh/mj3Z2+ayY/7R/qzfT8py8fVH9nyfILk
 V8SChYbdZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiz+oZ/od+CL7bGnbp/X5/
 g00LvN6ukXvNtkq88cpRl5MmD4o3ty1g+J94sMr9g891J6/Nr5ZIuT7ecHnxt99573c8v5D1Nnn
 B4UpWAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 05 Nov 2026 09:23:05 -0600, Mario Limonciello wrote:
> ASoC: SOF: amd: Load alternatively signed firmware with an "_l" suffix

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: amd: Load alternatively signed firmware with an "_l" suffix
      https://git.kernel.org/broonie/sound/c/d880c6278839

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

