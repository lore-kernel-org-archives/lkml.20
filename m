Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649220;
	b=mLbKJrhymm2WPfSbQoHKb50oHWAV3mL/7ZeDMm9Mi6t/OrfmmeQTGDSib5hRHocRWSsH
	 TjDdDi9C0ye/IkunSp/myIIAs9Ipq9mPuorhvr94j9eajEpr3or+y3K1BDY4sOXXj8Ce0
	 vDn/7C4gj7AaAeQb551d0NKKRIqYn4Yc3+LaX4SICkhD52Q2+2HFNRwIhztUOLRf6yftt
	 KbA1cAmMViaVOGisn6XdcCtfiAXglmqubkzHms52TEezkTsCMQtotmnI/8FTZmPwHYDQe
	 jK0gevaYjEg8Zbgnqd8Wahxbp6ZPPEnT3rCRo4PxM6S3/OWNdcv8lnKly8nNNrrCYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=;
	b=iORapD9TmX7VguarqwXg8Vl3V0oM4wsMpqUZZeMkTRf4d/4egbjLyLtsCOui16rYOrqK
	 a5RCVw0JilqXY4vwUxrZwk3+J+uJwKlRkqKaFu9b+9rkIyumPQLiPzjXTVrOgfTptDZmh
	 Fi/mcCCE92iWrIAwq2wxtJSlQD/yOO8b54imfOvvF5D90MscBHyqUmoBAY6vsyXjQUjpr
	 4cr6iGwVbIpFWornBmXMbjVxQx+gZdr/aUD0qzNMFGRWWbNQ4hEo0z3WbZ10lgpce5dC5
	 V4BzmIP+hS8zMKNHBmPQyWIj9WlaTW0HvKyIAow2VKIspCGEcP2X0MPva8dgoGxOo/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ihhePW6n;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40645606EEAD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40645606EEAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ihhePW6n
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so36340805e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649218; x=1794254018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=;
        b=ihhePW6nG5aQKA6k0s6mG8ZXxjGO7JitLw3yRxzPxncDkZfGWQNI6++JrLCSd48y0U
         0M1QprzxL6xmcd8TADdM9AFoTElRw7DqZYAbfii1uG1c995ilrV6LPWOZTpBA3RTvfIR
         wlsH/fpoq7FkEO812jxLGv6TPyvzbsQwosGjHaHSCQaPdPImC7kKNbG7uurXZC92FciV
         /n0mkpaDJ+pe1Z1ysqwpgXHrd1E/cmEeHxoxKVWy3oqk0p5mIWOlxhh4PbgoDvbEF5mz
         bmxdZPndCtpm8K5Oh3lAjQ5LE1E+LM/F24EHRYFMrcE8v2s+olmr2914wxAYtd4ME6Xq
         59pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649218; x=1794254018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=majDZyUsfWyRx1U53vBoYbbsfxp7bUhn4KTUkz67Qug=;
        b=DiW3solIcqTF4rfozErP7vu2RjqpvQ2Wvr1Q39teJ3xuEugsCu2sIdp3tcIPX+NQNA
         RknhPuyPR6DfphLU1PPAJdW5Sy8Ih2MJrRo4fFElEzlz0MZE31Jdbl/3c71x/Fb4KePR
         KmbFm5Nuk9FHlWRAWFag1ewx+1aAA4uBuKLDx6eTrcyYIBtp7Buq2+NVVCLsxhpN83kx
         NoD3BsDUIHtFPnfy0Je1RkTIMMKg9RcVxdHdGtGy40YIt/XA10LIReL3qKcMKppnuYKS
         E6hq25Z0nmM/ZUr7/zeH1SO9Mdy8u6jiPnxvzZfCOcn5UdZdafi7/pUwXvA0rrp50J7V
         eiAA==
