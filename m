Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B6E3859FC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789296263; cv=none; b=mL+OI1h1GHBJ3KElhaaKzQqCoDVexCDH9xeZ/UYde/Z5x1eV6UJ7KUOE/myxvmi63C/THoR4Immnvo8tjxiJErsFMNHUSGLaTsDBD+oGQxKqJDi9wnu4mDQaQa7dpV6bA17V3+UqZpHMPcXh6gO2otClwJDqe2l1UcwnYlOmvY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789296263; c=relaxed/simple;
	bh=Nja9VLnbRAb+uNarmqHD8SlSLPZhem5jNKXL16+4jAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mCQ2LQvagvtXwXVx+6hBACMgCCbJR9tsNlcKbM8PKjtoVhM7uYfpC+Vhfa0lr+srsUY7tFDxhQyaX/kncU0rx8Jf1RgX9L0Vf9mvANZ2SlYcMZS42dI9ik3tiQZHlcj/uCIsBXBQOGiXtlkDLrI0hhe/DzpcZf+DQQMhT/aEnKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLgZxZ2O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLgZxZ2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DA51F00893;
	Sun, 13 Sep 2026 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789296261;
	bh=+nditHmexPW/lqQ+6UzeYP/gHiOGs4Gndjs9rnADJZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OLgZxZ2O8sGhl/Of1OwzeV77kksP/bNeBpBJc6Zpugxgem7Q59jWQMn4UBZq0MaoW
	 sOLAjgeT48gkLiHYp2A4mmUhuLtMhskGe12Nbf19nEhg6z2pgmUTh2Nztw4gL8Eq1/
	 M77JPDzqYZHSmF7zYeGQ88l/vBO71MN/zTPuBkqWOsH2QjxvI+SjnJfWJuZR9RMACN
	 KTP5IUHmirvUQzywEhhN3RkY2J+LF+cNiVHcCx89CWWBpV43Igiznsa629PU87eayl
	 qrDZ2OQ1+oV4VLmzlysLsBCD00gM/bQiJYzuoVfSnsDlVMLBVNUQ1JOFLlpMLNBUOQ
	 FMpjtNyJiIHfg==
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, p.zabel@pengutronix.de, 
 chunkuang.hu@kernel.org, neil.armstrong@linaro.org, matthias.bgg@gmail.com, 
 granquet@baylibre.com, justin.yeh@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20260911074015.9994-1-angelogioacchino.delregno@collabora.com>
References: <20260911074015.9994-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 0/2] MediaTek MT8195 HDMI PHY Fixes
Message-Id: <178929625740.194170.3391606721825248662.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:14:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 11 Sep 2026 09:40:13 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>  - Fixed commit description of patch [2/2] (Mani)
> 
> This series adds two fixes for the MT8195-class HDMI PHY, found in
> MT8195, MT8188 and Genio variants.
> 
> This is fixing PLL calculation, and TMDS clock dividers, to achieve
> all of the modes requiring data rates higher than 3.4Gbps, with the
> successfully tested target being 3840x2160@60Hz.
> 
> [...]

Applied, thanks!

[1/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
      commit: de7f29a1fe1dc2864d8a47f8c39d508442cae167
[2/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting
      commit: 486a70ef848264dcf9a57f0bb0452848db9537de

Best regards,
-- 
~Vinod


