Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D71E38C423
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161686; cv=none; b=Bas1Wkk0MLoPpwkO5R2XxsSnojbnNor4S84C4L3OGDkqSUMn3l8qhXfD8tMmYLKUGaK+a+PqFfSBWuuGYs1fpzs5xkqLAw5Qq/8JSxaXa0CKlsdiWpumJ44O3aI1rF7yIA+wfClTk1nI19EW21Ttji0C2feRwYwu722Bn/46oCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161686; c=relaxed/simple;
	bh=WZNjPntmTxKB6PnwoW9tTwXddGro5Tl2X0NnzaRRwkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpCtdtItSZVDE3ULseZemRG9NHajZJoW5BsUS6n6JLzGwWtjrmvkh3EeoXE4A66dz39gIA8yXZW6HOTEcANFXfaoYg9YnlVzeI/XUBXvffBBy8VYVnjb0YfMEqhzQ89XAwrhHt4d5hauuWcwKJp7mKlxVWAGIpMrYrEa7LU6Cjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DE2Dcaai; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DE2Dcaai"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48870973bddso23928f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161683; x=1792766483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=;
        b=DE2DcaaiplVS/9UKzUl1ExK60kDcctM1U2m1hWHKY2BeODCPlzZztwkZmHkr6aZHDp
         XHxHs/e0iG3Gumf/mbqB5muFxCt/kKjfYYDDIxzNgtWQXk+1yLpfzbGPi7MCYXkljxeP
         x0F9v1zvFIz8Rz4ZxAuO1fzA0XAf1MmMGlTr5F5K9hCTNn3P9WL9Ei3MOdj8pf5bQCSM
         cwwKU7MIu4kJsYbvmkUuxV32K1w/eHSL319WPttKo1CTcyC/whswbuJiTOpVFYAOFC6I
         M8NUoC9k9x+HrMrZP/wvae40ea57GxqGE8kcPx5b91iLZ9tgVpgobAmuaMuEHAGchz0u
         qDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161683; x=1792766483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/7VUpAGcux4fjxIdlTVJM8GX+izz1YH+HzRtvPUJ78=;
        b=p2ID0cfIv93oT2507hC/3brjV7PwQ49DcsFv//oIZ3Lv2ZaRqFtcG1i+n+CUXdaAwD
         FGBVrmk8opjiHVKyT/3P9P9zPHpErqHkfB0CZ/rSSmlNhFI24hPmTkQ6/Jap+pBaeNsW
         Ccmd11rXPyD3Ls/LZ35VrYdiGJCsgLajJ8t3lSNOKZCO62uMEX1Bvpb9R6dS/hfdqZdO
         3Bv5iycYcIK4S09UeMpEPrA//FngoY1E5NxOsFBME3UHmuvKu+EY4h/mXr5Yovolu7PY
         t43lywUne6RiCXkilw3tHSTVT46E4/5gr8PLYIpTmzgX/RmHw7YP7TExR0KUIepWe1Kq
         a6Og==
X-Forwarded-Encrypted: i=1; AKwUvBxVYKDgHKX5Acp8DnI0ez9wqTB7Z2DRLM5NM1wUG/53Q+PvhrQchGEPqLjDEoUnRkujYe88aK5vOvroIDI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIDH+8bNhCrShrNDTA9Ji6PhHaHuxwkVNKtViKVLEP2Y6eqHro
	6GmeNBp4NM6zWW2cELz6Cy0jQ9tRo2YFeta19a0evM6BReNRp7P2YxL4PKeVz55mvUw=
X-Gm-Gg: AYBFou0Cuq0UHu5uS1JbEhrzuLE/yj8+MgGmel0Jucm4fMNuWYClugELqgVJjROG8Qi
	0iqR4xZOSV72U9scbXwVwF3QZWc1tDLJT4ZU+ueacslOVrRIY0VV3xQ9opuhaK8JDl/U63lwqVR
	A7fp8rS1pB8lrUVdmtVMjRkENOeEezOMOG6DfD3xMRP5A8l0kpwh048eBaEvF0Q5pMcVW89iGzx
	dp5MK2aC6YkwkOvkccXpl+6D/oAWCidt3ZjB5qAjqkEUbFeZfuUW/C7M48QnPxwryroqM9QPQ27
	6OZJ2AP+uHhjOgEELFduWMZr2JaTfRdOXEiWrskFMAFPV+r36a1KCHRtKdXfgn9Tt+sT5qG/apX
	YT67xpmaiTa+KG6frM7Clg/hDAdi3qI1BB3UAmU9bsqx5U/PGNsqc3pevOsom0U7tn19CbDA3ES
	rb1Rd545i+da7Yo9BL29wa9mjoSkkV3LXVlJ9DmX448muhPZS97TqYiAEcRjnVpdHyWsGU81mmt
	0Or5ZteOmpJOSnJtWD5r6T4Aqp6xz9NOz+qa7MIhFlI/h36c6sWJTL1Y4MeuPLmbCAxd0s=
X-Received: by 2002:adf:edd1:0:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48dfae1ee24mr6334662f8f.16.1792161682381;
        Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:16 +0200
Subject: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1058;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=vkbGDt2t9O3PEQmqq3WpWoBfMDyf2l0F94OzzH0Lqck=;
 b=G/D+U2sPat3Xx8BIZaPIsfhCX1A7J15eqsyRChroWg78s4J3EXHdoTbuWHyx0L7PknTnAfqwn
 IH65RPB9BFLAvsjLEHx+wXWjp9HH1vccFQxAVZoS1qKHUm/WAA8zm1l
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

There is an issue with USB being put into idle with DMA enabled and that
is mostly prevented with usbcore.autosuspend=-1 on the kernel command
line. Stop the ti,hwmod code from putting it into idle by setting the
appropriate flag. This stops the log entry 'clk:0058:0: failed to
disable' being generated.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..2f55dc32e150 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
 	.name		= "usb_otg_hs",
 	.clkdm_name	= "default_l3_slow_clkdm",
 	.main_clk	= "sysclk6_ck",
+	.flags		= HWMOD_NO_IDLE,
 	.prcm		= {
 		.omap4 = {
 			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,

-- 
2.56.0

