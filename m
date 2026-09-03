Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238F4BB808;
	Thu,  3 Sep 2026 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446921; cv=none; b=sVLrVqqIDKAofd89fMz1ubYmuzL+ih8v3DJWYqcLU9tYRv8pbSvsOFnEBMfH66aamjqTgTkoEyqDEcx6kM7z7tSfxbfjoGTViCDB134M5geQGLxsCrg/pBl+tJi+D0WAMDTE2sXlA3hsg1cNq1SPNqAqUh+A1uGnAEpWpbxp3xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446921; c=relaxed/simple;
	bh=JTGSzF3cwcMgL2GV7Aem6Nhh3tKER7RTd2LK3CeGm58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opTfLQeAXyLjHWOrasVFYA/hWLlA0HHesL/D7z9dk21FpS1SdKe0IrgIxopq5Lcgwk/1XwwF2erOWYcLIweEHGiU3IokjEPTNH8L7q4lIfOELS6mhW+3uADeKevGtkx8OxZLMVFdUpoflWvxkHEeSGTar/r2anvbfi5Qzv95aJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kcVOrehi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P1qSdgCo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kcVOrehi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P1qSdgCo"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788446915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=;
	b=kcVOrehiwgUoztKT9Doz9kR8GAfkysGGReM2dGcyf6nX0TUcyvfE7Vpg80SnsFnCQcfuoT
	2P+o2iOEZF3B+thhyIV5n0pWeHcuhD5xUKCFyP19ffTUUd57s8sCI73Ni/sFT+lwFl4yUZ
	Twju7jhd5xPY71EzR04t5KrdBnLVReJ2aOKiP1lRd1dnbwNc3bcp8EqB6fyM7/8djh24Ik
	l++baqbC6xMTz+Tb0VmNH/Sm81jp4CtN0+nUS6CfrAakfo3B+Y7vyeJrP1EHxDxqspuPxX
	nDIEM4vCcioJ6ojPxuzMPvy7MigXlATaDOQtxe49tYBRHEkGM5UryyOljoT7dA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788446915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=;
	b=P1qSdgCoBr6gRHhxabq39aEzODHaVKeJRcSVvM08+BFlTNdCGlzoFy6ogEmdxFdOgTR+2k
	v6SdiaWd3MpqwkDg==
Date: Thu, 03 Sep 2026 16:48:26 +0200
Subject: [PATCH RESEND v3 2/4] dt-bindings: raspberrypi,bcm2835-firmware:
 Include 'reboot-mode.yaml'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-rpi-tryboot-v3-2-ce94c347e932@linutronix.de>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788446914; l=1239;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=JTGSzF3cwcMgL2GV7Aem6Nhh3tKER7RTd2LK3CeGm58=;
 b=e2HL80+u/GDmdsWfWN9gm+5v/i+IHGvOH1IKTzBafJrpft5pylwb0GoDHDIMutWy3xnh13Ypn
 srE6thv//R0A6PtCaZhb1OlXf64wIdvAjgxZli8on3LiieDAAdo0PmI
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

