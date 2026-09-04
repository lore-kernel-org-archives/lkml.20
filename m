Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B03A9639;
	Fri,  4 Sep 2026 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508022; cv=none; b=ua0+4FV8uAZDhtA/I/w//zWxvs+E8o4xxRBAIMJPH02yK8+nbQTDP1dwmwIyK3nGk6nEn+G1Ocm2Lrh7HbKSzCGVUwJkoFYotgZYVEBho1deA9xXXxvBJU5Bg0Be8kPsDNYvxelwEqiuPrcvfb/gtY0TYnGTKqMaZgqPg2fPBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508022; c=relaxed/simple;
	bh=JTGSzF3cwcMgL2GV7Aem6Nhh3tKER7RTd2LK3CeGm58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjPZFBK6R6sLu+uXHiDE8e75y9FPb2jTEuTWfXWF3VdKPMwehCr2yiKd3grmIAwtIZTQDeU/ZRdt1fi8pVtbJTL1bis/F81ngFavXZrGs2bsMSCI5x0Dj+/66a25BCbebOlRHZDuyNCJ1yjW69I+W22fOhmJRkSMMJngsn13GGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IEH6dCow; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x8NGYwKR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IEH6dCow";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x8NGYwKR"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788508013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=;
	b=IEH6dCowFYkVcaYBHPhRPPT6HfFx6gXRhzI4SkLHe8BrkqygfYiDmttEZfq9CqY+bs2T/8
	DKC8KpFCPlxQAxspwprKl9Zj4n1xLP0FnS2T65ElkYBpMorCA9HYa2SlrXcgCwB9WjoHyJ
	LREyTHF2rVwUzSBUzvrWvNzW2QQZmP/mtavUBG01Fnl02xEbndth1kTVJbwJHSoIPBEPu8
	/LIy0D03vvfU/mxDTdb12TasItO0DL2CSsXQTnKL3hgBBZZv/CRA+0wRUVD4hdmzkjCL5s
	qaC5FHTBM/LbkYc7rsF6mTXjxE7AqVH8RGaDmCp+yByhzlqLfAQnxR0LvvWaHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788508013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=;
	b=x8NGYwKR+/Fv7VhGnNMKhojBtA5yPbywehQdjPLSjgLKgmPLjg1N3lA2C83Ghx1zeYe+yn
	Ohd8ATSkkflXqBDA==
Date: Fri, 04 Sep 2026 09:46:50 +0200
Subject: [PATCH v4 2/4] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rpi-tryboot-v4-2-fdee8bc53ff7@linutronix.de>
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
In-Reply-To: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788508013; l=1239;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=JTGSzF3cwcMgL2GV7Aem6Nhh3tKER7RTd2LK3CeGm58=;
 b=VF7C8aGUlasLDfXs/AkUeCU+SzcvTP0kvwfcegGrPyJtZzSfFSunlMsKj2erwjY/+cwmOHWeu
 kpltefjMXOODzWAlOgNVa/T4NQHkBGdObtfsWapKPLkDHoBKFGC2ZN9
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi firmware allows to set a reboot mode called tryboot
that allows to try booting from a different partition to allow updating
of the boot partition. Allow reboot mode properties by referencing the
reboot-mode schema. The firmware allows a 32bit value to be sent as
reboot flag so restrict the maxItems to 1.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec97..28c5713860468 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,15 @@ properties:
     required:
       - compatible
 
+  mode-normal:
+    maxItems: 1
+
+  mode-tryboot:
+    maxItems: 1
+
+allOf:
+  - $ref: /schemas/power/reset/reboot-mode.yaml#
+
 required:
   - compatible
   - mboxes

-- 
2.47.3

