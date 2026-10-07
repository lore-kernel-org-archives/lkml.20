Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85863D4131;
	Thu,  8 Oct 2026 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443926; cv=none; b=o4RxpC6YWKc2O3WEiBxOgXs5d18Hl1v1ohLsJZ9v2/IxCJWmxVRjDBihL76zEE1lkRXtr038beEWFGPoddR2nJDWDLV4VcN011rOppcWVNq0I+3CucXd4adZBmE6Pa4XbToFTd0uTuXkBf4GsZ0n2YMaBX2wy/pMC9Ad/3dKAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443926; c=relaxed/simple;
	bh=jkEvlhNrGy4+zr/Kw7j1aPz+pb88B7Nghlwg5R4mxEw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YFTDUT485l3r5xhRDub1h+Jp3OYHP+k4jeEeS6AkuXS3VgE3APtjK/A7Av+YIoTNj+ePyw70RkCKWElYV0M8KWLL8vflYf1CqXp60z8baNOxHkQ9LbqaLqD0HTfWlozGGggmXq5tKu6zzasMUtd2boEbosYGOlJVAqSAiYuxno8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhNZ3kZY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhNZ3kZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D248C1F000FF;
	Thu,  8 Oct 2026 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443925;
	bh=bIWEluHy4olmpdCKhHecoCjRfu/n7+ylkyhpZgJoDQY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YhNZ3kZYbA2kvqgVMOMv1chucJFUmlxb6iMyG/JWhON8FRL30yewBlVwIse4ouIOP
	 6Lt9Yk8AeEZSdwsiSgZcBvbge+5Acgn9YMzhJXkxGxtI6UQMU2+P90beYGkXAfeyMD
	 oZuRtxQGMSdCX+ny7/7pM92hPtB5PIwnUnMnJFKRJ434oSt/99MzPUQvzQWLDjeojF
	 sUfVokpjAqJs9jUYhK+wYGNKe3+7Gu+izo3P2Xg/5HIoM4Y8c+6RN/wxwP5Zus9olb
	 wdmY3D8+CarQ7pQqHp+XuD/nOC8mUgNk/DbCnZq+w2z9Rvo/amruLJ2ZZSvAZ3pBJs
	 vsKzgNGPFBJqA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 phucduc.bui@gmail.com
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20260903112739.373621-1-phucduc.bui@gmail.com>
References: <20260903112739.373621-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rockchip: rockchip_sai: Handle runtime PM
 resume failures in set_fmt
Message-Id: <179137153110.2423942.4793821974137109884.b4-ty@b4>
Date: Wed, 07 Oct 2026 13:12:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jkEvlhNrGy4+zr/Kw7j1aPz+pb88B7Nghlwg5R4mxEw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0PQHvrXauKfqKrTsbBnSOe4rrtmP4OQWk+1H
 oVnsF8TNgOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdD0AAKCRAk1otyXVSH
 0GeNB/oDhu8wDi9UdXa53rTKeQkmHe1JGb4K1econGzifJVtnAH+WpdnOAHqNocd973sKbYrYJK
 b6aH18ARbId20iOkmNImVSYBMOXDJSc0sxRM4gzN0FqrIEDXs/7kULaF4e1xMSl0tEk4SSQ/GTH
 fgf//KIHHsHB90pm/nqN3ZOC5tq+o5o8Gde+ATJ3jH9DL49ldBE4cxvOh2FjqgRuzf7Kyz3Bx43
 ZPiriQ1KqDKBqp9HhSMI5bzVXcyjEUdTTgUbIyXNYJlKrsBYMlgrL0c7MnFjdSiCw08qAfuslU0
 +5X7q8X0N3jGNPZUVFh1CtWaePdr8Xr5X+sf06c6USIVyuPv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 03 Sep 2026 18:27:38 +0700, phucduc.bui@gmail.com wrote:
> ASoC: rockchip: rockchip_sai: Handle runtime PM resume failures in set_fmt

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: rockchip: rockchip_sai: Handle runtime PM resume failures in set_fmt
      https://git.kernel.org/broonie/sound/c/39205bb7ed4f
[2/2] ASoC: rockchip: rockchip_i2s: Handle runtime PM resume failures in set_fmt
      https://git.kernel.org/broonie/sound/c/e9eb1854d161

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

