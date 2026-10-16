Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25DC3C09FA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141042; cv=none; b=WtsMucB5EE3HAg7C8yCg+RBRSp6Vt7gzpUcZCxj56BTh/k2SyKYk5WeLKN6v3qBo5dy+VFkawZEdnj62DZ5bUrJMMVXJZqgfgmY83/tEbnj015s8iOVo0lbucb3VzGXUQEDTQPpkGQZrEN5O3qm1nptEUHcpfGFOlNgsqkD8soE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141042; c=relaxed/simple;
	bh=45Vrf2/gUP59T6NzCoulPq5BhPIFCtcRAs06OTbCzKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqXQI9rTBGcFqCXRprkvzuz9CB3GZfwy7P5JYwq/zemlHcjKg+E2Yk1m0+6r9gY6P3TfOqILfum40ngHvEJPkI+WuJq7ha8/HA2A+VrbmSk+kSfytReHmyM/hxEu4wtYZUbQorqinjBnUhcC9Pt1wWlypuWEBq+K5HE5RSLNe9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXvq8ry3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXvq8ry3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc785ed8aacso343485a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141041; x=1792745841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VuOlYqld5kQKP6/uNDvi8w+JMtWorT85t5I6G7jNhHs=;
        b=AXvq8ry32IOv9VrXyqZy6y/xR21asuKwPHGlO/Rs5LPGBNscHU720SuzBPtWh0X4HH
         qIWM02QxO9Bv/cK2duGvk8kCTB8q/lrFObWmsZBd9l/Qa8wp1RSsCykSRl77INIe9pq7
         KxjX1gyn0YpzYsXmb7+qOisa20t9pyklz72NoKIiPQ+ocPYb/49yimpqf3lg+vurtmFm
         jmLTeCUJBFNYxliB953LQglHmze0PqJwhdXIBCXEA+QHeekh7KfBuQf9z9LJWj4yu4yP
         QhIfBkq61LdN61a1S0H0X69rE4HS8AVrt4/dZKUJvTd8l0LI1V9beTJm1kv4YA4aLA/U
         xxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141041; x=1792745841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuOlYqld5kQKP6/uNDvi8w+JMtWorT85t5I6G7jNhHs=;
        b=ZW0A76crhzaIHtP1NlCKWB6gLryZQhLO0FYO1NhxiWWWfFDQTYqfSjKOT6Vclp2Hiq
         fBblnKVL9+zk26G0Cty20Pd21sL6cy+JU5yORF29TGgSLSsdDqn5QnS4F/x1vgZBDlq7
         blNu5kibhy1WrJS1isnxDrJuHdlNyiYTo1JguO5TdeW4b3bHrcIz/mEbcz9yIe4m8O46
         X6ESHR+8KVK3itMBFSlLlOEumKyerPeR3ORUZNJ53D8cPSu1rNIObmrF/To/vzoxvneJ
         k++p6QytSsuA7GSRrlbkA8LL5VrSKH8PxaM/cmKjMrpHtusQXaXDXPXFXnXGkWs0iTM3
         L6wA==
X-Forwarded-Encrypted: i=1; AKwUvBxqsUB9QDnwCsOg/fVata42McPHhiOadunZqknfbsDnYp2ehi/ObLkA1i8LKmRidBYSl9cn2P8lACc6Rak=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQju+jCLTMnZl8eVNiqIbZGNy9WShp5ZT9s3/GcBlBzcNwhkOW
	trXDHhcpJ+KVC4Bx3NCO4Q2mciy1xm2VjqgJwtGJppo+YbPZLNw949Zk
X-Gm-Gg: AYBFou3VFoLuZyy5PUk8S7ngR0esMh8jbOvjhboFPjLWc1ZRj69G8Q8Jbv7In4dv/v8
	utw/MADrENacb6jxtdAMR9moewY18IaIBaABHjJuYYHcxgddYArtHfF42TO/scvW1cYDZ9g0qWg
	UqlHLPHpWyikZyIEctNy1U4A8LS+EOQ4U2qL9eE0bQ/xOGXwZC0MBS6cV+O+wILr6BLyCIfU2om
	IT3V+SshMiuIN3ni9qu9b3NbCCTQvcV/e+ygZoQnVemwS4KbLHw20AxBt9a5ZMw5fT7ZaaeofYc
	aLrMC0Wkc1NJwvMnQp4WdIg1KWaM0smvTkE9Xr5AoWbGQ5ITEEALoPAA1lmr0vi+VgMA228g7OP
	VMkBaGzetwKQSg1gABXRUPdck9pIa2YZzTuNpLExGC/Nj028Ll2W1RFdHmTZAli6dlJQH7S+Y6x
	JIbQJILuNWl4o9gMxqLXx7zqKuCi53eGWHFTswUOP715y17jUtmu88GuE9tIEm7kO4k0lpviMJg
	43PfMA+ksNpKI6GST1QwLcAPyHRnQ==
X-Received: by 2002:a17:903:2b0b:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2e965bd66e8mr71321655ad.0.1792141040552;
        Fri, 16 Oct 2026 01:57:20 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:20 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:42 +0800
Subject: [PATCH v5 8/8] arm64: dts: rockchip: add mipi csi-2 receiver nodes
 for the dcphys on rk3588
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-8-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=2717;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=45Vrf2/gUP59T6NzCoulPq5BhPIFCtcRAs06OTbCzKM=;
 b=eV5j0Ku70J/SwIYITZNqaBAM4+oArZCW1gHMYmzwcCjICMvYtJVzPGrN4pNjb2YAnqgdR1JmW
 QRDZGk+6fb0AGvQEIOdD40NiINRZQcSPgvqp/0vE9+XFZSQzix1cCh3
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The MIPI0 and MIPI1 receiver units are connected to MIPI DCPHY0 and
MIPI DCPHY1, whose receiver side is now supported. Add the two nodes and
wire them to the VICAP ports.

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 94d68fd89753..30bc69a09102 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
 
 			vicap_mipi0: port@1 {
 				reg = <0x1>;
+
+				vicap_mipi0_input: endpoint {
+					remote-endpoint = <&csi0_output>;
+				};
 			};
 
 			vicap_mipi1: port@2 {
 				reg = <0x2>;
+
+				vicap_mipi1_input: endpoint {
+					remote-endpoint = <&csi1_output>;
+				};
 			};
 
 			vicap_mipi2: port@3 {
@@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
 		status = "disabled";
 	};
 
+	csi0: csi@fdd10000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_0>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi0_in: port@0 {
+				reg = <0>;
+			};
+
+			csi0_out: port@1 {
+				reg = <1>;
+
+				csi0_output: endpoint {
+					remote-endpoint = <&vicap_mipi0_input>;
+				};
+			};
+		};
+	};
+
+	csi1: csi@fdd20000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_1>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi1_in: port@0 {
+				reg = <0>;
+			};
+
+			csi1_out: port@1 {
+				reg = <1>;
+
+				csi1_output: endpoint {
+					remote-endpoint = <&vicap_mipi1_input>;
+				};
+			};
+		};
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;

-- 
2.43.0

