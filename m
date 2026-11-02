Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623304;
	b=RHBTnSxD6khD4qSMg78HDKSgIMht6sw4qun68HT2U/My3aS+o7XpVpdcrUz3WQ51bIU3
	 1g5q5eULjWFnnZTpjiquEPS5CCaabDLxEMekqruoMkv9wVwfzaObJRSi8ett/Ik07aGnV
	 vxN7kcoqd54pgLgUguCa2uPPKAWL1t2TvvnKxTMTsckBs6MvHbXUzxEOK02aGPiSp21qu
	 vZvbkILhodMCI7wyYdPOeeC8uDuv9++oTdOlhzvuXM0cfnryGHBkZgBq4O7g7aKv5NmW6
	 Nw3DFWbppvzFFgvss61yfJKmsdcs8R58XcntLTK/fW7QhA4u+28jowwpNNU9NaYT/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623304;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=efMW/Sa50y1oXCP3CepOU+Na2ofPx4Z+d7YadQybQXI=;
	b=e4Zk8AD0b+aao30mJe93HX1bu9kELHKX+ZmhEyPYWkK3calRtKEOsOB1nCfSwwW5OKR5
	 JHhIFjA/zi8AvBlQKayvjvHAMHxDcucmiZLsSW+kaJQdgQKOho+KF8m0fJ10INbHkpUZU
	 z1SSbwrkZAwUbWyq8V77q7R8mCWaEAa2FoOucsQW9sN1XpgGGOk10ficcuz/drKV+s+ra
	 fAE41Wl7EKau30ShTdFbQ2Q8gPTHgIHNT/SgYGs8enRFBGoOuTF8niuOnPqjENGwNZo4H
	 8cuOFTkmKcJw/hLURRSuIhyOdxmpikydkrhs0MtYRcnmb7v/jHsBSTpDfNIV+aUHBpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4XCaQPg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C9660A3814;
	Mon,  2 Nov 2026 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4XCaQPg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A780B1F00A1D;
	Mon,  2 Nov 2026 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623303;
	bh=efMW/Sa50y1oXCP3CepOU+Na2ofPx4Z+d7YadQybQXI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b4XCaQPgYDDoQS6FyfvDl1PSgAH8+vZpe6hLbNdKrwWr1gUc8gYeIuHaU5BNQZiWE
	 7kOCj/EJodw5cdA2zOwumBPQRSrNFr3PZFtN8AgltdnECfZyroucDGaQM5UiE72DS4
	 dwG1y17q32r5No/6vhI7X7zBJpqez186goMdQKD6NUq+TA9pI+8tkoEu9ykW1aefOg
	 mriBxwcXaRDUXDYddYqvv5Pca6wywR74RDddbDBppO+fjgCePn0q+l9VROjZDjJfyh
	 3tW4x0wNDJREP/opVJWtdrI0xVCZ9jKYpXBsRFTlQEtIM4bs27KZiTyVh4XDiAcTpx
	 F6wTUMqdtN5sg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id EBEF52310418;
	Mon, 02 Nov 2026 12:41:41 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, laixiangwu <laixiangwu@cmss.chinamobile.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030083810.1597-1-laixiangwu@cmss.chinamobile.com>
References: <20261030083810.1597-1-laixiangwu@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mmp-sspa: Fix runtime PM refcount leak in
 mmp_sspa_open()
Message-Id: <179357781735.1716893.17309656576064863789.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:03:37 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/TnCZd+Jyi59kPGq/1IC1o8ACBvZwEwMgZnKwQH0OeU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetLKenOp7QGfKIr+zDf3/PtnemBt9J8XGXFb/q+DzM
 yv/rLwzsaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATkV/LyPBPm0H2+OTd0Sel
 1QWNItcanFz22uju3N/ZPseYbWddTPrH8M/u7M6YZ97/9wcGsMuLFSXOF/7sYJG6WGpS4OmARyJ
 FmzgB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 30 Oct 2026 16:38:10 +0800, laixiangwu wrote:
> ASoC: mmp-sspa: Fix runtime PM refcount leak in mmp_sspa_open()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mmp-sspa: Fix runtime PM refcount leak in mmp_sspa_open()
      https://git.kernel.org/broonie/sound/c/6bea7d731dbc

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

