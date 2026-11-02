Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648393;
	b=ktQaARC3zRvpIWSLZX3qV19EG+QoCeDVsTDiMfY0GbuCZGnWmPSmsIvWXiML+Xtt5zHJ
	 IMHddsHwxP3bn1xJAATcMTt1xVJisu0AfYzoaLsZj2xsVpeBv7ptvqUsIWyI9iuTThZJX
	 iroazsp+pVr8w949ZmYMulw32OYgd47o3rPus7BTVrC68lGRNHaUohbN6Pxy5ipU/Ia5w
	 elyRmvVXTakJtm5P8kzmetihTNr+A3QplkTUKgLVAsPe/onJcCvJKSU1xF8Yt2Zo0nwCJ
	 DrGZGdV/TCRKLiTQVFOcdDROeJfPuZaNMwcKhWD4V1cWK2BdWpRcis/4Uap6vxxik8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648393;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+hr47Hk813AYik5NJU+yw3Rz472y+fvQdwF0l6BcStY=;
	b=dNK80351x0t5f4OxvLqmurhXUeU0a/winzdAIeNVt5L/MssuHa70d3I2vNzJwWCDQP2w
	 liLhkUsbllZsv1IMoOatEObC0OMY+L+WGA9HTs1Mqe4IdBVGkAx/3HCA7rxtf9/jMB0nl
	 MRyhd1yuS747hp54Jehu22zBQmU2y95tqKZ3l21MitbBtZHUdoERnCkX2nkp7vOQVR9eY
	 UQ2ewBKnHiZYk3r1vPQRKNFGT02u+Sfw8sG6kAijLah6kxTaOkrxmzOrujRS1ivcKDZn6
	 FfAaUSJM08+TWWe/X6xa7Z/1APCsyhYZRyc8ndwvusZD/7pQE9N9eFZGxWIW9YRkuSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxFetTzI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD1606A327;
	Mon,  2 Nov 2026 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxFetTzI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220C71F00A17;
	Mon,  2 Nov 2026 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648393;
	bh=+hr47Hk813AYik5NJU+yw3Rz472y+fvQdwF0l6BcStY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nxFetTzIL5UYnLxX5DgqK6jlWZuD5mc1zgg0tMiild6CJXEvpGRGc1RbL0gXp1Ngp
	 EQbuJgl56kc607IB6i9lP4VsdBiivh+hDHpnipv075t6XuVOxMyB3Ioas6BJpUk0CE
	 kB74+yTnc3MTF7r1D3WHdCCYwEEWHaUdm1/QophHHDkZEP09x+0oo/7lp9Nr/RAH3U
	 WZzz9dpRmX5tIc5kiGpbP1OxG6vraMSjm3cMGu1CoYb+bASemUo0M+fB89ALA8d568
	 /23c0hQUHuYzVZcagzx7bghyfSL7vTb80voiruF3VBVJmhwFP0asi5HZ9/ylt7xjsD
	 91WVicG1ND4Tg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 6FD1123DFF84;
	Mon, 02 Nov 2026 19:39:51 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
References: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
Message-Id: <179364120718.2092401.6849557179336319452.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:40:07 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pXl5T8gsWLu33daWLNNPPXrdCPSt2HvsP3yyJzfM4o4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJePGdX2PtX/PncCBXdGgbDCUu/SE6tE+/OcuANKPkoY
 5ZskW7XUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIksOs7wT/3BZ01T4Z3eF9/u
 nJZ27ImI6avmnRODFjGHZp1heLm3X4fhn8r6DzO2ekt+6XpX3yz1QvjX0cplh6brPbSuZ9nAv0h
 kGz8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 30 Oct 2026 18:14:56 +0100, Jerome Brunet wrote:
> ASoC: meson: axg-fifo: request the irq with the clock enabled

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: meson: axg-fifo: request the irq with the clock enabled
      https://git.kernel.org/broonie/sound/c/82fa7bfab6b9

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

