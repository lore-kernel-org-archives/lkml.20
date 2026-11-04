Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786859;
	b=E0bpewvu8PlXjvJQW4pIwRZ/kw5VvEgT4CtTznn6bddx/xSmCdpuSy9lPpk3kTuKQqAe
	 6U0tmFSA37f57ArletgW5YGMqoj/OcLcG0Nw1sQ7wnwzeLyVv2UlKBdzCHUVDRzpTcmYJ
	 FRa9GHZWI3UYJd0EIJ1WeZTrrEQ7QLwUfRaPqsZxmjH5243F+J8hmOLFZAMQb6RWA6oqN
	 1LosmJqT5Ow7m3zTEq4eUrXIR5odF/tiTcWIaUQaCMQNyr9QEQyzfCLy63SYjz0BbtrZ6
	 gadX+L/yF8nJQQhAewahZDFn7UF0C+pQl+HiqG5bdU0zCw/8POosRRvXfms9Ie13JgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786859;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=hgPMTyozEX0Bob23rV+PxYM8+DzQbrvzgXYzL5B0Tso=;
	b=lkcES4jJIdWC3BtfMOTQo8pQHvpaoPbiywcWrFjdWTqf9xltrRwL3Y89dRviLg8ZBQfq
	 NSOJ04Q8KgsrH2SupdGB/G28Qw6eZhYgQ1mqYZt9GGZjcOUG+t9nYXNiinRjMpFvynaaw
	 cAtb6wWK0PF/z5M+qnYV0MK7E7+d9rJ6vDmfXYFIlJsb9I5+lczZ+TtQPFtmOjKD4SyEz
	 1o+EVheFJUbm92FmL396P8ynByy/aEcBk1FdAO6M5znAN6tJURo44N9AzFxXqu88rQtHk
	 v2V7cUv+t67vp4Iv6wn5iV87O7pM9uf+9EAGmi3aQchavEdccplEpahTpkaPLgLp36A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VuGgTG1h;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C4606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VuGgTG1h
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64F104E413F7;
	Wed,  4 Nov 2026 10:07:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31AD960770;
	Wed,  4 Nov 2026 10:07:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F146B103291CE;
	Wed,  4 Nov 2026 11:07:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793786856; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=hgPMTyozEX0Bob23rV+PxYM8+DzQbrvzgXYzL5B0Tso=;
	b=VuGgTG1haXL/EbQWSGc6mcJ4P28e5ym2QyUNVQ2iYAyavjG0IugbfOQDAT24Dt0UHoRH3n
	Br7YSPiL1Jtg7uqNTo2lnJWkWpR+QztYov4XyiGxx91FXr72gkWKbqrwAwiIrhndESQY4U
	+ecyZnqH5g1kAnGWwYtJKyBIgcGSmY6bKUCrKxMM+bd9m7eO8+0h8SFPPrX+/XHtH8F25M
	cgWAsFWIDq1kBfZfub7ew05UopP+VdPysVyhUTLTBFsHQBb6Wav1W+AL/Mwitrn0ZGX0j0
	Mirg6Qbofgbft9oMvVlWhDCDGRm0fTB1Ub/CuDLQhUq4G0uxN8Bb5D8YqNdURw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 0/5] spi: cadence-xspi: Fixes and misc. changes
Date: Wed,  4 Nov 2026 11:06:38 +0100
Message-ID: <20261104100643.162694-1-paul.cercueil@bootlin.com>
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

Hi Mark,

This patchset adds two fixes to the Cadence xSPI driver, some cleanups,
and adds a workaround for probing the Marvell IP on firmwares that use
the base string.

I understand you may not like the workaround, I hope the fact that it's
tiny makes it OK...

Best regards,
-Paul

Tanmay Jagdale (5):
  spi: cadence-xspi: Reconfigure to STIG mode before SPI message
  spi: cadence-xspi: Inform SPI core about size transferred
  spi: cadence-xspi: Drop useless cdns_xspi->cur_cs
  spi: cadence-xspi: Rework resource discovery
  spi: cadence-xspi: Add workaround for old Marvell firmwares

 drivers/spi/spi-cadence-xspi.c | 105 ++++++++++++++++++++-------------
 1 file changed, 65 insertions(+), 40 deletions(-)

-- 
2.47.3

