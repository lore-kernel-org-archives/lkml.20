Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657871;
	b=c6AJiwTRxRFkNEgITcdZNj8Jz3+AcJaZxeMXpVcKu8XoioY/qrpe+bCcjJ81UFSTPK98
	 onsMOWepS5WirXnThE6d8t1iFZcfI967oDaNmc2oRKj6Bvo/alN13FuJaOwl0u3GYyNr7
	 xFiayehweIsmvyms/cTUJVdEqcbPbPBZKpnWgCLm/yvkCzmMdOCNWht1ER6H5zTcEI3FL
	 mPOFQysmLbXi29V0CPMkcX5H/jJSOWjScVZq4LEnpjR/ZvrD4ZPASq3zM8nypoldnYCVm
	 iiU679qTZgmkftpgffuMDi3mRqvgbf34vNhY8vkApge5uuPG7fX3cBJW9dXc+h+UVAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657871;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=fN2eeG+zPzKpDfLyb8v4rr3ueZKYuXgrlC7Wm/EpsAI=;
	b=tOxau692vND12XKELUo9POh3Jr7AehXtxpSkKYvZzacFEW8seR3WW0WQeBf2TB5ZA9oN
	 9TdV4UZUmgel20ejxyw+O9Ovdng9R5qnF5YjsRmn1nOvUaxvGmILsXPRL42YUYCD0hbVc
	 PDzMMipgQuSdPJgQzY5jx7gxFG1al0LyvIH04eJXdROQSx2KcCwBZ55aqZaL7kXb45gaN
	 DkZA13EnZNId88kkeO7fnwDDyV570iOxCJGmfntogJfRui1IBbr9fFYR2rYeppzEN35oS
	 lqFKWnN9jOjyN5Bc7hDgu1HHGidNIE8ftKmFeuowaGYcV3/J7d8pHYCE03pY+WFRD3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k48znoj7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB360606A339;
	Mon,  2 Nov 2026 22:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k48znoj7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FC91F00A16;
	Mon,  2 Nov 2026 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657870;
	bh=fN2eeG+zPzKpDfLyb8v4rr3ueZKYuXgrlC7Wm/EpsAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k48znoj7UTrSU05Zu4sJqDNcyMcW3R/uAuxE2lZRaV9mU5uMMrBqMHbsr7Kb8HAIX
	 keTsKaxY+6SnakiXCUe5RVgo2mbQReXlBungVjzf9f0DJiRKM654FWyAX4hy6XPTiN
	 5HVmLcYIeV39LJ4Wa16iEPPm+9NaGfgxCKA4Jd5KQGNIJ8HTXdM2UlliwMEaJiWJBp
	 qx4rVylSQoiVZgApICnYztb0TaORncJbV1Agw9W323OaEq8OlQPDKlLsqHM+S+cTkn
	 zA7zANmS4r+NLj6IR8xWOuhdK0/J8oPO6TYXmmL/MHnMXZMiXjbINVeTror+6fk9GX
	 z3d6u9tNXktSA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 3C9322413105;
	Mon, 02 Nov 2026 22:17:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261102142812.2743578-1-robh@kernel.org>
References: <20261102142812.2743578-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Fix MT8186 child node
 names
Message-Id: <179363993107.2092401.8362129164558129787.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:18:51 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fwgjm/VuQu6K+pEP1jSyFPLSORFoYuS0oYdG/YL+fb8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe8vC8rfj5uONiPPPX+1FqZmbbBQTKpTnjeBTurQtbM
 amR9X99RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZSxMrI8E+sYafNl0Ov527Z
 03Cf3y4vvD99ko2rIpN04smACXaHvRn++/fOtXMNf2NwsXTXDv6/as9WdzfPXmxsNGff+wtL5Co
 3cgMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 02 Nov 2026 08:28:11 -0600, Rob Herring (Arm) wrote:
> ASoC: dt-bindings: mediatek: Fix MT8186 child node names

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: dt-bindings: mediatek: Fix MT8186 child node names
      https://git.kernel.org/broonie/sound/c/25a38dd4ff95

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

