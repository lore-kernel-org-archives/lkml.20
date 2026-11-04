Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805319;
	b=UMJrEpmFj/AwKdqebppoOaaz3O+iesGZTRVSKiZHwtazgat/jHA8PE1deAGxFX4RYqwm
	 vnlSwdVckqT+vvKtQ6PiUsmGbwbxnsa/i0AsviAWMwZjCaxhj4oByA7SA5U26R6k5DVfb
	 KbiqfieJ/JRqkzUKwPQ16UESeeY6IDJTqq/gNkuFOmqXaFJGmsDNQ4Z/zl5Ds5aGm+O8u
	 p6aeBlck72syrw89YkUrZEXVWXyUwhcferxY5wwKnn2WODzZqSH6UpE4hKVGV6dJbeCiI
	 5AmGH/6M6O4bB9BwUWvrQqVbZJX7dkaAtnIVZvqtD1qyOUsgChUFksDI/mAK9nmXfbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
	b=J2qHVqpS4zDvv6darUYYfKpCSP0fRyHTFMWXwEUeu5F7wXioSSgZ7l4Frn0OZTzGP9Ju
	 e7FERTyY378SH8q3cwGQbsJ2EuEf5vgZnNrJMeEJJBX1avwkoQjrTQyvmM71P5Ie33PRQ
	 WvKW08lsW2NaLIJ/tqof1nWyNUXado8HTaR7EB9sx1AFGAuaMpp3DsL+SjpXRbx9hqng6
	 b5VEEF2avny6E2x+DGwIcUNojVG1hIaa7rCizxrMZKhjqE+BVISze4nawPIlB88048mZ4
	 /uRarNGcWI0y8rqi0ZHaYLNY0zDU6LEhCtyOnBnOdqN/ipwsHYQFc6U3D9olGv72l0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQR4rYHj;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C11E606D807
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C11E606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQR4rYHj
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso390220f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805318; x=1794410118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
        b=eQR4rYHj73X7fzzSCfY6Vkl7vWu8lDHDACWqotIGF/PbUoGrpqfjLQvrlixhH33p+M
         8IzO+5MOfFq1Zlpp1qp7bNsiS2qSb5ntV/FBV+nopeBApWthTWVqmDymvs8WBsESxmMf
         DOwuNLBoDkNr62jnWtFyGLlSKb6ipXvXmXxlDO1hdL3ZtKfU9hw1E6SjdtnD6LjCKonG
         +Ja8uKRPUxepl0nb+qNzPlHJADjPju4KwcbOMrflBH6juaszbb6TbAPgGXkL5ZJCLGMu
         y9QVVOxCM/kFwt6AYw2TSRJPCLLqKfmBEu3sVA64dCU6iNeuGb7+sOjUUs6y/zX0GEkC
         24wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805318; x=1794410118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
        b=gZ8GZ9X7cf0yfgHVpMLPFLeyufgecb2KJn/JwlMh9LFp/KVlCYYRfpj+i221GOn/W8
         S6kW8hE2axrST60gwjhxuwmzQFkVWXeFfI137eSzVR0vOEAnA/MI34lO+nj03BdKhtn8
         jlzvQiOyJlUDbjXUKEItjPd2WR4Cz3JjJaBdOd5aNVQihkx0XbtFH+tKv6bbOx4QK3kS
         sxU7SWHUzlEkH+FeVFMYlTh8dBgef2YCXAM8A5uM+9Dp4/S3npZgu0vWdRyUh6ybdPw4
         biQBqnc4GZPURJVoD93ZsmgMfvWS33pBx3pih99HC6uxAzELZBI6SNRMrVhXFbjSn/PI
         7Epg==
X-Forwarded-Encrypted: i=1; AKwUvBz/7ImA7s8aHtM6PiKVs/64NlTQvrUuPDZZBrH4EHKjjFMvp2Z5z/KGrin0wNcNDJT6OnPh7/SC1F820Z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BrExcVKQ0UI76umcMTnMsCzL1stI1vHmWJ8AN2jb9Hyep1NdQ
	JIY+s3e2SUtQQpqbqdhfg71QLLt1iBvVFGVZitntJpnTBSLDM0vpHXzk
X-Gm-Gg: AYBFou2gttyX2vZKEHZlFq4gTzLhv1bqT8t0YYk9uA3XiIVrFFvG3Ewb/1RxuSVP8Yr
	sPvt/GPndkOzsRG6zpYkOnwdUTjGEbUDdNd1oULppAn3MxqZ1rzUYAzqGNDm7d607+6OZV0Lzd1
	jlzZatgDW9djGEKJzB59FHt1HSyiNRwTGhcwtISQmK00gCXwp8P9hqPhhRziA1Rq5ehggImzABJ
	TMXbHtitYfWqDHT5Ar3RwmdI/QFnChC4Ptd01jhU6H3Dk0bgVZd/c6rzrPRERJzDGYpHj0CF2rw
	7sPgZK6nMgwhSuYlvmopSj4Gj8QvRdl+nWFSLXAroJhHwIqrX/u6Dy5Oqv3W/krAWjLkvlu4eiE
	yzIsCL5TvZ2Vvwou/ui1yUpVNc5G1o8OLA/sZrkzlSg8W3+iyR0WHUrCdK5sMaEn8Ztvvu3qsDT
	mq4GSFjlOzoWLR+OqLoxn9+GcpitDBwkaVNVSIV6c80yfXG/BxF7vR/YJXDspDAdJ0c5wRVKDZN
	IqkQM/KMbek6B5dvbNcBIUzzf+OCow7MkxwhbW+58MbN2eyZp+x6uzW2r5NdByUOOkXNivxxNoi
	2kmz9jkFCdNBSdfm2oM2ZnMM2iMNXEUlhGSy+rmrMZ9UQSju4dgqXAYVooZ3s4miBw==
X-Received: by 2002:a05:6000:2288:b0:48a:f404:6960 with SMTP id ffacd0b85a97d-48e6e2e76a5mr36167522f8f.9.1793805317529;
        Wed, 04 Nov 2026 07:15:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:17 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 04 Nov 2026 15:15:12 +0000
Subject: [PATCH v8 3/4] arm64: dts: renesas: r9a08g046: Add USB2.0 function
 device nodes
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
Message-Id: <20261104-usb_rzg3l-v8-3-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=2186;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=4Zwn7eiGx5F+e7i3Q24k8P/CK7A6GlG6OQaRfATc4Lk=;
 b=76K4k07s6+fybYDFWpnzklY7KhumEnz8DNk21e/s0oOMjA6/zO1v4oU1N7bzNteHER8ir6GvQ
 oUW/Wr3FWO1AbcuJ/IeeSTW0YfP91NnC1nWF62oFoPxdLcAcduTpKRf
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Replaced place holders.
v7:
 * Moved the patch from [1]
 * Collected the tag.
[1] https://lore.kernel.org/all/20260707145135.247565-3-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 35 +++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 4df290c9937d..7e379f6ab837 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1406,8 +1406,41 @@ usb2_phy1: usb-phy@11e90200 {
 		};
 
 		hsusb0: usb@11e30000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
 			reg = <0 0x11e30000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb1: usb@11eb0000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11eb0000 0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P1_EXR_CPUCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2P1_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		pcie: pcie@11e40000 {

-- 
2.43.0

