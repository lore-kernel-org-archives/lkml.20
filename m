Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A680569F36;
	Tue,  8 Sep 2026 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888478; cv=none; b=CYUJit1vjjuZ6/S6iCYU+/2B0jwnT1o0rdzpOv9YaMtv6Pl+IG/n/iuWns/LDB7T8FKwZdQdLvoMsp8WylLDclPEgt6/zonCq+WHJMkWxfsHJ9SExukuc6PdumAnwIZDBxh6lStT839bNhx39smiNa7QEQuUnZKccw8zXuuqzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888478; c=relaxed/simple;
	bh=01dkiHqX2v4Ffp+nQXUGYU2vuj26ESgNt5a/i4S108c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RVr4ytNYW5LW5M7aM8SpVYovUR7LJ4ZvGSvgQtzXB6lQQcg68IJW1z6/+C2ESYA7/Ug8rHAERa2boi9dZHjPLPFsi89OJZ0KLsBZ7Y63ziEolm8KJdqubG+JGd9uEb/xN+mVtfwekcolgCFisVQWCule90swBwXAMDSjYl9fZQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwPg89nn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwPg89nn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152711F00A3A;
	Tue,  8 Sep 2026 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888477;
	bh=Ets4uTKkXyNkTovvlm2LamMg/N1Srr9yc5R7205pmws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gwPg89nnibBa0qHDxWh1dHkW+I16J3thSEpKBPNpx/ez1iTzaPI6GVdFP16lBGBpw
	 RszPqfDkRF74qQnXBWAhf/Rp5CDA0AmpGbFq2BuzX+LzI2cvZa2oGXyynbyRGu7FyG
	 SU1s1EuMLHuCwjro6hBZCUwRkajYkxgbxKrodgznp76JtkpUqoxez+BxidVjjet7V3
	 WUiDHAbfkctmpCy9Pg7zbE4kaZhShcJ9wfFodR3OXbAc9NVsetG6h1wB0eta2wcPpd
	 dVqWGSng9Ak+KfA9rfRq1FP6KFsUnBQRwwdBk/IN27wTSOibOCmBXMr+FDlKIttbU+
	 J7HsmfyRN3USQ==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v3 0/3] ASoC: mediatek: mt6797: Fix error handling
Message-Id: <178887711876.78527.15336463917556288176.b4-ty@b4>
Date: Tue, 08 Sep 2026 15:18:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=broonie@kernel.org;
 h=from:subject:message-id; bh=01dkiHqX2v4Ffp+nQXUGYU2vuj26ESgNt5a/i4S108c=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqwFrjO85unGxDwS0zkW9XxHDuOBssZrR+z6clT6tj+9c
 2xKYlZrJ6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwke257P/sfFKS0i67X1i8
 QI7TUstl742dpyco8POxfNA4sdKu+k2R2Z1ptoG/Worlwh99S5tyrnyzbd18f92ItuvN9bfad52
 KOtQU2r/Qhefg08UhDskb9/B0shsZvBPfNUOo1ay/xbUpqjP2oM22mv9PXzMK+meY8tcIKoUs+6
 n54muPmB+HrXT8S6+c7NKE6Qk9Queeec35GqJnq7ojTWjtBePADrcKqc1VPUVVpXdqEyXrQnYJ/
 WrYN2Px07jGmdcfVrLs1ldxmtMt/02KT2PrxTn3bER/sX1qkbzheUWwLSnk98PPdrcdlN8ExhTO
 5DZYHM7OHv3qX2GZ2aJ6UYX5Dw4z/UpINM6Qft5qPiMdAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 21 Aug 2026 19:28:37 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt6797: Fix error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes and cleans up error handling in the MT6797 ASoC driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: mediatek: mt6797: fix wrong unwind order and error code in enable_clock
      https://git.kernel.org/broonie/sound/c/e967d479b65c
[2/3] ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/2e4b0d5f52da
[3/3] ASoC: mediatek: mt6797: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/1e5e1344b36e

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