X-Forwarded-Encrypted: i=1; AKwUvBwYM2+1S2S0bFOJkI7ctEehJGb5RoAeW7l8F795EEP21W2rpkzAH/B/Y/BV3dKx2iFFzJICKxqwDGD6v3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBM8ahSBZNEINMyWYO6cXOumuOOrTby83zS7T1s3ezRtc8qD8n
	1GCgcd1NtQspjk48E89lR/TaH7rg3cN+PKzJFfWeJi6nVHAFrDYVASK676yEwx3z6XU=
X-Gm-Gg: AYBFou2FAZGFjlYXXYo2FfmrJxLVZlZIatpdm3VJCtBBVs5X6jQgoDPbBy1VFFIclgr
	sHYnXSE4I4FiQ43Gtk0a2x+6WTwdI5Rvcq4fFiDyL9IHuB83v5evU8LgRaq0Zu+OJ4CMAU6PFdm
	QU3JJ/KLcbzCeI7lsNFVq8dyyNZYCoEoAWtjXFhRNyjoYZtBjFd71CZhawKc4jerUfLQqbBLo3X
	q24LZje7Cr0pw2J6r+TAfUTWbb/tgXtBKRMI2qsGSt5Yakd5Fo2R7U+QQmCvWXfofXypEXvMXar
	oQVWUpb4l+KJ9Szxw5fR99Opq2CK/5LJT2lOG/uoX/yz5MllZtNR7odgi0LdpLEQuLYckCWdpLN
	q70K3WxCqwchqppvps4iOCavXm2keloendCCPMtbLVedAv8onZBdC4zyg3D1WcWwdboGpntM3CH
	K1QNsnvWRxfsTD3B+3LgjmgDKAHGY/1wFJWoN83fCwEkr2rZiy3lGqOlve3DMy4D+YVlDcnPtH+
	IZALr2jzw05T+Z7cbwj+IsTP1DQjJQ6DrcQQIsXecWAqq5+aYP3L6InQPu5UjPd4MaEei9w6iSL
	/XUHwclrJznrNe1NSnPa30VrA5rHHIQZsAbKL493d/F8et5QqYjL/aHnfUxVi7jCyjOFCmP0R8G
	OAH8j6A1oMad4J1YzfzDCmeZ0itI=
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr33884285e9.23.1793649217703;
        Mon, 02 Nov 2026 11:53:37 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:37 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:53 +0100
Subject: [PATCH v3 7/9] ARM: OMAP2+: ti816x: Remove hwmod code for USB
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-7-9bd6d1d128f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1624;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=k71BaTXmePgSJ8uhTSNGLd6YddqmO25ujKt3OAYRrbI=;
 b=P8AE5PbmCCLuy/Ppxw3PTz0WUPfmfz1xHkFqfzmjk7Pc+my/DThex7cRdc8Cv30Fio8oEhxUz
 1kdtOJibLGlA1JLTSPIVWpwfXfCOB886FOvJubPpva5dvZEc7OZGYtR
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Remove the TI Sitara DM816x deprecated hwmod code from the hwmod data
file in favour of the ti-sysc implementation. Tested on DM8168-EVM.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index bdd04fed8034..8ca492ada179 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -646,26 +646,6 @@ static struct omap_hwmod_ocp_if dm814x_default_l3_slow__usbss = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_usbss_hwmod = {
-	.name		= "usb_otg_hs",
-	.clkdm_name	= "default_l3_slow_clkdm",
-	.main_clk	= "sysclk6_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.class		= &dm81xx_usbotg_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_default_l3_slow__usbss = {
-	.master		= &dm81xx_default_l3_slow_hwmod,
-	.slave		= &dm816x_usbss_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_timer_sysc = {
 	.rev_offs	= 0x0000,
 	.sysc_offs	= 0x0010,
@@ -1225,7 +1205,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm816x_l4_hs__emac1,
 	&dm81xx_l4_hs__sata,
 	&dm81xx_alwon_l3_slow__gpmc,
-	&dm816x_default_l3_slow__usbss,
 	NULL,
 };
 

-- 
2.56.0

