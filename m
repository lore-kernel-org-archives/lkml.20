Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B5A4BD340
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004696; cv=none; b=f9FgrX2ySui7K8e04sfLGD9Bj6zgEUwpcBoqT0wbMXcnEZj94D0TuRL4O09l95oKKN5AA5MKNsKT0oJtTdf8KrO9zwnvvjHRiI1V8jU6yvqxTPe+G3BiC7Lqw/gJkJ6SP7lVIUK4EaQ0snKio3HzDjNMzsEr+357+4qzn8QDXOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004696; c=relaxed/simple;
	bh=8UIbOajv/WeBQjxhRwQ8WC4GpLGZ30N+4iDWN0b6s8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CCgJVAVo/vEWH0Y1Nxk8ZguKlk+K4o3iRjC/TqEUMgWUNxmDpqjufCKNpR39B44mJc3fO0+TWo9ngk8rqIXe5kC2x9fHF0Lg15PFxKIHXo4q+qnREomy+9I8vmQ+JGd2OJk70N1TvxtGYP9I6wr2zfJ642E1cbRk9Viy67XKOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUeooN0f; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUeooN0f"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so2065603f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004691; x=1790609491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSFZ2mFA8VKpkq2eozLxDfSa3b2z9uge5jLEZ5PpWWU=;
        b=GUeooN0ffnbmXXJdaVioAWR5pLSuti9tuRgT4g2fCmZ1RnBFh1MQXyok3Ad3y8VPZh
         MxCz/O+1v0vczlDdAc78SmE5QwgbogQi3NIHpS2yJxGT450lYh2EfLuw8uiVqsZFYmjq
         J5U3BxmIDFNtMvbRyNUD9L69P9TF03crzvAGXIucNwOytX5y32ia5Awy/CoumjOhLZ+G
         NnknhjFIEX/m6TPb1X/zuNtn9Ld+/9Rdn7qg+UKEH5+MRdHJ+Vx3B2zPuvKdCk6o87L5
         sHAT0FYU7i7sQYxs1iH4P+Mkp8J3wEUC53JytVJG2Bw0q0ks3gNTspo7s3uxrha+Wuuk
         QpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004691; x=1790609491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSFZ2mFA8VKpkq2eozLxDfSa3b2z9uge5jLEZ5PpWWU=;
        b=a+GLibu7CegHkme7E05A98XJVLBcTvex8CXGOGkJJsT1NR6AQbjh7g5Hhr2ol8AT6d
         yBhnrIO6Nysft26ZADNeqUKqEHfPFb2LjqBHrX4vOI2FD9ixppp0R+rAf2gLcqs74Bxt
         22K/dp4yFG+CE2afZaMQkg33aAcdyLvGVG2ap7EP0a72KZeGZe1ANx0UmU52yy3vdIdq
         q838HmwCsiZvYajGc5VWERC2QM5fy62HO6qSiNYVZoZoDvidv+G3g3Ov/Kq10dRK7e4K
         HzpUU6HvSZVhWQCo6ER4qe3u44a1RYJwtHTkvwdUKXUHEmRaRJnBurg556RtXXqXsAFo
         r7iQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8Bu0OOU6Qzxed/8ArItgoJv/pfra4ucQc+LzWV3ZFZjBIH/YpPYLKd1TZpTfoh6ad7KAKZOKnJBsUmsA=@vger.kernel.org
X-Gm-Message-State: AFuF++kpBhgJBaDo6x96W49lK95wCwlHKxGIta9v4wtFdhW79/Swmnxh
	oWEdvqe3Tzgp1cT6zPA5DxTA6TckW+FGsV9mNmjXTbDWX7irfFMru5kW
