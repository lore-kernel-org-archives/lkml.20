Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434262;
	b=H7E9b1ejLeIG1RsI4+fMGIHNK0kyEshdT5SsLOwOgzN1XodQDbxByTLgCUHF/vSg4kBm
	 7B003rnrSynP62TTkjUqc0I51PthdXtENFN9VpD5Z58fTxlPTqdjqVxgoXQojE8ZpQXmY
	 qfJLTBgxW2DX6XhUsuopqf3162awElHjLRkaoRMboemCT5pWwueOkT4norp0iF2T0PGZP
	 nyLKJtQorl9IypKU6FcfKwmReKPmTv/LHSZWjltO9RavA4z9raGNpGepd5SwbFEKhh9EH
	 Lldh/Fc0Q+bsOQ4iccH3kyEeDtWwH1M6l30RNnM29wS+f1IuJfIoWLy//8sInkmmpVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
	b=YMErhQpB3UbzUQ7G33P/zr/QlMPrCPnE175/sjDmmBjaZOOocY6hfIAYA2LvRzTt52Tj
	 5NH9gV3MH9dqyyPvlIIs84AU2234q+CLU9aqWGoI0Px3c+xCsBVJm0PAKvh/pzCtwZ6T/
	 8OSDactVkOipP6Nlzf6WT4Btb+ryU08UD36v0En+fnw8aJuBQ9Z9x+iH6zr1yvHV9A+z1
	 oXkaAIdoYp9/G91aeWlYJCXMWKOT9XqI8sGF9B6aTjz52tzvodAE0+tFCB1KgzokSqLLf
	 S6JfWwDvY9SHU5Ta+wlU4HZorD+58tkoRsvDTdJtP4Gl+mwtIDoIDM1MaQVA5Ld1+kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zye+u06M;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F38760A2617
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F38760A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zye+u06M
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1432399a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434262; x=1795039062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
        b=Zye+u06MWPnI/iZ9Dvf8g7kNiCqjl8bBx5B9PgvrMRhL965Tb+ZA81cHu7ySSpTHRa
         /vN7WyNneVWe4nb2axIJEbaOE6JLWqKdt45FQOi3j/WT05ZlAD6eRIlxPX6IykdQ2zCT
         XZmXrCggIgVSQMRZj0XpsYTP00aFNq7A0fFaoSId9V+rqnk2Z+nrQPr7eI2GaaYS4kXv
         WRnUdG/+96JvWJeH50HjrK/XOZGRBlVPPhGuFmmaMEx+euYJcFBH8WQ+Zk96dGKEo7ic
         3OjUsz57osZ3fPVTvVjlcRDn3I1xf4TIQ+5RVhrcast4d/9TUdXu5B4T7DCeTssuRBYG
         I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434262; x=1795039062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SxbXbiAkUu/9xk8uRLM8Bu8VTt+3N8T+dREW501N3Q=;
        b=NTKmKmYGvCg/Q7dOJmm0S/T9Zb90mh3csEL/3cUY6bevKoRxp9OQNYMe4EE1FpdXaa
         7i2rR0sVnpGJvhujpY9gey1Bhm78N99cIXtPTCInsZdlYZCJogFm/bbqo1v++8Db+7MK
         pPy5P9GWmSFJyyK1jroesvutj7AiegjTdj3h33EnQL1dB4P2vtfrn3UQlsI9aHR84ew/
         xYIyC2WJgGyx3gxS/v8opQWMcQIpBgaLhxd55ybpHPPPLrXnAb1nZRYw7jYCZBl/GVpZ
         nPXcd/GhSTyfo/9rjCN1hH40sS4v6/yv1fXN0Yk7ic7/6JdfZseH4MshUUY7iE3c+Uyd
         k4og==
X-Gm-Message-State: APuU4Z/T4UbXafd4fuvyQV1KLyLFto9dERpKSyH9EIY6dJetCuSHpre1
	SR7/0+ARDZkuPV23/ivp8y0hsghuLVfL5STIHP6vx8KaA095vKBvCRwu
X-Gm-Gg: AYBFou2dDbwJLwnfOiVHUbK9s7eVuRRHWnvs43fgb0nT+dW7nmqR51n2LONu734I7wI
	9rsbSZz/byfxzYJXjztF3K3+3QWHZPWd6oTdhtltL8a8BdV0V6e7WDvpa7vv8WR1N1u7WnkIHVZ
	BXSWVVUxy7E3GL1ywi3cWqdLyW8U9Am3MrNMcwPBLQp2hpQ8OOP9LKg8OtzzNCCPfRvlzXDQwFJ
	lWSk6OCaOFbFP9/ImfQtJGvQnyemS54e6hr4WonKaC94ew4UcGXqXVaACldxjQysTUAjQHMHlxE
	qrZqXEQRs+9uvbT3ddN6zM4812NBXNVZ5gWMISqQrk3XKrNrVrRBdu0+roYM/tr2a1mB1+Z5mvA
	cN8Kiwr8sMkY/eWABWxbhvfptJ0yIU9g6aBg6a2vlTycEM/KsxNxsl8v0p7dZ5DnplE4h5xMk84
	Dpj4fBrHgcArvKj/cnJQMJMs8FlTItSMmANwNQmxVLViB8rWZfGrtc1c7q1PtbWrV38u6+Cg4iF
	EMgGd0lxvSnljoMMldibFvjsuptgD03fWa3JKqzm5vV4aFPhzl/1+iULium/up8r5Hu9ewx8+Ct
	zjR9Dsy7HeFIqm0sgAcx4GER2Hk9n0cAS/RgGYR80zF61k3aYe8xo34Aon8m8UD8RpVpqBoWDy6
	FBVQGS1EQ6/U71spYJH+mx6Y9J9Zq7v6FQSsi25yawi+OJEzukF3Ua8pzQ0rPgLZliqjpseDmZb
	y0jA==
X-Received: by 2002:a17:90b:2649:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3b182f2381fmr3592513a91.44.1794434261873;
        Wed, 11 Nov 2026 13:57:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:41 -0800 (PST)
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
Subject: [PATCH v3 3/7] MIPS: ath79: stop using ATH79_CLK_END
Date: Wed, 11 Nov 2026 13:57:25 -0800
Message-ID: <20261111215729.10683-4-rosenp@gmail.com>
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

ATH79_CLK_END counts the clocks in the dt-bindings header, which means
it has to change whenever a clock is added, but it is not part of the
ABI. Size the clock table from the IDs that the clock code uses
instead, so the define can be dropped from the header.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 6a8bef782186..55d8ef8c1c8c 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -25,13 +25,15 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 #include "common.h"
 
-static struct clk *clks[ATH79_CLK_END];
+#define ATH79_CLK_NUM	(ATH79_CLK_MDIO + 1)
+
+static struct clk *clks[ATH79_CLK_NUM];
 static struct clk_onecell_data clk_data = {
 	.clks = clks,
 	.clk_num = ARRAY_SIZE(clks),
 };
 
-static const char * const clk_names[ATH79_CLK_END] = {
+static const char * const clk_names[ATH79_CLK_NUM] = {
 	[ATH79_CLK_CPU] = "cpu",
 	[ATH79_CLK_DDR] = "ddr",
 	[ATH79_CLK_AHB] = "ahb",
-- 
2.56.0

