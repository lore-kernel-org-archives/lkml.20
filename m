Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173311;
	b=NmL9k9lYm6AmsgFY1Zhtc5Lh6wwQnI8TMRPA0GYQcSHMOllpmdWPJIYrGz0W5trdAUy6
	 HFwE6vLUnQBB/TeSO5dmLjQnQLKeIyi3N5T4DUD8h6MohI4dSOtISwC+SxfuJyxHTh+rn
	 0XRVjARqlYy+iw4D8HPhonDqNpQ51ZCbS1iXsaQSfCEVYB3tPkBBGVTobLlQLdz0t2WVA
	 s0B0fYUqXExHdCj0KEoGc5R8MdynxqX2pUl3U13VOngu1sJsgGqYSnem4VSc64CkY+wwD
	 49+8MpFCctmjhaqCqAFA968DGwS3gCRDDk6ruAY6zVgutNhjGKVEZkYVxbzcyMVhMuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rNVFVaUcgRGLJ0+IH7bBFs2bHZ28CGULMybIpv6NCcA=;
	b=xQDDZcaww3yuGrEdRgEHBGkhYJmT75oLXX41+6tF1hW4k9QbNFzdWg8NNIn8pcdXfr3d
	 qQ/+ueRNquh+OtiD1pzbLNv/fq/hY3h5bE4eGOdjRjEvkqSUrpPcJyDCKtGhaCIpl6OOi
	 jkJYliGlaQwhvdpYxiCG43CWbQA/FHDAZMC05+uf8+H8y4hqnYv6jbd7w9JaBt+XQB3UN
	 ee18YhkYBq5/EzupbTsWkxsQtEl3onDn896EOJhl4MkoW8AXEwhjnAKZc/o4hHcCXbSVQ
	 2HBouivugTV6+j4B8XDEbwOzYgu7Ktgg5mlPo3n03CUtqCaCuAZGI4mNkyZmxHoUtlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+F+2Bwm;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05011606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05011606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+F+2Bwm
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so1935805e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173309; x=1794778109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNVFVaUcgRGLJ0+IH7bBFs2bHZ28CGULMybIpv6NCcA=;
        b=Y+F+2BwmYv0DtI5WOVJMdRg207Njhn6eyGCR6e0FzV4rgq1N/TQt94orO7XzdbyVDr
         69xU8w3l9e3PvI+9rmrpR/oUU3a8C6uBuSHNUhGmsDGhXQlM1dBkod8PZ9j+n2D5ZDfy
         ooO+ylP0lqi3cUDo18KJelZ6kbyoIvhqXAVcePTpfYbNfxkUArhC8R6BXN15GlV1Hrs6
         Ll4GWvpnPmDLVkACkZxFQ0ymePnrTlDBAbaW1FlGnmHG21eFkEW8SZa3VwXMCkIIHLbi
         9ETtdJ4lA0RlOYRNSgae95R8OI0XM/86YfYu2VtV36V8P/c6bo+Oy+M2oyBzFPL10dd7
         UYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173309; x=1794778109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNVFVaUcgRGLJ0+IH7bBFs2bHZ28CGULMybIpv6NCcA=;
        b=Yw3QKTanM5lNt19COW0lE2+wdEXywB+MxhNj4y+xAgr3T//qWRylk69n7sPsBPC32E
         1zV/Mu3KxlnktYeB+MboXta/iO4VKMzXgRnvxc64mdRaAbiiHE3dA+TlFrHUOdAiWxrP
         8AK4OaTGiYfQ2NVO+HO//qZTVYZFIUZhMe1slfnh8TTmvv70R0VFqzE6i1La/tJM+4ip
         15LdYMBKdHaMNjQjCjzKi6GG7Et00zKpkuZx/8LjaCQfPkYHDKf+vvaJM+X0LnEiX834
         5A2YOOsjJqLHZ6dI8Bg0O96Ed8oujju2JlnkRVmFxd0p4vELqDd2VCrjAStVlw2Cghp2
         eK+Q==
X-Forwarded-Encrypted: i=1; AL+hErHOZ6SaLtR3RcXmEEVMH8NHqLEhYjWGK0WgpaN+raBLTcpMWXM3shH304oY74ZNoqoazLD65PnEMbXDDAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qtD3NQ3aOQie5Ng0wOw7ZHo7N/V8KkBbTG7Mpd7et5Z44ouow
	tsDY/12ycuFxCCk6HNnhCx8pkB42bUTLfTnjxE8PEnSx+zKPaiCXzlKq
