Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E65305057
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477809; cv=none; b=Fp/rqm4PazqAaRHfBTbiakFvZ5K1hUpaHVpsvZgTlGzadTFreKPyQwr4Oqaj2g53r5BSiPEnNLjEE3C5IhWkXJITnuv9+jnNN32JfSk4ek10wpgFHJoFO92cSGH8TGhgApaZ0FcwqJytRjS5LEEocz6/4TB8Cb2NUmUA9KgLIPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477809; c=relaxed/simple;
	bh=GNujY27sJq1QrMAiEnc4wu/PVjXA/qEQR0U1YSIve0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BjFVaiuog0s2dKZkI8ybzXGRbPXtMr8Go2Fn1E8SppUmD2fKBUMcFEWnGijnJH6trDkcUR8PAoZ57D5NNif5+/jBuNXL9fsQYHFhU/RzeNwlmJvLnUZie9C2qwfbz1EKdc1CTCLMOwvPmRAEDFCqc6Jdm4ypE44xL7qxtPFbZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=lkTPYaeU; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="lkTPYaeU"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df9754484aso8125215ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477807; x=1791082607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=lkTPYaeUuIKMPh2pq74BeIEAKmVudPfL5QWljFogQ1a2+9xZa0mAuboJJC4p3ubxiS
         F9ynAwY9hNfgrJJuJBBGNhzxdqB/34mPL3hUbwxXZLxbyoEUr8gzIUxqgilr2HPBeeEw
         v9EvSYh4+iZulyMMWKMy8pDinsHW7UHfp+BT4U0i9eeVk+BEYOHwU/k0xxmxqJYc6Z3H
         DVn8RhcNM+FNk+YHheYgAnXQmdT4v4ZHKomMb2Tc6BaH/vW7MXj5U4IL17cZ8IyybUCu
         +yJmK8SHds8kCd8B+SvP33GZwFZJAfS/gNIxGNqlLTls78mh/beunSiP1hATnl1CCHcD
         wDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477807; x=1791082607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=OZrECuLzFbnrqQnw0W2aldczpaYdhGs9y5h2NMfqRMJzwBieAWQcebBASiMxMzMzh2
         0bpgYssXpzKaZiH9tdYSOdTiyvSWRvHTUPS2T7NiGnjLfATXBvGSFOD1Ttw7mc4wYT3m
         1ik9K0kvIQmAYEkH5HhtB1E9E3ra5zFSULDMDkV1BsrNjiYRFIqW0TvL2jDLdEJ4EczL
         xB2f6Nm23C3NiR6v3voKCqTxLnw/cYzf1iFOsMqMYdwHSMb5xBoZeiP/N0PzTixduwrU
         rIpS9EmwYEdGDI7afmiwhW+2sgZ7XC2GfvzzFR9881ulJPev4B61aMEYDk4+q+4AFMry
         BRBg==
X-Forwarded-Encrypted: i=1; AKwUvBycyAuZqWDFabNsF4Y6eCosVl7HXsA6oEFyjpYnb8PERSclgOKlGANajXJgXXDlRs4bllKt5ACHwvLo4hE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdXZITl3jzf2Mf3y/jEODsyRVRAppqp4Pohjt6zl9uI7j4DIFT
	YTSR/XnhvIo1Chkro4+3GnEFgN0SgFNa5wH/4JI1VB/LHCC01HgS55+H0fD8kRJoaTTr
X-Gm-Gg: AYBFou2O2/NSQckTebN7xKnXUpcB2LQAgGU3yNVYjbCz99jJosVhSKDXZp7eRqF9YeX
	R7a7kxxKCTaX3PFQu9wZ3wmh8yzEDcbopAgFzcllrAw2K9XaV4yM9CuiVisV66PtXcz0Rot2PKX
	iynNs4wAQWudKA5W8fSERHvj4NmUv9xLB81a1k860abLSqcpljZnL3qi4LsvCLl8YgQAofj/UC7
	DjUGE7X5WRyDw+waszRnPSiUvL8exqpsal4ZaeKYDqhGF8o56we5J/V6368X7SSoZWR4y9u1acg
	+Gd7rHyIeRfoabYBrb1o5Z3tHv3BXnMv2R9No3EyZAoLpR70PEIXC4PEKhdQTIdYIHDzkPvlYni
	aCZL6b8WA4MhZkL5yzs5dRlMOSoXbybbYmVAVkwqYMv6yX7w0vlfmOFxFYHAjTrcaudOHFTfrvV
	T+GpnpSMEoqHM/Bo4skwI8mxjFhUWTVOavjODaQlq2PiGlBowQg3EGv/q8CQXUcP9qeA==
X-Received: by 2002:a17:903:228c:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df7dc41d3cmr92788095ad.26.1790477807346;
        Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
Date: Sun, 27 Sep 2026 09:56:25 +0700
Message-Id: <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The D1 and T113 have a hardware spinlock with the register layout the
sun6i driver handles. Add a compatible for it, with the A31 one as
fallback.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 584cce3211..13f9a20ae1 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -15,7 +15,12 @@ description:
 
 properties:
   compatible:
-    const: allwinner,sun6i-a31-hwspinlock
+    oneOf:
+      - const: allwinner,sun6i-a31-hwspinlock
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-hwspinlock
+          - const: allwinner,sun6i-a31-hwspinlock
 
   reg:
     maxItems: 1
-- 
2.34.1

