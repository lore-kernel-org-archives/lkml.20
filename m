Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253429;
	b=Lzdwr0UHPHroE2uuEAqF7giCPqbSELMeiR/yyeIiX5JObU4NW6/uzvZWfeePhauLowLH
	 oGwH4SQJb8XqQIyP8EVJAE2hYZj4SLgReolsDe63iqqel5GONRp1F2MAEm9+fNcrRCIEw
	 /III/Qgm9kgJiCazPZ5EPDenOGQm8ckBpHmHGMsz4MbPoISn83Nc9wua314XqXPT0LLs6
	 KAtSqXim/mWJ/Ggl/T4Ky/p3azE5kj4JN3FCXjO4kBpnaMML4SeIhBUTQP/Bwo2OASXfz
	 LwiR2YfWweAXDXA69AxfmAS+//TjdTmxz/4QoV5HJysQb8pwHlVJp3frPhgAg56NXRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253429;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GiiCdlrkEsadT5b1EEALLJgkBNkzhktjT2LeWox5L6w=;
	b=NJXBq1x1Q+gGWBjm00Us5yEHzsoPfXV5S+1b1RMu9SakORRBZQn7d/wvXT1q/oQ8+VF1
	 4OAOXIe4w7zg8chYffQ7BJrkXz4OsQ+Z9plpH8neUEGn+/B2LVTOkTTK5s9V3thEZ2YCY
	 elpInxbT1m7LyyzhkZ0idec14tkiJSzAThy1goPaCVi5+OF3CBf1J9p0N04wpjj7WOj6Y
	 IkFd65Fd4cb7TZ9QMgDq5jRe97SaLqe6tP6aCbw8dI8yuEkfMhG1HeQ+xv3BRmlY83eou
	 +LPo0THCo4U/yjMX9X5Go5ZnT+mDiCodosL2PbUEvSl6l8Kf9rvliajg1IcfJBqWtZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HswYtFnl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED8606A321;
	Mon,  9 Nov 2026 19:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HswYtFnl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385BD1F008A1;
	Mon,  9 Nov 2026 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794253428;
	bh=GiiCdlrkEsadT5b1EEALLJgkBNkzhktjT2LeWox5L6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HswYtFnlC2cFgEP+oUi2EdGObVoL1SjVfNscGxA1TgECdEGVUcOw9nV/YZTbMqyoI
	 Yzt8b38ijHkNVCrFB+P0jQOQzM4AaARYcE5j/0krnLdDNiiaTQ6xbYZp0K2hc3o8b0
	 j3wnDf8OrrP+1vONQfdNT7WUvTDDImqQOpUq8LQQAkYIUssOY8GbvD2EN3QjPcn4c7
	 eiL8qoFqdX0ra2UrsyF2Sr8KKOANX9EBQfOTsWGPTWj9S5mCsE49vAQizCYLuE208B
	 sbeLW2AqWWnb61GKC4Wp9+01X0ReACjD8xZzPrz/9imYV1NaxFOCFyN/sZ4iG1ogeZ
	 c2wqzSOLPDW3w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 453602FC6BDA;
	Mon, 09 Nov 2026 19:43:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
References: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] ASoC: fix the x1e80100 card after an ADSP restart
Message-Id: <179422760307.3711751.5465611340806386159.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:33:23 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1VINJaUZ4ngpMAC5A6UaEXNuVO47g2rYK3BqBR5Y9mM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+KblcDbap2bDvcf7vbRuFG9/U2dy6eWj3p7shQg2ad
 hMNLk/J7ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBNVmD4X7NN/sr1Uw1PbJO3
 PPb4/3e1/nlhzZ32ERc2M/3S/BzCmMnI8CnF41v7vc5tIXLaYjmyf10mXT5iWnzYzXLV6aMdu+4
 95QIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Nov 2026 00:43:31 -0500, Tyler Baker wrote:
> ASoC: fix the x1e80100 card after an ADSP restart
> 
> On Qualcomm boards an ADSP restart unbinds and rebinds the LPASS pin
> controller, the SoundWire controllers and the codecs, and the card binds
> again once they are back. On the Hamoa IoT EVK two things break on that
> path: the DAI link names point at the SoundWire controllers' freed
> strings, and the headset jack is never recreated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: soc-core: copy the DAI link names into the card
      https://git.kernel.org/broonie/sound/c/33a130f6ed8c
[2/2] ASoC: qcom: x1e80100: recreate the headset jack on card rebind
      https://git.kernel.org/broonie/sound/c/704251f9dad3

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

