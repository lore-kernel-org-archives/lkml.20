Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245842E8DE3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314753; cv=none; b=jWV2twcR6+/zmJkc9Z5vDCzIDGp+XKSj3zbeH2kcuLWvXLT6ZimR4lyoizncyikyq3QFAQrJq9+wHHCz66j/65Ke0OyBqIWx2e+S6uUjj4hjiet46u3EtOOvsUQ2zWj82OmjwgTJcmaxne8a+B4lKYOF63a18a4Ge/BhDuWiBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314753; c=relaxed/simple;
	bh=dE26FMX/KvWMme+NN2GopzFnaWi0hjy81FEP5jyFmfA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lud6tqJUInoG2Xh5mPvBYmYDdrigV7l2VpsBNfrJFAHOBBMbynk8ImZ/j2E+WXCKy07C+IAIYGLlZwwDzOc/AKa1aMPewrjUQUtxiFnW2yZmDkqYKaKaEPDdRwOHg1YgCBymoq9EtpjEbEyBf/WOK5g2BSKjv+6zVKyv7k8kR40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGTpQN7M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGTpQN7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6318B1F000C4;
	Sun, 18 Oct 2026 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792314751;
	bh=RQpolw4ScWKwYoR2apn0MpSSg0a3ejn6xbyYHc0v3JM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FGTpQN7MvCVUyROYh69TsKCxCnI+kkO1KSaGVDrVTpxItXZI+SDgxyZvnvd597VhJ
	 odGeNmwfl0oxeYWZJMP6qFraleMO5vyNBoud0XNO2zi0DmEyux/VKWHv2PU6sfLTyU
	 vcKzTJrUOfksaN1qGb+zzI4PVYF7DMu+SOsguyCh6g22/nY6G0GuU4NQ5RDNF52uHN
	 MAJeTWymn158zTo2YizDxWY0BIi9UYOZxy9B8LIeBhpqNxfH2jdy9mqBH4uEA8Gw0m
	 ZYuOC9vXljUd4me78UApq9iLaWffA6Mn32JozgT9m4KcuJNHqo2rprkGp7WMCwFKgC
	 m7plnwRCtzURQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Marek Vasut <marex@denx.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-attiny-probe-fix-v1-1-96337ba58dfa@ideasonboard.com>
References: <20261016-attiny-probe-fix-v1-1-96337ba58dfa@ideasonboard.com>
Subject: Re: [PATCH] regulator: rpi-panel-attiny: Fix probe failure after a
 host cold boot
Message-Id: <179218080347.3162228.8143585835984094953.b4-ty@b4>
Date: Fri, 16 Oct 2026 21:00:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dE26FMX/KvWMme+NN2GopzFnaWi0hjy81FEP5jyFmfA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKu9JbrTFts+aJz1cuZOdPO5i5+vGOf44ftiwxe6PrH5
 E8sFU0/0lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJPDjAyHA99+T5Fa8WPV5+
 Lci5cnm/w3eufR4P2Y/Nr7+puf/No8tPGBnmJikkhc3h23hz5x0v12vRzttDv7zkeLS1c/4e07Q
 P2WcYAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 16 Oct 2026 10:52:43 +0300, Tomi Valkeinen wrote:
> regulator: rpi-panel-attiny: Fix probe failure after a host cold boot

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: rpi-panel-attiny: Fix probe failure after a host cold boot
      https://git.kernel.org/broonie/regulator/c/ba83dd4a47bb

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

