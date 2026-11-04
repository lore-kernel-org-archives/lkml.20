Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835566;
	b=r1WwV3JS1nEnNOOi76yWYlg2ZFBwGlDo6lY/KL5EsxJgS9Gb2fjMfSGAlv18UmtKJkay
	 +lZhLybqXqj3tMON2I46hINieNg36YxugESjKz6BL3LNJPQ0srYaRiaiKjr9eZOalWw1B
	 Jh7FctqCOqeXXsjL+0hbZq49x0ZxdqHILHUiPJ7r0IdBJimXeVmU/HJx3rMxMgG0y6baN
	 b9V3IcoUfue3lrtIxDn94p5kyTYQjR4Uqz2rbLvps0uYHdWqbaOBDG1CAICi8I0XdZstv
	 9vATJYB3lHKDUcZg5Gk2J9fSp6IoY9N+Fw665Ro7zrbKgbWjjByAgFLrEkzAFvf/iAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835566;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=06UV3GtDScRnLF9PQMAWuPV6Pkn69/KTumr3wFFMWPo=;
	b=fC1Naz5TZNn56HrEYrb+JvTV0S4sjYsueSKgBQ9aEXGP0IBPTdKBt7ZGEgxolDf8iR2f
	 M3hGo44FNxIxJ28ZDTm3XwH7tyctGVxwPx7cOR1+sLAHbQjiMCq2tUKVJ5hSf8J9M6coY
	 OCg6/ZSG3ld/rrN25eqEhqDFjkdTHQ8Uz7K1Z49JrUu+0ZhgvVipuZnRBCSjqoi3vxKum
	 jRYt3y9lHQ8SFSExfYgYJfETzqgMzVwDPit44fsuaeBqmaBzLdf76HzQPtrtBxJglCSS7
	 tAzEop3bJfEf8FWEPuJy4CHnjFLTEUDIODR2jjBpk7aN+Y6/sXnNMA4MjCY/OrMdx1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mWY/0kZe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76297606A326;
	Wed,  4 Nov 2026 23:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWY/0kZe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB671F000C1;
	Wed,  4 Nov 2026 23:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835566;
	bh=06UV3GtDScRnLF9PQMAWuPV6Pkn69/KTumr3wFFMWPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mWY/0kZeDxb0Mbc+yYdLIXpsRhElBACEfUI4v12j5VDy3BetYK6hQaC2Q415SJYg6
	 /p+BbGlrVTz+RO3IlhvjamJe3Oiyk1Bh1NRVGL2RtHxG8HGVK7/NPf6dWBYmaBZ0Lv
	 DPniuEPcQzzY7OZQBDuVTm/koEwrMusvtB1Rt8EEfjdtBq2YJ3PQuawL/xRLKdx3KK
	 JbyNT1OwZ0RGYbIWBhIYc+rm4JGXanPk/RNXHDX4mpfvr9pzFr3yFDBLDLuNhtG4zR
	 VkK0SgNq+KnuBvEZogseqYyiw6q4MnxZ2E8KwEGSZIs9ArpdFV/iTtrFrwDeWP3C0S
	 C6QojjJMGPiOQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 3022126926C3;
	Wed, 04 Nov 2026 23:39:24 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: pierluigi.p@variscite.com, alexander.h@variscite.com, 
 Stefano Radaelli <stefano.r@variscite.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Linus Walleij <linusw@kernel.org>, Kees Cook <kees+treewide@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 patches@opensource.cirrus.com
In-Reply-To: <20261104155832.57738-1-stefano.r@variscite.com>
References: <20261104155832.57738-1-stefano.r@variscite.com>
Subject: Re: [PATCH v1 1/1] ASoC: wm8904: Enable FLL when switching an
 active SYSCLK to FLL
Message-Id: <179381745851.2456854.5845236701643906576.b4-ty@b4>
Date: Wed, 04 Nov 2026 18:37:38 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+N+d3xzmz8LgZgf0keSpbFxBGI4hAez6zWda/3qs//0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeH9J5FxJw7tS2I6KTN62pKjtktC1I/Xh6x9dCQQeDl
 SWlLbIvO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRl0sZGY7bGKvKJzWtT8+b
 3X+ApX+LVhB/MO91npdr2k+6zGRPN2L4w38vY+ujf5NuiidN3mX4MHn/xyk37vTvaN8oeE34T4J
 +JBcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 16:58:32 +0100, Stefano Radaelli wrote:
> ASoC: wm8904: Enable FLL when switching an active SYSCLK to FLL

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: wm8904: Enable FLL when switching an active SYSCLK to FLL
      https://git.kernel.org/broonie/sound/c/b3f452ff1778

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

