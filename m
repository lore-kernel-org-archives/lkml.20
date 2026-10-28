Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232700;
	b=SQ4YcJlAL5GWhGvTfYEjFz6qi5mPQjBySrIcyD/WTnRD1m7/rPzgrpIG/djKcfCxLKyg
	 emx9xSjyhFGLtr9MVBxmhV/v5WTzv/9qRRGBmNRkuO3UalvsgHAv73+87cJILJ3kPXmAs
	 MtGtKILNkG9k/RD4W8n4cVEIAZN3S+BbG6VLkTCbm9WMmjm98tnlkxI5ZYZVZ8xhGuZ67
	 rG5CW1VYocV1WJqGwBIs2olu5nG+KrRv1Gdv7BWKhgPueXapYSjehgC4z48ffa6Ud9KLu
	 VhrQOx1Tj/XNg0aGLZaiLaNdzkrAwZCSANicUVcW0aurWH72csL4h+ah2crH4Hak7VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232700;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3P0Hp+F33aoisJ9L2IvNEQy8ShY87tikSrvoj3cvgQI=;
	b=lT62Mb0iyyB242rKG44JLh8JQoqSIEK+lNrY0JmjwNrz8jAGtEu9S8aWYGo1+od+c/Ku
	 ZBYsCqEjIdFIFXutsE2hx+JHaXgNKjFQQxb1teRouJTvyib9oXNcscsU7GrSpBzMQudNw
	 3xfgB/P2tUTr9RnMSUvoJrvU4p1xFQOv/q08y1M7qAWLLyKvH60iNXt6oUVJ2Okm64j0P
	 UJ7UaRnmQNVV7LNG1onYCuhxN71aTMdBUJ9UfhbOZFnIZ86KvClF+IAnD9xYnC68+jlUl
	 LCaz5LR9oAQvbKPcSPyE2/shNfotHTZ2+mDoyJDRv6JS6MFYMGNkpPNzohE98h3NDeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HgI+KYN9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0530606A31A;
	Thu, 29 Oct 2026 00:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HgI+KYN9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A51E1F01825;
	Thu, 29 Oct 2026 00:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793232699;
	bh=3P0Hp+F33aoisJ9L2IvNEQy8ShY87tikSrvoj3cvgQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HgI+KYN9iy6ql6cjO0JaTmBBW+Thv5+iKbbY0zHUoPcqV6I3SuII1pdW0RtYKloWK
	 4oc4sU7VsBlzi8jB9IOuqvHTL2/9rkzk7m0PEcYMPQ6XSlg5OpDPleO+Jq/29cxGbO
	 bIK1EYtRU1UuVGraVFnjRvEpyP+EHmQRsPEpLOjhR24zryHHC0tkbQbMaV0R/whhO4
	 ZbnsFGULcyuzOYX3NHJTZd2aTfA2Izt3YlIACx1OqFY9uvczKlxz1C7SOtROzYr8Tg
	 uuMpMKF/OHnn5anRSup36kkbnkWJWT3wySJkwlc8Oo1Fj5vs1txmShEBB+/ed0wlIP
	 sqvk2khLg4m8A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AB5372062ABC;
	Thu, 29 Oct 2026 00:11:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chancel Liu <chancel.liu@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
References: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
Message-Id: <179320705881.1308637.1526280484324452440.b4-ty@b4>
Date: Wed, 28 Oct 2026 17:04:18 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CEWA5BCsM2m+RdihV34Cj2j9qYJA3lhTL7Qhy7yDHcY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIe9VsYLVC7F5gwL1zUeM1SO6+iiIBTpgxL2U2+ZzSxq
 pvn/dzdUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgImY5zAyHHzWJGxVY3Jjq/C9
 1X9vJa1b9je5/F30yTuTPlXPnu50goGRoUXzkv2buKs13sHxd+w+f2V1s42NYxQ0Tm248PHbc/f
 TXAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 19 Oct 2026 15:58:20 +0900, Chancel Liu wrote:
> ASoC: imx-pcm-rpmsg: Flush pending work in hw_free

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
      https://git.kernel.org/broonie/sound/c/bbe41586cdfa

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

