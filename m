Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749847;
	b=lPle5KZerxY5syVdimDJ8ciMvyXvT3c4aHiFn62DVx/mZHIjEMNXhmaYgJNi86JJtujl
	 Z7zFQrSTer4BSOrnX9/LsMH08x9dP5JiIC1wq0flrNnM7XhwKp4sj3IDcVOkX279hitJr
	 0uJRooL58agtaglYQvrokV7M2SX5yWXVEoc+63YxLp5k9tJ4CU7kbLNyMMriZnkJMN8ho
	 QQ9SNJKSiJPWgO5zCJ4FF1jrNdnwu+vB6EkE9v0ozTt/ilHte9ENn/r79EVScrvWhaoj1
	 G4g681wjREYgS2Wo/G78vgXcX5jPr5P02tlc8c0pwdlMSd0agZW0xu7kYIwlwlI6deQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
	b=gugE0H0xOpF/FOR25oS+UOxAt87soZw+YzseVnZyndkVCv0okQksubxiyYEwunvZoWB7
	 mf8sEg/f7PKLmcfCy4aGb7FBhJDfY+qHC0mtuN6gPowYVpPWgDFewzj6ZuobQRCnrkITU
	 Xuf7T3MOqi8IM1MLtqFosmQuFboPiA4KvjcADPEFcgz00fDwiHJyvJMmtqttiaSR3BUj0
	 41sO/EW4rSVhoiqjmattV7b1wf0qsC3PilR87pejoSV2d3WHkydHxQK1MUeTk0PG5ac3F
	 JEl7KS/EbW2Yi3Gd5aAhp9N9zXDPUDIMMCqd7h/VQXARpNo+3GrLfAoFtw/Ixqf2/mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=If3WQX1R;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA88C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=If3WQX1R
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso11219095e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749844; x=1793354644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
        b=If3WQX1RFdmxcGAE145zioCKVYUnK4nIgvS83pnKypmMCY1Zkzj52fIz1sBV+DR2Hw
         IUhNnuDlbhIOmx37Vm3+qmUEGirlrzztR83z8P7T5zAFg/XuPHnUSg15+0X6FMTGv6Nw
         aFEWuwk4VY2VaWk4tI/j2KPerviakS98jf1h4gFPEwkUfdcsh3IbEIDyx8Vzs5R/3XPv
         Br3VOqzI9wNv2QjmG9x9odRAGAg96CJNhEO1Lu/wseRqYdfo5cbBdduOLmPt+01ljv+A
         JyfETSEuYYj2MwKMDOIleGytqsMm+raXMXdxFHzupJOBxvGUJubC9XlXNpEkvis8Wf9f
         Z9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749844; x=1793354644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
        b=puR5GH8ZY5m1nir4MU7+vBMr295r1p4X4yORFBfTLBOtwI2GTJjY0Twx5lbpgUJKl6
         jsyezJHHGmXJyTuW/im3ajKEbUTUGRAWABeu47OPGYm7rMeFiwlkd11WLHW2wvFHKeQd
         Rp4GkkhpRi8lw0I4wcRowq14D9dEFt16CD352FFW0qXKlZaYTlP4OZaJGNkcAdSrn1Ne
         lZdbf48URHtZj96rW6AJOF6xc1/ZWSw5ps240sDwIaKx634Gneb4Oai+SgIJ2+RYgjqd
         E2rnxTdjzlWXcjAhxBWkrY13Gpriy+lwM2nDYcPpyNcDS2QArTfATvX7s5L4nkGXiHLZ
         Zq8g==
X-Forwarded-Encrypted: i=1; AKwUvBx1dBzBmay0ijjFA0pEL2Bldk2xUyBzRuuOGAnJFyJ5iyobt7lu08Y4PxBU2WV42Nzq8zhmpogzVJn9A14=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlED2xNqp1Oe/Y4KQqrNAkI6S1o2zYDg2IdNVgTR0boCbfUpXu
	IVWAbvHDZ7AwmVq/l36BANvc8mkYDUsAtBSa9pL+Z07VGeL1gLt8A1xwTNRysHxIlnMUp5rmvXZ
	J51b5GRs=
X-Gm-Gg: AYBFou0iMeLcHIdvDz3TrxCaf2jeAGU7l2vVyEkweYRFTKj/DrAPCux6baMsmgEeGtv
	0Z7+7TRBXtxd5eqeasGGbtwDvqXTmaniV+PQuTLc1GsgrFDn4E3+RazGTjA+B2Pp9zBpiEP0IJZ
	og2bM5Lofx6p0RhP/1f0HESfEUXc9nVytkRrGQvQYUxKeE0UR9EhEvSuTcz2QPxZ0BPCuUJSOqv
	lmmaSCnztjxMZuLgWFwkG8bGsaia/tVKgFNfoUzA3qQ9gzvTNZXo/z2nogGqeGjnyGO0wNHmipO
	kqhXFOIA/GuKdLgyOgGtnKb74H3Dq3M0qLExcdYzMhWNi8iRc83a6EeKdHHRLgqx9Xie3/yjvZl
	z6dX6LY+13NkyTt1wveSh/AC2RimO3YPPllLdohS3K51WJUmeQb7oElUQzpEnYxTXgeW5ae5whz
	IwxEOVxXgesV0zTjFz1sOT10FY8eLCRzkA5Psd/qfx/AyqGf/nao8mAkQTbxkIGOCAWNwIWyNXt
	ljokRjkobGXPKfM2k3PempCXS+m2vfSFwHW7mfe6zHfuzftd03Vj6VU819XdjOiwmUVF8lcs22f
	9alEJ/bbaIs2
X-Received: by 2002:a05:600d:8051:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a218c46284mr6468035e9.6.1792749844041;
        Fri, 23 Oct 2026 03:04:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:03 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Date: Fri, 23 Oct 2026 12:03:55 +0200
Message-ID: <20261023100401.67592-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
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
index 45f015d63df1..f5e2c8232581 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -68,6 +68,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - x-powers,axp2101
                 - x-powers,axp15060
                 - x-powers,axp305
                 - x-powers,axp313a
@@ -84,6 +85,7 @@ allOf:
             enum:
               - x-powers,axp313a
               - x-powers,axp323
+              - x-powers,axp2101
               - x-powers,axp15060
               - x-powers,axp717
 
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

