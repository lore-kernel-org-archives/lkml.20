Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585143;
	b=WrtruUAWWtU+6DorjwG1Rbr6uXzj6UlS01ATw/L1IjKSpeOuB2RXfj1PuF3gx/UGCoOG
	 2qQh0o9qh4l9YfD/6D6fFv3rx8ITCFIPTbNyVvrnEG3sqUBbWmVcXl3fsObGSRqIFF3R2
	 v5R8GdMZsl8fplt2DtEaWr9rzit7qEJI7ghBr/zlH/IDZgqtiSEIob/AA3xjSyYKHbgHa
	 /kS8XvL65O9Ks8m/UoQhI5TUCDAln/c41mKEQ8ch38IAtLjMRg0hAgl8dwt2wgg+MlF0B
	 ka5fufPoUHb/HSsy9CB9cIvHUik9IZ6ADYhzuzdblePfMDLRIb6xtdyy3zEvlMOUnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
	b=wbIiCr+5Em0RTBWoUmoSqpR9128HY3f25H6QjC7TkcmV3iCIlMzgOvVLNmaN59GqmwhM
	 yqAiqloxkkNcYLVffCULr3f6ZjfnTbAxC5sk5RgwFppd6OytvB+l2I8xpPO33P59bymOW
	 nS8Bd0FOaj4/ZjQxI3R0rDdQYSas8Z79tMYgywjVtgjtiGWukP50WgRnXjcYRDduU+xq3
	 W7AlQf/C3f2hIOAjcRBGlXzVF5fHDDKuoHmFNv3xeIAEGhEs2po7Ylq7OAdOb8Z+copBm
	 B7CUdv5BKkkN97CE2k8zMlJ4r04/oZfOASaojrUyLomFZRUC9Dh/+23x9J6HgvOgQIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ty1YDM3A;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E716A606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E716A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ty1YDM3A
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99911ead46dso1459866241.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585142; x=1795189942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
        b=ty1YDM3AVlYJqm0N76kE13BjO8w9TdIOnpTuFuOeWroj1FZsu9TuIwkC/BUP1/NA4P
         48TPHiFHI6Cn3LwbzA5R1Wymd+Ux8PvYbX7WROioGMkH/8Y7eldGGqYi1z5kh4MxMTr7
         hjWSktRzNy3ch6rceMZP/u+X0LNDJPdn7Lq2pZym0/Nzf5edSJhcZ2SeDmwr6aE8Ay8d
         adi9G2T+D9pvVX9OEP/53ltL6wGWAkwIYv7nO7mtn7t0raIOquZ845hFi/Idgw56DfBG
         sNJ1sir6E7mLKKG1MOObzYXNMmBbDeFdGjIhNaC2ZAHQ54vr27C+Z662OpGRm+7pFBDS
         X+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585142; x=1795189942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
        b=Bvg3J5rv6732tErISTqsXsEujNrAMorFT3ltIzNe4IR/K+aMFZu1eR01hc037THs/N
         qNFRBjTncBPAkje375nidYq7+otmKR4S6voAPyyiXBph/1jbgjI/P2q1f428xJQfKk50
         As3kwHREKlTm5WvzVmvscpg7CYkJ3V8Jpqpr2ET+0tjdIhrTZrH5hzQYEPuXEz4XJ7ME
         7MAyvDUnMdu5KQ+rVp9rMLtoI+2fg8g/72OGEHBuU/WRC8+pJYC91Ae3Mb03SFKNdy5Y
         UJgLVfcujXLzBII3QtnaVVml8PP6SrKfTlWJvByBrhx0bYpao0IgtNBweauKdRtKNU9Y
         wUew==
X-Forwarded-Encrypted: i=1; AL+hErEKghmlvAbiUFi6Q1ojTwL3lr18dS4xTPO2glULLyvoaaEq5enDI5H9XwouywxRQ/cBhaW4luCrHI+yrG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85jfmJ0HH0SNVUuGUrm7ckSczFTJ5ygKo0uNYMUJPheNNwEIu4
	ufRXJYqu0HBCPZN/YHiwkBzwR+xVw9djBfjweQVUVxdvqJbdO7Z6z4V4
X-Gm-Gg: AYBFou1o8626oTygRfvOo4jebyhswopnZkGovnPF24KEbazAA2xWw5auCCkQ801H0K2
	Huu7H7FMArNp8SP1iR4P7S3h7ZIsNiSEfTL5OJEwhx8AadzGx7iwnv+k3DwA8j3rI1C1vykEnM9
	1THaW2XGqV9REbux3L2G67mxaVZqworf5CCBafsEA9HyAxxIsQI1a6GFqhv0IifoctUHKREXj6Q
	FRBqddJyWtgr9qW8ZWYd2WSLvVGQJMfaMjCwp76al5v2fuKRmS/9GTqYn5uUTwtwEXaqXpbx1fS
	fDqmoHzLNv9V5OZt3Gc5IcSZknxzBkBVjYnY/yiShH/pA675jPgC2fejRaTlDwlGVGHuKoymD3e
	9ZmgpdkF62nbf7IjoIWfyzNFk42LOotle2xwwFMO1c0R6k87yB3BYDgV9TPiqzpUX84b7chXQVE
	xD+jDWCIdgDIkiNQCqCe7/oqR7KnRfDXaMQ4ZAvIj2a7LFWFpuIZ85u1nSMXrXvNc7/+y9wsjk9
	3W7ELMU8X23jUA99tk+BcK6BZAhI0pXFQoXQll38hnX4nE4bJdhDJUYCDecyemoqACezbo4rIxQ
	ylSTIz4R/reuI4j+hK18teWVxEIx+ftb
X-Received: by 2002:a05:6102:3f92:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d64d7b3c04mr1034478137.21.1794585141712;
        Fri, 13 Nov 2026 07:52:21 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:21 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:14 -0300
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-3-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=1182;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ACMvTzpi3rzHKOD3OMtDyhYbpZE8JqAqCI1yxB7JH0w=;
 b=HoglfcWoz04OuPV1Vqs6i563kJXTViuwqXiS/eO2JdpSsEGKBUKtC3UYpYkiHWO3E1ZIQKdt+
 ldKgsbBl3/UAFWUXAlzaLfYPZA21o510HWbuOJ6lbP7HRwY//8EaqMI
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c8..c28d63293149b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

