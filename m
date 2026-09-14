Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430FE387590;
	Mon, 14 Sep 2026 19:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412519; cv=none; b=ROcf26sXKp6QOV8M15Y5BO8UT909GWeGSLmHbjTnSaNq6JbS6p3UQ2HqtN/oiy2PEfJGWxOpEQ0RCkive91xDdIQNbwU2yw2w9eFSn838yBc1IQv7fCCR49Vb3xyl0NRLJf0q5AOEYGVxMis8WCHgKc3jhAb1g6YEtLP6qavwJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412519; c=relaxed/simple;
	bh=ZtyX8Sq0Heq3lwnND0gBpvDr9HayQqXUqwTJnh4aXsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oPqss8a4+SULO7NdzQnVzVTsNgPFpGdgpbf+AUWCC+uqd4U2DFZmrt/SYhU0al4/CL3+8pP1rho4+xBYSc/OZoRdXYkcdAlwkyaynpfSTAkIImQcnOP1c5t1fh5/jaPP88x8h1kLqnQonsbq2uZHTjMBN1XIiTaRq2Ee0dED1ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzSf7FpI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzSf7FpI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE4D1F000FF;
	Mon, 14 Sep 2026 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789412514;
	bh=3P4Z71eREEpvwBq/93I7r00Hh26/kstOJaw89V/o9J8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TzSf7FpIQmUPaS9Nwvqu7fbuU8s+qBV8BRgepaFhjet1XIu6sxkR6o3NiwhJeTKpa
	 /EIHEhA/M+gn1IkiZUAUujvbz9rkTLGRuw64f1DlyOuoc3A/YG6WyUQFVSGJHvIwHf
	 0DT9BFqpwTrr7M4BHifUSbnGQJ1aUsllIn6OVZDlGl1jlK82RAze9X1hafaPaFBwEU
	 ZB9q0Rn4Z5WZpwmJZn+HDKx/tEiYvl4JPRd6Q+P/9DZcMaZjN89xP+jrynUlLiEcSW
	 1vUIntsYaLE6LMZl7h62d9MNMvy4+gfMum1uNzoO00L6s6kJW98YskJ1cy15eJPca8
	 0j4MY+d1EfGMA==
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
Message-Id: <178939562305.1239410.13000106533799421869.b4-ty@b4>
Date: Mon, 14 Sep 2026 15:20:23 +0100
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
 h=from:subject:message-id; bh=ZtyX8Sq0Heq3lwnND0gBpvDr9HayQqXUqwTJnh4aXsA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqESTXuuRKTMOTPB0bmAtKvhSV298Q9P+O5DWM
 D1Bkm5q5xuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqhEkwAKCRAk1otyXVSH
 0GqtB/0U8/CrEuWxv9BUSPGAobBx9F5TjpdiI8G7uw1wSFd19f8Mhg7LlrfNwsy1UEB1aG1UOFD
 EsQd5igL0eyIoHJaK8+bPLBVLqdfFBNurQDp6rmEjgQmtmIA4z2/YBb1hV/BLPYZXqI21o6jCQB
 h6Y+NVq0bYzRQFn06K18mO6SNMYkuNtZZz7pbYMArpa03fjK8i5cZEs6xhIXrDY0Vye6rb72orr
 iQnEGfcoK8NhOPTsHniv30XE6OCEzJofJ/ay/H+CMKVDJn0NIeS6qhJKyerysvwbSe1Wvf496aE
 JnhKVCKI5uNdreGzx/BRWANw3tEb+ogCV+NarRIPW1ago6Jl
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
      https://git.kernel.org/broonie/sound/c/b205b45c67c4
[2/3] ASoC: adau1977-spi: drop __maybe_unused and of_match_ptr()
      https://git.kernel.org/broonie/sound/c/a6e83c65cbd5
[3/3] ASoC: adau1977-i2c: add OF match table for I2C
      https://git.kernel.org/broonie/sound/c/642759979afc

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

