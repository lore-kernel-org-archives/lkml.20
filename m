Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588193;
	b=kktcpaYI6/V3DPtzeBD8K38EYesyp6AkYZgRwGzC+Pj7u359TTT7oQX9+fYuVOLB4dcB
	 LndqWRcdZBcKu3FxyXM25RtWKvZR3HwE52YF7cSQNN1kgPS5aY2I6kBIMrvWxAh12nHGJ
	 yASjtrQv2IvjF/GKcLspSFXVzqgCDYTpSVhR+TQO77NENsE/dzDB8SsiUNO+VhoEexiKp
	 4tXH6Bno0FJYDehpjlLXrVU8MzxGzMUJveOwwgPWlNp/l9SvAQUjEMzlZvZyRWi0RoO/f
	 qNlSw96aZrWabUNc2wvj10YFbJfsu2gk0z9ERnaBoMDlEREPtIO9gm+2QsQH5Ig2OCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
	b=D+XrJFy6vmaRin1jJQm+ErKaPeJ5PTb+YHzNPaEx02w0PELxNIqXlul3x1kGNOlgRjFg
	 0IJoOiKKQ7ku+A6MNtkywWrYEXT795/M56y72jGVm8tAsWE1qei+fC4Gdk2R4d5pYzNH/
	 mr0xA7AlkT4llSKu/jR1AEJCH/gv4xTlssBtJhDA5vjeNjawZUy3gj2ni0gOvqyXDkam5
	 OXc3bz7DOyTmNe/kzMW6RXd6hmjQ15dHkteLldFn5IQRjxo0hseinmoLmYy8k5prcxfXk
	 /lalCjJ1M2B5pw6rJjOR/hFzyPzzY5VBKiyfxOYU1UbgM193AjATKrLeN4aysj4vCeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gl5mRAc+;
	arc=none smtp.remote-ip=209.85.210.66
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1936606D5E0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1936606D5E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gl5mRAc+
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-86288992de5so1486773a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588192; x=1795192992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=gl5mRAc+Q87yIw3FA7INlu9F67qDStwak1WRRCFyGImlP1tanQWXnyQlcGJLv2T0V0
         YY692v+CGbD7myx/t6zAZocLSAJz94JuctGdQ6xWyr1G3CJZvm6WCs7omRUCusgJud1m
         4wMf8WEa8u5w4xFPZ47nZYr75vDoO1pS9Vl5dDuqqR0JOOPUm+CjiniRiTH7/EYqFbXi
         xT9/k0C0EKHnVXD/cqBQ7KwJkAHwtyj4o899oz0M/1pmGyNvlqDSuBmwAJGjpTRnlA6z
         rN7RA8tkRrM/E1FBYQS6xXFELcysgByZ5xb6FUNDnMDO4jkeQ+2u91L3ti8q0qZ1i8Iq
         VV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588192; x=1795192992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=h4aIHGdLVBuCxNNE3dXkV7bsZwZIi9rdBmDJLDWFzCu2Em/DRqav4KG1nPHsIMOEOU
         Vf32Jea2r8azaQVVC9WpyaVIq9iE4evyI93GXFmekDqYWe4aBRlz3aBN6jpue6qquZXz
         zN7UwIYlR4rQCo8A358vIfrOPwYiUqtcU95CYJmrF4woHNVnIMjtCjNitUerPOHuiQxM
         kBi8VZtwsZjuO+9vtkwRPJi0zgJHixaUgIv+aRwcA4ZHcn+vwILphPBFHe6CfZRcl2YQ
         KMQbrd5FNyktNCNSMmDT3YumNhRjLCStw0OxOLaWvpL6y0yWZReqTO0MIcTkQj2GrZ8Q
         0aeg==
X-Forwarded-Encrypted: i=1; AL+hErGOMMhOAyTO3W4MJI0VutvjRvjxGiPmxsQjgjRDeKECdabxDw2UivV4r4WK3AtRaVotBANONTdNgBlCT8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s1tCE0pzF9O+4JM7xmwBPrbjXF0NzNh1pqd36SYdtPqbCndkA
	mReV01RNsZloqpxTg9hRKcEnFEJBFiqILwdwVblO7pGOtS9ClmATYKAk
X-Gm-Gg: AYBFou3UA812cSgl89MM6wMOKdswmUVVEiQHRhIbkhfYFSKiZBtVhbicqkyTLQk3F3h
	NNHAa0wLAtX993miwjBoUNFP3/QI8gxGEVyHWqd4CPDQf6kYUkoFoYTKh/s7UxK9X/RTOEkUovI
	wmflxnK6+GfaOD9ga3eckgDro2ICr57fzcREp2Cvw4P89RHT8XCj/KXAMC9mG8XJf0iV8D1A1yZ
	zNbe3eJzzJMp6RcxUll+lOWMJLUd6vs23u9wrjnxF5CwiZcc0miDn5b1iAe0HHtnRgi2xNIwo6W
	mrZgsCUekj3kHIBANZ/TwenHnr1AqjuOWgnzzjqcYDRhLbWi4hCTIZWyh/0N7R+HYuzcoEmlYEy
	SQxXZpZ3Vq5dPdTs3kShhM/5bBDSpu6cL/okCAwIxATYEjhcXQY7qu5Br81TKm44IkCXkoDSqus
	04hH/t5tjrVJHa0NIx37CR+9yx3xhzDyuUj09m9g3lhKnfK1RwkG7vMvB2KZ+V8IJcDFPQ6KVmF
	KDOubYbQy5hPTy3Elf0EvGM8U0Bowb48VLG6pGgqdzaeutesKr0r2j8jPeaO1oPKZF8QYE9s9qX
	ThQtBgLVSHy886WqVd4NBlghAQxc60Hru523I7zFFVPSkjGS5+o1tFncGb3UuAohE2hek+508EE
	66etx0FNm7Mgb2dPJeV0=
X-Received: by 2002:a05:6830:8545:10b0:861:befc:9b95 with SMTP id 46e09a7af769-861befc9e27mr1819572a34.26.1794588191654;
        Fri, 13 Nov 2026 08:43:11 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e5148sm2712816a34.10.2026.11.13.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:43:11 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 10:42:45 -0600
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8173: Add the keypad
 controller
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
Message-Id: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-2-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588187; l=1040;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XWTgqrmP7rORvhppkX5O4ecuuFFQiKCRGXT4o7Blnls=;
 b=p1V9+WfESnlytGo+yWLkayiutHu52hR6G9rdCc885GFv0kK/66QQx3BmStt3S4rQZBGGzCuSb
 N1MV6nuLbwiCY6FjGl8S0MX7B0dx1kTM+hKuPoR9KcdWLmYpg/fcM72
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT8173's keypad controller is register-compatible with the MT6779's.
Describe it, disabled, for boards to enable with their key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2ecdea33672e..61261fe643ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt8173-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&infracfg CLK_INFRA_KP>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		cec: cec@10013000 {
 			compatible = "mediatek,mt8173-cec";
 			reg = <0 0x10013000 0 0xbc>;

-- 
2.56.0

