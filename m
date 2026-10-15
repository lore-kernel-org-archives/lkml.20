Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134225476EA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083299; cv=none; b=ZOUVm8hplEELv3Rlfg0CPc+7KvBTCQJskaLNhacxsFEVt+bVUsiIUdOP/GiLALIsP9mkddxt3DjepdFscQl2XMqcrosMIj5ZpAnSunJPAlDgEkUOw0VlRLna0KXmkV4ZfFXA6H/1uRLdNHYEazRDasLS302ONmLvdiM0cGYY8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083299; c=relaxed/simple;
	bh=33w0zdjcE6uxwqU7ll8OOTlJSYoyfRiEeotGi/VFEE8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vp+jqtEWwSmB2k1TFu3UmqzWqYIRpehFA1k4AsjTP2b6y2JD7K5UNqyw4NmKHcytX+YMJC1umejpGQSzYHF8RC75dObuZQ4aVgkFfEGqQ7ZG0DLRWbF2mJoUGErDASDbnL1XnRCCNVhBcCqfExvCXGKAJdChnSSTrh5WHk44Xi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZlhHBxV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZlhHBxV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso2599435f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792083284; x=1792688084; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9A4R0ld4xtPUzYOLQ26dMhhwMrPELtsTfbERqTYNE9Y=;
        b=eZlhHBxVOtFw4GowvBv9ja0joMXzFSEXtRo85a0t0z2iHtgwdp8lqaHyh7kaOL+LJr
         PHwgUyUa3vMvr+wsSLcPFzizvHkADBWto97BYtnt4T3HND3O6Z4czD1Asp27KEp1ww5d
         7rzd68vNhRjKwMnC6CaMNfMhgaODdVVdvQ2Er7Jxtb8rTepdQ0ovLzSB2NAidi8Ov+nz
         5QX8KYp+XHUjE5hn151mbsYHf9EpezkumGqze1554et4HJoIgSQxMrozRRfluv74hQ82
         5TieRpBaRmzYUZbLyyRNYocPwk4DmwmHkx5YT8dn5evd4fES1v9NocrL+2ZmQwXmYHqu
         vR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083284; x=1792688084;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9A4R0ld4xtPUzYOLQ26dMhhwMrPELtsTfbERqTYNE9Y=;
        b=J9sp6//CxJtVwrQX51qAIkgslGq2qq2jaOpxcUqFRbbsoN+FMbexG7mZX6O/g7pZTX
         92Xq4oaBoOxtiQoa/wq03pCt1L0UMH970IXc8BeIROG+gqClVtGe2kyfN8XeJo9l5Q9b
         tP+FEBO66xXfIIROzdYtUqhQmIYopDUmkbav4mLq9LGOXn1cjAUR+uVKoN629I8DslsX
         ndYukBFJpzv/B140ZoM8IityCWpSgkV979uVntoZags1eFFbafdIDAkW4VuISKr5hFm/
         rdwlHBxbP0BsMx1x2zpaoQrdC1YJ+BV7x8XrIQ9mIyKJoG/idpYjk8pbp/xMadaA9IQk
         QZgQ==
X-Forwarded-Encrypted: i=1; AKwUvByoCJaWLFRisnZZKYZ1CMgjjLigZ0jPr5wx5FMXRFPBehJ0UigUJRQae7MNsTRTCAAc5lEW3yoR3CcGMTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsYPdsKACmnqT90TqbhDWl2hNqlgSOJBh9yRGAwcoYZuDE4MAN
	eCYtK3TnoYBF9BPwdr/izj6YJuMTHP/6ucQKX1OM/Oa7YFAPIWpOESHfKd9HQiQUB+U=
