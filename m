Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833966;
	b=2caXJOmfevUWuO60AdMfLK0yWG2N8fwgl3fa2bTJLsS1OyIPUQeAOxzmqjPpukCfoFCn
	 eTU34sm0StCI2rIGbJnBidwdkgznt80UDZN3GzEbqzBnJdkyWtx5YbIsjyiTF6DU/Wf4g
	 aesFvdNMEH7eGanAhOWKGzQpNhRMnqezZ4LqijAYmubzfgwPJIEUtRjbvW6JWdvVXjLDS
	 a+HFz0b7CcgSeAbRRityvPCGGYWvBNggVsljTOMXi6CQv7nkuHtCQIjeNhChGfdmKbcLK
	 4BFtXedHUuCZ36IRklde3kQxiuo87gGUgZReM3Yrt8IYcAhQvejcMG3UJEpY0o3PAJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
	b=SKhD5Xgh5viAzt+q9dYMTSphGbkOcX38Pnavb6H2eaJHqxnmtBWtkU/mwm8j2AW9S3UG
	 VlH1byWPkEAwpiSnoZtr7IFK4n5CzK5hrld3tUNAz0y1NlhImjU0zPKUGKu/71IMguKYQ
	 5bn/dmtJgB0y79SN1+IXI/KzwxUjN1wOhWnzW1E0emc6cQyRO35cQDFPxhBVm+tH+Z54L
	 V2SoyQNs3u1PhMbffR02ylnqYExbN+iKy2xLAmO9ATwBvRdFsdDzC0en3pF9x/KqChNqV
	 bSfVEbV+LtyHnWnc6lcFVPQuU7Z7jjRetliQ5nVoxVcBaRVqUtQeA7NkYbLmpgWoj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K9k1Ywog;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37649606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37649606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K9k1Ywog
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso594316a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833964; x=1793438764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=K9k1YwogFvOOLanyVvhG+A0pGAz3/TOKZKGBKQbinaGMvITLnldoPfssMmSqBrKrzz
         mJNBVSkJPpqAV0Svhw3lcV1eqXLYa0OLfhV/j9ANUwHanaIxz8a4+g86lfQXln8gz7Q+
         oFuwAXLJy0jgzdf2U3jvzwUQ4XypEbwl+RisEOahJLlS/jfx+g6ZXSZX65qvAe10CeS2
         hXq9CkoAkPBw6ZSosy8xiUKO1+qyi7JOAwdGfkhXNo+9gngD4L88Cj3yMrHrRnJ1MJ4Q
         YlbvH1ADKI5TFTRJDGKIbjuTBaNW+uz9EWcCHl8epHeub9J9wslSMVS9TKiUBB0EjZ6f
         JdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833964; x=1793438764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=xfsiNvWmKoqSObwIASJcopbKXRZ4B3ZiLgEdXhJhuwWcqbUoHhzw0bI9OPcDnV84NL
         pdXD981BsPmPyEQLp+YPhFZm9CYYhktr97an+/9i9+0RU0jDJjHiF5owJav2n4koDtqy
         D5TSlUL8c9zCwivBbi3swo3jOTKKCxwB1/bOcLDeowRdB1UGcSd1cCBlqPrHCScO+fN8
         obFS1YDLyqCm97gDfsSZu22D2dyRNlS1nE5kMXfgZWvfkfR+8V9stt/qSqx3bkbiGeTt
         tgdtnwvEAKOEYIRyOEbj2acHyHLcIdurb2Ke/HgZXaz1CgU+6TdY4JFdiby28SRCWPE3
         n2/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzsIQ5XLWqS03j/p+K4A8C4lsMfkhN0naiAbjGNKRl0dR1un1U2nduCvhKCXAwIT73dJ07UgVu/UxsgYd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu/nG82QdRwB9F0oKAItHhnnLzr3W3YvRsM9s1tcOaeTbrjRaU
	72rAJ3KdKQHOSwuR3EnlYfEepRm/uHO0LagZD2N6E37+E9D2MnLJxlMz
X-Gm-Gg: AYBFou1G/MOJe+0H8rTA8VHSZPdWBHiqopmNfhZO6tR79PPboV225heWRO4A+3GwvWD
	2j/NsiZs30Zw/LYohQii8EO+w3Zheop9DuwTqw+5q2a/hY8GOEinEejF/Vecvky64uLOi5l+rPL
	7HUs/JDZqUs6ZW0cbZq3o+weKPXb1U7s0lHDNbSVuWpE9l4/+4N2xg4Tg8Ov5y6Q8a9AbVOsr5i
	phDy8rn2qQ9961uEvNzIOa6bKidjQk4WfDHFywlKYrjo0yN6OebpfovBMQWYtqAExqSimG+LT37
	NEj7BHekEhOL5Ov4V6rYAb70SPddEgY/y9rFPNAiF18O40j8txo42H08/qBrfxYxPH4MbKXWnMX
	vcA7OsyNobzagpZsGErTRRzmV0Kw6R6L3E20sRSWzT6JQCwjplmWUGyWTA8gY5IHHqgE9yYjmoF
	H34diA5EB6RsYGRWfrpDj08WXCYXeqylZNqO3wd2HL9an0HP1UvS5XsK9e1cJWpqg70FfetFdin
	zcIsDY6/BFd3Bk51YyQ3QTaCEmdH06rLucuqYkQm//Z7VQGPWNhQNiExMYJ1CIkeKNnjh3RBqvu
	NHuHUonXqP+iWe2Q+NBVW0YSc18TmiEXsmMpgYThqzmeud0JISKiV7bx58VcLTW4Z6A11r22Q4J
	WKBTbCa87CdWdx47eTqCKKWnl9h9j06Z/cek=
X-Received: by 2002:a17:90b:5823:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adeae7644emr1496748a91.32.1792833964552;
        Sat, 24 Oct 2026 02:26:04 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:03 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:56 +0800
Message-ID: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
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

On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
that stage sets up DRAM. This series marks the nodes it needs for that
bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
the PMIC rails and the SPI NOR in the board files.

The vendor confirmed that the BootROM itself does not access the
EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
sets up SDRAM, and DRAM cannot be trained without it.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series.

I used Claude to help read the U-Boot SPL and the device trees. I
checked the changes and ran dtbs_check myself.

Changes in v3:
- Reword both commit messages to describe the hardware instead of what
  an SPL does, and drop the U-Boot paragraph from patch 1 (E)
- Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
- Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
- Drop the Assisted-by tags, see commit 1e035297ffda
- Keep E's Reviewed-by on both patches, as the changes are the ones
  discussed on v2
- Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
 7 files changed, 47 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

