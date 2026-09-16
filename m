Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391ED4DA9AA;
	Thu, 17 Sep 2026 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644733; cv=none; b=O0eBEt1TcmrZ9/KoopsMgvV0wN60/kltBSO5b6q6fqI1GpsOJi4vF1cw49xgfEBLq6cBDkBz6YxFz/VbkfsiKjCtj+Z9z6IEDLu7EKPgvP/1V9gQja27itMqCYJ5TvpfhTfUg1ANcbAEb9snW3GNnzMuC4jyr2odKBsRGW1uI64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644733; c=relaxed/simple;
	bh=TsIjz84t9T8ESoJPmYjOLH+vQ5EMDt7+k0KV5Ee18+I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fW3rjFX2UJXBDoFVjY8KO81CoQNOpSgWtSM66GDCgejhArXX3lxKIWKluy8N80EuCx+OOGRodKoxfzyvQEqSE9Q2td0VW3tDaonO1EG6UIUrnvFmfi3kAfNqBplMelZxIc5NgdMIiMDI57RWZX5heXqH49sBoGeo8Vdq5dExE1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0LgzUum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0LgzUum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C07D1F000FF;
	Thu, 17 Sep 2026 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644731;
	bh=AkGK2QoAAe1MYzzKIxTq2Ai8Lj5vXvsLzIpLYDuVDq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=d0LgzUumN5a3FQSUi2nRELva6gppNkiOGGOp5DxsXlOwgzVMBo8Fg4Xh39dEyqAms
	 zzIvNfouN3f9dZZ+HFh/L7DNrwBfeQXVp0E0PpeZQO696Tpne9Kam8dMyqJ9z+cm6d
	 yZ4ZEU5iWprZYWYnFbFUyDyhPrWDFAQ6/HYC9M1xPSDjfSTszdNR1zp5r9v60nPisB
	 vx+7GqPJMsbff5dKoVjeqn3KjZdKLu8vFDm3J60Gq3pxXbe0Qg+RerzqJAk+3eSU6u
	 KFQdfdCsOMpq9bJth2ZNAaOS5IbGiei9icjceTJoTf7fWwEJeZFFHpHZTJ8JiVRXnu
	 qeajTHwlA3UdQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
References: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
Subject: Re: [PATCH 0/3] ASoC: adau1977: small fixes to make the driver
 more usable
Message-Id: <178958580925.100121.3443490256740909536.b4-ty@b4>
Date: Wed, 16 Sep 2026 20:10:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TsIjz84t9T8ESoJPmYjOLH+vQ5EMDt7+k0KV5Ee18+I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq8+4pbsMwmW9kN0gWJ+MxdoTYVbbt71zwqsaE
 BCppeKjIgaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvPuAAKCRAk1otyXVSH
 0NetB/4sLtxNxQjNoKg+uLsy+//wLxsqXm63oxJOyTteRrJjsj+5GyEeFgmi1q0TNUUZOgYIU+3
 PRl+cRIz+YFziwN5JX+kL7qnYQmARKgrEa/ZIHtmX9P7ZFZ3HxbUgwqkbM5hWHjYVMZ3RA98tJF
 W+e9MA1v/l+zB5kmvElcRmSy24DCHsdzlNkq3AeR3tac95PLEFzGbJtrmNpEHA/uwWU58fyIabM
 F1vF/86RcLu7rwp66lvw2tLLSpjuhwDsfzxDjctdbTNqC/IY10FzjonziREbwKYC0gJ8O/9qRkI
 4m+rY3olLPWoWV+EHoE2ph6be1/9SzlvoA8TOPHooHoVBNt+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 14 Sep 2026 12:12:34 +0200, Alvin Šipraga wrote:
> ASoC: adau1977: small fixes to make the driver more usable
> 
> Here's a few fixes I encountered were needed in order to use this driver
> as a module together with the simple audio card.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: adau1977: make the Kconfig symbols user selectable
      https://git.kernel.org/broonie/sound/c/0030f62683d5
[2/3] ASoC: adau1977-spi: drop __maybe_unused and of_match_ptr()
      https://git.kernel.org/broonie/sound/c/528a0da3e55b
[3/3] ASoC: adau1977-i2c: add OF match table for I2C
      https://git.kernel.org/broonie/sound/c/76a8fe25b978

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

