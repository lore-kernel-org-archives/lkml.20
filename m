Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434260;
	b=lsEpx7vgeFO6qgq2AWUl4uvtoPG5quxAT6FyhT0M0TBx/8tSreu2lUHjvPlgat8nzOxb
	 sN2ghHSTHcNIpzgwr8O1n1XThrZ9jbvHJm9am6e6cSqQR8oDfGBq/jQXY50YoceZBDTBl
	 32KMSckkjlLpL0HbbK7Rl3giNg4CF6wHQ7yzyjg/zAwBvlRBzK+6ZXRr8msvfmr3aMNOL
	 U5AZBpcXODFjKa/gKaYTYzL8S6qlLUBekVjEIMIVtJNByQ5tafpfAARJhl1EsR/cjh2ro
	 A9SHl0MJo5dH/5tslnaMwrvByVLzufG4DFPbhCq3lZ6fePqo//4qd/Qa467Nu24J7kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
	b=lEyjfVy1naBoIGDBonjAs8HSMcKfvwXTt9cuxgiWF/btachkOtVoRKWVpzjbIYv9cDKx
	 R2zxWn7MwM5OT4slJgTw+LteBWeZiCNZ3mkOhlbVOuN5q8M0gd1xHXrQd+ZQjCZvoSAFO
	 pKenh6XGhPgZpZY9a0bDZo6rXhh7+4inoEh2FlKLjjvBlGaylepb9h09A56L+gg5uftd9
	 Op+4Ls5yo3gJv9ZHhcIy+CXqrzWFj7QGJSF5vtVylT62PEcXwbZpv2jpgTUvtYHhkU+mf
	 38evC3wLM9IdjvKU4bREiNqcdw8xIrmyre54C4BRwWhr4/lmFbY68sy7XsUJG+EBIbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXHAYuoH;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81CD606A8A7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81CD606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXHAYuoH
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2713969a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434259; x=1795039059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
        b=VXHAYuoHU92lfwUVxtqfkVZGdQiNbVjxf1xXEV1GYQnL17GdS6R95T+ObDNlDmzinz
         pICwPj37iXBxXLTWt2tjwwJqcSbeFg1StgFcyp3IrKaYoS4aFivkgZybTOBkz6WP1lbb
         Habps8kmQ+GE5KgDT6Ipvpy7G24hHm+/MXrnc2MSxkSeqnVZTeQdzt3ISK2qWifjuBct
         Z4sfhZv3Tkxr6CappcuNZ9a7MIXtFIp6Q3ahlQLCDQQ3H22wG8XKA0JhNnKXanEwjorS
         FNrNT+UtuRJLME5T9ug0pLoQvFnr8E4aBOkTj228wOdNiq8m+3ZOziiE3Wa818rBzLkM
         Ll4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434259; x=1795039059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
        b=G9xiLCaAStT0mGk+zeaATvQorkoOHL8/sh6XFNfDa6K5EGz93ve32K9yyGjElLcZ08
         XW5JdnqKdOQZ04aTuHoTzl41UmN4tC8g3mGbbe/yfnQcizM3xalwrF0oyZeWbyg4sHMY
         pwfBXOKTdTTEbufeHFYxwZqt36VH1o5xi7Y/27X6FrRSqzOPBdwzIWi7DmyLT5zROwNW
         wLDsZhJRh+nzsJdYR52bUjxzbfx7h8le8utKFcuYmjw0QHip+ei8KxWBnrT9Vif+05SJ
         DX758vEBX2D3QSCkdEi/BFx8TNK5zaIlhM/Fu7wWXmeQr+Bc6iYZmIKKJlnRkfN95xlQ
         av5w==
X-Gm-Message-State: APuU4Z+Fg8AQrYTyo2yhE2YtnQ29wP1jcell6DeQYZVzYxlPY/zfMLo1
	8QdNKEQHgNy3X7uePd5Z1ffYDqpacJAAeFdol9DBBPoL6OsHe7NXl5MX
X-Gm-Gg: AYBFou3YhmNyZT5LxUftOYa96RBNpIRLefJxl01T1t5L+WXOrlmGat4QqfEw6gQ5ITw
	OrVQ1OswGlFPFQcZy3ZnozTWem+kP5wWWKpXa5H+QdlPS1gyaN25bXm4cmVkNC1opnjueS6mkTw
	6u+qXoShyjvayDy/h84Um/BzFnRLmPJJnZ+Hw/eg398Yo2kSwYIfBlfDVVkAc0WPnxlB4aaiIOv
	sBS3NbhkZvrgH5/TKiYzoIqcINXuDxy6ayHuNFdNRoNOGkOXUmM5jJZzprrtr0nl8RZojb89GAw
	s4qAXAA7Vqd5YNL7H5Zb2nyZPjhUqqY+3437hT87gsqIcGkXU8dyMj3pwpbVt/NqCa5d9iamZ8m
	MMkMPr/eALuVc0kjHcP5CWWRogI2PeEe5Zqr+RE/Yk1AsUt2FWccAyfsVJkcMK9Wnkjq23oHz4U
	Jg54Z5yYbN3vc8L6KXfQ5qrultnpAJDCQDzJAI3opNQsyrZjXXzq6WuuioQiCmUBUiI9N1l6axA
	A4epGoTi3Ui6H0KhDnwAP0ZbGrvPiim2duGZtf2c0dAR85+M52d8wPKmZHv/LlzEuGZVH+/DnSc
	+cJqwgDfekndoZY4SIJqCwrnc68V2VFGlbiK8Wq/YUITAqfddtYCvWvSl8AHxaFg/It9AD7SMT9
	BjOVdJzLPsddj6IyrzHa5BuKg3XN2daj6EoQGFs9CTeaH+mOWpgBglPvLvm5gxmMdgh4Pp20R8l
	Alng==
X-Received: by 2002:a17:90b:134e:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3b182ed7a6dmr3796484a91.24.1794434259067;
        Wed, 11 Nov 2026 13:57:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:38 -0800 (PST)
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
Subject: [PATCH v3 1/7] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Wed, 11 Nov 2026 13:57:23 -0800
Message-ID: <20261111215729.10683-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

