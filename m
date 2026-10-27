Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072964;
	b=ngMB4hScJgKb3TvXWnHFTAJmThn6oaCjkwIV7wAiiWMtAIzY8ZXfZZ/8iUxWQIzpivx8
	 nBFeIK/vYW4eZBeypkeuhZweRPb4/6ipRkuFxJ3meJWhnFs6H4Z6iDf6PIFSVjP4npoTN
	 IkxkIRORLSPSPoaypXRcPc1hBphRCVMyQIPhVmOSAjoqKJN6bQyNibIExSlSP/FxBirdC
	 ynJaG3ewmoEUBrYy8jAZpGL1zkHsPY36Sq2Bk/M5s6LcLAk80MLAdKW2IWx49hWP945Bp
	 Ovvwp935C2jawnkpbY2hgpAFFyEHZisat2qWXEpTAJNJhnOxBmiVKZiUuFxOHm5nl7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=;
	b=Gq93OHnQfWknc6VhcuPCPrgzFu0aLMeEnpg/zTnLabFTA9hHY7NsT7I9dpBlFhZAD7cU
	 mkxMTlUKraJVpxYzNkvoz0SINRaCfJ9aB3kGNAmhH1gwSFFwN1vRgcJUbXrrxWE5PdpMw
	 gBnJNK1NHV6cyos8nlo5uEU34tcTO6MXCExWEmABdOepafHGYKHPwYTtITeTyhABwwRP1
	 DQgQ0EUeB0tnCctWlJkXWq9/0Nt3OzwcjrlOufH9JES1GFwCE5qWv6JynKSayDxjj5/u9
	 wPf1nGQZmszH7m+RAcvy6jFnqxnZ+NtlmxwYTabGrnOR4HddD5FY8pRo0V19xvWP0gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gamDn5qG;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0B606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gamDn5qG
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso5845004eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072963; x=1793677763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=;
        b=gamDn5qG7zjt0/0vVNhqtjnZ55eJX6z5bQbasu+FsrYvhtBjn7O1sZMZ2m5UJJ1h/V
         P632O7Iv6EzQgIWyXQSW/7dwWGcQL54thcaOWV3r1gGiqmmQSnRs+Pz/pnr9fDwFkS83
         qJSljVXArbMCzxoMU/dcnETkrha9eNjEtvxNV7t1chH8D9IOeHtLM10ICapdKZGBqvz/
         irkSWTE/mC+gwnt1dKXb7Vz1K3RMMH8FaVJsA6/7weNB9Zph/x8MEwb+B671LT4OC5fG
         hFPoEDXkyZ5bbOTYhiXsZ27+b99iV/xmUcSTcn+9z40sBc6NkummE2zQOT9OZaeO3bdy
         7Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072963; x=1793677763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=;
        b=2vx6VjdENKvcvN5CDIjtfWsI1tJ+S/qKHSNg+v7XV9eHkwej49Ev8uw/MYC/vQggMW
         i+ez2Tx0WJjF87tMz1XP4UPmDAmuRiaqDEVIVxJ7zf7EJKzSLW2yvM3Czf+8fywc/dK/
         D5QMyO3m2izx3MEPqAQnO79AZHG20kXJTv6FeXZKbkIUUDqnbIfzGdkMG1y26eEcMezy
         gsEjgSxe+j7WVdDk+egDLOrJKgDeX1QT17Gra0WEXbxK6JDk2YvCdzTEuiY5PVZwP5yx
         LDxjaPv+E7P79mDe/JyQKRS+ViV0iZ+yW48yo6ekLY7VHWBWQ+Hhb9l7mDehph4AKU4p
         h6+w==
X-Forwarded-Encrypted: i=1; AKwUvBwSAnItvNDe4C2EOFChLw6uvVzq1dbRrlGISsf2ruGK6uxAOeSMGwFZnjMKR0OZoAe8t0woF0CfY1GlVT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc6iTo0SJWDDXnwswWl+6RP9pgwGyoRVI9DV3SCZONcsDhyDwZ
	r5Ag6Pnj/PAvWARAYypelyyTchgOs35Lx/o2Q+ACMsHs4EDHR1mrbI00
