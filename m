Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586133;
	b=n9IasUzp/qz7epKZ+AVhzqOswDlqfp8FqIN++xEMg72HSb4X/q+UKZtQCKratfOj+D0n
	 zYgJh6+5e6E1dZ5y6UI+JrhwuCgwaF529ALqtdU6fqRm4fPXcJBQcKU4j5P+lBFJYYEIX
	 Ad1hb8W0nk7VYo0hj39sZHREc/MJsLzuEg2RHo0AdLrJV4UWTQrBRm5wAvSjEaVkEafO8
	 VhxLNBpVp4nZYxZQjOcFtEUQfPgFlyi/bStj3C36sBUyENdX7i+Jwzl+36mzx9YcRjK/l
	 VVfux9/CS17//iDV0jaXTtJ7x77+ggWNWXfkLSPYkdPEHcl0bhVZsJeN5r/DxgW+ugg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
	b=OI7/QYRFaWMVMV7m2PxfUz3k33fOzYGiUjxE1/zMZCxW1vVEIRm64jNqNQmUOesBZM/a
	 ZwpYOx5zjg2MJRvd4P5DEg+eu9kwumJ79KW+4Bd74TPB1spOqRhd5LBo6E569V8zDp5hF
	 OudioJ6zj/4CQ2mDXweQU6/Mt61YuRtdb2wVz6HA7KavHLmQAy6S6541xXZHebeWmWgpB
	 FkZS5uZ3xqDG7GD8M+pK+XalI9vDdkZPf7zLcozrnClBHTHR7GZJOkVAEUpXCkrrOu/pm
	 o6IdgFJuDSSHiOBCGV1Yn4SJmUyHC0w+SZd0zu3/L8l0gB8tmGph20BHaaQas22N4jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PjUj8vec;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C429606ABCA
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C429606ABCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PjUj8vec
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8520161fdb9so385739b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586132; x=1793190932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
        b=PjUj8vecJnPAGe8RjqByiqB9Srfv7qD+YdaBM9MTShzsDrCv3AH3hAc01+sYO+TKRb
         TkIsKinZrL9cGdn8qFZsc9EjFHEQyMTtqXTHYev2UIYSsHSq6027+d2XcC19O5SKBbBI
         e0cGzJbTCZapOzoWLitTWVVGHDKTelTsV8b+/m5Zwm9ghPJBcKeO82EPP7MnZEzbTDrl
         03s4vXZdPYi0bkhNWHy4/hU7TXOfYx922XT1dTUB2seX03OY5yShOt2w18IXjCsUllF9
         mnmz9oSvP5+bSFk652m05RKZ3n9vTsUkR/sJFcjf3cOXptD4ZTfR4llnP95fM5TdVmEU
         EiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586132; x=1793190932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
        b=panTZKHVyBHmog5D12zaqFPsy6jlkAFR59qxknnGVln/Bpx1gOHwJOuHeeGMDKhf/2
         7jHqDlEfJZxeJIxSMoBilVtDCrTo+UuZQ0ralZh6NL1CfaAUl2UsXjUfu5dk8Z8G+OxA
         3c6233m59snHkfxsD+JecD1hPFuBNSOfFK33Qp3xdOYYFRm9c//cLRztc6BeG9wkwbnT
         zyRz/uWbqtDYug9taeEDxzBZrxsmWl4NTYVDlubVfA8mXAh4Ol/Cm/TVFqF1m5pjh/0d
         li3NeP/alXy/njfkPCk3vrY11wfquHxpXFGUHHkd5ga//Al9epPnh3REWVPeRwp3Xwtm
         v5NA==
X-Forwarded-Encrypted: i=1; AKwUvByJJ9OzDONzA1/6HieAbyAb+ETDD2S0r8s8bV2uT0kPDd/ymEpX/mjKtCXHQdl7k3ps6r/TdSg2K0QROpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIce+Xi/oACtK44Mr5qdAR5BKDJFNHWXDQD+v2/gQDKHBWlBT+y
	+SX7lE8geQQu5BRTysKj7cL29SHdbpCB6yrYU7dQ3cAGmhYlRn12Zdmp
X-Gm-Gg: AYBFou2VP/yQw4heN+LtN4VGMiEKs2Nalyq8aFMBI3CxFobOfqbzGpC4SGgZxcVZl/c
	7QaG75QkNhqId+lROTkHrYzoQDxnmze4UZCqZNW7cXD64cMC+WBPUs30XgQitaN8c5cTD6i1tr5
	JB0kWqcQWQn4HrbXb0hEC2lTTdkPkQ93lCY+Zt3T1/jt9/Sq07S5lL+z8vFWzE0xHqaohDoUp31
	4eiTuzYP6FNxwFYIrZ81xcEECxsgp2Z0vogg4uY9GFvJt7Y+fH40Gp9GUqHkPPAl5NLqCmvaxz8
	bEj0ul6mlWiw/Il607a/b5DkdH+UidTXgJi5+QUY4wb+Qj1OMvqhrpNJ8NFUuen4+Q1d5uvW4OI
	KOmmp8CwOynR4hYQBNiug14utwBJy6OBCh+jII9fNt0nRCna2sNbG9IdHU8I1P7mrjiLhJrvbE0
	tTOA6dNC7ezcTrEL8OfsDfNMAkFYKjcYoyUVzzj7Dyj6t3DNW8vw1WbWZRsI5IYOhVhknzsQ76i
	KvD1zTUypAIFUvDJNfr/HBNQXfQgutMxbgcRCWmilX84chH312iVmRjoRlgCZUXPT/+gV/1enyw
	S7SVDj8=
X-Received: by 2002:a05:6a00:998:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8a089c4294dmr1551510b3a.7.1792586131851;
        Wed, 21 Oct 2026 05:35:31 -0700 (PDT)
Received: from FLK-B04Q314.global.tektronix.net ([87.58.102.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b484esm825732b3a.13.2026.10.21.05.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:30 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed, 21 Oct 2026 14:35:19 +0200
Message-ID: <20261021123522.346317-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021084602.121087-1-sympthicode@gmail.com>
References: <20261021084602.121087-1-sympthicode@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
v2:
 - Move tpm6 node under ahbbridge1 (bus@40800000), before lpi2c6@40a40000
   (reported by DT bot)
 - Fix author/Signed-off-by email typo (simpthicode -> sympthicode)

 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..6240750b84dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
 		reg = <0x40800000 0x800000>;
 		ranges;
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
-- 
2.43.0

