Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294408;
	b=E0gTevcQ79+xymWeT4xcIWhMbVKszqenJgEezvz+2Iv0wiNn8hjdXokJ08aP1ZUWR/BQ
	 wR5P74mDxTE+b8SCA5d4YwZvJJU1uPrw5vvTz/2MuUU+G+5DOcZ0Z8C237PTFV/Ip6zub
	 vyIteU6UXakdKlc4o0samy2XNC9JqpBlblgjajh1fML8p1OANNTyRQUB9gLmLdNrG+rXD
	 6zmR5ge2BiscNCZxHXYwuZFo/XUyw21ivAwcyRA9jA1VGNFjXucgqLi0B2UwZFCVT6NJH
	 I4A8ZhdLTxe40SuduVThD0wDQyfz413MUvwCWFdYFIosfAREDq2uTGnpwTerYOP/WSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
	b=o74bGT11AvGDhoI5NwnjIE8pPATjelwpW1R8EfwHKOQK3aqlGvgpwjrnSN0UiC0m6zqx
	 16Z21gM/0ME/XSca3aU4u+sM6HMp0fuYEBtQHTGYdSoOKABZzE0Ar/Uq6KIP3jNn/skEk
	 syvo2N9o/AYCaCi7H9DBMxEKA4a5CZ9cGUpbMzjvCfYoZIAgxA/Q+L8DBe7zKFlSE/6cy
	 uzoWLtaBHWo8Mx+Oju4LfZUE11RG24y9kF1RhkLRi4AdZPuah6URxLriNwfxEoy/6Pp3+
	 78BIt3EPaU8Egs7qbsTnd8TVkfHr4bVJEjSN16/x4FtlcuzKHwXybeeNycSiTLewE0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xur0yAYh;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xur0yAYh
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so958891b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294408; x=1794899208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=xur0yAYhREMTd55KzyJm5zbg3HXoHVb1qk1JhWPSqNWMyhGSzmKR/0NOqEfdIcTGt0
         032kXl//6GeRrYO5qabzdcEi8jRvx4DVKz+MNvgE/1lwV+fx5cQFmDjKq4RUmRtrZeUQ
         Kvaq9CHdh6vGjJsFmWKcvF7/EAB8A983xBzQ/6y76Cr7kR2XCMWDx1EUsQ2XVq8CGeT6
         kqaj9pDmn5Xu7+u96+GHsAzuG5w1pkt7iYlII3g+7Jp44BWV5xvUqQpn3jLqzgK4HT7E
         32Y5YB7O00VbjWH4JbEY4HOoCWPn32OeG0vC4vAGmYyrPu3Cqpy+MIoFVqmyM2gpmczD
         fo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294408; x=1794899208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=rDqHzmw54PK9mTyl0AVk137oPT3XeWE6houg1fDOwLTgqPiMJdj/73legD9HtNbkO+
         /hFcWFAt3oKSLTzhltXx/ZJEwKn+IHFM1MHXQJjelBVmHIsJfXQ2sgS3j6HVtPeYHnZo
         Bv8uZXn4euOAwVDFfhYA0UzjVri8v8IyNE4BgoUyyOMMTFSLOY4eND7kCy82716xQYbR
         rw/jiuEEQOzR9VfDLUpH0pkgcH4rqySbiLi+i2I29N86RtOBTW2+kKuXmE0KvYWmweGR
         zmMR8o534Z7eHb1pA/c6Uo6nXmDhON8fBiKAytK37/dOmJH1YMtJxo2AehUtD0wrEbEU
         aMAQ==
X-Forwarded-Encrypted: i=1; AL+hErFAbadwZOD/dFQKhy02bLyB6lsXrC6Oh0xxmq94gu/PHogmp8vA4x/tvq0Ji94ASWMdNsQ62VU7oZl2wvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zdLD7UIyLElhWHNFCoSinz10t27fQTlvWgaogY9C/J9Z18K/j
	mE1Ku59o1vLNZ+RwCpy7KUdHH1AbuayIYLJ/Y24p9QCGm7Y3+w6w2qagwZGjB71E
X-Gm-Gg: AYBFou3EuWB4rD8V5EpEPbgqPkyPtJigw2c+AqTYO2KChveZD5CLVYRt6dS0HfQParf
	a1Z3fEPSptRnLZmvXbtkGBPIQ+R1oOCPAZRHI1LOxQtLTORWYOQZyp6J65oIByNxy+lL7/Do6J1
	EiHV8ow1DTZCg3ob5eNXbynH2EJS23HwA1KjaRMyQtvnTym61+1A8m64zHvVqGmFupO0+Y3haEZ
	uyZ0nKo/ZwVh5/A07RsauvlvWNZ2zIQ9FEAyNtGJi2+lXp0BgVSR06Vy6qU35kvr3iftmeI1zK0
	MHcwU3eaiTdA9KGXL+FOV/a3xgLPE/XXSKg2h/ljI9jn+rPO9sL6l8WRapFcfbjyO1TzYPfwTsG
	JNY+S8WIv8x2n6mAZfUIFu99GlLBRcVuQoJxGrLm01b9V/6gDuZDPM10COiHcHK+ECGMBWnj6uy
	W1R7d7FHv8zPVVO+vUalyt96nJDGP58gs7gqyrsYZA93yeQX98FXFaIuKI+Bi/fQTMpcAYioLWY
	B5LEiyILtGo3i8IWUGjFXy2M4u6fzm6Heozf79MINLGq7D9MJsDoRyphvyukSBq7QMJqlUSrDyA
	FLnmECeTVFnXKDTqf0n7fEKWJzc=
X-Received: by 2002:a05:6a00:1389:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-8ba8725e415mr1910547b3a.38.1794294407637;
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3f3e7sm511794b3a.40.2026.11.09.23.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Tue, 10 Nov 2026 15:06:21 +0800
Message-ID: <20261110070627.217946-1-inochiama@gmail.com>
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

The current DRD implementation of DRD will cause a interrupt flow on
CV1800 Series SoC. It has two reasons:
1. The DRD does not sync the phy mode when change the controller mode,
   it is a violation of the DRD as it does not rely on a OTG phy.
2. The CV1800 is entered with a Session End Detected interrupt, but the
   DRD code has no change on it, so the controller will enter the
   interrupt storm.

This patch add fixes for these two problem, and I have tested this on
a Huashan PI board (it has a CV1812H SoC).

Note: This patches set does not resolve all the problems, as
      usb_add_hcd() will override the role set by dwc2, but I am not
      sure whether it should change skip_phy_initialization of hcd.
      So I kept it as it is and users still needs to set the role
      in the userspace as "role-switch-default-mode" in devicetree
      takes no effect.

Inochi Amaoto (4):
  usb: dwc2: gadget: honor pullup requests in core_connect
  usb: dwc2: drd: Sync the generic PHY mode with role requests
  usb: dwc2: Add USB DRD support on CV1800 series SoC
  riscv: dts: sophgo: Enable USB role switch on Huashan PI

 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 +-
 drivers/usb/dwc2/core.h                       |  5 +-
 drivers/usb/dwc2/drd.c                        | 77 +++++++++++++++----
 drivers/usb/dwc2/gadget.c                     |  3 +-
 drivers/usb/dwc2/params.c                     |  1 +
 drivers/usb/dwc2/platform.c                   |  4 +-
 6 files changed, 73 insertions(+), 21 deletions(-)

--
2.56.0

