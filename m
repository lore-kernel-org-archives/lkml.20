Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207388;
	b=SBM4BMBzd2uc+/CuiZV5Ziq2dDacZcPe6+I+ojOLakbZfcHHBHdIR+FVn1Hu1Y3CbY7F
	 NOizHf9ynx2xx4sTr3138M3kvTVCg0dFauajYOOV4jNaIWqLzBRWDqyd45eUsDKliC88m
	 4mOOPRSaKkr1rlTO1alrWmHBcxikOd0npFy5G3PuwhtrglObYg2nJ3MSBUFtMVJ9BgU/a
	 VNH0RgTNizUoznNVLm0/H/EAomsCIQkVoM9fBzn+0C/xFEIy1dgAMaXqK9USEgMzDQrCE
	 bhUxFvX2IVsM+F85gi9dPvUeadtGR4mY/I2m0BuEZ+wWhYGqik1thGExHj/GFivhyAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
	b=k0QqPE01jiMxH1GfB3It6MEkPhXCMaviOkiYLBwIbRxV3Q0iBeHWXwMGSnQ3BcWo3MWi
	 uob5YErZXCzrhunR0ACQs5psMQxPyTZBLv155fsfdpEYZNRVSnov2BZwxnHTyWmuEeyzY
	 8dtLwcwdlCpE/HGeD2FDU6KO+If63XZQjIom/As9Q2REAi5kDAtfLM6xD+DaYx/+9w/7f
	 isDXiZtZMB2DNQztJdTJhXVTcWUvHdQiC8IkYuvwIpKpJFpnCc7389AM5s4zlVMtt3PuL
	 hpb/uIaJ2gXWsqNXeH9qmuimEwU5H37jI+DjE3xDj4O+NO6f1FS7PKghXUQHXrDnY0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P/7lGESJ";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C775606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C775606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/7lGESJ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a8cc11ac42so340809c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207387; x=1794812187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=P/7lGESJOqQUhT7h1s+3DPI+dJwI/tDsktQPQH7wk2e2rEfY5w36Cvbt/COY2lXp64
         XBLpKmEnv/uQlyKUuV2ECq1dIXavPMMnCcTTJZmca4iLfN31v9/8KkqwACdDZaz3w8dl
         Nq0WNRj69iZPafeNLy4kZDyyh43pMbMm8ziolGA3CIyCF2bkixMwDml1ioSbkUQ8s8fG
         uhBYa5sZJofc+SbmfV+4Wc/Xjn//k7ftrSTQoe00CgfercTPGs61XFkkOpJDOkGj3R/h
         xbDQjWPaU8XMearZY4td9zEycYH2BL9aKcXvKUjckYfIcqIoS6UZYB2LYE+nihO7t5+U
         T+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207387; x=1794812187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=KeeFrTPyHhCOhjKgZWDEvMdQYvfcg4zEBSwN/zSBDiiXNn07KhcA4fs8MzT2PqJPSr
         RnjrNIsUpIJf2yV//L/XIOAcASjitJBrFlXm61aReD11anEXhKPVFvZfj2yUn15qHAQG
         n4TlM8ntdvgBjaIslBYoy2meJS75JEsHaP+JyJPkDRhdEkAjuZs6ENA0IpeRcOlgOjp7
         CT3OHocNUqn6HUwyATuRWifxnq6yRSz4IBWRwI2yAe0yX5nbcy1AuA8DhMiM1+k9Fshm
         edQyAJXwuFxvX0PbLE+ASGBNHC8Wr7uzmPTDoG/luc1hmlgVBlddUoIkqBAaCyAdh5Y1
         1TUQ==
X-Forwarded-Encrypted: i=1; AL+hErHuSJeZ6bKL2uIjknwBtbmDAEO2Zd4j17D0PJXzK2yJkBIc53J2nppkjDi14a2bSqSFViNbx8vUFFK3HHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bK16pBhZwqVheWfM+Y5jzYgres53Sq37mqorgPPo5/pJG55q6
	zz5tGbwrhpWw394yFsHWBiZ30Py/1o9DjyB8MF1xc+bF+2SQT8qweK3Z
X-Gm-Gg: AYBFou2pAae3hIcb7E3xKOF9sEn0Zuzsx5gH9tfbdIxW3Ge4goyApBMX68XmWIKS+20
	R6mNWHG2rr8rxKlyYkjrx7GIyfReMeV7dddwe3ChvLUCAqpL3e1UMsIqRYEUo/VZz+Ua49oa2XD
	Eqhaxq8wrv+vh50yLWHdOg7g7jCzv/LS+L9bpJSjH642fqpcCszY25wNSRFjawNLgoO/8eoF9p0
	dfxqH8OihAVWGKtd1y+LUI6pbk3CV2Pi4FnXd9bzt9YnOCul1Pola+vGzGwB6emP7zAb09KH7ba
	mFyz97XmZSwqwOGPCZtAjPnmrthZbea7dmvgrJqES+MA2atDPeCQHbEBk/osJu0Hc/cCyDYT/z4
	fX5lxnxtmby+xdaviXWuGDRRQN3H+rPQULatfV1raRGtQdT1XsUjL1doxyBDCHhkqrPLYc874VG
	LYETPDjPsgXF2cIEAvZshX91uaZruQseeiP/JYMj2+AcC0JReWgK4r0TfNAE73xF0+Vq2Tbn1q6
	+c/R/iyJ5yG4CZ81qDQH0fmlaaCX5Q7j65vQv7MrC/9Jbsi2ntWa9E1pQiMchouCCxhV7xdcfgw
	x+PTsRQa2iIWdRCgSECgRtYpKQqrlIcGy54B9VX5pspzv5qykiA+GjRR93x2pLIuBHIQqcPrPiA
	DwSu6k0zmGOwa5KvQLQ==
X-Received: by 2002:a05:7022:ec07:b0:1b2:557a:aa12 with SMTP id a92af1059eb24-1b39fe8762emr6494368c88.15.1794207387028;
        Sun, 08 Nov 2026 22:56:27 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:26 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v8 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Mon,  9 Nov 2026 14:56:05 +0800
Message-ID: <20261109065606.62641-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
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

This driver never performs direct MMIO access (no readl()/writel()/
ioremap()/__iomem); all register access goes through regmap via
syscon_regmap_lookup_by_phandle(). linux/io.h has therefore been
unused since the driver was first added.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..0b9976fb15c1 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -5,7 +5,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0

