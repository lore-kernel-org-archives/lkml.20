Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577306;
	b=5ly/9AQZG9PLvINUAhU2faM0iTQWQG3rC0ryaoV378pD5l+TUkVhjEt8OWQFluKHHniz
	 Qcoiwv/AVHWid5lphsF1qE0nfHKOEWkTMPRFcb+OXQ4b5twGSmYkTgPqKDVQFyYCua1vv
	 R4YhIwnZkec8Q0aoFiZhld+05Zibk+w7OoWHYbjk7nxE+BPLDKY/1zoSDblgxEHaFi8x8
	 Zx5IiMnRUizTLePleQEbWavOWcfO/WSB78SI+jjsrt66lveSvFnmzGewmoezFxPJ8Hhj5
	 +1c4+BSsFdCKgE6Aj+xzERLvQsHVG+o2EKSskxaryiF5sC5DRAGQ/nVqLVlI2oGNNlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577306;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=lXWADzxXGxHpcFv7Ee701Kzn+Er/ey5xktA1/baHiuI=;
	b=voL+Lnn67X2Gi8y30i43/PyarEk8xh6m4S2zKMrRI/0KW5YuQPHMQ2+9iPa66syKWkqy
	 FPoH2BHWvuzOXgruoFFo+RpgYlWPfX7qfpy+uANFv1bvkRpgX0miZUDLx04QVSeNZw5HM
	 GxazK+Xnn81sG5jJrJfR8fscAKUgL7zJWr2cYhWJRhIOhXTOmZL5e9PWJChrAeUyX/aJj
	 GYRMRanbNxwb3+TJtQ4Bag8vElMNbsqAO5iJHt1IBeQJtBeXD2n2ZIprMMWP52dm85iOX
	 5PfD2bxqIL3nmMPXe74M7hIZ26yeVE+MrZCoG/Le9ZHl2/tQ361uSsCN+Hnaawaio2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tGDy3QH9;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B25606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B25606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tGDy3QH9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F9111A164B;
	Fri, 13 Nov 2026 13:41:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6754C60015;
	Fri, 13 Nov 2026 13:41:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51AA111BC0565;
	Fri, 13 Nov 2026 14:41:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794577303; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=lXWADzxXGxHpcFv7Ee701Kzn+Er/ey5xktA1/baHiuI=;
	b=tGDy3QH970C9Sqf19bxSrzJeay9jZ2KWaPC4+yMx5LCeW4HAf1jyRzHVYmChUrWobCi9Sh
	Q9yyhIBpnN1rlGkvMnQNlRlVL6iXp+KWs66WQ5k98LolBcTQd8Pd40lrcTvUEhA4x6TJTd
	0+7thjXE/8gA/rLXqwU0iI2ID2MpGvmxjQJmOJBPK+0GApD3g7lHMD27SiXv4IhfrRYdiX
	hRLcq97tEBKWbcYO8DnduHX8dsKuploHIsb//TceHPuW6QeDA2GRxFKqLHXVVJUKBlCJIw
	sbNkmH6sXEX7Hr1yAKmvBHlgU7fYGCWJ7JGZjuhTZzjQ9I9Vdm9YyACYdr/f6g==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Robert Richter <rric@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Umesh Kumar <ukumar@marvell.com>,
	Shashank Gupta <shashankg@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 0/4] i2c: octeon/thunderx: Fix DMA mask + improvements
Date: Fri, 13 Nov 2026 14:41:24 +0100
Message-ID: <20261113134128.58826-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Robert, Andi,

This patchset adds a fix to the ThunderX driver where the DMA mask was
not set, sometimes preventing MSI-X from being initialized properly.

The v2 brings an extra patch that fixes an infinite loop in the clock
divisor calculation.

The other two patches improve error handling on the bus, and the latency
in HS mode.

Cheers,
-Paul

Changelog:

v2:
 - [1/4]: New patch
 - Every other patch untouched.

Tanmay Jagdale (4):
  i2c: octeon: Fix infinite loop in clock divisor calculation
  i2c: octeon: Add error state recovery
  i2c: thunderx: Set DMA mask
  i2c: thunderx: Use polling with delay in HS mode

 drivers/i2c/busses/i2c-octeon-core.c     | 35 ++++++++++++++----------
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  4 +++
 2 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.47.3

