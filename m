Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482590;
	b=TYo7XTRIg7PtXCP8v9Blsmvu+rLN57swpCSourpTXZ3tl8iVgcH6as6Q8f6GzmKmXQEo
	 aCcak4RMcug7KjMzSDy1Xk5NLZ5x+jQ/W7ckFOyZLVpo9yLVv70O29XoRRKSpzTgihDo5
	 RLZ2g+FTk/cs8Nvpd+GR/i0zwO2vbZTzoEXAesBGZ6oxGzsnhZVwL98VPoEKo3V0H33xm
	 pVoZzuEj7cdRSWYEuvg7J4EAunS0z2krbnbf/EX4hLwK5Mt8Z5dwNRVup2Pag1B8Qp9gF
	 h/LGyN2Vu6xCOAz902NY8wAViiJ0uVVeTJ2YSTKi6VvL+/I2slGuElNLDO/ZtcQ1SfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482590;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gHRTxVfnjlGjSgmGBummULbQEqffoKgDiPyVhu8CkS0=;
	b=PNG3VYtF6dmr+eEl4t19ItyiOlVmOgcSGhIgSwmlO0bJiXL5nuupWYrA83+BueL0dTg3
	 fPJWXK8VPtxOIdHbugONVH/NFsvqdDue1AqHckQFHBagO50pLV5OtllGztUG/fzJoezz7
	 AvuA8kwCWEPDh4/jLc8wTakYvmGVs9vizN114iGbrbXaT3JhEOxZlrPUUfX1EibTgug3C
	 I/cft45UoBcVuDoj4nk8MZBMi18M1hVCeJ9sl7N8DHOaIOtrvssmake6UXb9JNzZw4E5U
	 cnMQgV4OpMoSZf0ZeKVggP/1jPd0iZAfEtGOTtVMfcNgpGw9f89vBiOBLvJctzDMYXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ty2U7CGP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA6606A885;
	Thu, 12 Nov 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ty2U7CGP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40131F00A05;
	Thu, 12 Nov 2026 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482589;
	bh=gHRTxVfnjlGjSgmGBummULbQEqffoKgDiPyVhu8CkS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ty2U7CGPIhK1UsBCQym6gt3hQPBpO2uY5lOLKRERNIEcEO4t9WIV0rQgI6EWJNN+z
	 UWgCEQ5+OUAafIwcKKLuCSJckh6YumDNf5OKxodUPCQJqzEwMZR/GsP0/M+w8Qk13+
	 lFXPG+k4MBbWC9hN8XA1/zqmbsaYyoknXe8AjtbVsDQJQ+5oaUI9YP5ASgU7o3TDNz
	 0RbWJfE1NSHgeVXgSKs6Zng0qjzfnGordTBupGuLcZZbux4jdFs28DKH3BoioOqYtb
	 WSfHHFsPBP+sOtrWJ0rRyhZhJSumAYsgNabkxMDmd8fRbZtjQ60Zb5CWk3J8eEluTp
	 7TNc4piWybP3w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerry Wong <jerry.wong@maximintegrated.com>, 
 Ralph Birt <ralph.birt@maximintegrated.com>
In-Reply-To: <20261111-max98090-mic-boost-v1-1-20b9bd8816db@gmail.com>
References: <20261111-max98090-mic-boost-v1-1-20b9bd8816db@gmail.com>
Subject: Re: [PATCH] ASoC: max98090: keep the MIC boost across mic input
 power-up
Message-Id: <179442030737.393238.17906609209299088030.b4-ty@b4>
Date: Wed, 11 Nov 2026 18:05:07 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jc1mADnRG6OPF8O9WPvoflrveMn9P2s1CtF26WYvClk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+Lpx5gEtyUZC5IbeY0rYXUSF30q6KNizi7ioQ6mRY6
 Bs14UtpRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACYil8LwP+jTd1ZD5qV2s8+x
 f/rNZHPn3qLTN1wXXHV7dHtm/96Lc04yMtz6fDz7QlRi6YS/c+5UTRI9E2YyVVkkZ8nK/9u3X13
 z4i8/AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 14:00:14 +0800, LiangCheng Wang wrote:
> ASoC: max98090: keep the MIC boost across mic input power-up

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: max98090: keep the MIC boost across mic input power-up
      https://git.kernel.org/broonie/sound/c/58d51fa6ff1d

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

