Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A23499F30;
	Tue,  1 Sep 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286847; cv=none; b=fGolvlhO8qNVE9ax4L45nnUnnG8aC+D83I80cqkgVnvB0KBtwUCqw2fGD1wSC1puMsU9kj3WQr7xdptymrJeCbB2Wdg0biPIQHF6MiEgmvTRCr5mRvjEJNaExila0visjpJqsdfX2bnkCleEIvUfrqORAB+occ9299cc0Gj9uB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286847; c=relaxed/simple;
	bh=zMAznwTrjGlv6LsHPtXbJmH6HgxU8Mpga2sT8tWq+To=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IQH2Sk79yeZJEHz+ODxsiUQ9zGLy44P5NF3VRS0hD1oAHNHGTAhY6kMjCugcBIq2kQLclecwtZLs4nGVUuCkdYkxJnnvWnUHtdshMHBp7aj2m86i6vmjXRCKRWGat0lEdRlrXuSG1bWjRYmL7pCnttMOmeMKcUObCgmRykFV51c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLAZQFQq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLAZQFQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6904F1F000E9;
	Tue,  1 Sep 2026 18:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286846;
	bh=1yh7XuHloez7+OO+Q7zttgY4q8xC1jjwMT4fr0NaBN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PLAZQFQq/Qu58bCbYoRk95ITvXMNNETa1KoERJjOXKNiGuj4RC9stccis7uZiy0DC
	 a/JgGtLSetpB2B8PYnPP3nPRuhfMu3VQKxaAamnZgJwrvJLnAktA9yFdHcs4M3RxAA
	 J8KgWD2SJmc0oDjXUHj/XYcJmNXfoa/zBFyoD3xQxBm2S4YGRk4IwCqqPpscRRkwWp
	 f5SkuiQDO3JnH6/u8sbRrzhl/8nofkW29MSfXGUJcxyinJT/amciv7/0ppNJL8gzfJ
	 WWREFpRQLQ9QV+cBzajHhO2ceSG1ZAT42BF8rWsD63DTUMVoIzQ/yALxA9UPD8LYPJ
	 oxHPJg0ZRiHFg==
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, James Calligeros <jcalligeros99@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
Subject: Re: (subset) [PATCH 0/3] Enable shared GPIO for Apple Silicon
 audio support
Message-Id: <178817837781.5427.14614213924415204585.b4-ty@b4>
Date: Mon, 31 Aug 2026 13:12:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zMAznwTrjGlv6LsHPtXbJmH6HgxU8Mpga2sT8tWq+To=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxd515re3aOu94/A8T4lwlDOihUI8QnVnRuZk
 sKmdaAEUgGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXeQAKCRAk1otyXVSH
 0MIQB/90tLoiF2P3pn3sdLzvnrc2QiH+kRCxRWY77pZ9PN24aXxDiu5L4uxD7xwTmrGfg7SL1R9
 kDoVs40grVeR/CMbhRZIV7GtfqmKicgizgHgUobp33i9JOl1YGUW0T4kkw4pE2dglRMZED22tzc
 YzzBZJaTH0LTJCJ8f39Bd1knuEF/4HX8lgA2QxsHTReo1z1bVu3Is870k4hVM49ALqvnnkd9N/v
 1hrdm2378O1YwubHAukbZN/3oPeHF9Te6CXHD4trcN1Kp5zOK3BzpCMl7hVjJjpf4cvTsh8X7iw
 ZNjna0t5+jkrgIDRJbDwxuLyIFLN/Oh7ij2JeJvdRA2e/m4D
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 31 Aug 2026 21:32:38 +1000, James Calligeros wrote:
> Enable shared GPIO for Apple Silicon audio support
> 
> Hi folks,
> 
> On Apple Silicon Macs, every speaker codec's software shutdown pin
> is connected to the same GPIO line. This line must be pulled high
> whenever any codec asserts it so.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[2/3] ASoC: tas2764: Initialise SDZ GPIO low
      https://git.kernel.org/broonie/sound/c/e152ac60589b
[3/3] ASoC: tas2770: Initialise SDZ GPIO low
      https://git.kernel.org/broonie/sound/c/87e41baa36fc

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

