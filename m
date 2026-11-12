Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509700;
	b=mxGfl8CqBe0U5b8xVhlkctEkv6RkfUIMaz85MIZmbc2cfQlh3zJPJ4YShTEeRy8kOBcg
	 aEi2N2o+mnSzglcNw2LNUuUYdrCbgyqePrVL2arMGV8xWl/6dTspvg9Lq5CRlamffIDgC
	 X4pQzXxAn0yoUqre6DIp7zy1pFyWOCYzd5AzB1FXVqMO13iOR8xejWQdjYGPbVAM/kB7z
	 U4SnPzqf9P1FcFCkzPJQbE2l3sqN9As4X/9P7+7wylG/T29Y8ZmBJQNTtiPIrd07N5xxr
	 i6EG+YHxj7PwsTlGfIze5KbAjS1gdpwYnAnbLeaL2qNmhVia3jxfLGLqtX1wT5A9Apw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509700;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AEi1yAbNDHs7LRU8b5V/4XKfG/FYEAHp+93KsT9otlk=;
	b=gZGL/4+hWI/I4xxuKAyXtAAbvytrVK4LxYzZftpEqGZjLybatTY+QxkHl2EGQp69v5vX
	 qwDf/vhdcz7bMajk59VeDQ6VnH5HCEQXIkQwsnduoV7Wvb6Un+cd1b81vQcG5pMGOSqTA
	 9fE8gnTXbqB7yNGzlQ3IIjUNSUmuMBj6Z8EZVyqNZWmNiBCO3sjJhZqCxeO+Jj2r3oEWt
	 ZEVmjBT7aNj5ZVG8lZ+RWKHB8EXke0XGwsYbDfwuqIYSykukQZdnDDQ6cn6NEDQArWNIk
	 i/AukrwZdfLspJi5c1kIVQfdYBIX8rXlcByJAX58n5bUoZZFwT7PTyKu3ZH4NeGvCCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F7606A887;
	Thu, 12 Nov 2026 18:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642F7606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRZwk-002XXn-2j;
	Thu, 12 Nov 2026 19:54:54 +0100
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
Subject: [PATCH v2 3/3] arm64: dts: airoha: add AN7589 evaluation board
Date: Thu, 12 Nov 2026 19:54:46 +0100
Message-Id: <20261112185446.1314808-4-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185446.1314808-1-john@phrozen.org>
References: <20261112185446.1314808-1-john@phrozen.org>
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

Add the device tree for the Airoha AN7589 evaluation board, with 2 GiB
of DRAM and the console on UART1.

Signed-off-by: John Crispin <john@phrozen.org>
---
 arch/arm64/boot/dts/airoha/Makefile       |  1 +
 arch/arm64/boot/dts/airoha/an7589-evb.dts | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/airoha/an7589-evb.dts

diff --git a/arch/arm64/boot/dts/airoha/Makefile b/arch/arm64/boot/dts/airoha/Makefile
index ebea112ce1d7..78146871db77 100644
--- a/arch/arm64/boot/dts/airoha/Makefile
+++ b/arch/arm64/boot/dts/airoha/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_ARCH_AIROHA) += an7589-evb.dtb
 dtb-$(CONFIG_ARCH_AIROHA) += en7581-evb.dtb
diff --git a/arch/arm64/boot/dts/airoha/an7589-evb.dts b/arch/arm64/boot/dts/airoha/an7589-evb.dts
new file mode 100644
index 000000000000..eadba7154350
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7589-evb.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "an7589.dtsi"
+
+/ {
+	model = "Airoha AN7589 Evaluation Board";
+	compatible = "airoha,an7589-evb", "airoha,an7589";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
-- 
2.34.1

