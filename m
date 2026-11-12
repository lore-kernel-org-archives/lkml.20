Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502448;
	b=3tp7PFJxHqBeJqDPc5Rk5S+5ldh/aEk4u8X3ar8ooEv2iA9+MJNcRlmglU8MDqtOB/1U
	 C4llWHMssHkSs2aD9Wr3n24/YdiPoZCECy9QEHjh3W+zlL0ZUP7CPtCuDm5j0+aT1ksaR
	 phq2k47nOUBUAqF662/CzQZaEJVeNRXrNvo3xjg6YKRB+7p7gbhxzaYB58JhrzbhXjcJz
	 UQHZNvM2cQR0IOXVEnAsc96exEhLio+5jYYG2UmZEu8PbCbMRfVUjUgzSHDSaVAfSd/5S
	 6EOisylvbdC5h+QZb/XKLMiJhwyfoUAoLp27+fSUjf3cO/AdhxjZzYN+lKgmyAJLuaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502448;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wNN4YpL5ylbd4a0uMOQKzp/AxC4amBS7NRQqXc+1+PA=;
	b=bl17m6Jib975KSo1aYgWltoSYVcuZEPw3NymzYEvwE7k9O2bCpBhjnrMwr/vlMw1GR0a
	 7b6TtTLOPkoTOxYqqOBtD7WRa0q/TgSUvDz7WbnX9K8OCXzDk3/3JlSTFwtjXigdn1svQ
	 oD/XRN7+kV06wEgrr+z6If1qKJBMWgrgAICYr09xjUhkm9T1YvyM1bC+8gD6Ee1z3vL5z
	 A+hrMN07NQRbP0k2kO6B1W7IR2ryGBO6pBUpUwvd/m5d0a1VZeGq5Q4RydIxSrXmw81Fd
	 VuTVG+VLD/2M8DR3MmtL+neL2A0IP2+lQqsBE+m4pVt1hUVu7+01oe5Yb94jmwsedEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaiQ2EmW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E038606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaiQ2EmW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A18B1F000C5;
	Thu, 12 Nov 2026 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794502448;
	bh=wNN4YpL5ylbd4a0uMOQKzp/AxC4amBS7NRQqXc+1+PA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TaiQ2EmWAUfxTKSsdv+4CgEWyiu91oXg6Ra46Oo5PH5thNb/I55+oFIDnrQANySrX
	 sebsuC/k8Y629Y2mtmudER5/2p8ziOPCeLHSXq54kUsVO2htOy3FrEIunw2d/7Ay++
	 WzaMPxNk4Ks9ZmqLyTOvEZzE2VjOX3wiFGwgSpn30wwNs3Ko7OYzT6uuYE3riORG8U
	 cQDQoIq0tPzuMq/P5STM0KFA8dMSkT4dtUcDgmABBMKfYDGkDWD6i5DGQkebtTLN8Y
	 ou6BAzfpYJcy1RwzzjYPDax6i34rSuGAd1MH8vQS5gaz4dH6srWyvZW28wb17FJbd4
	 V37G8jbIL6yTw==
From: Mark Brown <broonie@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261111233933.537905-1-afd@ti.com>
References: <20261111233933.537905-1-afd@ti.com>
Subject: Re: [PATCH 1/2] regmap: Users of REGMAP should imply the needed
 support
Message-Id: <179449924588.339049.6211505549715532123.b4-ty@b4>
Date: Thu, 12 Nov 2026 16:00:45 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/TPpMtTcDcgQdzoI6XbPtzITOHuIlnaBa9UZ/eqGrG8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+vtftkA+qypv6gj+p8Yy7oZOE5TIzVSa5Um+Ztwk71
 zk+7braUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgImc42f4p7V3t8dcnl07RGfO
 errarMNUsGPThnX6c/Ydeuuo8mCayQaGv3KdUs9/TPvOP+dvpP+Gl6daWtj2CaQYX57BNy3xpOp
 9dj4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 17:39:32 -0600, Andrew Davis wrote:
> regmap: Users of REGMAP should imply the needed support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/2] regmap: Users of REGMAP should imply the needed support
      https://git.kernel.org/broonie/regmap/c/613e9c853ac7
[2/2] regmap: Remove no longer needed help text
      https://git.kernel.org/broonie/regmap/c/5e7cf616191e

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

