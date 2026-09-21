Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F6A3C9EE8;
	Tue, 22 Sep 2026 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064588; cv=none; b=Rd3MUJhSyVfZ/xevtcKsP4j6MPwU7idDpOun1AVUFuTG4RkNMnv7Cz9PmXkJRKRPMyOz4Zslc0NUZWEzk3cljntqW09W/SAld0DeoPMY5V12JkNqiPNI2p9kW3epyzVrmcC+52sXX/x6FLqsYW6LnyBoBqwWaC9bBem+OSlDzpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064588; c=relaxed/simple;
	bh=PE3GG0Zq5GHW1YBmDAj2j/TtiioAoG1QPWaJakB70KI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uoBI8o7qa5/W4UFxruXuVZ9FWl4ogowXeRGm/VUto0mru1F/4AvxYY1Iu9C373Yyad8+aZwTpEXr0i5bQgCxMa08I550XRrIOnAmFM+B1xfFk1ZMuVskSPfRVAtZO12ajp6i1acyI+aQJdTXgQAH0F8CuC1n6AJZrFwAvKFopyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evuoaw48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evuoaw48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0831F00893;
	Tue, 22 Sep 2026 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790064571;
	bh=yuzBlTjpEw8mcDMgWo8yHHOE5R9PctYKJSKemWLS04M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=evuoaw48sjHqCwQlD3Ol7VFjPdSkgHkxnFzwDxdm1YXsK3pFPs8S+y0NBfcCOCnt4
	 g98JL90GICOz+PQbNClb9/Os6k7Jl5lXE1YaTY5+8bnREdDYY9tTDn1ts+nSaVU75I
	 WCx9oqNk+L97vTImmWGpUfvCMgXynB9BZb5n2b2mJuFAe0OfjUQEfP+hzf4GBNeONv
	 Tx7yNqS85gVL86bxjz/IrfIkj1PwrTQSmeHsSlito38v7N8bBdLr2SfefUpGxw7KVW
	 pTm7iM2d922r/BpOwsOivVO9+sg8mKTXr0Z8BF0v4O500WxfDOXaJ3KkdGQK5ATzmd
	 UXZvtUHJBn6ew==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com, 
 henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com, pin-hao.huang@hp.com, 
 Syed.SabaKareem@amd.com
In-Reply-To: <20260921111930.1040-1-baojun.xu@ti.com>
References: <20260921111930.1040-1-baojun.xu@ti.com>
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status
 check
Message-Id: <178999389109.228132.12605131138902969199.b4-ty@b4>
Date: Mon, 21 Sep 2026 14:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PE3GG0Zq5GHW1YBmDAj2j/TtiioAoG1QPWaJakB70KI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqsje0e7FPCt+5+tqc+eXlGl4kmMsdq3TR96zFC
 LXnjfICPyGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarI3tAAKCRAk1otyXVSH
 0MJvB/4uPQyONX2riqUi9iJZDL6jxuXRvigUM1Qpsul9XOf20m8Fpvt1NWd36oHNLZUANXhjg1V
 cQsFnpJcDfbL8mNZjj32Pmw4xoU17ubgWzCDtDsWP5VOWXUYSDdXlgYreN6uTCK8SwWEVd8Rsbk
 zrs56ZJamOE/AXQGLtm+dL5/rXTJpSbT5yNMLhS0fgYGMVH6M7EkhvSNj/PEj6JnGQ6pZZNWwZ8
 yaOLKEtY+ZVnRr3BgurwCLzZgU22n34+as4Pa5M8mP8AOVWOGlrDKQnigrfJG3Fa9iVw3cqos7c
 Ad1ucXsfcRo6QJo3rEAbx8jE7z1Mcd+vEsTyGLEJDY2oQV6a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 21 Sep 2026 19:19:30 +0800, Baojun Xu wrote:
> ASoC: tas2783-sdw: add firmware download status check

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2783-sdw: add firmware download status check
      https://git.kernel.org/broonie/sound/c/f42fbd560cd8

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

