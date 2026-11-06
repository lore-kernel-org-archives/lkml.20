Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972777;
	b=QdZf1+AVwELmJwwBWSijPfwUvl1fAn1NLkb7+ylm1ZI538azIFnpsIuDiI9QTd5QJOj7
	 sHCqwkm7TAUqE0xbyaVKmin/fehdPqcVb6c3zh48/W3p3t8ofTOdS6k9OBCdqkzyEOAtu
	 T6eGIOuLXIFHeh0etymBhON8RkXCbVuKGNQGbcqXvOVYI+eHBKG1y8DPR75IdnNUk9qlh
	 Uur7yAMq/FPKvvRhl97EJAnbK/Y5BLaEz7OFVByaZ5dYVSU+9YlIM5pnkrMCtg/xswIex
	 +av5G1eoMQQLVa4w27sGQG0vKWCDYHjLd1+RbAJtB/At75cEMqYctkQ5RRewxVDdidg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972777;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=iDsyrIN4mZculiTS5AmByyttLMOMNQXJMKtfP25bG1w=;
	b=FQi3R0POjEDXvx4Yv3kSd7CIHpy4kKkUK7RwyVm0qquq8rW2lNKN/c1pk4Z28ztZUdHc
	 upsHFwMPjMvmiwE44BKt+vV9bYRrjdTVXB6Ogj5MUjxaUJJ5YbfC/br5ZWRVnBs05+pCB
	 wzYP+sVHgt24A6HQuE/xCAw+893TxMSveX27EXCvVg5kHwAZgEZgjgKNVOrvd8B4IVHjS
	 2tRo6otJ3z88FGzTAcoacAXslUw+hc4TJQmIKr93MQVdD6hrm8FhJagKk9djJQdvLlTKu
	 GpHZumkSazj/PAUUaRnZVRLg8OAi8cGZYngCep/9fX+76gagkFkL/qGSkRfyXEBkk+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MWZwv2VE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78C606EEA1;
	Fri,  6 Nov 2026 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MWZwv2VE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0781F008A2;
	Fri,  6 Nov 2026 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972777;
	bh=iDsyrIN4mZculiTS5AmByyttLMOMNQXJMKtfP25bG1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MWZwv2VEGt0XMcOoPqh3mKeGfPDWbCTkigunUTHYeEz39BCNklKppef8h6ZG0QoGB
	 6AqQXA/sUcZXTu4rNfw0U4KGGAplpiFgHMEFY0oZ2Ig+qRQyfuqhW/FYUI3DweE9Ws
	 B7QTcoFXk2aDzPULLckj4wFAgCbrvsIlnhEgk90mEDwr1pDI/2DUs/UVmymXkgS794
	 Fu9JveoYfJKcbMXPSGW8SXs7skziXAJfOkoGsVoFBv2g/UmRernumA7vyC+JogDE6k
	 DZRCFVrk9OcPQX8gzuQHZ38PZ9Qljb3FyJYd9AYKLg49oCOATQqCYbunLwpDh3D8Ux
	 c2wAdcSIeBgcQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D12D2280806D;
	Fri, 06 Nov 2026 13:46:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
References: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_asrc_m2m: use dma_chan directly for
 dma_async_issue_pending()
Message-Id: <179396622411.3073895.524075215689851221.b4-ty@b4>
Date: Fri, 06 Nov 2026 11:57:04 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EVk8b0z1rHRoz3MIB0/Nrsjmt1o79+EPuJj844PKyO8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe3lI2dmUo6K6b5F0jZSrCy9g5aeJs2bOn2IvzXj+Zs
 cL/v2tDRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbyYjYjw12WvMksj+/n33jI
 khW6xfdv84uY1k9Wu9/H9bv1vV51R5PhvxePHkPQnoId+lZJztPuTX+3/eC7zyfXZTKtnno55ZX
 BEyYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 02 Nov 2026 14:52:27 -0500, Frank.Li@oss.nxp.com wrote:
> ASoC: fsl_asrc_m2m: use dma_chan directly for dma_async_issue_pending()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl_asrc_m2m: use dma_chan directly for dma_async_issue_pending()
      https://git.kernel.org/broonie/sound/c/28c0e86dc8f3

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

