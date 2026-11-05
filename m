Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889718;
	b=IPEDGJgnMHHRFeth4f3nxaLuLb9qNVeXLgVkh+dnkgSGfbaZmHNq4Do4abmpHbfXsaHQ
	 CK+6pK8232pq5IsIsCqNBA7GgDEPF12Yof4ZaG0LCcxaSiMw+j/Y7tVw5gT2ACn1irI5W
	 790tAfNdNXYc+l7X9aYS6RmwouNjFznMG84Jb+TaWQ7A0EHr/vhUKWCYubMpqrh2sjQfp
	 ntruuMy5bclPa+CbsH/XvYMM9JH8/BTwQob5EouJ3vfRhdYNRPlO1EM8S3RhJ11fxggZE
	 Yw1JAfTn24opxmkIzn2R85HIhEkcxTKF2+yaI1F+/wZ0rAv9Nz2t1GW1Ix8R3pPMaFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889718;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FM0GXu6K3ywCewrFLfc/Mlz2IYTQV7GkWoeDvvAVApY=;
	b=M2cllGuT5h2mkDk6TKRgrIGq3D/Z7mHrvq+xdEjEH66ETTN4d4FwxEVrM5BPI4uMR+4v
	 YNiByqMF/xfaAn7g/GC8qNUKypeN7x1JHXUqzsIK35xVJXg9SysxEKzgQr0F5SDI3kfx6
	 eZosH80n3PThiW+nMEereiBRVVC1V33jTWB/qH4hE20PtThu3082PyYoXmeXUaL2iegJ3
	 NeRFtm7xN+9fqUJzwxP3QMGY2JaqDmWV7LC/svAalghcqZ6b0aUlLD0U71M9p4qz+NBAZ
	 a3QAFxdKwmj0yByArYgxCv+d4CmOq1yx0aWfcu+y3ZE/n/s2oBVauBZgnK/kFsJlkCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hr3V0onR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0BD606A31B;
	Thu,  5 Nov 2026 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hr3V0onR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D741F00919;
	Thu,  5 Nov 2026 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889718;
	bh=FM0GXu6K3ywCewrFLfc/Mlz2IYTQV7GkWoeDvvAVApY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hr3V0onRTktBtJzR21B6OPO3ER33IJufrxsPFAG8sRVMqmOCiXBqVEwwJV4mYFmrb
	 csJXkI1xRPkFDlI2k732vjzz4WUQUSVwSBjQTfioNJS36BTkmymF0Vyjt1NsvqBTU4
	 bppwtb37sSiq6LRK8pboFm7Ldr1cehSi2hGHkAUfPagiM3FWq8/fAj5Sig1tRMdAd3
	 EfwDk46IBN/Ac7QzSb3WCoGhQZCdqLT/JXnM2cy9weebFW+tdUk2cTiAXOWrPJh7hZ
	 G2AcL0I29/fuLkhmCzd2Zxlk/vRQClpRLmDXtZ9lpbVL7U7VRSntf5QYPhkDpdrChK
	 4Pd10GbX06qPw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E139A2795E7B;
	Thu, 05 Nov 2026 14:41:55 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
References: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right
 after reading its rate
Message-Id: <179388475372.2912885.15403731696986720392.b4-ty@b4>
Date: Thu, 05 Nov 2026 13:19:13 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eKulEu67eFyz/ko+paAxBSfq+R8JXOGf+PgSzd22/sk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeTN1cv2BWZszG7LU3G+0+vzsn9DyYTd6Z8WAFr/fht
 7dnZ5182FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJqJ5h+Ge7aWFf+pdNaldP
 inCx5FZ0cSc+Y9ixznK3pNQFyStudSmMDAfOrlilOztjJduNMz9CwmaencU7+dNqoSSDW7bRlSV
 ccxkB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 11:48:35 +0100, Valerio Setti wrote:
> ASoC: fsl: imx-sgtl5000: release codec clock right after reading its rate

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl: imx-sgtl5000: release codec clock right after reading its rate
      https://git.kernel.org/broonie/sound/c/4ab9e4ccfaf7

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

