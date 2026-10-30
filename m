Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380237;
	b=IDfWYq6fyIpWUTPXbcMan+/Fcm5G8BQZ1sNdszAtuSIJ5kW/j0jHt2tiWy+yaXChpYKk
	 cRUiUtM19QcgOVSrrdrO1yLRQwkeawEbnX0GGyyAcLBgz9pcitM8oONsnNX9aexopcyFW
	 t4reuU4nNT/9mfSgH7OSzI4faOH4mrIWbtUGFnyDXKDk7nY4b6fDlkWdFE2jh1PZqQFPJ
	 jTFlYqWjdydT6lXY/2mFbsp0P63GxVhgLey/bid0NBrXnZVHNOsnr0zePWRQf3Wu67VHD
	 8U+d5bHLb5E5s6+1UsLtOIEpTM8/gcxAXtKLKtJ/d7S/ZzA/3PqG7/JN9HmjVpPPFCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380237;
	h=Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:Date;
	bh=yl3TGAvF789pGyUOLotcc4blc2s51iYhKq5BuUTipyM=;
	b=hqs/wQACPWbzermbB8UK4BBnfRI1fxAKyA11EVIv9cLmzKgP/ZZKTjxLxBQLcr+tFUTO
	 2hS+MWyjTScf2/ERYb61vtLfjDFd65+qtCYS7Fn/6QlFS2y5cAEvMBbg651WgfKeb+9yu
	 FQk94Iw5d/7CKkCYhFN8hWh+fsB9Ucg/PECmJrOxGogI9wyLdNWOC4IWFXdV++cJWayRq
	 BRaXj287WqeHb3U71IWUZ/U1nYFQadZM+3DyTCbmRF6Tb3lV5baoQYadZTxjc6NX8KPNP
	 +KhxDYi+e9/vmG5V5RV3P8IaACE2qsLPyWY24SIm8/loyKBRlO7XJoKa6bXFiFvhlfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLEb4yDG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 891DC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLEb4yDG
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A35861F00A18;
	Fri, 30 Oct 2026 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793380237;
	bh=yl3TGAvF789pGyUOLotcc4blc2s51iYhKq5BuUTipyM=;
	h=From:To:Cc:Subject:Date;
	b=ZLEb4yDGxJgtJH9ioWQ39VuyaeeZlZRqV2/E8biwhTuMSj0D6Fr6+pPdVYnVS3Ia9
	 ZOals3ckL0X1hnCFZENwT+qw3cfM/GxaW/EZUmsaanfaYESix7jKVVfCD2xeuLnafo
	 K1xh6D1SGI5lUW8/ilO1lqcCsKim+3m+owDJrxEh0c0hUamB3niJXfCzTsQnInxVX3
	 hCkTdP2h4eKUslOML+qTN+S3QVcuutdckzGsRks7XqWS0o2Vecbw6te8pvYl0Gb7Rm
	 lyIxYNxKY0M5HPazNe1aUy1qmpiuRTXyH5UG6/aZEQbdABBoYFGaE0eeyrdSWOP0WU
	 biKIm+zR+pV5Q==
Message-ID: <ce8f48c8b130b27c6baaf6757dee28e5@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v7.4-merge-window
Date: Fri, 30 Oct 2026 17:09:57 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The following changes since commit ba83dd4a47bb47da3d2791b2ad6cd816a851b5d0:

  regulator: rpi-panel-attiny: Fix probe failure after a host cold boot (2026-10-16 20:59:46 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-merge-window

for you to fetch changes up to 8a6d73e316f95e398a1de1d1f58314b6d3e7f641:

  regulator: irq: freeze deferred hardware access during suspend (2026-10-23 18:40:07 +0100)

----------------------------------------------------------------
regulator: Fix for v7.4

One fix here, we had an issue with deferred hardware disables where if
we were deferring while suspend was happening we would let the workqueue
run which could result in us trying to access hardware after it or the
buses used to access it were suspended.  We fix this by completing any
work as we suspend the individual regulators.

----------------------------------------------------------------
Jiale Yao (1):
      regulator: irq: freeze deferred hardware access during suspend

 drivers/regulator/irq_helpers.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)
