Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315632;
	b=MasYSajwGrmmZFXa4v76M5LvcQoNiZts35hLT67CYQdmnuLp6cr4ivTVindxfg25PKRX
	 sdDBqCVfA2xfjY7x1jmIwWKrZnTHtyxX2ysmY4MhkCBafoyQZ79CsZFsFmiyZWljeugyY
	 Nigq0LfOXsA6o6O0T78Ym7JCSkEL494ne8i2583Kw5LilR9ZM8eZI/npaexB/FvbZSOCq
	 61nWyFCtzjxU6LB9k595QG1NS7eURdF9Xffwwwv3ZLPckbZbWzrw9sozG5TrE9Fg4G1St
	 1JWGKCPYRthsmnlOfSdwBnNy4uA1ESV4LokmWinaoqleZN2tyyM5xL4tOc5zQlMFETA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315632;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=p6UbBy761wweiUYQTU+IpjGwUVBHJzkK1GkVOhJL9cI=;
	b=LpM6CycXu95zW2OfRmXL/4Ae01McCmQ/8sOzMrcRxFiQgPlFIW5UPIGYmCWPavNZDPT6
	 r6NR7a+9M+LYgS6A2h3ck4ARQ0abxraGmVY0WAa1GFUhP3teiOAL3inKzwCYRqzKd8Cwp
	 6iq82SibObG0onQHHZbU9dTUO73PmA3L8OB1J+k1k2YLgJypjfNrIejs7ufQ5+jgXLHtj
	 DxC1lc/5qZa2hpAb+fYu/xCvA0FndF1Iq2rplBzFzPDLGOEKc3H7Eg5WxbSsCgLZ/eeEg
	 yHxk1gIML3TjbrOPj4+1Vn0oJr7R9e6Tg4eG2FRdUot8MgCKbFPsJBkQAFusCmvn1UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rfNxH6kJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0I0wkFkZ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBBB606E467;
	Tue, 10 Nov 2026 13:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBBB606E467
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rfNxH6kJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0I0wkFkZ
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6UbBy761wweiUYQTU+IpjGwUVBHJzkK1GkVOhJL9cI=;
	b=rfNxH6kJkBbvr2WS9T157PE/oXjsLBf/DCbzT/TSRVo5z+MAR9Y76R10oJGSCxep4gGZT8
	KrYYPs3XqMwPi9r1OKc+PB9RnFN22/ZtQYgJ4rpS4Y26WzC6bkZRXGYcHATM0l0PjsyMKk
	bRRMg7JVXMYPcNCCytoqIiPyTyXmXeZNOIkZ5fEwLBqqac8YOQMlKUgAl2Q8u2yK8nEVJc
	qftJxzntxRMu0G2pCLHY7rG2KDH1d/Ttt/SrrCZ/rvmZe6P6poU715efCunzNuuf79vFqd
	Ii2G0g3v/pK1Tln6+L/ryNlUqSvCJskZg8QojDEzOnMGraV0DRyuyCG9yNUsKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6UbBy761wweiUYQTU+IpjGwUVBHJzkK1GkVOhJL9cI=;
	b=0I0wkFkZoqzebhrJkmx1nSMT8DBLee4HijR1s/ABK7yZ0MwlkyeCcILWgkqrhm1IAF5rSB
	WnD9MZgxEM7OpUBQ==
Date: Tue, 10 Nov 2026 14:00:14 +0100
Subject: [PATCH v6 4/5] arm64: dts: broadcom: bcm2712: Add reboot modes to
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
Message-Id: <20261110-rpi-tryboot-v6-4-56f680ef4734@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=7it9CxaaYRxnG5e8FXqsp8qolf2qXEVZ57PjmKQ7nCY=;
 b=Ih7q07Nzug8gnjy5R3ydeB0lsBjPIHqkGeBSwzaJjpdbAB6P+TXjBAdW/apIE5srewlYEg7us
 Wk3t4xnFUONBxghOJ+S2bX03VNRcUh+5jYE3FjOLrRSUt5sVtcJzQpe
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index e5030da60f9e7..d81498fd57dbd 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -50,6 +50,8 @@ firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3

