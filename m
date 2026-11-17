Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895570;
	b=1FjtKRSCMaFQobh96/nVULglqyRWS6hinHXcp6kTD2eTjo39xiZr8aN2bU/8URFTYxLO
	 xhHH8h40eKw0UPRvw1JSnQdhae5y9enjBKSG/Tk273bK4fUKQhRaaNZ4GIUsa6TZUt/Qt
	 NgQAQjA5xxPpG1LUgVecfsyKlayVnK/ppB3amY2rITbLuS6CXCB9rWqSSrdoAns00yFnJ
	 put7bYhkr3YSmVWqDTlvOTY4CGGkgzr+m0p+4IRRj002wgnEY8JHh9GyQnuqENM1vuakc
	 BVWBj2IpFLRFrz2zEjwTQZBRRK4WQQD+crZSYov+WPGUqOfiHXGvR1sE4ngYbftdo4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=;
	b=c+SP7NQskpfTqdCPHc2bkeh7ER1Xw3gM9TFl+qv/OuVE0R7SgczWrcCH325jgJeFwnOe
	 u2OUPM2Q3I93Xotcwt6SsMg9i3zLeBf6lIoEKXBqdLdMqLZnvp1iG1ethueqB5gqjdL5v
	 KeF9c1fI+IZCHNUxk9R7yy+hDOmzoXoKAF96pLwjCcihf4gGXAoPD1GK5C9GoRm4Bs2b6
	 iOJJe/qfm1x1E5ozg6Z/ZfGIrVEs7n4V5lkZ1FwBFU9ZZ3aaGW7k50HMWom906UARl7r2
	 6MgU7qllMHIEXCpsSdXZSSWwM4fxi5IRcluiU2z2uIenPzK91Mlui3FYXasLpSMKglg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MxHopM0;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C65606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MxHopM0
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so3627189b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895569; x=1795500369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=;
        b=0MxHopM0RoBSrxdcP0gh7Wtc+00aT+pe1XFBwhR++vrkRR9p3A4+zNGV9iJYHboU6L
         hEyHUZ6hG2q/BZfuPXKczNao6M/nT9VoyuPZRju9iHOFdTbCAXI6yaVlNAKM2DAlCA3E
         OvE3WqiZxLgN6mXNYVe81Uor8ozSE245dBZONxyE2SX7Rb+NbSEbCM+kEOdpCououT3z
         QndBh9pTKIjQnK78uVltO8m0LZmGTnR7UPZQM8j0UtO3zNDWS1GSHCKcS4GSjMZE7hAq
         Hsc1I6obwUAVhlGHgy9S02gEJj9DoWIzLb/+H+qp5dMJ0ApHw+/as+AzEtny2xus6+rp
         f5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895569; x=1795500369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl9vm/5oN7PPPGTUSOoXHW2ARgY0Relof58jU72z34E=;
        b=fFZozSII39BRVjKB2helkNM8gjemH+M4yR6sMFTzZXpcvq+hT58awH5z+XizS9Ucf3
         iyZ3pMEbGAaKx7iWh9/AZkzKsCNDxnSaPv74/gxpfDdpEEfgn9Cec6v982WH24dW8Gjo
         C+BhPgAPZ+0ZLvy9qy4zmFxXn5nPmnJMQDOPOxN1zl8u1ouFkW6KCELHVYpoTl+6RH3G
         Sg+m8ITNwTkHcRSZdDmfkXZ6igHARzYxCijKSKPLtmKla1OmbC3Ohg9mzSo4OeDEasup
         o4095h0VUC0/2/xfgTKGsytdycg77LsTIZaq5chw1jVGPQUPSEg81XckfaE4ozJQhSG+
         y8Wg==
X-Forwarded-Encrypted: i=1; AL+hErHJa9nLaBZGnv4Pr/KR/9IdogtXo7qADipZ0COtqpLs4/XxVv3fIVsSg9fSpgUCz3Y/8D79kQf2z1/fIwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NGRJsUqHGqQOyDloMwgrM9bri7oN6lGU63jt1vEMATpJJ9XI6
	ghEFWGseSRqCrvJTWdPPd9MdczkphZon8pMvNtwYcGhCkyUGPUuxKzjCWat0+Q==
