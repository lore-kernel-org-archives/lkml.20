Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4D386C0A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268613; cv=none; b=OZa/aIDAyXPxfXlVK04wPtuRDYjDgE+CqyUIE0+X2qIJ4fGvdr12zgIeSXeQxV6j8jyJzHgrQF6WticTpv1h+i11p9HP9KLWIfMbR+PE6bXtpWaL34Nc2OxJzN7TbKVGHfYEXBF1J9YEaWU+akNLy4djVV7XC/As6Qw4FUyAzP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268613; c=relaxed/simple;
	bh=DehrlvGFJbgB6EByjRUCSsgYcA5AqtbttJ75nffiJL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DPEfMIIRHkymFTsus+RAnMWIx5+Sbl+J2JTmPBZtLYqQN75CvXKQBrOYpa26Fj/wcgJl8vDXhF8s5qKSbFUGkOCZBcvFcx0ZwbO1IsUT6wPo9y8kjhGA2xHFKvGgtkZekUU4klFctnblsrALvZsMZXqmknUHFXSS0FSKHd8if7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dct/Emr8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dct/Emr8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-887a58523e6so136073b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268612; x=1791873412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zokyqVAZo/3wOkzS2UYtFNTlUvQWqnfGSA9wFDnc6s=;
        b=Dct/Emr8TYxbWWRlwrxQ98zQoy2taOIntE1DT7W4M2qZf4d3amQ+lylqSnkxLClTKM
         n0eCRd8aSQyz2oXZhKDcW75A1GBbWXlIpC2SfTwZPB1GNfpofyj8vYQPVC9aG9ezqk91
         tJlqk9Adrdr1J8Slquo+sidBPe8z2+YG7nW/WjgvM3AE3ZL2IbJ/8m0PLlFGUsQZfOBp
         53rRGMSeQfPpNLZBLDABu9DURSRPyyI4TLCz8IWw8TzE6lhcs55tKwn3/xCXMHWfEUAp
         8l3z8eztgd4/N7nwSkuT9W5vyaAu6LQVmtSJonsRArdKpfoQDAlyKI4j3s/4SI8EBDh2
         FpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268612; x=1791873412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zokyqVAZo/3wOkzS2UYtFNTlUvQWqnfGSA9wFDnc6s=;
        b=biBEZxH9DAMbqxsU/bAKBWVTGJfLI7R43FU/RPMXAMaJCp7sY1JAyk41qz5CIMQiRp
         sgsEY6LNg4W/3KzxxH1LXjiGFK6jXATzaf1O/dEoITVq/ba7RUaPTI0nsDv+MJPn4f6w
         YQXuNfGXZ/HjGao92NplhwwGlNToLBxatUF3UAiMoeUSJpkvMiKMHGLUdiCTKJ2smyTP
         0B8kJVn83wbsC87bpYJKwcvM/7TDZfoRXJGuujbCY6Zw+DVJbaLKVx76mzNYi1XMYrYb
         LMZlOh7ZQfeb1r8DA4hE/Kv/MGf7b8CD9ujGkIlyNeiiAAHA5mgM4R+hXxnIgSpvgoqu
         G+Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxLHNZr8d8AYdDCPMm2oRBShvIK0uwlvfX6FMkdDm8u8JJZKWs9gF/5/FetBO+PARoLM0g0R+k/PsPpYtw=@vger.kernel.org
X-Gm-Message-State: AFuF++nhxB8w9myXLu29AU2epUf6wrTRBGZqv3/DxJC69d1OiXr5LYeL
	GS6F8H2pt49MZH7IIyWN4yXfpZ69UFkuZQW7O6Nj1ODpLSj0Vp7NpIcs
X-Gm-Gg: AYBFou09zkRd5lIs+3AlViZ4w6B0YUs7E1JTHDiqkXo7395qUapKnwgNyHWNHr4ze2G
	s1V5yWQosWonjkOTnJLZgq0NyGUOwRs48E8m96Yz+m82L3/Sgw0sgIZR8W6W3FLqSewNY1RDfG9
	mIUPJA2TJCc4lC//8Fzq3U8N4T6eAURPfrSGG+JJkilQj2oQZP3eQGWMnqpQlGsW6ku0YxR+S+I
	iPw3IOgA5h3LLztmmyOOy9xqc2PMXeEuaRAXnmeafPKwVuVEwSnBJEWF3zI6WEKjlGR0mWYvcyh
	tCHRNRjIhfaS9gJQ9kc6CYecNYqYSPRaUlaX0H/uYQDl0vm52nnf5YrGvM/2Bil8bGGSpma9ccX
	QN1VQcV4lDa+sa1UHKaQa4k/Qr2YO5er7jEqyYxe6y1Bava9be0K59l5NjvYNo6mFA+1uEMpNeb
	60TnXdVAtG14tgzlFwuL54QYSTWl51zTkCfQtE/ln6QLXE15Oa2bPTshAUpCi3d0nfxdjXw52px
	gxAJHE1zzpA3htyVsaRDOVCX3hizYzFHYF8Cc6Hb0etOSD83dqd18jsAhGJ8haWgwxH4wN5
X-Received: by 2002:a05:6a00:3689:b0:878:6ee:672b with SMTP id d2e1a72fcca58-890deacd37bmr383696b3a.35.1791268611801;
        Mon, 05 Oct 2026 23:36:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c792ce7sm4340790b3a.41.2026.10.05.23.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:36:51 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH] spi: dt-bindings: nuvoton,ma35d1-qspi: Drop redundant SPI example
Date: Tue,  6 Oct 2026 14:36:43 +0800
Message-Id: <20261006063643.198830-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

The SPI and QSPI controllers use the same Devicetree node structure.
The additional SPI example only differs in property values and does not
demonstrate any binding-specific behavior.

Drop the redundant SPI example and keep the existing QSPI example.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
index 72f2e1e1219a..9ee61f8ac4d6 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -75,24 +75,4 @@ examples:
         };
     };
 
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
-    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        spi@40600000 {
-            compatible = "nuvoton,ma35d1-spi";
-            reg = <0 0x40600000 0 0x10000>;
-            interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&clk SPI0_GATE>;
-            resets = <&sys MA35D1_RESET_SPI0>;
-
-            #address-cells = <1>;
-            #size-cells = <0>;
-        };
-    };
 ...

base-commit: 4825287f6d2346e9273f35a928d1ef40e68bc58b
-- 
2.25.1

