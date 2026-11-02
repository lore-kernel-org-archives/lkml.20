Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657871;
	b=4SH1u3aOdVo6pQ9qFsh2V6KyNjOgdE65ZiJgrXA6liQ/Hj4l9+qXTlSJmeMa7de/lyxz
	 2kJPIUGB+2UXUYLLmlrDUeVx1Fx53b4j20aZalAdZp27Wj84kLhFXU8bTOlA0rTmsIWJ3
	 JZXaYUZ8+Oi5idEVaeaLvJijAMsVSvjz/DcjfD+tesD76XUuDarfPw5gO5EZzfP57sli6
	 eX2lwXqFaE1DXSk70J6oZztIbbpSR0jooWh3SXpNvLt2ZlG/t/f3i4ZlsMeWuQ5RCsKDb
	 g/wueEIq4c16SUNGuOS9iQzIBojj92AcENbadl1eCPKxNqAPVU8oi5jYy19/gUaz6AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657871;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=H7clgMueEvSON7kclP3SNzqVfpNypygmTsnUrvEaevY=;
	b=sQ45FdguA8t6ywwJD0j4VZJSIuwTRdSVQiIyB0pdzdSeNMSKS2SUlN3fCfr8GDmL0rLb
	 FuoF/SbR6CHnCE7IP5yII9g4CUfEchk5Sud7jIWx5Yj8MreljnrpyFQc7Lzwmp+q4kPgV
	 K6tVfhmskf0u018tgYp+RBaz45eZrTfntzGqYyMPHF6F4Yo7zb/GXGQIbLpXY5A38sPNf
	 mhOrAHhtt7VgMciQ6L1fJ+L0uFs4aY/Gnr9qtSiZNffjxCaszcbEbX3quBf8kKRUr4e6V
	 xatWxBpTpuwtz6atfJTIHsjFgGh0mjPbUd2ADY9Z4UCwnlApJHV7qzqyjyyIuZPXoVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXwTaWeg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6B3606D802
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXwTaWeg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370FD1F00A16;
	Mon,  2 Nov 2026 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657871;
	bh=H7clgMueEvSON7kclP3SNzqVfpNypygmTsnUrvEaevY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BXwTaWegeUmc6D9rkHYF0GPvgmnk1UrbsKGzLd9lNblbGkLtlbT0ouP3Gxj/49Xsm
	 FMjsC+xe7FXIQS5QqJhIw/c37vOQm8RWxiR1F+MLwUdA2gB/Xex/QOVWoP9j+uO4UI
	 CthQ0JTG/2j6D5XMa3uLyx40BrSdecnwsDYDJAjZZl4CRVT2XXZVpTzPdBb4XJ77JJ
	 Av3kaKJXwvssJCirFrsD+l7Hm7IvIJhtZNry+xd0gkQC/yH2rWxyks38dOik50w6WZ
	 dlueEA+0nkXBgMaqKUWRF1ThNVgL165/OIDSis5OR8nPMW8LH5qxQi4E/GCLquUaQI
	 UnLi9QnPZiv/A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id DEF10241313D;
	Mon, 02 Nov 2026 22:17:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20261101164405.1743177-1-rtx4060@gmail.com>
References: <20261101164405.1743177-1-rtx4060@gmail.com>
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and
 the VSRAM LDO registers
Message-Id: <179364206047.2092401.8748434363467628177.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:54:20 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/7y45hq/hNgDZqvVd6ZLv1SrHpttQmcu6uNDHAt1cFU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe8vBIP7r9R25FtrOdfNfvKvEf4msOz77R57Rz+dEnG
 36/nxC9rKOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT2dbI8Icr8gpPlOHdqAXT
 pn64/3lPMqvQr1DHk1vSVOT2sizZy/iIkWH7wVmFam8cGidGsGY08H7K3r6oT1P9aMnu91+LNxu
 dL+cGAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 02 Nov 2026 01:44:02 +0900, GIBEOM LEE (이기범) wrote:
> regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
> 
> These patches fix two problems in the MT6363 regulator driver that can be
> seen from the code. They are on top of regulator for-next, where the driver
> is the same as in master and v7.2.12.
> 
> Patch 1: the registers have 8 bits but the regmap has 16-bit values, so
> every write also writes the next register. For example, disabling one of
> VS2 and VBUCK1-7 also disables VS1, VS3 and VSRAM_{DIGRF,MDFE,MODEM}. The
> MT6373 driver on the list has 16-bit values too, so its next version will
> want the same change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[2/2] regulator: mt6363: Fix the registers of the VSRAM CPU and APU LDOs
      https://git.kernel.org/broonie/regulator/c/8aed8b66751e

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

