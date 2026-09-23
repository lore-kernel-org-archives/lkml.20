Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A43C1D4D;
	Wed, 23 Sep 2026 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170171; cv=none; b=PiTe+1rkZOGGqNmUsA4FEwdycm2RGf7OtqfQv17RwQm2TQ879NthFJCY/NOdS2okKrD2LW7ss+gRUBLYNF9TpSjylBnJznvYIu2obeY83DLO+bRCuxr9EBV1j04MrZt7wPjus6AMqgswBM/ra5saB2Aj0I681FTpHyHFcksnB1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170171; c=relaxed/simple;
	bh=uujgvklY7PATqYba/pben/w/9c2gUvK55dUyGu3mrqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mi36KftKEPAtax74CeH5YmFZ9wK65UV5h6a0nNR0nGks0VgPFrFG5oENdgZkmSq5aRxjVg0tdGyvefZdKRxLI0PSafHHxrGXpv8shrcoLD0XTpIrgUMJ3bFPpOb7cquOHDE7IomTSEU3DrQmFK9nlSxWSr92cUyCxDEkR8g58/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BX8OYWNe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BX8OYWNe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570301F000FF;
	Wed, 23 Sep 2026 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170169;
	bh=Xs5gJ/grQyDHbsgJ1oP5z0dJ2zNZ69341O6C0BuvK0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BX8OYWNeIBvlZm6TKh4YFb2Ly8T/nWPAMiN5+HqX2KOGKQVoZ3+n8GB08KoZqkFS1
	 6yNgTarln794eLL88NL8/NM5t2LKtf/JOFK4kUHQyU7qECMDVXGKDq9y+VQ4rAXScc
	 6V9ZACxqdxznVPGnIUWEUebwxLtcrEZGmLxaqU+cMP+e7Fn8SGvL5WrTfVSqXnJDVX
	 Z87w+CazsVRui5GBdtS2VJmit59hyampAvHTTlBm0bDsGV7/w6bu7+jHkKd1Tf6AOh
	 LLf4xXDhS/iSf2lwH42kVGf9x/diFbUdUachR7fhG7addlZA7TyWPkBgDPljmbDVcf
	 zZU+tC07d1ypA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260922195502.818012-1-robh@kernel.org>
References: <20260922195502.818012-1-robh@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Convert
 mediatek,mt6380-regulator to DT schema
Message-Id: <179016022040.322763.11628592193956081664.b4-ty@b4>
Date: Wed, 23 Sep 2026 12:43:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uujgvklY7PATqYba/pben/w/9c2gUvK55dUyGu3mrqg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqs9QyApAIsRHkrfGa2QTf/4yUUudYST775JeNL
 R0m9o1xu/OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarPUMgAKCRAk1otyXVSH
 0M57B/9Oo12YnBveuP9UDqL2bseU7+s9RLZ5C6h/ZoXi3rfVfaaTKkUNLFZn7lVrgDQL/9wTn7t
 X3/GW+MiMJsmNsDihxoD+Jfz9X1qnvbvE7dT09fDoG6MazFiWC4GI2apjbZYDpuJnzIDnIkdJSU
 P47fS5hwchWaBErnlBT1jBiLN2SwOM+ZCmMGA6Cn+4hWkDrfV9S6ZZXDVzEqnrXqBzzZr3r64V2
 UkCxsXrrXlDwAWeEXn/wPjXHG/3K7eXACPJWTVOpswFT/9v/yWSwO7BP5VymcoxO9nP3P1sgpU1
 3xx0l3Irqq3FnGxhRtw6jUXnBHkHUQ/ZrArqLQBfRoIhOWex
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 22 Sep 2026 14:55:01 -0500, Rob Herring (Arm) wrote:
> regulator: dt-bindings: Convert mediatek,mt6380-regulator to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: dt-bindings: Convert mediatek,mt6380-regulator to DT schema
      https://git.kernel.org/broonie/regulator/c/22fe14c9bcb6

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

