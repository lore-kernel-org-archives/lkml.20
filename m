Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A63C0607
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439610; cv=none; b=tWArTa/ID0H3Brpojk9lOkqZuw3JIsujAO6r/x3Q689WCNhvfrRQ+IUG6zR/IoncdTOzuc/j6FRxDyj7YDx/qwrnJokAna0V/kcPo27zhZCIWVmalgnqXjWWk52WCkQNyRKj4+Rmx8Ia+NdodmqmfIPyF3B+ArIjsMW5Drr9kxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439610; c=relaxed/simple;
	bh=eNYVv/RRn7XlvUCC3lQZslvumrqj3722AkonfgOOmuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3BkJLzdotIslSbjXSZ0hmGjlRlwudQhMlXvC491GlDiKbdjZiAWevWxGCygkv+IEfkwwkLj8fNTTD8gmNr3dTk2kOTCKhZrG0RTGdi5QIBYtgvrm10CkNVG8P04RIQOgGfMv3PfjsICTpn8mScNL9R+ntXswMb55jCpxyIE+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZFRn3Ll; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZFRn3Ll"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso233586a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439608; x=1792044408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=AZFRn3Ll/7GoMg74+RJ7OD+sEYeA/Xmc4mO/UKt72z99JZjhp74P/kGQ5v5UcLWLzn
         mwT3E2BxkD3GJBkjwK/oK2ZmVxt/InZzdppRXhI0FIaPnPoZwReESDhW+jdUU3gmx7Kr
         bLBtvAo+iiZH0Gu60V3e33ySe1VhesRgz59wXbMpUxxv5QYrNXWVoPehZ6VOWDWgZcHh
         Nw/gMeoDg4gVzZYd6RHvd7/ayuIT/ExCC7zzXkLXEnCocwwZS5GfkI0x2U6pNIrsxJ2B
         7Rj/gxAUZPk9KfMFvF6l54/H5ArfBex/1qFb91j3QlZLLqNmm+LZd+iIcS8VK/MxuEKj
         z8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439608; x=1792044408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=tV6vKWuf0/1/LXK2O82CbLWLXTpfzEbD0dtJfqulW8zQURpiGP/OYp8CfAlbshG6L5
         OTfQD5h8xhclPRIiXMEBp3uzUrKCydx/1byOJ6zFUaLBHaGm8k1QIRaGreUj3+VaUkaL
         eA1zTtyIKiqtVL1I2nEQ/bOYrtBeaBStldsf2AYp07wDNplAUePE026WhQsiav1fyCxW
         7wxQzK/4s/kpLgLVcp/7rkTahpZvYPiuS1tB7tsg7xazg/E2F9HGmOOk3EnYO0kpcUeY
         0BNBgbnk+bNxv516j8XbZOeBvQ9nAHx0anwwBtpdd4ZKbihDrtzfNn65YRZNGXbF8Ftq
         Qijg==
X-Forwarded-Encrypted: i=1; AKwUvBwMeBG/twSpO/qD5rXv0lBtmf9iezSIRgbrw215qYAHh/DEv3moFK6C/wSPTAk8JmSZ1q3zSejDT9NGiJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrOXFtARqUm/3q6xI8uXMy5XQYN2vxFL70C6GGVNz2jNTYQHXG
	+SJcKwctkUpjmue/VPc94duw4lCJqt4EA/T1PDgLreFmTnORWjPeLYNw
X-Gm-Gg: AYBFou2uthW71bkywiWiAYu12HShnRAXajVG+sxstaUhhwpmlMbIT47Q4/kUBLOnXbF
	mR5FmZ8MposN5sYLk4ZdFz+C0QFvbv9ndDtnqQ5mG4PpwgPE/2h4+JxxirAHzi6z3IMbQCUynQe
	2rN5qqbK2UursBV6S94UxuyVAa6cn857h+BRygsPKNtwlKT0QF6DrNNSbKh9nLTjwzx//kqJfU2
	FZiwh0q3gsxLgkQYsduyvIIIFarghQzVtqrcCa7sKb1dCYUDIHEHWG6oL8+bkdTlfPljQbFDuBA
	iODTd3HGY67rsjsSRHrvJUNeOUbuwTWKSxZ7ZF6cBO9Z8E7H60UG/jfvpSIb3mne2srTKB/pAyB
	+uyxISN5F2ICrLyC90HXxfhviD5hh4jU5nDC2n94B7ojDDaN6Sbd4VD1BvVlz0gKZ51iEu7HnCy
	rvzj8CB8U8g4TOChAtXFUQOgP049HvDipVKwMY7MYZQmk550mIq2q8iejSxuq5zEbNS6b/X9IVb
	9M8hwo30V0iP16iI6pkIc/2aRrfBAdTLDuM2/gqLLHSTr4sl99AyfuIilmVqmMv
X-Received: by 2002:a17:90b:3908:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3a8a0b8b75dmr3123041a91.18.1791439608487;
        Wed, 07 Oct 2026 23:06:48 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:48 -0700 (PDT)
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
Subject: [PATCH v7 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Thu,  8 Oct 2026 14:06:28 +0800
Message-ID: <20261008060629.2736806-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008060629.2736806-1-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

