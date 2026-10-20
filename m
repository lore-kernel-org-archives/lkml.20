Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514907;
	b=fx1VmSw4NvuDcebXlxzvVe3BQQ3Tv2PXaGXx2f4gAijFFx8QbebumAYDNyGBrhuZ4FeD
	 Lg5w8M7r0RWwkKz7UAf71bNho7V0+J/XOYD+P3PrKo3GnUCBrWUDIQCKtZnLv7mHI1wGU
	 tLCOLRZG+Wv6RVJAdk5syynI552N+Iq8ChzuJF58/13/kp0f4MOdyJmkpXTDsDjvVb1c9
	 8E6aiD8rliNfQ6T/Rm3TOuj25BdyaeucyyQmPwMH53L8fVjsR6Az+kzkWoYVmNb9AGnvS
	 +vAO5v7QH/+KpSGNgG9/IlVZFwnpwBXEAWCjx0etZT0NFtOO/ZgBNxVt2la+feyRRog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
	b=X8trsSVBXS92moOO0OTMO5GZ44E/kKViXp6w1sSoKh6yA7WgeODlfXadszgGH3AfHCY/
	 HP/Z+64hPXk9mh1vuVThRPb3PEhypkHLymjQD+qHjd3kVyV0paxHnV25S/x+ubiV9SzCN
	 GsCezgfqjEWBgI1Hmqe+m3IA04pIvtMDUAnmf3dxIhYa0v7HqVjb2TWxKbdfcxtDHLY+M
	 rFj765lj/N5CSB1rGPMw6e6UG/tqszwPMRT6td/cYVQ8sSU7GfpUmxNNwrvKLhQm/d9TH
	 3M7q59QsIPX8C7Nc0FZiRk4Xh2RvLmUPG+ze0kKpFYpmKjLcYaOLtXo1VZaAJx4gEtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="asN+/mJc";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA060A2621
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AA060A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=asN+/mJc
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-16079d54c17so756041c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514906; x=1793119706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=asN+/mJcU9zt1+Ew7cYXC5xXTLeYVwsdj8Hyrtz0iXW1b3RBMxYmDYl514VEVie10j
         82FYCcHC1M8nJSu2OONjjyOtcFC6gZHNKrYXJHr5nMiVgjLkt2AHYzcinTJTpTAweINn
         ceiDB4RwrIQKYjDxEcwqOuQ2zEIMM6oIFQEaTNi/fjcYZUz/8nVR0NcwsPlUOxwTj3rN
         hffBkB8nTHsiH2ET11kFj05nJQdp9fp01OcFNOs3IB4TlKp9hJk/JoUemW67NNkHeiPf
         /HpuClRnaj22CXs9FsDO6YXGCR11O2QDe+IVb7udqHkzgjQkdhPIoBORX+Cc/gPRmd7x
         spzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514906; x=1793119706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=ERTEQFVflsrZ28yJHTbG1CnxhcpN0Zikyz2yS+d+ADaBFLtcGxEdEOZ9rk0Q/xA39Q
         TpwaUFSgvzr6rNXOWDeFaUQwP/vZIcA2swnaH3ztH5IliPavodYLdby/tRZ2akBsaUvu
         xaGzV34pQzdKsJ3eD0RFG6zFQXIRadJj0qgi/0S5pabCh6XLUcwELjS2MUQF7UzFlVlI
         zOsdbWgCwKrS8aKNj+CRkQLJWbde2o3LEheT42n5YbXzQmPXAb44T4WFI905+YXnKCaJ
         1BVgSwbQIQbYmTYviD+FMhZ+vagJr3N9R/jU/bBc2Qqkpz9WYPqea2cIcA4xAklurXmZ
         dUjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSe2xJnHaWf19//VnIpahXFC9JCKrKAkBD3i8lTThHcNCcIzI0eqX7MR8mSNuTXidtR0PIRP5KjUkw/VE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK48X6roFSQNciBkfdc0o/l3rRD2RXEpJr7rTH84M4N3/AXr0Sf
	p1p5lSyzifX7KCCH0yyxVHl7ioLWvGrbEYoGpKxlOqj3IAUzyEoo/O2U7QxHyVsCQVs=
X-Gm-Gg: AYBFou2xLu1U7gfayn8TfFtYJ+TVh9D7W2hm/xqSESKlQpB+xlXB7A6H7W1nrvQpiKA
	Mv6Jb9QnSvi12ItiOep1zw9GyRfrepinLgFSLBCF7g5aOCVLzWNFhBo3v8Eqd+XxZP5ZeC9WUFJ
	eA6OKOvrxnj08v6JY5ZAE8t8565qDLQUAhzF4gxdWepgbbBb1ogYzcz0c96bzBX2dIdoBmovqHw
	NSz1EODU1R0rIXvxoYYBhldC4Pt+FT30IDT88N9Aw55VXB179U/DaMINzLuEJUswmvwbIYb4A2j
	gCg7a6QsYSvDoy0e5GaV7gMsU8+9G7ghvUpy6byO4t0H2SPPevvccluN2WDdpMANuGbW4grMCjS
	C5vHmikrEW5nc3CvmxnUepykKDlMw3dQxbAkSe8Wd9rc9M27duSNN2Jh0vLpl/bB+rXuZk3k/j3
	Zz/9d3FAqEq0sUswdhqanmLdDVWlesUxAb6kczUNxO8sQB2A9MlMv1EULRAMVhQfSk
X-Received: by 2002:a05:701b:42c1:10b0:14a:5d07:9b with SMTP id a92af1059eb24-1851310b0e0mr15711482c88.28.1792514906047;
        Tue, 20 Oct 2026 09:48:26 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:24 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:15 +0000
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
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
Message-Id: <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=1668;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=vv7jc6T42fhaJkWqiEeKPohXQukidcy6joILhcZ0eqE=;
 b=vd9Mh9E0vGBxVgQlbvK8XjOPWj2RIAXhnuQwwJjS/QF1HgV7E52cWY6JCExf5hFUgRXo+D9fz
 gqBuJKTqEPzBceMMK0WoDNiGBDb3oSPIX7d+GG85ii8oILKxpA62pdr
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
get their own compatibles.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 42527c7ee9c8..73bc8c130802 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -466,6 +466,20 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1006-3300 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-3300
+            # TDK FS1006-5000 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-5000
+            # TDK FS1603 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1603
+            # TDK FS1604 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1604
+            # TDK FS1606 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606
+            # TDK FS1606-0600 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-0600
+            # TDK FS1606-2500 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-2500
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.43.0

