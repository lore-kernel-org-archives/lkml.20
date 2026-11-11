Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414913;
	b=fySrK+UPoHO4JcGg0rLJoMrXecPPrJ/sj+hCl/0qtewxZa2iLpKLihQSEx+zaebHIp8a
	 yJU+sqWwqaiRAr5HJyQRKgKpt3RjYG5zabhJm729kW6K9R3tosvipR2nCUcsymMIXIJwQ
	 oPgb4NMKlPfyG9GcIx9WGJ4UHmaoNp3l7nsjfWG2ypliGSk/Rh+HnjW1NiQ3G/ruYGCZ3
	 JhR1Wuqwx0I48fs9Mf8tCfsVGYTJzykM4HOsx4CPOKmKejpVcRj/ikmWs/24VZyVEt37I
	 Qxn49vSfizW2Z+uVYbXbXWm66UVpEnng1E1DiJKYv1lnAUbRA7u1kEL8GE/5jGgHJuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414913;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bIJ0i/AaUCrs5Y5PiLBb65+dT3UxOiSnp6MSr9KGzzY=;
	b=SSziUVnFr5a3bu9mwmtH4I5ixU80kuEMgh81iUadADVWi41DzvdN3LuT2l05XGc+ieG8
	 x9K13mSnau0d8M6aeyYwEPvajsdFFVEkzcw65RyxG5J7I4lY/LAgB4XEPpdLMuI6fZVWe
	 qlS22afZOyficlQQao07dfyfpPJ548B+BpzeBmKoX+mRLLM8MMaAtmhxoRDaoHl0wB6ky
	 STVgz7KEdfOiGkslXN9LnyJB4PWE8jeAWvaMSsxtljy2/yY5+oIYFFKTdLh+zoVUWGThd
	 aT3iNFVXGsuCIYVpESxG0X8TTVnwh/mezqoalE5Z/836C9PbfPtrd10T4AM6IXpJPNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxb64Ial;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885B606A31C;
	Wed, 11 Nov 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxb64Ial
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687001F00A0A;
	Wed, 11 Nov 2026 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794414913;
	bh=bIJ0i/AaUCrs5Y5PiLBb65+dT3UxOiSnp6MSr9KGzzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dxb64IaltS02z0/CM/dhhclHUTlnpdRzp13nGrNCi0B37S9V79O6Bvxf5xs5O7KcY
	 re+7b6D/iM0C/8oxL+DsurYFzr4h1jKU029AQzSu28D0BItA787z7HBTcsK0XistYa
	 lBpRjIo08dQGtXEuYOuOwQ6uJlMRAPJA66dUMNNIER8lcx6hcts7oo0Bi0IbSef04m
	 jWpaOSglz21TLAQnhYJdyCrwVAMkPGq5yCQWczDqkI9y2Wb08dFIv2oyyiKPEagsa9
	 v3vAdSSpjPOEVelKhhqCLLbC9fo+qlGSJ80KWDuWuVCinIn3WsJ7BUpRtYAs6k2V/8
	 AaGAHgt0Pc5hA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, shumingf@realtek.com, 
 fixca <jaehoon1744@dankook.ac.kr>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111013953.4011-1-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
Subject: Re: [PATCH RFC v2 0/2] ASoC: amd: SoundWire audio for LG gram
 16Z95U (rt713 + rt1320), speaker still silent
Message-Id: <179436364733.990685.1608932887003452389.b4-ty@b4>
Date: Wed, 11 Nov 2026 02:20:47 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UzNoKj9x009OmKv88qSXzCYEiDk3B+iLthY5nDt1Vy4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+zLT7J31ouYX/cTV/Yz72yWc+acy4fmF9TY7uSxUWl
 kVLy++7dZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi0g2MDBt2vH21Wy6slu3T
 FwZJBrGnC2yStvFfO8i/vlQle+11ywqG/1UswcyflsRoVrgtcuIONHuae/eC18MGjtlP+gR9hO4
 p8QAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 10:39:08 +0900, fixca wrote:
> ASoC: amd: SoundWire audio for LG gram 16Z95U (rt713 + rt1320), speaker still silent
> 
> The 2026 LG gram 16 with AMD Ryzen AI 400 (16Z95U, ACP rev 0x72,
> PCI SSID 1854:056c) has no internal audio on mainline: no sound card is
> created. The same generation 15Z95U has been reported with identical
> symptoms (https://github.com/CachyOS/distribution/issues/516).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
      https://git.kernel.org/broonie/sound/c/067db578cc2d
[2/2] ASoC: amd: acp70: Add rt713 + rt1320 SoundWire machine for LG gram 16Z95U
      https://git.kernel.org/broonie/sound/c/53094890a821

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

