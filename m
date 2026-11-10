Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315631;
	b=Ur0hWazUoK8AIAljpppsS0n9Acyad3fV0pQ0IT5E5sfoQt9M0mFgdvV9yvYZwNcTGqBk
	 0CzIzlxNlfNA9vm3Xf7rgCgs173mgUhpSA6zMKgkwzAAtAAH9dM06NcZeqiarjYGZLTy8
	 D5xxXwkuZ0NYLz3JeUQNXDIL2ovoQWYvk075IqtOQ5QUj5bb0Np5k5N0ocvCiCp14Vtdz
	 EjNQ+yHARktX9U5vcZO7ZPR0QPN8rei6GJbUtelcrbrK2I9uwFZ7nYpIjBBbNW9xZ8uUM
	 QsIUr4ytvIV8WriuBHx5dhZSVxeJJbR4ubzfj6/zyc4WOvfCThVc08EyfKu/CnJaeow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315631;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=3zMv941SOr8xekXo6fTcnzy/BHJH3qWqyAFRtIyz84M=;
	b=BQpu+oJD3fREg+p+Y9AIdlXlioI1Qf5opowUanSW3lp+AbIaCsfrBIRpgUJ4kRFAlJp6
	 lwuBIahQQ2rtmuCimD7+vGj0t8zsq2l3nMk7w0Cx6kljIz9kh26S/vRx9X+McLYpEyUOk
	 Yj5EDxOpeP2Fsqi7Ef/T8Pc8PvrcM77phr27cYNL/qruONcmsfiPFF1+4xJSZgvl8BqnS
	 bTpp3e0aELxJKnuZLZjewWmg7FMGLg9PuWtmal5Vr/g0l24wv44sNgFOXk8xfFRhCbzr9
	 nu6iGehHCYjS5DURN1BDfEAHMwQZ8HQnTEBk4QLFhgoZmH6yfxqW0YiDex9QeZbgIuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nJNwXkHK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CEGzPwk2;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E401606A32E;
	Tue, 10 Nov 2026 13:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E401606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nJNwXkHK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CEGzPwk2
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zMv941SOr8xekXo6fTcnzy/BHJH3qWqyAFRtIyz84M=;
	b=nJNwXkHK6aWAwG7hNMuZSOaJeEtc+8K6/+FZ1DxeWWqYE8Fi6QiCjmBPByckwJBfBmOodD
	bDTnHloxmiAWvzBqLWeYwwxdidU2KM0kgHoyB9KQHLbPS+U1xOFxko7HHixeRRSX7RAav0
	xg/sfIVxMYBBHNFQ8gp3gfy0+OMIgUC5FWyy5Ar7t1D/82I8faeh1O8minBwt/lncS2IIv
	/l+YH7Q6YaB68RCAM6eW5GAmLDURAQClQkPdYAYjrFktf6qOBpvVTNY6u1+uTDRqAXGFAW
	Ii96NZ0DV+qwgBa6afsl38wGpyNAldDX56Lfy+0PvbPWLeLlMJ1rxAJawhNbmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zMv941SOr8xekXo6fTcnzy/BHJH3qWqyAFRtIyz84M=;
	b=CEGzPwk2UaIVaZNE6AcGJFmczjwegJpf2M+tZxRblw/zmk7d4D1Ct7jP3ZtYFgXLgcowHw
	va+g/T9ZWRrNFJBQ==
Date: Tue, 10 Nov 2026 14:00:12 +0100
Subject: [PATCH v6 2/5] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
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
Message-Id: <20261110-rpi-tryboot-v6-2-56f680ef4734@linutronix.de>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=1242;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=fhRlwoURNhKjUwmc6zTXWmbtPey+wbDhPSnSGbef0Xs=;
 b=tcMQeOD7veSQStS4/H8FZmfv5MNZ0e7/VDgB43Ot6i6HFD/MfHP1oMrZnYsJIzJiYzQ3bS1aJ
 u6zPc9T34ONAn2F7e0PEOsyw0Z5zaOTocvZszTgnbziqfeKajoU/ouN
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
index dc71fd57834e8..d07e327dd8065 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -138,6 +138,15 @@ properties:
     minimum: 1300
     maximum: 5000
 
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

