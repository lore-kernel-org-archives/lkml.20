Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475353;
	b=DyfOZ0RvIRcYkbqe+IdqQwPQf9F1HwvOpc4jWmKizsMQCjjiWZU5CDKOShHiAMwtMO18
	 6Ups2zzC3qA8Ihjwsr0xY+1t5V9ltXv17JOV9D3nU6q5Xe/gEqbljC0NBW8IniyfazKt9
	 W9mcQZETm8yxQE51Zn4thE6eVKTR3WvkDxvZIIvi8dJbXcYzNgGTiRlWrMKsmu0wyYb3g
	 1ROA/ZPUdRbvcpmynJn+0xIw0gelSu52lojtgIAghYrp98Per4CnGtfyd26V+7rK+V+Vd
	 hGEWpeIi2b3cTs/l9feHfleABKUNWA56lYp5EK4OKAylcQlKsysvR5lqixHJedBKG/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475353;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	b=mD5sVvV54ERiPo4EKzxBWU3skpCiaGgSTp+KBoYxMIPwwsy6gdzvRT23VNMQVytUQtVZ
	 t1uytMU8XGH56kGMZTZE6EBgMFV+Hcis4EPcIxuntK6yqON0kpLhpGUnO+Kh+nTVBKAyj
	 oDhBN7E8kYJT5e2uXMtTr974wf4PYsNmlWXys1b4Qu8SzIKAPmOZWaQvj0IV0yVCYOun7
	 5/UrK9BWRmNSfvv98qKUqomXsHWPYilPtvyTTRlh7KlDYBq9BgPoK//hgak9L5C4nOYgg
	 3MPsutV471LJHh4phgWuCQXisTbSjozUcprv7IWJliycz/6Evb8KPFfF/ZLSNcc1NFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAqhGWp8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11740606A323;
	Thu, 12 Nov 2026 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAqhGWp8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475352;
	b=eHQyUtTHvK9Qh24U/f1A4X8yuhNisxHGp6d3WrBAWr7oCKMlq2oc5SyVrkGhf8Tuf7gM
	 qhCfgTay+cZX1HVXBAKY0yeVIBXELECpZf0ITRXvnPJHR9KkgU3FvR9vubhLavSH0IRAo
	 bPQVC2OJOiVUYd+WVKyJIHR/9Gat2ar3/E2NmCVFrmgw95+NGMyY03i1oCrjWcjij72GN
	 YrkEc9CJpPjRQMhfYMmVCejZ3Xs44J01Y1GO735O1NJChk8RUjijMYM7fEgScfGjkUJE/
	 T1Yd0XxMGqNzwkvQ3Wa8ibar8kY/yR1I3fHFKvyNk+iUv9w5Hq8wOJIXgW6gwbhuyNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475352;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	b=IRxof7TG+xAsyKiLUViLbw3ARadjbqSRCw6whFJ8TimyNCgii/jtrZJJa2gGzOanK/z9
	 j24wP3uY+Obh3PRO2MCu6goZJyej+rakukdQT37EwLoJLd4oXWpFOdujHmI0eCUEj2l/5
	 GwvjDO7VkUu/1niAH9LzhvePIky5SS76LOOs+dsebjFAH7wapb04iiDVz6DOkOjffpR97
	 xsctpgg2RCVK+DGsXrjxi28G/s+s/EUq6I+t/X60H2JdgmBkPBmAfqRQRwK+skDQef/Rc
	 S8mm0lDBPm9iKxCKDdo7nih/8fl/+vVrIyZ/Dn5iEegGZUuX36P2LRjHvW1zzVHJdIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C79A1F00A07;
	Thu, 12 Nov 2026 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475352;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kAqhGWp8d7om5nKdOFYQM6LNpUdxZevJ4FoV2RHtxsSFPA9qPwBOCimcF24gpD8lG
	 3ltQPavyVHTrD7QSGmY1LxNfcZwHnFE64M9/e6uojPjWieu08cB6qlGj2DLdJDlMCH
	 ss6YXPXcGMzxYdxNmcgCmn+mvbG/GmUViaCakNIs/RInJaYj6UhlF0VRJ00THP680T
	 GX0m0tD5Kx6zrFJKPYJ0ELu77ZKbEK+xcaEFDduySjxX+PIYdSQHG9+3j4yNc8QHqp
	 fdQ2h5You8gjw1p4SamlilfXSZG3V+A3oCtNIprQgjZWLZ1U3T0kqd+V/I2aEULfPI
	 LU6YFT30wBLKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8A96549430;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:32 +0000
Subject: [PATCH v3 2/7] arm64: dts: allwinner: orangepi-zero2: Let the PHY
 add the RX delay
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
Message-Id: <20261112-h616-zero2-dt-v3-2-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=1923;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hgTnawt6aimtaYNRLXqSLgWoRIBtKR4Hz80cKcd5MZQ=;
 b=vJ2ZDnQf7m9n3JuujGCr6FMtzvczqPGcrm49X9AJCXNCBYfWtNBiezVwEh6ut7LnS+yt/zY2F
 olwUXyzpPADD9lT6n1X1l8Fc+mdovKmAkS6TuCgJkmdT05OuP/k0O6H
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The Orange Pi Zero2 describes its RTL8211F link as "rgmii", with the
whole RX clock delay (3100 ps, the maximum the H616 EMAC syscon can
add) inserted by the MAC. With "rgmii" the Realtek PHY driver also
clears the PHY's own RX delay bit, so RX sampling relies on the MAC
delay alone and sits at the edge of the window.

On the board this shows up as intermittent boots with a dead receive
path, after cold and warm resets alike: the link comes up at
1000/full and frames are transmitted and seen by the peer, but nothing
is ever received and the EMAC raises no RX interrupt. All EMAC clock,
pinmux, drive strength and syscon registers are the same on good and
bad boots. On a bad boot, setting the PHY RX delay bit and clearing
the syscon RX delay restores reception at once, without a link reset.

Use "rgmii-rxid" (RX delay in the PHY, none in the MAC), as the Orange
Pi Zero3 with the same PHY already does, and as the vendor BSP does.
The 700 ps MAC TX delay is kept. With this change 10 of 10 cold boots
had a working receive path.

Fixes: 5a378f9f2b15 ("arm64: dts: allwinner: h616: Add OrangePi Zero 2 board support")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index f2e3300e078a..1fdf2d3c1a87 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -18,9 +18,9 @@ &cpu0 {
 };
 
 &emac0 {
-	allwinner,rx-delay-ps = <3100>;
 	allwinner,tx-delay-ps = <700>;
-	phy-mode = "rgmii";
+	/* RX delay is added by the PHY, TX delay by the EMAC */
+	phy-mode = "rgmii-rxid";
 	phy-supply = <&reg_dcdce>;
 };
 

-- 
2.55.0


