Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258760;
	b=wFROtsjfC4EbcU8Q5bKn6bEk6t7ntdlxBdt8rICsIzUbMk9AIlCknyXIH8iMJIOlNHgp
	 uBVUwvZF9PgEnrEzfXNp6CjkCS7ruYk6mu7d9ihsQwxR4Y+EJE00lP4fgH44AKHrfrWj6
	 XTxp/Gl3i7BPXu7bXL2LS95YtuUDrCu3Z3Gw6y1Jdgc6RihFXPqU+7uMUEGMUQw1Gk4Lr
	 CfjRl0vZkFPAeJxkaxuimVgf4GSnvyguHtSluuVXPdA2CsYbeW1jaGFnGnIPQ4xJqm3LY
	 CQKqnbdTxNWZqwfR0ncvBYvyuqeAe4cUr9Muafqo2eoG9cdAzLSlnd41ech8DTzY6bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258760;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer;
	bh=NcAKdYZtTddQxjzrFXtQFy0f32SfgKRx0yegr2UvgLE=;
	b=q1AIx5TyHxgmy2qy5G+6WgN9VZCVK5ZhHaz0Nzh7nOiLnmy/IyNu3TNSeh95Ul3sH3VT
	 H5yjUwLp6y97nTsUFWrX7s7BKG2gOoCBZ49Q75Zfg1qbp4LGQgFX4w64Pq1/9c6jSo3K6
	 25+Xd8uVKG+3gsvjO2MPZtjTyZZqew6o+VRE1MMmDAFl4oCk/IB9JQhUqR9XdiPWHQhPH
	 RbUrKrJjBI6w39/UrQhvTp/r2SppmFQnOjZt30cKhvgwBd+2f9c/Sa7Myq8YU9rzxlyGF
	 /6sAe0euOhvoQsTA2vqAHt999j9B4sygm/QiU6uzMuEvsN+za0AbALRppLWeoJIabzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD67606A334;
	Thu, 29 Oct 2026 07:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD67606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 15:25:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 15:25:50 +0800
From: Cooper Huang <cooper_huang@aspeedtech.com>
Date: Thu, 29 Oct 2026 15:25:48 +0800
Subject: [PATCH] arm64: dts: aspeed: Enlarge AST2700 EVB kernel partition
 to 12 MiB
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
Message-ID: <20261029-ast2700-evb-kernel-part-v1-1-e6f52742c575@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAPv04moC/x3MQQqDMBBG4avIrDsQI6TGq5Quov2rg5LKJIggu
 buhy2/x3kUJKkg0NBcpDknyixXto6FpCXEGy6earLGuNdZzSNk+jWEcI6/QiI33oJldN3aT9z2
 CA9V6V3zl/J9f71JuW81P7WkAAAA=
X-Change-ID: 20261029-ast2700-evb-kernel-part-63b3c998ea6e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Chin-Ting
 Kuo" <chin-ting_kuo@aspeedtech.com>, Cooper Huang
	<cooper_huang@aspeedtech.com>
X-Mailer: b4 0.14.3

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

The 128 MiB flash layout of the AST2700 EVB reserves 9 MiB for the
kernel FIT image. A FIT image containing an LZMA-compressed kernel,
the DTB and an initramfs is already close to that size, leaving little
room for the kernel to grow.

Grow the kernel partition to 12 MiB and take the 3 MiB from rofs,
which now starts at 0x1020000 and shrinks from 82.875 MiB to
79.875 MiB. rofs still ends at 0x6000000, so the u-boot, u-boot-env
and rwfs partitions are unchanged.

This is the same layout used by the OpenBMC images ASPEED provides
for the EVB [1], so the rofs partition described by the device tree
also matches where those images place the filesystem.

Link: https://github.com/AspeedTech-BMC/openbmc/blob/438e761ed38644b77ba704c984cb607649bf2724/meta-aspeed-sdk/meta-ast2700-sdk/conf/machine/ast2700-default.conf [1]
Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: Cooper Huang <cooper_huang@aspeedtech.com>
---
Notes:
- "Already close to that size": with mainline at c339f4010dea
  (v7.3-17997), ASPEED's aspeed_g7_defconfig [2] and GCC 13.2, a FIT
  image with the LZMA-compressed kernel, ast2700-evb.dtb and the
  OpenBMC phosphor initramfs is about 8.99 MiB, less than 20 KiB
  below 9 MiB (the exact size varies by a few KiB between builds).
- Upstream OpenBMC's AST2700 machines use the static-norootfs layout
  (no rofs) and are unaffected; the rwfs offset does not change.

[2] https://github.com/AspeedTech-BMC/linux/blob/76457d3afe2bd4022ca82dd9eb8fc48b84f0e9ab/arch/arm64/configs/aspeed_g7_defconfig
---
 arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
index b54915f06efd..f54d53077538 100644
--- a/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
+++ b/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
@@ -16,12 +16,12 @@ u-boot-env@400000 {
 	};
 
 	kernel@420000 {
-		reg = <0x420000 0x900000>; // 9MB
+		reg = <0x420000 0xc00000>; // 12MB
 		label = "kernel";
 	};
 
-	rofs@d20000 {
-		reg = <0xd20000 0x52E0000>; // 82.875MB
+	rofs@1020000 {
+		reg = <0x1020000 0x4fe0000>; // 79.875MB
 		label = "rofs";
 	};
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261029-ast2700-evb-kernel-part-63b3c998ea6e

Best regards,
-- 
Cooper Huang <cooper_huang@aspeedtech.com>

