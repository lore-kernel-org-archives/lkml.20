Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D69569F33
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090599; cv=none; b=NwTYaIbfJgdQ6io1et7QhZYkokWtECM41xQ/AU6yxtplya4GdwB87H8+xiJcZaUr8y5f973SF1dx1dPLQdARLV2TAFX4y0NbCVkVwcS1rW1OJAVkF+usdQaC84IF5dbwZtSShKI8iRJxfo9WHv551byarBzDdiaqtyye/tv1YPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090599; c=relaxed/simple;
	bh=AYquGq+PWPwHCXs0e1iyppBvIZnSoNzpk6ygDyKiN40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iA2i4CbxjNHkDa7SW4dhXFHIqMvHEyyJRSZUX5AN+MoG47u8YA7XnXDAZu/qt9sei35mS27xbx8DqooxHy8k7fe0UiUJb1sgRZydcI0fHWcWUmkXaL53rbmExswLkMU4ifE66/tyJmVokNyT8FcdoPpISJweWlagBv1Jq/IpbXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkCq5C71; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkCq5C71"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so50302385e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090591; x=1792695391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8DFjBs5Cy+cqLEmVTjSkVi2zwWGVHnAGbcDhQszah4=;
        b=PkCq5C71jVSwiX8IWVxs5ShasZoHXTJ6JE3Mh30TsRWDHUJh+r5789AenXQTlA6e0X
         aEu64mi7BJhsP/GPRKmc2GRszbip66s9pMUQanlP/4v8953xVBAEZkN+97Q/l3iXrQe7
         x0pFbnxEvYrugUPB6VE/OJR0p2DcBi0YSa8TAu+qjmI/vFRyrIviUeW8NefCBsIYkDgb
         7dbzZE02civBml+XiZmzIhY0iAuz/xmfc37wxDCFbNxWRIu9Y0NbJ/n3wQKIggROeUfI
         ssv0GWg+b5+2KZaFQnCmj0W04SJii8h4RYiSFNOaJUJoE/6agxiuZbdsJGr45ANkKW7z
         f8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090591; x=1792695391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8DFjBs5Cy+cqLEmVTjSkVi2zwWGVHnAGbcDhQszah4=;
        b=1Ro8Fy3OE94PsJMSxJpjVin7STZRz4VMHxj09V0nMSkoHoESUqkBZd9ht4zZOKv4RF
         BVngwHTviOV/yYBWTFNkMz+rayWQewzBEuwc7tEwe7eXB7lfTCdtH/uJtOzF+RNGjWkO
         ufTNBOax4km8iE0YSHtJvuFfDCBmRKhT9/sBtMmeA0MJtDCsAomss3QdaEZYgmqsWRdg
         kYZcooswGLR5ohgBE/bU6ztNNCvu05W5ByIwQMQpNJ8vhqvqm2ZCscUl2pkd8k7EgfG1
         +5KD2hxbBA2aOJiKskun0acRW3R7Eae8uZa0Lkhipg3HN/TzYjcupDMki+dMdysgt+2N
         Jtsg==
X-Forwarded-Encrypted: i=1; AKwUvBxNGV7nwgRdzygfoC3kQw7QNaWExnG8nQRr82mTNHhrzaZIKVXARBtsN8kUKtDzdWulQVcehtXLeC+oTEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiGoopAMhN/qOknO3Ysf+Lubhvyav9rcAXFfH4qL5oLDjq5HUW
	UE4wJ3qfjc6nRySTv7XW2W3lhzhGAkeDLuEGSXG/ctLhTZSkDSkPlTDA
X-Gm-Gg: AYBFou1kq4ExcJwcxP0sHR3RVBzk/EL4dWPKtiLTd92d/DJjMvKqdygC4I5C/3+l48W
	7FGNsUoJ37WLRSOeBDeLtysZ50agfMulu4r2zOuxt4NAowCg8geSZVlsFLnXE1Iihjqg/oWyRQ/
	O0xej0aoSeFQg14gCwl7rBQLEQVk4WRMZeRgA9jjRjoRvyPzXB/H17p6SmsWeGL35uznA30kypH
	Ynh9ZpunPIpdUVDF3eTYXtN6W00E9gCmrW2JR6KWhEaXxMOV8ninPrbEGY8H4kYB65lJQHJKLsJ
	JS4W1JwAJca89Xp0INDKkGNrOpuQodHrkGF69EkPA8FZb1uI9tW6Pstfr/wMdp+lP4quaQUR7g6
	GMM7kMJii9eUlZIx961CaP9Gb9HOBIEw+pZbpxErU6eiCrGd94E/JT69fCxsxJUo1LWmI681J6b
	SjcZmMmTZqY16onsoz9pK1rbgo0/DOIj09p8bpMEzibhZ7eGomNxT91SokxdMpSrO5BHrB7NEQX
	Oplvmjd4woScymoE++TMKbyLwWqIgiLZjHeamZmjw==
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr398603945e9.5.1792090590951;
        Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 20:56:05 +0200
Subject: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Add device tree node for the Imagination Technologies PowerVR Rogue GPU
(BVNC 36.29.52.182 / BXE-2-32) found in the Spacemit K1 SoC.

The GPU is located at address 0xcac00000 and uses:
- CLK_GPU for core clock from APMU controller
- RESET_GPU for reset control from APMU controller
- K1_PMDOMAIN_GPU for power management from syscon_apmu provider
- IRQ 75 for interrupt handling

Disabled by default; boards enable it individually.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..82cade2f76fe 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/spacemit,k1-power.h>
 
 #include "k1-pdma.h"
 
@@ -1119,6 +1120,17 @@ multimedia-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+
+			gpu: gpu@cac00000 {
+				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
+				reg = <0x0 0xcac00000 0x0 0x80000>;
+				interrupts = <75>;
+				clocks = <&syscon_apmu CLK_GPU>;
+				clock-names = "core";
+				resets = <&syscon_apmu RESET_GPU>;
+				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
+				status = "disabled";
+			};
 		};
 
 		network-bus {

-- 
2.56.0

