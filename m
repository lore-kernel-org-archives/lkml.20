Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789371;
	b=zodB4Qz3KXNEiwMvyCuLOU2j0qoYvLYk0GcYpAd+CE0O6hhK007AIcHtaS59pS78OY8P
	 nWi2jPxPTE4KKUBDAh9kRYa6rZ6zLO0HXxKOGChxmh54igKqcTK00x4AEsv9HKgUM02uG
	 pkj+d9dQmi1Pp2BpWyGlOkEqnVk7svs6jE/gG04kmFsimHvi+4Ga00Ckf87ToKh9v5Zll
	 Ea4ZZQvVwSTGVnLojEk9Yq/99FzsDRGFa6HHmZGK1vkIqxZyNTdHoX5I4iZiXG6e0a8ZC
	 UemEBy74ou9EBYb2B31uzFEPoreD1QQ02tAxvW8dGbGRZX1Pt+px9POzM1xwt+dTqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789371;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=PeiTE4L7cDiBX3okf4cJ5RjaFHsp1BNxTKSquB0awMA=;
	b=x4tLUO3Zx25mNQFWl+pd21pxadhSEWi/wlYlGZiyyy751pGebz+zAkPODCcALJ3JsI3L
	 W+/gLExv6boyDk/SMk2tbqLhzqsMvVZj8g7FCnxG2whTGhcwJOjUmRDW4BnjlCwdLEcHs
	 SawchckCn2aVrWBaNHz8Bq3moIsS+rMtqKW7O9au3n0drPWln9eXWe1m30t+h4khfX+VI
	 dejX/36C3Rme3pHyNjF5mToF1u/2NWRSiYe8ZYwbLVOF9BJilSRaKJQinCbWj9aVMwX7Q
	 Jotf+yVbV9uVZYnR01/YrFKEZEGHhM2wiw0Q7Ktyrr6tx+LgiyvvLSbU43pNlU6thgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=x8mLVKv2;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D1606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5D1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=x8mLVKv2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9B57C8F46C;
	Wed,  4 Nov 2026 10:50:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1FF760770;
	Wed,  4 Nov 2026 10:49:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71047103291F6;
	Wed,  4 Nov 2026 11:49:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793789366; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=PeiTE4L7cDiBX3okf4cJ5RjaFHsp1BNxTKSquB0awMA=;
	b=x8mLVKv2sDXPU0x8hMssSMe27NlCxzyArdGIYh63Rlv8YSvaAirqVpPCOKgJVrhHdvIhVU
	vWKsYx/NQ+Vv+bGQOMbONBFzWnPkr9xvtQjrhgaDvhcwtq2DpdkRBJFS8c9zngaObe9FUl
	IAvMekqKXmK3RUBOGr5OXVw3t5N4YWHZnpSYOIfzuG+p4ZgXYS48EoRKKqhQ8EDbSA4TWB
	P+rZPAeSJ9K0SxtolQfgB8enrQ7dhJQnA0846z4fiKfKcNhtU0T2mVyWBPCx58zoV7k+0Z
	2cPydq3w+78qbXt42kLJvvy5Qg2GPFNBXvJbhwxr2yKBQnR2m2M2v+8JMIL8VQ==
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
Subject: [PATCH 0/3] i2c: octeon/thunderx: Fix DMA mask + improvements
Date: Wed,  4 Nov 2026 11:49:09 +0100
Message-ID: <20261104104912.166301-1-paul.cercueil@bootlin.com>
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

The first patch improves error handling on the bus, and the third patch
improves the latency in HS mode.

Cheers,
-Paul

Tanmay Jagdale (3):
  i2c: octeon: Add error state recovery
  i2c: thunderx: Set DMA mask
  i2c: thunderx: Use polling with delay in HS mode

 drivers/i2c/busses/i2c-octeon-core.c     | 31 ++++++++++++++----------
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  4 +++
 2 files changed, 22 insertions(+), 13 deletions(-)

-- 
2.47.3

