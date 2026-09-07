Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C38519906;
	Mon,  7 Sep 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800397; cv=none; b=XriZa7ncE1sC8p75M2fWIAnYabCrnb3Xo5hlX1x0PVI50Qm+Pr3m3D4EE1n5P7DvOrKBq+sG+wDcI/+CptZX93qbKt4hsV26xJPy2kjmsXlae/55PSbzdhKTSozjWPYtati6k6KeyN9GrTcMp5KxxiYP+m39VAusnBM4PUyP6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800397; c=relaxed/simple;
	bh=IIlbBjPVL9SGm3Vs5mstFCN7buv5sEMUkbK5Y1LdE5Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G9sVzLn1l+0VdnE0y0QZ56a3JRum+yhVswfEoFnj5s1E20taLv8jrxmpphc2biGIRqmuCk6nT+E52E6IeENZVPMXmiXuxhqWKkI2pacxqvjIVGLQm9usxHBcWSPaeDlsovEl4rd0o2DajjgJNmNs4SztIJ3wMMrys5AL6Ay79Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQr/gJaS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQr/gJaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDCB1F00A3A;
	Mon,  7 Sep 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788800395;
	bh=h8uootJdn7y6hiezHT25dBz28nB26GojxQM2yMtCx0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PQr/gJaS3tmGKlWmACnenTX7zQU4VZLQNt9cFmUKwPFiBaXXmucSxW2By2QT+Ol2g
	 jVOk1kcHyjwOwfHQ7WdScfakUL4x/v6d0DylWoI809PFNOPvO4DYfGjBI/yrNHXGZa
	 wZkLIPS/HXS3h/jdBoxmqAsXiePjhmOC6dcSD7CBbket+gZeYDOivviol6xaeCD1K+
	 Dtn07QxbhKtZGwJQnKxFanudPP3O8Ie5tb/wpiAVcad+HVsXK2oHiWlXn5lAPMfJ61
	 qt67blIGC37QDXzZiKGTb6jtFMHLxu25me3WA2wGBYqSKiSFgVajIfAn45fxQrtyzH
	 wia/Szs+vhaWw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, "hpp.iscas" <hppiscas@163.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kevin Li <kevin-ke.li@broadcom.com>
In-Reply-To: <20260905133103.63432-1-hppiscas@163.com>
References: <20260905133103.63432-1-hppiscas@163.com>
Subject: Re: [PATCH] ASoC: bcm: bcm63xx: Publish the OF module aliases
Message-Id: <178879302852.118202.17490760276173407712.b4-ty@b4>
Date: Mon, 07 Sep 2026 15:57:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IIlbBjPVL9SGm3Vs5mstFCN7buv5sEMUkbK5Y1LdE5Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnu2HqoxKcS25IZYf5uNyZ+v3iNb9X2Oh3oop6
 KkPoPqenCWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap7thwAKCRAk1otyXVSH
 0BMJB/4w7qIGtx6GVf25C+jJxDcK3Dxdy9H9oiTRzvRSclTmmNmW49RSU4tEdaavp09UQg976Y4
 yQi3KKKWOV2cAmfLvkmqCl8PCONRB7zSg254rYXEsxQirIakn6CXnCWDhV7JsaWzlDN6XZLcW6g
 y/oPqJAfhaEJoo0RDpUkPeGcn/Vf7nJlc8JGNFJNFWa2czgeqrMv3yKxPjaQpnwhK3MrKCY+Lsu
 jDdogUtmwZbtPhbYR4vrjI6XP24PJijLhkWlszT9Bdarx96UtUCF1RM9FcYUaKbZ5AtZIC/bDqj
 +u8JObVzwHaRh81Xg1EiOpnvhH/3eJyE6Kw0f8FYfoqgg5uN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 05 Sep 2026 21:31:03 +0800, hpp.iscas wrote:
> ASoC: bcm: bcm63xx: Publish the OF module aliases

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: bcm: bcm63xx: Publish the OF module aliases
      https://git.kernel.org/broonie/sound/c/32689f0fc54f

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

