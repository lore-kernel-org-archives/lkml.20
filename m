Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930801;
	b=EoewmYXRCbNp4cfMCLwBkVd6vVf4EBHKjBfd1yLWsZo597FmDctRxXT24z0JpReL7TBX
	 9W5SCGcUfl0JJGgOWolTgw18Mq8Ma/86FYfanO/KLVnX6ZWz1zKmvZIBr4wMGfSyulAu0
	 AZomad5O8x2HMbvbsu9vOGO+Ajlae3g/XiC5Z5NzDfNPAb94o1rrdtgnO5rVxE8nk8UPE
	 p4lgGOx09ulxvAL1k7uOaboPo8Ym78kTLSNUW/rrrTHS15G0SyPPW7bMh5HJpwuv9h3Rl
	 ckK9eZGiI7P2JywbeKdSu/H32Evff4NuaBMVRBPQXNaekIjBl3PKzEVJEBVI46jUQDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930801;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PVUnWOY1oKAdh7awUlXndIJpcVDctN7Sa1qH+dqbMJg=;
	b=17/Turcb7AX1j4HVJKYYO/SwWf7frKMFCrwot2FI6byeV9HQVclVfUcw1gKEq3z4PtCp
	 54ryYSV/2tpxePW3Sqe9Kdc3KWNytCBlaEcDGlu0H+1xAD2xMUxpEpju7+e3jfFv85p94
	 U5dEUa2W8XxVt4r6mO0nwYMVDu5WF5RAfYkhRKnBg65d8kchgVh0cTSCnOFdUNYTgWhNP
	 Oa+Uj9EbjoQ0ssRljJAKv9aHkA1UE8yvLFS5J77W/CBQEfM7eE6U1zGXaki8v+z2yfLq3
	 IjcR/rKn6WPVWCl2TvbVaVW4YwVHVuITTtB0Mdvxz+8caZQiNT4ACsRqf0Esvb8yLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2Q6Xvl2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6681606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2Q6Xvl2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE801F000C6;
	Tue, 17 Nov 2026 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794930801;
	bh=PVUnWOY1oKAdh7awUlXndIJpcVDctN7Sa1qH+dqbMJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H2Q6Xvl2S2NMKZp/x9XT592HqCz3b7BRDK2Xb+ACvXR0lB6Z6v5mG2f1K876KlPlo
	 4zNj4pX2DVPlW+zkVn2fYE+I5GWg6MYw3qGNU5etfK0a3kvgzZlbG1bBhqA8qGBch7
	 ANOs8HEt8gdA/Hv2UnQ/X2J9+QhnR5EN708bGPNIuMvc0XPyYYnBZ9CGf9BKUJ9e4Y
	 sfkbSoafnOhNjzS1/Hosy3ehqKKOBZR5qE00GRrbFj8AVmiBV+dIH4LKElb836C7Qg
	 OReMSVgLwVUkZz8brIJaWEdbLm2NtgLF8ztVc5O+UZOOgvY3wtc3umymRTu5/08sTG
	 wPRDZJMSD0mcQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261115150758.16650-1-jernej.skrabec@gmail.com>
References: <20261115150758.16650-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] regulator: axp20x: AXP313A: set ramp_delay
Message-Id: <179492700257.77896.18073194159004452821.b4-ty@b4>
Date: Tue, 17 Nov 2026 14:50:02 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sKhsbVaTT0l/Abw+q815vyjpQfHOS758n94UzhXT1Lw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+VOQd0/XmPJnwdUPi974f65saJtndTXiQr2d75txs1
 UXFnU8MO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRH9KMDG8i96el3dy7Sfsw
 Qwr3D/9ujbb+HZMW8IZIHGt7uf+O8xlGhvO7T81gjPTlO9WvtT7P2Tjy16aYX5Y32R8LTn6qwbQ
 uhwsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 15 Nov 2026 16:07:58 +0100, Jernej Skrabec wrote:
> regulator: axp20x: AXP313A: set ramp_delay

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: axp20x: AXP313A: set ramp_delay
      https://git.kernel.org/broonie/regulator/c/29219e5254ab

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

