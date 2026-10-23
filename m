Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830175;
	b=ykmzto+YUh6a0bSOVP0ACZKdJj3yU2J2ibdSkXzgH+8p44VCPqRaqliSGKEcsbMFBQb8
	 S1D1UnV9UqGt5LZzYkM7IewfNG7ongaRXh8obsH9xKHSH97kNkMaWnjMop9sIrvt/Y39i
	 r5ZBqV/7k6AEF21f4/L/Lpq/3LK7DjyQKd7wW6q4vys4PXcMR61wz/yIWx2nNZaCilRiG
	 HsNWNRF5qTZihLrrnol3DAZ44KtEHuTnqQJWepmb5Cwo0fBlO5w7IT8EdmVbgcdVFu6cL
	 /Fh27qLCGakmoPjAoarg3ENGhwmJk24iloVb6bbjCuySzbxvdRRMBqwBeyTu4d+cTzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830175;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=M48bkuievRbShWd2BAyJmAXp9WBUt1n4E7I77CAu91c=;
	b=JqXfYjlf7bUom12/rXLTeuEkqphio3aR0oK30zDmlayqvpXEc96dwPtr8ADbk5CNUPod
	 GKExBe2YMFXhGy2LUbhglKIowFQC19JF3j53DxjSBYvi2bVeTjFUAlPAdD19lQqsEnkzz
	 tVzAHJ5A6Qw5MHplzlGiZ3P6lQk9pwg2fvdWwQHEQN7H9QM53QzlRRNA4dnd6xyqpo6dj
	 AUoqnW+v7vQqfE+BEnQP4O3FnUTHFuryPhqt1GjoGaCLqA8H6h4QH8fzVAIwssqQWJW0x
	 LMGD6LRozfyDx6tutIO9nQNqHeYaDJprqdNcHOZ8QpZBgiSGt2FIxfjt++wcLM1wwdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTEByLVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE07C606A31A;
	Sat, 24 Oct 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTEByLVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8F41F01825;
	Sat, 24 Oct 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792830174;
	bh=M48bkuievRbShWd2BAyJmAXp9WBUt1n4E7I77CAu91c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fTEByLVvx6n7eMZORb33AAicFyHGVvUoIi501J/nhbTOXhZxS7Glsl7XPB3bKSCXO
	 jXzvUVqLFlUPCAWxf/pI8hAKsBjrfWYWT6BM3C+BPkdLDOc9D4Qu5Jbg0rfXnUM4I9
	 8XU1CRQ2zjaNjbfH+T06xo7Rd9BJRr35rWR9hZ6D52ZuGR6/LQ+knUNL0LIYgsspzp
	 ZdUUV2V00EOBXreshirUDazzOaweEA4Tm+7bhlhrDbk0L3tI4W0LNYoy/HXgeRJpXE
	 OZGrJA48oTVTXWNTWret0mMVfNokcm4ZpoxFGpk7ZQTahYKd3mVpx4jv5v3oQ6y6xC
	 ZXmmPsS2WW3Xw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D808F1E1FC3F;
	Sat, 24 Oct 2026 09:22:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Kees Cook <kees@kernel.org>, 
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sashiko-reviews <sashiko-bot@kernel.org>
In-Reply-To: <20261016085047.535265-1-phucduc.bui@gmail.com>
References: <20261016085047.535265-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: amd: raven: Fix memory leak in acp3x_dma_close()
Message-Id: <179277627943.3909521.9593557243825637813.b4-ty@b4>
Date: Fri, 23 Oct 2026 18:24:39 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mswTYV0HfDjS+eLKkuNxXydo6UzWN6eOyUYFriDmVaI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLuZF1LCy7RaXngy5pRr1IVpKKgbszrxmyY3PYz4c6LE
 zKrtxV1lLIwiHExyIopssRlcb+sL3m9hu/gwjaYOaxMIEMYuDgFYCKujowMk4RfCCg5rApev+FS
 u3PUdcXVT+VFIt9M7v/TLz+H696jBkaG4xsn73trmO62ReW04J8g3QenvYuEld8uFzhxJ+Zhfrc
 xOwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 16 Oct 2026 15:50:47 +0700, phucduc.bui@gmail.com wrote:
> ASoC: amd: raven: Fix memory leak in acp3x_dma_close()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: raven: Fix memory leak in acp3x_dma_close()
      https://git.kernel.org/broonie/sound/c/e0b17f84f6e3

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

