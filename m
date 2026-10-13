Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFDE472F63
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873227; cv=none; b=ttLix5Jmb5CPjxMF2reEzTgCuZiziofMQXVSSyXMR+6yLoiFIMxGSEI8rE0p6lWH6ZYPRFphpocW/hsWtSeqht3yuI71vCpVEF4iAQHyFayspzHhWpe9AnyiySTW4vgHjxMKHXqQQq0WN/ccNe9l4LgoBiEaSccCFRBp5kYSUoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873227; c=relaxed/simple;
	bh=x+7CuwaNJILws8IjITtVCLuGEnLuvIFOlqL+Vnf9aFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iuyMsTWyMfoi9CdfpyC8oPejttpazYpp7sqyuYqeZermc7Bghmwp+p5FURGnyLRM4eGgdbAi+QDVdc/rcGlhIoangzrszKEpMGMUjgT0rE/z38trY8ShqfUjrZadgZABV1XFF7LIRqVvcFKf1RM56qcLCzUyp8wP5c3B3lzY3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEKHURBk; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEKHURBk"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1984105a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873226; x=1792478026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43G5UMaTTnoQPBl1WablN3OxxeaEJ+ujwJ04caxRMu4=;
        b=MEKHURBkDC0h13z5dQOyX7iZKTberrH9InOCbmV9dzrZTF4SXXlmVHx+JonXfvwpQR
         tZf1oPqM4edhAU4Uaa9XUNy7RnzqUGgr3DdeZpDuEm0Qge4dQ89HjbC1KVT9vgMGzAiM
         nSpp8G5nTCcnGa/J570L2vwPKzEIrMAUyxjO24ALLVaxoWcCzBDjL2Zonb9Pa5UsYFUK
         /U6XStvX8/DQV39JILiqHN0dAZN2a8IxRgfpXCX/L9NZrjWz/PeMvFyvJBCIRuo9MKw7
         at8bCEdEvCYxIaLBkZ0XOeTmb4XG42R6sPsqT2/BuKxuxG8lv79VOD7bfucwKm6eXExV
         VhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873226; x=1792478026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43G5UMaTTnoQPBl1WablN3OxxeaEJ+ujwJ04caxRMu4=;
        b=xJBUn/lyzLzbvd6SieTS48aBrsPrhNglEhZRLhIUYqC9Op7qQLDpQ/V9LYC3W/vflN
         ABNN+dJT4riS88DjFg/JDeycGApzQIrFSSViOq292LQF7BIyh6i7wisGNcN0lhtHzEAJ
         04ShVv7okBpCFxu3puVF86XGBD2c1zqIfULEZqmjgAdDdWKYUEVdouZPygAZGQABIcWg
         vo+MHSG50WWRXKUu5tTnA7idCwMoe7b4xgzHk7JBDT0lU//cqMIn9cvymwsCixOJ2kKi
         4/go5p137rsmFAW+r07CwceU4ehxZEvxHxebL8izxQz2z1lizPLN2lF4YB7gIUDaREju
         A81g==
X-Gm-Message-State: AFq9FYLYrx4MY8aJ64Wo6dG+hWnPq+ukLzrMyOf77GIZ9M/1bXSWek6K
	M8VSAHCMdOHJw2d9b/2Y0E+oxXNYO7ySO5Vrn2snlLNaqAzio5gnD1Ta
X-Gm-Gg: AYBFou37lR1NIjleJVHARBndGCHf6P5ahzTIrfywU+OYOEB/MXJp0rEvaE+C8gkuLfu
	FR7iY+b3GH27aHk5kU5xqwmE8NktMN/ScldOsCjm57xLsVwprTga9nHEmRA0KPDmgAC28KyaRk1
	yghs5rK9JQWAZyOaRkatEIZ73awXsT4O61r50Ko/ZZjvv0B0NU4dT2tbqroqvYiRqEQu478f9uC
	aGU2CLUYyreD9TjyahB6YmEBNgvIiA261f63S2qSL7dxnxLfduaVWNvYcvcyYNvx+g4hPZa+h9W
	AMKO/JPfaiaFihzGPFDuCBvCcxm//gx/WY1QenYxMJcVVcGaD9F7IGA/UT5wvou1cPLK3Hh8Fk6
	+WIfNd4wofxTSnqrah6r7Zb+B//pghLdGup9lCyyySAUYuEFLoDlDtbn5H2tSOMHFMB2EUjTHs3
	JYOdK39xt/WyAEOZEjGPfnfgfbu8aNNOTaBxQk8d+isQhfgZnhAgHe9+KFI4RTSWDbRaJzezzsH
	8IbTUVRztxMTubNXGQST2yD5fYGHIFMxZ/WaSdF
X-Received: by 2002:a17:90b:2889:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3ac0eebecf5mr3350372a91.36.1791873225873;
        Mon, 12 Oct 2026 23:33:45 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:45 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v9 03/12] mfd: nct6694: Ignore interrupts without a mapping
Date: Tue, 13 Oct 2026 14:32:49 +0800
Message-Id: <20261013063259.2734757-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The return value of irq_find_mapping() is passed straight to
generic_handle_irq_safe(). If the device reports a hardware interrupt
that has no mapping, irq_find_mapping() returns 0 and the handler of
the system's IRQ 0 is invoked instead.

Use generic_handle_domain_irq_safe(), which ignores unmapped hardware
interrupts.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- None.

Changes in v8:
- New patch. Use generic_handle_domain_irq_safe() so that unmapped
  interrupts are ignored.

 drivers/mfd/nct6694.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index de0027c98726..4f5a5b855de2 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -227,7 +227,7 @@ static void usb_int_callback(struct urb *urb)
 	while (int_status) {
 		int irq = __ffs(int_status);
 
-		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		generic_handle_domain_irq_safe(nct6694->domain, irq);
 		int_status &= ~BIT(irq);
 	}
 
-- 
2.34.1

