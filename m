Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB24A9D63
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637237; cv=none; b=lxicbM0Ezw+5iB54QxjQY4597ektKR9CJyLmaQ4a66HBsoFtkRpqzAziu4sjLJ9d7y8Rbi+5Ch9g7fJ4poglmRtA6IoCZ2U+1iTYc2YWB+MtA+ojCG0mzrMO0NlkJiDhvtRHft5lgNAwjDDTc3k7HCRAmoheIFOK0DBIUVeCg+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637237; c=relaxed/simple;
	bh=aSzofgXGUWGqY7Jc9QNW0/KhtCCefpAtdN330qA2Gf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLe2c3wnoGqZQZKetB2X15gAZwYe5O9o12yIy8GYxOGwh+wpcU/k01o6z1q2e01eY1liKaSU9cZO1emlDMMMpMsX0/1dhFzhJZGsYqRXiJn0sX8DlXqKRIgLCGo+cFsSvXoLGJvImZ2O9lpvKyRg8nHraRt5Vww4OQT/sdhpkJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fxss9k4E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fxss9k4E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso1897345e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637234; x=1792242034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHO7lW8dXTEw8No+XY9Ehk8i1Df2SHzGS4HhV6BQdcU=;
        b=Fxss9k4ElVmv24+mmREOO6opmUZEGkhWnuG5EJSu7QC2s2uJkoOc0qwRzHjSxmAySL
         zciE1rnLjhJU7leagND1WFihA8o0xryci9Ik5hwVy7Sw7aAv87DdOfYvHZKXP6hbEfA8
         mjN8peEz4Rx22ExO80iZo1b6caAndtek3ff3hOQLXdcq6mZseXwJiRxDZmJFKnI8p1J8
         S01T6D8XXrewugzFmsUGFK7BCk/Fq4A4kanQwV96wbcFbz8QpP7/rAc4zN/AiIzpaHQv
         aggB6SSqEUBpK5Byfy8wJ+UCreyBBjM2e7CxsG3ZXSvhvw3OFuMUNKVhHE7bVjfRZkaf
         Cu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637234; x=1792242034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHO7lW8dXTEw8No+XY9Ehk8i1Df2SHzGS4HhV6BQdcU=;
        b=BuCNtG9i96FKevsyWs7qqM1GvQbW8TrFLYQ+x6TcBMAQqH4/s800qhBB92OGIHNWOV
         S1XFHpcduHsSfy1HOHUl4PSpIXiUz+JKEsMWmCucYn7ANHyeAjbJIteBIC/8XXiogglZ
         1AK08cqXKObsPBtcVs62XUgg4/A81h7XmV/FuGCCXqUGMj5YC+JHv/L8aV1YH6TpFF3k
         IiuErbyp9KK19+2cYjdfc8rhngYB3fyegTc/WbuKp+HYHiXH6Fg45wiU3WDyBgmWbb15
         HJ6zgXneD8l3ICGcAbnliP7zf+JqxJJr/NRQPYlSU/m0ebqN3Min1vyyrxi9KWCua4ra
         tEMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5FmnhhvhvK3W1e7i3ebMKYW+7NIxzF3H9tImBEJ3Wuwl+oCDqvhYKAuapQpZ2+SIiHEuA3vFD4Dt18Ko=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb3jrlRh0GrWcCnWwqjRRA0SUMZogMJPkz6DN2Nml2Ekm7cNaD
	OfH3Rvw0S+xLKbj770yPG8UyLIvdd3wee0UI+D9lfzgPOt5wBBk5BguR
X-Gm-Gg: AYBFou0JnaS90RoFJWItWAZBUxdnExuzSGwxytI5Y3eH6f0baSMrswM1ojHX+za6ZZQ
	YeALtfVh0N06pMeIJO93lkQnPSYt0h4PHXqFHWQRHuR9c8hCN6EI6JTnbXjDAV4neZabJ/KlNhu
	i406QBXXqo2d354lnXApHd1DDjAcZ4TRnBjTDuqvi7sBFHRvXSfQ1H/vHZFHZHorxhhchJGIbLQ
	vw5IrKJq5MBGDatn0QZQmWfoB7Dpfp+ftMlQQ6rI9mljcsRviDlbY3s2R7vSY07RmlEFA9Sc1MP
	kBe3CjTRO53YbHaIhCRth8aFuocvdAmABvKB7vgSBdmS5Ddmv3YWBtxJqWBnfDQ0GoTN5h1pDHu
	RRtd64BwzAU9jfT5mI+KcwLRDPFkzj1yJ957UfiLNFdTuWzDPgH9PGt3UoajVrnPEOlASkh77c9
	9mzDpS21wr86vfxZT8GrPHvC3qpr+2709euXzknsd43vbdjjefHXb/xdpUSxXUKa+pUqbShOwcy
	giXDvxnbMwZUPLYxrbYD9VYdfpnFjMx1+eulP3s+YSvPGZQrtBtkc1EQf8Yslpt+kE+55oeTBty
	1qBaNkOMXQx3qaZUYIBAi7v6pfskF6DtRir3AQV9AUFC+9akZwCndrRrJnwjS8TEz79XvU8B
X-Received: by 2002:a05:600c:4594:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a18e4d6ac3mr87355405e9.26.1791637233643;
        Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 04/24] dt-bindings: arm: Add ZTE ZX279128S platform descriptions
Date: Sat, 10 Oct 2026 13:59:42 +0100
Message-ID: <20261010130024.177503-5-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SoC board compatibility, SRAM used by the parked second CPU
and the SMP enable method.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml  | 1 +
 Documentation/devicetree/bindings/arm/zte.yaml   | 8 +++++++-
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c5840..25a141f80b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -284,6 +284,7 @@ properties:
           - ste,dbx500-smp
           - ti,am3352
           - ti,am4372
+          - zte,zx279128s-smp
 
   cpu-release-addr:
     oneOf:
diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
index f028d2cec7..a1a3742219 100644
--- a/Documentation/devicetree/bindings/arm/zte.yaml
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -11,7 +11,8 @@ maintainers:
 
 description: |
   ARM platforms using SoCs designed by ZTE. Currently this supports devices
-  based on the zx297520v3 SoC which is found in LTE routers.
+  based on the zx297520v3 SoC which is found in LTE routers, and on the
+  zx279128s SoC which is found in home gateways.
 
 properties:
   $nodename:
@@ -23,4 +24,9 @@ properties:
               - dlink,dwr932m
           - const: zte,zx297520v3
 
+      - items:
+          - enum:
+              - zte,zxhn-h3600
+          - const: zte,zx279128s
+
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc68319..d1389156c1 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -104,6 +104,7 @@ patternProperties:
             - samsung,exynos4210-sysram-ns
             - socionext,milbeaut-smp-sram
             - stericsson,u8500-esram
+            - zte,zx279128s-smp-sram
 
       reg:
         description:
-- 
2.55.0

