Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB540B383
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358017; cv=none; b=FYydZDWH+57LeD8jmeTIpPWbmwh8MJ2MRxoj6kjpk9VG0GMKgftWBQZ8kK69lJgAhtIrB0tv5mxEEfDT+HPnMEXVEmzRipBehsMsg06cumvi/lc0NUiCsU/bRcp4Eb11MMr6Wsuxkxj9ZGL1vfe6rWgVquCX68uIVzx/ikszFtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358017; c=relaxed/simple;
	bh=huBJV7d5iTiZTlgwFSE14Dr2+v21pxG51EetGZRmP4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W+KWzyqdKeKGoqMAoa3H00FieMw5zbFLpSdDOd9puC33HcWgWG3LDVYjPza5cxmmuHZnSkt2+bQktf+AQwlf/okgGiihLHud51GBD93Q3SIHkx4Vd6Dmnf2y8RMTX+KMOF//VHNlU7ziepnofya8BHVswn4Oph61AyBc9tErxuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=US0cYCZ+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="US0cYCZ+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ff680331aso37818555e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358014; x=1791962814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wOw3fCxE0SXZHLWAQtQQ3cRE40r3r/0aGFaPTR+0DY=;
        b=US0cYCZ+sOP4U9KF8rcoOZnZghRkmjDXU/6ISVFjTpGo4FVMdxsikSvfqKFnstIKXI
         HocQAt5sZYzXV62o5BvafgIZMhaYK3sOIvNGXVoXx404lC2nD6kdXn2jIGNgFkef0U/D
         qJMjnvEkN0gLGx4nMWxB+mp9kA9iyyYPaClEY9ZbqLJJn+waxY7H1R1/YI3ugbGjQCuk
         qWVWoWp7KWxrv/jITrpBKnayeA/XS5IIL0C4q23VdMQN5quuqQVWoLpydSFErJk9UeNP
         TzbSXhBVeFHyPdkW1pYWj3gGEYvkydHlFkixbxOWbhdbyTkk7WUPGY4l3yiJi1JUG+4H
         UBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358015; x=1791962815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wOw3fCxE0SXZHLWAQtQQ3cRE40r3r/0aGFaPTR+0DY=;
        b=qFLLIpHsUzoosOV6/XX15yfyGmvgqYn8LJWRCSJiigrP0+grfcAf5xXWnP+oDDjt9b
         TOAnnv0n6U2YpCIsnquci4NOqqpgk3kg1UNCxdgdkyDXPx9seVmYrXIhtekkmd0bnqao
         zOfP5NNrf2+Wfo2Y5Ndbw3rR8cULm4x52M5Is5mlVQwzA+sQSg0ax3LAL5921wKcZIjw
         Lq/K7qk5nRKyVjoNuI3OfXbNY5PSJpkC7TdRT/vGilNPmOPFNVogiJLwyWKnxGPtrprc
         g6Al0wEc4NmBq5HXCgqcxzKjzNjAoZaTVl3GOnHHCom7QqDE41f7WFbKe+BE2r7qkLBb
         fIzw==
X-Forwarded-Encrypted: i=1; AKwUvBww614r+kYaUZv5d/0QG1K4HfmTPSi03S9y/uvIwhPWQGElQLvaxFodjBEfmsOJOoM5ZoI2QDt55gt4bz4=@vger.kernel.org
X-Gm-Message-State: AFuF++lKzDTTioOn3UVgtbR2WMTwn2HXXhg0IiYlQjbjax8D5Af3gfLf
	3ZGJ180ErZ9rLPHeZzDDwC6NyFJVQV+AFEggJzSE7ecjRdQwA0Ila7rJ
X-Gm-Gg: AYBFou3m8qjq6yv16NelegtHEPVejnyjvcr0P4lwqL7T13JoIHjKPgTzjBNjLrojDZp
	ReRfLmbMxEC01R+4mhtCgjIKiGj3LVAl3gkJfprVystVMu/mliSv7GgFVVrcpL01fgWSX0izInY
	YwUmqizl7/pVF80U0KzfDvG2iJNybY7ip7TnsWBH31Vt1Uo0o3I3vecYrC9wg4FSLOEVCOOrc6i
	t0SPTKN5pdsm+E45+tsMmNIY7OpKLW7+rvdEfBQwMlfLeJnff5nA3M2JFpClTgbTB8CG2C9aYTS
	VSqGSOUvLDPYYX4+jSRv7FIBlbnVDQUxc6eI1SKzf8EvJi5hvt0Xq8l009/27TNhktbYaUpndpf
	CizMwyGGUltz4DHPsinVYedygadXWRFu0fC6bsmKXBZssShgOWkj/wdKsclQtEqoBuLmb8H3pTV
	rp249LHGjvril1U14tjWd33WQDH0zh9AgL9BQ3c+tBxVOspILRnrj2syOyefG4Gcl6mOIrtnkKm
	WDAqGDS
X-Received: by 2002:a05:600c:8b51:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18066ca69mr16269955e9.24.1791358014554;
        Wed, 07 Oct 2026 00:26:54 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:53 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH RESEND v10 1/6] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Wed,  7 Oct 2026 10:26:40 +0300
Message-Id: <20261007072645.1618147-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPCM845 timer0 node references a single clock, but its clock-names
property is not described by the timer binding. Drop the undocumented
name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 35fa206..ab8a01c 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1

