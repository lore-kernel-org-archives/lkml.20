Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792646836;
	b=uXFgbhoTvc8OSP2Insa90i4Lx9pNezK+wZ8Gtd0KbNkDMR3bgiVo0SEn9YsuYb49qMTK
	 5mJgaLHgvonVlV8DhMQWULDJwS+W+XpD6sZi/7wjPqV160vrd2Zbqw/cwUc2goxPEV2eq
	 3nsdqBFlmokAz2siPaSwHM/DfZ9MKaRgnWImL1cd6IyjK/5zUmtI5uJDZdqPzQ9y6Zc1l
	 fMTQ3pgVPMOXVs8I3t1cLk1Gct3kWvA97R40cLo46mxy5yJFAya1fRK5XzcgDzJezpl91
	 BizOgK9x4Aj92zZlD63pPPkn+U/8hHCRhwwGLDeqqejYqNaAI80gHdWNgN8z7+NaUrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646836;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r4tVxof6PG/Au9JKGDTI5f180KhJU5YjoA9yVCsIL0k=;
	b=1fSr7Qhj6Jic8YtdaK+1b2Sw4vovo0ILRIR5eoxkfeeSAetMAEE0kp0CGWtL3AKn1PWg
	 B1ifR1m0CS4LlKoqeDIs/8iFJaA6QNd+PVkFZh2OoQYoMdtI/VCPzJxGIV+mIF/xAigVF
	 z/g5sKj0ouKXqir3oEl6n5y4WXxqg0fBJf45DjioFTHH/BFYSqK+lPs9VkiFMZ6JBtar2
	 jOZkdl2QV6TbctlAfImgAP99ys8Lfj/Jhp1ZDFgDecAAdZyIck/qFgpR4FKRXe7EZJLGd
	 lTo+AXzjqHW/oWq8oMkHUTZayF+dtSHAPgo0y7kjzr1h6Gu82lzmIJWNXhEvncsIOGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fE30Vozm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55FB606A325;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fE30Vozm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646835;
	b=tHgVe8Gfacnh6xYMJy9HbC4mulZL2/LQ060OvbdQXUH/Hx+xlN/CK7RHACWVnhGiZ5OO
	 i3k/raAkaWZ61RSV++KiAy5oowLd93Qn2tX9mFrkx24H2gB8COZx0IG4iAwYN0BLoGAN4
	 M8/EI7H8VAOyWd2BAfxjB5skpUabkRtuunmih2+L+y3iJ2ukVFGlX+aHe7HO27DhI1Nro
	 TIaYZydtsmr8tdOmPjyTynuh/NRXPewGwUCTX5+MnNmnpZ26tP+vReMTXP3cttVAqBVdu
	 /gBsh4PN8Fpxwcjdyla6UHbXfJiqJlbYsWn1WullX4TnLnCR8oLKryWXrAzf/gYCGQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r4tVxof6PG/Au9JKGDTI5f180KhJU5YjoA9yVCsIL0k=;
	b=lFrBdhlqWmeugxw5PwMhcmLeduv/Em105Jze+v5gxJXaqzcqL8AslB2s7bPCk+7NTgFH
	 3hPNhWclyctx7fdoJ24AENMbkUgFvnVrsu5GQVKV3CgttmpyabV0G7tYupZwu+tmcY5G4
	 wMclE8UD4tXexJ3asmjTKzfbplgn6v/IApCnxs2eLI/kbDuqrJdC5DkIxwvYkKouMRIYU
	 XRUvls6jNuxt13n4RhTNA8ewdBFSyrfh8LWdgmg/0kzOW5A5rLn62zeQ8XgfgJipBAPwx
	 KFAiGZ8KC1j9zMHxoePVULHx7//1aAfKmJ/akFDyxdc4tBBXF8I7Vfs/r5yfVS7SJCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B5E81F000C6;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646835;
	bh=r4tVxof6PG/Au9JKGDTI5f180KhJU5YjoA9yVCsIL0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fE30Vozm4R9LagRYglKu6F2w+DDOh4WEY+/746Ow2KmxnYIK+4qlNmP+RhPrxa72Y
	 GpiEDQvyeNsNDarVI6EGNMJX0y4XqyGFBafzLPgfXmKTcYGpF8Mjqgy5n/WX0/8y8c
	 h95r07mzHrn/S3itrd2y1cMClsEt7hsJDihBlhs4tIEB9KwN5sJQHQ/deF7qEyZWoL
	 lsyvym79YNNGwxOa59qHTFHkGM3gN0g9AkUcdW68pSsnGG/4lKsSrfGXl8t1LAkhZd
	 QL1Og2Xd7mjeFMfUs0EBQ+UenUby1wW+HvjTtD6fyjXngYbPlrGgyr0d9ojW8tGhkl
	 mGKGIj/15txPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 60FD4434F1;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:27:03 +0800
Subject: [PATCH v12 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
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
Message-Id: <20261022-b4-s4-vdec-upstream-v12-5-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=1805;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=6mvln4gF/Xr6GIzNj9H9+pGxV5CsOeJcJGZ1vZicQxY=;
 b=pbloZj7Iqhpy4+9EKHoTYPp+0CaOtmY/BW43JXVUSzB36aOXC7pKJM4XNyYKPadBC35jMltcG
 oUYQua/KnZnCHUynY5vwMacNyWptUEvUmL7sTlNnWLTBixacoeSQvmB
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
Content-Transfer-Encoding: 7bit

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vdec node to enable Amlogic V4L2 stateless video decoder
support. Since the video fw needs to be loaded via TEE helpers,
enable the optee node in this patch.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..7a1dcb3951c8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -80,6 +80,11 @@ pwrc: power-controller {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	saradc: adc@fe026000 {
@@ -907,5 +912,33 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vdec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "dos",
+				      "vdec",
+				      "hvdec";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hvdec";
+			resets = <&reset RESET_DOS>;
+			amlogic,canvas = <&canvas>;
+			amlogic,secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0


