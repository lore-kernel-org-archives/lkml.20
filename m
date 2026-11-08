Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174623;
	b=qWttpqL9GkKLQbes88UzUeb/9olyZig6awsIDKzjzTy43N3uFHZCmRGFBvoqUhs6m0TZ
	 EjduZWIjwW4fpztpLDg3rqZ0KJFShqUzYvWmHurViLFCXRH68q+lmTpNhYr43p0hoKZ3G
	 Sd7JDmMhgFiOgPQPCuR+ZlR5Um8DyexqJ9rMutMmU5ct5EVfovX+5X6m9dFKTy+2SUUhL
	 Yo1D9rZzXTwZ35qFH4kyUyVXGEnXxzT2910A8K+buo8DT6+g4lWx/4QEBILYvsb7ke7C+
	 jVmnPvm1uFdwjP/BwVKOzsr5s+dtHucDbxHUvJpJ7zowJ9OpMFXStL8H0qlVdJWs2Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=;
	b=wisgEfktQcaxV9YhLms1443ly/boM92dRnIXs8o1NqSS1mNlj8SvhJuHrrq6Hc/fOBUg
	 g9HTIyYuJHVniUdvxNmomqjUuaH/ZoRLFC7X8u8dSW8NToJ9epDtJj6gnLFJKxtTDvIvl
	 bcq+RCSFbvCcAMKmNj8ltKstWy8HYDDn1y9JWI9c9da5W33E5aSBuZopnYGSfl9dKCDaj
	 yU/XxuqICSpcupBKZpJOvdUf8ZMDX74cXO3JolwdBERqMP8UyqAetF1A94XWwvLmuAnT9
	 MlEd3MTC10WQ6FpJ3iAl4f5gG4/sS3TehwY7PaPobGd0IlHPm0LLEmTdbgDVWU7dMDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n2UGqasD;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA9606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BA9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n2UGqasD
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso315697eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174621; x=1794779421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=;
        b=n2UGqasDhZ+vV1pQ63v1KOT1+82ALSTQe1W42WhQ0kCjIbXGT2mx7tr/xDZLOpjI7C
         y03gBoZN+e0Ib0Dkj1XcBrwObXQlPjlIfqbbxmFvgPAmVTurOfsTToOac0omjDwAfPVY
         fARs3AMp2qm+0/kgVBFhbtCWwR4A9nHDgojGvTuOQ3OCs68l7pakpqGVa8CDrn4mJBLI
         Q7giub/BRl/R8464YF877d/sTXRfsISarHqoya43uIJXCoPXrVHwA2Xfwp2Y9iG4qMk7
         YMSTxc5ym/fz0MYhS+sdRVqVgOQ3ycsLWshXKZbE5W57Ck8RniIqdD+qTQ+P2OCeZADy
         w+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174621; x=1794779421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=;
        b=pBm6Xr/gQrwAIMowI8uPc3d8/cxpZxl8ddB5pR9OE3xXkNUfa07MLD6eGNZ6fNCVkb
         1HZ/aXNsv0MRBGZ8Ye1rA3wtmltS+UGHgjBNRD8SKlHdi4zTttBZQeePrN3x3MIbZnAQ
         vpvQEpnfZvI3hMvcWuLCx1bzUxOFwXthFBmGjmm47DHXJ/fudXxU4kUtqMCNbvncdOMF
         2ZdmHohgE7gHRh7mcMqHN8EEQPgi+UYxg6MzazHs11CKVFUr5TytxwXS/weRp+xIhheO
         W7KFeT+kLgMQbq+iqjqBmUDRfgkG86Rw4ZvEino5KbSH8BfKJDwsBoHXg4RlYO+eZL3V
         R24g==
X-Forwarded-Encrypted: i=1; AL+hErHQb/iJuME9QeyinpFIWUsA2N+L4lXj6tXfDGQFgwgcj5PNVp9v8LxatGYCsz3qV2XeKtlDD8LRXSZ0nlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+7ZzOEnA0cNn2Rs6yaJZF9wBBDxNFyI0CcD3QwttZUlUXz/hq
	jOjrgcpmX2JlY+T9LZoEQ5gWuTj9W1osnW8EvYjcVZ2pQJiEbk2MA89RiE3nlybVoVxat12B
X-Gm-Gg: AYBFou0l4LJouni65nztyYfin/YXx8ujhm2Hu4U3twbhq8MqNHLZZwqblV7PF8jHUOW
	CcTz010d40RUM5Wbs6meQqkM6M/5ieBZxTbgzuzWA4c6V1MNDduYZJamGp+8LGJUk2GwaZkQyk8
	P7lsOjQaMuM7dWkiwYiqrR/fNGeNF1HQUD03mY6L0FBtcfsSiRXtOQOhC9QbUd9vRJdeX6kb1dh
	iM9V80uiOtSUr1u3qc2sbzudI/D3i4vt5TIn0bSOG+pQaSCp2qBUH7dHonXK2h2fxMheJJvGleF
	7Dyj0H5HYQQbYIYP7+TjfPq6YOqCo8xBCGpKdpJu5cfYUv9NCq729mn7ZqqSBJ2L1bVKP8QP8LK
	nyleBkJiy0g7Ffa+Lbkq4mMaRCl80xAYXgqQVyvnU1q5Pfv3qEs3KxrMH/f3Y+9gZS9hjtnF8Uk
	dylWaOCjvNshRurvzOOfOXWVfOwP6sN9vT3PzNZFvaj8wWS1BnST1qzhgXTyrVc5C70Hxg695xT
	c9QCvYUH9RsGylTpPGegMpy5wR6ITVOAEXjQ1uMbNSRTbBuYRBkQ7CYe5WafjNNb3iqaO7DY3rF
	obdZ+uEHmgR3wf+8Sef+icIaUZdTN3DHQL1MVJEiSQSFwx4W7Kp1bNJI5plUwgCUS+TGauo=
X-Received: by 2002:a05:7300:2215:b0:36d:48e:82de with SMTP id 5a478bee46e88-37256615312mr6819539eec.12.1794174620977;
        Sun, 08 Nov 2026 13:50:20 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm7587575eec.17.2026.11.08.13.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:50:20 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Mon,  9 Nov 2026 05:50:08 +0800
Message-ID: <20261108215010.351256-1-cyan2254650260@gmail.com>
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

Note: the "alinx" vendor prefix is not part of this series, it is already
present as commit 1f06cd374a60 ("dt-bindings: vendor-prefixes: Add ALINX
vendor prefix") in the Xilinx for-next branch.

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

The DTB passes CHECK_DTBS=y and the bindings pass dt_binding_check.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   6 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  72 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 137 ++++++++++++++++++
 4 files changed, 216 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

-- 
2.56.0
