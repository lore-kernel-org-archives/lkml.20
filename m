Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393362;
	b=dvgKlv/e1YmFnyfDEZNSMlt0+L3jHYcV/o8RzDKHV4QyLMT0RNu8Nx9v3GVBnerjTmCh
	 NXmm+LX23E3rAtwOYwzGHY9J588UQKvgTcql++/GLUfTj2LoGCSQ50ENI+KYV1s2RMObV
	 fJNMpMVM2tWez9+ElgQjJcavNrt7vfdjDLrHA3KHBJHcpZx4QidjRYuNcItouRVTkMy8V
	 7ZVK3GpB49C9W5Fm5/gBh0Gorn+ELLqJYyPKpKKsFchjr8i8twH2BHmeV3K0Q90C8jQhK
	 xdnJKdFz+Qm+HzYgj5L85xC25G9Ogs1Gdls7YoK4TzGqypUwtSJiVPLGSXPhs8NPsWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393362;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=FehRXX4Stph5bNgJRcY2p31MCxiwJdYGLNVrEudx5Og=;
	b=WQPJNbyazxtou2XYzu/ODw7bYsDlvwnhEsvgkoWuSWAln0K19O2ZushVSpZrQU727t85
	 pa6pJjXvCPv8As1A0ZikcXp9p2uDaH77cReP74a/ZOdA7RvcKw2Ti+0x1VBcNB04Pjv5M
	 a7whRMmvVn6SLZubrT4Xqg7S7tHhnjDx4rkt9MHGZz+P33x1xCI2OIwshEMlcFfRAZl/7
	 UVmg2vKk8QAhqAbU0BUka33ew0evQZjGPnGZsPQQJd8galIOe7YxP5aE+ahRqAf5bkmb1
	 PWr1YoeXFjk6AxLkN+BftogRgdCU4F0Zrijr7iujDhdz4metnE9SNEJ+yf+h1O6vZBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JJal29qh;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970A606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7970A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JJal29qh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 41E4CC69165;
	Wed, 11 Nov 2026 10:35:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72C766017E;
	Wed, 11 Nov 2026 10:35:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3002D11BC10EE;
	Wed, 11 Nov 2026 11:35:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794393353; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=FehRXX4Stph5bNgJRcY2p31MCxiwJdYGLNVrEudx5Og=;
	b=JJal29qh8KxLlwaaeTmgOS1Fa9nzxmHLsa85/cNw7y5y47iR8TYkNNhFfsVf0x7asHyA2a
	Fk13c2vErKUarfzJ0SH8csQh9nBwkINCF8O3lo5eRqZHN3nhN02I3DoLW2BT6pgXJZy78y
	sJCsTq6xUCovUbvcQp2frb8ICe//GIUlZjkjjs/f5pN9rDFyA7wQagZdjpuhyCLEWL3Ita
	+tANQBJ1eaaV2gsiX19tl/t8gHI7C0T/6Wpwg5oPE+s9Oa4/FTUorSfcEL57JzCmdo7Tm9
	tGXqQbTGFBINjBwiUcCFxqFHQ6R3Cxmd5SpWUFUvBQfFTG0jSrK32XWitOsVUA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 0/6] spi: cadence-xspi: Fixes and ACPI changes
Date: Wed, 11 Nov 2026 11:35:35 +0100
Message-ID: <20261111103541.100848-1-paul.cercueil@bootlin.com>
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

This is the v2 of my patchset that adds a few fixes to the cadence-xspi
driver, some cleanups, as well as a workaround for probing the Marvell
IP on firmwares that use the base string.

The workaround has been reworked to check the board's compatible string
on DTB and the DSDT table on ACPI.

I am not dismissing Jisheng Zhang's feedback, I had the new workaround
patch ready and thought I'd send it along - with the understanding that
if it's really a deal breaker then you'd skip this one and merge the
rest.

Changes:

- [1/6] is a new patch to fix the error reporting in
        .transfer_one_message that you reported on the v1.
- [2/6] was adapted slightly to work on top of [1/6].
- [5/6] drops the error messages as devm_ioremap_resource() already
        prints errors.
- [6/6] Replace the workaround based on the presence of the "xfer"
        resource with one that identifies a Marvell SoC based on the
	board's compatible string on DTB, and the DSDT table on ACPI.

Cheers,
-Paul

Tanmay Jagdale (6):
  spi: cadence-xspi: Properly handle errors in .transfer_one_message
  spi: cadence-xspi: Reconfigure to STIG mode before SPI message
  spi: cadence-xspi: Inform SPI core about size transferred
  spi: cadence-xspi: Drop useless cdns_xspi->cur_cs
  spi: cadence-xspi: Rework resource discovery
  spi: cadence-xspi: Add workaround for old Marvell firmwares

 drivers/spi/spi-cadence-xspi.c | 157 ++++++++++++++++++++++-----------
 1 file changed, 104 insertions(+), 53 deletions(-)

-- 
2.47.3

