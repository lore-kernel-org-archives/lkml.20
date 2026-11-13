Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743020;
	b=ev5fjiby86XqwtcfJ0h60ktkXHCgHY2wbi7CdP4BHGhZoOKm5c/zSumUBFpQsl5VGmaT
	 bqBi0N78AoWuGAjvbzdns77KLkjlImA/gDMWHuUVULfXM+xH7gLcgqI0rEymU6xE+WV42
	 opMV2dmFD5cE3OQ1yL0frpwVjhZ34p1c+6EZ1Ms+FPU0tQrAyN5HnvgGooDY6lJC0Vj4d
	 5M3DiRiniEmM05YawwHHvXg222gsafH/E1EjMx9vodksq3Q5TIeEEaw8jXAY9S1u2kRm8
	 FWy223+evJFXllHpl4lv0EkSpsWIWZYHwbgs7VDOjfCPcJk+i1bnv8KTW/Ovi/Y/0og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743020;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ox2hY5QH3jmgosgum8+KLHMofQ09oXBIrh5AAI9umjs=;
	b=EyW27dbIrI13aHKScKQsgvu4CmAOmk5CpqH8R5335XfcgMCiTxClYmHyjEer7CIgwPCu
	 WZDL8xknasa8TTKtzlrZI9LCn+yb9UbJY9QcmBGVlbGGt4nRqGtANuqs+FV63zSKHqGNy
	 Mb8HW07nXgi73qEhXMVCzifpsztPcrbFEEBOLil7U8sf1X/iuwgYgPfF1kwTGorJUGgWT
	 zT7E5JH0nV5dltwRpXoDqMddUG/aKl2CyYYMwNBa2Rerz9XHYuXjdre8SDAfq56aU3Zon
	 K2PEkurvGxx5GvMTVj2TZoxPe+njLp/hNf2Acj8vt3QZjxyzGJo8YV8YHhj9phGQXcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhVWqplR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F990606A339;
	Sun, 15 Nov 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhVWqplR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D75A1F000C7;
	Sun, 15 Nov 2026 11:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794743020;
	bh=ox2hY5QH3jmgosgum8+KLHMofQ09oXBIrh5AAI9umjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DhVWqplRc+i7a6wdBHIvf95NOR5h8jw8MQl2lhLwBwQX1dEXAJwipsf/63/MLyHPX
	 BZ+B/gcK40oNdm0Lh6k6exCp+SX0WEcukedmCta/oB3ZOglV6jeZ5Iz7G/2kV58fAx
	 fkuA23zdFd1HTS151C7xhPWdpBhbcGW19EBSGmwV7r6ncvPf6H/9qGVEskZYkK7tJw
	 zpokrk2Fy+SjsNrlUF9RXhJM8uk2xUCgj2MUbPKOf4IDHbYbjGMvCS3lQKYmTO99ib
	 GIWx+1z/GKu+SsCwRuB+GPcQo4VJIWM7SUYr3TyRUox28oNKEdgV45z82pw5ESDCRD
	 cDjQYSmLR3XYQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 62DFC3366C17;
	Sun, 15 Nov 2026 11:43:38 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112071757.154652-1-zhujun2@cmss.chinamobile.com>
References: <20261112071757.154652-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: pxa-ssp: Release the SSP port when clock lookup
 fails
Message-Id: <179460578277.448985.9924511056534604173.b4-ty@b4>
Date: Fri, 13 Nov 2026 21:36:22 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gtSTmb7rNo9CHbbtSfMn4Vd2lX/MEhlHdywA0vrj8cs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+znq18m/mWXudbSx+h6QWyKX9l8jgOhSlnmV+P/fef
 JOkJ/tWdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAizyQZGS4LJ/7ZsvpGdJte
 dMgcxX8z73CwrBTfZVOoMoFTK9P3gT/D/+KIAqaS2fG5hsGa1u4G2pOsLPeHFyc4n157+9eBRTb
 +rAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 15:17:57 +0800, Zhu Jun wrote:
> ASoC: pxa-ssp: Release the SSP port when clock lookup fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: pxa-ssp: Release the SSP port when clock lookup fails
      https://git.kernel.org/broonie/sound/c/7072cf805de6

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

