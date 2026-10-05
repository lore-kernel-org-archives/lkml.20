Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9B442E8F0;
	Mon,  5 Oct 2026 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195652; cv=none; b=NDoC4zW5V+KB6LsxNPpR28XqZJhrSHH7ILgfPFcENCO+497ykZAiuzQa3Ux2aCOHb+Je9TbXDNVHFfqEkw1pRZazyd4t8i/4jBIagSoEOThDTFdP7e9v1GqCkJuy1ocYx2F9JjXV8xO83sy3ZljPLlD+BVLE1VI1xg2lw0YAwbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195652; c=relaxed/simple;
	bh=a8kpecVx1Gti5J5Hy31PGI/98aoY/zwEp61RZIb3LWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nW0FX+2vGf9MAk2X9M2S4zwRW0kFCIo8g1UhwnTFNL0cX4Qo+jmaMYVG2K8IffcmSVeT9OoiqHfrInMJRiMMuxKhv6JWOOf/AoJSgJwBWYQaXzfH9T36wNXHRw3hcYhdUGJmVyeOJQVY5UMoSGHwT53y1y5HCGg+QgJ+X9Lumro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA7pMzaN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YA7pMzaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADC41F000FF;
	Mon,  5 Oct 2026 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195651;
	bh=BBZu3H0Bx6rtd/133+q6MGFZh6JR1+IEl9gcErsM3o0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YA7pMzaNehf2X3TgCxFjiGYJ0RwhihrvMCma8vPnk7RhGH7AW3mNejHHBHFDHDygG
	 kLVoFtnxBgPRAqIgsaIQilj+UyrfNTPMKJ/Ru5Why5puNFxN19X96OmlAZsOus8SGY
	 1VAmmxrtoQxBtd4khvhKfiDh9BVJ+vbW4VWYdOiKfQ3U/DWy6MkpmCJlYRhzmQf7Xk
	 u7PATVwyADCqeDmRt806why6ke38dmb2lTQpruToK2nCchYlNK0F7hnBKm7Inkji/U
	 VOoEzP5hye/p/kLz6kNE/DF3a1yBq9N/de4QqJDFGqCP2Kt/hFsfkRpigZN2NT720t
	 t4PWXR7HFnFog==
From: Vinod Koul <vkoul@kernel.org>
To: chunfeng.yun@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
References: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Message-Id: <179119564860.316652.15464320957974464041.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 15 Sep 2026 12:10:20 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v4:
>  - Mentioned MT6991 in the commit description for commit 2 (Mani)
>  - Added comment to clarify that if one calibration is missing, no
>    calibration should be trusted
>  - Changed Kconfig to mention module build (Mani)
>  - Changed header comment to add "Author" and change indentation (Mani)
>  - Moved cktx_impsel, tx_impsel to the top (Mani)
>  - Added pm_runtime_no_callbacks() call (Mani)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
      commit: c5e6a552846b253294d0b37f447aeea20c1938a1
[2/2] phy: mediatek: Add support for PCI-Express Gen4 S-PHY
      commit: e9434ed4effaf46351fce729380d3c8d7d918f20

Best regards,
-- 
~Vinod


