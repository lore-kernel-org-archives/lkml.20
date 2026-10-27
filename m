Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136609;
	b=fT7MR9VGe0t2bq9XU0r9Ju16B7k7fIg+MzeskzQEDQ8/FyGOcYaztv5pTnyR/+8JDB2j
	 lTsTbkp3xrDI31QnBP57eCDlzlV+ScO061SO37IQEjM6HkUNZE2sACzEHEZt5LAPI/ICk
	 2iqIVEhwcKOima8S6iHRbLUD1eEf5v7N8xSRWSJtI4vBPvNRNKELQMXhGKpo0/GgQijOi
	 S00o6oBX9OaNfQtkxRQPAjiz6gEN6/Fb4Q/0woDs2fe/KoLg5YVYcXdSwCFrjl1/c6Gi8
	 1CBH0w+dKwp7n8eWleIOVWBVf2ntLPihoBHaviFYAnRD24UYyl8HVQC1TkTTRxdbIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=;
	b=ZHZHhf23wwCNzsrJINCAdHAm180oUAaAyfO9Yw+IXCn4KnS0g1+aSRmCjaCeLrp6WYXp
	 ItOVkW4Mbr2jDjH8SvS+cF6zQNTTbJpznEDwazHBZ8OM/XlTBYvdjUa+MYU6HFjD1QqUY
	 mTXDCDj9/d89cKeo1Mw3HhD5ZhQtxdp3Q06EkHGJBNn1/F5jud0uc1M7jpW7ybEbTz1Ai
	 UEPxX6FyZqmxZDlR2izxxcClmTou/uPrsVxk/Da8QxlevuqWJLN4gkpXL1mIJIoZ85dxV
	 DKyYEPcdGqwxHuyZiJ0stzyO1SUyCAV8bgesIlub4dBhcQVxH8l74lhFQfADoBZ2Rzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBSog2+j;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F23E606A330
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F23E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBSog2+j
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15943c9c005so389160c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136608; x=1793741408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=;
        b=OBSog2+jN3r2rpNx9Xur5CeMY7NcIR5nhY5nwyK5qJTv6vsdEg/uwgSE84O/EDLBkT
         dJCpUYAcLnsDNmAHrCKz7b5pUdWe8t1tWQSmyRLFn8QaXRRxrIMXExJo/2i3r5u2XBtS
         w/sZtdo9mdegFqammTnz2fEVF0F+8gXcVzc/9OPKXoT/C4jfzK2EPDziW+pDE7ZP5NUd
         BJ+ECGh6UJjAuDhDJ5xcThQPfAFmRnpOxVHF1E+sj+UpWqFBn3uY2PZHGfM4CvVkIDCK
         LyidrJWMh/jMOpb29NDXNuODzODR4TJ9kPSrdAzax3Ym9RBcBG9sH4pmt9YWtpxa/bGn
         7m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136608; x=1793741408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NV11o9zfXhIcPZKIoXcovhiq2SO0KZWmadsYuDbCBE=;
        b=ErF6WM+1/nrzYwyNCCDoAE+QV6MHn6bCz/pTMrvDv+aVqawSXyXxEns/A3ZnFXsAyF
         20Zgw/GJNtuso/smS8ki09I96/f5mEhZzc4312RgDrVmybf5BeWuH5V5goN2JvPb0CHp
         /S1jWSo5yBYUspHdZ/KEVP99Mek4H4GLlkBdc/dH+2h+dqJnUh3FPh7gjBEt6obUgiq+
         8yU8Rs+O5/7VkISBn8VVFlRlNJm97Wh4uW9s/SsYHhnDL+OGzc+ZRzHF2AJiaDPRTBCK
         1cXnFppFYvbnth7RdS78Wd3MHId2YuQcdErz6zP9COZ2EGQ3vhGmPQG/KbwZEyz4UrOi
         ijRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYxJngOcnU1UQoIkmXxBifQXkfPjOvi1l21DXeYmob4FnoJI4t6+6byIM4VTb/okgFvRcjsz5ahyf8QG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi/WIOT1t3gjdySM29Nd5Ryef2Jd37fF7CwNcPgVYt+Mn6e6MC
	gP+E5+b9q44hp6ldCZp+LiHJzfolYJ6Re6S6sqbBgQ3LFgeL6cA7mfCV
