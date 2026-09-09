Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54432136351;
	Wed,  9 Sep 2026 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969177; cv=none; b=SAHLq6UBhZ7RcZTeCP7WUmA28cHDFRTFE2ngyiUlhq+dVIhYT97SxMe4MoNgw3gnfXOkd334ZMIVhuvaRYuZp2/6nugUdrtMOixqQsRD9nPyBaUL9hYkwoBI4OnOtxzXLb+fG6s7SXk/PSjhGESNRkgpoNb5OfXSvaEw+2SzZ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969177; c=relaxed/simple;
	bh=O5wSblCmOzD39z10VHczozGyL2EvElipWhexqT3qPtY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cS//w35WidWVSbrFR12fgn8e7nhaSu6bjXhsiyDLMT+DDRlFWvEAmKSxFQSxT6rOfyTbXosDGLZXU+Xk6leOQktcQLvnqQDTT3t0W8LNK6fCoRsUoylT98Zh9pgr3mKuZKK7MDZk/uiuFhA/bnoD2V7qB98QoNO0DhFC0tR9dAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzI7cyJH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzI7cyJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D7A1F00A3A;
	Wed,  9 Sep 2026 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969176;
	bh=DsDSJS01IbkhjMeFElcc+9XO2Zj3Kh+dJ41DXEdcGJk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MzI7cyJHJrV8ITQYMgQFjxC0Y3+P4XOK47+GJ3dPMhWLVUXLjoczX2XVva/QZz0O8
	 K5CYbRPOVtoJda7RDj2IBGBgbnw1dbcu+f6887EykOa2qYgMvCSkL7X0T5guHdCPy/
	 2fmzYZgySTWafCClgqEC8Dx79uNaSH96fEC2CJ7tnszuesj8lh/tRn9TuhxZEYuW6y
	 KAUHEaE63zxJ6Ohs9xNjl8SIjyjwD20aOUQFVpafUVg364yKSWi/ktNsoe1TXtQQE/
	 0WW44ULPwnk381tUNgV2X8dCasr+kmOmfJgcUkGCSSgi7awZc123z9YWWkCI/C8d+m
	 a0V/VGLajXeVQ==
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260830134428.9550-1-pengpeng@iscas.ac.cn>
References: <20260830134428.9550-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: sma1307: validate setting firmware
 layout
Message-Id: <178895391468.87467.12226466626019467883.b4-ty@b4>
Date: Wed, 09 Sep 2026 12:38:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=O5wSblCmOzD39z10VHczozGyL2EvElipWhexqT3qPtY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoYDTW48qgN5FJ1zf9ET4iooBNcTi03XxBtHC3
 IFc0NU2gvuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqGA0wAKCRAk1otyXVSH
 0HfCB/46N0J88pgQzb1QCUtJKwPDCyJqEP5gjySb39HpoKuppgotPD5qyHKU5zQBnyXw4XLSRZy
 6L5YXzu87S76y2iX6MY0njPgXb8wRYSzSA2s+5EeTmNS7EV9+BxQEeb9kCN7o/L9daQhHP12WNh
 P5APNwLFwvzu3domKpJB7yloxJ2N+fwMhEKCp7j8h4lzFBqrGgjKOE8+tgit1rvT9GzstwqpvmK
 E4Ib3/bQQzj276w06aFGneldU6VTDdlOxVxO2uMMAp9wCcxqOxBq8WRjkPMqKuHIvNDKq1yZvmN
 RrTxHi+JR1yvzjSesoOp8X6MifNOk9uKzOJqan2Yipo1NPkj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 30 Aug 2026 21:44:28 +0800, Pengpeng Hou wrote:
> ASoC: codecs: sma1307: validate setting firmware layout

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: sma1307: validate setting firmware layout
      https://git.kernel.org/broonie/sound/c/af0f4f7a042e

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

