Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432933D3CE3;
	Wed,  7 Oct 2026 10:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368524; cv=none; b=Rfhsos+HvXBbEJF5nnJKv0YjdtkveEt76Oan1HbUwmdPoYaWRi9/k2TVJVr6dQMTbHbvlGNTnUDAvd6ntoaYLaYLitlaVS52MFQpzjumok4lEUiIBOh8mxSsUrBhtrxsrIr9Cb3c5rDcrFfVSpdQi9dc/11sjYx2bMHDp/KkvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368524; c=relaxed/simple;
	bh=RgZXK21MI+3UvkNjqGtoq8/vF8Z6CUdQpu22jb2FJo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HxG6ryU8iR6xWKS/jN0y5rGiuj/KdIF09b61E1BuvNuE21F5b0EL+jxc/98JBfm0XXoD2X6eI+uTF/STBBMuy+4x8fPVEeqEklLeHmsw03cEYVupo2GEZ5fllNYh68U2llwsCctazdyV2rt0mjWNuZNM81KdRGVANJVI0Cuejpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glAUjPbQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glAUjPbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9741F0089B;
	Wed,  7 Oct 2026 10:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368514;
	bh=h+SX6H+Uq5M4tvroFLhxnwiVnWx+HukM3WHDX/IUWds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=glAUjPbQzREo0iFV471hRKTH7Cmdm24hUMFqPbFBgzWMP8eOON4hIa5GQUCq4a2JK
	 /Fg4YgfXRongMlON/F0QJOIEz6w3lBM0cXWnLyOtERpJLgYSKu7iw/lSsQVBMBZDqD
	 vXW95RJ6bEU/MilA0hPmBSeZ6IIPYw53sMp6r4JsiarWZjj4shmevgQRKHNJJwrcbw
	 dJO57zToMWMlHXtGFAApFmfMXTeM7fCr0rC0rPF0NEcDJI4pIvgIYTQIoPVOcXEkuv
	 BfpXYgEHIdM+KdxSewqlXqQvkiIL77b2gjasisqVBs5VP2ncvtK4m7nRdmWo4ylKre
	 f7DJQEYL/wkmw==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
References: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
Subject: Re: [PATCH 0/2] ASoC: adau1372: two small bugfixes for the codec
Message-Id: <179130010009.150114.9817475531464233440.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RgZXK21MI+3UvkNjqGtoq8/vF8Z6CUdQpu22jb2FJo8=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGrGHTyipPDziMECDhhm5R9rLU/LClsPkOKaGsA6gS8wzEunm
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqxh08AAoJECTWi3JdVIfQ2GkH+QGD
 WAoMmctwZ071Ygag0LXfyDpTKW/Ait+eMNnO0Dhg+Ox0xxK0d6Dx2Tnlf4MgWNHflH+dbcAYj99
 XqsJDREveBekw0Y7GvowxEAsu+7LGbkifzvIaO6wF9RKEYjnY92kJ8LDSTQUzrTZcF5vI7dJVEz
 zn4ibZVIvr0X/MGq3B6npjQilQEjPpFZfaiobL2d4fuhnC7Wi9Bd7sMB9EsOuWKt5dtpqOXKcIb
 NvTS4l+gTN/1o7np6Uk5X223Pexmn83aObmJGdEZUhXeFjNOkXbqELdTN9r/AHnR0Q8flbdduY9
 QCTGPXmeV4apqFqil0VfHnxQZJRUD/Bv8ejxWNo=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 06 Oct 2026 14:55:55 +0200, Alvin Šipraga wrote:
> ASoC: adau1372: two small bugfixes for the codec

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: adau1372: allow sleepy powerdown GPIOs
      https://git.kernel.org/broonie/sound/c/64dd172bbffe
[2/2] ASoC: adau1372: fix invalid default state of output ASRC and DAC muxes
      https://git.kernel.org/broonie/sound/c/36d0e05815ce

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

