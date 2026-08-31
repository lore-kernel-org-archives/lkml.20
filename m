Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E3E3A5422
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151771; cv=none; b=XeEyljpHdtyfna/4GWNeICs4x98grfR1RhNdqlGTlpAYsx76u/OPhNBmL2dOh70kNrqorO8ZOvcskrLpz74w98bbDVs0PIQ+xx/lC4wR0EGOND8ExeyqKAvue0stkbcO05XgkyuZJoKUa+p5Vij70c/tSGQ9OCK/NPr/+EgqD9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151771; c=relaxed/simple;
	bh=xfLwN1G+HlsExvrUNsOEe+WbN3dPn7HjsbyOumjvMds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grwLFcufdH952Nf/z8KeTQqfsDtV2WBMmK23w2iNgMwveB9MuIlHTSZSi+nSUv2yfoP2ZualOdtRlviXqrI6rK4TIkmdwnaFgTVz4lPPUWhmG/F0aq/yOwrRQaIYQDzDV9V5jjyBweqyLQ2spTfXL84v4metgQfRJyCisjjhd1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8wRv7Le; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8wRv7Le"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso2097911a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788151770; x=1788756570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YOr/QpJoSwvrQj9qbBH1jCsIxrm/W8lOOhFj883C40=;
        b=i8wRv7LeHbFBTZEnjcyt7BJ2gvU6Pza9FrQN6TnwXXEqgfHLoPAyS2RZ1oNOs6gtsu
         hNTf7WQ2AfbvTczbi1LIiPoxU46wM3Asz3CeUlQmACHVEA45KKIfnrphwsNJHpfa9ZRO
         xsIs4g/a5UYRqcdpity6u+qd4i2kS8HWFYK3M0MwJHg8oWPfacuVf9CaEZ+rAvomtpTK
         shMLs4sW+fc0Fcs05eE7Ny0UTUBUbZMdF10QpmmMuwsGUqoq4VWDZvHBXuKEp8Rt+f2F
         ebswOyAhCq2/VT50TX3+H4uxomEHXi3UThJYJn3xZpWA2g6Ak8WMY8pkCfB/j6OdoNKv
         HmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788151770; x=1788756570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YOr/QpJoSwvrQj9qbBH1jCsIxrm/W8lOOhFj883C40=;
        b=o2RkDjttt7sUSOV/s1kMsG0M7SQuVe0W4XqW6itguO0aKr3ZYnpkxL1vQc1Nk5aSHl
         IUDhxlt1yYaK0MubWeUAq5k4ojt3p+uAKFWzhJo7S6w1M5tTOkIV+zgVKgajGFncJRC9
         9x5Ka0oCqcIn66UaVkl84FRVYjWund6cM44/sULGAs0r/sN3mdjYowL7nBtrCWoKF4Qr
         odV/jod8KjRluidil41HSLlxC8y/MzvLGBmu0jvt9itO0SikiqdIJS/5CaN1k4v78o7D
         lB6K6qJ4CNcm6g7En3WqDGhLQe/2qWag3mKclLEu1SqHzpCh/mLynHtzHGQqE0/HnTZw
         +0GQ==
X-Forwarded-Encrypted: i=1; AKwUvBw27VGwuKM4kSQXZdSqQ+G0yRSfI3C6wljYV1rV7SMNr5zYXNPFccxA5I0QNwu95MQ6h3F45I6nM8Y5HpM=@vger.kernel.org
X-Gm-Message-State: AFuF++ky3kDjXT8M/9Xh1YkIT+Rvjmx1Tm1nhkxhL47wJtC67jvk0tSv
	50+Lq/79jbtPiGhkhM2H8show/re/qQYS3wHkILGyjjl6XsaN5QV2tjB
X-Gm-Gg: AYBFou0SwwhigeWVvtKOn/sABV0cZrgglkqV44CbtCHxy5IjqtHYdF3cDYySkKJBwL8
	CDBjzCAD035+vMRlUCYnTZOOoJxsnpjX0CcMhqrI+Yx1BDyoy4iaGFl70gfnf8wtIgF5kD0jQjz
	nORdk9w1Dcui+d3C1LH+xoL0ohalzCBIVzRfdCAT+NzyT4SclzV1asLK1T2WPoBbv4845KkUPVl
	c7VFnWBiR/ZMmNhLdYWnry53qk4C7zJNCJ/m3yFJKD9c1F1DPurwoNMD1UzIUy3hbjYZLCOA8Iu
	T5Gs0aW7CKBDDnRomBhtJ7PEu5PGzGql+akkSWhv8W52ehDEe7IxrGk4nOLw+ggX3ilQooaAy/I
	4klaSRPTOqk21Vt9UOp11Hsw0tLevwxOAuDe+ofkjDMJz4LH1TeuelkkGFHKZQtsy6bCq1cU0si
	boTcZw1C1us8yiWCjsyrTnLmVftX9KwkT54E1f0bTQa3hJa0/f2a4ZFb4KqgWZnZR1dbcKw19sJ
	L7oymX+qBspoA==
X-Received: by 2002:a17:90b:524c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-398f7eeed6amr1371508a91.0.1788151769702;
        Sun, 30 Aug 2026 21:49:29 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4cf:2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm19345763a91.8.2026.08.30.21.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:49:29 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v11 5/5] dt-bindings: net: dsa: yt921x: Add LEDs definition example
Date: Mon, 31 Aug 2026 12:38:58 +0800
Message-ID: <20260831044818.4103477-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044818.4103477-1-mmyangfl@gmail.com>
References: <20260831044818.4103477-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add LEDs definition example for yt921x to describe how they should be
defined for a correct usage.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/dsa/motorcomm,yt921x.yaml    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml b/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
index 33a6552e46fc..93ba5b181205 100644
--- a/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
@@ -21,6 +21,9 @@ description: |
 
   Any port can be used as the CPU port.
 
+  Each port has at most 3 LEDs connected and can be declared using the standard
+  LEDs structure.
+
 properties:
   compatible:
     const: motorcomm,yt9215
@@ -59,6 +62,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
 
     mdio {
         #address-cells = <1>;
@@ -113,6 +117,25 @@ examples:
                     label = "lan1";
                     phy-mode = "internal";
                     phy-handle = <&sw_phy0>;
+
+                    leds {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_WHITE>;
+                            function = LED_FUNCTION_LAN;
+                            default-state = "keep";
+                        };
+
+                        led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_AMBER>;
+                            function = LED_FUNCTION_LAN;
+                            default-state = "keep";
+                        };
+                    };
                 };
 
                 ethernet-port@1 {
-- 
2.53.0

