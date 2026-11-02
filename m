Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627486;
	b=qQEVX5GRcZY/S96LhVmOLgaKqWANh5bVli8jfcCoTZmK+paQ7jye25AwEiBnsAyMbaSy
	 gYEIyTjILr+df5pvWjI3HgiMlQktcSnU2qUm40yD0IO0hqQAnxg2/204P2LOR2SXUlyrO
	 R91wekruMU/cDj4tH0YNYOscaQ6ycoJNGkhKjtBA73NgaToC1yYMsU6W7BdvHkGVQGE0p
	 6urosVECBbgQlmRPBJg34e02qAwkW2n7+TwhR9wMy4WPizx21ZhgaUuUw2ycrnP4HY8zc
	 m7e4d4SfVSIl5QAbkfsN4hWRbaUe7Edp4xz61j3clHSGm7sE2xq8VuN52t2jFutU8OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627486;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LNXVihKSU/0J5Uk6NC8qqFVodyaTPDhxD+ZTMY26u2k=;
	b=pYBfPmh+5RpeTlngJqDZxKJdduihvMV8Yzjp2HzH9WrXRyhK3hCo22kzoRRbL5n+xbV9
	 vOdNI+U6CDgd52/U1uEdqGglD/lPccJWbxlVyyPPJoubIocqUK5WFjrJn7K4QwIFTrx1O
	 dMNMP8cyURx/EmaQcsfn4TR2TM2LbCacfqFNqRY731jvtJ0ZCrWUYH3D8a4ztTbIbIXpT
	 aZmHUFcJqrOUHjDSMfHUljI+5/+maN1WRsrjMaApBzM2FuySeUdO587AdeQ7CNF4au4hn
	 9tnqKbQOCPPb9g0sCvO/P0sB7JULQbk3VxmrIvsEMxIyhyijffhGLO0Lxzwmk44tpXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVN+ktJb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459560A3804;
	Mon,  2 Nov 2026 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVN+ktJb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD06C1F00A28;
	Mon,  2 Nov 2026 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627485;
	bh=LNXVihKSU/0J5Uk6NC8qqFVodyaTPDhxD+ZTMY26u2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nVN+ktJb+16Wnc2z6jft3QiVKvoY8RlASP5Puj2TsImE+JLFEMl+LTWAYVjttTuH9
	 e+Vf1OlR75TOlcGkpGpHouLNybyFHIkrYKdzAoYCEc+KSZcO6afyMEQR9SoN8Zluyd
	 bSQoz0m/pihmpclKqjXVMXA0LPV4Gazj70OIwjwbpB/pb0HBYLST+hOz8sOjrKLGoe
	 xuiwhCHqOvXib68dtzSErx18M/79mcbgEcQxPhlL3vwFJ66OPBO/xHQFzq6ylqe3yf
	 ZxA3oTs/4vSS8HBAlbRBDYOtF6R22MvaUvAKoRUtU+dWeIT5+V+GTk3imq/h2Vaq/D
	 BZMF+o9TsZiCg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 22E9B2344CF7;
	Mon, 02 Nov 2026 13:51:24 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261027104417.7150-1-phucduc.bui@gmail.com>
References: <20261027104417.7150-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: img: Fix double clock disable on probe
 failure
Message-Id: <179357883120.1716893.14576659532783606777.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:20:31 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6MIWTTSzxXYGpqB79gSGRjmIgPLGETw2EF8+tMjr8C4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTI058HjWHYG2z9MqeE5I6LruEp9yosCaO8Gu6n/pj
 O6F879JdJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAipSkM/ysXLvQ73N/Y9Vrv
 rbPSHQ63p/4L5h1lWrk2TCGyy8RniQwjw7Nl5bPPtAbxe7Ird5ok7ph1K1zuZNr3kreCyivOlye
 aMAEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 27 Oct 2026 17:44:15 +0700, phucduc.bui@gmail.com wrote:
> ASoC: img: Fix double clock disable on probe failure
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> These patches fix double clock disable on probe failure in the IMG I2S
> and SPDIF output drivers by disabling runtime PM before checking
> the device's suspended state and manually suspending it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: img: img-i2s-out: Fix double clock disable on probe failure
      https://git.kernel.org/broonie/sound/c/b57bf0ede3ca
[2/2] ASoC: img: img-spdif-out: Fix double clock disable on probe failure
      https://git.kernel.org/broonie/sound/c/52937c91c844

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

