Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623297;
	b=irztNe1jKoxmwe2KG26rXO3vG2S5IPbowJRb7do1kgvosZCtkZQ7G3Epm3ZqXaqPXy7Y
	 EjJbeCwtqvmR0MsYIrU0yVJaviFpoqR6CQcDfi2Y3e/lHKUzD64c8Y7mrePukhge+TRna
	 8gs+Fv+wzqRdTJ4cvByqIu+uN73WzrjlAwFKh+EzPHtYZnubk7+YZykaApuVVr2EBE/Jd
	 Fqik0DseGeSy4Wl5OPMXGFHKw+uKWWPfgn6oCBjPV7x0B4/vxMARPBn8ngXm0Lgp4nXx2
	 RWGbeksoUJKhb/UkjOy3uP+HM7BMi3Enrqw2C+1Sxfc2VJDiZWa8HjdrS1c0o5uAUuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623297;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2HixwJSZS5J8yX1OJHLceFY6e8TnULCZt+bzp7+looQ=;
	b=LtdYfUdwQaHQKIVqemEI7f6ffOdtaA/L3C0Q7qXP8xshL10OV9YXuY3kJTy7B1plovai
	 izA2NRV3Lb6dxPQWdOFWc9337k3WVfkS2TBLvm8u+rw8epSM8R7d0BLPGnHw0PlmOWHeE
	 9fb6o5uyCJM32DuDJp+JrxMT0ihTxwCCYAYlesjdgFcjt9YP3a2zW3zL6+Giagc37qTUN
	 ENIbRB/NeRzRvbY9vtkIWU5sc1gM/fOm+wfhU4ANQoCNsPF1/QqKZMOE7c97Bsb1hkq+j
	 HlPAuFNBz0vL8dRzIMhR9+7XRgDw1XQtJC/xSTstaD8OBDPc+3Arv9KpFCyMZoJv8rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqoicevn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899AB606A334;
	Mon,  2 Nov 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqoicevn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8E71F00A18;
	Mon,  2 Nov 2026 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623297;
	bh=2HixwJSZS5J8yX1OJHLceFY6e8TnULCZt+bzp7+looQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hqoicevnwHwdRbfKJmhQtnK7qPEQVAhgs7FEygsOEt+GjBOyBo/b/dM4482H4C4LG
	 /Ierv2+YhyOQ5IrZbriIkstO0GTQFShGjjPcCDZqGTLHWksx1BC5kGnlUujYV7pMLS
	 0I5WL8ddfhqtLjfWxgCnzuW29vX54q3Yfb7e37go9zoCh6aoEXTjH+pXZVKfTAwHKZ
	 dIlnE+qfbmc92SAyhe+Gy8DVPxUhGKFd6u1bW7J1/9mv6jxXj5vg5funmS+XXQTEL2
	 rRwcjqSDrQ1ZhgSmB05aGwVgJsdfYoEbGZKa957ONVGFE339ir7OdfzBAQXSVJN+ZF
	 iFnBbsPo0+Lwg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9F7AE23103D0;
	Mon, 02 Nov 2026 12:41:35 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Karl Asseily <karl@asseily.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024161635.12956-1-karl@asseily.com>
References: <20261024161635.12956-1-karl@asseily.com>
Subject: Re: [PATCH] ASoC: es9039q2m: Document the FIR coefficient payload
 format
Message-Id: <179357697937.1716893.8514037083504681757.b4-ty@b4>
Date: Sun, 01 Nov 2026 23:49:39 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MTSaXBCbs/bTOq56dU5XtDq6y+n4US6Mj8Omcrg7UmI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetPz3Obftfq3LFLHPccq/Jj0U+Cb56YDIO4up/jZLS
 03NeKpcO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRuzyMDL1ezedOpMz2nMsq
 8PjAt9mmwcv2ZBcdlLaw+M2V+HCu231GhmvON3YXVCz8mCeysn/Pyf5HX+68i7kiOuPo+ql2Gvd
 7WvgB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 24 Oct 2026 19:16:34 +0300, Karl Asseily wrote:
> ASoC: es9039q2m: Document the FIR coefficient payload format

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: es9039q2m: Document the FIR coefficient payload format
      https://git.kernel.org/broonie/sound/c/cefbad70c7be

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

