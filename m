Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867996;
	b=NeN8XkVKRMgO2OS6r/1q3fS/F9hN/ari+yORXahmB7aWGQAyB5/gey122SH09crDtsGn
	 9iTK+IEogj0+ojp6kHBvzI2zuBMTbqHIN4fRZ/NaRHtcz3E1B3Jc6+TmCN4sNoP5C94fi
	 3Kju7nlxsucV2y1ZCsBrguoDre+c38ch6V0iEg/SqgGS0XanP08GvpG+m+J2qnh+3Gd9+
	 mKFRKpyMRXZbkpFM3RxwV/PQqRY52tPooUVuQdJkob0Lxq9xRFe+1nsDDkmiPLJZo9D3J
	 RyKPZJr63eLlj6qe3vDo38soz9XNyss8ktblhOvu0+6E5ZqdV1ilFq2BAi8M9aGmDpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867996;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
	b=tCeIo3tJAdVN7RlGTWrAr0hTmvPAnf5u20g+qHBr9BkjtmSSLo2FP7Rmpr0alp0d37GJ
	 BIlhIyJB7NulsGcKVhc/cfNKlnCu/9/BtlhYnkYRg8hsAC1u0msNKJfrb+Kz2NFixO/pp
	 kWD+4Ls0JZF8F2Bl9Jg9SgK21lQKyN1xv1rnLQN0iaNfJ8T9hYqE4Z9FocnA3ZVnZc4rv
	 dpT5gvCgqzjxUnuQMA+0yNSBrUPAM4YgOSB5107NwyuMCWaRBBvnYVQKeSBP7nN2xNoDg
	 I2Lgq53Gm1zhnmPf6BodQgxX2IHkzit7vHDNJ9Nw2pT9uY3YvOdjwoXX/LtCDx9HfoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Zc89Seil;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F60B606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F60B606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Zc89Seil
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2202592a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867995; x=1795472795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
        b=eTC8Ty71ZZRy8AlQCIBV1BFnmXFlxpb8sEW2H2fA2DqWfevrqbHmqHuJHNr5g3esH8
         hNqLzI9Npw7h/ZAFZIh50uH8plUuL8pNspudGth+h7gV1h42OyZrkFlKw9JMnAmkfccJ
         0Uz4JPvHH8XNSdyV/YTCEsJ6CABGwfaH9K+Y5qL+xNB8gTZ+dRgdlb+yF925wGCbpoTm
         6pB7Uz7y/lSPoGO4WmIqo9nFf8caubVSRGAAUpvm3XQ088pBhyJztb3q+dIt8S9s3J58
         tpQ9Sz7CRuTu7YThPR4UK6V4tmKSUQaX05qkpjQ8QwXLcZ8WRT6w7LOZult8yZq+lA1G
         0yQw==
X-Forwarded-Encrypted: i=1; AL+hErFVBUq5p88l6tqNR8SgtqnFX9buE7SIzR05tvEVaQp08E+5TCWn7NKNZEifxeDVNXf32CerSTNgKhSmQpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J+Tm1OwA1ORuXj/8alX0lwfHFL7c9t6AMHow4GAV0yG4fMUp4
	NMNpaqd0I62b6OjrZLMqsxutlWXs9wpByPNUsqWyu6sru2lgiOiKPf8Hxb5wpWPnzHfx29FZemo
	gd55qCg8WOwUq8Bf4oSBbSromxfRQtgt7L49NLo2OaNE7dq4HPjf8aBOLekIldOuGn6tzgrEecP
	0z29vOB+8Exsm7IHyGWV1HvPMz52z1t4jyFmpjXCm5tfbP2QcThh5vY6nMykO9kYPwCSeu8Pgot
	AvLTsQTRTUMAVwQcFoDeMb3
X-Gm-Gg: AZFdTZfeQJWtrq/Vn1Q6jyCQB88auCBZcJz5jQymEH6s4Skr+OSGDheT3q5yVx5gEBb
	3yfY3DJjwlaY59jJPo8LbmwquNOapNlarxP+oe7tT6rpSn+c/LldUupif4IZOBGXRWYLI/7Gwhy
	4sxp40f3jtzLnS8J3pgij0vo3KEG7xGJzcGzDLL+pxd73LpQVDuL24M7nDBYZOSdgms2x+RmBZU
	1cjQmf8HBdGvSnU3v/n3CACW9f70d10GEdhG6A8N0W/ENCvf3jXntcK6U7Fb2ag1XRb9x1ZIJuu
	yE9vlXEcWvhh09n2tgwEwXbNWioJrafyVHz1RbPN2tmm8LYNbLULZ2OFOXL4qk7yu2SJ1wW3/V2
	TMMz2T0c9DzHGYGxexBld7F+tFwR9c/dnAJeevtWxYfhhyhfd3lg+pQhPEvWFPLeOs8q9e8XAfR
	+0bL/0TwAt8wEWlDF/7s2wPDZ5LoR8w3MgE6kuvHr0GY8=
