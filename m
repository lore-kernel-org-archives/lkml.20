Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623320;
	b=ipVg7dJ/t3TDT3uKIActX6gQ2kXmq37agX/4HoSVfIf/vTCcTqwHEbEuMCvkgTndu7O7
	 QXLqshSPnDDa4rODbonVNEtRQ0EwW+1DFT0gqaiWhobygOFFkD8vzmcp6rjVbvoKw5yyr
	 bmkajpk6B1FSHwryWNJPMh471aV0zNVwJC1cDuQd4kyt9onJ1kcNnzvydAdYAMVecd1Oe
	 /DEroU/bFPvRng7+ID0y6z008lqOkEEj1VQ0FJNPdoaW1rFkx3iZt+ipKCagGq0xeYvJl
	 FHO6Rt2YbwSSnzLxz6AL9pe+MxdFYhShCZht1XinfyT1LZIzMaFlDTKNdmwXERbT+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623320;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4NNgU2DLeFFz3mlWBzjRkB4oBFiIc+ePl1hIfsaf/4U=;
	b=1rOUfDov/7h6eQ9pA/zeUpisFOh7HAvQ7HtG7tR7UdCaM9rfSzBTC6gtlNlMHwoHqw0z
	 hZyzKK7w8lC/8KDG7zSy4cJuPtqtkBZ5OAieGETsOOQZxezXjVmEePW+MJiM94gRETQXv
	 QzjdcNZwEG+L/ZuTOc8JTn+vh2EZv7KNP3G3U+VT1pzNW+50mJD0r3H0YSuA9d53hcsNt
	 KYPSuUD01HjR2iNzd6IvylpPIoPsmhApoB/7YhidLThgHhQpRMPTlr5g1addzwYfILKq+
	 4rj4Ww2ZRyZs1WTXlVt2mJn/51mFdN35SBL8ujUYt57yT9QUupsRiYQCj+NhmOySxzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kn9g6Vs+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0CA606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kn9g6Vs+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBCE1F00A16;
	Mon,  2 Nov 2026 12:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623319;
	bh=4NNgU2DLeFFz3mlWBzjRkB4oBFiIc+ePl1hIfsaf/4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kn9g6Vs+8g7rJFBArFYtv6Opd82xK3ce55BeD/YL3VFPKdsXH5bga5M0Jj335ztOx
	 eMz8GuKoHz2ARORvFeZUGY9lzDCNab9qSmB8u+lJUMgLfDt9KKvk/ftaX7FHRE992f
	 0OBNKorIvzyH5xzi0AJ6WmxJptV/5kG0zWv08FCL7UAYf/6Gis6tWXXRCEkdFoFEqJ
	 f7fw1QcgMZZok+xvmPyEJZp4ERea7Yk0fMPzXfA/xe49buvRHjcxTqbUcuZymEWGS+
	 iBnYN1OFYKxBf0JUGamSFsObc4sSzlhwHvZUKlx2RhSuZma253qcDguZK3GVtF8JcU
	 Y3bdX1vtY1d8A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id B1EB02310433;
	Mon, 02 Nov 2026 12:41:57 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261026-regcache-rbtree-restore-sync-v1-1-2ef0e9d57ec6@kernel.org>
References: <20261026-regcache-rbtree-restore-sync-v1-1-2ef0e9d57ec6@kernel.org>
Subject: Re: [PATCH] regcache: rbtree: Restore async flag when exiting on
 error
Message-Id: <179357838632.1716893.15090301409666297271.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:13:06 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vAl83NfXZBgeq8YN2hGUn4/7q9LxhdM9FldWJ2lL7Qc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetIpWPI/PcbnT+cvv0TnX5tQTJna3DLLfyfz9Italc
 efKkj6mjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEyk8yjDX7Gf7xzMj3ffWX04
 JWZb07b4jNVuVawa9SEWJ+8+exs3UYzhf2pv/iHe/ScFzmwQPrFqetpX29jM0ltRetsbDuWI3dv
 yjxsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 21:43:29 +0000, Mark Brown wrote:
> regcache: rbtree: Restore async flag when exiting on error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/1] regcache: rbtree: Restore async flag when exiting on error
      https://git.kernel.org/broonie/regmap/c/477267f7f754

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

