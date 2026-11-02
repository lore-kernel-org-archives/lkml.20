Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623300;
	b=S9LZZ46BHdMaF5ljdcMBBoXuGAI1U5tvX5LludzxFsOBjhNFpvqTw4kwKsTcNkt5titN
	 dmsxyqzpGadYYnVMpO5o9SpojexjZqboEOyZeQIqOs28VCnRmVSkIazMt3GLN14gOFF//
	 XEACHPxpnrHdbFLBe/fjr1wfsKpn2jItaKjV0EKIAgO5RRAaqekf8CBk7HiDfjq1p6WCZ
	 VgdIbFDRzDevtjkFS5eFlvxxjveUbhp9Qqlq6MfESHk0R0+dYqqlhqteE5eMXKwbUW7M+
	 B2tpd9EhVZna6FJmT7QNyUHCKQJY3RU2ex2bC09NlMxZJhsA28PfcB/+I39zyi0U44g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623300;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/Peu5b7Kyrbsgh+h02YANx8ZlL/9Kso/Lv68KQwUCJw=;
	b=Ze+XshNJtp7w0/QRbxLax1pJeOJDTy8kuVAYDCEu3+nasCh595nHDzb8/hP2gyDsVrLa
	 3yrip6SlHQMAcl537IoudjnUOE/Gt6eGK01R5eF82O+HEoYNhVh613sdVG6EfZN2hOYCS
	 ZxFs7+NqA4qHmsu0uPP/eyDDvSQvFNOt6iFnJb18cu43Tt9qyMAHHeHn2fwrnDGg8i9rI
	 dxlgkhpsVz4csyj0XvSYcg0yuOIJhd+7gmLS63vvbBE44dEa+KpLZajwV5Ntnn34V44hY
	 pCuBTY9BMRcXgbffaAgX+OdQ8zRf94h0ralYuPxfvDjsdurta1tQo2R0gKENFU8qSmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaIaYRqA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA0D606A33F;
	Mon,  2 Nov 2026 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaIaYRqA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D05A1F00A1B;
	Mon,  2 Nov 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623299;
	bh=/Peu5b7Kyrbsgh+h02YANx8ZlL/9Kso/Lv68KQwUCJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GaIaYRqADioKDBhpm9h8PAHqVKAeV2AQ3xiDVqExAHj64WTNWFjv5wIQYHBOtbUAz
	 adyfFjW9ZX3C/zS9xn9te6qn+l9VgGMfdr3uqsKUdqMrdYyzNLMX4Oqg/Kfn8RBTiV
	 cOqAtoqa9oAq7TpN7t7s3QQj3a451cXTfix+xRhXi8Z5otFzoEXPZfwQwinAVOtter
	 vCKkhRPtCh4AUWor7Ihp4K/U6DZFQmFTy9oI/Qo2OKJvXkj69IXdlNqJ6csoBmfMzr
	 2v5kvjG+jUZ/C931SmYrbR+jim7DFrYt8a6ce6/jwNKMKAwKq25De5bN1qBKIe75b4
	 Gv38G5J9YybGw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A405A23103DC;
	Mon, 02 Nov 2026 12:41:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
References: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
Subject: Re: [PATCH 0/2] ASoC: meson: card: fix driver remove
Message-Id: <179357776085.1716893.7760028365760800728.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:02:40 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IW+3schf3f12w+Fw6YVgIZQH8wOkkSnqf4ANNKtqitI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetDKeM6/ybwzd5fO0sf+q+QRNTYE6+YtvLL0/f9U8o
 cwkOutyRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACayyIuR4auVd7Xk0yXMVyKm
 JgkW74wRZG+6f29L/lGPzfaLpUSf/mT47/FGtWJmmamErzX3i9Dayktbiv+fYpvH9fDb2VdtX46
 qcgEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 30 Oct 2026 17:29:52 +0100, Jerome Brunet wrote:
> ASoC: meson: card: fix driver remove
> 
> meson_card_remove() reads the wrong drvdata and frees the card links
> before the card is unregistered, which crashes when the driver is
> unbound. Fix both.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: meson: card: leave the device drvdata to the ASoC card
      https://git.kernel.org/broonie/sound/c/b734d4c00f8a
[2/2] ASoC: meson: card: unregister the card before freeing its links
      https://git.kernel.org/broonie/sound/c/6f86aab14274

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

