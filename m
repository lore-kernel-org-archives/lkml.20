Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990323;
	b=ZVg1TLGs/bsKwf/xrAhKoMd+osn8FDmSXAN9qg3VAjPUNrXIzK6gI+nVfTwKaEdA4L6T
	 miflSLNh1RLjgd8gKAsabDZrvOiWwOXq7JMBWNXtKgCxWCxPBx4J+R5jA63r4/mXKrsiG
	 yEmYHxJ3RDeX7l4IeReTfR+mvQN3cy0q2w2yCyjrusR4WDipm7AhxLCd8ZJcJFf4b3hRq
	 wzBw+JbR80uU62o9Mo2aDGZbZgSnVaS4Hav+URv9FAXEGnYCPIjXz2EQjBGsdTvPqVXWD
	 YUoIH4ySeEu71oAa95UiIicJLhKXuxMsZj/bWRn8E+URGmQdp105mdZru0L/wSEVQWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990323;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=PEbBglwPbp7iB8AYv9XhScSF58mni9l1HkntNrXvKBU=;
	b=4VwTj3sOfBuVAgao4ubJADPReFOkyvZ7IvRbNQuD8KDb89lC7f8CLGI8t8h/3TFoV9RU
	 xvELB2NB+mRHcb7rB2L4iha8aBN/TAgR9Q5bgCbPk2ExC8/aJzmdqM/rdOUnqkS0dEkPN
	 eQfzaKQzsTgeJ46a0+dNC9zW1shfU8fAr/aeyWsLcp7x321GaQXNf0fjs95Xopfvd2uA8
	 Xuu/H6BpEaHi3oFX2AC4qTGgQeL3C/k5WiqUk7C7bYIlLnV6AF1Npia8f5esE98nCtbPd
	 ZpVm/KwxlwUfO6eUJtkVchnJJcqhQJXkSk+QsDi6a1JqhkFbTL5VfA5ejZ/jcuEBN+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UJ6L0/8p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36443606A326;
	Fri,  6 Nov 2026 18:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UJ6L0/8p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96C51F0089F;
	Fri,  6 Nov 2026 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990322;
	bh=PEbBglwPbp7iB8AYv9XhScSF58mni9l1HkntNrXvKBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UJ6L0/8pZambe5oxxGXiqQMDC8jemHQ5gf38P1F8RUCb1KdMwl/A7eH0pmwPdxZ7l
	 fE+m6/qtPt3YB8Xi+Duf3lknWJjyBsqRzNpuEdWbXO8ygadIiB0J9rm2tbfIPz3Ts3
	 UNXD52mI5GcTtHnW4/PUEIcA9q/mL8xR1oCpd2xpD0+hPanpmNvbBRNtL704WGzx0U
	 1xmYO9e892Da5ooekKeKUBwG0sskSAXAlHHElpBYLVzWn9bfb9r0GGPb9cihjjFTjK
	 75VsXNz94bpKfHVd0laW6vkJoLpyt/489wnI5GubC9dnwUcIp0Ta5kBP6LgokQGUVU
	 SyF6noe0cn9cg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BB93B28D0FBB;
	Fri, 06 Nov 2026 18:38:40 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 00/10] ASoC: fsl_sai: Address several issues in the
 driver
Message-Id: <179397474021.3073895.6882225051539525353.b4-ty@b4>
Date: Fri, 06 Nov 2026 14:19:00 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502; i=broonie@kernel.org;
 h=from:subject:message-id; bh=swE05LGgxjrr+0T4BlMhql+harCPS9p2bV++wfLUCYk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeyW1w6rmaynDqhbVx8dOD88s3m8tf0eEzZOjcUJW/4
 3eIhsTejlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExE0ZKR4Vic8JVd2zZc+LY1
 7aFh6Fodjtn7xa79mujO0PI3g/Up2yJGhmdMhvH933dItMwyqqu8eXTVvCOv5Aw0xYqufolVDTg
 YyAUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 05 Nov 2026 17:42:27 +0700, phucduc.bui@gmail.com wrote:
> ASoC: fsl_sai: Address several issues in the driver
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> I've continued reviewing the FSL SAI driver and referred to the
> i.MX RT1180 Reference Manual when looking into its register
> configurations and behavior:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[01/10] ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
        https://git.kernel.org/broonie/sound/c/f804ad135529
[02/10] ASoC: fsl_sai: Use optional clock getter for MCLKs
        https://git.kernel.org/broonie/sound/c/ee95db533522
[03/10] ASoC: fsl_sai: Remove redundant error messages
        https://git.kernel.org/broonie/sound/c/b73124cd7b91
[04/10] ASoC: fsl_sai: Propagate device tree property read errors
        https://git.kernel.org/broonie/sound/c/702a9978d580
[05/10] ASoC: fsl_sai: Drop redundant dataline mask AND
        https://git.kernel.org/broonie/sound/c/a11ee78a0b25
[06/10] ASoC: fsl_sai: Warn if TE/RE does not clear on disable
        https://git.kernel.org/broonie/sound/c/db36f0b28b11
[07/10] ASoC: fsl_sai: Clarify fsl_sai_dir_is_synced() documentation
        https://git.kernel.org/broonie/sound/c/be10761cad31
[08/10] ASoC: fsl_sai: Check regmap_read() return value in ISR
        https://git.kernel.org/broonie/sound/c/b485bfcb12a8
[09/10] ASoC: fsl_sai: Reject bclk ratio smaller than slot width
        https://git.kernel.org/broonie/sound/c/279ea69e6df5
[10/10] ASoC: fsl_sai: Don't write CHMOD to the other direction's xCR4
        https://git.kernel.org/broonie/sound/c/9580e6ecce63

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

