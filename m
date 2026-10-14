Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF1B47ACF0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962577; cv=none; b=UxwT9uufq9turZyXF7gkSVFiAbvCCQaQDZE59b34UBl/jkfuFT/Gbjox4ERjL82bzHkPMftAbrStNGGQFPgj3lEN6qYTAAp+XyUln4F4TRePXAlM46Sn8o1/MS7ViJhouikVNlqDvhIagPnmxuMYMXHd5VPIwPcWzpKNVByncAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962577; c=relaxed/simple;
	bh=RxMFHdBPhcbQk/XvMD1Q3LpCKXSlp3PhA0DJPF9bQmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZB2FobtUNgiW68FCZdt0O/enAcSVsD0FfDAO2M5FhwMUBJ04S1ozWC4PHTJPq4wkdsNo5JFidRB0Arj210zJqZ6FvFDZlomyvuwh85WxMjzwzlgd12aw6dU04MLjPWx0bp+dVXNsKjdjtD0AHljExzHGFUD2juzNA+yForohvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUOPZto9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUOPZto9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so31035735e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962571; x=1792567371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cCpO3mm93VdvLC92oeje7VMfvdRi9PpFQzlDPGKJXc=;
        b=XUOPZto9HVavWhNdje7Bnj2cew0P3CDLzcyXrHqfN71VoloamOYcTZDBDwALbhRzqh
         hrrPQOK+WlLqrClgziWR/Pqhi0Qi/nNIlGM9YKzSNyTGElvkoamrKJUv/r7T9jsglU5q
         n+FJoliXJdDkjDvO5Nm9uTtJmD/Md49QXWX7icBcen4j2CWPCXDmfdb+CN3bJJ7L7muU
         EK1Ype2ePtPDxnWhLt+d7imf/kzXpZarucUUM+nLLcBe7Cg5bkXOYuyCTj9/uQGx5v2l
         mJWzqCr0Zdzodp3KKX0rbBlpwvgjXWdHYhMTAym1UjKsRUzWYigY9OvqkC9oSzC0vayO
         CUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962571; x=1792567371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cCpO3mm93VdvLC92oeje7VMfvdRi9PpFQzlDPGKJXc=;
        b=F8tsVyIep3ZmCw8IuzMUHo1Idcc9jH3dowbeWulfjAeQ4ilxZcVDwKxIdLiWEr0wwQ
         LV9R2uO3jpaRJ6fFwo5xVYmvD9xhYxsX5Bm/PXwBy0Zbgx9v1MPx+3XL2YKpL5ujNZdh
         8kEPDGx6cYvAu8fQjBK+8YrdvOckaCMjroJykPyFyNcTVfVedHVB4BLEY3Wk6anuH+FY
         GqAsw2nAprEWZjB9Q5pbg7xdCUB3/ZIQEHol1OzWbP/kV0DJPWk/vr0Ha1m9kwVT2Yv4
         nnFnL6Hpz9hPT0t3bWawg41yTJF4hfSyRFPYXM4ryG5rtEl5ocbf7H4ey29MZO4Hvl4Z
         NGBA==
X-Forwarded-Encrypted: i=1; AKwUvByMCb+lVCaNY5IdENahoEnyJtXxCPSA72TUtDC15CgBjIDmr95RqHGeYmkllp6gK+DDwfBz4J8olj35CNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZPzYpdI+IJdDUSU1LXQRLlRum7ypqs4vNCtiH6qZnyh5vtEDs
	tgNVb1iwlgrjruvfo72mmdlbnUx9ygGx/nnA7n4jPFcREOCqRpWwR3yd
X-Gm-Gg: AYBFou1I/xxmAIIqjQh13lW6r9kP75LEtvHbSeC6grfh0PE1LEnLMZ0h/ajDuv9wmgt
	iuE+YqEGQXY363vHfA5nk0fpOP5NI590YPAbmdtOBa4S94vJPHzghrY/8oHSB8ktEfEbB/SW7x3
	hVFCfRkZfDuJgQRCcRH15nF7FxW5xUh25lOKYORX08KsX0dCJH/HARbkUvZ069ZPqcxzZBBpOrV
	/JxKZ9MhSnV95yuyizBusnxmt9xPLj25I0onHCg/Ic3gBHe3k0Ht08xxdZCo8kt7F3OoOAFvIb2
	UuvDNlADhDr4UNIY7VH0ScSfmCGa/LN4ZGqkzu73fA/UzVziwaufhpX7V1qgCnXpCxZbUz3Wkzd
	PjSuwYGvaZulQW3Fo3RRqd5hmbWcLti1MKspxI4cvQXXIAaXAHngwdf7a8yNV4U362QsDGKbeZz
	88CQH63w6UmqmwHHz6S6m/R22ihhWTpllfVTI2d5rLpHlqVRgOVDESLnZ+YpXklWl85dXQl+/2+
	f6POm6FhEeTYYnaED7ahvhFvW9ZsCPPTu4F+jxxbgYGeZd+UQtB+wwGMwwH8rDAf+wY6oomEUXF
	tIS3qGWU/BvagjvuIDv7bLpJaBZ0qNdZqDRDq9XW7Hvz3xRmdXAUFLYAvlxiWQ==
X-Received: by 2002:a05:600c:350b:b0:4a1:ad01:f8dc with SMTP id 5b1f17b1804b1-4a1ad01f924mr86376325e9.21.1791962571262;
        Wed, 14 Oct 2026 00:22:51 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:50 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/24] dt-bindings: arm: Add ZTE ZX279128S platform descriptions
Date: Wed, 14 Oct 2026 08:20:42 +0100
Message-ID: <20261014072109.1759502-3-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SoC board compatibility, SRAM used by the parked second CPU
and the SMP enable method.

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