X-Gm-Gg: AYBFou22pvqRGittam17u4UWYgK6C1tbDEEfw+SYIXHM8izdHN0hdrHG7PryV8Awz4n
	PVv5/bs59czF8vrJSJAz37pjI8fzMUqgkSLRXvEq003FzW93nD0wHFZCojyvaGiCra674FEtoIO
	1/uWKqNiVkal0YvhSkEzOibhMJxeAh/JWKETM2kVvIhLQtbmhndPrKzzpSgEi81dGYzHffIFc9M
	O1Fjji8MlsQoGFCrjj1PdestYMV5C0tDC1pv0PVqUBpv0wFPe4qoLCxeWO5cxsbtwsUdlUbd8AF
	AQ69js1kIi50MVrRjT8SkFjAnuGu84fngmCCOekACWlIQQeOEa1AFkrQtekAGmFemyWVf3DeK+B
	Pshuj1LgWuUuBRdaSb+m/i1ES9/AEtTlhZZIfhg1H4u477+mVbpZyJcJRw4d6SLZHvVfSgwHFJ3
	zWQloK34uDZU4EO4lu1+GweVBUAbXlxK1SM2zV54kLPAPVIH58cfzrg9bLAlUoYDr5JsEu0xM3g
	uBSpv5QlmkWMi7Az9gDRSstk87Yaomeg/J3ysDfXQ7AXsvYyFgramOgRam4GRghDjV8izcynJXY
	JMV2c7R684JZrJHiAThzypwTtQCy7s/xBrCJaNc0sGhM
X-Received: by 2002:a05:701b:280e:b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1a6cced4b3dmr557529c88.22.1793136607833;
        Tue, 27 Oct 2026 14:30:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:57 -0700
Subject: [PATCH 3/4] ARM: s3c: crag6410-module: drop empty wm0010 platform
 data
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
Message-Id: <20261027-crag6410-module-swnode-v1-3-2f885799b6ad@gmail.com>
References: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
In-Reply-To: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The wm0010_pdata instance in the board file has had no fields
initialized since commit b53d47775651 ("ASoC: wm0010: Convert to GPIO
descriptors"). Because the wm0010 driver already handles NULL platform
data identically, drop the unused platform data and header include.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 6443c816d111..55f55e9b9a46 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -20,7 +20,6 @@
 
 #include <linux/regulator/machine.h>
 
-#include <sound/wm0010.h>
 #include <sound/wm2200.h>
 #include <sound/wm5100.h>
 #include <sound/wm8996.h>
@@ -45,10 +44,6 @@ static const struct software_node wm0010_swnode = {
 	.properties = wm0010_properties,
 };
 
-static struct wm0010_pdata wm0010_pdata = {
-	/* Intentionally left blank */
-};
-
 static struct spi_board_info wm1253_devs[] = {
 	[0] = {
 		.modalias	= "wm0010",
@@ -57,7 +52,6 @@ static struct spi_board_info wm1253_devs[] = {
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
 		.irq		= S3C_EINT(4),
-		.platform_data	= &wm0010_pdata,
 		.swnode		= &wm0010_swnode,
 	},
 };
@@ -70,7 +64,6 @@ static struct spi_board_info balblair_devs[] = {
 		.chip_select	= 0,
 		.mode		= SPI_MODE_0,
 		.irq		= S3C_EINT(4),
-		.platform_data	= &wm0010_pdata,
 		.swnode		= &wm0010_swnode,
 	},
 };

-- 
2.56.0.307.g5fe7bd680c-goog