X-Gm-Gg: AYBFou1VjPxBCTzJGi71R11jTeSP0m0UAOperbDDk3aR+buVNIOiW1+/eDaSWmrNO/1
	k2UossCQim66gu7DEDYgY7rfbYjB8l3VWoE+pgpox6tuyTmwo6S9UAascNPBgxHVGHXF6t6sg4l
	7mjGZOSrciQF48R1E2zaPGj4tI5tsZqMlklUHG8KRXzLMyAKV0oGNhLavBIadP30b5tpFYH0ifR
	CmCvT6M2KVzXGek5cqOzqgvkx33D6Is3X5ybAPb3GuUQEf0iJSFK+qJbz9gRfhWCb1xhxdlUnsJ
	8c621dUMkKYSj0zfjQv380q2wAOzQB/NOj8yhvVvVS2EnfqdESAlXboczyVsHAKPHepDvykrsG7
	Th6brrPlHT/GMMYYDBpwf/m3+/scoq5wIt8B6wdq14mbRdLcAGUvAGOGGElE2bKa2J76hT3xOAf
	CNFuN20r0ACffKvNKgPrZXfl4mm6A8MLtKuVM+sCNx5DiSlyIU775JrJlV2mGjllDwuvGv2PkQd
	EY+nV1O7lSo8SnLEVbS03zPMwHaIiUpVBkl+o9x4SuTFMmS1MeJwIDggA==
X-Received: by 2002:a05:6000:4b13:b0:487:1687:197d with SMTP id ffacd0b85a97d-4871e212458mr14317492f8f.6.1790004691345;
        Mon, 21 Sep 2026 08:31:31 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:29 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:57 +0200
Subject: [PATCH v2 1/5] media: dt-bindings: add rockchip rk3576 vicap
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-1-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=3185;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=8UIbOajv/WeBQjxhRwQ8WC4GpLGZ30N+4iDWN0b6s8o=;
 b=lKpSlM1nNUiAbgX0spgPXAk0GpWUq8d3KoePWyxk4ZSDU3HkmiPsECMZUnE7pYP6SmzdfHjUv
 odFPQ1dailNC0o+hdS/dO7TmYRMTNNv9fogQQIDl+DajAdYmtsxsM90
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Add the compatible for the Video Capture (VICAP) unit of the Rockchip
RK3576. This variant features five MIPI CSI-2 ports and a connection
to the image signal processor (ISP). The pixel clock of each MIPI port
enters the VICAP through a dedicated gate in the clock and reset unit,
so the variant takes five interface clocks and five interface resets
in addition to the aclk, hclk and dclk of the other variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 46 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 080b64503b1b..b7dfaf3b378d 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -15,6 +15,10 @@ description:
   the data from camera sensors, video decoders, or other companion ICs and
   transfers it into system main memory by AXI bus.
 
+  The Rockchip RK3576 Video Capture (VICAP) is similar to its RK3568
+  counterpart, but features five MIPI CSI-2 ports and an additional
+  connection to the image signal processor (ISP) block.
+
   The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
   counterpart, but features six MIPI CSI-2 ports and additional connections
   to the image signal processor (ISP) blocks.
@@ -23,6 +27,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3568-vicap
+      - rockchip,rk3576-vicap
       - rockchip,rk3588-vicap
 
   reg:
@@ -33,7 +38,7 @@ properties:
 
   clocks:
     minItems: 4
-    maxItems: 5
+    maxItems: 8
 
   clock-names:
     items:
@@ -42,6 +47,9 @@ properties:
       - const: dclk
       - const: iclk
       - const: iclk1
+      - const: iclk2
+      - const: iclk3
+      - const: iclk4
     minItems: 4
 
   iommus:
@@ -221,6 +229,40 @@ allOf:
 
             port@11: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-vicap
+    then:
+      properties:
+        clocks:
+          minItems: 8
+
+        clock-names:
+          minItems: 8
+
+        resets:
+          minItems: 8
+          maxItems: 8
+
+        reset-names:
+          items:
+            - const: arst
+            - const: hrst
+            - const: drst
+            - const: irst0
+            - const: irst1
+            - const: irst2
+            - const: irst3
+            - const: irst4
+
+        ports:
+          properties:
+            port@6: false
+
+            port@11: false
+
   - if:
       properties:
         compatible:
@@ -230,9 +272,11 @@ allOf:
       properties:
         clocks:
           minItems: 5
+          maxItems: 5
 
         clock-names:
           minItems: 5
+          maxItems: 5
 
         resets:
           minItems: 9

-- 
2.43.0

