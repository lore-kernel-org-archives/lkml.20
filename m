Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039370;
	b=gVgEgKo68ZNlQe350A8j7/Wi2IYJpyVv9GLdGQ0x3ZMStazctIPAlnKs1p0zx8CSCiH6
	 l0Ntm0G0SdpOiArNbHAPW5YCm4Ynq2HOGp371Kqpeql0PttrywT0UQjtig01pQGpVNf3N
	 3uf/41NJOXcczbyYYvHfge7XGQrfHCxrbO/WXSuDKMwdmMsR4QcswL9xaBpbJ+MLS6K6V
	 u9H3a1kTQYec5zqh6mEFBUw2zRmifS7V7yBzq3wzGL29TkTD9RUJdn9CPs1ffX1v24RBK
	 /hgcWRE48MVtKSA3wss43qx7+agsA2a2WMx2OVbswQSNFpRjYHaLVoplYkhGMqqeYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039370;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
	b=mU6RYjf9fykY7JyfIWBW+XKYrEmOTzLhSzHM4Y0eNq/Q0n8enPpX+X+9XxYAVBNwhJpt
	 P4sG/nrEElpmEBxc/UF9GJbkR7WemdBtnh3SyAbsJkQPdu84h3Mr97toMzb/St8xE933q
	 dX0d1c1koTVrbmlQwqD8aCfzioJNq0uRiOWpF8aLJWQKTRGhXlDizY00VHTJLOhopxCM/
	 gRneGVBxvPR8Ib1GoBRBEjOpuHkkO3dB4FLxYDXTVsJMg7E0jeZiCg77zc97CEEZEFU9d
	 LboDM5sbfzB0uMIlOvQ9O5Tp/JaZMTm5EjL/sDBKflN5NIge7VXzptIxCHIGGY5hrsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="MUU4/c29";
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E7A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E7A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MUU4/c29
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso18145395ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039369; x=1793644169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=CAlh/FwxA7xtGfNBtrMxR5cyAdZHrfvoQWqxtXFagyIJcPqO4+y/fOgzJ4rGP/bhRQ
         Iicv3rT7Gbs+yw7AXgJiiE1/Msjh3d3XS4suGKx6CqxlhzNZ3XIjdVYgGOxIWRZCQiNZ
         Pg/yL6EyxsZD3AIRDQFkMIT0+3fFX4/8NXzujjxeTIyMWClixk0Ze0zmiPIQufJ/8nKZ
         3Lx2qRoJ8h2yiqIxcHOel39Evf7y4To34hu99KDuxIid9Nn/h8cVnk8NTECD7nUy1AvQ
         wHTQHPg3ixvF/5QWyktYSO/RzCflmmSFabwOH8TL8ZDvV/k8I5s55EIoagoEI4Md6H2+
         7rRw==
X-Gm-Message-State: AFq9FYIUhJ4BTpOfe7SfCRewps+9IZEI3L5K8rZnDHewq8gUJAJvN+T3
	eXiZz7QXgo9X97V1L1RcksQupOiU1QV2uP943fiZkhVJTOwpOSTO/La5MaTw5xhMmNA69XmhcvE
	HL+GFoau0B8mF5I+/WxyC7C7iyUIWL0beINnukl/13rFRsU763cygoHW06SyOxmaDA7hJEzcZmc
	p31XtWcYuFIQCexDd5gxHPKTUi284hbJraFz5yKMREGyf+i2rAxLAb0KsMblYTpWE8pR9w8UJpk
	Ve8nWuy4Zj9dKZQmzZqfOMEGvo=
X-Gm-Gg: AYBFou2fJpaRjm8+vrHFUctYrWGG9viOaOVCloUUGq0hq9+rc53b7wYo6sJkCIyuaTa
	PrIZoi5DGfE6LhSWmMD4w37B5VIs/HlJvddAwc0g+q7iv/9HGOBnamk3uA5Wxwm1r9ohrV3MqM1
	BAZicfLSuiLLjqFiAtaW3K7DW8RKdB+o9VZa3eXxOv4oseBKeeQip1ay2p70vRnn5daH8dcqNA3
	K0BejwwjIRLcW67lCfdGNGr4S84O+4Ed5dMsyguys56ydNTLF/BTnW9bRfWKO54EiKcmMu10PlR
	o6sq1LiRwbgzR2mi+lrSt6DjwORd2UviRr7cCwlLrDBImj2cpP7HjH+0gNOV+xmblqf66ZKunIu
	MJEXziJ71nklEHEe4Bhaifmhxa+3xXk/2lQEwhmjHIpCQTvBBwDYP+SqaSsWfNLHx2VCCBkYtjL
	+j3NmrA7uU2FogxWzegzhGKtitrRPlADUeMTo/W3pq
X-Received: by 2002:a17:90a:e187:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3adea898711mr6259465a91.12.1793039369323;
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebaf1d64sm2583254a91.2.2026.10.26.11.29.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so2392776eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039367; x=1793644167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=MUU4/c29HqY8EX3beDgF2bM8mqMCuEwDUnaXImyYV5Dwq67/IiP2H4TlXWhDCnQc3H
         iyvMQgxJi1i1U2i/xss5I3MDw8RHv+u54ijs1u+OCgKtPgfNW/Qfj2e3+1AW6ysWo1Rb
         yS8JhtTvGSpBrWdbWMGF8Bq/I9kHb4dZ9WCjc=
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10320933eec.14.1793039367493;
        Mon, 26 Oct 2026 11:29:27 -0700 (PDT)
X-Received: by 2002:a05:7301:fa2:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-369e8455879mr10320869eec.14.1793039366691;
        Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v2 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Mon, 26 Oct 2026 11:28:52 -0700
Message-ID: <20261026182856.3168686-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Northstar Plus uses the SATA IDM block to enable the interface clock and
deassert the core reset before accessing the controller registers.

Allow an optional third register region named "idm" for the NSP
controller. Keep other compatibles limited to their existing two
register regions and allow older NSP descriptions without the IDM.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/ata/brcm,sata-brcm.yaml          | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index fe7f091e744f..98529784b1fa 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -15,6 +15,21 @@ maintainers:
 
 allOf:
   - $ref: ahci-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm-nsp-ahci
+    then:
+      properties:
+        reg:
+          description: AHCI, top control and optional IDM register regions
+    else:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          maxItems: 2
 
 properties:
   compatible:
@@ -30,12 +45,15 @@ properties:
           - const: brcm,bcm-nsp-ahci
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reg-names:
+    minItems: 2
     items:
       - const: ahci
       - const: top-ctrl
+      - const: idm
 
   interrupts:
     maxItems: 1
-- 
2.53.0

