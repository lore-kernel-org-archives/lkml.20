Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A83348C6F;
	Sun, 13 Sep 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297026; cv=none; b=qegU+UXiazN9BiZTxXLvg6aEq+7Cl+G48frStnCVEL4gHSPuzRhYOivJhbMz6hhYKAQCsTdN2NrYZruBLxTwF8QfCExsV/kN8p+ayOVswIK1kXBVx8R8LldzQOxGJVY/dI33mk1mRQ9uyKDFblb/HJ53i54pG4elm6UTt7+jftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297026; c=relaxed/simple;
	bh=Kyz4aR7xCtVsoUO2taGDqnk0hsuWcaFf+23PClhNTT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J6FzYSItkvapLjI4KHW8jMCRu8FDnnDuwUd100OSvFKUuPjlXBIqZdNAKLVQP1kI6CtfO/89WhZqVDLwanB05K3StskZFtyY/zcd8lVk2y0REXmyyCD1r/ml8WxEkj7Q+NgtcOmcIn52JdIsY64xQmVUpJ/1M/VuVGkzRKzU4HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbfIeS+v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbfIeS+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD5C1F000FF;
	Sun, 13 Sep 2026 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297025;
	bh=yk6Bx5863L5VZWI386ImEYX8oEoGZMlDrpaQMRb0xOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PbfIeS+v8bhDF9i2Dlp10MWv+rMH5mQeNziX38SXYA7VePYBUV4drNB4nHfcXnM0C
	 7BkUHvBda7JmWsuCSiPFCT30HirKNDUWxSbaPmI7oiD6BSf/CymObfYcaEKSUPVtbX
	 q5fdw/TI5018U6ugPBMnxUWlJovYIq+0pSgFtMpzAc7EPTH6EdPpmJQwocSuc//ZEX
	 efbL5jsmVMRqgwY/49UwmhLKW++3J6PtCbMCg0r7RNF0wjCEjfhMzFOImrln05DTrt
	 TqrzG4irL3AfvYNuK7Rv3EXXyjwW9dm5KCkrfPcJDc/XzuqCX6EozC7R7SPFyVSmcB
	 CiIQyTwDKxFGw==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
References: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
Subject: Re: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for
 MT8189 SoC
Message-Id: <178929702027.215437.1601170548620063289.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:27:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 01 Jul 2026 17:36:49 +0200, Louis-Alexis Eyraud wrote:
> Add a compatible string for the MediaTek MT8189 SoC, that integrates a
> MediaTek generic T-PHY version 3.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: mediatek,tphy: Add support for MT8189 SoC
      commit: 29dd1189fa167c5374027502ddeafa8300dfa871

Best regards,
-- 
~Vinod


