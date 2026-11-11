Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408064;
	b=NNNRBhIF7b1kEnzh1gHjz9HwFqWfquYVCy+v/KPGB/5PBbDFTKwOVgHlTzdh+1S5wo3G
	 HAH5EGfWpvC6hNCKEa5jO0pQXba8dE6H721nB/LYMZiQV7aBypvPiD4+PunCaLDwg8AyK
	 m3VsUpCOz1SI84hiFnyXLIO80/50ERbbdgOaUEg9FgxWQa7suz7Ba03E6/VrQobLdfFfk
	 Pb+Gdrb25TOS6y6CT4GwsF3bzoK7YNNABSckVBRlZgSYWiE90O6dxuIXzl2WsE/EfUCdu
	 ta8QEk987VP9MmYZ+D2daQUkagGs/bmZthSzB7vNrm0q5s/oo6e9s49Qj16laEk+RzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408064;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wLuYVG31aOuvXm5nXyw+VGAFyrApPMdjAgSKGv1aXp8=;
	b=ykrZ6fKGAglg2Hrn/I6QVepkcgeR5/gyhe7NVbZY2V0WYtK+FxmcaqigFBddIVrKykB1
	 gYMslCOqLggNF9cpypJ+jPncp8/6eObyhv8+OfS0ZYppz+FR5m0FOjezsnoEq+auaYzln
	 VfC8ftGyvSmp4c/Y8huS7cHEKZAKTRgeu4NBnUbtW1RpjEnCOSAcp7uflTNZT5dK4KwiY
	 OW3UKmbkgHdS3jsXE6OaVh7bqmKd8ddzN3RhtmYYktsnSTvUot9F5N2g0/eQ9IiBukG98
	 44oMrPma7qTeqeyiaR01EqCYoGpwgpvzP1kiVERfYuJPLWwJCTlJ5lJJLS+97zoPSGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1X9V2LK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B4606A324;
	Wed, 11 Nov 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1X9V2LK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937301F00A05;
	Wed, 11 Nov 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794408064;
	bh=wLuYVG31aOuvXm5nXyw+VGAFyrApPMdjAgSKGv1aXp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Y1X9V2LK3dCb0pqF39TJSEoU/PRTHMftqIAM5VpHe0HMRj3ne7who9235lgDlixKY
	 OBsjzdWWnCWzROosSAeej4jFm0JT5izZRH5kOuE+VghkI88CXBtM9ujIEBs00+xdjq
	 ddeXgksczPd+iCxD32JsrlRc7w4MTgj+Lpd5lIvDB1zGn/CQMhz6onGtkJ0UnIhHHu
	 wrCkxlorRRAqBlvyekXet9PX27VTeUnTMouGbqa5p4eJytHDTVL+78WSQlmiT/WzOG
	 IzHxc6c4pbM6GtsX7UxfYHxqCYa4oyjkmxZZOBOJM+fFWuAPCKoDtxv2BS+9Q53Xz0
	 Bx2M0/G20k47w==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, James Calligeros <jcalligeros99@gmail.com>, 
 Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110-snd-soc-apple-mca-capture-multiple-be-v1-1-d9569a8374c5@jannau.net>
References: <20261110-snd-soc-apple-mca-capture-multiple-be-v1-1-d9569a8374c5@jannau.net>
Subject: Re: [PATCH] ASoC: apple: mca: Fix clock selection for clock
 consumer FEs
Message-Id: <179436215179.926575.1549688408471335738.b4-ty@b4>
Date: Wed, 11 Nov 2026 01:55:51 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RK6gBITWLHLecOXMvHd6YAysIFJ6kV3/lMHfI2gv+gQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+1NUEJ6WvZn9Ssrr40jHtrTbXt/ye9djCKzT574Fns
 gmL59+M7ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEJgowMnwJqLtz/9aCLg2f
 Sd2p+/3yL20s7XTnf7XTftatu0oWGYcYGdZGRs2+l1EQlrWgatUllc4NTQJ+oUtZ/33XrEnUr8z
 gZQcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 17:46:46 +0100, Janne Grunau wrote:
> ASoC: apple: mca: Fix clock selection for clock consumer FEs

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: apple: mca: Fix clock selection for clock consumer FEs
      https://git.kernel.org/broonie/sound/c/d9bcb20e4039

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

