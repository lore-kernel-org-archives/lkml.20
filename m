Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100310;
	b=P/LRHE7ELlFyc3KkvYzXlLIOBnBiBfV8Av2b0jPXtYsvvwk/tkPeqDiL/w7ttotwjbeP
	 ppXSUeFASdh62sbFJUV/0F8C6UqH/TT7JokJlq2mp8+FAcgzNueVQaQaCW5A/zAj6ye+/
	 hvRP74ZnYLiRaxImeNRUL34lJjGHZAi4+HgvYZAl5LExsbDmmsh0eol2xsRK0ooaoupIa
	 jZANMNvX1ANvarS1EXsB2oUUp0FX9NvIwGBxaUZ9YUrz6lZ+uudnX53iwjehxhAw5FYuy
	 iNWKPMsvbj745hmHCx/Q6Fr+dqZ0jORM4x+ayHaWcONCIVqm6A+45hJiAwrWoBy+o8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100310;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9keTrtKyF5RR4M38htqgVqFwFmjs0uSmEyS7wkdi9J4=;
	b=VJ6d5alzAuYsekny+Hg8YmRhvh4YkHXDgZwTasZiujFKXH88q79rEY2a8y+LUdqATYQD
	 emXGOqlc8sr7hhSVcdWM32D+7Jnq3gG02aEF3F44LcfOtAwW22nVEloOeULZjfSqbK7pn
	 KxMKiy2f+VjpYIOOTX9mUM2YEHz9PpyCRJwGFaOws/jXXO6eKLMngwpMAzxdmrNmAP9N2
	 uzwugX/kKw2qy6cTVgm60CAYx00l1lOun8MO2rURGdLwAwYr5uClEm4lKWQcDF5MhK0uE
	 mf4kTvLkD5H4aNNXhhFXWUlw8rZTCrD+AyVX2PDnynz1eWvEjRCO0jskj1eNjJkEQuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8bGNgsc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82745606A31B;
	Tue, 27 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8bGNgsc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45A91F01829;
	Tue, 27 Oct 2026 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100310;
	bh=9keTrtKyF5RR4M38htqgVqFwFmjs0uSmEyS7wkdi9J4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b8bGNgscueWF8BRR5NgXaZukANOyHN0qFUaoUgNDuv4avvDPYERd6g59QzxDvB7c8
	 8my+fiAzWlF70D+Src1HXWbW+chC4N//G5vqGmtez+dhoJ4pZCCL0Ys2cAZ6cYxVW5
	 01BFhEtvDXLCHLxYXEUt0qaiZ+YhXWnP/cMcNl30Ypr8vJeXBeQiWPIo1TJHEUe7FU
	 gk378VuIMHXoio92dfHmEGI0Zt1ibKjn0Hj1pTqKzOe6hYypZrt+L90izeorjFg4Fw
	 vHBaby7ELvD2fmYFBzjbtB9CvZuvkCgBxdf6MFALvLEe1rmXqZSvdDIf56OzfBeGb4
	 9xM3zk3cCcqkg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 664961F4AB98;
	Tue, 27 Oct 2026 11:25:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Vinod Koul <vkoul@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/6] ASoC: SDCA: class-driver fixes and PDM
 data-port support
Message-Id: <179304904651.199157.13348743822206053413.b4-ty@b4>
Date: Mon, 26 Oct 2026 21:10:46 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Tp8VxEs4UPOsUWZihV9k1VVSCYfyQT9/1G8V4gRGud0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIedAl7WjT9qrhUwcrD8WCGnea67axXdJXZV5j6zWN8V
 3r3tixTRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbCvYnhr1h53qW9Tz6/ERBb
 uES9UWSpq8rCxClzK+fpSdsqnW3r62P4n3/O7sva3kl5Dx2KC04k7xcUnPHqZoeTwcMzGZOE5La
 qcgIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 20 Oct 2026 08:38:50 +0100, Srinivas Kandagatla wrote:
> ASoC: SDCA: class-driver fixes and PDM data-port support
> 
> Three small fixes in the SDCA class driver (propagating a read_prop
> failure, dropping an extra pm_runtime reference on probe failure, and
> re-enabling the IRQ on a failed system suspend), plus three patches
> that teach the SDCA class_function path to tag PDM data-port terminals
> and the SoundWire core to treat PDM streams correctly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/6] ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
      https://git.kernel.org/broonie/sound/c/79cfb5aebbf0
[2/6] ASoC: SDCA: drop pm_runtime reference on probe failure path
      https://git.kernel.org/broonie/sound/c/86331b76b32d
[3/6] ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure
      https://git.kernel.org/broonie/sound/c/d34a818a331f

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

