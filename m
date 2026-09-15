Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF724B146F;
	Tue, 15 Sep 2026 20:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503651; cv=none; b=Rjay1mAcUQ/QeTlfQNNC2Io3Wf9bxbsJ0brHeP3Ts6eqiz8cjce7I6BbKBZtd51i2YwAEShCbWqtA93SWZiMPO7rg8ZDtMfU/nBzDz0hWZYfZisv514yK8vd0WWOkZ/ezdLJSm2wXFvvx8CFYWIw3GgQ7jFhvYLpENRqSLCKcg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503651; c=relaxed/simple;
	bh=c97rO9j2TWTmLwxlPRpU9dtjcpFRoX5Xem+ODxXWomQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCIkA4zi4HF4CuyLhlzVNBVAzR1nPv62wD8ydI/2NtgOc3sLM9xKLLhJoAELQ6CuQ/OsIFtf1pGXD7xH3k1Q++QaquO7wucCFxEtCL2aJYnzE/uCwtGT375AR8F9sseQMSDF931tj0jw4OC2r4vWHiiTklAcoWFW9Xy3pZaiTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwTrdIb3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwTrdIb3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7691F000FF;
	Tue, 15 Sep 2026 20:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789503642;
	bh=ahWV8udmz2lpi+TneudUxw//hCiuQX14iqnc79J4R50=;
	h=From:To:Cc:Subject:Date;
	b=lwTrdIb35atjaIf/p2Sybo47IsFkG392BDVKf3htDKOxhCAWg6eHtN13TlN3A30kW
	 JTj4lro/IWj7R3+9Hy0uQQoHkOuxifYWWXQ7q/GOUwM6pkhD6rEVKHIpMf2sDuWzLg
	 /qWtxl6HIFoG27r3fBDgfY6GNcX7B+974tklcEe4a/0baZyFUtN9gKoYF22+rCPgmD
	 Tl9kilo/anAjxVlaHLHZEQ5aVm4tqx9eyvD7I7x4T15hBU9OFNk+cZTbqDA9crDB+M
	 X026Ei6TfqWmP8gxWGh3eR55re2lWJP/0lvwQzLnFLJH5QdN8aSuAihgcXAtxG9sac
	 AP85VmrZyr+Fg==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ux500: avoid -Wparentheses warning
Date: Tue, 15 Sep 2026 22:20:31 +0200
Message-ID: <20260915202038.3534453-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

gcc warns about a slightly confusing expression in two lines
of this driver:

In file included from sound/soc/ux500/ux500_msp_i2s.c:20:
sound/soc/ux500/ux500_msp_i2s.c: In function 'configure_protocol':
sound/soc/ux500/ux500_msp_i2s.h:151:38: error: suggest parentheses around arithmetic in operand of '^' [-Werror=parentheses]
  151 | #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
sound/soc/ux500/ux500_msp_i2s.c:204:21: note: in expansion of macro 'MSP_TX_CLKPOL_BIT'
  204 |         temp_reg |= MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
      |                     ^~~~~~~~~~~~~~~~~

config->bclk_inverted is a boolean variable, while protdesc->tx_clk_pol
is a 32-bit unsigned integer that can only be zero or one in order to
be passed into MSP_RX_CLKPOL_BIT().

Move the negation out of the inner expression to make this easier
to understand by the compiler.

Fixes: 9ccbacf5a012 ("ASoC: ux500: Validate MSP DAI configuration")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I still find the new version equally confusing, if anyone has a
better idea to make this more readable, let's do that instead.
---
 sound/soc/ux500/ux500_msp_i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
index 683b485fb570..588d381230b6 100644
--- a/sound/soc/ux500/ux500_msp_i2s.c
+++ b/sound/soc/ux500/ux500_msp_i2s.c
@@ -201,12 +201,12 @@ static int configure_protocol(struct ux500_msp *msp,
 
 	/* The code below should not be separated. */
 	temp_reg = readl(msp->registers + MSP_GCR) & ~TX_CLK_POL_RISING;
-	temp_reg |= MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
-					  config->bclk_inverted);
+	temp_reg |= MSP_TX_CLKPOL_BIT(!(protdesc->tx_clk_pol ^
+					  config->bclk_inverted));
 	writel(temp_reg, msp->registers + MSP_GCR);
 	temp_reg = readl(msp->registers + MSP_GCR) & ~RX_CLK_POL_RISING;
-	temp_reg |= MSP_RX_CLKPOL_BIT(protdesc->rx_clk_pol ^
-					  config->bclk_inverted);
+	temp_reg |= MSP_RX_CLKPOL_BIT(!!(protdesc->rx_clk_pol ^
+					  config->bclk_inverted));
 	writel(temp_reg, msp->registers + MSP_GCR);
 
 	return 0;
-- 
2.53.0

