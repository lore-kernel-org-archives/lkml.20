Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839B57C71C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194994; cv=none; b=CemCafqAFkz8Wx9kWix2cUS0MBmqQVwEZ8sQ7N9PPtJiTs5BGOOG2WVDysi0xOMoPQ/EIOKgBYtrnjrjTZN5HAYgeLQbQTunDf/6BjkcJla0G6Yz/2yOmCSLvIE76GIciRMI55IwQRkK3Xdfw5uFUjFMd7Fj8F0izstCIz8+A6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194994; c=relaxed/simple;
	bh=IKu+NW7V12nnMBgKKHdP7rj1fpU2GspG4UzSnncTVMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F45cev1/OuKFqQ0N59sGdz5tmR6fJPcK/3AZHvC2thhqSZaYFl89gsbvIsUaFi8fRB4P2f1tTffZkO5iMM/gPJtcRexmuH58E63Z8nAouK9vKUJkZJs2gz+z67OWVvy3eEBI4F1H0dZzTM4Kto3IKzYNi1MRsVHoXeqE3UhdA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP3eZawc; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP3eZawc"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so200409166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194983; x=1790799783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=VP3eZawcfCqhXEKT02y1EkPiImNqUQJFySdTatlLfPJxzoQjIhZS048w/xfRVLz5Gs
         upkVCy4FQwfQXVk8+p5kZQG7aHYCjikf7iJ7elwz8XC1d4UDuCb0fgnertOy5dmwF1EG
         BDfzjtFSgVCjUsQIpkQTfAKhvNVY30NIJNQjyygyeFksSv6OgFBdpcHEKyMuBOmdzRSa
         RXKCyVJSeOA+/uWUrmUH4+grPlg5dN9TqmGCWftv7q/qB5Uh3H0Aap5w1A0GBLzyCFZ0
         iucr7mIq+0LXzeHw+ZzInHZFAudO478yw4YqhT4NgtUmu5dXNmlRyRX8TdNLgCh9CuFe
         7hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194983; x=1790799783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=c5WVaMdZYitMiXnvx/H2Dx178XbtSpXaSai0BSMyJ6NWnNxOAafCgSNGhfdXcF6CKN
         7Y4A0I9tacn+WWSsrEGheNDYPf8aLfP0zaccBq7Ki4ze8X05QaWA36NnoohhJhSABWd+
         P3Vc1Q4aZixFSVuxiB7vSvrh45QBjZncEl1Fkx+e4v1GBjBSRTLOkGUykdvdSP4wR1o4
         wV09ivgU08RKabOGMQg8tYodK0PpmvCy7W3xFRz/N/2q3tphNdMLYA2s1ExK/KpKqc0L
         A8QmwtEZVj9JwqCjyc204EN7cEq0yGDgHy8b9arAb3ltRpiyEclzHIKJ+JJEUWqc5feV
         Vahw==
X-Forwarded-Encrypted: i=1; AKwUvBz9bsGSJjE5d5OG2NG7/dmgSurfz+g5WPA14LjoWaa02JjvVRp9l86bsw3CfbKlRsz5GjLxOjlyP+DpPeI=@vger.kernel.org
X-Gm-Message-State: AFuF++la+gdLAgkorLD9sGgyHa5o1NeXeeF0Du4Pd9xWLgDZUkQ1I+xd
	3cn3ulm9DxDUgKfp3TAzsQoAyeDFnt4wLQ5x9KeRO+tfHt/kKyAHYldU
X-Gm-Gg: AYBFou13DqWGLReXhvkE5s/7tHQkRhQl0fsCNorMuqWxRBBmiPOWvQwL3YNE1o257kt
	czMjVtJ+dguSvGgUuPSCm6WgQrcW422QEdVzyYuUoVuMXmEbDlAoHfbaVMQYdsNGLsf6kEa/ec4
	Ym//NI92nj3FkRzNvo0KVevz+/cW6iQgiEqf5TICvsbi60To+a+5vEgVS6eFOaGvPZKpleawB8p
	qey3RmHoVoBNrZo/R25emmsL7oHXn6fmKqXdoRB/x1GrLZbV+tljunT2FqKTfJey/DBm2rqZkht
	f/TlCDQgD5Iyi5NJk3c6cC+tGF9+vt6/KrDwN0KPVcmITqlBt5R5NFExck+hGTOSyGry+npF/tl
	rBshCtBT61Lo4/pcOyNJjep5xTKKWoL7QC+0WPQygCNDwU/G+yTHIHkTX1mNLFbNG6br8NV3r6G
	LCC4ZFSVAXZSP6WoSETGKY/HLP7XGrFQ1KRPT3ojFQ16posqvAg7F78ImgC+UMjWZCP6Nt6cVbS
	CguUUJyURsYZNTfoYlcAWDF133qrjOq
X-Received: by 2002:a17:907:a893:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c2ac262664fmr19261066b.39.1790194982908;
        Wed, 23 Sep 2026 13:23:02 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:02 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:55 +0100
Message-ID: <20260923201701.43391-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..1699e3576b91 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -162,6 +163,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.53.0

