Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623281;
	b=B5ey7sRL0BXNp7DMqgQPVTDjKlXYRBVF/IOFiqGxf+F7/1+QdMkYPxnkRobZNbkDVCVr
	 jcitokSNSZe6NCp5odd072mCOtg5m7B5qC0H3HgoINgEuFcGDa9ZUniCdl1WG0eNcfuDv
	 IlwVmKVB/CG4BA5g0y2pfDkFnVJFBSWjDbXOP55Uk6UKpVpxbt7Jx5h7Elwi8uAUeLIrr
	 tdv3lFRN3ABF24AoVehzSf+33a4Nc50ZzJq+3lG9KdyUM0xhkRWNwpm/J9xYtCOEEqRzi
	 W8Fq8ojkrFlTvoqsTzB12Wu+SfJSB/i6LvSHWFODZ8CAgIzluqo0iJhaa27yErDsCLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623281;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5aIOCZcqu87O19EkqpZIvrj+Agqrn1uk+efFEVIHg4w=;
	b=vYqowQpqRrW35y7w9UlyQZYq2fqNHxhzx0GFe56M4xE8m/4avXQNRHi45GeJni+g+LPF
	 XvAjUlXCtj8v9ytTQC/a8D5WH4ztBKjJwgPuGmOaL5AGMyeFz6/iRuiHLOUZ/J1oDi//b
	 cDbiUFN7EZjPRJYN9+tLwv4WMqvsAQlW70bOFKvLsum3ribz9Q+X3KiVAFsNQFXGwSElT
	 CvCPeE+M+yM9Nhs4f6CHkcpLFMKT1i+zueQzgQzDV9DIqerOV/U2xC9YwxCOGglK0NBCT
	 aYj2LJRlpFn23XGeF66NmAPAWZK7KpgdG+cF0XpKfzRb3KsPNvox2HXf1WBa1LyIXvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YnsT7tIZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795B606A327;
	Mon,  2 Nov 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YnsT7tIZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DF21F00A1C;
	Mon,  2 Nov 2026 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623281;
	bh=5aIOCZcqu87O19EkqpZIvrj+Agqrn1uk+efFEVIHg4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YnsT7tIZXqc78uk08khE+hE+yjMiIXs2TLD3Z9firSxoWGE8/s/Fm9xDNQhXhKhu9
	 xTSBD+BySDUa+UmRctIkXixiMYyVR0hNpucGKztmJlqbzKOj2ibvPQmjpCHIFLOQV4
	 /MstU2yTy8rlt89o1ctlGFS4cG8Ss/EanzH05ZwedoL1lu4vizk/qiUnOmuGPFoWUK
	 gf6zZC3pRQ2gwSC2lQAxA1aZIeHL8QMOpmDPaIc0X4ospElUDDTu+TOh/ZvgPWdPJu
	 JsplyI+R+FhlMkpugUxsmm2dp94Cc65qwje2Q5ZpMNQyPcIQdiyn2wRz9RG9JiCl2a
	 J83xw4J00ok2Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 85693231038A;
	Mon, 02 Nov 2026 12:41:19 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Shi <shifu0704@thundersoft.com>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev
In-Reply-To: <20261031-tas2770-sdout-clkedge-v2-1-afeeba781cbb@gmail.com>
References: <20261031-tas2770-sdout-clkedge-v2-1-afeeba781cbb@gmail.com>
Subject: Re: [PATCH v2] ASoC: tas2770: Configure transmit clock edge when
 setting DAI format
Message-Id: <179358052171.1776482.549214111862154792.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:48:41 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4L+qDQJEDimg+mExAceBBmw/Yt5RY8rmyLmqt8S3S1s=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetLx3Y3UuX6FmYZOTdmjNYZtWtnvrb11zNr0d6nnwN
 /s699qgjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkJS/D/4SzEk7XFkp7qSqW
 OZstS0xo9N/Fv4VFotzy1ar1kw8/rGNkWLh548PG3LLinPuCZhe3hsxedtxtlues7e6i6567i7p
 eYQcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 31 Oct 2026 14:56:15 +1000, James Calligeros wrote:
> ASoC: tas2770: Configure transmit clock edge when setting DAI format

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2770: Configure transmit clock edge when setting DAI format
      https://git.kernel.org/broonie/sound/c/72da22e9cc38

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