X-Gm-Gg: AYBFou2e9G9h8AOB7e6booBTJSzJxQ462AThtZwMXysQWMrfH6sakkMliL6sJTHrVw8
	xnAy7WOmb3tsdAMizyaaCcvKMxx5JLqPyK644a5APzus2hMoozaNXW5bwOJZqQAhbiTFclPboyL
	FZlOMIR4C5KA8SV1mrLdEt4Ye1yZITG9Ki6MM8ge4QaVcQgw0nyXgezFtmgJRYJ8rgzSOZwk+/Y
	zboTV0kI1pu6s0DjA6mkdPceHV4NnDyugtBXMIrsUEAjzG8tqW5Z6RGNtcKTThuoTmAbKnNVycS
	Xaa5O/UWc+pJ1tjm2skYJ6jZBVaV/S7L3MalOmOGX9wSaYFmiCNrq7CIq14uleiPPK9nR0qd2B6
	ro82yjsCkeOkt+tMIbYf113JtXXauRS4gid34si6lTpUIHJDACkgaRu2QkxgoGSdPG6a3gkKZwb
	UihBniELdgs4HFG5vqAA4MnKfv+xn4qSFMa5qp95SES51TBaVCS3PL06Ka7YwRpvvxeXWh1ltIQ
	oeuj/Zto98U6bhaJXVWj9PcIrgGs5KSej2rB6yoieWEtq+MkOvHHyHQuWo3LGCpGBQouDKPX3EE
	7C2EPlH8uBPc/U4K8+xkrzfWT5jozrs2Fw==
X-Received: by 2002:a05:600c:c16b:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4b963c6754fmr40690035e9.13.1794173309099;
        Sun, 08 Nov 2026 13:28:29 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:28 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 0/4] rtc: Add StarFive JH7110 RTC support
Date: Sun,  8 Nov 2026 21:28:22 +0000
Message-ID: <20261108212826.15890-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The JH7110 has an RTC in its always-on domain that mainline does not
support. This series adds a binding, a driver, a MAINTAINERS entry and
the SoC DT node.

The driver is based on the StarFive vendor driver (rtc-starfive.c,
commit ebac2b5 in the StarFive 6.12 tree), reworked for mainline:
- hardware calibration and the default time set in probe are dropped
- wakeup uses the generic wake IRQ helpers instead of the irq_desc hack
- set_time waits for the counter to load the new time
- read_time re-reads if the time rolls over between TIME and DATE
- the offset rounds to the nearest step and follows the sysfs sign
  convention (positive = slower)
- the 32.768 kHz counter clock is described in the binding and enabled

Thanks to ziv.xu and Hal Feng at StarFive for the original driver.

Tested on a VisionFive 2 v1.3B with next-20261105 and v7.3.1: setting
and reading the time across the 2000-2099 range (out-of-range years
refused), leap day and century rollover, the alarm interrupt with
cancel, the offset, the rate over 60 s, and setting the system clock at
boot. Not tested: suspend wakeup, drift over hours, and keeping time
across a power-off, as the board has no RTC battery connector.

Known behaviour: the RTC loses about the length of a reboot across a
warm reboot; the counter appears to stop during reset. After the
StarFive vendor kernel the first boot found an invalid time. I would
appreciate an opinion on whether this is expected of the hardware or
something the driver should handle.

Changes in v2:
- dt-bindings: list myself as maintainer instead of the RTC subsystem
  maintainer (as requested by Conor)
- MAINTAINERS: new patch adding an entry for the driver & binding
- driver: drop the <linux/mod_devicetable.h> include (as requested by Uwe)

v1: https://lore.kernel.org/r/20261106175600.3877614-0-oo.hehir@gmail.com

Owen O'Hehir (3):
  dt-bindings: rtc: Add StarFive JH7110 RTC
  MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
  riscv: dts: starfive: jh7110: Add the RTC node

ziv.xu (1):
  rtc: Add StarFive JH7110 RTC driver

 .../bindings/rtc/starfive,jh7110-rtc.yaml     |  85 +++++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  14 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-jh7110.c                      | 323 ++++++++++++++++++
 6 files changed, 441 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
 create mode 100644 drivers/rtc/rtc-jh7110.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

