Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339040;
	b=enbpMNqgTkkgYpYJRK8dFb6TKZ3x9Y4JY9rQw+33B53gfOSqzJzNM6V2OOtPm7KqaATd
	 0iMXdVSwjwWJ6LrD2qcJiM2t+stM+mE2/i6ODaNavq3zvNtBxRQms0Ek4gW7p/VvHxEe3
	 LG6jO8H5z3+W2l7KA9RS+U/fF8o92onMqaKa3JsWox92yRBAkFfpYHLm2lpgEzca3grYO
	 RH858u+ZN4/b/fQUWDZHKvXOz318NsghAMmXlb9mT65IU8fEqIquh8vI7AuH6Wtoy+K0g
	 Gkh9wXxhL2/jZVBapNyoqKdLbk+FOcIM0/LZYzFPTq0xW2Cth1p3n/5rQFVlkiZ8c6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=;
	b=CJlwhao6PvSPwAoHSY9gdj3Rot2+NRRCkWvdUKYJ0/u027301zftfMJKvid4kEaeKXoJ
	 qCD4eJftoMCFefgQTrN1RsRxTL+FYeYkq125L9MhO6t3q6R/JBH4lCvfsHjCJIeAz1/Ve
	 Xb5C2U1ndt4KKRlaZVUQTgRIqvEekMg7yTpYkD2cJ0TEWTnLEAxNa3kNVxg6XSwJFuwsR
	 sQW1gW+njG+Oug3gEWpsaV/pFt/b5OfF7i7kXKdJZRKgoqXDUem1Qu3Vyhgdv2hju34cQ
	 vCYE1W1dOiEDxhEGiIUbGcJFOD2R1+avWp2WhrqaquRTq5rmwWcS3p97PCq4Pi1iCAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLFffG5q;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14E2606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A14E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLFffG5q
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-37198ed3727so3111729eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339039; x=1794943839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=;
        b=kLFffG5qAIK2Rx446b61kwv0+kC8xdxvAAfZ6PduQcOfFYgwBTAQwFAiKiVrEEQl8f
         RcPJPWb3KsULfTQHXVbSAfkbeyNxCH5J9yMxozyEBLKU/Op+0EcVDilaVF2V629MwQSb
         QMaZJywCE/eA/LxGn55+r/PdS3coukI5bjwf5TLAtrjkeAZfT2S9fsJYThTa2vuvucGk
         m9z1Q0Ijv53734gUX+kSa05f3nj0wlpWpOA+HHz9J96BGoWxLV9mzSN53vuHYA0Y8BdR
         +pdn7ofarjWNxH1+hY/Q9FkY1aSocSpBQhkQmoB+bd//bn9HNVINrQFvzzYWa74/oJ4a
         BOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339039; x=1794943839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=;
        b=B0paag2fUuJAwamC8558VAZp3FgrcSWEWLBaAnfP6VrQCLAzyhhDq/OsJBPd3OMT+3
         2gxqs4MLal71/b/igfGLpx8Po7n40HpBCYB7JnohZS7Ca+BIcgPGA6ZZ9uDIBli9JiOB
         Q0rP1r/sZDtParBmp62k6z9tW8kmk7qyMF3GIxFl/xRVPzBNEWu54TXQntE2uKWe+so/
         e4NBRYpVPgOe9tzj3K/yn+pU4dnB2rlc0eWCPJl0S22zaxooZXaVhFff2THkt6CH95Qb
         Mu1zotp15uAdszcSNQuPZd+Pu2FB0xHY3Bbp91ljmlWiGWPyo93XAhS70Jiq/Y3zoD5d
         ASZg==
X-Forwarded-Encrypted: i=1; AL+hErEfDraQCFE9NlhVascx8vTCmuQnh11kVG9UCcpZdr1U9xPlQlpgJaEuUuvJVWd3aC4M8K/KSZqXNviPMgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gjtl0Sw0SgglpBNyfYKW8TJP86VvaUW9yxK5r8l8Y/VQlFRT7
	7yBDL+CVeVwjXx7+dduMlz+1xSOK1yNI1MwysXbiFPuUEDaAP7nBqyaI
