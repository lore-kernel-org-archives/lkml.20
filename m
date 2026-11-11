Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414567;
	b=0QgHmqU8g6jbZLQjBIXTK1S5FH9cXTfYu/68WbYoh6F1YpjStH2ajdRXnOFVrXKq27+A
	 fS/4ux8SZz+tThmP9FyOaYKhAJvw34jYQ/Tdq8ExzK1X0g2E5IkBJy7jiNGqANm5a48oL
	 kZuURFbjHnNuSHSpsMYnhmx9qu86hw9cMBphCcaKiizew3TpLrngptkeJrYLZevwzycQG
	 XNz7zrTQggzw/3ShedTo1kuaH4BZVusqCuK9BUjkDgDNENsEI1acCahrzUF3SEAcqbTGa
	 lJFDDVWxowk2TeTe8r64kBbChIJz846Ei52BpiBmsFA7ZutvCm1SueDN1Le2utI106Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=;
	b=hlrtuL2a7oE7IhkZoyEWCp6q1LuVnNwqrw/K76enr/JZSXiHLgYWL1z2Wp4CqfFOrYRU
	 N+PXcJPz4GE/Lb455RzB0GdK0NFSCgJaS7Ghpct62YiMfbwkoqf56Gx3Ibzm59pXbzNZi
	 m5kGLFRzFniN6JNIdHLXvTw4YRGdsqcNCuiQZLsMO6BpwuOYjn3xc7zXAFOzzf6gG9dO+
	 CLfK8YC5/oMurzbi9UdS7+AVmzVeF/mTtRAPfREOraV2fAx94mRh//k6E9eVmtSUuOaZ5
	 1c+nIJSvNQX7oCFMKnF2Qrd7qe47pLC8lHBilcbJLUzpAwC5wvBZewLwl5bkAKXwDVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DQgHRv/b";
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE0B606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE0B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQgHRv/b
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so1526363eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414566; x=1795019366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=;
        b=DQgHRv/bQhAMcw/SpaJXqNIkV0tujibZANxbS6NdtMHzR/vsznqjUQbNvRcFsLTf5V
         hSzKURnm2mWHjQ07LwRIsYfBBf2ymdqC44cAbliAekS3cKdk20z68uxkCVbYNXwUto2f
         MIr0+n+mZLoKHsTkTtStBLWGDPjWjNGnuDDR4vYn3e1/89M8qoIl8jdmU+6/pCSwXKNh
         9JheSdpJfVIuOJlvQPhJTjnNqv1PGqZvATjfXJ1V/Qg9162nDFt80btC2SEzVQTR28nZ
         uPKVFVR7chu4NoD3pfu0etuxNzbl1Is/XtPKsLXVgLbOQ201WFOoLips6QGjJ1MLb19V
         DRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414566; x=1795019366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=;
        b=sArnvvC+xAgVbSHJiVTy41BSt709/2DhC9vBsaNH5dPOegxuA3soYIodlroPJV5jdP
         Ezcs5A0Dgm2CeRcJXHLVY938Ik4tc9oHcnwBaIceBrmk1XVRWr8tDlFZJsWBe86N93D2
         0UAClxlZJkyiJ2RAKpME7by72VtnE1gaWNx7e0D18CZwYfMTXdZ9TGsjUCfcY26wS5WA
         YkzWZ+ssjPYHTCVPEjyu7RpG2FhFdUCXhcZ92QuC80Z7lp58MUFGwvUwDvNmYqZucEPB
         QA1SqTheP8uOkstMf1qc96z7h/aKe42ADdlbvbelSa2hoYwywWVIiHMknauG31l/RZHP
         lhww==
X-Forwarded-Encrypted: i=1; AL+hErFmBLdp/DojAVN/hPw/u8aKC2eG+QHXVib4VDYXCuZ2Xbswq11ol6zD5IYULGyaAiDgLTofwoQQIUdi8rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GKuD4UYl6KWa1Op1fClh4wwrLPtlD1aPiBQBTQM1PJaDyFH2E
	VPpvrHjdxpliw+ckrUZhfxlr+Y79xRCcbKMMLI1FetPPPjR7biLCnSExFSEkiflmKyq/2dGR
