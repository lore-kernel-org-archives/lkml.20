Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743450;
	b=PzAbjkEeqziJoWPvirdcCvglBVMkvBBP/k1c++yy9HbhIkhNXA6651Lnd4OxXRHKMv4O
	 Gst7vNJzRteiyKttdR2OUZYVc+dFA3KE0d62IFBLI5w4Rb9IRCpWq7hlZ1cMDKHGD/d5f
	 MIyCYGBAReCLiD+u5TfK1AmBgGSsWXBzCpKE9vrees7gA1Xoki53C2NamnhN9IAOypq1c
	 V2bT2AXwWiSc+FLqdlYdXMwPAuHbiUekK/GYFej33qoH+jBSraMMOZ0Jnp/W7HGhPliwo
	 kTld+n4jWbbySBO5vI6XOS7tbDu2KQDhlSQt61NBnrc3oYljKOe9XpvZqtPFXZvYApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743450;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id;
	bh=M0m7c4ZYrhqoJnyUVsiTqBcj38qZkX9wlOKZI91S8xo=;
	b=sDMuccKQfBQwurBmqwTIyLYKOVIMMA0RxXQzDmfV0lYLtQHE3KeUfFtOInOukMCjXUFq
	 tmhBqrUGfQECXE3VVh8xhEaxMuMNSTgThqPDMFDyJr7tZUbs9QwFB74qpnu9WUrh09or5
	 lQcwHFqocoUrFcI9F9eCKjBriL1hmCE5GYlp992maLHFoCLAp8TPcgM2DM4viPwuoZWS2
	 1FBzuqXstOk0Eo3DwgkQaCnjwWy7UbPWaaLnuVLC975xxP324hBzVd0trvVd1o1wNmnF8
	 hnuReWPwVkDYHFNEtStEt8TowbqrwbkyWkV7rTfQZPSgqEHgqyTwrVkrs33OJA++OrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFFOgMOE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E74606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFFOgMOE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FC11F000C4;
	Sun, 15 Nov 2026 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794743450;
	bh=M0m7c4ZYrhqoJnyUVsiTqBcj38qZkX9wlOKZI91S8xo=;
	h=From:To:Cc:Subject:Date;
	b=eFFOgMOErqluyZXw9pwBHgF29CpN09UL1EJU9TtIXpWgxm+/Rnzr4JTqdsivj5f9/
	 38gYJUG4vcnziHJLnVmPqShgrQsz11i5ho1/ViRUnaKrnumj1JbJBx65n0RF5FlTMG
	 gbufgG7rvIgXg3+hCtXh80Nix2uVfQNehTzi3jTwSYHZ1kXISwxOw0IwgmESC6sKH7
	 ugaVPIoEaMiXDxdPKl/7sD99N3bfJWUVVcbjpGtxbb8sVj1iXO1+MqabFK7M9BhAKB
	 MsTPYKhrGvXVoOHGdhA4gBpRbqDN0dx86nhq42A7CNrd3sC/elPQ/CEQ1DbhXPqhz5
	 NcPMs3mJ09eng==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 3EEE33366F2A; Sun, 15 Nov 2026 11:50:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v7.4-rc2
Date: Sun, 15 Nov 2026 11:50:10 +0000
Message-Id: <20261115115048.3EEE33366F2A@traversing.sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.4-rc2

for you to fetch changes up to fd89c52811a4c0754795199f86e0889bee7a70a3:

  regulator: fan53555: Add support for Silergy SYM827 (2026-11-09 12:49:15 +0000)

----------------------------------------------------------------
regulator: New device for v7.2

A small change adding support for the Silergy SYM827 which is a
variation on the FAN53555 so needs some quirk data and a new DT
compatible.

----------------------------------------------------------------
Ben Grisdale (2):
      regulator: dt-bindings: fan53555: Add Silergy SYM827
      regulator: fan53555: Add support for Silergy SYM827

Mark Brown (1):
      regulator: fan53555: Add support for Silergy SYM827

 Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml |  1 +
 drivers/regulator/fan53555.c                                  | 11 +++++++++++
 2 files changed, 12 insertions(+)
