Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C1B441027
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363264; cv=none; b=JeqDOR/WBk35CSUsAJ1oCHzP/f+UBaQc1sQ+VEyw21UKRe8GgCR7prU/SDzKE6/E7ecLgDXty7Doly/UeNVz3sMkXfCaqoxzUX1+rBDQz8lm+1EccqZW2VPl5vSWiSpnaLZxOpc5SulxZbr+WYwcglee9pjrWXZZjI1RAEDjhBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363264; c=relaxed/simple;
	bh=zRVcaemvTXGN2bgQi7y8081cQVO4m1OogkEA4cAdlhs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SbI8IRwKVfyI4Gt1i6bPPdiDMoUwyQQKGWj/Mp4tsa9jvzCn2Hz+uPlMrSGSPjVS/0Ss4JBNOz2zCZ5jM2xRNAXga4bxliTYZ7mHd1QrNYefM7Qoelrhw/KQrI1xBIq1m49En56a7tB0+nBXcSOWMHLPC+R8dY5CHPaiHVFhCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNdlpKWj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNdlpKWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3D11F000FF;
	Fri, 25 Sep 2026 19:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790363259;
	bh=YP0jp5v49HBfu/4CPw5wckFxck6BRjFdgu8ahuF2rz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gNdlpKWjpharo2pflu9Hw4lNxfIqlvjDea5O8EddsOrfVXoqpnclBrORkQJdxHUBR
	 rH57BTI5njhcoUt5Vs0r6QrVUT6Bl73M/XY/T4wzTwtO1V7iuomXmpCRK0J/Fhnyf6
	 UcfgBlsIGyajIiLBGHjLA6jd87r0YHm7Q8nqQkoKJpSctFD5InpnOxDcRsvxnGA8oO
	 R1EHNb/kYs+2s7SQ6NPXDwcOMB6laaePrYCa3FTZT3YFuxS9TYFSC8/3UfS+yAyvxx
	 kilNinZVaCEPwIzQd3OYtmTXVLVJEJNrWHtoiRwaoDoT8MQUbPZYtd+dNdh9sC0h/j
	 GFfoMk4N/wxZA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Yeh <justin.yeh@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
Subject: Re: (subset) [PATCH 0/2] Allow mtk-regulator-coupler to be built
 as a module
Message-Id: <179035830762.204944.11395615043279520095.b4-ty@b4>
Date: Fri, 25 Sep 2026 18:45:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zRVcaemvTXGN2bgQi7y8081cQVO4m1OogkEA4cAdlhs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtsZ2iAa86OMZgcUEc6IZB413rreoq6GqVNrU6
 zs8EXGoVjWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarbGdgAKCRAk1otyXVSH
 0Mn5B/sFydko7wvhS6Bfz021cH+toSSqYBm7jep2sftGtRTB3RZKnCTUgWyt1GjP1Ej1hrYkVzI
 n1dR0VJT1a9ecpWC/5sv2yuo3r+YDk24z4mO7AqsvRRq2yZXjYKvfqsQxR3j24vqID8S37i6Gx9
 fcG8sE5sARRaXi9+cHpvQ/EoyS20V4JVofWjKo98NCFoglaSS6gYnOukPSgiZknPEjJ7aObwTHP
 2kAkTCvVCdkYtT2amoGbgzTm5iKaQucZrm5lEVNow28Di2RKbiZiCIJw9MqUk/DO56NARN09/fK
 3nJCmgq7pqk6fca4sadAeGaKRCoHRShimlvxwMh4wSI9nAnY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 03 Sep 2026 14:20:45 +0800, Justin Yeh wrote:
> Allow mtk-regulator-coupler to be built as a module
> 
> MTK_REGULATOR_COUPLER can currently only be built into the kernel: it is
> a bool, and its prompt is hidden unless COMPILE_TEST is set, so on real
> MediaTek configurations the symbol has no prompt and is forced to its
> "default ARCH_MEDIATEK" value.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: core: Export helpers used by regulator couplers
      https://git.kernel.org/broonie/regulator/c/59951bd9c6b6

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

