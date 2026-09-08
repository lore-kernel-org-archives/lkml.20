Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B5D526AAF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788911915; cv=none; b=clkATXx0YX4G6id4pYB8Fxa/Lj0DNzvkAdCpEkELmZ/LHGZlJwG+JoJTYlCcnGk7ErxGOohgVc69MRbl0x93/mu549rdE+aFZFt7JDip8nf0/UHDPAUy9Mpa4RrSC/bw3n59rgErPjE62vn0RcjCbk0FBLmGlTIkaKf7NxX7Qg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788911915; c=relaxed/simple;
	bh=sCerYXliWnW7OKF5MJ43wMqi6ktrBVsXjzRSNkhLDMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eu+HQh/IRahnO9/9DBYr0ZVMnu3hPAwfIu3AkyhQazrELvPoZXqhewPKzqK02UF2X1BXy0lLTbR4zcyj398FLKVaFGzU/I3fbgpIwwkAJl8pYHDdjGhrRl3HywUWytmcHkLRaPSI8q7r0IesFG1PuiQyu6++54n35hNXtx+RmZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKeTx4en; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKeTx4en"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b7668a5d8eso28798e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911911; x=1789516711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWeV1W6gcuI/MozGquhzyefyDY1CKq1VISFtq6ltYNM=;
        b=jKeTx4enRiXMb+7IcdAqLIayBUacxhU1dfTIuAR/Y7FVEG/ios5evD8O2tVw8I2vie
         NNpliC88T8fEnpfJMkuwNQrcnn7VH0kUUpJ8GlChl6j7eoqfQOOwGIIesvNpIaLi40jD
         6jJGUTidh0ruEIvA8oZ5r7IOEfQ2YgADzycsUHOL18ZOvYiqaJECDUDDxgo+RSw71d8r
         lT9ie9T9tFPCm90j4FrxO5dYPs5t4/tOSrq4SSlp09vwcQaBN0xdx0m/GRuWc01ZSwPb
         6BZjr/0sqYmHT/75n1QQGLwMEgbJIOBUKmyXe3pNBaII6BNll0deTflt0adqA2QAPAF2
         xEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911911; x=1789516711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWeV1W6gcuI/MozGquhzyefyDY1CKq1VISFtq6ltYNM=;
        b=NdX0RWAr4XdQCMZOJQjsIO3L4lVdXr7xeooZW8WPg2gJKgS89+9MzFRh+jbk0njw7I
         oP+X/g01fX2h/C7eUmi0l0W3zckvQXilMXhERFQ5QzfNKzeYv7P5wL7xf2AlfXnnUnB1
         fl4K60t33nmedt5Lq48YYXDxv4221E+CtMTQOmw1549LdRoPNHQqPMvlhxzZQzKsEPNw
         DoJH3/kDpnQvTSYuCgGM1Lg3YWK1uKQel50gvGVtLMH6A/Ylh1YOUf3oLXV26/SGnV1p
         JX7w6/DQ+JalsrBWgnOTes2dzeiXHAikrDlaJTPviNwTtMXqwpVhzYdZ6GTR7cPORrgp
         vwDA==
X-Forwarded-Encrypted: i=1; AKwUvByT692tMVggs2SjGjFKbQEt11IXOsxuBkhJ2qzNw6vb4oitaxqa401B95/XoPMHmLxCrYgFmQghUW2kPL8=@vger.kernel.org
X-Gm-Message-State: AFuF++nL3Fwa3k0iq3k9ZR2ed3hVR4KzMDeFpKmP29AjdK1ZoqajcXwe
	7UXVUPl9C4kcSy4Vsq0LkdwnbRfWiN0ryFRIfxSSMZfQgKbOndvxgqLG
X-Gm-Gg: AYBFou2F6N0J7MEs7646A0DBeBHo09tLhiKPcr0AZyXWYPTxtEEK1Ckvs9qcS6n3chq
	zWH5E1991M3/kRgaVWUxh5RdZnt+wA5H44y1SqsZc0mXScIUWFtVI0GecIR8ev4NpkwCEUjQ2/7
	Y5RunLFZnNSNseCkkvIM1DtWUMMxJLPE/pC51P0P3ZyH8ZDScihlsxrsyo9xtj7r4pxFX54sb2U
	B0E/t9PVJw5EyPGPa33lhOYWes7ppDeALEODy9x7eidUh4gJsbyDKeiFODaqO0rLBEW6q2c4ivI
	nHuRRFKAIVtabfsWL3vSRdb3flgMLhl9w7L/vvdB/ASyy8sBqdpxjVp8G3BTnXQ9jDJAgYmyMmv
	AJuPJzCuUEv1Fawl/quR9Pl5g8ON7JSNi/JkESUzD/uG5BRjfCZ3DNXQSLLbVckGcyjxxKPQ/1D
	Y8SRbbsIb40a8zBhhdvTRNqIgc7vO1BkI9A4AfhPxzZgLysRszEqNT5hcG36ty6ISeQILDPtxDc
	dE=
X-Received: by 2002:a05:6512:3e27:b0:5b6:424:2b08 with SMTP id 2adb3069b0e04-5b616f5875dmr10045629e87.33.1788911910601;
        Tue, 08 Sep 2026 16:58:30 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b765652d3esm127328e87.59.2026.09.08.16.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:58:30 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed,  9 Sep 2026 02:58:22 +0300
Message-ID: <20260908235824.665-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NanoPi R28S is a router board from FriendlyElec with the Rockchip
RK3528A SoC.

Signed-off-by: Andrey Korshunov <razor1702@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843..1d937795a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -340,6 +340,11 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S
+        items:
+          - const: friendlyarm,nanopi-r28s
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.54.0.windows.1

