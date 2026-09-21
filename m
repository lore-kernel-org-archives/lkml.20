Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E064DA9A5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009647; cv=none; b=hy28zpcb4KCXKIYJbgPU5HRstHm4XIF64cQe53g2HyOWvX1MD+UwmE4dajPxiB9dTYDqMm8H146y3ggwbWTVFnNa24zPkZWPdDeRofp7c9mt3i0XdKxfI9rUJrwdCZdnxXmN5AP5BWgAdx7DBBqsXStsxbmIC1auP4Pn6cB4rCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009647; c=relaxed/simple;
	bh=rT/xXwTxWpHJqpawKJ8rz5ThjGIKxqXQoFm3t0DoVeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RO44GlWztR7g7zjqymrIbFUYyPQHTu4WyuaygQmnGXbM6fOe6D7CWk0RfRfDjzx60Qpl/ge32Vn+9QzffTUQqZO29fMhAejrS8v4qbGT3dsZQJjVl96SU+JYGcdL/Wvm7R7t1W4cyLxQOl8UhLiPUm0uYDXL+Ti/sGM6TwAK2I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQxdoVB0; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQxdoVB0"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6b200fso1803614eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009644; x=1790614444; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qAXyGZrnDwRQSNRJqJ6eqSWY0PVWK1O+tcBGYpLbtNY=;
        b=cQxdoVB0gzXJ/nK5fo2+m1oTTkF+f/yTrTLH7X720quZtTkHqggvysjNCAYfgIjMTw
         wvqiry5DePWGCINx/WhUUaQtQ2apobU1RI+xRZwub+ofnIRH+jDkuCurYULDBhrbLCMr
         pP7OV0v7YaJFIQrL+hoqxeir2MYgGa270Zm7cgGtW8tkbyRsnxYKPp8NSynGtAo1WMev
         kn/vRToeMzjR87GpSNhT1sp1KedwtqZdrwGqbl0vwLtIDy2Gw4lyWRrWBkkeNKnF27zN
         lAnGh7FpDWKi9a9QtjAgaug1E/RDfmUAnwcSOqEBmiVDRexmdj+zbDlyhXcuUN0EFz+6
         nIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009644; x=1790614444;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qAXyGZrnDwRQSNRJqJ6eqSWY0PVWK1O+tcBGYpLbtNY=;
        b=DPigUE5YuRgOIYbtEGmP8J1FoIMIjokstMbYH9q/FjiVgZCbp3T97h1xwyuiLFdGtO
         OYVVI989MsmJnhHnmtqw1tfmkqVwsf9c/JdQZIZd+JcHNBMTMOafwSRA3ksc0M5W47tD
         7SJqBABef5mAOCCY4Np6g4+AIWiy/6ZF6LYAjbQ+udb82hfDT7CzbFDZjkkCYfO/IQtB
         AidI5Gskmhy+MU1lCi9oAu3MK+tZT4Kl4d3d9SobXRyXmVcyAkISQzIOXk//Uh7XUUYi
         kn3TsvPeWKPJ4WmA7j+8/RzXMWEQyAG0o1RHmSfqx9xEjm2f5+pTWRuiGzDmp2j1RtwV
         xhHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqlbO+QdLHSKDnBnv9No+oaU80r/kPMXtKppelebFImBC3OSH5YtzrkXqBY4GbmG3mDIEa6bmWM5qqCqA=@vger.kernel.org
X-Gm-Message-State: AFuF++maxwMuM9l5CoX/Mbdg7OydGhNtfVlBjKcvfuyeLO2pV7xsp+FC
	4Ocm0xbZFP0WUeOm/2qzEcFE4FUqbyLbpx78ieqdBZjkNnd514dzZ3zn
