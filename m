Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672534;
	b=qlmWWCzViRyng65/o4eUjxS4jk5qNYzY+WkqAUC6SEDs74zTsS4m9GLCsF2JlU18yTv9
	 vyShc2TL64leyp8a88HohG+wV+mn+yCG+SZPMqZyyMKb2WQO7iVS3+DxQtiAC3F2TQU8X
	 cBT758K81smv1WIRKtr/9kr33WRLqq05UVr64p8DfILjKZZCV1TiV/PTt8gm0EQOS+HoP
	 Zpo5Im74bw0a9IgcfeOKSQjNlUIIY1joMLSeWs5S4/iy066qsRsT/207B7AXSYs8lAGIA
	 6Sg2dHh/qJdNBqOvRcYd2/v2JA7l/9mBxicrjnYFQQg+Ee6bylD7fb6rljV4DLqEM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
	b=IqYxSIjRi3bJ/Wr9wO/oA0HKzY9PVouU/plKiAv1ZmEG52zP4B/eciSy5C0m3hAPZt5b
	 qsgb7B5QN3a+mZdx2K+C527xtKgg/QmjK8BPjGBYml+1cv5nLlbozc8TB3r4pE5HOvwaD
	 zdLp4RByIT0WhX9O9xbBuq6+92A1ieoJDZxIv4wTTSIKYi2xfnSTziyef8ZJxf0iMlVj1
	 h7BYzgV3F8RrEBGdTWQLRTUoUt/DUzYNrS318rk4LAY15J4l7oGx/KWToce0EjDBIexIa
	 954Pve/3CgmMle2Zqn6DiOQbkgKuGjKdakYixrYiFUpGTRmV7splAj99ZeZw2QXPKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcvJJlQH;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDDC606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pcvJJlQH
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so107915a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672534; x=1794277334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
        b=pcvJJlQHlGOF0cpRM0UZePAnDC0vqeuBRizCxvexJ7QOLkN8zL3s4Cjs3WJ/t5DCBc
         d3lY9QkXohvzSDMe3oJ+hXgdx8im/eKScekNjdD5xWcpzme7sOuLYx170dlJIMYZlszQ
         YPdulHvcX71xyKzwLy00njaxlw1cMOFw8ZeSm+ZVYAdo6Ubhj9QafHmSlaGYXtsJpi2W
         902Ac+nkX/bTmhzQd4fdw5AVucBp3I6xec0Zok7FolDgMaPxy6bDM+qClB4y1BTAm5cU
         lSPpWGTzBUxCl1zoIyC8IwHL59W2TLZTBU/801Ml6a5Zxl0hbtaPi+Hb4VZ3RjnC/o6k
         ytOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672534; x=1794277334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7CZHsFtToEeDraAns18SBV26Wozlx1z/SodGdtdGHQ=;
        b=mrUiyFWnU1NHxoRTNj9vvMenl3b6QdqLBYXrGLNKQ+raQ5KQZ+t9ihKII312LMZOsq
         q4K7yAzvlviqdddXFLhqN4F240E6Ioh4XzCJ6Jl9Ts62IlBg/xGMmzpK/YKbG0GlL4+H
         dlfRJh9NMeCGxmvqRk5JtGr7+YIVCtvK2iDcF+6ErQwrQnoQLj4W30mI7QoNp2ATac5s
         9DtL8by6I32ujM7CW+qXEXz7K+TAVszogncmwATjw4I4iQQbMAer2mOUuP7nRZ+UQdUa
         n6/VEWiA2870kL3v0VDkscfcWdaHBJNq2GnWNcpKvTy/67drTbshAgvIbaciRoONiZM7
         N0JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDYYpHH3qGUDR5Bd1Pz2t93NEBa5KVu687PoVEbr6D9+hlwXPrp64FqSty7x75jdqbJ8KMY3T77M8Yf1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9rEePg6KgEVql3CMzCqZRic2wQpw9zK7QRPM2urARoqg1b/9H
	5VlEhbdaaFDXTKANkfQrOg7G29JVwqXG0DJ4Rde45FTzTPhHyaG7kW+e
X-Gm-Gg: AYBFou12N9I8XgSUoPtA2/Bd3XtvM8vlrrsNJKkEuBU2MknyBdnXohe4kjj6Vq8cYyv
	s9fmN/44V7LANrDCnKywmEV4/0Y2uVIxdsUvdlcQ6f2AK/hcHOf73vr5wJKISPJHweRbm+9IN0H
	HbREIfjXgxRdfQ2ZI5k7np9c9GnE8M/lLD+LqyggZCkl/t0EO4nnS0YV9SDG+a1DfPbeyX7OBO0
	EJdrbev7vtrfPOyyQzWwosVRPCp8z4ujtgi4QYVu+LNnfdGHGwKLTxtOVE+bmIYXAj0KybgOPZN
	XdusvlvgDYoIa7zV1mzApsZJziBN28IgCt90KT6ZgMecZP1XlmWOYTuaTxaNB9Xyw2G5yF4LT5+
	sSUDGQeQe5/rvCa+4Cl8rpLgsjeYZFr3b1iSfRqWaMmZAr70s1RanhXmDfxz6stlUXCqMojYH/B
	HTs/BH4lBf/kO0l4VKwwpnLUSGevIzUxNdOAnSUrK0x17k+U0GxEF19454XL7RyXGgOgFoe7BKc
	gOpUFW71uozMIEiBltuLms5XOlXJEB1o10qUkwYTJQHaFB5XL5oMzlqcsF68eiO8LJA17jkSdBD
	qAzrJxqGKZtqPmnYLO0baQGLX9P7bTk2V0chHjeqARs01nrEzKg9QnkMfi3ozJibsGA5qfAyKax
	s0Rx873FR33e+T0E=
X-Received: by 2002:a17:90b:55ce:b0:3ae:3f20:7058 with SMTP id 98e67ed59e1d1-3ae897bafd5mr6113235a91.36.1793672533832;
        Mon, 02 Nov 2026 18:22:13 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm1570124a91.5.2026.11.02.18.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:22:13 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Tue,  3 Nov 2026 10:22:00 +0800
Message-Id: <20261103022202.2139674-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memcpy, slave scatter-gather and cyclic transfers,
and a per-channel timeout configured through
dma_slave_config.peripheral_config. The timeout is needed by the
MA35D1 UART driver, to be submitted separately.

Tested on the MA35D1 SOM board with Linux v7.4-rc1, using local
(not yet submitted) QSPI and UART patches that use this PDMA driver.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 780 ++++++++++++++++++
 include/dt-bindings/dma/ma35d1-pdma.h         | 113 +++
 include/linux/dma/ma35d1-pdma.h               |  24 +
 6 files changed, 1002 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c
 create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h
 create mode 100644 include/linux/dma/ma35d1-pdma.h

--
2.25.1