X-Gm-Gg: AYBFou3/xwUSu4wFd5yFWWQ+oexjf59T0tSDuc3kpBjndRZ4jbNQfbn2bnJfUeDI9p2
	ErXQ8opUwpJ33p3Ny15tY/FogNqJ6e6nv7BHNHm0PQjUB5CLZG6QQ+kPp97hjDqRaLRJHn1UDgO
	4wAF+2AZpPNeuqzNZtlKQneL0RZVm7b81uJheeuRVn+3cBDLYEawNdoX6/LcN1kkaeudlyhoGk1
	OQsXty4SAkCmWAI1obiawX6d/BIREAZNz/A8q55mILUQIMqbOOOC6gUsdpGB2FSiioljhVT824l
	1+nvkh2awY0VnlIlfT9TVkWob6U+rFIt/ympqm9rgACDqHXS7MJgkVnEK10P9bqDFOaPWp24ooi
	Q/65+BnZ5hAiSDZJLxK/8rxEYzeYoGlp2xxOGG6YjfNKmPUlCEQhq7j2HYqDMNjMeQ80JuOwsnQ
	A6nK2Y2V/Vp6OdWNCw2eUCv68U/SZnvmaTybGZPjr1dVHA/65RH9YG4LoqLoEmy4OWYfR4rNhJ4
	i9e41iuyFMKLGbISQNM1oTgKJF8MsQQ8m27aIqHL3oY25WkwUGIyZ1BrQF48TapA2y+ETISA7vl
	fGJo4dg364u22ecSEWw4pHDCOXFkyznh45Iwj0ebdEiMOPZcVA==
X-Received: by 2002:a05:7301:5f17:b0:375:85ac:d14f with SMTP id 5a478bee46e88-3766a1086f8mr574713eec.14.1794339038382;
        Tue, 10 Nov 2026 11:30:38 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7730435eec.0.2026.11.10.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:30:37 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/2] arm64: dts: rockchip: add USB-C PD and DP altmode to LubanCat 4
Date: Wed, 11 Nov 2026 03:30:26 +0800
Message-ID: <20261110193028.512456-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front-panel USB Type-C port on the EmbedFire
LubanCat 4 single-board computer, covering USB Power Delivery, dual-role
data/power, and DisplayPort alternate mode.

The port is backed by a Fairchild FUSB302 controller on I2C1 (0x22),
a fixed 5V VBUS regulator enabled by GPIO1_C1 (limited to 2A by an
LPW5209 switch), the RK3588 combo PHY usbdp_phy0, and two DC switches
on GPIO4_B3/B4 for the SBU1/SBU2 lines.

The series is organized into two steps:

1. Basic Type-C and USB PD support:
   Adds the FUSB302 node, VBUS regulator, dual-role power (source 5V/2A,
   sink 5V/1A) and dual-role data connector.  Sets usb_host0_xhci to
   OTG mode with usb-role-switch, wires HS data to the host controller
   and SS data to usbdp_phy0, and adds orientation-switch on the PHY.

2. DisplayPort alternate mode:
   Adds the DisplayPort altmode entry (SVID 0xff01) to the connector,
   wires connector SBU (port@2) to usbdp_phy0 (port@3), and connects
   the display pipeline: VOP2 VP1 -> dp0 -> usbdp_phy0 (port@2).

Validation and hardware test status:
- 'make dtbs' builds cleanly without warnings.
- 'make dtbs_check' against usb-connector, phy-rockchip-usbdp,
  rockchip,dw-dp, and fcs,fusb302 schemas passes with 0 warnings.
- Patch 1 has been verified on a physical LubanCat 4 board:
  * tcpm and fusb302 probe cleanly;
  * Host mode: USB 2.0 and USB 3.0 peripherals enumerate; USB 3.0
    operates at SuperSpeed in normal orientation (reverse-orientation
    SuperSpeed is subject to the known upstream phy-rockchip-usbdp bug);
  * Device mode: ConfigFS CDC ACM serial gadget successfully enumerates
    on a host PC at high-speed with bidirectional data communication;
  * VBUS power switch correctly enables in source mode and remains
    disabled in sink mode with reverse current blocked.
- Patch 2 driver stack registration has been verified on board:
  dw_dp binds to the display subsystem, DRM connector card2-DP-1 is
  registered, usbdp phy-mux and phy-switch are registered, and
  typec_displayport binds to the altmode.  Display output / link
  training is disclosed as pending physical verification due to lack
  of a USB-C to DP monitor/cable at this time.

Pufan Jin (2):
  arm64: dts: rockchip: add USB-C PD support to LubanCat 4
  arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4

 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 172 +++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

-- 
2.56.0

