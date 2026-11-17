Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926875;
	b=eFSALff+g74drJcqgn/iDlrEA23ymBWhpUV/Xr4H/96lGJDaDi3j7BWXoOgGmTSw1pZ6
	 XzAM4RL3u2ta/BUYWEldQBFOgdKnpm5L5azFZwMjpFkDy/vw0EKG0UxcnjDL1z4ah69SR
	 KaYHNYG2gXRfRFdrJHHa7Eu9/zQPPreD23+Bj5fSWUa9RqjrLWvp9Er1RFjEFvCvlTgjT
	 n5KtYD4mZqVL0i2rWSyk3N2LJBVlIm/BlSBh3HjATvE4/ZRk6ommqjvA/qVvsCnR+82W6
	 WTphbioG6J56JcNB0b5ZciP0EQe0Wzg458N5XsZ2+ha6s18L4SGOb/KkiyDFOKSYzhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926875;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BD7k7zCVvZ4xAVdVTnILtyUwjpDxQ8TdyWPHkLOxa74=;
	b=GDnieufQKr9g0GOnHlwvlU9m3GPctOW3udVxcDOPg8mMhkpUUXuHvXEzN3QLCM8UmkgJ
	 3GRsigLgxvxrsunl9XzW52M8HTx5tLYs/E/IuT1EZNjZDJUEba1etEnmfpM+lX88q2skt
	 t2r7474qgLgmY31ZcDq/my5Vk5cCxSuuvyR39rhpRnlxf3MyS7HT3inWK0Xs23IP/98uR
	 mI2SMJVxDww+4y2dBYueKEysdbZrrpIT9bftxpoQWqdPtys3UEg+7+aTNdttaTYulBRDd
	 e3yZU/t5H3X6wl4WEghOrutaeJvQakivX5O4oh156jFcmVo4EZoOlC5x+j4isTcvGBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABDZS5mr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9415606A32A;
	Tue, 17 Nov 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABDZS5mr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C491F000C5;
	Tue, 17 Nov 2026 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794926875;
	bh=BD7k7zCVvZ4xAVdVTnILtyUwjpDxQ8TdyWPHkLOxa74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ABDZS5mrGNTdWAyXJnLIJg3Ez7Cb6GFkJxyaDNBbyfHRr71XABCN4Ql2MZ42WtEdP
	 sBmCg+TZIubXaJIXONbhjb0f/FfmsdbuREtjYob55CywoM8dWfr7txYrp/vAoAbaUi
	 Pm4iFUnJwvUS2S4kOyRF7eJDG9wN368KQtwFxG9yzuH/jTt3wi/pqIY+91TMG4e34w
	 tDZcgSVc3/gGdyoqR6kHMprZVBQYJedfQuEDFjKniyh4xFHTrbSh3kKeK0lJQf38e3
	 azv+oy7O03JDZJnUVm0K2USuL/gwx9O+8f0P+uOwtMxwwLSlxoDrS9dgxLuozeyR/R
	 qVymKd8Uc3wZQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, lgirdwood@gmail.com, 
 Vijendar.Mukunda@amd.com, Adolfo Morales Tena <spidermanadolfo@gmail.com>
Cc: venkataprasad.potturu@amd.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261115232942.5820-1-spidermanadolfo@gmail.com>
References: <20261115232942.5820-1-spidermanadolfo@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ
Message-Id: <179491899197.77896.10039967926982229984.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:36:31 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LlLckqsCTdXml1JIflub3z9ZEfUEircgOBJL53406L8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+ZEqckpRhOHVOXvvRu+YjPtv2pItyvq17NfPxptime
 UFlh2wmdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiZSoM/2MqfM4uTgr4fT4o
 XWHvzkmNG/2y72xKENy4MMvn8FrRq+mMDMeqf1tKN7Hun9zB2hO2cb/EmYBfQSeXN3W5HmqzyY9
 r4QMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 00:29:42 +0100, Adolfo Morales Tena wrote:
> ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ
      https://git.kernel.org/broonie/sound/c/f32a26faf4ce

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

