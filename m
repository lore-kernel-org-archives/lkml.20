Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315633;
	b=elz49QaJ1EsD3sZIxDjBBcMNsoKrhTYUDJc/4m8kvaeCXEm2dlMqnQGCo552KhF2/Fsd
	 Gm1Mosa628L9fBl0EZ2z/E8xdzAk2rxvanpxgv3AvODRFkD8yxHfy7dRLLDOXHAIHVy7W
	 Xa/Ciqww+7OWwLTU/eW5+VXuFBC08nPzyqKWyMBxA0H0jj7ov4/6iCjDhcIbH4PA/y9Hv
	 lwr+gibTspOmU3s460RXxPcSqoEse539KbX7C1uWY+yPnDI2fiJNnTVdQTFfg03sQ5lSD
	 6lmDh4US7BKMHVQ3VbymbNaouYx2PyD+MasCKeYv+DCQ43h1WQ3TxizorcJzhQ09ECA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315633;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=IbZ6QzsJEcQUhbZ6wzv29rMmvFPSNjR1LFmhiDTzVvAfh3zvvL8cajiOTkobShzMli99
	 DWVZDz42BVf/Ed0di+4QtOgVsX4qHx3I7hJknGFyWhglc4QqxIp4Go5VrcENEYJcb6Un3
	 Xa/acDizrGkkqm2TMhqgQZxPPMvVjdyzC8jgtM/tYLC/iXOccYTW/MGacm8Rzbn1g4Ws/
	 +qdc7sg4kafZxV4XX74Ukt/5FI5NU7mjEyvO+qQxi6jxfug9On7XGLRwyb1IudIAex1R+
	 9fkNKRx3AoJ7PcPZmcbB0GUEPo0gO7zZ48h5BYBuIxa6qiZ0Gw3bOS8onrdhC6/gTlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zGVPylVz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z6OGt1MW;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368B60A2618;
	Tue, 10 Nov 2026 13:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7368B60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zGVPylVz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z6OGt1MW
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=zGVPylVzmg5q7elFtgMELE6tAQr5tb9qf2SfLOxfJNtwKSU3uRbS4L45y0WZ36wvKHXRtZ
	Ja/BL25NP+zMjTJSVfDUDInD15gi9T6YTYxGJOPelr7j4ijrLwLrtPlmFo5O+MvBkuJmmn
	wzjIi+ZoiOjP0FnRCnk/c9MyIeESoELvbqkHgAC2PdUJm6ujInMYtfNa8/uDDOcTqbYnfW
	feUOUK53pmAAj0tMNZkXmY6JaodrQRPKBsApKC7ERb9welzZGhwnU6OlBcb1VedbHuCGKG
	B3axyIhhSXi0mhYE/Yw/8l5Q4kbcaqPyLHGlqa5lhW2fGDhJdYJyXnpVXVSWhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=z6OGt1MW6zT12nOegJT9PQOQ+8TLuRJjbk3hwjt5i59FUF2uLI1e0Fcqoil/4QDlRzpOov
	5GzHqMcDI6g1dbAg==
Date: Tue, 10 Nov 2026 14:00:15 +0100
Subject: [PATCH v6 5/5] arm: dts: broadcom: bcm2835: Add reboot modes to
 firmware node
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
Message-Id: <20261110-rpi-tryboot-v6-5-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
In-Reply-To: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=821;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=iW92QJbYkT2c+9COJjq6j+FezNFEwORGgQahLMmFk7Y=;
 b=rjmILPQ+BvB0ULB1nhYzHaAzVULLTH7osXnkezMYNsFFZuir0AaXWNn7vvxACsa6knI7pevoJ
 spMGAEB1QMEACE2rNcToT1RHMxDgFVhdPJproHr85DM60ETUPs+hPYW
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index 46c91468f4c54..174b13b8facbb 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -5,6 +5,8 @@ firmware {
 		firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3

