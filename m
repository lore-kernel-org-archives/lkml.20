Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F34845D1BF;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=TWW0cB4HEA6BDsKCoTFOR//Z6UlCXZjnGju/Ujde1a1Woua3WSHC8aeuOj93sz2MKKfc4FC72g/3OUa2dCo+fz9U4R/oGorsvuxttK1GPs3rmPdbQ1FNd7y7IaFZOPjb6WrUu6FeD+GC8tMl8bZCespQ745o0c/G396o/E3JGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=7yUvmIDMbzfZAF93qAmLa8Oi5bfk4s5SvGz6m0eGErI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWuAxrC1oFP+A5K8jBxV808/5BpOrjm/Y6eXHAiIZOqDno7j+AqQNbD+cxFmXUXTCQdGAfk3goLPI/rrStA8LG1u93EapnX31XT6+fbYd3wVcqebEiRjQllDxH9WM2cngryVDHT/VGaZAASGzBLhye/ycJokDMCdbjqw4ZfYN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dM7yy024; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dM7yy024"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1255CC32781;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=7yUvmIDMbzfZAF93qAmLa8Oi5bfk4s5SvGz6m0eGErI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dM7yy024jFrTnifHeVza8hKFK9rkBeMTdFiL6/PCB/QhLjjfb2aMRVT/ZYAAsWHyg
	 PoSG2Bj4dILWrUO+18/tS8M2X3XdzoBe3kKqahXNU7ilP1RoWy6Z7c/M38kkReIEnP
	 8wzk1pXpOx+/m2cuuUxcoAYMLeWupYy+Si9j18UzruuPuFfzZlos1AQgbMCZsTkZB9
	 11ivorcEI1kM6xP7a1IeMHNrJAzGHUeq+P3gc62X1Vz1pM+Vo7oXo08Fh6lTPtgEQr
	 nLLNCdcslTzpjMEQ5Yrhabs5dgaclIUTT+PVXg82w9WyJBYSsIG+3rpzjUwuqHyH3p
	 rHqzUTlSmi+7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4185C88E54;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:32 +0800
Subject: [PATCH 05/10] arm64: dts: amlogic: a5: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-5-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=735;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=m5R5k55AN/MNKbp84EDgUAXLk3E5z1TMK4ptSdMbBlo=;
 b=0fMq4ekz7cyIsYeXCLx8O+Z7BW28Z+B98QJBNy2y/oT6QK3XNsW5Y2vxm8ql2K+WrW8fICR+K
 wBwNuWwoLhnBAVuDggT1iruQgPBslaGFdHkAsNSj7eirfby9dHsETxy
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 2b12d8284594..0be176ace337 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -157,4 +157,9 @@ gpio_intc: interrupt-controller@4080 {
 		amlogic,channel-interrupts =
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
+
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,a5-clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+	};
 };

-- 
2.42.0


