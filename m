Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227543;
	b=KT12Ai6yFaht2KK/TXQzNk1x+vOvzfPrwjUvUtlsRMOc5RTOBz7PTDFlzIeef6tQklQ4
	 69CCNoNNCHjskdHbYeDq+WyqGZ7MuEAxLdPgI1mUnEAHU4KhOtVUghPQ6GIo/CHh1PEGQ
	 jwRM9xPLB8oWMxiL/AwH0u2td42fovQfKB63bJt5BqvJ98sxN9QetjNRPYz18qbnLSkT6
	 kM+C2R74mk4nv8l57c0djF7iaWvHbpFFjCMb15qADmcvMQ0AQL4Lv0clIU2NlmGkMvPC0
	 H+N+3Vi2tXxc7jPF9xl+lN+4LjWpPwOKRbhZqJKlij4I/U2sIqT8UAJRQRdKUtLpeRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227543;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mTD9xwsI4QuKalePJYcU2wXXCm1Q2n9SxcuwakbGU80=;
	b=b3zZPJo1go9XH200K8gWVXergAznTwz45vOIrkT1NjjX4XckbUOdC9CRSnlBwgejK5SH
	 OHUF8x4hoWdg2oK+gQceXs1RG7BSsttc4R2004uyRc3jIIlRNzDm8XcprZ8YtCE4TVNsE
	 Qq93Smklc9kygj4CwLdy9qu1x0MSEENqrGd3EV7rHZtwybM88NzNGOoQIivKiXo6GxFwU
	 ppgv0kR1oy0d38bL9EdnBA5fhzP68jjAHNwJls/I1b+lrYkABnmjCgkxx/J595FjCNmvf
	 S3LOtIontx5Ar4xbQ4gc00y/N44M554IBOribvN4d2330yjSg37dekS1RhEYlrlSnHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hwrWidVR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A2A606D80F;
	Mon,  9 Nov 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hwrWidVR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227542;
	b=eI0aQCureB5V+CEwlY3r8trgq1gp/umXsg51o8Dj19lqVLE3U9C+SrouMuBqapAV3r1N
	 E3VKMuqV0oDYBrqBSDLdwlAP7TU6+QgBcUlpRdJYLeKNtPhGeXOsPBVJbr6ohWg8ZMDhr
	 hMB+eMicFpvHiB3RpxJOzWeKXC3v8LrqQlRNYXa0HqUgXn3QpIu2YPH7OjdbEygmA4JCJ
	 koUMFTid1P9LnTyfcGtRE2RY4zqBOWxUxOn3Kn84qEb4e9G9qY1n15fOgfeFmnxpPHUWh
	 f/E8bdypIf7aqHC9NVEhEKVxSeR+tebwPnSf1a8J25DhvtbHIwrdCMUPCSr02yUk0OQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mTD9xwsI4QuKalePJYcU2wXXCm1Q2n9SxcuwakbGU80=;
	b=qmDE4W37EkIEhu+jmBgHJnBl8KGi1rtY1Z0ThjMSSnEAFcAUAVG6QPSvRy1HIUZInfuu
	 dRdPV0swcOF0ZxdBHrcLlbcwA1YLEtnwdaEFjr49GVCYX1xV6LRBW13rPw72w5GkdhAQI
	 Y0ftbBpp1Y2sz/EGtcMwdJxtydOdW3pLXiS4w/X0RazKttGqsKTY4ro5nM/pSoAuBVq6i
	 0UrMuQwptSSmgFvjM5UZsT3Asm6YeSWWiAN+/PpvUzTc0V7n7wFk8hl4aNLZP88Mlawf5
	 zF5nKY2XuhVzOhnsbs62NSjIjuzSuoXI2hQxHPFrVR3FjhJkwVDi4h9bhQdX3uY3iGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A51E01F008A3;
	Mon,  9 Nov 2026 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227542;
	bh=mTD9xwsI4QuKalePJYcU2wXXCm1Q2n9SxcuwakbGU80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hwrWidVRF2CXse4C4L8PJ/1sjDY73hr5p56N91QIy93iY2Uaf5KjsHgSr+hPoIg+N
	 vE8vqadpKdpDJMBT5OtI7ojErZE/KvllNwUPX1a4aDykR6yAZeawFuytUmdel7uXUE
	 LNSvDRUEBP6TaP9yUj8WTD1m44+hII74v0b/gkLLSd/nMhdsydOATqBSeGhvfwI6kn
	 8kMSsjpZO11b64kOoxD5ofF/tMaD17Dy1wzE1mqgYJGuemzaJyz2n07mK9pMzthzEW
	 eJY6JA2FkvgsRPSdcTZ5wUu8q65epMC6NrRlE8HNW4eDRmWuGAI+BbLlIO9xRupuJX
	 uU6SxtAFvewbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 610674849A;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:20 +0100
Subject: [PATCH v6 5/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPi R6C
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
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-5-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=6l7amNejMT6z9WZmcw/pfLmctMDWO9DfRwNlH72+y/A=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1SK64PYsE49HfauhMNNZc/Rxcke7TNSjqMa
 TII3ZbM58uJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UgAKCRA7Xj/jnsft
 6cCKCACRRwgub/X++u8B6gmcSwy4+GoKdlmB7GLraOLHglCdCq5Pi3zLu0aGpkvold4AvL5Lb61
 7woCiP/8J1TBEOAVMiSD3bACaak4/TUy2S4rAEOVoacE2/Q/q2FJIiakZ8HALnO7gI/x1sJKSiZ
 XrDOsP/AECbPAGxp3uKQzJFRfnBmV+elopaBK085c0ttELmcttRUD1FAwBYl6MGRux/LFfhyq06
 oR1r7vZezWNEuluIRtSbi8S8+ZBwQc7NvBFxAStDplw0BNMWrR4VozASrdwFAXPZUHpede5v3wd
 OvsGfIyQLWiGwvT5bWehpl4NCMo0919cfvWpVblmUy5liRQQ
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

The FriendlyElec NanoPi R6C carries one on-board Realtek RTL8125 NIC
(the LAN port) behind pcie2x1l1.

Describe the PCI function node and attach an ethernet1 alias, so that
U-Boot's fdt_fixup_ethernet() can fill in its MAC address from its
eth1addr environment.

ethernet0 stays mapped to the on-SoC gmac1 (the WAN port). The node
goes in this .dts rather than the shared rk3588s-nanopi-r6.dtsi, since
on the R6C the dtsi's second RTL8125-capable lane is empty compared to
the R6S.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
index ccc5e4627517..48d87f7923db 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
@@ -7,8 +7,28 @@
 / {
 	model = "FriendlyElec NanoPi R6C";
 	compatible = "friendlyarm,nanopi-r6c", "rockchip,rk3588s";
+
+	aliases {
+		ethernet1 = &rtl_eth1;
+	};
 };
 
 &lan2_led {
 	label = "user_led";
 };
+
+&pcie2x1l1 {
+	pcie@0,0 {
+		reg = <0x300000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x31 0x3f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x310000 0 0 0 0>;
+		};
+	};
+};

-- 
2.47.3