X-Gm-Gg: AYBFou0fQ68Yue6oDOjmSWK6+aZSfWO97bF+kxKGAlLF6QKgmC+mo6g4x4KwLaoIu4T
	CSqNTjHlxPSXdCvc9ibrHCsIH1uXGOxk9GE/DandtbcgWeR7fhj0hn2hr30AYlxv8EOxwY4rZ9G
	B26xXIldW09DxLM6tx1sO9dUBfQltRsl8TmLpLx2d6T0Z2ttTF1wCTvm4YE1pnQk0lQN19z8i5L
	nsaoSjBHdSpTs/WgF+su3NQRPEsxs3jdTpUgKIus9SpnjTLn4XxhSe2T9QhOPmtTfAj+75TRzvh
	sgMkjtQZqw24vLVT+a6DeRqQgtofOUIMvMgsJelxcgO8hOeeUXHn5uADcx4GnOrgAh8po1bRiq+
	iZbLaS1/EiJzU3zVr/U0aAzPtSU6HW26V8POwbaRf+p9meGIpDLq6X42MsBJjfYRI/tkamsNiZI
	aKZcxWjoIgQVjv8LHlJzbOjIPlCxRBjh9wLuEqyxj44kHVHVKB9ER9QTnbAHONhnXi+0iYk1VWt
	no6Pc0DZFKBDj2uGGPUxes3CCrXNL99a4x0i0V+u0Xw84M/tbR7J7Vmwb0mcx8pA6ERQESUfUa1
	9DobclwpumMJPultBGWXidGwc3ZKBwIbQSZdrpnnkK9f2Yr1EGNLAPuOPBcTrtL/nOGdsK41PFC
	A2dog5MhF97s=
X-Received: by 2002:a05:6a20:a79a:b0:3f9:3f64:9bad with SMTP id adf61e73a8af0-3f93f649df2mr5801702637.4.1794895568851;
        Mon, 16 Nov 2026 22:06:08 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:08 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 2/4] reset: ma35d1: Register auxiliary device for the temperature sensor
Date: Tue, 17 Nov 2026 14:04:59 +0800
Message-Id: <20261117060501.2611071-3-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
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

The on-chip temperature sensor is controlled through a register of the
SYS block, which is already bound to this driver. Create an auxiliary
device so that a thermal driver can bind to it without a separate
devicetree node.

Failing to create the auxiliary device only affects temperature
reporting, so warn and continue.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 drivers/reset/Kconfig        |  1 +
 drivers/reset/reset-ma35d1.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..cf42fd6f7a3c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -220,6 +220,7 @@ config RESET_NUVOTON_MA35D1
 	bool "Nuvoton MA35D1 Reset Driver"
 	depends on ARCH_MA35 || COMPILE_TEST
 	default ARCH_MA35
+	select AUXILIARY_BUS
 	help
 	  This enables the reset controller driver for Nuvoton MA35D1 SoC.
 
diff --git a/drivers/reset/reset-ma35d1.c b/drivers/reset/reset-ma35d1.c
index d2962c0c80be..8c82175d7466 100644
--- a/drivers/reset/reset-ma35d1.c
+++ b/drivers/reset/reset-ma35d1.c
@@ -4,6 +4,7 @@
  * Author: Chi-Fang Li <cfli0@nuvoton.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -218,7 +219,15 @@ static int ma35d1_reset_probe(struct platform_device *pdev)
 	if (err)
 		dev_warn(&pdev->dev, "failed to register restart handler\n");
 
-	return devm_reset_controller_register(dev, &reset_data->rcdev);
+	err = devm_reset_controller_register(dev, &reset_data->rcdev);
+	if (err)
+		return err;
+
+	/* The temperature sensor is also controlled through the SYS block */
+	if (!devm_auxiliary_device_create(dev, "thermal", NULL))
+		dev_warn(dev, "failed to create thermal auxiliary device\n");
+
+	return 0;
 }
 
 static struct platform_driver ma35d1_reset_driver = {
-- 
2.34.1

