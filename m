Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD34390CAA;
	Fri, 16 Oct 2026 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146383; cv=none; b=Kp8ooZa/17eHjRcoZa++k7ML/MqwFsU5KW1qxWiahZVs7g37DPQPlNeoMTFZDhM44E/eTSfPtnAZHBuniB54hLYby6fNtpWLQ4EmVI1Xdeen40SQxEJH5nLlC+/9RSNiOV1LQ00K4PSjnlmilywsx9gDUG6yicsSSFhz2Khaf5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146383; c=relaxed/simple;
	bh=efqyo9sLMlPN2nPeVu3PyV4BXB9gJSuBY9DyxS7n3pQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jYrulTFgHZlwVm8q8hgmNO/sJ6eLX+894zi3yRSH09JxTF8aAyLukIjlQ8UT9obfJnaXhg71DtebvFBCu8SmbTnElpzbD0/KRU14APYHpl5KWD568c2xQ30qRPqHvnpGuc+cJJD3A3g8TumZZkIt8z7fyIoQcKJ50FF5ANlyh2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3RtLL7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3RtLL7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463C81F000C8;
	Fri, 16 Oct 2026 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792146379;
	bh=VhM+LMqDcrq5MuMD12Nd2pVhW01XTk2gbElBsESWdZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T3RtLL7mDSIUOsF1LzVAkXvpTIU/qVIz4mdyg+bFcEq+DtSDYwF6bZGldyGQLItQy
	 XvF21NQXibBD1HsC/5bdzW1U6eevh9k1TThikyk9cVyIzQWLgpEG3Ju1btsPDYiMM5
	 Pa/84cCmzCWbaGz/P94RSFP6CaayvE48XotM6Mub+TIynenzaqdEQ+t8w0x9illvMX
	 aOac4DEu+ux9MbS1SAHkPHYS9zjJ3yWWt4vIYDJYXlNaYG1hQUbwHOJZP52MJKuIve
	 RnYonYsSJKEzRB/jbtkRWu0tPeTQeBGcTc7Nhcw4Qp9XCD6hw4T1jAhb4HvIhUrO8s
	 7LBX70YGtPFkg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20261014200608.118770-1-amade@asmblr.net>
References: <20261014200608.118770-1-amade@asmblr.net>
Subject: Re: [PATCH 0/8] ASoC: Series of loose fixes
Message-Id: <179210209788.134795.16466628205675930250.b4-ty@b4>
Date: Thu, 15 Oct 2026 23:08:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277; i=broonie@kernel.org;
 h=from:subject:message-id; bh=efqyo9sLMlPN2nPeVu3PyV4BXB9gJSuBY9DyxS7n3pQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIu/j6RX1g8Z+bBk5cu9D3n/aWSm/2Re3t7rWu9p3C++
 K0PV1IrOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRgyWMDC3Tb+xwfGOc5jbx
 1T05NpbuKDkHKwnhk5tvyR6vXC25zIuR4avbwXjDlW9l/r33q59+pXTtJe2ue2Z8DN2Pc5LWpDo
 WcQMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 22:06:00 +0200, Amadeusz Sławiński wrote:
> ASoC: Series of loose fixes
> 
> Following current fashion of poking code with LLM to see what issues it
> finds. Some are minor, other more likely to cause some real issues like
> the one with snd_soc_limit_volume() returning positive value, while
> callers do simple if (ret) check.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/8] ASoC: soc-link: Correct stream stop operations in snd_soc_link_trigger
      https://git.kernel.org/broonie/sound/c/7ef99fcfbbac
[2/8] ASoC: ops: Fix return value in snd_soc_limit_volume()
      https://git.kernel.org/broonie/sound/c/223ec2a93bec
[3/8] ASoC: soc-topology-test: Check return value of kunit_device_register()
      https://git.kernel.org/broonie/sound/c/1641c1ba27ab
[4/8] ASoC: soc-card-test: Check return value of kunit_device_register()
      https://git.kernel.org/broonie/sound/c/77dfd98b1642
[5/8] ASoC: soc-ac97: Fix error handling in snd_soc_new_ac97_component()
      https://git.kernel.org/broonie/sound/c/fc081cdfc6b3
[6/8] ASoC: soc-ac97: Fix debug message
      https://git.kernel.org/broonie/sound/c/9d4bab22932f
[7/8] ASoC: soc-component: Fix return type of snd_soc_pcm_component_pointer()
      https://git.kernel.org/broonie/sound/c/9df30adce80d
[8/8] ASoC: soc-dapm: Remove widget from cache on removal
      https://git.kernel.org/broonie/sound/c/568406bc832e

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

