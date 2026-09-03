Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A104142E013
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420800; cv=none; b=Mh8tGxvJqTt5DecKqfrY0Xlfl1WBmEDJBbTpt09q0kjAzn3jKotI8WUSL5itKeeM7daOkyv9Q51jvOrpjuU/Km8IQWyXw0D8TRX2lFXwgvQQYoLp51PJrcvxbpKtZuXb2/OvJECuGKky2ZDvyXUk0O24svkSq+OX3YoXH2ces9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420800; c=relaxed/simple;
	bh=5qMEuy5eGy/JVQD+dpqf2Q/66DUF3xuDuOpkz4CMcPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5HPRu42ti9DnNHWiLfoABCJx21WbfJ3efLCtPTCsxa2VQWwFm7wcAYIYGVA0rrPGiq+2DP1GoYmzURCALunAsNVswZGVGhOf/tcq/1pOmVAJWBiTFSfCligNJikA7zf4vFDVtd93rC/KybkNX5zURCdvijWhHurqRzcRrFNsro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEurpcjX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEurpcjX"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2476979a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420799; x=1789025599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQhuxUhRanThkxdEOXasCJ4w6JBVmta7BprVKmAc0/A=;
        b=GEurpcjX52Ed2vWWK4CVPakHBMV2l3QjDELSaX/KTPh77hIS3XvtwyistVfUrIkRuD
         Qh4oidMzQ5+CvFcPioFoLxkHxkB6nCS6CKv4KJOjz9gS1yA6Icg0YBskyywgDV/iS7Ho
         yb3qTaAv05w0ci4KUQLKEm4n7L90vklfDX+A0Rn10lll3IkK5GlICQBQ+nTdfr+h5E4g
         JrtlU3IL0xS6P2hWaQT9V2IDAEsYZTMqWWefl7xFZmLgcsEqOrHQelsyIrRt0ctOWR8X
         O5Nn1JcRx0QOq6LuIq26fyEntC1aFENTiKVm0I7KMfjCYgiXNKKjIyHeZ2ijqxpr7on4
         S0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420799; x=1789025599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQhuxUhRanThkxdEOXasCJ4w6JBVmta7BprVKmAc0/A=;
        b=GFXGqXhZRAxt0yj22Rgq5E9IgJuE30SS33QGPe77er+2V5hFrH/Vah+fyZIg/s+Qfw
         IOq2jr56Pqr7WeVWcXhV3DCTwovLSWTdHkOxy4pe8h11Us6MLxMkFwc98mbwoSujRYKp
         cVm+MasM5dD39zaVIHCEA4D7WoxKhU1QGFf+lq3ye5XiWnRazGD7kj+xgr4WN3H9xI9T
         co5sscObYS5G30DQ8yS0AC4GTUZX7lree7TMas0A6h+G0agztKmysuvvJVD7mQ2LWk46
         VdybRywO0FRlxCyS307Pu4P/jPzivB2Nc3NuO6NfFJmpFvAXT3m+ZDRfnjkAYpDI/Vft
         Mt3w==
X-Forwarded-Encrypted: i=1; AKwUvBz6OA70YkfMR6Ckq4Z60kmdTCiwwPP1RejjnJPUnoYyvzQnTwuidO7Ae/kJ7NOdioKD+j5RbmQT4o2cpoY=@vger.kernel.org
X-Gm-Message-State: AFuF++mBn7cnCyYvPRWzk9T/eMD15O1FF9KkXAdezErJs4Fe2xSCacPE
	+WwZ6APA61KXgc7m2sVWtd3iNUIRC0psxrB/VmkTsOCfv4RXZSpMUfwY
X-Gm-Gg: AYBFou01tjya5KISHd/GGar9Y4wM19y0rb3fpja9Pg66dc8HX5YpToQNtRP6bfG402Q
	dpedLerg0m6BlneZOTsJZzXBDZ/Jw3i5QVHkp20IxiOGBmnk+KkHX5Yt53LQbK5YcHNFyBgUS2e
	WQitJ2syyNkbXJQo9RfM+DsNm2maZucXyPYymW+CpgvIie393jijlXGms7eY85LoNC4GPoLGigk
	beQmIq8b3/mIFG5ZZV2JfSPd6VcLc8CWzWPIWSdyiqrZnWkLFfVioYP5Iy51+Hz22EmkgDg4sYG
	H6vJpfzteWnhjVRQvWUjGs5RdpZehPZ6aA8SmOipCeOep/j9JT+KDSTKfjMsOONm+DChoexq0+X
	OREOx043QtTMxQqDbwpajtxy/JsNIELlT9lqwTx10m+t9rt7b5D1u4MvWMfneXikUDFzXrXAL3P
	7JHNuBk0GMntlXnECTo1ASmkfKrTwBwep5guclFgrqx13rCO4Lzj/FdAR7Kw8+7N1Q3Hi4VNybP
	3sFxWe65/m+5NxkzW0+Ed7qr1TzhkagdvYbJiZzGBbNxZ32uUCpaQ0JkkVnb/jRrjnFJfHeFG8k
	C/vE
X-Received: by 2002:a17:90b:2604:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39aedce056cmr16042015a91.0.1788420798943;
        Thu, 03 Sep 2026 00:33:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08624f11sm3606813a91.11.2026.09.03.00.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:33:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Robert Hancock <hancock@sedsystems.ca>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v5 1/3] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Thu,  3 Sep 2026 14:32:50 +0700
Message-ID: <20260903073252.339250-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903073252.339250-1-phucduc.bui@gmail.com>
References: <20260903073252.339250-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Another call to platform_get_irq_optional() in the same function already
handles the return value this way. Apply the same error handling to this
call site for consistency.

Fixes: d6349e3e14c7 ("net: axienet: Mark eth_irq as optional")
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..207aecb5f8b9 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2975,6 +2975,8 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not determine irqs\n");
 			return -ENOMEM;
 		}
+		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+			return lp->eth_irq;
 
 		/* Reset core now that clocks are enabled, prior to accessing MDIO */
 		ret = __axienet_device_reset(lp);
-- 
2.43.0

