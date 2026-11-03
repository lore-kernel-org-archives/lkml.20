Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742812;
	b=DgESh1auphHpcXsRExzrrZqM7JpOubSkt6sRYfTJPumLe78MWhdeJrGgiP1Pj2aSVaMk
	 R8oPNJhbLirr+YISRvkgH0vLQm5trY/uVWuv8FvgUY2uEV+vZt/m3LCbct3JEtVgmY3Fj
	 4pKo89g70n7ybTkLwdHdCMaJLegCOWngjhwb48mpEO5vtERhFxfOhA/OVzR5er/kq4vd0
	 768tYfwM7AgvNnKMkpq1NNmyGPWxhQ4aS/r3d6eCRpNGktEpqgDE6dJjtJCT8Ov1j9TwB
	 JhGhLaM7m9LZ25SFUR9RUGaYletlD7ZAvHoC98OaeA9pqG9ilzTlH6gP5GhxrBPA3ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=2irD6fOEPJ7HsIpmwVZLFQDKC3JyON8F0Vca0AwuH+U=;
	b=J6WkbJYHqB+rLqMuXqsVIX6NZGxyLFQ6iGPF55j+7E25rjbTIJPT5Q+tF/SJbbnv66iy
	 muz8PRYMntYSzcA+6ybZbX9DxTkWbCXXtJOET7+zltbdHGAXZkAIJC1eAUPkjzymzxpgh
	 gyQaCYWdpUz/aJ4NgiBiwrYLUEeUdU6RB7HdmKeqdP5FSxPmMucPF8yA2EZEs23DCGVM/
	 sASj9Q4kVNJfubseukKlEivqEiqmzH0SkkUerakpSYd5wTcGx9yWpPx+9AeSS8cLxcy2X
	 FMMcZguWWWkYbfggWuH/GKxLbms3yVh68p2C190VrmUJBXdzjeJxFIk25nG0Ir/jRng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	dkim=pass header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=vuPMhJyv;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A10C606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A10C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=vuPMhJyv
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 069732C04EA;
	Wed,  4 Nov 2026 10:53:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1793742802;
	bh=2irD6fOEPJ7HsIpmwVZLFQDKC3JyON8F0Vca0AwuH+U=;
	h=From:To:Cc:Subject:Date:From;
	b=vuPMhJyv5Br7bUQczLRq9j3sG1uLdg6m+BD6luBoc75uDpflCOUBnjQYe71fFNzE+
	 wg6jcCrNTiEdEtv3ZXoEb8hoLhuTMFuJVHwx268kilhQ7MNJxyExu7l1/WChVc5My9
	 O11sjtVIWabVFp2HOj74V1aaWCJssDum9H+TAv78zaSsmPqs3PARMEZ49FS1bILIGA
	 5zhQ0ZAbznq15WoueN+qF8Nswb9d2sJpUqsIU1Gg9GaQwSM/Rw+6HyKbcKGIsQvsRF
	 BiwnXjy2MwmRNsmuqlVVoNUkxb2K8nXy+3ioMIpKVEZ6OZm2lyGGzefDu+YlG/oMiF
	 gVc53Du4MQ/Yw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6aea57d10000>; Wed, 04 Nov 2026 10:53:21 +1300
Received: from joshuas-dl.ws.atlnz.lc (joshuas-dl.ws.atlnz.lc [10.33.25.18])
	by pat.atlnz.lc (Postfix) with ESMTP id AE0CC13EDEC;
	Wed,  4 Nov 2026 10:53:21 +1300 (NZDT)
Received: by joshuas-dl.ws.atlnz.lc (Postfix, from userid 1634)
	id ADC5E5AEED4; Wed,  4 Nov 2026 10:53:21 +1300 (NZDT)
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-kernel@vger.kernel.org,
	Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH 0/2] gpio: realtek-otto: Add RTL9311B support
Date: Wed,  4 Nov 2026 10:53:14 +1300
Message-ID: <20261103215316.1544492-1-joshua.scott@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=H8t4wPYi c=1 sm=1 tr=0 ts=6aea57d1 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zJRp6_cAMcgA:10 a=uHmBZk_gZuA7Zyj-HhUA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The RTL9311B is an Arm-based Realtek switch SoC with the same GPIO
controller as the MIPS-based Otto SoCs, laid out like the RTL9310's.
This series adds a compatible for it and lets the driver be built for
ARCH_REALTEK.

Tested on an RTL9311B board with an Infineon SLM9670 TPM on a spi-gpio
bus using GPIO3-6: the TPM probes with tpm_tis_spi and responds to PCR
reads and TPM2_GetRandom.

These patches were prepared with the help of Claude Code
(claude-opus-5-5), which drafted the code changes and changelogs. I
reviewed them and tested them on hardware.

Joshua Scott (2):
  dt-bindings: gpio: realtek-otto: Add RTL9311B
  gpio: realtek-otto: Add RTL9311B support

 .../devicetree/bindings/gpio/realtek,otto-gpio.yaml          | 2 ++
 drivers/gpio/Kconfig                                         | 5 +++--
 drivers/gpio/gpio-realtek-otto.c                             | 3 +++
 3 files changed, 8 insertions(+), 2 deletions(-)


base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
--=20
2.53.0

