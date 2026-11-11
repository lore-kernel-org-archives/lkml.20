Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436994;
	b=NKSn03UGAsDaOk0IsUiN5anwBdisJtI1AkyiCu+B+TwXrnjQOGD5kzbpf4PVkyTBm1KI
	 4xHCVDXrKY3gb4mlVEcQ3deNro7a287jtGu7TAvS5rrNnrD30JD4qqHQMyybMxuhpdB1z
	 opbyi9V6I8/llNiOopB0rhS7X2WKuELkclkR5yNVpjb4e2+DsTqrXakkNhW6S44AzMvJz
	 YNosqzqquyru1XfjPPRpdZWOGItoHuIGwm/e+eDx8HCJt/ejVKpNSpQhzcXtjHsirCjjd
	 jCTX4tWpKu+pV/j22kQBZBGebL/Wp4m41r+mdeFp/o3fIQEXuYYH0PTNQ8MJlms3keQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436994;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=jSZ/tjih5hHmj7xJU8RhvBRDAwsZICp5Fjl1qfyATP8=;
	b=v+7Ze2TadWizL/YPw7Hn3DpPnUF8pObg5c7JWWyVxw8knW3tgz9kz3qgjlie97W2MtQl
	 MIn1y9wMcjOnyIEkCdGzTXYDmi4e+VjYjKim1YlBNiiS++mvrOSdf55AQkb2NLck4ugAF
	 +VEgD6CbFMQGP9OAswmrBIdhjAST7UfyYko+6bYgEGoP5gJYGuXDHNgUpOj89KD98vGaS
	 iJYc7RMU+83neXmMD8jcUal9bK6tmdfw1LIBNSjUkO46PCaZ9FbuksIktHfy3g1S+LkaO
	 NqapLjEU2w+R+DpAVPAx6oXIer7R2n4jlrmEMVq4eIShXGcU2MIFaqd4QDB8PpIceTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZGMYYR6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E17660A380B;
	Wed, 11 Nov 2026 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZGMYYR6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2171F00A0B;
	Wed, 11 Nov 2026 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436994;
	bh=jSZ/tjih5hHmj7xJU8RhvBRDAwsZICp5Fjl1qfyATP8=;
	h=From:Subject:Date:To:Cc;
	b=bZGMYYR6ICYIXG4sVGzvCmAJ5cf5CEYiNJmVWUbh4xI8+btF/uN9c9JhFnthl2C4V
	 3UqQ3Wu+mqH75H9MYds+ChKVCtS3cjq7sZZJFQXU5rRSGXXyNVi8MBMvuKmlX35A+k
	 CZ+F6CSdrYI8oD4nt2qpq0cF85XF+MhhMVC6bUecncyDqnxlpaSMszUCrIBWi9V8k1
	 RbAlGYR5sNs93EFpeQ7KQ8e9pRGlsk8oawIAEWxDanjEHKmxyuS6Ex/bzBzakRPuSM
	 8R/XOCXy8d4iidubanz56TNblhz+JkH1okxRHjPwPdElBsaFlEVlWg7o8LsppRomk2
	 iTckEI2ouBJeg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/9] arm64: dts: marvell: DT warning fixes
Date: Wed, 11 Nov 2026 16:42:57 -0600
Message-Id: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWuiJYhXEYtqByNu6ZRIxLsrz
 u5bnP8CRkfIUEUXODyIaV0CZByBGfTSoyAbDCpRuQwT1rcsZu0OnCaRalTSlNpkhYVw2Rx2dH6
 5uvnNezui8W8D7vsBwqAgHHAAAAA=
X-Change-ID: 20261111-dtbs-marvell-3ae21c8ac47d
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Another batch of DT schema warning fixes for Marvell platforms. This
fixes most of the remaining warnings on Marvell platforms.

It's best if the whole series is taken together.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (9):
      dt-bindings: mfd: Add Marvell AP806/CP110 system controller schema
      arm64: dts: marvell: Add AP806/CP110 syscon compatibles
      arm64: dts: marvell: Drop unused USB connector PHY supplies
      arm64: dts: marvell: Drop SPI max frequency
      arm64: dts: marvell: Fix node names
      arm64: dts: marvell: Fix w25q32 compatible strings
      arm64: dts: marvell: Drop unused USB 'phy-names'
      arm64: dts: marvell: cn9131-cf-solidwan: Drop st,m41t80 reset-gpios
      arm64: dts: marvell: armada-3720-gl-mv1000: Add switch fixed-link

 .../mfd/marvell,ap806-cp110-system-controller.yaml | 59 ++++++++++++++++++++++
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      |  2 +-
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |  6 +++
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  1 -
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     |  2 -
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |  5 +-
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |  1 -
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |  3 +-
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   | 11 ++--
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |  6 ++-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |  6 ++-
 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts       |  2 -
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |  2 -
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |  1 -
 .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |  4 +-
 15 files changed, 84 insertions(+), 27 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-dtbs-marvell-3ae21c8ac47d

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

