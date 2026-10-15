Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0352123E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070042; cv=none; b=jT62fSeL+ZCnAD9AV4PL1mXjo3iKcmWsV/n238x4ivSqpzKKgfWizwejkFWRq3irvWzY3AUIVCjazePWxctrS9dWKAcUcJ1qDlKa9v+FXfFAXPynZFkwxB17a5yjiL+Z6DYmAamS5t7OwE4bhtAsCuNcIZYeeTnpyBt0Gn9mO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070042; c=relaxed/simple;
	bh=NExAlvPnpeNrybroIvK1yu+2PtogQY+t8w4M/9D2m/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2YuNr4sI5u0jh0+T7rtJNxr2xNrcq8mcPiUeFZJvAFbaCl0e6aumqD69pL//zYeJ+j+z6en5TuOWSdUQy60d850ae7ev/zh5kt6U3cezI821ZjRv1z2+0Ma8k5RcLPTxG9d9dGHoeKeOw5cEXJKc3SCk1KPzlyCKhgXpQuKVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Eh84t935; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Eh84t935"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso9485715e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792070040; x=1792674840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=Eh84t935TirOHdctDY8yRcDoMmP0TWqA6sK3VNRSC3uh9WmaepJGwHVdJ99/0B7qng
         9M4bvKbJxVc40toRA8HIYzUij70oeAGPfb/Os7tCjwA6auOSS54bb/FfCAZGMPAE0CMx
         uR9p6KHc8yCzl+Ufo1bT2t75zd1YJ2oXZbmHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070040; x=1792674840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=iwaT/Mh6lma52aP+6mAWWCxFmWhIlGV/UgNs89WwAW9/piw/r3NOKmja2gIpsQU7u0
         eRT9P7cbjj56hmzjHYz8TDdrwlmTZOE9P5D6ruD1i50RJLX3pxL4tyP5F5kQfDw2Gfhn
         WwwGHxMYy8P2hkdZQwSvz3V4QKZrA+I0Ku+Pjv+h9JdqTi7QPIQwGK3k3QzqI8MHQ0Kw
         a5i9uV+zjgKRfvbulTHGbUxgkkEZKjYJ6Qx2VMXq7yKRIvAa3U0pi2ygOeSn55gct3Yu
         Ig0++X96GZJ/47azt8BQa6HAD8bDQbgaOBCaZ3Kxm7nb2upkGXubIzivPs9nEXsDe8PY
         i66Q==
X-Gm-Message-State: AFq9FYLL+lbvwJlAmIjJko8S4gQ26J5WGAM2ZRGg4niS9zbPJRj9igBk
	s9f0CJYyB9IBZ9QoUiH+ThbKkME5XTj7omZ3hYwb1grt5R8gOZrRrki8fbawRE03oibBs5YAGH2
	1zncv
X-Gm-Gg: AYBFou3rxmPvtDMeaijBM7DfEysXFjeh5rLNBwZpxYJ/rsm5zIR9iHwI9/EAmd9Tc92
	Y7JN53S0uL5aV5y+YFNoPeAhO6LXKBk/JF2xb+4z6EOBNHOkYAfk18oC9E+s8uNdaq8pssaHzGi
	p0n50Z+wI11KODdmJl1giDSvGgKOK3064otLaCyu0ZbpAbSO7Wd06ZBp6zog5QQa0LwLBz4Sj3D
	Dw0wXynzp1qyV9hbPjMVjh+8BdeoZqEkSVduc3ggZWkwm5UdOZrRlOdSdrunFyTHM03BZusx4NN
	ZwHGnIEg49XIZ4PIUr/QAJddaHqjV8K1cIO8W8Y13GQg+d1YH4B7uLoxnVSRnG0q6GrBoLpwvQ+
	hyP3DNF0yEVSBDwzUpTMtUqAr/UTXvSsLW5QVAho6LuDjVYIRaNCxJGyzSjWL/Kg55bV1Lt/YEt
	lWD+imwsidhza0pJkuBYX+5ad9cICEwoBXOaq+E/Z8Uqo/bln2oDycgNTPJLhRlB4DwgqfdcFh8
	bTxI6O73wWkKL75
X-Received: by 2002:a05:600c:524c:b0:4a1:825a:5726 with SMTP id 5b1f17b1804b1-4a18e4aeaffmr362526845e9.31.1792070039664;
        Thu, 15 Oct 2026 06:13:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17807433f8f.36.2026.10.15.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:13:59 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Thu, 15 Oct 2026 16:13:50 +0300
Message-ID: <20261015131352.3624327-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015131352.3624327-1-petko.manolov@konsulko.com>
References: <20261015131352.3624327-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..b67dc10b0a11 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,socfpga-m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

