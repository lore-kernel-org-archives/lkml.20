Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762714;
	b=H3Ts9MdZYwz91A7TXjyp0/6CaftMyG1uOP/EIPW+KaC/V9vHd1AakU1BBmRGX5Tvccri
	 zvJ1FBI4kOzJi/x/7ODxg1DOoM+m2gtj9rvcTt+GRbVb7CE16OslSwZ2owmm0EO0HI4s+
	 qjCi6o+QHHToDLzgarokk1wPFYWMa24ObXAMgf9b8y853nQlzGyWzWRdONnvawwX1O4US
	 6eYeYUPT50ZCuiZfy8yI3V0M/Ge71cC1M2zm5bKgyVWrXbLMeGyMb+MbPgQNKvdp5ms0v
	 NFQa+OSuPJqEWYNUlNGPwB0sHTSlsoom9CF8vAjia/i5aNRB8GIy37ruhgm87siI6Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
	b=w9IKHjlubQLxatPjcIF1NuVx9jgEJbPgLL8Ct/8qVT9sFhmV0PiIqbBQ5CsBLDmrCe5z
	 9q1DJI5PCj17vvtUf/qu5YKRtKUs0vNwfDYRPPsBwz/zg/jXziWgYX8rQYoGitPN4QHd+
	 nphUUm08eKQ9dQlSERVay7DObB+t6ZcrVWnFdCNXD06bwBWvnucSRGANeyfjLbYGqKucj
	 jHZpEa51dFY9ddkhQvUsZTg9QQCd8jV0ora3oEtSVorATDC26cAGla1saRj/MbPx7Atqs
	 75uFuenAWR6ZQMDRBJLnoCXd2OaB3i0SZM6jhWbukTOwACZkWAnO8SGL/toN7bPcKFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=USZuPcoD;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E4606A333
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417E4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=USZuPcoD
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso13028835e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762712; x=1795367512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
        b=USZuPcoD4UmCLPbAp2XJGeTHosy1JzMBcXrqLwLTKLP2PFiFqCIMtw0Dxo67qRHZla
         dQGXfwMm9L3rZGWHDfQPaTUKiUsbIW4XSM+ERCxfC3tJqF4yR0rTMMkATwDE53M68HLo
         9jDrtHt9h6zhr6Vd3TcYaQv9cmTuWoVJDV97NEPxwqQpTOeswOyfMYYsISbvFQpjgpby
         dwamXmY+AxPhwv2Yi/fiqHZ+u3aTUsVZNWzntvddUiMcwYN6GUNbMdJvPkr0bhp1q4Hr
         tOMxGV6Cih9L4DJzCXH/gUVTHUvttsyBbWDj9ybBegV1V+Rw5AD3Iq63mchRaD5s/7e6
         7+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
        b=G+YId4lAbnLLc1RqPbRV1V1sELCNGhtlO53dPFQPVqGzD8JMcnxPRYbZYKhXUDMJ4X
         h2Ud6LpxLh3/ut+GXb/9YJHT1/B7KP9z99fRt2BKhXN3SZv03ZRsntE4udgGcRqsPQJa
         Qic7kMId70plwjsnunpVf0sQxNHMtjDmJ5afSfLIM5WNvwFwdpDB+73oaqeE8ZgqSDXy
         xGWYiDXuUWdvEJVC6Z3kn5DU6HWlOX9lxxZwzfuwPESfWaQOrIskk8NrRd7ITApHO5Vi
         JaHzPMxTjh1FyeztqrocGq+76MiCh4GAzC+GMyQg9xZCWP85j4m1oP5LTo60/yz/doEF
         Y+mA==
X-Forwarded-Encrypted: i=1; AL+hErHDkEMlk4KX0vZoM/bU/mvvqkw0fCMWLYL7Ogggn3W1SG7nf0itqzZqhLao90P9JcqEhZtACUlKsTKPPaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IyzI58LoBooM5EnKPs/rh/9vYxaTeaztnpBh5m8SaIGO3Z9bU
	t5/6AgCILqlMpiOZps8SkOgHXuKPMMiwoKBP3a8qk737oi5dvnjX4hLvAFDd/7OaVLo=
X-Gm-Gg: AYBFou2keoz7Sn3rJ6Jo0riiH82YQgKpiMCVWoEBqecdZbHnZvtW4S1fBPNdJd98fr3
	cu75d/X6AAxFtxhc/scNv5tRuTeenTSoo6r1ao0BHipJ1hY6GoXcpDGn3+vsQi4whzro91DDfF/
	LIXh3lFL1u3kyXR6z2V9Y/PDBAyZIoAv4n/1aJjfR4BHV5pKRC4e6NeB35ZcYujS9U1CwTkLrxd
	vGSOjtT2CR7Sn2WsAUAYw6SSnwRU3A+UHRU7RhlHCHahqTSgQBOqbIAAQVu9hNzRdxJhND7ENgg
	7zwGmAz6RBOp6q501Qq+4pwVaTWz3dOz+nYGXWAWbrKvzdgj92oZaS/W53kubHsmBS9nV4cI3IG
	jELqL8xui6dtpw36IkNLsc5P6DRhK1ARWL+H2LGmZs1N0vBP0yioc1oznzQau4rB6HXxulZv/hq
	ii6MXR/7BXRHyog7a1xVNdZEqz1KbKEfro/L05JAWFbnXvthfVCcjVhSG6/DDALcFrs5V6FigJi
	KriufIvsFfWJUrFOYSHCgr5pcDcT4CHSI5K3yfkN4RRE+9vwPhgFrapGaX5giNe8NMe3lUVxtoG
	L3ouHaU7KHhJPQJ58V2XpT5bZ0TiYsKJj0OFptpw+8xBfE9Kqkrb2vXb73IuKQ==
X-Received: by 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr83499815e9.20.1794762712411;
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Date: Sun, 15 Nov 2026 18:11:44 +0100
Message-ID: <20261115171150.64431-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
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

The AXP2101's interrupt line is optional, as for the AXP313A and the
AXP15060: the driver then registers only the regulators. It has no DCDC
frequency setting.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..024de5553d6b 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -69,6 +69,7 @@ allOf:
             contains:
               enum:
                 - x-powers,axp15060
+                - x-powers,axp2101
                 - x-powers,axp305
                 - x-powers,axp313a
                 - x-powers,axp323
@@ -85,6 +86,7 @@ allOf:
               - x-powers,axp313a
               - x-powers,axp323
               - x-powers,axp15060
+              - x-powers,axp2101
               - x-powers,axp717
 
     then:
@@ -108,6 +110,7 @@ properties:
           - x-powers,axp806
           - x-powers,axp809
           - x-powers,axp813
+          - x-powers,axp2101
           - x-powers,axp15060
       - items:
           - const: x-powers,axp228
-- 
2.39.5

