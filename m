Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434258;
	b=F740FkfidhZicrLho5yadKdlKadrB3RW/LTH4D+pxK6yhOEnKZ8F8Xm+XCT+8D+TUxsy
	 lCYjZzcjmqxFz24Aq+S5oTBabBDmUWUAfzIVuLYCiZJ4+VQmH5AJnDtxOoCzMkK4mRKzR
	 c5B6g+EqzcHbfMtkmEODc4K5wa6PgYCXxQ9B7ER9Mm4iLhYW6axF/cZkdxeWStWHfH4er
	 0TytjYsNcUKdJXKQ5LS0zD4MdSJufEusrotJ6vEGUO8EDfsHyFLdKOM/jFLsn/qPuGJYL
	 2UC3cq86LDbgSDBRWK+xN+olBbdYCQxB8t1HyZDZxonj+ygqmlgHcdNlLdO+ABQ0mWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
	b=LfEXJUl7J7YUVpPFWvhJER79ijsjmA6jNf0QFsqNzP4aNFhebeqcd3J6Z0qog2LT+Bk3
	 1O2Ek61HenxrWHdQWyhcqF7CNepIUy8h0YdVEtqOuXThg1pBMX0Y6O/1WF2foL4m0N8ij
	 pDN1jlNDYKzOwEJyawIyRVNMgE3ub6Co2vdsDCOpFjg19bSs1dzmLm5J24zS8dzlQmYaM
	 0Ae1PIiCEzj8ruDFbUptuJD6AAGBVjCGCzuBQuRZHqRYa0WbCR7bWtYA8xrS86RWr/xRr
	 5LerBrSqm72Tc+ugCD7Xv2ukeZtACJyzVNGd0CI7lfY0A2qjPZ1XScTgXxh0crAgwNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOR01uyR;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B703606A896
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B703606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOR01uyR
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso158052a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434258; x=1795039058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
        b=sOR01uyRvXHgOyzCyDNY0Yq0Ast07uOYX4rPz8OcCM2Gp1XpxXLHflfejIsB2PU095
         lS8KvPNsrhc+9na1BlAKBJ97wpV1O6iVAyNVzyUCz/dI8xbFAH+RyrPL5kSo3IP5KNAd
         rh4v4bSbxWecqtR/soDUSkxJpcFzQe0n8Nafsh/xQHUW1k4IqVx6a/xzXOvMigmTFzPl
         H758JXDlTcgi/nrrbLrjllIrf4zNJmmTy+rm4Ol8JwiF89D44kSgdqjjIHg+dPrSslw4
         Gs+9OxKh6ggWSexuWQExm4hHcVgKFw3Y28s/t1fo5OZMWzfzgZT9F/abgLmoz1u1EBrm
         NDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434258; x=1795039058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlM0yBvLi14OnV7gxzFnWRbA+lvM+aJE4vd4INa5MSo=;
        b=wok54fC3x2GTZOn6Kz1T1FpyWq/GRqScIpOJS/IZsmUx5f1nya7JPOJy/Wl0F+UH1/
         6IEAr+OrQZwoBQMBm0Qiu01sXEJGmhChn3jB5bBM6c9oPtG75W4Hf4Xkf64F5dquBNwS
         Rh6Lcags2KjQRrFZKZVNCNMebpksgQoJWMTQnsvUf0lx3Z+o4YUvJC/IF5rO858yOh15
         Np5+7eGUq4rO7xpyaoIKFDeu2tbaza4DEGh7kT9GN79829Wyo45joJhndnUY/5g/gwRx
         CUlBQxK4+eMy3FlCTcm8Yi1dab1yt36u9MfF4ZK4B3daIEbcZ5wX6TtOU5BZO/Lvpvfe
         VP5w==
X-Gm-Message-State: APuU4Z+WlxsH4iaL4ITTsiKjrb1YfTy2Sh9HqauYVFpc3vbM4K1LzCPa
	4wrpO7i6RWZli2C/KwRpVJdrv+n8UMVfG2kRN2dUKxIAHVzMbrEOX2Bo
