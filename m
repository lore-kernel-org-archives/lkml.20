Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853249;
	b=cCFRnqxpu19X6d/FfrLCTX0DQBSJQ9c6uvDS86+BP7nkIOZxy1klHA+gPajR/0WgK83R
	 qYe7N92Yd5qCjdyFxt/0WbPhyPNnRFXxsW4pHtlngH2hPsr2Pxix5y/546lnDvoYxdD8f
	 zhplUEVf3ttfeA3Uyv4CqMc6l4EIxlQCIWzvdmbNxepF78wOCwJad4LDpmZufm6Vwclr9
	 wfGiXv9s2MtkcKnFj9laZUIyagP1mS8VOA5yDTXVLhZVTxpMRrgUuOCz5QqOciGBKWgbH
	 Qoa4F/L+CPlRuijzooXPrXEKLnN+rveea844LVD33w/23NKbAAV7G4tT4cTTIqXf6Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
	b=2pTiLXRNjD0XCdzms7AGSUS6c2WWIOmquyby9anjuFpfLfKXJY7ek1DS39ldWiuzuVN9
	 +cEMP+s9/4IAu7JCV0CTz/EzbWrW8fyyFSzYKkdj1/wSF0tGPWYo8Q0aoj1n5GYYRvjj/
	 LP0bX/ehrlBUFM7Se7i8mFgW3X4aR7a8JHDhhAzznLwzQQWQ+mlY0SGsLUzJKoA2riet0
	 tbwOmw0iF10giNHouqeREVI6Yc+A5V5moXSUO3WqVL4wao4xF2NmQRmV34ekZN2IlGxcD
	 eUL6tMJPFVrAvZiPm1/Kb3umyzsH1GmUH76u2WONPM+BsI4J8Xdaf9z+Ii7tBfFhJhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eqpuz/BN";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7832606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7832606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqpuz/BN
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3575535b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853248; x=1795458048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
        b=eqpuz/BNRewwnqPR7Lwmmdgpfh+V3P3GN1xkaOj9TGIfVxlvvUaeb+b61A4lFcZakD
         HKNV7dYJ5vMNhJg2Jtbs+B/yB+qpMSvukXDC7F3N2y0KoPs7/Y2DMUDHjToOQFC0fBAL
         1F3WSIjqXrRakyePJsE5t1QMuZKR/a/3H2nsMYW3k+MBDY+ry39LkA5DOakoRD0blMH+
         UWilVCKHWpXJjoyXUTyAaA94q1v22loBGudWyAzccXQGLvpgst0Jk3lXv2X7lCgf5XTq
         fQG8FEsdOvc+d50IF/heXA51aqJrZ3ReT2LM4/3aaH00qUJSwsxvMTXEuVGJP6gKVyvS
         e8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853248; x=1795458048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
        b=zJwGbg2uRYdtyzLygmHNpxDoeQT3BMYMUdt+ITF8Rk5JwEMaPTDX1Z5mE1HZfgYFTc
         vTwOTzVP4FfFtXS01i/32PInPcUJ6yRrD/1D77y7/vzpU+ANJQFGeHJnnIh49KOElSRp
         BofyJ9m7vj4E5JrowksLaz+B4WYkzt5Xt6riswJimI6IA+LKpXVRliRkmAcjZsrCb9Fx
         xrDiFh0ugqJYwtQGRkGGk5rdaVfCt2QwTvsrh/Lh+rgsWsaXDo2+LP/nf0DNmUgjDktk
         dX0ClHJkR12Y7G6mucURR22NqvbZPWIlVSoZMWr3n0nNZWRm6b2pIz2DFpcASdK35AeT
         5vHg==
X-Forwarded-Encrypted: i=1; AL+hErG/8TkqTNPzHY7oBKJjPMig9fyzzYWQcNQI6Oq5dhxjk2ML9DOCMvsEYejnfcrShrL96XWrBjxBVdBQGNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VB62pmTMm1ymdJq4gpO9KpEQJVin7QsfjDLAuY4jAU7FAK3ec
	/SVOiVfWFjwE0AT4UCe4hwUhGNUbfee2JQEZVhVvoWbeA1cjBJMUzGAh
