Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484588;
	b=iyNV83oGwM7ha5Ypf3KhAJXOWNkE6Y4xo8vpQBtAzBygHk3aPOdLJOboYQgVrUZ/9AHC
	 uv9KehWPD+gr8u/awxmaeEH5Ivxw14rGPJF28Kj3sex0HGqe3roOwgmtrMPhkICHOZfFL
	 U52jHBzMGK8Re3E45Hh3tQS7p8sljSgJUmdYjVHutIaehnvzBcvRrMTPzpxuVljMJRk5L
	 duFWNKCbkmUh+nJs+npag1wbPB74bPfzg97/NAP8MU7a+upxZX4vkKMnHhohzM5qvQEkN
	 iVjajb8HcHDXECUV6f/ZikSo0oB5jZIzfUR4Ngb4FPgPGzcn3e49Q1Crrcfjt8UItEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484588;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zORW0zy/6f2KkJEEeedreEnTa7DjvJJaRLlb/K85tlc=;
	b=XXf++9GurjYi5RXLAAJXzceiAMd6c2FX3toPD0KB3OJSFw043jakQVvB9F7vVQbnTD/m
	 rzyJTDYtUodH7qITrUAWknXHTwCAwUFVkOYWVsIcHL73PAZkgNyoViB8ieDrZk2+icJaR
	 l0Rc8/DlObSSN81ZiXnI5Xxzijn1CeKIfbhkMccUGKGhfJkOx8Wz8IugX2oSVfBejGGHd
	 8TJYC2/Q9aCPeQAT/X6WzFPdKqy7eLGfunLIoFgDMzlTC8WjcekrP07NtFHRKHQFUJ4I1
	 vO3o51ELeXCp4IkL+m7wViBSjx5RlFaUMs0S1nj54eGlWQmCqTGs8NPorf8u3JMIajw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOXynyB9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B49606A31C;
	Thu, 12 Nov 2026 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOXynyB9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5571F00A05;
	Thu, 12 Nov 2026 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484587;
	bh=zORW0zy/6f2KkJEEeedreEnTa7DjvJJaRLlb/K85tlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hOXynyB9rswLGs49u7LzuWHRSkwRNrjx9oanJP++eliN+EPwO3KGfoEMn15BR5cI5
	 Uug+UAQMLAKjeoBgCYyWycsoIXBkyeJ/OXd0zQXj8kTndYAGqsdsh3kYLAVoBSJ59T
	 3u8lfVA6cQyZmnH84TlSv51ugIf6PPuJ8n19TlcdM1vRJW/y0sgPWcpLxC7K67Ssh2
	 FmDg00yfpR4pGKuEgIw64I9KqF7WACWNMDpJOD4kPnlr57AimlNV/4NawYpweaka+c
	 xpBAi2xIDMO7f7riR6LSl54VoE0DM6HvQBB5umtylUixmrraks93qKtHQeD92S4zZk
	 CY901hq6anc8w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261110164807.1671681-1-rf@opensource.cirrus.com>
References: <20261110164807.1671681-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Consider SDCA FunctionExtension
 ID/Version for firmware name
Message-Id: <179442156908.484483.14964992477486862696.b4-ty@b4>
Date: Wed, 11 Nov 2026 18:26:09 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vuNTv7AstuC3KqA85S1X+VbOgxcudhE5tjvF7b17pLQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+rsxcfl2a9b//+6/F/hIPX34KMs9JkduudkroQe6by
 INPO5O6OkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR/uOMDOc138Rf+3a5Jd5f
 dHaNy54Nl+qX7ipefI1Rfbb+HA0fEVFGhl7Wt8L8O2wDl5xXmnc+RuPwask4NrXER2HPU+/fONK
 /jw0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 16:48:05 +0000, Richard Fitzgerald wrote:
> ASoC: cs35l56: Consider SDCA FunctionExtension ID/Version for firmware name
> 
> This series is a change to the cs35l56 driver with corresponding KUnit
> test code. It considers the SDCA FunctionExtension ID/Version as variant
> identification when searching for a suitable firmware. The intepretation
> of these values matches the way Windows interprets them for the same
> available set of hardware identifiers, to ensure compatible firmware
> identification.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: cs35l56: Use Disco FEID and FEV to qualify firmware filenames
      https://git.kernel.org/broonie/sound/c/e929ef622b87
[2/2] ASoC: cs35l56: Add KUnit tests for FEID and FEV firmware names
      https://git.kernel.org/broonie/sound/c/c8bb80feeed1

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

