Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595377;
	b=vFAaP+hGouFazMxXZKwVAXN4u4dCwN+MsLGNWT6bITv8u1AChP/FS2mT5ExEQHVzKQoT
	 70wtw4Vq5TAA05MglaC0g3mkGbMAzaQ8RGTuBJRWRS4erODVHVOWnAD8LLBPzPrzin40v
	 dXUjr1Iii2P02/mYMED4+decI5ZiXSn3cH/TiTwlXZWiRiORaffC2O+x+GpqyG5YG+ozk
	 IuNHE1eTcvdPa//E2AYnJUXHUDwDfI+kncFYY79Q9w+QBKRLnw0i4RLxw6/55yhObCL3L
	 snQpt71TEjM6r3HBSCjSlK0fEk0WFW7UeqCx1joInIYLXbr+wS+a7su2QbLHQj5hL4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
	b=QUQAw4L+nDTZfJ9vS2yuiy4Jp71vlXpc6XK93vADIUJsM+B4VnHeAa0hgb+vuK1EePJ4
	 yR9qKcJCdxHSXpGdjm4SrzMUPUfE4wkNAP/0a86QwAHjMiV2WGCjT1J/6HGo75JTEfp1p
	 uOQDvbzp1xSt8q16iY7fkoD+hmIuxiwiLv9Iwv8ERQSu2Pj+r+WOLsoJCk+RPnsrOB7Np
	 wmCAF670CfoV8lYncXmTDeqK/doxONTogpi2E6YJfPzMVIzfN+Xtxk9rh7Z7xDVh7Mxdl
	 7vfKyBRDxfSplvifW9ufOsYXmKNTB5wVfLU8fm3qrrkEawqQJB9s+tSlgUXt+I7zy7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLUfjCmP;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1B606A891
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E1B606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLUfjCmP
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3b4944a0eso537014c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595376; x=1795200176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=JLUfjCmPNspwfncVcLCqOgrOYo48PDU/oZwv/s2ScUY2tCi7OUgYTFuEpdqXPh5MEi
         kvByBIDETbxVN8UX0f2GGLDVuaupezMITaxV0VLZceNmvLytYmA3RJLqqq/u81gpeBdX
         kuRHLkO3glN1ZVr9zUjwO7AXuvoX4K8ok1M/rE9BssGt1InXbbL9TFqHE0JgnRicS75z
         RAdWayHaQi2mysXJHs2pughOLURwVufmdoAHYqry+gSShG9xvntDYwOxBIBNj6014xVT
         KD9mjYPdyrgrxTcdOpQKbuukeg3xxS2pnL9tKI7TQLVVTP+6yYP7lrsZrQof6oAB7PG0
         y5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595376; x=1795200176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=Fzr4+ROzKoOdpnbRGa8hieANCeQ2f1LvXAf4FlrMyF8ynB27DobymWTxO8AI6GnUVq
         IkUGnmxkGBCi0kB5ni0/b1VFFkuBLtWTC9IRZ+NG+IyNGM/16h8jlyf6Mbqf7B8qWr0p
         ucoSmFn2Gdhpxm9hJzW8AnnNctE/RAmRLdXiJSEqr1sqvXrfnDn5LKtc4yBAvbx/4kXD
         TPJo6e778KD8KyiDe2JdFcGO5XiEraXDmli17O2MJFTFT3GbU2PDrnMgvWSLXltIORWq
         HWDCuiYMSOmpiPsuWsjcrTGq6dLOJzLDUMM+UOdM8B7CmQe7STrDrsXQo+FZbOtkcbVy
         R0rw==
X-Forwarded-Encrypted: i=1; AL+hErETMa4xrwLVjOEcDcQSH62pGAuwaVVK/IeszsfdoRObn9kkftMSYEfs6shKQmgLdvZj5ebWMBTCI9C8Ecc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QjsBOEIaUsyjeqkrn8l2lG3ftr4BTUwx59p+jj4HQoq8cwrzC
	dAALwa8AqmQD5ez5xa6yOqQdW8y0bx588G9eAohjDPuLnRoi3KMLLrsT
X-Gm-Gg: AYBFou3qNReZVURNNrpb2HO+g9gfYTmlYTXUyRLrvfn54A33AXoait+sbH1e2As/QqC
	yaQzM1JKrYeE6C5wcRMIgz9421ZWFtVIaB6l0Jw5iZ2utPC0zXctJPPDLVB/vgNKcwZKXDOOQRL
	OJaIGQjBV7OAvoHHoNlTwKr/qSJlx1d23Go6mH7/8V9ywh2L+16kUsVRkQ1R2ezAg0UmWwWB355
	ZfV2nMV7URJbtQ2Rf0SWUeoWlcj20UIYlA4f6PlVMGFHb7hBwMceuh97A5baDucXN2ILoaCDneR
	2NSiY5JykRTJ9RdH4kDDX5RMNcEB8IHjHd2gmV/HFv7SvIswWIzVPeornq9A8zM+Byz4PCPYL2x
	pYVgpPMKOIc7lGdALUY0ngxr02+/vCK8+XbKolD+4wxf3dlZkVQCD2w/NmIoTTrkhywUyqMAzDt
	Vm/TFrvGwPGO0A63j6UJ1pjCptDPa9co6HHUoSTCd+khcZG12pqvL2CUHjpgaZXrBMEiosoXkJp
	D3w/a9K5dwlr2uQZBhNn3lahlJwFvM4niShGFfKBw2irUK12fPSw91KFgrTZvYnDCX6p/3zEkI+
	1rAf2sVb
X-Received: by 2002:a05:701b:4648:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b5031695c8mr3293113c88.47.1794595376420;
        Fri, 13 Nov 2026 10:42:56 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:55 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	stable@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v5 1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Fri, 13 Nov 2026 10:42:07 -0800
Message-ID: <20261113184210.470320-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113184210.470320-1-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
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

The CPU1 clock enable callback runs under the clock framework's spinlock
with interrupts disabled. Its readl_poll_timeout() can sleep between
reads, which is invalid in this context when SMP powers up CPU1.

Use readl_poll_timeout_atomic() with the existing interval and timeout.
This is a prerequisite for the JZ4780 SMP bring-up path. The original
CPU1 clock implementation by Zhou Yanjie is already upstream.

Cross-built for CI20; the subsequent SMP-enabled image brought up both
CPU cores. Development and validation used Codex assistance.

CC: stable@vger.kernel.org
Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes since previous posting:
- No changes to this patch.

 drivers/clk/ingenic/jz4780-cgu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..1809f8859c7e 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,8 +242,8 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
-				 !(lcr & LCR_SCPUS), 10, timeout);
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
+					   !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
 		return retval;