X-Gm-Gg: AYBFou3q6EstaEom/CXPz7DYIgWxm6cj+VnsYps9uLem7x6NJbr9uD2eicsePGvYX8K
	0fZlY7c9PUArNzBmB8cnAwucfkKSHnBRE8TpM4rAAIhGGIobnWVE6V6IyL4+QxPoiRyLNzTA5DQ
	0Kv0UqLF+W3/pXTbQdG7yMl+Fb+3sgZ6OSxJmttMw7lrDVlfDaOMKvFigVoKd3RFYweQMWZfjVz
	IIFTdTBwgyJPWl90cd9Qehd8LtigWCJpLOs8hoQKmegBZFGwDfSc6euX+D61SkqOIEfkscWIqsu
	1F5zu3hbO19tz7imMQdzaz6XSS/5U9LLl49LN0MMUT8UTom4XG8udDZhMJOFtwIIoyMhNk0y2sd
	gg0myxz4Bcvy+VCYzOkyhwo1uETJBq8NRqAmfCu0buAH+Stq1HXt0iYXWt99lHkFm5OnPbT7DDz
	IfiqEdOkC8EZk7n96FEkghmUeWEemvIeo2eFrAkY6zlXssTuhONKR/2+4bZabe8Ybdz8ys/fmgC
	OBTNgeJGwoJjffMq9eT6D9IQQsx2/D/bHnhrX4ie6b32NOEv1d5r4HpJ/9+/tbAzcAnT3VDo9uK
	h9iT7zo+xGXqelM7ALESKlerMo3SLeqXYF1TMoim4RywAjszgejucYrMnWY/qRTGBPcUvuFbGqK
	k5FfJzPjVMPx1wdA0wHuAhj6+Tpe69s1/UbLRgOGPytKFmtPDSUelwOmzig==
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:827b:2b7e with SMTP id adf61e73a8af0-3f7a6ea143cmr11038256637.28.1794853247994;
        Mon, 16 Nov 2026 10:20:47 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececce013sm4235466b3a.6.2026.11.16.10.20.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:47 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH net-next v3 0/3] ptp: ocp: support the WiWi production Time Card
Date: Mon, 16 Nov 2026 10:20:44 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The WiWi Time Card (2163:1008, subsystem 10ee:0007) presents its timing
peripherals behind a LitePCIe interface that requires aligned word MMIO.
Add an opt-in access mode for XIIC, test both access modes, and support
the revision 02 PCI interface in ptp_ocp. Patch 3 consumes patch 1.
Could the I2C maintainers review patches 1 and 2 for an Ack to take
them through net-next?

Changes since v2:
 - 1/3: Identify patch 3's WiWi XIIC child as the first user.
 - 2/3: Restrict the RAM-backed test to direct x86-64 MMIO. Exclude
   UML and indirect I/O; do not restrict the driver.
 - 3/3: Match the board by its PCI IDs, validate revision and geometry
   separately, and select typed XIIC data from the static board match.
   Do not expose the SPI flash through MTD or devlink. Omit unsupported
   GNSS2 interfaces, preserve external PPS2, and clarify firmware build
   reporting. Refuse timing enables until the interrupt gate is open.
   Distinguish WiWi's PCI interface from legacy Celestica.

The driver objects build for x86-64 allmodconfig with W=1. All four
XIIC KUnit cases passed on x86-64 QEMU with the same two I2C patches.
An earlier revision of the driver on a revision 02 card confirmed
64 MSI-X vectors and an advancing PHC. The new board policy and timing
guard have not been run on that card. No claim of PPS lock, UTC accuracy
or masked-event replay is made.

Codex assisted with implementation, tests and changelogs using the
board evidence, vendor revision rule and mailing-list feedback.

v2: https://lore.kernel.org/netdev/20261112163333.12523-1-ahmadexp@gmail.com/
v1: https://lore.kernel.org/netdev/20261111041904.48916-1-ahmadexp@gmail.com/

Ahmad Byagowi (3):
  i2c: xiic: allow platforms to require 32-bit register accesses
  i2c: xiic: add KUnit coverage for register access modes
  ptp: ocp: support the WiWi revision 02 Time Card

 Documentation/networking/devlink/ptp_ocp.rst |  47 +++-
 MAINTAINERS                                  |   1 +
 drivers/i2c/busses/Kconfig                   |  15 ++
 drivers/i2c/busses/i2c-xiic.c                |  60 +++--
 drivers/i2c/busses/tests/i2c_xiic_kunit.c    |  91 +++++++
 drivers/ptp/ptp_ocp.c                        | 242 +++++++++++++++++--
 include/linux/platform_data/i2c-xiic.h       |   3 +
 7 files changed, 422 insertions(+), 37 deletions(-)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
