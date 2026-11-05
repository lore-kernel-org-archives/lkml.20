Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918075;
	b=X14og3JFYtGZ3f/zufSzjyPUSYtA8H00EBIh9Yux+FOOAGYgR6cPQOZV0OH8/kSdTC4M
	 tK8YKaQdNOour573q3BJ7syWuG8EqbjcJ3E6bZjq9rbap2ClZN1wgPtp2xzN0mNbHCwpY
	 nqbEnM/1ohhNanpyTm4PSISmnr9uw/4511aDLPtKEjoYAhQ3pmo/7XDZcS8B2X5aXHiDA
	 JeQxDIFGdFR0sPGXQgktU/O60ebOaIBu7+K3QnSHyimll2Ogjfcgaevlw6QnjaRUjdnZ8
	 U+CIbZAYgeo+b27yFWFUp5rRi2aAUeibWUGDAf82g7RUgpm/aDr0wAlurceIFx7YLTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918075;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=oXC0xO4zLhmVGs6KoURlIdb6x3QgmfrvscYjlJ8lq1E=;
	b=w23PDAkUUdYr7NZRgu5dOxCgkLYxUpRFzWaODHbbpGj4UAJUsHR2M5A/tRz3MZEW9zos
	 2/b6xN4mUj2jJNDb+KOZh+Uyqx/029YECiv4LYale0Jr8vDJbhysXMzzObNK4sOOrkc6e
	 oK8ZgRhcaGxTbmZxcJwj0SLn5uPVkX3rm/gkKqbAaL0M1h1OsgTHciN59b4JTYsvaHuNw
	 l/Tk0JBlqBJPCdE2ANAzBVKvUpqWSl7J/Wg3tstMcUMNiUSiW6aPlVe+YbxeHMTS/IJGT
	 z/vDOEZVdiNVbFYqHIA1q69b0BxN8pB5OmBOZm98l4MWay4Q19aP0JWuA2SGoGjTRdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KX1psBg3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD77606A33B;
	Thu,  5 Nov 2026 22:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KX1psBg3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262191F0089F;
	Thu,  5 Nov 2026 22:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918074;
	bh=oXC0xO4zLhmVGs6KoURlIdb6x3QgmfrvscYjlJ8lq1E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KX1psBg3zJQ7zeMKw49FUfKb6aUTjYarvYcFw7vMZUjCWNa5IF5JdfsownZSOlJkd
	 M160PX/O0rcLqu27r4aWz4t6mCPT2i/dhGu59dhG5DY25e0COGXkm8AFQSiS3knE+c
	 KUO7Sb3lcMg3YVPW0Hv6C8ZxRlUjOjlpUn5/vJjuHJWoGnEb30nfkTm/vj75XzVvYI
	 FH94nRl58QuA7n0UhwJrdWmkjIn7/Z6t/qruWc39+BpQyZNQWkzjOI6CTJF8I1WRXG
	 Fg9EMBi/fCrGu58LfXaN+o05NHTAh9KmeQfRcpNyOsS1EUM/YQ6XL5oS0/0hpjMIts
	 IrfLrVOWryFQg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:18 -0600
Subject: [PATCH 5/7] ARM: dts: arm: Add missing "#dma-cells"
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
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-5-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

"#dma-cells" is a required property for DMA controllers. Add it where
missing.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/versatile-ab.dts          | 1 +
 arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts | 1 +
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/arm/versatile-ab.dts b/arch/arm/boot/dts/arm/versatile-ab.dts
index 907c3dd2849d..f1c927e8a8fc 100644
--- a/arch/arm/boot/dts/arm/versatile-ab.dts
+++ b/arch/arm/boot/dts/arm/versatile-ab.dts
@@ -234,6 +234,7 @@ dma-controller@10130000 {
 			interrupts = <17>;
 			clocks = <&pclk>;
 			clock-names = "apb_pclk";
+			#dma-cells = <2>;
 		};
 
 		uart0: serial@101f1000 {
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
index 72a65a83c7c3..dd68250fa999 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
@@ -122,6 +122,7 @@ dma-controller@7ffb0000 {
 			     <0 91 4>;
 		clocks = <&sys_pll>;
 		clock-names = "apb_pclk";
+		#dma-cells = <1>;
 	};
 
 	timer {
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
index 7b74ba30b8a3..8f210671b287 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
@@ -207,6 +207,7 @@ dma-controller@7ff00000 {
 			     <0 91 4>;
 		clocks = <&oscclk6a>;
 		clock-names = "apb_pclk";
+		#dma-cells = <1>;
 	};
 
 	scc@7fff0000 {

-- 
2.53.0

