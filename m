Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260327;
	b=djps0CbTD6jDWBqNqQloUkwOv7Lv0H81TGdnG2iCGGdt3/iC2i6UNZox14B/11M7C4lc
	 vQaYKYdhRsVeRj/qt0mnJ5SzEhpEWJTWrEvwLMnEf/754gTjbo/wJNipz73QcGRkxLRPE
	 oS1ndZPJhKtOPOjS7EJfhlQnv4emrMpYMw1edo+M01IOPl6QHqK5EGiC3YX96KTV0diXP
	 l2mjmxjN8pwx94zXm0IfW6uKqYJL58rRTwx8I5uzD5vqhvHNCpWcTxW5OT/6MN9o1P/y2
	 qctThlsqa7Qt5bDktqP3X9o+JCi70rP9x5YRNRg1alZ152z5gYemyqBhGJtVmK70aOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260327;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sqagyVcKqIAinu4JxuHIZSAS6rRzPNadzZhNbuXuo+w=;
	b=zcUDTXgWTNFPqXPEi7JbBEW4PViHgWvxhVdb1+ZnOiHJNzH2v3d/IDL6RL9+HOXB19m9
	 u1rxZNJ2EHChEv0ZpnQsrdJ1IfidlUcyHUiuvO+21Glg/HcGh9nkhoAvRrk9mvXaD0gr/
	 QJiqywfPd4p5gzpDG7AI2L+kv7uEkzRlcWA/RXYiusFI0InQqasDwW1zHqLlv1URFRH6K
	 WbYaAg3JPlM2uI5bA6MXghG5xu1b0++TDHRalf8EpvqTVmYEfJKlG8hMWpNSxFu0XPMSE
	 eP7fwo0sD/MG/wdQI/j0dQ7Plf6ikvahunLmiVoDPHxgBQ8kQOFiPtjwt4XfgaSzetQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2146E606A31A;
	Thu, 29 Oct 2026 07:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2146E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 15:52:03 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 15:52:03 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Thu, 29 Oct 2026 15:51:54 +0800
Subject: [PATCH] arm64: dts: aspeed: ast2700-evb: Reserve coprocessor, IPC
 and VBIOS memory
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
Message-ID: <20261029-ast2700-evb-reserved-memory-v1-1-ca1360d585d9@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIABr74moC/x3MQQqDMBBG4avIrB1IImjaqxQX0fzaWahlUoIi3
 t3g8lu8d1KCChK9q5MUWZJsa4GtKxq/YZ3BEovJGdda4zyH9HedMYw8sKLUGZEXLJsejMYPU4i
 +ta9A5fBTTLI/909/XTeUBCUAbQAAAA==
X-Change-ID: 20261028-ast2700-evb-reserved-memory-e38bfad8619a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Arnd Bergmann <arnd@arndb.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793260323; l=2191;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=XeDRHsPi2k+CJeY1+La1RVHwRDnYoS77GIz9W0YvdBE=;
 b=A0sObIioWr33st/x7XXxLcltHvLkUZzDkbvHk3dGjV8HJbQuNdyuI1n81g6fNqzcC8W15IXAZ
 GpOGCylX8nDCD/IE+z2YAh4Dl5Wy2FoUN1ZNH6GP4CPCIwjwocgp9wv
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

On the AST2700 EVB, the boot firmware places the SSP and TSP
coprocessor firmware in 0x42c000000-0x42fffffff, the IPC shared memory
in 0x431080000-0x431b2ffff and two VBIOS regions in
0x431bb0000-0x431bcffff, and locks these ranges so that accesses from
the Cortex-A35 are blocked. U-Boot does not add reserved-memory nodes
for these ranges to the DT it passes to Linux, and they are inside the
memory node, so the kernel uses them as ordinary RAM and the EVB fails
to boot once it touches them.

Reserve the regions with no-map so the kernel neither allocates them
nor keeps them in the linear map.

Fixes: e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device tree")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Assisted-by: LLM
---
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/aspeed/ast2700-evb.dts b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
index fe8f0b80fb2c..795284253ea5 100644
--- a/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
+++ b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
@@ -24,6 +24,42 @@ memory@400000000 {
 		device_type = "memory";
 		reg = <0x4 0x00000000 0x0 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ssp_memory: ssp-memory@42c000000 {
+			reg = <0x4 0x2c000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		tsp_memory: tsp-memory@42e000000 {
+			reg = <0x4 0x2e000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		ipc_ssp_share: ipc-ssp-share@431080000 {
+			reg = <0x4 0x31080000 0x0 0x800000>;
+			no-map;
+		};
+
+		ipc_bootmcu_share: ipc-bootmcu-share@431880000 {
+			reg = <0x4 0x31880000 0x0 0x2b0000>;
+			no-map;
+		};
+
+		vbios_base0: vbios-base0@431bb0000 {
+			reg = <0x4 0x31bb0000 0x0 0x10000>;
+			no-map;
+		};
+
+		vbios_base1: vbios-base1@431bc0000 {
+			reg = <0x4 0x31bc0000 0x0 0x10000>;
+			no-map;
+		};
+	};
 };
 
 &fmc {

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261028-ast2700-evb-reserved-memory-e38bfad8619a

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>

