Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594137;
	b=lawCZCnOICxwlljx1rW1e68wuWEgAn2TZDeo0V/Djp27KB/q7rW8VizVx+zV6xkWEzNa
	 KJkMIOmbI7UQIHiCr9vBNKa/TIhR3GZJUKnv5TrvKMDjcXy3PJl2hKRQ9GUAGuAjGOPdO
	 GUJaMOKMQ8kBfLm/UHAquh7rPUrKapQ1hNeQm3M18XefoqQNL7XzkaNu9CYmANTaNVZ8a
	 dAX/uFClgzJE+9WzKBZJNN70ieOwE1PiNKOZZyLQGNfoA6JH8fAZ27rlzBwjDHsuphzm8
	 5Cn5N5VLY5UPj6RsQhxVxOWfMG5ImCXnxPV9XWe/mXv65RLaRhwAInfN26UY9TC6tAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594137;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=N6/2Sb8S4wXn18oNbwyPRtqNqgXpmx0Kczxs042VHUc=;
	b=VqiIAdC7QloNAi+zSDd8/KKE3d/WYoUiq/wmTla/4GSPeDaMBN3uaQLyAHtW/haYL3Pd
	 tR4xSciY+eENPN/E4ubik5fIJlyGwY5mWe3Zgq+pNPuZqMu7sCJ/I57e0/6tKJKNfnEPA
	 RnhvkabYIXgWcQQuKHIkTVsnJleDTqI6/iHpBv1BLpube5gI6i7gRxp18pvCEfoAia3zD
	 eLensnAHsAjTd2sKeJMEqyolJrfqqbIOgE7XiAlhLnveU7pPcHbLl+hQZyVoXgNqpPRla
	 yHKg6V8JrwRlvK7xd0OYBd5KCghBZzKjUG1oav58FBYv5jaIh2CMqjCC1bOlypxSr0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4+QiyR0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAADF606A320;
	Wed, 21 Oct 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4+QiyR0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906CE1F000C2;
	Wed, 21 Oct 2026 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594136;
	bh=N6/2Sb8S4wXn18oNbwyPRtqNqgXpmx0Kczxs042VHUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g4+QiyR0zjjUH+qeMM1dC5eG6T5La7qKoXwMu5ka8yqlXIvOliDwEYBiGIhZzP4JQ
	 LQ8DN6rmrpdD/yKCMtcb9hVtWqtCFgfWEbfMH+2Th6XTOl5en3K+pjHiWMTYAZ4Uix
	 wJd8xw+WJ1YEWbWehulmOTcLyE30cRXGbqN3J6jbCjaNQ081+zmEAsLgmiwCNfOn8G
	 Fna3vUifNsjfZyssERs42KYY4qRBGkb3XDfHR8o5SzIc/zXNaLiU6oydu3Hkay/cvy
	 3yZEDJ67+73rpnNmCSiYoiEwhEtCp2rx8cCn386oubuyYx6f3gGsiaqJrd/YfA9mgL
	 aZsIg6G6TtrNw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261020135706.3573260-1-rf@opensource.cirrus.com>
References: <20261020135706.3573260-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH RESEND] ASoC: cs35l56: Wait for firmware timer expiry
 before system suspend
Message-Id: <179250807063.3599968.16781577865112278467.b4-ty@b4>
Date: Tue, 20 Oct 2026 15:54:30 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q7FXU9bHeZrCKb5cCHOeYwF8mFup3fMwZpGJQ7M4eQw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJuXLgq0NXakyOdmf7u3+Qji7UK7Xn9Z6pv9Lecc2Xax
 a6/4uxvOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRqCyGf0pHljJ7lcc5mIqZ
 L3mq0Fig9PZPQpvkxh0zO49UpVg/2MLIcGhvYSbHf60Yh2NNlQ9aNK/sWOtXXzdfdPbNxufW0eJ
 bWAE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 20 Oct 2026 14:57:06 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Wait for firmware timer expiry before system suspend

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: cs35l56: Wait for firmware timer expiry before system suspend
      https://git.kernel.org/broonie/sound/c/6cc7db9fdd06

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

