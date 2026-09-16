Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17235F16C;
	Wed, 16 Sep 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578333; cv=none; b=Lg++VnSYMUZxJoJM1jQO2Gr+rQtQS9Vss+EU0OaVO9X+3W9WZYcmp9cY8rUafyhvKG7UIdYH99s4/J87nIijLWZoI3ebmnPUvytLeN3w/9Gau0O24ZQNB1KwkbceleoqtWAjGgVF0OYK3t1aUvFjBAm9u7kd9GAin3+HdN5T5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578333; c=relaxed/simple;
	bh=IF1w4YkKYEOtHYQOlWDYuuhdT7uZw8MjALmnJ3vOXZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ImfY2InZG4NL2nHniyCWgg0ODyxAoklH5MYR7doOqaRwQ3belpTw54LSOvLht8AkFSXvqyjDFtu8iFmsrYAIabOjDU0Z0jwBgmqdetRVXor9X660aRm6br5H21u+80YNaD7XgVySgY+/LOS5csubNF9YmXHcvdcotlJRFbkmZU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ky1Qnxpw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ky1Qnxpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73D71F000FF;
	Wed, 16 Sep 2026 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578324;
	bh=/4QzDOFGgzvxHnAPbU0sK5Shh1UZgj6em+khavRLcHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ky1QnxpwAnL+lEqMTCWu5STCTlzVG9nX43OWhzzfsIHvAGKZz4BdAnNGH9sUNUQHl
	 yu8Lt5tojF1+rBYqqIFxZukOkcIt/ce1D8hfdz9Aikv0mliFAsbMIhAdEe7Wu8RooT
	 MtV0sg11BaN9XvpLzaDqjENOsp0OkJgYF7bCci9IXVFVDe5ngOORm9GwKYqtXR3hAL
	 r29M4ltCuyJp5bTj48q+eew3A879MmKkcyyT+HoZ+BNqe0lq3/u34lCGpA4bqT7dVf
	 GbJuvndtA/Z708wW5KGr2hL2PATotE1piDdu550hzGdATkcwQThXVVflUXBjuN2lfF
	 pGLmw2Z1kOwGQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 Neo Chang <YLCHANG2@nuvoton.com>
Cc: error27@gmail.com, lkp@intel.com, perex@perex.cz, 
 krzysztof.kozlowski@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, neo.chang70@gmail.com, kchsu0@nuvoton.com
In-Reply-To: <20260915014940.317403-1-YLCHANG2@nuvoton.com>
References: <20260915014940.317403-1-YLCHANG2@nuvoton.com>
Subject: Re: [PATCH] ASoC: codecs: nau8360: Fix misleading return in
 nau8360_message_to_dsp()
Message-Id: <178957831392.100121.4806798682515883550.b4-ty@b4>
Date: Wed, 16 Sep 2026 18:05:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IF1w4YkKYEOtHYQOlWDYuuhdT7uZw8MjALmnJ3vOXZY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqsxPX/8pUU8pRAopq04NND4Xoi5S8qGjIbUaE
 y0u4nSW+ZaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqrMTwAKCRAk1otyXVSH
 0DE6B/9Q0mJpzxHze1wTROtD045JZl/ETrv6qYbfZWRziexbWpWmNRIP+BCInCStrp7ndGQBbCG
 ACvBWnRP0Gkm+pHnNEiCMtaXRKnug7oW0ccDQ68sAX/hWMHuWRRDnZuHKyk7izZNqR/ENBum1nk
 +XgR8A70BZGKXdKRZsJhGvQMWvwvCSIHZS1AYhdCLL4wA3wuXfbIFcCdYtcqjm8QS4cxkHG7nCe
 jHN5+O3mVXCZDRpLsXSmEnsoSBgz/pnUT3cQtcNUCFXKYOuEbOdpbW99yHsVCwaaVTvt1oWwmTP
 c4Zysj4H7ngLPxJ8IsHtdwcsDZyRutYP/sQGj5+kV9XL951k
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 09:49:40 +0800, Neo Chang wrote:
> ASoC: codecs: nau8360: Fix misleading return in nau8360_message_to_dsp()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: nau8360: Fix misleading return in nau8360_message_to_dsp()
      https://git.kernel.org/broonie/sound/c/40ebc8f73630

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

