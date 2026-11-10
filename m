Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331316;
	b=b76DoyV5f4VrjIra6j/4KUEqZLUYacM0vLTE7+hE6BRiMAnXSro3cPJtJwBQ2d0y/b/B
	 TC5eJ5gKlkIGulEhNmAuaZbKW4uje7H2qdl+Q2wti9CFI3miGLbyHLH4bGK7cc8vtouLt
	 fs4xCfgha+63hW4D42grKX4+ED+IPN8nHqd7jkz5AhneZjeB2/B8sW1v6vaFUXzSoeqIV
	 c3ouDz6HeEvtRdwzZ9f3/iJf5KICsSsAhauxo7gQYdXRrVYfdQnm2+wjd9fM8n/gyS9os
	 E4/tvVeW5s8cQXLezHG7VfIo4urt50Zqph/P05pWikwdIhvk1rqin6TfolcbIcev10g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331316;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GEmhqoKBqwQlH70Y7aS0Pdx89Lkc5hycHMCshw3pUM8=;
	b=MPenMWmd8YtoKuN+EXvM9KvHxrSmQWyeK8wkuOKNGr4R/paVxYW2e5gjundApbrzkD12
	 gXYR5EOK14acmX/arSHzPBiv9XMQBn0j8+iasYLS0THZcEbjgoixI6MW3WiU28SS9CLHF
	 LFDY2AGw101FXz2OYSxBXcdmbyTZDpeio6aiDCuQm2SC+raC5cZlkK+HXCRqKSoOHvuFI
	 wDVTllQaUq60mU9xEmTdMqtDTajKhoJnQ3sNvBW8hZ4Bqi1Ll8GtPJMP82BR3gs+Uk2yV
	 wIOHmWUNXjTxTEqYwYqioiQtqIIGtkGtPS6LyrcQmFf+KpqGfchTNbbgp8HrM5ALLkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D7606A325;
	Tue, 10 Nov 2026 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94D7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpXU-001C99-0U;
	Tue, 10 Nov 2026 18:21:44 +0100
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
Subject: [PATCH 0/3] arm64: dts: airoha: add AN7589 support
Date: Tue, 10 Nov 2026 18:21:40 +0100
Message-Id: <20261110172143.296304-1-john@phrozen.org>
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