X-Gm-Gg: AYBFou2rgIwMu0dWiRKyWtRxYF5QTqkXxAQcH2debZXBPBn0GYJ9Y1Q7WePhfTRCQVH
	GEW9spkmWNmE7IwytBEfsHswZ4RzCzB4jeqzGWi5vMxx3fUctZ8Kpb4SwJa/ql8cExCCE7H97qM
	bqKD1ctCDR600ejcKCO/7c2tuZALNe3GBaf1iY4vCtfflUWOQjkhhRgjJoAudT6UnrSzg4C1fSB
	6cEFLo7NY8J1VVMGEaZ7fjIL8Hd6EFQRGpsKoWtjp2m8cEDoO5JGDBpftgKHJrYfrFDQyyhqLw7
	A0kJsmKR+c24ZoZXKfXQa5TtUpy8NhL/ou6CpGqzLqI8j9Jq9wkd7pKv6l3J+ZE/QZNE3/Rize6
	FEHmcyCnMl+tk7tp0haXvvnyyYipGl9kUuxgzKnzxnDFJMz386Z4mjVy4Q70c2h3J7BSGww47/0
	7ZijUxSp6k5LFB6/fZZ3hMb5AyyKWeIQqR1DFOTj2GLTydVp8YiLPbZNI4jerFhBBpONzuVrAIl
	sworwqfOd+43ac1UyiCSPE4r4TXsLVOx0/oSxJBK1uJKjeTsIobzc2N1LeEWJZO7mgnl1rpVCGH
	5vl+y21crM9veOblsxTtqFNv0PcEpItkN6p2gz3N6yrf
X-Received: by 2002:a05:7022:f511:b0:1a0:5c85:d1b3 with SMTP id a92af1059eb24-1a05c85e6damr7103884c88.43.1793072962440;
        Mon, 26 Oct 2026 20:49:22 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:22 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 27 Oct 2026 09:19:09 +0530
Message-ID: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
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

Add support for the ASRock Rack B650D4U BMC, based on the ASPEED
AST2600. The series adds the board compatible and describes memory,
SPI NOR partitions, UART5, GPIO line names, GFX memory, the I2C7
EEPROM, and MAC0 with its RTL8211F PHY.

Enable both ADC engines with 2.5 V internal references and expose
all sixteen channels through an IIO-to-hwmon bridge. The channel
order is ADC0 channels 0-7 followed by ADC1 channels 0-7.

Changes since v8:
- Enable ADC0 and ADC1 with their reference settings and pin groups.
- Add the sixteen-channel IIO-to-hwmon bridge.

The other board descriptions from v8 are retained. Andrew Lunn's
Reviewed-by tag remains scoped to the MAC0 and MDIO nodes only.
Fan/PWM support and BMC-ready GPIO policy are outside this series.

Base: aspeed/arm/dt in the BMC maintainer tree
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
Base commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030

Validation:
- Compiled the board DTB with aspeed_g5_defconfig using
  arm-linux-gnueabi-gcc.
- Ran dt_binding_check for arm/aspeed/aspeed.yaml using dtschema
  2026.9, with no diagnostics reported.
- Ran CHECK_DTBS=y for the board DTB. No board-specific errors were
  reported. Two unmatched-schema diagnostics remain for inherited
  aspeed,ast2600-lhc and aspeed,ast2600-i3c-global nodes.

Hardware testing used the same ADC node configuration in a locally
patched OpenBMC image based on Linux 6.18.24. Both engines and the
IIO bridge were available; twelve configured voltage rails returned
readings, including standby rails with the host off. Voltage readings
also recovered after a BMC restart with the host reported on.

The complete DTS on this upstream base has not been boot-tested.
The tested OpenBMC image uses a different flash layout and separate
local power-control and sensor-discovery changes. Consequently, that
image is not a directly reproducible build of this upstream series.
Voltage scaling and sensor publication are userspace configuration
and are not included in these kernel patches.

The patches can be applied with git am on the base above. Anyone
boot-testing them should first adapt their image and bootloader to
the described flash layout; the DTB alone is not a flashable image.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 173 ++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.47.3

