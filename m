Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794185873;
	b=Eo3uFDbGfnREQnxPpzxIqMsuxSqfc0vABtAo/8ZB7Tp5pzz3uGB8yYfxheK3zSKsd8oK
	 i9+2iQEnjMVmK76Mg8N+SLA+l6ONKBhMcnsQfbsYnsYkNbK4Sdpvu7mO1duSpyCzjxyDj
	 oG9UjiyVL1RMkQ9f6lcMyY3ZIYZM6e0zrn5U42XG6bFMvRyKaTWGFUPtPfUPWNTEzklnP
	 ORXB15Q2jLyRoE3FpxPmWrcSrQr3X/Z15TLr5pmHBcqj38+xtiNRdzqrDeV60ucpBor31
	 0vEfnZO2T1zUz4OjaeJITrGkU8gfHSTQ+q2MnxzVgd5cAWvyZLsc6QijY3QWvu8M+mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185873;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=w/CDc/ekChpK1MEr5fDIpNGu1oRamZM5e+eEMVQj/7E=;
	b=f1z4HMtEL9drTHrBYhUoZca5xV1hxaZkPWocBO8xBrywnk+CXe4CB3Aj9JWDOBpDwjoO
	 /E598ixsc3LTYpbz1lbeOHHoDysj14h9PBpyolqUVJRqpVnJbE3FEUAMO197Q7Xc1sZI7
	 v5+mfdyLHwAXTUlM+1FiD/30poNKiLQggJhjekfcVIclzCtKQiK0AWqhTiH6Cq1oKxV4l
	 lrFaIeXLSjw99p4p1Gey7stLDajWsHuRb0tWndzIDEI9wqvvlfMusjBXHt8AQF7ertOwm
	 uLsoy7MFxnGFDDgS7m3nQmyvS8DEuB2RmjDi3Y9+MMn1/u2bn5S3szEnRD/9SyAhqGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8L9S03m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4222606A31C;
	Mon,  9 Nov 2026 00:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8L9S03m
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794185872;
	b=oFtotlonBixhADIUAaRFb/R9eMIbYHB68t5Dp9YdKn8p035HsN5/CVVW1cl1Vi0VnmdO
	 hxr2ZDGnNLu06Jy0tDHCr2okQEt97Wks6bw7SukTgqRuKyGCy+MS6kWLnIuezzXYIFvRx
	 XbLOUX16ehdd1aDSMy0eavAlhe7qZOu/0j4pGoqq+yZpx8297RSPYUaXcTlAC8/wrEszR
	 TKiZnB1nMhOyGQSzMeMyFAg86C/rxHiQcQVfbWneYh9dzvSNOujiH4o0NSVtWoCIc4Oqg
	 RXIjlii04MQBATfn1e2W8KGsnN/zPFkxOQhK9h2THfDb6kc8uHu/Slk55PaXmPLlH6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794185872;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=w/CDc/ekChpK1MEr5fDIpNGu1oRamZM5e+eEMVQj/7E=;
	b=dV1A4t9XuKShgiXAc+9Ewo1uXYNMlPMZMg2W1DH+56FUCKuPuQxTgKLCFQEBOTbC7AKf
	 sAaceBnQMilESeUG7ecZppQIaYIs8R5ZyOW4Q/D5k+Eaxz7ZwBBAJUdUXRL5b43ELVpse
	 6vH/g564dYZj1tAVTC/XTn71ngv9HxdrDltXPwWZ1jWZjaXaSzt9ettwZfjQpSDiV/oa0
	 9QZzrej2hnIFud6TwhJhWuR9bLwD8Zt8zkV/nmRRjHQl8KUcAojheJAXSDgZlz/zwUcf4
	 rxL+zmb7VCGi9JHfaoENTZEWPjDeP6KEIU2/qxk8nDCP+UCQp5aCN3r+ZVfdf19Py6A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3954B1F0089F;
	Mon,  9 Nov 2026 00:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185872;
	bh=w/CDc/ekChpK1MEr5fDIpNGu1oRamZM5e+eEMVQj/7E=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=k8L9S03m3BDqv8PczotWE3y1CXKgKWUtkn2VvTC3249n2qgohy+rBLEDsFkOvVj/7
	 CPc6bkKvRtY3uT/YqDKFtGbDY5FkODbAWC54f53saPt/vj2DU7yBzouDml+Puu5B3Q
	 56zCjPFefmzNgooLepmCgqPxPnRpeqUs20OMlc7AXfoCM/54N3J2iJSx4LLwx/rf1p
	 13uIUQF58KpRSf210pruj6kk41tF6ZU1aM3g6F8Gv78gyu/rdEUluLXGgZ0ZxWz54g
	 a3ovwriD7g0Z1S94keHCjHW2Huj7j6k653L1IG678tGn6CPsdvf0jgRJ5vzxkGRZGf
	 ioCuA20uyFoxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A9A7E4075E;
	Mon,  9 Nov 2026 00:57:51 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 09 Nov 2026 00:57:49 +0000
Subject: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: mark the Ethernet
 PHY as a wakeup source
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
Message-Id: <20261109-hc4-phy-wakeup-v1-1-d98784ecac88@iav.lv>
X-B4-Tracking: v=1; b=H4sIAIwa8WoC/x3MSQqAMAxA0atI1gYaJ6hXERe1RhsELS1OiHe3u
 HyL/x+IHIQjtNkDgQ+Jsq0JlGdgnVlnRhmToVBFQ6Q0OluhdzeeZuHdo7ZU82BMScSQIh94kus
 fdv37flgHcaZgAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=th9XEIxslt9+U3iOsvDowXn3pt6YXgBXd1xZpRrr4n4=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkfpfry3jIbvs9Z9Uatelmny21OjdLSH79fPbD2nPIzI
 mF67HyGjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCRMCOGf7ofCvuMDwa/vHVx
 zlTZbeVOSdWZE/2Nv/j83z819/luTRuG/6VWdbxz7a99TLhh3Ngh/o//ywEJu7TgQx/uaf9m9Wi
 sZgMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The RTL8211F interrupt is wired to GPIOZ_14 and described in the PHY
node, but the node does not declare that it can wake the board. Without
wakeup-source the Realtek driver does not make the PHY wakeup capable,
so phylink leaves Wake-on-LAN to the MAC, and a magic packet does not
wake the board from s2idle.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on ODROID-HC4 with Linux 7.4-rc1 and the U-Boot and .config of
Armbian: s2idle, Wake-on-LAN set with ethtool after the link is up. With
this change a magic packet woke the board 5 of 5 times, in 8 s, with
pm_wakeup_irq pointing at the PHY. Without it, 0 of 2: the RTC alarm
woke the board.

The test DTB had two other changes: the RTC alarm interrupt [1] and PCIe
disabled. With PCIe enabled the board did not resume 2 of 2. In the one
console capture resume starts when the packet is sent, then a hard LOCKUP
and a panic follow while pci_pm_resume_noirq() of the root port runs;
pci-meson has no system PM. So on the HC4 with its stock DT this property
alone does not give working Wake-on-LAN yet.

Not tested on ODROID-C4, which shares this node.

[1] https://lore.kernel.org/r/20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index e6f02d738a21..9a4684dfbde3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -277,6 +277,7 @@ external_phy: ethernet-phy@0 {
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
 		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
+		wakeup-source;
 	};
 };
 

---
base-commit: 81e55899e134541583a4e611ff750e1868671c67
change-id: 20261109-hc4-phy-wakeup-9c15ebaa311e

Best regards,
-- 
Igor Velkov <iav@iav.lv>


