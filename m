Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56E33939D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435882; cv=none; b=TWTLUivNKvjsBLdh9dPikqAkCSOsCU58fd6UR47d2XZZXLMsBnIoQup0YHSbfnDND0eF0hB5nvQWZ/RNyT2ZfTT3/AzlR6MFN89CnJRgh0soIJ+Lm63gqzLErq/8bCXa27+pyeW0nPji6Z48UosiG+tuHNbKmv2mg2F9/ORJlYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435882; c=relaxed/simple;
	bh=v9lj7OyVmy8NQnxBmV0n5wJr8WwGHjPSO9DJ9cVLyk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZ8woZWg/Fqx/WxStjYF9ldKb275zaQmymHc+9m6ciW9oaBiubJu6xtTYWeebRW3eXzp4425T/k4Ci98/l1N12+Sozr9JV2l6n68RLjjHpdrz1Fugh7Z19Kfo0gZTia04FoNoDLHTmYj2UVyarknJgE62i7DQnbDLeZP08PEH7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kx4CquQB; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kx4CquQB"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so1977401a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435881; x=1790040681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkjxOhGzqU+8W6VS3//UzMLrdiDuidVOSy9K9CHCyjw=;
        b=kx4CquQBqUCKghpOmpcJ/YwS1rtuDZBk26RkOlmLXgM5VQC5M++DNvmUparbz06v3u
         jDHtT4ot7Dka5yUX6HJKWKCx1BnMLNKdATEMT8sskC62GkcHb22lvj610t26+X6f/F04
         9sAhT8amsYtqwwsXjZXq8XMnzA4LqfBB4l+sOCfEreyyqrWA7Spe69+Vba1QsA6n8VST
         VVlR/+ppiLLnwzZJYxtqM6WrZoWHABalKo0sOiZ77YxFf+4Q3u0aROs+eZa7ZaLh6uBx
         LQVTYvaBIar5u1nUkAF/yKpIfgjU64Cu5Ce04sLH89nNNYSqlHjv2BqGiuyX8HANVwL4
         NSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435881; x=1790040681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkjxOhGzqU+8W6VS3//UzMLrdiDuidVOSy9K9CHCyjw=;
        b=ZQeVvsRNo638dS85huaaCTZpezuekenPpWf6soFgiTE0yYRDDsKXIX8hPEUHx82gGa
         xY1t+qc8by+mnhUOE9UIu0a/DIJqGTIjteq7PazfmIxlUsQbJ7XgKNnmYoY8yWaOkTyd
         DxJseI8xWj0YcqKdGZPIea/JvMRxNejwFgosJAVXydezo4dUVu3bqMSrel8U16euQaUM
         Zu6BUmF3PFxREgbv3HaGr08TBoAfMziDWvGK61oUB3xBztTl5vokAnnUHuTu6gds/Srj
         RqjOGtKQRgiyJbHREDFS+dLyjCvRNr8ldWi6rXhlcbZxGXRl6auGIVsd68M8KOeERwRj
         SqMw==
X-Forwarded-Encrypted: i=1; AKwUvBzVK21UrJRcInIFuLUBEEkzTm+TVIIuWjyPZGAoXEWbbjyR1kkv+lyP5wjd/5sdCa10+AJVk+8101BeMRo=@vger.kernel.org
X-Gm-Message-State: AFuF++lmWs8x34Z0Nu7ubWaws/11NGMDPfQ4Zpa+xW/Igu+t6pA/BO5K
	FzaoJrQRCGE9uMvMaytA52m6QGeC0aBm8MV0IDy7WrY3nLT0fioi7872
X-Gm-Gg: AYBFou0/CG9ewhQzxZAtq+mkqEHsQefLaBjqztwhWZBJeRJijEUxtuNuJlmUJXLegQL
	/c/D0S6roLgE0na7xMlB31Usqb4MMvaGJB4Svo1H9FCJI3pDPlZPWW1Latk8Zu0nm/RjSKn9wqQ
	Gq65gUIz0D+wnKttP9ptKOygKUsItbUrRiPeI8ZvmzPn2+i/yGKuJyyII+ugHD5CaNRH+Q0aRhk
	DLIEjRdBewU5uBZZ/Fc807XIwj1Ooqe/Qh2Ay1/vO/ed5dvyNKBdyLO4GWZGU+i5NgProitK/GI
	pBNBQbBOr/yE1Xd7ZWU9r7CZmIyeGnwQ1TjzwPHR4W9+GvKtx3PtM6qLtl+h+V55SfhynM4feKS
	b5l4M6OMLoXcrOlbbU73EDRPXtCOwK2v8GhY6glGrDbItxnPVpVH/YS1tM8ym25mIpfWyc7ukbM
	rUieaphBlie4xp1ghZSTWec4rNugy4I7J+RZE+CLfALc105E4Hd68Yf4bvYxlY7xpMAJS2G87vy
	d+xYf9o24mmd1BcGaYQg4nvOh8=
X-Received: by 2002:a05:6a20:c901:b0:3cf:a7a5:e310 with SMTP id adf61e73a8af0-3db404aebb2mr12126866637.9.1789435880642;
        Mon, 14 Sep 2026 18:31:20 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm27111575c88.2.2026.09.14.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:31:20 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v5 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 15 Sep 2026 07:01:08 +0530
Message-ID: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree support for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

The series adds the board compatible and describes the BMC memory,
SPI NOR flash layout, UART console, GPIO line names, graphics
reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F
Ethernet PHY.

MAC0 uses the EEPROM on I2C7 as the NVMEM provider for its MAC
address and is configured to use the RTL8211F in RGMII-ID mode.

Changes in v5:
- Use the I2C7 EEPROM as the NVMEM provider for the MAC0 address.
- Configure MAC0 to use the RTL8211F in RGMII-ID mode.
- Use the standard OpenBMC 64 MiB flash layout.
- Add confirmed GPIO line names for the reset button and host power
  control.
- Add the reusable 16 MiB reserved-memory pool used by the graphics
  device.
- Drop the previous RX-delay-specific description.

Changes in v4:
- Validate the MAC0 RGMII timing configuration on B650D4U hardware.
- Keep phy-mode = "rgmii-rxid" based on hardware A/B testing.
- Add the SPI NOR fixed partition layout validated on B650D4U
  hardware.
- Correct the BMC memory size to 512 MiB.
- Order peripheral nodes alphabetically by label.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 120 ++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: fcf94f5431858d83003cf18d60df67bd87b20ad2
-- 
2.47.3

