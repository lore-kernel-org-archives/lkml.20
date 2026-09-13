Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95263361DD0;
	Sun, 13 Sep 2026 17:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320698; cv=none; b=Xnk9FJSZQc3gzdCdtfEH0ZpwI/8EjoK2ne5R3F3kCmZJcEMyXVWEHC7AHzl+NdWMID5wanPkhailtdm0zhmOPGSqW+aXSpK3dtswDmxLb25qf4vSRli1/u5CkJFlOElqLLJNczA+akan7iDJrSwZqxnEVtZz4al6X3VqdtPVZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320698; c=relaxed/simple;
	bh=8d2+m3RIhQdv9fu7/cp//uLQWnN81+IzegaKc0Zauvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rm9stzUGy8WNNj1w4KCafGuYNkhFbQrA6sD/qhlWVQBX44Uwvg56EJkE5f3VQGwKUhX+SRsAJVlzFveq7i932Lix5PmrvolnKo1aKj52Qi9xjh6r7o5eEmGcwuCBtRLzuA7U7T3yxxykPL+DSBQL9xpUPoH8mKXsvxq/IzpSWBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6JO80qL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6JO80qL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519D01F000FF;
	Sun, 13 Sep 2026 17:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789320697;
	bh=n8LeTvK1MWh7o6kvrjkW+A/XmHvMCozngXmjK59ZQv0=;
	h=From:To:Cc:Subject:Date;
	b=M6JO80qLlJnE26MW1y0hfXll3be8IxYLFpT0zse2Lq5i65B6PRWcVz4JOrJ/anHAJ
	 /4T1i2hDrCDUCoP5AoNQ4tAQhddokn9IAlPhlW7DSQ0cKDE0g0eALo6UTEsVKzQHDy
	 IkaOk/1RZI0vLS5m185MWVDkwfv7AcV9SR6ItFktUx+YSToI1Sy/PHMWJOIUZ/NcH1
	 ZddbutjluKmNshg9ArpUAKdLLWeFMhRPNDFFpJD7lcHB9npBziEF8BGjfynbE1j6ra
	 HTTRazCyDT6MxZx282AKkJ4lykOuBL8l0e0YyPkspbadVYRuDrTZ8NZXu6klSaEWNe
	 kaER2NRTEZSGA==
From: Sasha Levin <sashal@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	kernel test robot <lkp@intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments
Date: Sun, 13 Sep 2026 13:31:32 -0400
Message-ID: <20260913173132.1172003-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm allmodconfig fails to build with gcc:

  In file included from sound/soc/ux500/ux500_msp_i2s.c:20:
  sound/soc/ux500/ux500_msp_i2s.h:151:38: error: suggest parentheses
  around arithmetic in operand of '^' [-Werror=parentheses]
  sound/soc/ux500/ux500_msp_i2s.c:204:21: note: in expansion of macro
  'MSP_TX_CLKPOL_BIT'
  cc1: all warnings being treated as errors

The macros never parenthesized their argument:

  #define MSP_TX_CLKPOL_BIT(n)  ((n & TCKPOL_MASK) << TCKPOL_SHIFT)

That went unnoticed while every caller passed a plain variable, but
configure_protocol() now passes an XOR expression, which binds as
"a ^ (b & MASK)" rather than "(a ^ b) & MASK", and gcc rightly
complains.

No functional change: tx_clk_pol and rx_clk_pol only ever hold
MSP_FALLING_EDGE (0) or MSP_RISING_EDGE (1), and bclk_inverted is a
bool, so masking before or after the XOR gives the same 0/1 result.
Parenthesize the argument anyway - it fixes the build and stops the
macros from silently mis-evaluating a future composite argument.

Fixes: 9ccbacf5a012 ("ASoC: ux500: Validate MSP DAI configuration")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609051547.G9SJp8UQ-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ux500/ux500_msp_i2s.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_i2s.h b/sound/soc/ux500/ux500_msp_i2s.h
index 2bf2699bdc49f..c66ef455e1380 100644
--- a/sound/soc/ux500/ux500_msp_i2s.h
+++ b/sound/soc/ux500/ux500_msp_i2s.h
@@ -147,8 +147,8 @@ enum msp_direction {
 #define RCKPOL_MASK		BIT(0)
 #define TCKPOL_MASK		BIT(0)
 #define SPICKM_MASK		(BIT(1) | BIT(0))
-#define MSP_RX_CLKPOL_BIT(n)     ((n & RCKPOL_MASK) << RCKPOL_SHIFT)
-#define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
+#define MSP_RX_CLKPOL_BIT(n)     (((n) & RCKPOL_MASK) << RCKPOL_SHIFT)
+#define MSP_TX_CLKPOL_BIT(n)     (((n) & TCKPOL_MASK) << TCKPOL_SHIFT)
 
 #define P1ELEN_SHIFT		0
 #define P1FLEN_SHIFT		3
-- 
2.53.0

