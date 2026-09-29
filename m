Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884A050E59B;
	Tue, 29 Sep 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681422; cv=none; b=sT0uy68tTqlGHTm1SbJyzM3NMNqMCr2ghDHaN6z0WWQRQzlUmyd3sZ32V6YbW9Ohhu9VdiyvKlDDhI5UIPcLu7Zs8o0dpcZl4H1z17VBMzAgXFaor0SoF9dhY2IV5/Nu4NzzzNE7msai8Ycz/JaYVJh9s1rdV2CORC0oh5HoyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681422; c=relaxed/simple;
	bh=VVsdrMFIRB98uxa/LlccOdB2rtqwWe87UUe6+AmeVpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CHcxL2Nbai0tVgXK4EplqyXteetcEUAtERkZk1WvSeLX4PN0hRdQ22H1o4sHqNpV91z3SHdTSjEfNZmQ7xf72m/+hOL4TasXOjZN8D47UE5WbdQOhENxJTPsyWnvJm16BQhQWuG5tfceFEPgUSkEHCpp+abqXz7aFpYQhQhBnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hItW585s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hItW585s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0741F000FF;
	Tue, 29 Sep 2026 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790681421;
	bh=202PceNA4mgm+8gsK0Krd58dlYSUB37NGsnHorEd2N8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hItW585slob3QBS6P5xzCMG0vw8GN3aNzq2Z9nwKqB70HAFmlvYeJoHa1y7vBgRqo
	 OLtNP5J/MRh83pTwAtZ4oMw4/zd5Gi03Wq7eiu5vo9GRhmWlLx72irxw5RkiOCoZXp
	 bo1Td7MUryU94GRk+v2UHvSUJzru2IZafFaepdF/VGpf/tSzhFO5RNJ9IfmlWWVwCo
	 NR+qLbPqjj1QGzm7uMYFGAbYftl0YakmkfWN0C5Q6t4OQOsUL731uaAmGNkqR6aas0
	 3ULbHCvTT1gCCNoffSHe6LTG9JPF6iurs4u8yPdb14IgCPA3wSXmGCSQXnIwvSI12H
	 gEeZJLf4JNVYQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@oss.nxp.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com>
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
Message-Id: <179068141537.159801.4072628732064323719.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:30:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Mon, 28 Sep 2026 14:17:27 +0800, shengjiu.wang@oss.nxp.com wrote:
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_asrc_dai instance with an array of three DAI
> drivers to allow up to three independent conversion paths to be active
> at the same time:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/5] ASoC: fsl_asrc: expose individual DAIs per conversion path
      https://git.kernel.org/broonie/sound/c/6aef9cb5c797

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

