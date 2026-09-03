Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4178328267;
	Thu,  3 Sep 2026 22:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474262; cv=none; b=pGKUoEQYXJvRYBSpgB77rXLU8Fd/7ZmCqWCxZkKuvcRdTKSWfA9ldB1vz7pFjlFqbTI6wYiAoJJzD+t2HUFprUA6Fi8pkPlCAHJSwWXW1DI5WwpVFkgIDkP9uPb8yDS9aGskYn20O5WO4E6vYMRjELKUopV8tkzYPWDqd8Ep+Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474262; c=relaxed/simple;
	bh=R5ecAYavOe/shWm/VHZyOlX0ILQ6IoRlJWrBllw86so=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ewzpQFitxtTkx9+0fNJO+nlQod5U9kc559tX42UllPYV8dsYY/DsWmA2ITESxGCP6F5JoZkPMdd4N4wbea7mfUT4CSKvMBgqESMmKWiuwuJTXQvzVjQh1h5N1RPf5QlhZ3+xKYwGuKG3PtmYpCqwjI55hqGRucPoRLUYjTZpwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfsP5sYC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfsP5sYC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3331F000E9;
	Thu,  3 Sep 2026 22:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788474261;
	bh=r4Awgxk/6qZuiOs5NBt5iKLdvwHRlQ2uTPMeZaAPeN4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=BfsP5sYC5/Nqio8sYBOh02H7pgewe4wVisN9kP+lp33gRywxmrMQN3m55asg1ljwb
	 V70GJjlOaK4UQusnacxTH4HHAG0zvDr4NKrpPX2/+YtlUrB9AGLPYkcBc9MJDTvoKq
	 LqwiELoZMy8Jj8A5BDEq2H7eEoZJAMIGSvsq7FgxDQLFU+WLkLXYBrkRa03ENyB4n5
	 Wer75FnMMZuFbMiWqw/72AyxOhvU736AIPMpbGwa44QiCG5fRCj/GfGajKP8w2ZOwA
	 nDdM1qLakaJbsBfKTsLdbIdkft0cgqpvz87JUGinczdAvUi+05RSPn7E6IQ165hL9O
	 9soUu5ewR1+3g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audmux: Replace tabs with
 spaces
Message-Id: <178846125559.7659.2373412974052957861.b4-ty@b4>
Date: Thu, 03 Sep 2026 19:47:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=R5ecAYavOe/shWm/VHZyOlX0ILQ6IoRlJWrBllw86so=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmfOQANCyZh+kF83YBereludMZCIbGXvNHdv9n
 qSQ+PVVaVyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapnzkAAKCRAk1otyXVSH
 0MZ1B/911WzFcnjK0xMG7i2UmccxCAPh6RL/mwROCe+M5azXO87QCxfvoM0RiglkxDPFuPKpnsu
 eU/Xz0Y/Gt1k3tV6S8CpmS+hlcwEDefNFOCnG19IeZ2gVLHEwR0QJUwoZzfcUj6joLb/BQyizk9
 DWuTi0Rkp0NjJQl5/AfBHRt5dAgEqvnfsc08o4mj6N41kpKYpYYFKWPoMTDYZEBAPeqRTp7JLey
 bdLtxNvfe9kW5dtw6dbun8R2VoYjOLoCh/n1keImYM12ZzpU8cXKUdABuC+NeDKJKnWQJx1MbrK
 K9HBvaFfkmdSYsxaqNs4kxnbv+eAlDSbUVtmC4QvA6T4rUET
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 30 Aug 2026 10:40:47 +0200, Krzysztof Kozlowski wrote:
> ASoC: dt-bindings: imx-audmux: Replace tabs with spaces

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
      https://git.kernel.org/broonie/sound/c/9e6ad2ba055f

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

