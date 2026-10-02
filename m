Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76D138A720;
	Fri,  2 Oct 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934829; cv=none; b=t6nkNazyNf2SHPRSJVRDZ2zX6vEBD0mwetjgl1qdNTtavOqCeVr/WjWno8eelY9XB9pQfuOMGBTgtsStf5JDfWC94gsTr+xtzvC1r5IqxnLBKb/oiukKiTqPMK5il6DmjD73BjzXQQcBxwrMCO/HkYKo1aEbqZKN0WUyd549L1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934829; c=relaxed/simple;
	bh=JTGSzF3cwcMgL2GV7Aem6Nhh3tKER7RTd2LK3CeGm58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dh2b4m0pZOxyrI66N/NUCoEDnWVua8IRUKgNI/jLVD5QOpU9R3PcRA+0CPjepzFz5nuoJmosEoaPmwoqlyAya9+6EMCvEvnY/+oDHxvYlfNT02mg8eXRI2RePyICtQyUX9LJr1MXU0eT7njs9cQ7veCtQFnmsSSk11opqQgA2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LdtiXn7t; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HVguhwCF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LdtiXn7t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HVguhwCF"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=;
	b=LdtiXn7tKytLDls0T4CpNf+/zaS4AcjWCnYeX37PWKhuXXBXJ2X8cXhpQ+383iqCyUjbtm
	ePCOM3Cc/Rssn115tyNE4NEvW6UAHOwGDOC1kk+1wPPobeOUMHo4XEFq9x2TcG8x0rcD80
	ut2gwpWhviJDjbsSZrl2CCZkGJrlgR5simVyZ1YIdGauBBpGAlvuF9hJkT3JjnzIEyHB53
	0AibtmzTuSoEkRrm7hrDnl4J8usIBTTh6gPJQnwnAVpzTdYMTRt7qEA7eDNOiRVLo1yxpO
	vzXZRRdJjrTyo6KNQZ1JPQYvYLqb10n2hlBLX75B4DTSrc+vxXFrxv4UFOjzxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlSADl29CmHDkOq9VyOqS+dZQ9n9eCe+aPQc5gMZi0s=;
	b=HVguhwCFfumx2VItFae2gqcBoojKFX3qeK//773dibs+Klrgyi/WyllLnEAI/YIEGP9UOZ
	5vHAphkde86JGMAg==
Date: Fri, 02 Oct 2026 11:53:41 +0200
Subject: [PATCH v5 2/5] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-rpi-tryboot-v5-2-6294c131e583@linutronix.de>
References: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
In-Reply-To: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790934824; l=1239;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=JTGSzF3cwcMgL2GV7Aem6Nhh3tKER7RTd2LK3CeGm58=;
 b=PpoMvXqYSEjBmjPoIq5IO45W3jni+kb9kSDtI/UE/JmzoprFrEt0keyEQH7Q7pzoxrs9t+S+G
 Zeicz2wBVzGCyKZmGKyOQwX6xJ9EK8Yhtl4GIoNBF9+51jq57CKZJau
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

