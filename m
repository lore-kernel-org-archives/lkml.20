Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516785;
	b=CxO3EfODuUXrAv18pOr3pJfXGoYYMQ9Ap+GbPkPZwCG1nnBY4nWNCITeFAvE5wXpah7l
	 ipBN+qnicHkMn+6sn0FeRePkO48RmvYN1owTAjl5N6mp9l6e4hCJMMtkJL6ppTHaMhiy0
	 OSWBSeZ70SM9i3MV+UQGJytoIATz2IA45NW9mulI+4FDUcSsgVDlQXwK5uk3/IDMQ9k4y
	 GsDgR/SORyetOVurFKJKOs9ZBfx2RH0FbUU8qOVKGot7wDTFZe0lOsKPRSbtVFOC39/Al
	 eoH8BGu4XYacWNUbZ8Gnk6tCtZbr7oclmZrScB03UgogxFI2TQIHrSIWUwSf/sCcxsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
	b=W0y3oVmi0GBQRRhLVYPupdlkaWD+mORB5OxU2FcuEqhEOhcyqSSFCDXj+s7EIUbOnlKq
	 vioKpr6luJfXnj4jS0dp9LR+t/9zG+33Cl1JE6NKKaw5JUonmneSPzLMHMnzpNcTJKmiB
	 JcmCsYnQOY0t8WHHX8APawhvlpUiU4rt03HnBqfTwEyUI7IBvStLtFhiLkhEl/hzl+I3/
	 nKGLTe2IVBGMYl2/GaBfudj8ckcZuFfUo8cV3X1MpRRx19pqZnmNDJm2v2ggf5YoApLpe
	 OjULzdfXAW30OGOGYFb5PwNBjc9XmmitUqpjDdhJuYkETpQgFlwS1b92DJ7BsjdoHDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSRZelkC;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386E1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSRZelkC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so2758395e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516784; x=1795121584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
        b=WSRZelkCOScvaAilQASb4Fa6hpipGTcmN8pNyw1WWmyAy1kM9POtIW/MCBoX3pM5ss
         7DDXA+7IP/HMOWxvPDX8zdsUzaQbirkfovoOsr4JuXhbBXg1dApcTsLpnqRI5Mai4Bvs
         EoD3b6shYWROH+YT7oCeK1wb4HRx7PWaQ/EKRbpuKuc1ENzv321KHbhHpkpYFQex8Xi7
         VRlKGh5wAUS3BwnWAfh9Rvc2dPtsNvWJQ+QczWdoDcD/XQuEP+S/p3SZpFcgLH2LehRT
         fLkxV6TU0yFBE7WfooixzrliqtyQM4V6PxfaRQnWDRhkMicEPKr6cwSED8U5ptBORcin
         6MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516784; x=1795121584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
        b=lhX8Bcx9lD7oV4CkyIZjIBz20vaN4f8r1Q+5VnwrtWlLlTamxqIMe4KTrhKF0v8QaB
         Eb+04HMOULrpj3P2/EbeIBDa/GAZvaRyoK7b2mRB6lchW7JHDXhdMt0ukd6kz5sUdO3D
         KX7WL/EutA2RJwQb5UL1T32M13dIzkzF41fZIpjPK+Ota/fsL62nx/wm8RvbstqAnUoa
         AUm93tr36/psX8fhOX0vcirXSuR5nuyu0QVtUslkQOJkOuARrCpKzGIfUGudsz8MeHWH
         S0hzUbUkJ0xtgEHldI3NeGNkHGd+RPu9VDxaed4n2vPisACARZ88Hl7KDq0IHrJN0D7E
         Y88g==
X-Forwarded-Encrypted: i=1; AL+hErESo1RZqTrasSCs6PeaZrVoXd0fKuEMItUuBE43rGms0gcn85k7jAlSuMPsWNgsLbEYFaB2rFTYEVOer70=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n+VUUXpnQArv+DvuAX+TwATFG1x8LwiUClkcvhKUjr7oUzn1Z
	lqJz0dKu113OWByFQ2nB/7t0XswKN+IPb9N/QyD+g61okGrtPAu/aUv6
X-Gm-Gg: AYBFou0jO3Wr5nTPSHqAG00zSiU1y6RwyAla+5130CxVI6t8B92WKJqE8Gn6NYyjqse
	CDHcDBizvqa0Sf6erUyP1vPRFBmfkVGe0UlK/nufKyypQVvP7NuPIeUo/AI1Y1v4KaKm610JzHH
	5lO9QPBvQEhyudE6lz5aaBmXla0EJI8eH4bBXDECOWk2InQBXW0vFAzM1boUjhJh0kRMMLNgI/I
	dtZi32zPdqsbckKjyZyhCui21tKBOskcl4ibbvoJEltYZwaJNDIEpNLxR23zN4f7Fzym5r0MVrj
	E51JwtzW99V1PLtOWKSSQuRdD22Ji+lQNWENSu4OmP7KaXvodVboII2VzYgL/zZ+eY+/84pRLSW
	QKoLSKQsIf7slH44OFCrrGT57l2JWlQuqCMYzHVzLMcuu6NKeBLvqFtZzSiz4AewguA64OE418M
	nlfF5T4PZA8xRXvoJrCjRbwLyVj7krBJwKign7Eyc0glxjdOpCjM6Xq/uCIHWYMag/yDppiz+1q
	2iu4MXww1CrNCb8ugkSKr2b0MN50zimj9RCLm4gNfO/m3p5WceIM7F9t/j3qEANJWm5zV2Aalhs
	z1FchD8iCSe3FIxr9EN53XDoQVzAGN1GfPTYD40GRruSd8wHHkpNmGbFZcAaZog=
X-Received: by 2002:a05:600c:46c5:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb55a9b453mr8505215e9.32.1794516783607;
        Thu, 12 Nov 2026 12:53:03 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:02 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] sy7636a: power the panel only during updates
Date: Thu, 12 Nov 2026 20:52:26 +0000
Message-ID: <20261112205228.42630-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature only while the rails are on instead.

This is based on regulator for-7.5, which has the rest of the series.
Patch 1 depends on "regulator: sy7636a: bind to the I2C device directly"
there.

Tested on a PocketBook Verse (B288).

v4:
- drop the patches applied by Mark and Guenter
- patch 1: keep the hwmon name (Guenter)

v3:
- drop the applied patches 1-3
- new patch: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- explain in a comment why power good gates the read, and its
  limitation (Guenter, Andreas)

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- no VCOM enable at probe, which also removes the probe race
- read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (2):
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig |  1 -
 drivers/hwmon/sy7636a-hwmon.c        | 35 +++++++++++++++++++---------
 2 files changed, 24 insertions(+), 12 deletions(-)


base-commit: 89b552ff49551960b9e270feee888a0298a12d94
-- 
2.52.0