X-Gm-Gg: AYBFou2tnA4Bb938cORnnH8DsVGf6yek6xgqIE8b/XgnKw7sZjXxh80pT2DLWJGw0RG
	2ABqiYRqk0atV/fYyq5oGe1QxJI9b+5ijcQYS+5jjw3qY3I+4ctIqHLzvpY+x2Z5sGEc264I3OL
	0dm9/x1WVwYGQzAzlBY9DEyvypa8ixqpgkYePqd63i4+LhdAzbOEN5r6+ywa3KuCpiwZzAm0MlE
	Kgu36+V/ZiLi49xLBvRaDhZKSgBns8hG3UsaJ/WBsxpCDxZ0dai0XQ+E6J5Oij6H7aDjpc9PMsG
	A/pLZ5SzVBGlCQsPczrTU7IQB4r3lQJx/4CVKGLdnItog3V6yHSo3ARwKKcWR8KKbdyNcgrrEiE
	9YypPXEzUAKHLjHNK4WQBqYChg7kjQCBIaayGC+ExuLZV89uv1FTxZYLzncM1yaQgkgnztnp9F9
	mf/ABMv2a6GbwVpI1/xAM2+Ut9kKcrTLlxnmTwW3Aa+AZ/qxxDFHMthvnQCHVp7D+Z/Z7qnWhTB
	pG8zIBugcJ0FMl+/ideNkg0lbO2N3daITQAX0ESyza7iELzJC+VdQTqR5hezuoVu4yAYw==
X-Received: by 2002:a05:6000:4553:b0:488:6bcb:ec92 with SMTP id ffacd0b85a97d-48dbaadcfd8mr27221647f8f.17.1792083283972;
        Thu, 15 Oct 2026 09:54:43 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm20775664f8f.12.2026.10.15.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:54:43 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH 0/4] clk: ti: fapll/dm816x: clock tree and calculation
 fixes
Date: Thu, 15 Oct 2026 18:54:29 +0200
Message-Id: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBCG4VvRHJvaEZJbkQPWYPy3u6Tk3i0On
 /q+9wLLRthCHlxg+BAr6+JBYQC6r5aOURpviFSUkqIYt8rpHnl0q0mwmTNKM9TTiBz/A0pqBf6
 9GW7l/MpF+dvu9cDavTm47wcLSrPcewAAAA==
X-Change-ID: 20261014-patch-ektor5-dm8168-clk-e426101415b0
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792083282; l=1668;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=33w0zdjcE6uxwqU7ll8OOTlJSYoyfRiEeotGi/VFEE8=;
 b=bZPgsiJnDeGOKFJE78I2bUEqqyxEubxzl/T0MZ6XjjKEJTiC1lK7Vrq88pRK36Y7k1LfrsZ5D
 YZPBhsudElNDZlUVtAOrdi74WMMJewl0pvoCOVCtc0jU7oGv6zfB+2B
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

During TI DM8168-EVM board testing we found that the clock hierarcy and
clock calculation was broken already on 6.12:

    main_pll_clk1       <--- main PLL should be parent of other PLLs.
       sysclk1_ck                   
       main_pll_clk7            
		...
       main_pll_clk6            
		...
       main_pll_clk5            
		...
       main_pll_clk4            
		...

This series brings fixes and additions for TI DM816x / FAPLL clock tree
and frequency calculation.

Summary:
- Fix clock tree hierarchy by not using ti_dt_clk_name helper(), that
  causes the first PLL as the parent of all clocks in DM816x.
- Add sys_ck alias required for DM816x clock lookup, fixing a boot
  error.
- Correct rate calculation logic in fapll driver.
- Add error logging for clocks failing registration to ease debugging.

Fixing clock tree hierarcy is critical as it fixes DM8168-EVM boot
failure in 7.3-rc7. These fixes are affecting DM816x SoCs only.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Andrew Goodbody (1):
      clk: ti: fapll: Fix clock speed calculation

Ettore Chimenti (1):
      clk-816x: add sys_ck clock as sys_clkin_ck alias

Rouven Czerwinski (2):
      clk: ti: fapll: remove ti_dt_clk_name helper
      clk: ti: fapll: print clock name that fails to register

 drivers/clk/ti/clk-816x.c |  1 +
 drivers/clk/ti/fapll.c    | 16 ++++++----------
 2 files changed, 7 insertions(+), 10 deletions(-)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-patch-ektor5-dm8168-clk-e426101415b0

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

