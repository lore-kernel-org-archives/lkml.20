Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274613;
	b=ZqBFhHjXHNNzPfNEO3+kxkPlhw47KpDOvDNxIWxFuH46LD3Ifh9Cu6ev+jzfzUTJ3hRI
	 JubvwjarlZQ+MGA/Gfu8TXpodlgg+OLPrL21VQvDMJ6YP4VHd8IokOAkChF5CtTyvqjU6
	 5r5V/yMcCf/ty04PIiZy9UWyjZePM/9xb5JlGHVYzQMzGud3IYdmpw7kNOZRSmmllsA/P
	 mu+AiXPViW2t6g9Xk6OCVEyp0FFUvcBxoBI5gK5rzDgIdXp+QQOHZ+V6cn0m6Vll0K8Qq
	 FmHpi8FuArNynVp3jrq9DN1pibYZlXBEsYRpqJoQRRCvTeVGlEdxdScq9EvSotOUNNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
	b=Qw2tLiMA6kfkfUGZ5d+Hdf7tMSYFkNzIqGHWR/tl/PaKjARrXwo1v1cJ7x84pZYnI8ZI
	 qTbX9LZv/lLylHo8q7qf2Qvk+RtEYmUN3g293qgj/EykOYnEXKTpHQ7u+2JUIgSMHJe0K
	 1U7lVaLcu/9yNG6iBK+gO+kSfo72aSGVLXsUvNC4JRzsR1sJcR4tBK6YdbJGwOkc7LFVt
	 bBpciLUJIQlI8FZZTGnQjaFnqTTRxejTM+RSxnZ3W1CQHdp1fzDu+ADHy+vFSTLqHii+A
	 B9+rM4/7EY9UO/rM0q0iQDR7/ar3nNwdBPz3QqSQV2k2tYLyb1Qt3nK6wNFcm8qXuCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXmwP+KM;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CF7606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80CF7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXmwP+KM
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea138a3497so9836475ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274613; x=1794879413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=YXmwP+KMjfg8Y+ppgBOIkepUy5vUlFl0hR8P/EkAHp47RMYvYcnIPP1cYSzJUvfFaG
         fa6vOok7/0ZKJ7oxI9jLyyGCaTbdn3xjgBjwuSpA0K2Vwj4MkX4/zee9AQquncJeaNjM
         PgDhHsxojGiStVqXSXYk+hhAFTLwXQeJ1ZOOIrcX2k1O7Xw6mS0tAUXDyUByid89Ciie
         34PGtCLgF4xuojkI1iBeWFhx4pHn9M6gyI5QkwFv+u69AaYpH/cZqgW9gL8Wj9DL/5BZ
         ZCbidCDfgtiBcS2sPxHdmbQfJbgvCpk2sQlRvfPJq1V6q+FOzU0+/MhB2y+FUsslk20R
         5yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274613; x=1794879413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=0B/vh8rNEFYv4LdJqbV+kkxy7HTHZd1LL4sNWhJnOWwdhHtgcc2CpMrKBs4uIP3wnI
         gBDpYTOc5v33cmcT1RAQMxZ4fjiwggwYaESiGNYa4VQ57mtwVxEWDbcYcMD9TS/KKRv3
         xpiqPO6RCpVygRuPp1sJGPrOEuVLM5bUu5CY/32oJ+TgRH6ip5XoroOmC5Rv2c3zS/7e
         9xU1dtoC57hStrt/ivNtY23XfBAmSIeElMycxPSdHnfW33ZDIIv8Oy4kbsTUvncNHPex
         a0dakUbyD1vqQVBdv9VsxrttNPdh/DMP8wMxqMn3wWVaHhHOlN7q1848llavRYkjiFAz
         JtrA==
X-Gm-Message-State: APuU4Z+w0VX1JVABT0mSX+icvKgRlNy7y9R0p11kww3BLwtQph6PyDPT
	tQrvTj9nbNREEDhtt461iSIxur8Y+Ln7QjzZfynZse8unkUdUkzRrIIt
X-Gm-Gg: AYBFou1HR0Na7lK/vEpAgC+CvmEYw6JzwGFn4kfjCzv0NQ70gB6MECdT/S/dJRq/Yf7
	juYwLFX9X6+LhMgQqmwXNmde8+1ghqnNeAVVlQ/CIXoqbuV6l5mN1rwxOLX8zHyyMwctat4plao
	qqfm8CaKMHt0hAqfZBhfIOrFSbf/y5LobO/qMUbMYxT3iKymBtbeYVLvMlNSY2RgDZVF5jkwrt9
	zzaSy9/rk33lSZVki7YObLRTLgHp++VYlj1zKqLjyWIa0UMUJbaZouy/kGZvz6oTPXFo4WgIXpK
	6h29I5geAMcBsXhed0sCZhMoRjuzDrlilwo4tdSLglJZtgr+g1MAw8+mxAPI8bF3hYRDtP1PLvS
	eWWqDooMtgEKZBqIglQyZSKKekpGwVmvCf8GeO61FAu+tDunnLr+qzaqeADYnLnstQb6yV+5p+J
	AD7P4j3V6wUYBCSEkAiy9e/NcXInhP+fa/xWbzlBsM/lCiOqdzdCgGWAyEhrTjylgOfVL+vSX6o
	5VbBVWKUy5xM0GkwKIt/nVny+TOPLuWjTlfpyb+SF69MxkpoL/VK4f5vGSmITJhpOUoPTXbwUoy
	Zox6KjfgK0A1+DBmW89Kk0GEyxwgicutsoF4PBTiLUu5cVc3sQ2Kol3x2GnYrV/gaWdegqgeRYy
	BxO86AX/NiE8+9MU8XQKptRNuDeCjO426I36Do1p0oYccjaYXKS7KabzL7a0VyfEJXDmO9TjBBy
	FOiA==
X-Received: by 2002:a17:903:4683:b0:2e6:2868:e576 with SMTP id d9443c01a7336-2edb91c7094mr9718735ad.31.1794274612794;
        Mon, 09 Nov 2026 17:36:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Mon,  9 Nov 2026 17:36:41 -0800
Message-ID: <20261110013646.1582970-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
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

qca956x_clocks_init() enables the MIPS timer interrupt in the misc
interrupt controller, which QCA956x needs before the clocks are set
up, or there are no jiffies. That has nothing to do with the clocks,
and it ties the clock code to ath79_reset_base.

Do it in plat_time_init() right before of_clk_init() instead, which
runs the clock setup. The order is the same. TP9343 boards use the
QCA956x PLL and took this path too, so check for both.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 10 ----------
 arch/mips/ath79/setup.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f6553f398..8c5eaa4ab6e0 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -523,16 +523,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	u32 cpu_pll, ddr_pll;
 	u32 bootstrap;
 
-	/*
-	 * QCA956x timer init workaround has to be applied right before setting
-	 * up the clock. Else, there will be no jiffies
-	 */
-	u32 misc;
-
-	misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
-	misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
-	ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
-
 	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
 	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = 40 * 1000 * 1000;
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4e18cdcf65a0..d9e1cc77ad04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -241,6 +241,19 @@ void __init plat_time_init(void)
 	struct clk *clk;
 	unsigned long cpu_clk_rate;
 
+	/*
+	 * QCA956x needs the MIPS timer interrupt enabled in the misc
+	 * interrupt controller before the clocks are set up, or there are
+	 * no jiffies.
+	 */
+	if (soc_is_qca956x() || soc_is_tp9343()) {
+		u32 misc;
+
+		misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
+		misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
+		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
+	}
+
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.0

