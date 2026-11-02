Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649218;
	b=ccsuXLZSthS4ZmjIJmBOVWfQk/BUjbOPJ3oZcDfWP9AjhX6VeuXfWsC/2vkgPMZKAcra
	 akgaqgOH1z8vVJBU5YY9OjeoO/DSHCH4OSPc17VaPo+5N15ubRFDtOTNi03vVuKCeC20H
	 3jxS36TSEtz+gD0nfla3lUdGrYdGJNcwZtDy1UKwuh8wZ2js4U1b+kBcj4nJKi9BL34Ol
	 oSEvdhU7Fbf8V7+IMP7i5T4C3zsBLYu4maPuyzHFdIlgSo56T0nrYELjV9Iwuc2P0+ziE
	 wciXA3qdpOBU2LALanVp1ZFGcs01Lxf106qsmN0aLNhCw+XR06BUiZ+7L1I5Fght73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=;
	b=sc356EJNSnGfyyPvU03ctVxxFSnWnvgDVkLC/CjzgJndKAW2bYpxw5LgG477KkuRJT5P
	 a6p7TCvoUx6W6oxnGKGsuEOZT52iXS1k6mR9Wuo8Z5WkTYurK/pqo0bljox7TRTqV64gr
	 tYUWZSU5ZQMgcQ950ViIIgy58w95UDkmyQSp6S43RR754icg0zZvtHZmApLUtcoIorbKx
	 1ScjDbAncbiq7XQDELT0TXvyU4P976iHY6xexpbuyQCaUWKrWAoN/w2lUNI7t99DBOLOo
	 5GG6PmWTE6u8vKPoZWaUX5nb+jve8y5uoomA0SVHSKyoeHW8d7b9x0shfkhmBzRZeVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wr0ze8ZS;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36458606EE8D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36458606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wr0ze8ZS
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so22336785e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649216; x=1794254016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=;
        b=wr0ze8ZSw+SH4GDQWPNXanLZXkEVtyzUNtWcuEqD8bYpY12rL9ZY5uuFcMkEUTpI74
         WYivSYlbwK5MRgpoylmFHd+y3FJyeAUqoqKqpZgtTyiYaAbTvrV9vF+HALxpMorTpF+2
         PwEaniNrv1K6NhtElM/05sy4sXLZB0nR1nQ36RGpD1hww+VGIlgAxQSTlv1GPgY53F0Y
         7cRo2jc5SG1Aj/9v4LyY9F7qwcei6Tm1CiEmkMcsZWAVuSmEGwvTjmgDt17mc9T3BYYo
         dKjDdz+z3q37d0LNbGGIV4luI4c0cpdBmnHc7HzmWCSCh1BQt59W6Xbj6G70VUVATBPA
         0RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649216; x=1794254016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xImj77wxU1JiPHrCn+RpkXX1bCUiT+eJFmt0+GqsKlk=;
        b=pw79uluAwZPd/Tf6XKyfBx3RhUebym5yZ0Kc7TVrOl7/0KNVYH7Oz6FExtj+sT9Vm1
         ycYKSiQuvbaoVbGediwWR8MB35kM79geMjyfJ7A3UD3AXAInB6hKQPIJeyxXXPy4BBUn
         EBgN6062JudduSbW3SvRRG56/rfG/ncvMtocQrOT+Bp0tr1pJDxa8GIooHds4pDcT398
         jfAVt6iqmC+bewORtt92UioY2iv9nckYRWoReWOdQWmHAF6Xv167SaP+xGHg761qpyEi
         MfmclWAZf1Xw/dASNPl514RfEZeNBoYcdFMCayZGBnZIHtLhBIEHvCv5vIBcvKivg43S
         lvjg==
X-Forwarded-Encrypted: i=1; AKwUvBwuvGc7wez0OFmFRPBsCdwyVA7UnihMiLFApWMZrH847qgGA/Po8vEjWHMjC+yNoSMK1iIN7LVJOsw4SGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHA9iB+EfwcyqgsXXtfiaE9nZfUp5CZIf1jrY6Sh16F2rtKTjX
	rImZuXkzosLXOKNhVBRe23ho21p/ZzKVUuwKcz890hUPN+JS1IDNbCrTOKnged5X5fY6uYkysf1
	GmJsUzZ6hmA==
