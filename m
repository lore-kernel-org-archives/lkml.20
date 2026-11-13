Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794604862;
	b=Y4QoPKIm7lB8h6Ck7Oceevm3AeRQt3UmGuTIoLEwQ15kQTcdRX1g+UHNg9r/ZhVm0F6i
	 cgQHrf/wrCPGdsiPRqqEy9T1+lTy3PosHwvRyXSJf6GroPBxYRxELmw1urhVOH9VMJaax
	 NVYIU3nekHdDqm9PrDMVCdqxecaauE7N8N6Ghk6Iads/u8Sk+WACA3C51pFw5ew1LPwD9
	 iiRkj5YXOoOqBUn1oGpjbfME3z2mufuk+gH56XPdGo7IY4BHIH++XyGZHxS5D5miz16TR
	 EJyW/GALF909MlFpQlu654dtg6bwHxhiqTboq0Eq6JGNFos6xphqi+kLBHoXsORnjPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604862;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vDq/y+dEbPOBsyucbglp5/n07svA8cTPyznmOYv5igA=;
	b=bvl7JZTUn0LT6X/VHWAIKtvTyXUVKsPYd0ZcoH6baW4HS0Wp3X/hExy+KmAWPxnl5jpI
	 Vd+yR8/nkibky1tuZv3OZGPesuFien8G5qZEmLPMOus7Pamn0bcUKEDl15YZlBIL1J2iG
	 YniO1zEleQXVXPxNRtdpa5ao4FqeWVt5b980+RHdc5u15PdSvkupOa9RrTcBZCCJkS43I
	 HkN1NSn1jqqumUc2sLlhDoaebuPEr8W5cbX7iyQwo1qobsr/ch2cNETWVrQb/TD8JKmor
	 gcuP8KoauShkwrxp1jMxP26nItRF4FNw4aMCUhDESDEhTQ3cGvAVaIfk9Opb5ppy86A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jc202QXK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390E7606A33F;
	Fri, 13 Nov 2026 21:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jc202QXK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794604861;
	b=aQbFRRDnyjhCQXZCXxXZXk/gXLmhnBpz3Au/yVasg83Sc1hRXieJXZxvAdAz+c9XhoQz
	 Hi8cScsMk3CtaYiY7eLijfPQ5PZcmoqcVB0keRoyELnYxRcj8bfG8V2MsLV2hCvQSzfBk
	 Njp1XI64amzwasLuL0EJUxq9hh+OEHBDM5zc3CzSlBcwBadhOxqFU4uUZP0gyrQ+yqo0t
	 51OoG6KjG6CIWzWoK1xopu+Mv3Q0fueS2hiXYStob/DO03k5eWyjH0SywRRmV2AmBkgYr
	 KxOOMt2+zFTVl1pU/uPjzlpMF6tVOeWO21AXQW70094tahCfY+79oQ492i/zS4zs8OA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794604861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=vDq/y+dEbPOBsyucbglp5/n07svA8cTPyznmOYv5igA=;
	b=qgLEn6Et71dPkBoLTUBr+Yx2O3fw7rZqTLFUkJWtPJZlr2YJREIp3dNXHQLrHQB907Gi
	 vKs/gV1kgr3W9jOueD0ncwskCsVV/oAmosD3PMrlNy9fUosEdT/oZLVn9a1f12XfvSZJc
	 /JrnTG0OOa55GCkcA6WsgcisMkEDTleheYNJHba1J7GRQHlrbqnE+0kfHptC7uPLLYfCo
	 O2Fr85iMXiLqgX1xn2aU7ta92RTQlQCpXMCPiAf+pixiAff2Hcb2byMJ36hyEngslVFxr
	 XwGPSdJtdZYBhEzqZ0lT+SAtYo7N3rM1j63Vfi27D/SR68LXtCI8/SMjfAAp8QOODNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F3991F000C4;
	Fri, 13 Nov 2026 21:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794604861;
	bh=vDq/y+dEbPOBsyucbglp5/n07svA8cTPyznmOYv5igA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jc202QXKZJcAB2NMLsXt8vh1hCR5LrnkP39rteHjTdqjcgbI1MYTUzZRGcFOyFWnp
	 yCR/LOS7I95M6MB6H88aJUABF7nEiutdfE649p2PanpBPmE9N+zifKC63Iq5Lkc7+4
	 wai1RJpaFeO/HtrGksGp4ygLHCCLA+oXNWmyn2/5z1xIOF21Mfwhd/4qVlZ1B6yXSC
	 aTttkX4+8Wo9Byt5QmJqm0xNHruFvwv4EiqeorABCLPASM/KrBQyN+faTYqQdwEeGK
	 Nhw1vPwDyCX7yPlkgXbN1ormOqBuB/a9D3QnPHeiQq6wdHOOp0t65EZbSvsE8lVqo3
	 0pqHP9RFkW5rA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C52E549990;
	Fri, 13 Nov 2026 21:21:00 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 13 Nov 2026 21:20:52 +0000
