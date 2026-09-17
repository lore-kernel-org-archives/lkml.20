Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D7130E0FC;
	Thu, 17 Sep 2026 00:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604765; cv=none; b=oiBT+iN1RqPywgAgs4NO+eOCWptIWfqlmBZBklVSH+gifCQMglQbHcqnHT8SDCDVc3BU7+u9aYx6KwwZiOTNxk9YT6XrDI2K3GNt+N8OK2xJGbgAj5zzGQTUjEm8KJvGuysOS2PjXgXWL/iPd5oYrUNQJ80hbDc7D9D+QACjB24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604765; c=relaxed/simple;
	bh=iSibOD/T/kchhH6oVB2brO1ndKCNXB6kk0oHOL7Qmqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJ0KeqgQ6OG7+SRY7K7qR0lJu42Pgwjj+DZ3kJz518PyIVdvAjk4hubr74eTK+DLEe0bxzKe16rs6GINqEyFpxj6Hy3LclEgw3GDHt59Zcf9bDkzD9C5/PviHoM/1teKriu0wNVABPsyld86ksnAMH8ca0Qo4ukQmCQIpbuMwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LVcM73Ee; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EZqcg+WQ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LVcM73Ee";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EZqcg+WQ"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hlc481rMBzKmTs;
	Thu, 17 Sep 2026 02:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789604760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y2bda2hrUG6hQ7CFdDx3ecwHTadsaa86mvc+4OAGxTA=;
	b=LVcM73Eem2G3RPSRFOEqsWTEPHOi5cBm7PAXLHakvQqkNTiq+EdUGpMCoYQ8aAA+aoXKEj
	KUVgL4F3O7MjinVZsWkuMcnMXmlMV1MFof4PMyXghZQ+hfXrMd2hQXJy0JaIy+4afJZY7/
	u5ySArX3tSW0rkeV5f02M1KHSnHv6ByLtKSVwj8z5MO6Fgg0Gm8+6BKwxZvYS6w0vf0Kpg
	SIex5ASPOayKrj0gKEbLbUC8AnRw0ODhhQGZ0HMTveazTa+eE8ltHm5eIxqXAiaGbQl5Ai
	dALrODv/HBBesxezlmJDKpV+qcocr1Fq/AjSEMHaqNbhvZRkYbRIn+DbGR8ueg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789604758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y2bda2hrUG6hQ7CFdDx3ecwHTadsaa86mvc+4OAGxTA=;
	b=EZqcg+WQUyvUtdv/nHiupPdm/deT8EPGSs5rb7EK478h7iEZo2IneHSf81b1gRbdFUWVDt
	lN42hhGn/nZ1lI6jD2DWY1VngW2vqwrnzW/G5s2yDpuvHo4cdBLD+DnArJmBc6nTMhhr4T
	UiWjkk+LLpg2n8VN7Nlq3CP2CuhWzblpWFLhlmx0cgFVQmg91EZXq00X0g77+7Ai8lJzaC
	tygj3XrXsgCdhH7cAo2ljESfYJWBILVp7GbRqkM0YmIPZnCkm+ZceUcR2kBg6ibwemoC5U
	OHxUOO2KJ4Shk2MGMmOVSvAppndUOUPsBLaIXQg+RAjJrJkLxK50JsIbn9KMAA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH] media: dt-bindings: raspberrypi,pispbe: Fix example indent
Date: Thu, 17 Sep 2026 02:25:18 +0200
Message-ID: <20260917002554.362516-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5qp9m4k81hdz7qiox1nruwzn77rx3jcs
X-MBO-RS-ID: 08714f8258e988e5b26

Fix two spaces before { in example. No functional change.

DT checker reports this as follows:
"
./Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0 [redundant-whitespace] extra whitespace before {
"

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
index 1fc62a1d8edaf..5c0f2f7b1d957 100644
--- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -53,7 +53,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        isp@880000  {
+        isp@880000 {
              compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
              reg = <0x10 0x00880000 0x0 0x4000>;
              interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.53.0

