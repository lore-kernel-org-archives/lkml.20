Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9B2322A1C;
	Fri, 16 Oct 2026 00:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112350; cv=none; b=MhMRGPmgtUHAo2ctqB2NwpqGLMsLhykdvxzT+3iM1kghuszJKQLga4sh4CZo+SdUV9URwM8YCZdSW0aFCn4HKEFAHuwRlWcwGXZt+522riQ6Lb2RS4ls/VODBFEXy1L5pUJuJTtZ+tX0JszfY6Q5B8uA8EN8lN4ersgi6d5OlY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112350; c=relaxed/simple;
	bh=Rf7Yt4Ju4mTE1WETnV6s1Vut9DdADKeEVXLimZehUSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bnD01X0Q2qdJzVS+l3zPS+l9GZNkS6smIZIFyfEX6zotzpYw6VVX6fdAMLPAniJr1nRUlreilhOUCwFL355UklamP2SG9uTptI4lXGcKR11P5v8flcMj9GHuUiVUMxA/PPLAO/uR0RWTFryUxqfJBCk+u4VAXdFW2lXa1bPrSVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iim7+GSz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iim7+GSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912C91F000C4;
	Fri, 16 Oct 2026 00:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792112349;
	bh=eItMnpJmHUYZohjA01qEtQ+vtbYcQn+72+14Xb+rD9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Iim7+GSz/8nbintBCANlpj3K6xBgsU6QMWt16WkVYJ/huzCyhXSfoWlf9MxTnmt8L
	 JFQGUtHiX8QYwIL6AAm8v9w4klmRp7Zo6nj9Iv8B13Yyt7K/BuivaggoQmGtVjE3if
	 4JY2Gut84cu0btfKX0SCi8uXdAT0VcLWYvW5X9YdSYZkHdcxXgPcdhRXLUHH/gpCFv
	 J8VRspBpou7i8w5ng7N1zoI65vAvv4PyrkT/W7yjnVvLlO7AHtbtxEQ1ZLPrYGAurF
	 spFg9ihtGzW5zaivF2IGtY8XQ5ROxUxaVAnKNb//AfAyvu7vGXf9ToVnv5nwI/9qTW
	 JUyXuqDsjqtsg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Romain Perier <romain.perier@collabora.com>, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008181459.2762862-1-vulab@iscas.ac.cn>
References: <20261008181459.2762862-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: rockchip: fix device node reference leak in
 rk3288_hdmi_analog
Message-Id: <179210073217.134795.4749610519691581859.b4-ty@b4>
Date: Thu, 15 Oct 2026 22:45:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Rf7Yt4Ju4mTE1WETnV6s1Vut9DdADKeEVXLimZehUSk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIult3kvp5RvEg96c+Jpcwzn9edmiwy48a/56v5J228n
 79gg/Gu6x2lLAxiXAyyYooscVncL+tLXq/hO7iwDWYOKxPIEAYuTgGYyMEEhr9iZyXjLqdszOJy
 /B48z0jUg3NHwDwtT8tXcmwi21TCNLsZGW7anehfHZZi02/27O3lxTZHGNfvsXe3vPrWP/fgVyd
 fFWYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 09 Oct 2026 02:14:59 +0800, Haotian Zhang wrote:
> ASoC: rockchip: fix device node reference leak in rk3288_hdmi_analog

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rockchip: fix device node reference leak in rk3288_hdmi_analog
      https://git.kernel.org/broonie/sound/c/f15b2df0b940

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

