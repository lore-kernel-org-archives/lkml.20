Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E450EC06
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783345; cv=none; b=WIyCLqWMnbOVfqX7LBccoEotnjhzSZvaSD4XCbBd22qTR83AVFTals58TTYJhO72xF+1GnffiUUcHdB6U0SjyaFrW1J8MbIuz2sndJ+KQsHMCvCk/DX6bY4mYTI2SiK2NXrDtm2y+rdRIDMvcaP8CAP8s69WE3TYdqQxplqXanU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783345; c=relaxed/simple;
	bh=QCdSHI2SuhoD7qC/wY8SB6ThI20K2KtGW46geTtY5QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aQyG+91ohKL9fSXQX7lEz3H1TpErT2c1UhjI4hgInrzoJnI35Ku1ziPkQH22up4BjL+qCFW2gEp1umMC3SfP51G4MDX49Gvv+o4tqb4sZvo+9KXbgZd0C76Loz2V4BoUxiYCQVxbAIbx3nFcHd247IP2h4Bwe7ZbWsoVsP4yXBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=XJVvgZvl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="XJVvgZvl"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so2912120a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783337; x=1791388137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=;
        b=XJVvgZvl9f8mAfQB9YkfbaDE+PFAFnw0kLqZ1g+Z8x83ZxXmXCvF2Xkg7fGt70Jj6l
         1zx2Fl/piWCRuZf9I+Pc6WQ7rqtnu0H48U2K42UVc8AB/FZIdq9i3zROmXpX5UutPjns
         wG9ctOWDi8gJcSZZeoiKhVkp1qAtkgC4jG47Va5cyMAHBiWSFDWUHroe6X21I2dVAqOQ
         pZ2bloKVO/IiMR/n5Gl9GE3yZPsli2eeNpc87wGj1fG4g5MjtKpVEp06TeVEYQgD2l0T
         3BMw1GrS44NmqvB+pc6jtdH3ACxSaHFRX7vfb+WwVrxKKFvPe/k6tniGV/uydUOnGCU3
         YCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783337; x=1791388137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=;
        b=bvTJkbhy5W7rHnL/Delly5TqVuKx5T5r1zWQDu/t4ZQRL8UvejGyVU+/yxiXkcu0Lb
         C5yC2tumwwzCutJmtok1zMDZ6dbesFfsLpPWogEXT4pSUBtK4IwvxIpdVP8YIiSEQFiT
         /kkMzQrx9qpDAd4wuMGB3ZUQBSunDPCh6WVjmQcNsF6ZUtR9fmeP0ic8oNjMDFnNtBFD
         T4a4/JpY0xcWbqGZ7Rgr0Lpkb66Om+jODbLBQ9GezuKk0AeiajmYJbIL5RRnOrw4jLhX
         ojHx1VnAI43XVn2URKDY98DQtslfoxTWx5YnpLz1Ar6ckMLMGKs9lDZWAbTnK4kTGxYX
         zj3A==
X-Forwarded-Encrypted: i=1; AKwUvBxdOZ3p7wruNDiR0TJkjk7D77OXlisjEAonjT26+TavK0b9HIn6SJGP7JwFf1qQP0uyWDAuJ2zO1hVILIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl7BZ7ByIBzz3KBFh/nLR6LYQhfhHMEubrRoRIcRDC49EIBIz4
	7Pdcrt9rYVMpdmfmL3Lxyzm3CWKORtUoNMKNVxkV5yFuG3GqGez6LHEeEqWNTBUar0nv
X-Gm-Gg: AYBFou01Wk+4xnNeAvMQWqoF6XykAqItsf7a3GwZ8T0KbIeqXwvDn4R0vTDJGxXlAlQ
	mtm3RHXMzlXF7UkXrGM17i1Xz2yA5u8M6L4AEo6OUDBaKCW3d0ssiQVfgY6ZYdAldVRUOMZ9Z+B
	uTQOlJWTgpXCVdWALeK5BymKizFhUNA58hsIFKSem2VzU2T6OXDrQU8pmdWgwJ4jzxbpfE1HXr3
	PBfBw4I3wwjBln3wwbEeq5fRX3m+STmp07CzfiD9In/isdhGDxEX2Z8ZzJjpG9eMkUXoQdMAtRH
	rkG8Po7yAPbi98M/X0pjkjEbPyPj3nd3eAtP3IGwB8N8nbLxoLWEnAtx5T36Gp2GmIyZPEU2LDg
	oDENvc1YYvpctCVWtTEhkYqspgRxBWghEtedDXH1pB09DzXmPt7Ef0Fq2RPSHrPIg+J1nYJWoXP
	ZNOJSRGZHYbPd2HJPIfX09N/L7GVWgfCHHIyHmT2U4uASVK4xPRtz9VdB6Egj0zKGGdgnNzY/k4
	0hVd0wG
X-Received: by 2002:a17:90b:35c3:b0:3a0:ca03:3e1f with SMTP id 98e67ed59e1d1-3a4d154522bmr1584586a91.32.1790783337518;
        Wed, 30 Sep 2026 08:48:57 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:57 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: allwinner: d1s-t113: Add the CSIC node
Date: Wed, 30 Sep 2026 22:48:35 +0700
Message-Id: <20260930154835.402684-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the CSIC node to the dtsi shared by the D1, D1s and T113, with the
pin groups of its parallel input. MCLK has its own group, for the sensor
node.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 13b1e57166..dd4c873457 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -70,6 +70,20 @@ clk_pg11_pin: clk-pg11-pin {
 				function = "clk";
 			};
 
+			/omit-if-no-ref/
+			csi0_8bit_pins: csi0-8bit-pins {
+				pins = "PE0", "PE1", "PE2", "PE4", "PE5",
+				       "PE6", "PE7", "PE8", "PE9", "PE10",
+				       "PE11";
+				function = "ncsi0";
+			};
+
+			/omit-if-no-ref/
+			csi0_mclk_pin: csi0-mclk-pin {
+				pins = "PE3";
+				function = "ncsi0";
+			};
+
 			/omit-if-no-ref/
 			dsi_4lane_pins: dsi-4lane-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
@@ -997,6 +1011,23 @@ tcon_tv0_out_tcon_top_hdmi: endpoint {
 			};
 		};
 
+		csi: csi@5800000 {
+			compatible = "allwinner,sun20i-d1-csi";
+			reg = <0x5800000 0x400000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(95) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(96) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(100) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(106) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_TOP>,
+				 <&ccu CLK_MBUS_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&csi0_8bit_pins>;
+			status = "disabled";
+		};
+
 		ppu: power-controller@7001000 {
 			compatible = "allwinner,sun20i-d1-ppu";
 			reg = <0x7001000 0x1000>;
-- 
2.34.1

