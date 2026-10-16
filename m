Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFBE4DAF84
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161694; cv=none; b=ZrF11leBZMxhHBKLrzrYTXAntZ+tl4qeK7Oz2NXH1rqvyAbRQy5EB93O9ac26ac9aRh7u9s0NiwctjpQ/HpDcPkySTMgBbc4yohwYsMCWbsQEOfvtqT82UOz6ApV5ugVfgMR4tgwZrqXtBaiAP/IhSKIatyQCoxSDU1qqKd6Ks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161694; c=relaxed/simple;
	bh=SXE7EM9go44I82+wxylQyrQfmfe50KLKxHsMKbxaVM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzdXmnNVrBTe7jE4HXSOa7YiBu4rFCDf8tG+2OBjGg/IVEk5mHDGJ/zV9rFbKOTmqU1s1bNJpRfpEkTkfKmzSzUJLx0lqJXTBIH6e+0gM5QAMCgq2NFlgd3ZXYWwV+69Yht6Il1TfmR9LpPTfD9YB23qCZWhhdUxqdv036e+vdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFDqHDiI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFDqHDiI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1157000f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161690; x=1792766490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUR/YLwF1kCyO5ZC5rt7tI7UKtYf9pEFcXU9Gk48s2A=;
        b=dFDqHDiIWjyDoR3PN1KHfJlAXxKmEvdHOCz8YtWK0shtdpOOFjdxi2FXPecluJsETK
         7kKvan2axXdY5j0CN2hZ2GCi3UoshYcNmLDKbqNl4hrxe5SBVw9DupIEkUjY+sD/nT81
         7n+/+5yJwIaWFb8qn7bO+CPTP0urbnX59qa1ZiQi+6NQvIBZBAva870GmSoqX9/dN1zH
         vYAM6qYJnIRebM1ibMb+4lJFvcCHR6Vfsebecdp6mWe7M8cjF/IJfTc9knXjNEWRv48b
         SPTjqYhgQoPvgaRam+qwe5Jrd0j/bfADlqq1or6RjQmuYhCsW3PELagbLibWkgetMN5v
         +sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161690; x=1792766490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUR/YLwF1kCyO5ZC5rt7tI7UKtYf9pEFcXU9Gk48s2A=;
        b=JrYjq188G5ln/Ig0XKhGbDGcnamJHKHukiuRxXk+/IyQPPQyrU7JTGoLzEG1IfaPdr
         hgo+XscVzFAs9cnukkheGM2D0QdmdiweoQeMa+xKjJCP20Vpc3N9OAWVk9NBZe9Ep9kp
         sYR+1WBctRv1hEXTqaNIZOaHYImDuPMaFB9QCHu8Xldkyg9OCqL8MeJ1GUUF44Pq/6Gh
         CB1YMd3NXSQWko72DabMqT2yGFaekikKNG4nkXmQlSdIHcig1Jt/WCiSTcjruuWTvH0g
         O9jCqbnv1PFRm9s/9VWbTrH3nsf4GmmRn3CGhVf8VKwy9B8HkWpD+9h8DTmgED7za+qV
         dhaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfZepTtyHASEhKosQTG+rU0otIXoSrgS0/EvLiwxT8NOaYR8PHJvS9NmJBf2kkulDZ7qNOsoI76aN+8bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIouk23nUswtPsWQVZSi7v9PuXptFau9NuAzzKS8O4tfZPtHLlL
	5V965FCLov+V72pSl81ct3Tp4aWY+0mbshELV0MCbO2HJNzyD+xgo+EusQ657freUYw=
X-Gm-Gg: AYBFou2H84p1G0hB6tN1yB+JKvaNOGsXzLRLHaJWpWi5//I4OOC4QYEcWIJuLNgvZc3
	bID2IcZrP7aXrhtdh0jHG/nNHso2F26+38CYfBRmPho+QVN7eS1zje1m5SK+NbKFwT7F9GX3Bxe
	C9v5wg+59WOMyBlwcHxLZxtS/8j/dLXPUbY0y6Ahw/g5uZ89SWLUYY8hmODkXdlh8Ngzsr6rGxt
	ZisyQ9u69x1uYTfkjUSg0MbBuX4fbamwG+aE60c+5oQhln+M8LdJeg5iiIoCQDCk5V9HDC+Q89g
	FwpGAVOgH2g7Gby8pBM4Byf8XP1DkRcYanVhGk5xVGpurikO8k1Ilsk9mH/4r/NlXYKJ3Mzsq4c
	jBdoxXEa+52tZExJupxgQ+bbBNtF+VDnjAj3ozNqoTOtSdos6Z6fIpgSk6LG+JjILhQcMMSgruI
	6+YztcFmXGsSv77wH+7UChBySVIdv7EK1TY4BwzRM9DopyCIsi+fMuDFcV6+m7u8QHZ9iSX7BOj
	DFfKCjyFnELXmTFKPbs7gY0O0aXVITTHiEQXKBxANshekoYWAlb/5khfy4boTuQFLMtfA==
X-Received: by 2002:adf:e001:0:20b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48dba7b405bmr33972874f8f.6.1792161690556;
        Fri, 16 Oct 2026 07:41:30 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:30 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:22 +0200
Subject: [PATCH 07/10] ARM: omap: dm816x: Match up capability flags for USB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-7-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1043;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=CFF/I+D31PVrHYKqsweOt6vSe2R5OqOPYaNCWBw37UY=;
 b=LP5fDZPwM7CVSE3wLSXa89nNj26IEaZ31pwORyTzdSsNC6k2TVwNfT2MMN8qAxmunIxVtM5C4
 gkH5DkC8cTODb8Sw0gMjv5I82BbIYKo1g5/JP8vQzI06VB+kG8hskYd
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Fix a warning about flags and idle modes not being as expected
for the USB driver. Updating the capability flags for the USB controller
after updating the USB devicetree node.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 2f55dc32e150..d2c20719c100 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -616,7 +616,7 @@ static struct omap_hwmod_class_sysconfig dm81xx_usbhsotg_sysc = {
 	.sysc_offs	= 0x10,
 	.srst_udelay	= 2,
 	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE |
-				SYSC_HAS_SOFTRESET,
+				SYSC_HAS_SOFTRESET | SYSC_HAS_RESET_STATUS,
 	.idlemodes	= SIDLE_SMART | MSTANDBY_FORCE | MSTANDBY_SMART,
 	.sysc_fields	= &omap_hwmod_sysc_type2,
 };

-- 
2.56.0

