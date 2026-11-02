Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623302;
	b=NsyZ3+KKcuJMHmdgkti3NKtH1ouLVEIjKv35cOD7FiyjlKKybN4CF0h7vGnb+k5m8kCG
	 avexXfQ1MmnNUDnQ5b6Mi4mujktUgVEXK0oxkFc98WQFuq5pWye48yqrvZxN5XU9eZ18G
	 qpKtolQ/gNzQyOWhlFoauQm1Iotzti3d5Ttnak5XCVPfbgN46zlp2RWk2tsGuCKgQMEwu
	 mBKL++xNP0idwCm/vlVHFMoALRcrD9J2z/Sby/JGVR1tYs3SV3mYLApujwHg3kINKWMvl
	 XolBeFrURP7rYaRfL7Qbv3+FT3v9IUH6z8KwvEjjcLm5pRbCW1lb2Hom2NNrPoVv6LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623302;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=j00uwkAaXQAGJ5AOFg6JO/djneQAZ5wiK7ilLJtvbqM=;
	b=Omi373Ug1YuoFSrC2KD4jX3VvBBOqXgUgZkmxOY0pSqNLmERh/5UP+hRjlwfAR4BwmX6
	 WQz6HB3wlxkpZIaEqiLXzkko5cJNAhuV1nM+jyQVEClEXzuTlcz7AKn+F8Oz6ToMD5khk
	 piHRvqFIkJ+bg+2k6VQikVUIeKi6ri/fXjARUbrTgfKyYoSxuXjk+4ADFBx7fgO+GDWiT
	 uVc11ynAuZJ5lp3ppDW2rKyKAeFDpRl3iScOtXRkGa2KxRwhUPmmSdgpy0da+JaC6/oJQ
	 rzGOAfvq6+kW14ZTgksBnEZybveZG35oQa8DJjEo8t0hEC4VA2/nQHJ0rpvPEauwdog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjunEILd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1F60A2629;
	Mon,  2 Nov 2026 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjunEILd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A93A1F00A16;
	Mon,  2 Nov 2026 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623302;
	bh=j00uwkAaXQAGJ5AOFg6JO/djneQAZ5wiK7ilLJtvbqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SjunEILd4PD0OE+q3Xs/swyotirmkFnsWirFI01LUdJpbYvJ7dofNha2ckUZmyrVc
	 sA/IFQ+q+pdNDKQJGiKhMRH2pkGhs1g9m78SZ5vPCa93uSZ6UnggIBn0VHoBzmGczs
	 nvxZQXAEJTphganzxq0cabwU66fKoyqLOB6208+yKiTVJWpurNMd1VQR5uyXEKdkBa
	 0okca/rwoxtAMufAIJwur/mrObvJzcYp58AcKigp2vI0Xi6IlhAkB8QiCjavqaX1zs
	 85Xn1MWYztPruElty2nJ3cGTDZGD9CSKHMTgAXapwXafvaeGvm/dwiby7y9E19ymCe
	 Q+Duvttpef/tg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 5055423103F4;
	Mon, 02 Nov 2026 12:41:40 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029080109.12240-1-phucduc.bui@gmail.com>
References: <20261029080109.12240-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: hisilicon: Clean up hi6210-i2s
Message-Id: <179357795830.1716893.13099270420081609600.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:05:58 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xH9W43d2gcvk3b/lfBREK9/fg5Vsx3kI90DxmOGPr1M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetLLMPrm+RvWlaPsMsx+6E4uFzpf8fn+qumuTY/+/m
 RtmuDzY1FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJzP/FyPBPsYxDK6vnwfRq
 TqNDp3T5GjyCPeTdjpZfmMO05svzB22MDKv/WYmdKgl89iu+Qfr4mv9lkzuPzF1Uyl6+0vvfwqQ
 wQyYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 29 Oct 2026 15:01:07 +0700, phucduc.bui@gmail.com wrote:
> ASoC: hisilicon: Clean up hi6210-i2s
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series cleans up bit handling and clock cleanup in the
> HiSilicon I2S driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: hisilicon: Remove redundant bit clearing
      https://git.kernel.org/broonie/sound/c/d80fa025854e
[2/2] ASoC: hisilicon: Disable clocks in reverse order
      https://git.kernel.org/broonie/sound/c/08c48bc3c675

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

