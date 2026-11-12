Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509701;
	b=MVZHAu6WDi1neBtY0IccppGbZMSyO+IyU74YIx9giC4ZHf9MpmWR81gOpuO/bJhGXepS
	 pO1Kev8anrD7Oe0NkuT2tljHkHvxUZYl3fiUU8e0MYuRnrqeWGs+zm37JyVU6+thTJSk2
	 SXVQ1Yxy10La3tFz18luqkF4rr8qvjMvQzXXMGz0me5yQY7ZS52TooihLiAncTQDo80pS
	 Sqe3PsOWDHfx68OJ//a+2F3f57xlICP0dFY3ls5jhVqpWSdEHowcca83nwRXq8gZUx3ue
	 KxjRI3quQwwD1tt1dPr6LfttNTeWoq1xtlf/NFh9YKMDAFFC3o7ZxkaqMAS1qMZGMJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509701;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0GCLapWmIezzyEfrQyi4uMy74mmpvzRuFkK70SRG3GE=;
	b=2i7P+r5FGJ9um5amsUbm1Uk0FPWpz71FV1sw1NTRrkrpThoZzVDkKpQJUzkeqBH087Wu
	 l5VzeCkJCMylK7YG+WDEnYQFwggM+iiwZnjXtJ9Ba9h4bbw0glu8A3t7UaX60lyRhwAJK
	 6pVgJJ411jMM8VzfH9gLEI5uCnIBm4rHPougM+5GlzlqFiAF3Noidvh81w1QhjK9SZEiO
	 XQkAvsU52XETJHVLQ/IBpSMn6C6YkDe1NQJRtZpM15XHFaPXAAhhtp4yjUz0J1uC1qsAK
	 cDSGmseW6qqE/xMbcMlqx4fA7fLG7ky6BXWGUsN6bdlTmScRpGhowR5gIhu95oYw7Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64F606A885;
	Thu, 12 Nov 2026 18:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE64F606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRZwj-002XXn-2b;
	Thu, 12 Nov 2026 19:54:53 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v2 0/3] arm64: dts: airoha: add AN7589 support
Date: Thu, 12 Nov 2026 19:54:43 +0100
Message-Id: <20261112185446.1314808-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
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

The Airoha AN7589 is a quad Cortex-A73 SoC. This series adds its board
compatibles, a base SoC dtsi with the CPUs, PSCI, the GICv3, the
architected timer and the console UART, and the device tree of the
evaluation board with 2 GiB of DRAM.

The remaining blocks follow with the series of their drivers.

The series applies to next-20261105 and has no dependencies.

Changes in v2:
- Patch 1: add Acked-by of Conor.
- Patch 2: set the size of the GICV region to 0x2000 and order the nodes
  and properties as Documentation/devicetree/bindings/dts-coding-style.rst
  describes.
- Link to v1: https://lore.kernel.org/r/20261110172143.296304-1-john@phrozen.org

John Crispin (3):
  dt-bindings: arm: airoha: add AN7589
  arm64: dts: airoha: add AN7589 SoC dtsi
  arm64: dts: airoha: add AN7589 evaluation board

 .../devicetree/bindings/arm/airoha.yaml       |   4 +
 arch/arm64/boot/dts/airoha/Makefile           |   1 +
 arch/arm64/boot/dts/airoha/an7589-evb.dts     |  22 +++
 arch/arm64/boot/dts/airoha/an7589.dtsi        | 134 ++++++++++++++++++
 4 files changed, 161 insertions(+)
 create mode 100644 arch/arm64/boot/dts/airoha/an7589-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7589.dtsi


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1

