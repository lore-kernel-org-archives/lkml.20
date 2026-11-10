Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331316;
	b=z15vMhDamknAvMnrDuMbWzq026iYRoHGAQViTymDF0cj1v+buhBjVw8Ik62mR2AAgsNK
	 TIa2BodDSprWddWUNQH+Xro/0B69cNYUjKtr4PWbhuwzbaxUQ63V4qu1S29Y7pZGMf6Q1
	 +coi873Y/ab0oQ8Dfot1YVe1FHadf6CoiFT5Wypxe1fmon8ozRb+qIwxqsYIYHF8BWzmS
	 hXN/mIVZJvt32/hcMaa0fKBsl7YZiTd/kfXoIsybrbaRdSgppK6c+oFFSHu50xtXU7dE3
	 KPWiTWUt8ThEwgRCxKKzAHl/+DjwDGmqr4G+9vyZtNZrp9VjIQCgucVX5R0XzztkFtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331316;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AEi1yAbNDHs7LRU8b5V/4XKfG/FYEAHp+93KsT9otlk=;
	b=HDNV4CJ2s16VjEliGtWhJifVr9BVbHVeeYq4AutIIIrC2/zh4Kkdu8rq/aR61ZNti6hG
	 cpfT7nvuh9CGaiQCZfX5R13PMTk/oXeO/EoygTea/nEpQCXIwjsIy6Hg+Evkmebp01Ter
	 CMss9ILQhZ6t9M4SXSei4ssju30pfb1RZgKHuXmH1muMd9BiT6YN+kjBD3VSEjjVS34Iv
	 qCsphmAYTRKzBv6DBcsPymIaw4g/PRK3C6WHmxk4SC4ygU4ItYdGsfQWYuo/ovQeOyTck
	 S6ZVFLwfVPaWCP7ho5siUgcmDCoZX0I+gCN4gPCq6FEGNFtHqxX4ox6q2DP2jb+0KSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940D606A320;
	Tue, 10 Nov 2026 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C940D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpXV-001C99-0e;
	Tue, 10 Nov 2026 18:21:45 +0100
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
Subject: [PATCH 3/3] arm64: dts: airoha: add AN7589 evaluation board
Date: Tue, 10 Nov 2026 18:21:43 +0100
Message-Id: <20261110172143.296304-4-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110172143.296304-1-john@phrozen.org>
References: <20261110172143.296304-1-john@phrozen.org>
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

