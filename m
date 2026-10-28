Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203596;
	b=jAyghQcj6qpLr17TVhvpfPBUqYysbD0XCL5Xu0YJl2qIVSe7TpWJ1KE1Jeqv3lB01RDe
	 fmD5vGdiu2swBmr5lAEOM8/BlVoaw22YnENPeLCWYh6GIXSJpWg186m7uXWydqk3qlJdj
	 duaefYTzxPP35fmNNOM5eYiwozOXBazelcw8uzxNsa2v9NFKX1XSdvxpWzo1YvLP+aUT0
	 I6O+m2ux6m4zaWNkvdCSjuv2XdysxiO33y4JLU2iMnv8PhNJBmdy/hrlwiFp1R0/VhinO
	 9lbvb9PaV6N8bLSccsiLUQCWX8NGMAfLJgAYjEyCqZ3Kc8PVqrjgVUlnmNoUqGZWbQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
	b=pv34k9tXhPgQ7saBF9fsd5U9x7EAbKtY/TF7zQlOtjpZamWV86x4SA2e+KfrLiY7vaHc
	 M4OM83kdv8nFrwbAi3ZyF+i2Us9VYcAMJIUQ0pzV9kXm0UyDW/0/BSV8HP+CvleSHhhih
	 EjmCe5ovNq/fiDnqkFJiYOz1vqneIgFUKNq1+3rVlExBn9vfKv0XbPkRf/R1d+SRnCszy
	 p4uG9hc1kss/1C+1ZP2hhPW5uTtxWBQA9xPAhBsZSkn3UmEc+c+q4HIj0sHMR0zRyj0QL
	 lBIlMVtoShmDH9I08S0FhplxEPxLuNB2JHO1ArxzcGt0HBrSMwdtTF1LZBbrmUgb6RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hXdFDHGP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C51E60A3832
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C51E60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hXdFDHGP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so10468265e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203594; x=1793808394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=hXdFDHGPmWU6mP6G5/xCluPbuMXxOiHWgSJSzoRor1apnhZ6GTaV0JsBTeQAFZjLWT
         hXcoaD6o+zXFzj60fF3YWL2Kol39gLchltQ0UMKtPhiHx8FMyVSx57FyzMPDeSp6sQWy
         AvncDceFrVgtuxOsJrJyauVhsBJFWKl9AMV2wfux+vaQgF5pVI9Jvsr2gcxCqK6WJ/6m
         JdE53dSwwfhbvdl7m+b0xsy2HHcOz8PaaKZKa/Q4X2f9jbCK+tMlk8KbxVMImq6QmZx7
         89F37MTUWm1MU5KU5fWm3Uty0yFUrx7dPNLw/DGbdPUgjzYpSQfV3i914kW+QqeyBauh
         oD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203594; x=1793808394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8/Xk2PZDV84vw6TpgqIZSg/Fqm5aTct485yHDlUUv0=;
        b=Zxhpv7XQLqGg5S1bAsj/uIYgClRAzshwaLrTF56Ulfs8vkbcORor7bOu4UddqL197e
         xkMcCVC8c73IkFTuHPCF8MXbmITQmMl6JUQXJ5e+BnDXE3eLi3g9cNFpH5sBJixCegY6
         USJ4LY5chU1NU+sLzYqoYsiEwrChSPEixDCAMW2gdu2CSMU5E2y132SOoDNM/1HgE3mv
         z/KdfOlrEKSMwY6r9/tl1VGu9JgFTek5ZxWDEIXFrqa+gTRlOK1G90+P6JC3xwVaowR6
         NZW5JL0ODdBA60dzdKkG1rfQF+5rL+lDQudr003wlJeYzXx3Y6VdDo5xGWae9+9Alkzy
         D4OQ==