X-Gm-Gg: AYBFou0o4nv+Vyj8UrVNLoIdRgzionmswCn7jvucBbUvLGlG4e5+sok7v5TTPWHNxlR
	NKVi1s4UuzFIN+N2bCx4TL8xkjrJTNdorhvHk7VF2mnYpiDuNb5+lW/tJDEjVZL+4i5CH6oOabU
	Ifwzi6NzzHlk8OByKorBHkrSgDMadRaZOKjGUwi4lqcUSH+KUSRDJZ2xvnmP7TI5RHng/2MXahU
	bDmFad+tNR/e8i0Jabj22+zluw158ZCwwsdcoyi6ebBrDF98X5Qr9T6+zz2Tu3CPngGZrJm31Cw
	Xb60zbFZ1uiCfZRge/j5pGsnU0bYoOZMLcRLUmDnqckMd+92+hXrntcF5DqdFWSrFSIBdOQ1JZc
	2KiBAeJSYabDhCL1jaFoysxroB8z5DIXTVx5KvJ22Mgtj5nEro87F+56UT8Bq4hszh8ONn9p3aU
	mAHg4VW5FW2EjglPyXS+NHJ1e5jFUg8/7LdemIDK+no+cXDV68BZ7u6r4rIBx1CzPBWteWr4+cb
	mB+IepvlAiBO2cB5FvidcD7jChMbJE6GfSlZ3C+tMIgeblLzTBzcQp4tT4kR52mD4aAakZnDfan
	Qose6cqvfyE9kzZiqxPgsM9YddVF9UEk9bsCqGLZgbtfMEUswg==
X-Received: by 2002:a05:7300:33a7:b0:36c:f88b:caae with SMTP id 5a478bee46e88-37686469c40mr3335801eec.22.1794414565934;
        Wed, 11 Nov 2026 08:29:25 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm34892599eec.16.2026.11.11.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:29:25 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Wed, 11 Nov 2026 11:29:15 -0500
Message-ID: <20261111162917.97532-1-cyan2254650260@gmail.com>
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
Content-Transfer-Encoding: 8bit

This series adds device tree support for the ALINX AX7Z020B development
board, based on the Xilinx Zynq-7000 SoC (XC7Z020-2CLG400I).

Changes in v2:
- Add an explicit mdio subnode under gem0, placing the PHY as its child
  (suggested by Andrew Lunn).
- Use hexadecimal unit-addresses for the XADC channel nodes
  (channel@a, channel@d), matching their reg values 0xa and 0xd.
- Move the pmu@f8891000 node into the initial root node block instead of
  opening a second one.
- Drop the standalone "alinx,ac7z020" compatible from the board enum: the
  SoM cannot boot on its own and is already documented as part of the
  three-entry board compatible.

Note on the vendor prefix: "alinx" is documented by a separate patch that
is already queued in linux-next, commit 1f06cd374a60 ("dt-bindings:
vendor-prefixes: Add ALINX vendor prefix"), so it is not part of this
series. A checkpatch run against a tree without that patch will report an
undocumented vendor prefix; that report is expected.

The platform consists of two physical layers:

1. ALINX AC7Z020 system on module (SoM), in zynq-alinx-ac7z020.dtsi:
   - Xilinx XC7Z020-2CLG400I SoC (dual ARM Cortex-A9, 33.333333MHz PS_CLK)
   - 1024 MiB DDR3 SDRAM (2x MT41K256M16RE-125, 32-bit bus)
   - 32 MiB QSPI Flash (Winbond W25Q256FVEI) with 4 MTD partitions
   - DevCFG FPGA manager

2. The AX7Z020B board (AC7Z020 SoM plus carrier board), described in
   zynq-alinx-ax7z020b.dts:
   - Serial console via USB-UART bridge (CP2102, MIO 48-49)
   - MicroSD slot on SDHCI0 (MIO 40-45)
   - Gigabit Ethernet via GEM0 (MIO 16-27 RGMII, MIO 52-53 MDIO)
     with JLSemi JL2121 PHY at MDIO address 1 and RJ45 link/activity LEDs
   - USB 2.0 host via USB3320C ULPI PHY (MIO 28-39), reset on MIO 46
   - Dual CAN buses (CAN0 on MIO 10-11, CAN1 on MIO 12-13) with
     SN65HVD232 transceivers
   - I2C bus on MIO 50-51 with 24LC04 EEPROM, DS1338 RTC and LM75 sensor
   - 2x SMA AD inputs and a spare differential pair wired to XADC aux
     channels VAUX1/VAUX9/VAUX12. XADC is a hard macro accessible from the
     PS without PL configuration, the channels are enabled via the
     xlnx,channels property.

Tested on hardware: boot from SD card, UART console, SD card, GbE with
iperf3 (940+ Mbps) and netdev LED trigger hardware offload, USB host,
dual CAN (SocketCAN at 500 kbps), I2C sensors, QSPI flash MTD partitions,
and XADC temperature/voltage plus the external AD aux channels via IIO.

The DTB passes CHECK_DTBS=y with no new warnings compared to the other
Zynq board files, and the bindings pass dt_binding_check.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   5 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

-- 
2.56.0