X-Gm-Gg: AYBFou020ipd5MGRS8NalWEfmf//llCxoQYmPj1IwTSGjkFJ/ugGGeO1SmklaFeJRmP
	fjaZnVeNyE3cyjvmLh6N1DCkhPQd4GccMIxaQ9QrBxOsR5n8oRlQT4DsZNfZRhsRNtAY83XGJqx
	n+36Ok87bTFoZUa9ndIeSxFszEMdofuuFJ/kaE9+HncEDLsttugV5ggfqrTWQ3cHeMwMJuHCrie
	jbM4193Hv7x1c8mTmSgQiwbAopAqWVaIShWaxLMpugRX615Eowe0XehiZQ+5bgioVdqaLvrVLew
	VL4UKS4aTrIJoG+jTk4i0sW8dvjmEcUuwl6W4UKJXxA7fN9Tb3SfhBZ79I2w8rRxEqiXdI4RkjR
	hJ2/1eZ5xvij+ITfaBYUg/ar/bnME/1RH2XgDcNrUI06EEpXC9IQyEXEVwFpbvVr2danGiG/c3Z
	R3un2GYw5WT11zCwxnrjlwfIZ2nk1VsXXc08TxMAbzTg135tfgj7QPKdlcCGjidz6xpX7jt4vlE
	qum5eqsJ58bM/L2GIO8aQWiN14E94iyA45cI6f57jA1XGran3coszcd4TiW5P6JsP6IPrnOjrAu
	IZMAOGR+JvXqGFji4co1uVZyM7WQuJQcXku1ai9x1DOoOq+cZ0r9t60pdNlK8G9InwM74fWtncy
	WWDlVni8X3WuQJHrIBjyrFsDBwr4HbWaIhA/D7m7O0oNmiMzZ7m9dp+h0AFxz8qqaED1sb1G2dw
	CwkQ==
X-Received: by 2002:a17:90b:2fce:b0:3b0:9310:b255 with SMTP id 98e67ed59e1d1-3b197cce666mr391401a91.36.1794434257629;
        Wed, 11 Nov 2026 13:57:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:36 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/7] clk: add a driver for the ath79 PLL controller
Date: Wed, 11 Nov 2026 13:57:22 -0800
Message-ID: <20261111215729.10683-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
clock before the driver core is up. This series replaces it with a new
driver in drivers/clk.

Only the reference and CPU clocks are registered early, with
CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
plat_time_init(). A platform driver bound to the same node registers the
DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.

Patches 1 and 2 move the two remaining non-clock duties out of the arch
clock code, so that it only uses its own registers and the clk API: the
QCA956x timer interrupt workaround, and the reference clock that is
read from the bootstrap pins when the device tree has no rate. Patches 3
and 4 drop ATH79_CLK_END, which is not ABI, from the binding header, and
patch 5 adds the UART1 and PCIe PLL clock IDs. Patch 6 adds the new
driver, and patch 7 removes the old code.

Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
of the old code. The serial console, both GMACs, the PCIe PLL with a
QCA9880 behind it, and the WMAC all work, and no devices are left
deferred. The debugfs clk_summary, consumers included, is the same as
with v2, and stays the same when the clock-frequency of the reference
clock node is removed. The other SoCs are not tested on hardware. For
each SoC the rate calculation was compiled in userspace together with
the old code and fed 2 million random register sets. The results are
identical, except where the old code overflowed 32 bits with register
values that no real setup uses.

Changes in v3:
- Register the reference clock read from the bootstrap pins as the
  provider of the reference clock node instead of with clkdev, so that
  its other consumers, such as the AR933x UART, find it and fw_devlink
  doesn't hold the platform driver back when the device tree has no
  rate. Drop the clk_get_sys() fallbacks (review feedback).
- Wait for the PCIe PLL update to finish after each write in unprepare
  too (review feedback).
- Add the UART1 and PCIe PLL clock IDs in one patch (review feedback).
- Drop ATH79_CLK_END from the binding header instead of growing it, as
  the number of clocks is not ABI, after moving the old clock code off
  it (review feedback).

v2: https://lore.kernel.org/linux-clk/20261110013646.1582970-1-rosenp@gmail.com/

Changes in v2:
- Post the new driver as one patch, instead of moving
  arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
  patches (review feedback).
- Register only the reference and CPU clocks with CLK_OF_DECLARE, and
  the others from a platform driver (review feedback).
- Describe the SoCs with match data, and read the CPU, DDR and AHB
  selection of AR934x and later with one function.
- Keep mapping the AR934x SRIF block from its fixed address. It lies
  inside the wireless MAC registers, which ath9k claims, so it can't be
  a reg entry of the PLL node.
- Drop the clkdev registrations, which have no users.

Claude Code (Claude Opus 5.5) was used while preparing this series. It
wrote most of the new driver from the old one, together with the
userspace test of the rate calculation. I reviewed and tested every
change and take responsibility for it.


Rosen Penev (7):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  MIPS: ath79: stop using ATH79_CLK_END
  dt-bindings: clock: ath79: drop ATH79_CLK_END
  dt-bindings: clock: ath79: add the UART1 and PCIe PLL clocks
  clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
  MIPS: ath79: remove the old clock code

 MAINTAINERS                           |   8 +
 arch/mips/ath79/Makefile              |   2 +-
 arch/mips/ath79/clock.c               | 673 ----------------------
 arch/mips/ath79/setup.c               | 107 ++++
 drivers/clk/Kconfig                   |  12 +
 drivers/clk/Makefile                  |   1 +
 drivers/clk/clk-ath79.c               | 782 ++++++++++++++++++++++++++
 include/dt-bindings/clock/ath79-clk.h |   4 +-
 8 files changed, 913 insertions(+), 676 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

