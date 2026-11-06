Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945218;
	b=Nf2e4NUZJQMRQ3w1zf5d1L6RoPRe/feXm3N9Vy+eh6T1H0hpeJvsv9+FrsLw5lL698Qd
	 zM1joGi3b6PknU5q0Z7bn/7nGH4C+6xoFglLOKDpklnGPHgrkd0R3LZIKUTlPF5bUsx0O
	 Tu/paBCHzC/YHukNUt/Rb6EpRb2zOFb9dtvHdZFQl+kvf+ZWC43ZAPROmKJGNdOQG9je7
	 e4W9wXpNtku7pZE1ryGQTZjBmznwuxGXclGRvmobFOlDcRNnOMShoNjUi4BptIuLwkvcz
	 uhN0pEPH6qQ63+Yt/+NCiQm1NaJedvtmIHKN3jaEtd2Vp4el23VzG0c0ZZo4DLtXL3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
	b=sQgor4Y3IJgcQPUjgh+9/5KFsCEW9oY8CQ/Oe0bS1MUbLsKlrGLaerzWMlPNbyVj4Cld
	 mI0Dpi+BKFWDMWN+r3tmDYPs5yg0IPeVw/TCYrTYzkD1k+qTtyX9UY3YlKR7g6b45LI35
	 Ao000mKvHn/3DATYL56RJtCPEGoJC7FVk42tzn7x+gLdtHj4CkYJwyIvUnnJG4Q8JwPUe
	 PblNFKgtBXW42UYM9e16FVJUZqhw57EeXMqI3Qeben2j8iSM0vpJ43AOhfk//on0TklN1
	 hh37DC/lMb4LZOZqUOnmriI3XK5wd3aDw4yOfhWDDUgTpNhhGR7HsDzMLRvE3Tsrn+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bj2/h1dV";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAD0606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CAD0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bj2/h1dV
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so593599eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945218; x=1794550018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
        b=Bj2/h1dVRmdU/7BaQU8t24ntY2qLAVJegIr4KYzGnzzycUX27g3gX+C5Txj+DeC84x
         qch6skHLZrHnw9ax5buB5oZcBA/E44nyPphxCeW2YWMJIdpRcdgiNkX0gUbJx0urdOfo
         LoDyme3iGaTP9yh8qRWQBBr/HkLej98uOqn/Jw+xjoWH3TPl6xyw0SerdUEGLg0saKZe
         7mIxd3thNUQ2Z3Q86kBGKSvZjeh72pOsVmUWIbhtLK/6S5aZAhduRhlmxo4lz6XaNY3p
         UmyeTN4GQb36QvqkJRgzwrpHEqzrY6cGkuHQ/HdHg+Noi0ffPCmXu/7xJoXsA3JgnE3R
         wusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945218; x=1794550018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oP3EQV3igCQFQrQhRO3kdFq4f6+qs4DCf/vNPMH0lsQ=;
        b=biLiXLTTayH49/OgRih1hUMjmaeOk0iaO/SXFGsBS/7bOMgpPiLzyEu560RwES4dtI
         bq6r0K9jB3uhgvfxQEszyl3Ju46nIUnCQWcGwsdvGs2+MtAicet/pnxDFF93wV38huQJ
         ujTZilMH7updtiQXtZlupKxycqV9SaXSlX+I9HI4hXKd4K90gOb/JxmstG9HaSVj5iK4
         7p3oK/mLyxqi5PqrbQ7X0JCjLlkPTmu+uFmlGsX1LRAny2HLQc2e9idG7n79VCsZCmck
         YyUKvguqUy7LuUZ3UNeELZ9SCJgkLIg2aMozt8Hi6y+l1Qd5/n9KC5J4HuzA8x31gpzy
         1HZA==
X-Forwarded-Encrypted: i=1; AKwUvBxyX8BtvUY4zm8XtTETM9A6TfMu2JGBVUmnPjqWYWmVBvsbzILtnjLiTmnqiuPXwkHFZ2X1N+iSuOiC8JM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AuRAvH2luzdLfRmnpiMuK39mylb7K2W0yBu8Ffu+mQY8pJ4Yy
	DqWDmlDd12masS80fS4ZbP4nitgO0JvwfYX3x0ION5mV77mtynpSI8uX
X-Gm-Gg: AYBFou1R+jsCoeGOoITWFLmIagTMT9iDYvEPlhPN66Oey1+HytnO4wSdNJnQUpTzmBn
	nCP0YqzIn0Z5Hm1scxA67nc/DYqjh//RpSEt9ksrUrH4Jcyasp3R35NHCksTDfemMz2Gu8oQY/y
	HyvtEvAR3C21zOPFtUq3I8IxepeOXHQLPrtgJw1YCq4Of0Uk2JmmJdp7YOHN2mUP1pWxe141YTu
	QjNGqCY76erhG486nzC/ZEsa1Q0wqs5kE/V4GYsELlq9kEm/7LMAi/Fs8Vh/IeFVBe49FjqGcTu
	2bZ5S1y/7zQYyxErHLH52y2l3an5NL7LJrBvRA4iHP9ekAR9eCpsMwPylIMoj/UK71rWSLr0oPo
	in8+NCdQ72imiw3GbrXJ1txJu+N6wWDs9yN9DlHn/DkjxCE9C7oNG/X60GBHsjFj+qhs0ejfkw7
	E02lCUAIUP/dtBzVSb/Zco3PvSOtXFneWc/T5w9hug4sSNg1UYqAz+uIw3WRTb09kyccn3Kv6mg
	u2EgSbeAiPQ/efgb0fbz2TycRAflROQJjVa1DjnYATrtQ4KM1Jsm3fo4UqG+p5yBxhWSbjasLnR
	TLnDXGwR7T6YOKMCN25RS0av0sEWCWMQSBLvN2uSATv/+rzEMnm3
X-Received: by 2002:a05:7022:3b83:b0:1b2:4cc7:7db2 with SMTP id a92af1059eb24-1b25d34ed54mr1914086c88.47.1793945217607;
        Thu, 05 Nov 2026 22:06:57 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:57 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH 0/3] Add read-only SpacemiT K3 eFuse support
Date: Fri,  6 Nov 2026 14:05:22 +0800
Message-ID: <20261106060525.346873-1-duge1256@gmail.com>
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

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

The driver reads the shadow registers of bank 0 and bank 7 once during
initialization and keeps a copy in memory. Later NVMEM reads return data
from this copy without accessing the registers again. Reads outside the
two bank ranges return zeros.

Tested on a SpacemiT K3 COM260 Kit by reading both banks through the
NVMEM sysfs interface. The data was unchanged across a reset and a full
power cycle. Reads crossing a bank boundary returned the expected bank
bytes and zeros in the keepout region.

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  25 +++
 drivers/nvmem/Kconfig                         |  14 ++
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 151 ++++++++++++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

