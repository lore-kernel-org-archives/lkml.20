Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649214;
	b=eB2owLE6kLuaA2nXvv0o18q4b0pJfiLM3I0oiFld2bEsieCEj1pp25Z57FxTdI4sd4F+
	 vxOddtfifDXBqZ7WgDxsJlehZHhOdgObM2T6WXOmE2pvtO8nQeCbjiUVLmjjiW+MR4hUY
	 cVfZ40bjp0TGVMEQ2eL5iJxWVj3tH3aIejmGn+fVzjXwiivEFnBBilwlaFOY+wQu3DlLX
	 Fg25UR9m6Rlb4nB7YZ1MPT5uZr50UgVHRSpij1mpFF52iBZc7Q7cImJGTFKjccN3QwS5Y
	 BPTGtqO0ByvoUXccDCVCSuboZrmVcmjvVWHJMo1Bg7pPiE7gs+pPJJOcxJz5Qe9TuEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=;
	b=LgUVPF4DKBtOCrsJsT+lXZUd+CBpk51Ttvakv20pBHHjj2x8dHk64lWvm1dRjJFSHzSN
	 K9imppAUyc4tEefCiHbhP+0n9xyj+9G97VuYKYu1iLGqtRwTx2b2IB0+o72YoZxthKqaT
	 cc0oaIdwnv9FnaDMkKQKN6kMWiIMy8FFXVMyu+hUhs6gJNvLALx82cgOiuOkaeMwQlFjj
	 OdZ/xyVg6tLUSTPXgCQ4pFwS1WG9ai77pAwUP4g5Mps7gqKtTTgy7V5ZY7x/34aawYGit
	 BPJskkOuM0U3hGkhghoi62SSJxDMNg8YQom44K+Zwv/RakShSSIa0aHSqrg3+YxlE4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="TjzApD/u";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA7606D81D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABA7606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TjzApD/u
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2093432f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649213; x=1794254013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=;
        b=TjzApD/uGH3hLZ884dtVle7ojDH/UHexKG7gL2q0/x0OSigv9NZuk/xIQWnVXqUiML
         OxyK9LHFrK1kZUHBEyMZGb5I8kCabObeWH0EG2mJctbmhJOgOndJDEWr51hppTHsAsU5
         bOMxwqXhiyjqSGMRKFaSDWN9HCoA7VFQqDdbJ0CAwlulm1YuWBGGhGK0kZlhm1SUKRzp
         boeatkcvd3qpZ0dkrLBxcy2Wgeti5JmX3TT2lq6n/nc3E4ILdu0yBgRKkRV6VSF6h7mr
         QTqMxAyMoS3akennWqbvfcqLYS2yKrS/zQvXFfIJPbrrWLQLCvYadq4DG5e9mscvpiVa
         XF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649213; x=1794254013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5G5Oi9tmTaDaaDivZDz2djuyaQ/VmV0KNWnT/BwMm0=;
        b=NeSd2yIXjjN3WHgp+cVwfAnxNpdHwR7qAqHJISWrkeyOqDDYwK5YdI1xnbVDc/HVW+
         R5mqm5nBhvyRhn+2elIPDRk2ltICq9VGtcMVLe7c1EUzEVs/F7ubqwRWXWcWnLRvlThq
         ir3FS9TejpPKkhN2aXDgyHsxn1l1z70LJuxxPxzRmqd3ZfobiKUeSFsO4YECNm28Pg3K
         P26WyFpv6GQX18wu6l/y6xqcEH9Z+Iai2Ig6ptXt790m4BnQw6Q9wi68hLoKLp3XyMEk
         HrAUXol/fy6uELORmZgwJuOTIRtCEuKa3141Xw4DVy1Mm7SC2DwYvMyBC4iiaE+wINCj
         89+w==
X-Forwarded-Encrypted: i=1; AKwUvBwwSY+xK3MwxvB9pHOqBJRuIGE0mNaVx6B+I1sNtqoo7lHRZEL8tFG2bMg8Ea6+J9UqCxrowN1u9jEr7pU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MdZ8tXtrLX73AoQ+CH5cD8eo1UP6QyNlIvaMLXCc+sMtFEALe
	0hrALGrmWsRKOWkReMpTMge7EF0Bhh3QasvVsMWLxA29Oq76iYavL9kkDWNL7cfOetI=
X-Gm-Gg: AYBFou2cWtuPcFfFZQLPb6RGD9FNqYZyr3xJfd0L5J+O4pB0IlK8AUwd5kmteAOVMyH
	PQ9S7UvYaqniHCJduWe2cI23DG2zEDFXwFM3cwMsgz83v+mjvEoIaakqVlaiqRNsuQdyg54mM1y
	5gpQvlr5RukLx5vANXZKO/6knWTB6m1FJLb2ArMOx+N3dJm5bHCABuZXMwiZDhoTkLdAVwXuLfo
	DWaN3J607yWaLrFZeYlSCwkKqjE+Dc7whU/2M0PvExtonOsqinCc/y8Ru+dipr4K6FF3k0yNk1U
	cniWg8e97O1LH0pC/TlkeUiyGoNloCqfPItcDIia+KHEYXQZhxKUBRa86xzv1FNW8tpQST6nuO3
	NGhxwQrVctUJleCM0FSm5M9tWKkQpesT0NcuZI1svVjLCf4/26ZicPExEG4JmAgoE7Sr2BGC3Zt
	ofCAfx+dOf+irf1STIN/nYI/xTJQ4NC0juJh3NORdN5dkliOzShHwCa1C54wgy0v7iaqHb7w7fN
	k1kfl/Wu9XpW5YJG8UDXsq86OfGgAl14po1iWZ496GMjiIK7FDei9lXGcrUD3ZfWXoG1vQ09UPN
	WzO5/6MrbcGqJmjoOhhOcj23/+Z4DOL0xqEE8o0f3f2e3+vZW2C41o/ivENhqAki+rYeI8VeRgF
	ygHqGdVn+30oCx8V3DFtrpUNPow==
X-Received: by 2002:a05:6000:4013:b0:48e:6264:c388 with SMTP id ffacd0b85a97d-48e6e2ff911mr23181536f8f.23.1793649212689;
        Mon, 02 Nov 2026 11:53:32 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:32 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:49 +0100
Subject: [PATCH v3 3/9] ARM: dts: omap: dm816x: Fix pinctrl range
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-3-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1269;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=P0EUDiEV5xVvoAc15r04teIU1ur9dww1Y4noU9iuuEY=;
 b=hWsGqtoEWoqx9qzruR2/klCLZ1d2o0pZzDW9WAI4o5XM6uZIewzua0xt5k33Uxf/kYfLHjJI4
 6ez87CXChQXDvHN4LYW/ZD4wk7GvPZYihUn2fr+m9G2qHv0+6+iOc83
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The range of addresses accessed for the pinctrl module needs to be
extended to take account of the fixing of the size of the pinctrl
register to be 32 bits instead of 16 bits. So in order to allow the
final pin control register the address range must end on a 32 bit
boundary, not a 16 bit one.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 261ebca8863d..fc124f9ecfa1 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -90,7 +90,7 @@ scrm: scrm@48140000 {
 
 			dm816x_pinmux: pinmux@800 {
 				compatible = "pinctrl-single";
-				reg = <0x800 0x50a>;
+				reg = <0x800 0x50c>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#pinctrl-cells = <1>;

-- 
2.56.0

