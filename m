Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7671649E5CA;
	Mon, 31 Aug 2026 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183639; cv=none; b=WJ3kFvLqnXmi9FS+kNv7xNEzid2YFj7ZGQ3kWWt+8/a0NgwqIQ26qK39SaIXCok9mOZSWspptUTU+b2gkb4VQ2/nyAbh/2ECeaN5R08Ykx3/qJvK8HcNnXwk6qNSiFB0V3EEmmkdZCAO+Tof1i1VM023a7ECmTf8v3e/FTO1D/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183639; c=relaxed/simple;
	bh=RBkE86kZEDBMgrlWJHPlqDaV6bv2GNEOtO69Oq7xVq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ah18VTiDeBdJMJghyKlMn/LGPp74ySDgPrWLukKJLclRDQDTIRIigv36jPbt1myO0vuygUORtTbScPTprdaDveWHVZID/WuIzGC99oK/R/Ud/znwp0jGeVWxttK8HnJDcLeYSkBLor/iEnRjaQ+DavAdQ9nTOfLXcM5rvxtGcVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8MN9aHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8MN9aHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1001F00ACA;
	Mon, 31 Aug 2026 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183637;
	bh=GYTRqz9reQrRANzaUSuksr4IU2wuSDD3poeNmgbVZio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=c8MN9aHsZqRxvQ/jDEbW53cLfX3FxpQPI7Yjsm3NSrDRzWMM2baUcM35tAQBslqCw
	 BxRQrJMSgRTt+LSJsEdZDRok3oFveOgNAHaxcqKsqeh+dOFOPFHJo/HpNteOaCmLLT
	 0ZJQw4BpsoAzUaj5Bjbm9lskX0sR3v6gOd7isx6JKTnA1rkWiSa0aPBoqj2M6HcPv5
	 s/ACdHowDiK9aimJwBZCoQwjBzHLLZvpNei0YEtxEP/aQQZYfyxGXnkUA89joNPQ1o
	 hjpzOTWmM2MIHHTbnyLc/pLAAaX+6eFt8ur2r+CY0wXB4QJfP9LzcGgpzCQMRjVLIy
	 hSVCKy+KGFmyA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260814204536.38010-1-rosenp@gmail.com>
References: <20260814204536.38010-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: uniphier: aio-dma: pass chip to irq handler
Message-Id: <178812782836.13461.12974675930175322499.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:10:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RBkE86kZEDBMgrlWJHPlqDaV6bv2GNEOtO69Oq7xVq0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlYRRFTJNkNYN7XTUFfOphFNK79cXRBcj+Pk+1
 q8PRwANv9SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapWEUQAKCRAk1otyXVSH
 0EmHB/96mN7B3Z95G0JhFaYpi1TladpWrqYB/zXYStSx7ojyAkOZ1ZMzw9GH5LmFEJGno1pvrPl
 n7BdE3Wobs3c7RBiWhu0QLVBdrt3cEY721Z6N9MvIzTMUDhyI4CDTecsjd+zogxbxzF/aSZ0KD+
 zCfRq/LAUpQeWRUyFAMA2Y7R8ytGHZIHe3zCGBmL4HxhFwVYPEr3sVc86z2fgqrUEk/tx/phsCY
 oOtsYGOqSZ7/5Sbee7ceZrrgmNmR5Vg3GXfFzzyLbAEn5HoEuPrmrwwk9zegosM9zIrp4dcraxd
 oSgoR/WqR/jzsr/yvl8dD2Kge1kM3WV+MSv2sFqJIgP8YIMm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 14 Aug 2026 13:45:36 -0700, Rosen Penev wrote:
> ASoC: uniphier: aio-dma: pass chip to irq handler

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: uniphier: aio-dma: pass chip to irq handler
      https://git.kernel.org/broonie/sound/c/a3521b02ff0e

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

