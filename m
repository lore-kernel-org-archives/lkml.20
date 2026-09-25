Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93D2DECCC;
	Sat, 26 Sep 2026 00:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383354; cv=none; b=cqSEiDewruMjjgHqFooXLal/vzi0jONNcDQzwzviAXDgiSjTmNbbgHQWtk0zcRMDsUlqBI6S9NZ4dXb2Yizv8JFcltgMnzcZNOoR6MR5JLmwBArLGiXcAlZ5TpT3yb5NfMhH6Wq/DcD1HrRldtqX534kKYoUCpZ3mFWPbdXZO5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383354; c=relaxed/simple;
	bh=/LjzesrlcWTd/CH1GZp69Xv1z4ylzcuCNdP97aIc2cM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RqMCMvBXSA/AhNz0U91oWuRZv3Rz+5t7LusLUn7FnOq0I6d2sXjD57X6L1R3I0xj1YJIzUh3xWqemXgl6IdUnmucFhboGJaCt6BvovzH7Yg0w++hLpMuTuIM8w93bqktE0GCqIwMYb+0Ur+s+K01olBMJ7dtyiQ0Jfej1PnPqNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWht8zLr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWht8zLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255641F000FF;
	Sat, 26 Sep 2026 00:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790383350;
	bh=HfYlT1mXmN7hZV9gF/hiwyqoHbDfenk2feT8KXoCIOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GWht8zLr8pm0fNjuXdaTPKwv4p2QKOFi9sFNST4AXZrbl/SdxHr3VsEH/xXrwSZ5S
	 qfn2i3Cbm02X3U6PIXZZfTf1k7xSG34K5rFu8g7UtbQPzc6EOj1XS7kW++FrgZf42H
	 b+Iwh02EJzaBfW6zdVnqsXyf8KfdutClS3YQtCAG+n/xqx/hAjZNZJeOyQDiQNyzPK
	 KARd5Sw1YsctcrTPza+NuCOFjf1ZqDQZjs0bFrlTheKGNdVbHhS3/GL0sTOZBn8N1p
	 Vbo9/CHNmWUBGmncr75MRxHGwgjMPmJrrQwB8I7v1lllniNNb1lhTbX+G8TJYWfQby
	 tYwLAn5+L901g==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Shunli Wang <shunli.wang@mediatek.com>, cassiogabrielcontato@gmail.com, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v4 0/5] ASoC: mediatek: mt8183: Fix clock error
 handling
Message-Id: <179035803658.204944.2406140635443720922.b4-ty@b4>
Date: Fri, 25 Sep 2026 18:40:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/LjzesrlcWTd/CH1GZp69Xv1z4ylzcuCNdP97aIc2cM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtxTxwHnRigYvRJG9MsCfkFpvB7CaB2BWhVxFZ
 b4t+HC/OSiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarcU8QAKCRAk1otyXVSH
 0PWlB/9UKaCd/H5Vsx6p24FjHIzrX3tyxefaspzQHADIMwMo6sNkiYM1n6MBPiFhyar1M5r21VR
 CaFm/5JJuYYyeWpQWapONkoxdrTkh+DxVLE8kCiNxRFYabj3N/JO4hFlhMWIOrYVFq0DsQLBODP
 5ZYO5Lr0bR5KcmVHTpR0dPZ7+0Q5qfWd+N4MnQaVmXDHX0pLQvuf8BTTun8IrvX7MOiQxca/yJE
 cn1Lx6Edqtw2vdUr4yR+6bgBWr0YEG00+UcwFvgnPTyj+PiupFYq3vJ0sDzK2nvjoRVHKdN83kx
 6dtKyc9FCXXn8VlgNjhse8mmak4CWcbcdE3DThw3unMXmIGD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 03 Sep 2026 11:51:58 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8183: Fix clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes and cleans up clock error handling in the MT8183 ASoC
> driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
      https://git.kernel.org/broonie/sound/c/7f05596bd404
[2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
      https://git.kernel.org/broonie/sound/c/4a0f9566ae0c
[3/5] ASoC: mediatek: mt8183: Fix APLL enable error handling
      https://git.kernel.org/broonie/sound/c/30cf48383006
[4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/21cc0c50d395
[5/5] ASoC: mediatek: mt8183: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/f7bcb8c94ccb

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