X-Forwarded-Encrypted: i=1; AKwUvBweybchMEzBD3BkgV0OTO+zyHbe86/xHQwL4IX6gLejaYAWTZ8l7PE1arbcsAQvldXIeVz0NnzrzlvsXsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMMDURvbBb1U8sRTkVxME/y2XCtmHHXKxBKxfddF1Jrt9F8Ji1
	acPf5PCgT+pcGCmn/lITOnTJq7rLzIH2br8d4jao1u6VSFbl0t/WuS3kDtDDbzR2yz8=
X-Gm-Gg: AYBFou3rvu8xFy8gMvtCPmvQD4T/BUHBu3b59re/SVQDXp4MDr52Od2reSrMvvwT/m4
	lqNaUmpNOJPIWstQgDqpsJPrLP2IAExXk1voCeIzBv9C1Do6LZEeq8uLc8cYBd2alBAZNaAls3A
	LBIT5tLBUuUipig6mlkb2si/Cdc2RBzm2y1n7dGD7ClTWKVmt2sBQEh90U9wwThBJbiyuJWWlkY
	lxRqsFbhDW1tW2KRy9XsvfwVyJJ/AhYYTfd9DQe3pnS3StdIiqgq8shVMG3ninHLz977wYY8dkj
	k0nk8/TFx/yGsMP4j9L5uyxKx9DVvA2gmYPTAGa6UXOVrmngMr+M26DdbFo4ze+5hAzzSSmPAlB
	E3rXSk6B/ViAvqD9pIIz80U/xayKaMWPliL8v57xSgctFS6l+c3TGFaX99PZ86KlsQ/uhgFkL66
	j7OwooJO1QP9MFxaY+ZSmZeZCKxkPy6bzXEDpkS02k/XcZM7nnlp9K+izi4sEltzQrqpFV5Eknx
	Ja1tJS6AhoRxR1xKBIz532McJSr164PjSxansSzVyuejR44Fx1GlhH0G9orGAmQpGQGpq9sZA21
	q10WEbReYhVchSGOR0cV5dOkeWTMn0Ws/c0p6WsACv8zPs7jz5qFAGLDdskdwtxLnOclQZ8m3D6
	3hwg/b9GCxMXwhz+FRf/eagmxLDVDz5fZTFFaBnP0z1PfCEw=
X-Received: by 2002:a05:600c:348f:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4a9643d380dmr62293675e9.4.1793203593792;
        Wed, 28 Oct 2026 09:06:33 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:33 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:10 +0100
Subject: [PATCH v2 9/9] ARM: dts: omap: dm8168-evm: enable MUSB multipoint
 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-9-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1428;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=T/OTFeU/v/eoDvotZ5j14Er/J0T6ty7EyR4RK8RPU/Y=;
 b=tNkgUp3nDaJHGL2hMsaJN+z8EhlSjiujuDHYAdAC3akJpa5TYYAUeQyN7Hs7ubj5f3GxEPgs1
 rlFx3lwxv9SDGeA63+/JqJUP3QwhstYNTZkSLFqa1KBjtDWJh1fPc6D
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Christopher Obbard <christopher.obbard@linaro.org>

The DM8168 USB controllers are used in host mode and must advertise
multipoint support to the MUSB core. Without this the kernel disables
external hub support and warns:

    musb-hdrc: kernel must disable external hubs, please fix the
	configuration

On the affected board this also prevents devices from enumerating
reliably, with descriptor reads failing with -EPROTO:

    usb 1-1: device descriptor read/all, error -71

Set mentor,multipoint to the default value of 1 for both MUSB instances.
With this enabled, USB devices enumerate successfully on the host ports.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index a6d42766a496..4b4e4d850231 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -198,17 +198,14 @@ &mmc1 {
 	wp-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
 };
 
-/* At least dm8168-evm rev c won't support multipoint, later may */
 &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb0_pins>;
-	mentor,multipoint = <0>;
 };
 
 &usb1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb1_pins>;
-	mentor,multipoint = <0>;
 };
 
 &sata {

-- 
2.56.0