X-Gm-Gg: AYBFou2roS2THAAUHbOLlsutxMPmzawW20kgi2LtFcHHvgMvX6ZHelvjKl2GSlxwh6/
	UetTdBCiiUdqgfq4rDhbPVbwf0rGyhuTOqYyW/O0e+w93m0KyjjQkCzrvhCvelSM41vfRQM2eub
	bjqhuZ0CDWZRv+BgzqTnaXBjZoMu4y45v+sYMhhRR4SeoI2wpyEZCbPgMcWoyIJCJbxCQZndpQA
	qFNA4Q92tupuzcNhJ+t79rl/EhuoTY753qGlXRgWrlf//7vHBxctfiK/PXDf7PR4a+lOR74Znn8
	sY/aqqY6YMdraK6aPKjoIDDdLGhy+uC0YYR2MNlKfPYCf9ZEfeQIY7b6WYjbMl4X2GdJ2C4yjaM
	VhH60DA3SyYHG3k4WHZrgXbbzygxO7EZra9K/wbrtG+wvbzNfhCgZ9yxSrkoCxWIfB3twqbyO5f
	ZWvKcLKxBNFsBAgjokLSBlNLWJP2k6RHih2JuxSb1FzvmXMhVR1W9/z35YItd0bb7bECkx7Yaip
	x1XjAVcJNMqDe7/gy3EMl6dUtQqyzpxuNb95MTi8w0rCJigtNjaXsx82bRKCsBmxEbvqIOaf/FT
	nVdYrZ5mclaM4/chYSCwNrrCJQB/H6XGJJOqQiIyjUWK83lM8v1NN2vnYc3mXTWGrJTALVQ7tnE
	G19dKTNK9hCCezGwcW9QtNg==
X-Received: by 2002:a05:6820:2217:b0:6b1:8ebb:7efd with SMTP id 006d021491bc7-6ca9a13032bmr11598584eaf.4.1790009644415;
        Mon, 21 Sep 2026 09:54:04 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d145bc40e6sm510481eaf.5.2026.09.21.09.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:54:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net 0/3] net: stmmac: fix failed MTU reopening and hardware
 resume
Date: Mon, 21 Sep 2026 10:54:01 -0600
Message-Id: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAyF4auUrA10ZmGNVxEX02mqEWaUSVqE0
 rsbdfm/B98Gyk1Y4dxt0HgVlWf1CIcO8j3VG6NM3hD7eOwpBtRlLGKoVkrK2FjZcJY3K64Bh0y
 nkeIUKRE48Wr8+1y4QGWD63905MHZvjDs+wd48Gi6hQAAAA==
X-Change-ID: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2

A failed stmmac MTU-change reopen leaves the netdev administratively up
after its replacement DMA resources have been freed. A later close can
repeat NAPI shutdown and IRQ or DMA-resource teardown. A failed hardware
resume similarly leaves an up interface with NAPI already disabled, so
closing it can hang in a second napi_disable().

Fix these error paths by tracking whether the data path is open and
closing the netdev through the network core after failed reinitialization.
For failed resume, release the suspended data path without disabling NAPI
again. Allow phylink to finish shutdown directly from its suspended state
without restarting a MAC whose hardware setup has failed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
These fixes were previously posted as patches 1-3 of the H616 EMAC1 v4
series. Split them into a separate net series as requested by Maxime
Chevallier. The sun8i MAC-reset change, EMAC1 binding and variant remain
in the net-next series.

Changes since that posting:
- Adapt the failed-resume fix to the net tree's older stmmac_resume()
  implementation, leaving timestamping behavior unchanged.
- Add a Fixes tag for the phylink suspend/stop handling.

Previous posting:
https://patch.msgid.link/20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com

To: Russell King <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Christian Marangi <ansuelsmth@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

---
James Hilliard (3):
      net: phylink: allow stopping a suspended instance
      net: stmmac: close the interface after a failed MTU reopen
      net: stmmac: close the interface after failed hardware resume

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 39 ++++++++++++++++++-----
 drivers/net/phy/phylink.c                         | 16 ++++++++++
 3 files changed, 49 insertions(+), 8 deletions(-)
---
base-commit: 1e24c4f2ee44be0eee94092b5d13cbdb4bdf0d60
change-id: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

