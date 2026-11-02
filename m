Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657870;
	b=KmXmA1hBufuqma9PYPXmx7Jj5sjP09PqSXiBzjEPN05g4kBrhlmuft2OUlivfDc0Li5N
	 U6Is727PJ5uprISkCcXlViFuRV+vsMoX6UjxUwhMgtn6+cJfLoZdfOVUiq75GuJkO1rv0
	 N3yuEAChQZXtkZNAx+HxXXKXx8c4G146PwUWSSe6pD0Dn/q0suBU5nbBThkEx7pae/Nju
	 pLW9pJ8ayD8RiZluo7OIyrcQSCf0ypaDak9L3pNk+FaLKsMZmkrczcXm9+TKkJmWZu+Mr
	 usnOu7Cttw+OZZ+XoYaoNbLn7zgPOsCuVtt7sinv3FNn6ekPrlDzU1SMq3onpaoDVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657870;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Brz96hdrz7JmspNQJhcUGehhAL3Axu9lJW4DP1KRAJU=;
	b=u6iTVwQyDIzMSATFHk47YHrlnPdCEZgK37In1MRI/N/yAvwV/wPvg3epEus1eQenWGYS
	 TUoAybZEOzJXUmg9m1wRdnbVwt2BGn23jw7A6fEoGDxP/Xs8wznz1ZaqHKeCDW4a9EGBH
	 i8tTcrLazLdqg1hYbjjeWPUvR0q7TKtQSrmmodTCuRP7xhd0ZQhXsfPIu12p0wYYNHGYa
	 zFe8zKeA3w/j5qgbsYNZj8PqgMhTzw9AyYoc+YxIMvrhElCGpgD2a62uvq9O5+NfiMc4r
	 gCIM3K2S0IllMPA/Th4BS1UJWtIOVSBr8vF+91to49BizzXQ8bKq3BSFsd3Uay+G7gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fP4sPoiz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4EE606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fP4sPoiz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1341F00A16;
	Mon,  2 Nov 2026 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657869;
	bh=Brz96hdrz7JmspNQJhcUGehhAL3Axu9lJW4DP1KRAJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fP4sPoizrBM/sWiBFzkBJYNAQTHXV/XetlGDejSnEpjVVomy3GD6vhS/mWLIC8a4e
	 C2E3Kex7mvSHZrkiLLHFJbjDkKik4t7rFvjOH5hAhE1JL5kCxfX9B1Tg0FsjmjV25j
	 6jCoOoiD7NmbJjP4kkp1XEbmFeg45bl+M6YW7B0JbjYcN4keJNL1u7L7tcmvo0EclX
	 WBvOpazth8Im7O8BYEBGJ34zACJPCspJ0gaoQRmwbra4e5BuHd4pzIphYjmixcvsQX
	 PiPkkB+5G8AXOqj/H+edwPLtMEdejt/WE1YJwUjvDc0ipWKIOCpD/8GFDAQ5GT70US
	 EbR8cKlaqK1IQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 0F59F24130FA;
	Mon, 02 Nov 2026 22:17:47 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>
In-Reply-To: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
References: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix register access and VEMC
 voltage handling
Message-Id: <179364259247.2092401.12751625536535103016.b4-ty@b4>
Date: Mon, 02 Nov 2026 18:03:12 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5Lsk5k8uWhWpSMVkEic8ZEeUQMXxLY0HlzaMYJ4qUm4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe8rDcubZ4o4eUXPhf5/9GAZYSTNNmXzkqNvFO7QI9P
 /Y/K2TcOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARuV0M/6Puaa9YEx8bvjwl
 gTPpytPzv+LSBFY1Bgpv7krxTHbiYWFkeCJ5s8P5ZeMFqXcrTZ489+FMelk6IWhhy4/Qk4ZaH6T
 5OAE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 02 Nov 2026 15:54:16 +0000, Alexandre Mergnat wrote:
> regulator: mt6363: Fix register access and VEMC voltage handling
> 
> Testing the MT6363 regulator driver showed:
>  - the VEMC (UFS VCC) voltage reported as 1.25 V while the PMIC is
>    programmed to 2.55 V
>  - regmap debugfs showing each register merged with the next one
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: mt6363: Use 8-bit register values
      https://git.kernel.org/broonie/regulator/c/7318d3833067
[2/2] regulator: mt6363: Fix VEMC voltage selection
      https://git.kernel.org/broonie/regulator/c/a8d72f246edb

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