X-Received: by 2002:a17:90b:1647:b0:3b1:2d60:66cc with SMTP id 98e67ed59e1d1-3b1b07feb76mr11134852a91.8.1794867994838;
        Mon, 16 Nov 2026 14:26:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abeb5fa2sm466687a91.7.2026.11.16.14.26.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2463782eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867993; x=1795472793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bH6eRMRI9GI93XxK3LngmN0vMGIuvmZRyEVAjIvrs+I=;
        b=Zc89SeilmA8pkJTOitA3tWQx2H35lHyqkp7mwjmsa+LSMkFk9eXsnruIPJqWvTd5qY
         HHlAIzlV33N9McClLBxdYzPJMqI584oQ5YCAyymIYRrIOPP2ZkPbut0lFgM+wgknNiYn
         ootihCUiItqsD6KhtRguTInxgVRlV6FdR7njs=
X-Forwarded-Encrypted: i=1; AL+hErHHHSElVQszDzEDtT7oWacKeZqXq16rWI5H7lHGe1366URp0PoPWpqWnKtZgIQo4rkYldrvDpXQR6jLxcQ=@vger.kernel.org
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19195225eec.22.1794867992618;
        Mon, 16 Nov 2026 14:26:32 -0800 (PST)
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr19195151eec.22.1794867991619;
        Mon, 16 Nov 2026 14:26:31 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 4/9] dt-bindings: net: describe the Northstar flow accelerator
Date: Mon, 16 Nov 2026 14:25:14 -0800
Message-ID: <20261116222519.1416501-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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

Describe the BCM4708/BCM53011/BCM53012 accelerator register resource and
the GMAC2 consumer phandle. The accelerator is inline on switch CPU port
8; GMAC0 and GMAC1 bypass it. Document the additional port-5/GMAC0 CPU
connection for exceptions that cannot safely traverse the inline lookup.
Keep existing boards unchanged unless their topology explicitly opts in.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/net/brcm,bcm4708-fa.yaml         | 45 +++++++++++++++++++
 .../bindings/net/brcm,bcm5301x-gmac.yaml      | 27 +++++++++++
 MAINTAINERS                                   |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
new file mode 100644
index 000000000000..f744b23433c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,bcm4708-fa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar BCM4708 and BCM5301X flow accelerator
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+  The flow accelerator is inline between GMAC2 and switch port 8 (IMP0).
+  GMAC0 and GMAC1 bypass it. The GMAC2 BCMA Ethernet node references this
+  register block through a brcm,flow-accelerator phandle. Miss packets carry
+  a prepended accelerator descriptor in place of the embedded switch tag.
+
+  Switch port 5 (IMP5), connected to GMAC0, provides a second CPU path for
+  exceptions that must bypass the accelerator, including TCP control,
+  low-TTL and oversized packets. Describe that CPU port with an ethernet
+  phandle to GMAC0 and an internal, 1 Gbps full-duplex fixed link in the
+  switch's ports node. Port 8 remains the data connection to GMAC2.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm4708-fa
+      - brcm,bcm53011-fa
+      - brcm,bcm53012-fa
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    flow-accelerator@18027c00 {
+        compatible = "brcm,bcm53011-fa";
+        reg = <0x18027c00 0xc0>;
+    };
diff --git a/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
new file mode 100644
index 000000000000..76fbe2abf515
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/brcm,bcm5301x-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Northstar BCMA GMAC flow accelerator connection
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+description: |
+  BCMA enumerates the Northstar GMACs. This binding describes the optional
+  inline flow accelerator connection on GMAC2, connected to switch IMP0.
+
+select:
+  required:
+    - brcm,flow-accelerator
+
+properties:
+  brcm,flow-accelerator:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the BCM4708, BCM53011 or BCM53012 inline flow accelerator.
+      Only GMAC2 (BCMA Ethernet core unit 2) has this connection.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 56212dbc9a0d..dce9a88f4aef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5669,6 +5669,8 @@ R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/brcm,amac.yaml
+F:	Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
+F:	Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
 F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
-- 
2.53.0

