Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253439;
	b=G9udGPHaHikQaVZAvBYsJYAkXIJQSCvdjpy7A375eXIiG2Sb1ofcschofj3i/ZxlhmZO
	 y4vAkHrST81ZjsCQ6v+EtNKavkpeBrRiMXUO7cy9EurMIiT8Gi9s19G4BW0XeYt1jAXuz
	 hdl4WnsyPAUxQn1izCSgrNiBHNMIiEfIAQv/vg5bdLLVY7tyOqoWowYCB5WEgTGXpK6md
	 2yFX/0UlxKHltiMYwUecKw/ipoNUu0HjgTZ5r6HakrZUbcpTpATtm16824uQXZV8e2act
	 Rd+L4QDYoepxdFeZUsoJ7VFOVFpnOk9aJu03tUvDNDlgQ2C59jmZ/Regqh+p8lz1oXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253439;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=O7fqo0aGoUCDdpeGPuc/WauxAsuVXxZm4WQ6oBO3W1g=;
	b=stNiPADipglh5EZ2XW98Qmy3LkJAcVpFuKEbVLYl/ADW+0quhMAWdtFKRfEn4rXKYj74
	 rgv6Hv4ACv+YBNnVc40Eh3pCmUvdwiGmHLzoUDBPjDZT07SpPL3dYmJ1aXiD7uC0apy7i
	 huJfjeBqTCtj0I39J4tjY4AsOtfSgR4+MRZ7LpCqqJw4X5wRcQvBhes+V80Pzn7BfZrRO
	 8fnjKnuYHvkzTwjfYVh5IeFMhc9t4DIWsfNLhwZ4tltwOisb2iWo1tsTPZVvymBYaIyxi
	 AwUUUeyAKmgYekuwg9a8o/kYUfAUMci6bKOGX9uLEXLo5NDzD54uHuu3hPOoKfMY2Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LCZDdEYZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355C60A2609;
	Mon,  9 Nov 2026 19:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LCZDdEYZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE2A1F0089F;
	Mon,  9 Nov 2026 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794253438;
	bh=O7fqo0aGoUCDdpeGPuc/WauxAsuVXxZm4WQ6oBO3W1g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LCZDdEYZBJKSPgVvO0u/Cy5HZOUpjJeOBSaYY7ULxg56Z1cbDgMgW0IH64skcaWlL
	 v+1WGoguaxwUOvI4sqSU4DtMnQ6+frQGVYbeJYXErIDL9MVLM3Qt/FLY9GZzjQpFjv
	 4LW+t3SyB51Ez9I5z3VA6L19c0/ADYdCVLqaW0ceGM2is8jx+dwCY/5gfuNdNwiNYP
	 x4YYCPt2l7GPTdJs/dLLBBZBT8MUgKFJLNQlf/URDHxWp6p6k+6CuDnpGcN9WIljY4
	 kM9jPogSfTIu72rS/Zs1Q0rJ5vimwyAm8JEZRvnF1XyoYtdYpyqUrMff/+MJE8DoKz
	 cESSpZeqQldlw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 448632FC6BF1;
	Mon, 09 Nov 2026 19:43:44 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Samuel Leyva <samuelslg03idk@gmail.com>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107232225.3838-1-samuelslg03idk@gmail.com>
References: <20261107232225.3838-1-samuelslg03idk@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: amd: acp: Support Huawei MateBook D 14
 (NBM-WXX9)
Message-Id: <179424320916.3711751.4073109130655151045.b4-ty@b4>
Date: Mon, 09 Nov 2026 16:53:29 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0Gq8KpL50aNurS4/WJgxLACOJC3iZzPg/lhOWsjdsvo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+KRXcL+Sfdnh/S7/FL65FF9oco3baRKzgOv775GIXr
 W0HDixP7ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEXpgx/HfsTW9e94z7HlPK
 J6Og+LbpzfsVO7hi5y35qv2m/EhRUA/D/9z7J0+fYNHpPsAeujpP5WZln8Y9+1Oq+zJvfX7r7n/
 8DR8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 07 Nov 2026 17:22:23 -0600, Samuel Leyva wrote:
> ASoC: amd: acp: Support Huawei MateBook D 14 (NBM-WXX9)
> 
> The Huawei MateBook D 14 AMD (NBM-WXX9) has the same ES8336 + ACP3x
> audio layout as the already supported BOM-WXX9, but is missing from
> the DMI tables, so only the DMIC-only driver binds and the speakers
> do not work.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
      https://git.kernel.org/broonie/sound/c/fd10c1c1d506
[2/2] ASoC: amd: acp: es83xx: Enable speaker amplifier after the codec output
      https://git.kernel.org/broonie/sound/c/f392763d7335

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

