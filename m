Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100311;
	b=QahCL11OBwERsV2RRfhC9oF0riY24dVrExWcoHpWbfgWaXHPd1UK3wpH63WsnXjT1/vV
	 ZTK3JSmYD1mlkjGcfUUW+sNDLPGsJRO82fdRAT4YpFfbOXhCoTp4FhgKZlYWdx67oZ37r
	 nNrjEum5idsmuiw+/bSQW+h/7GRB7RvSwdblAPQUbGq6KE7TXsyUhvr44QVEa3mSLErlx
	 1VfFSOFnSEJHN3BUnra1HuSVUM0wFFJ2KbUHE1/FJy31lxoDyabd5AWigfhJmKJN2EEu8
	 vtvJFmIUzjPWHrq0su+xzaH+xRioQTmdWOEq188WqF6pS9zlyfcW9LEjM6RWZBht21g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100311;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xYYlRG+Aqav7Ix3eWG2OIY7D2oidT9HV64II8I4yDdQ=;
	b=tm4DKNyzn2yhsU4xpm0sBrbNxKG9NzS+kPh6bOFTtV+cE/xw8Psior1tyEFKdfKFocM0
	 akg+dIvkh6AAKGec1BzXEr3W8TCrltnaprCUzr1TUvXUDBNIrIzF6xhZox0MaFZH7KEdO
	 LslJ4jawiIoDA2vHzmoZS/p9Bhw+J6L1SOtdwHWMxNtrbDwMZUs6hn6CbQCrkJ/z7InIk
	 7Ey3WlE+bgxhY1CvtTADAyAzVc/Zma4HZ8TV7D/7DlfXeQo4te5SzwPL3RwPjpx1XyWBW
	 DWmftxcQTKuFt2SauIvBIksrtjddsJjZ/jgJ+Y/5CsqSDHOkBKrf0v3g161VwYG/UVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Btl+CgWb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82829606A31D;
	Tue, 27 Oct 2026 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Btl+CgWb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4391F01825;
	Tue, 27 Oct 2026 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100309;
	bh=xYYlRG+Aqav7Ix3eWG2OIY7D2oidT9HV64II8I4yDdQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Btl+CgWbEBErdL987G1y9dJZtVoRdY6PefBFmlebtHpskQ/PiNWUjLQpG6renpwr0
	 PzzyZ7fxLpG3vB33tbte+wjqStYMlPSKic0xnyyuLRKHFtExXCo2xmR+bXRpGvAmp5
	 rvVbX2VDC6qfMFORm/jTVww6oCeDrMla+U3SR0ONmzaAoqTgpx2RNpv0JUxmHs4OaR
	 3clEf2EzfIaUL33piie1N7jDaGz3/XrA1R7zvSMWtzAb32nVgUUzM3IfFJgomtUu1Q
	 3vh2XuK/M5WbQqT/9PTtFpuZxOvV+Phqo+tTYErOMz9laXBK3ZcnWVNVQZM9VKLb67
	 BLeJc5z65anVg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A70801F4AB8D;
	Tue, 27 Oct 2026 11:25:06 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
References: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
Message-Id: <179304267334.199157.17916625046505762697.b4-ty@b4>
Date: Mon, 26 Oct 2026 19:24:33 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4LZ8LCAQGN7PKhHh/UfRLiGxZZWSjOBObJTMou1SwpM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIedHG/bCnpmqR/eX76Mhbes50BPkEur1dxF7ZkSeUlR
 PxcsHZhRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZy+zUjw0PjQPvlxaZ3py34
 sW35+hVS77tdToS91F05q6Qi4ESj4w+G/45PosoWKJ9edWnp1nQbpsLrGyw0J4UuS5yZtWX5X55
 l6twA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 21 Oct 2026 12:10:41 +0800, Shawn Guo wrote:
> ASoC: qcom: q6apm: Fix shared memory unmap
> 
> Since the early buffer mapping, q6apm maps a front-end's DSP buffers
> once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
> few problems, which show up when the sound card is unbound and bound
> again, e.g. by unbinding and binding any codec on the card:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: qcom: q6apm: Fix unmap regions response handling
      https://git.kernel.org/broonie/sound/c/4b832a2af523
[2/3] ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
      https://git.kernel.org/broonie/sound/c/43c69604271d
[3/3] ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology
      https://git.kernel.org/broonie/sound/c/a51c5dd7f7fc

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

