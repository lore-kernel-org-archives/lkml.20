Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ACC4BC022;
	Thu,  3 Sep 2026 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446919; cv=none; b=prf7W7zFwKCBrLeboO82WiZ8uYIn6CHWooIp+mmbzBDS1p1EAYv2jPsDevKQ5b1X12HL09mO5nPodDc7w+gOcvSmIqvdmzJGyjmTEIBm9yULhvf9MAZMGxsELZHOgiqNOaIz4mqxGjhBBAzp8hvEC8yx/epApuUmNXCoowkLtps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446919; c=relaxed/simple;
	bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEn5b8HEJHvlx7pnZOa9CbkqFcmDnV9doI17TQoT72MdBBQZ4SNSASlvtJPXajw2r12SWgrtXQdUyKikvAFst2FiEg08H9Lsd7kzBPltwCXkMsA0kDMT0vOm9BprxqAx8XSWr8JxIV2VmKPdPnz1xR1yuNhB7fJX0rLj1wZTHIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kLfVyQdq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ue6BL3zR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kLfVyQdq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ue6BL3zR"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788446916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=kLfVyQdqKaqWu7+ybKASS563UxQtYZQCXW+jvNUpiHVRuUSrmWEunpaZ8yN6rchzHe7WG/
	nZsi8XFEnpx1a8d2Xuc4ht01xZiUJuuttoiadvocAugLXdSTybNqJ3pYLsjPL+NTUbtTBk
	5CZyrL/L6CTrOY4jGZds135uSGEsBk1AOz4ra6EfdLSnKNSjyoUakbhWSRUNr7TShhkE2t
	PtawV84luBeYm+Zr5PQfL2rym1Z80ESMWugrhcXHh2F2zme3r1ep6HFzAb7IKfxxfvwET8
	5JtHKX18GmAIdhXO6mQBCv0JSyqUxpAtlmQNBGjKpi83HaANn5HSNDo+cWS4wg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788446916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64FPqO/LfunvshSq+IFyW+9AM3tTCc0dWxi+1v1KXro=;
	b=Ue6BL3zRXDnF5m1W78nftmClAV9ngCWDzm/IUGSdGRDPGMy72QlMr3yGb5wYwFK9dj5YEQ
	2VnMh8i+KmZPOjCA==
Date: Thu, 03 Sep 2026 16:48:28 +0200
Subject: [PATCH RESEND v3 4/4] arm64: dts: broadcom: bcm2712: Add reboot
 modes to firmware node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-rpi-tryboot-v3-4-ce94c347e932@linutronix.de>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
In-Reply-To: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788446914; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=mtAzetqs605P30BAlqjqWHlKtFDY7Xar7nSqW4P19ok=;
 b=xbHsHiNURnjx5H8h6p0fX9G85TwP3cQqhi9Hqp8E1Q1j4HtVhpeOYMX9K0gQk1wSvQq/5bvr2
 86ibDgOwGqVAYWZJCqq+hvDKXmCr654G7E6uJNW37l2oN9zGNXm4v45
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..67095c7ff770d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -49,6 +49,8 @@ firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3