X-Gm-Gg: AYBFou27Vmd8/+1MgAzile1P447ri5acPrJNLCHxmo3X/l59LXvI2qkH2BRmAulrVO5
	Wvg8jux2AxDgFPI9Ghp+8thMWWXtnUJQXK/PwRAwkX8MMirmaPUpGgIgW2hprPGbKTm954emPlj
	8MgnT7InJPz4DQGCjd1WfBR6H2rdUiaPzRoihDX5McOWsUKmvdmo2IoN84WAdzNGmB+3qjZ6EzV
	kQBtmMXRn5otv07PGOTZIuuhBrlFokbmThhdo1cRdcferPj0CaazZ9iDVSd+kbORiZJ+IBtmDdb
	3feDk6YHT9j1EK4MP5QkbcP0VhkBctl5t7p9vw9ycmeEZX6pPKvYKVULr72VZAJqiXdJEXKJ2Ul
	cPy0ETJHxwcRlLiToC9i/lVlMv2AgooSFo4Pi4mSC2z6l8b/5h79C2NrzLfOF6pPAX9+jEE3NYG
	hPCQKGJtKRAtWgq9nZNt4NP5E4nj4xZw40USAqUIHdm01edC1D1vVeMJsqhwd9L09fWKA+fEvXs
	g+yqZzQIflWAxPA1LKRi3qZvY0LDKNuJz5hLtob4fUdJXZNszNMp3y8i2wDVSnlnEfh1O5d2ryy
	MKaIcmCEpanFfZK3Pp4PxaslGNlkJCpF5FWjkSW1pW51A5y39ohddH3Ez6okM31Gn3T0a6Fc1Xv
	Tdw4OEWx+7AYqzKenwXVTXeUQs+U=
X-Received: by 2002:a05:600c:6989:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4ac150b38d0mr253158745e9.2.1793649215549;
        Mon, 02 Nov 2026 11:53:35 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:35 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:51 +0100
Subject: [PATCH v3 5/9] ARM: OMAP2+: ti816x: Remove mmc1 hwmod
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-5-9bd6d1d128f2@linaro.org>
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
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1739;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=G9T2NjG2BfNSixK5sZS2CvW8OhbMENFuouCNl2SV0jo=;
 b=ZZLDjvHR6I7hIyGPauR2LYro//dURZ3tYARcVpY+gDOy8N4xYf/mLi6AHVlxgrzjl5I3lL6xr
 RBe+pYKXStnD6Fv6kqtmFRpBrzXmGw/RgUYx9gVc6FQ7jEsPfEUs7ud
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

Removing TI Sitara DM816x deprecated hwmod for mmc1 in favour of
ti-sysc implementation. Tested on DM8168-EVM.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..bdd04fed8034 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -989,30 +989,6 @@ static struct omap_hwmod_ocp_if dm814x_alwon_l3_med__mmc3 = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_mmc1_hwmod = {
-	.name		= "mmc1",
-	.clkdm_name	= "alwon_l3s_clkdm",
-	.opt_clks	= dm81xx_mmc_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dm81xx_mmc_opt_clks),
-	.main_clk	= "sysclk10_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM816X_CM_ALWON_SDIO_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.dev_attr	= &mmc_dev_attr,
-	.class		= &dm81xx_mmc_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_l4_ls__mmc1 = {
-	.master		= &dm81xx_l4_ls_hwmod,
-	.slave		= &dm816x_mmc1_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-	.flags		= OMAP_FIREWALL_L4
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_mcspi_sysc = {
 	.rev_offs	= 0x0,
 	.sysc_offs	= 0x110,
@@ -1236,7 +1212,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm81xx_l4_ls__gpio2,
 	&dm81xx_l4_ls__elm,
 	&ti81xx_l4_ls__rtc,
-	&dm816x_l4_ls__mmc1,
 	&dm816x_l4_ls__timer3,
 	&dm816x_l4_ls__timer4,
 	&dm816x_l4_ls__timer5,

-- 
2.56.0