Subject: [PATCH v2] arm64: dts: rockchip: Enable SDR104 on the ODROID-M1 SD
 card
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
Message-Id: <20261113-odroid-m1-sdr104-v2-1-1a1611fc4cbf@iav.lv>
X-B4-Tracking: v=1; b=H4sIADN/92oC/32NQQrCMBBFr1Jm7Uim2qCuvId0ETMTO6CNJBKUk
 rsbewCX78F/f4EsSSXDqVsgSdGscW7Qbzrwk5tvgsqNoTe9JSKDkVNUxgdh5kRmj8GK2TnjB+e
 P0GbPJEHfa/IyNp40v2L6rA+FfvZPrBASHoS95cHTNdizurK9FxhrrV/+6JtbrQAAAA==
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=bk0BmaYleLaidbW/Gg6PAAPuKLMUdjp+ycVXNHy1qDY=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnf661D3W8Knv7y4OkXxgllDB5KF5w5Nfe8Ut/syHut+
 tCmqSf+dpSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJXN3OyPBk1Q+t2JRfh3+l
 Z8RObd12tfDEFo59BT9Z/rJc9796zXU+w2/Wxy2bNu3jbbPr8WuYL7hqifq3Y3ZOscFLth86IjQ
 n2Z0PAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The SD card already switches to 1.8 V, but only SDR50 is described, and
clk_sdmmc0 on RK3568 is a mux without a divider: dw_mmc-rockchip asks
it for twice the card clock, 200 MHz for SDR50, the mux rounds down to
the 100 MHz parent and the card runs at 50 MHz.

Describe SDR104 as well. With the 150 MHz max-frequency from
rk356x-base.dtsi the clock comes from the 300 MHz parent and the card
runs at 150 MHz. Hardkernel's vendor kernel already uses sd-uhs-sdr104
on this board. With a SanDisk 128 GB card, direct read goes from
22 MB/s to 58-64 MB/s and direct write from 20 MB/s to 47-50 MB/s.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested with an Armbian 7.3.3 kernel (rockchip64), the property added to
the DTB with fdtput: reboot, sysrq-b, watchdog reset, poweroff, s2idle,
deep, hibernate, hybrid-sleep and suspend-then-hibernate; the card
re-tuned and came back in SDR104 at 150 MHz in all 29 runs.
---
Changes in v2:
- keep sd-uhs-sdr50 next to sd-uhs-sdr104 (Heiko)
- rebased on for-next
- Link to v1: https://lore.kernel.org/r/20261110-odroid-m1-sdr104-v1-1-8edc6d5c1bf6@iav.lv
---
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index ec43dee18094..27793d3970d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -611,6 +611,7 @@ &sdmmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
 	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vccio_sd>;
 	status = "okay";

---
base-commit: a9d78db32fe78bdbe7c66ba77cb7dbb729b885de
change-id: 20261110-odroid-m1-sdr104-f6e03a0c5ac9

Best regards,
-- 
Igor Velkov <iav@iav.lv>


