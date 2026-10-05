Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44660442373;
	Mon,  5 Oct 2026 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195656; cv=none; b=LsxVp4bjb6rtIma3j1fKmNCdlyYk0C4r/Rmmuozmw6Atcgx9WwkLz4Hu60G6syUAuWXBULq+wl1Hc6wDKITx/u5xLoNHse9/F7M1Xd9zT9QpAAXzsAymfzwllrNfKa9G6NXDOh1/w1FZtS5eJJOPiZj4JAKIbckpnpXMb4QEp9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195656; c=relaxed/simple;
	bh=5nrJn6k73IuAuE2ZM+RIExhi00APnbv2M4SC3eouyi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bLMFP64LHfNKVedKwUqWHXdCnHSaQNtY2T00ds0jt3D+EY503VBmTSWtiUkHU7756r4kOpS0UtFsP+4+sEXxjuLAHAOmf06s+q0h7JY5KpsVNRFlhHdJvOhXh6X23JKSlhPKMGO/X9mkjaq/buyJxkiR3m6trBrYEwRnx258E3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bx1ru7FU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bx1ru7FU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552301F00893;
	Mon,  5 Oct 2026 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195655;
	bh=fs+vPKGM9euFPbmuig/kk7Y6Q16/AWU1bovoyR6PvLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bx1ru7FUxUOa8za+jHJc18vTvLSX0rGMjYYZQPSfq/jyKsKUa7bZaaGGUva8/CfTp
	 WMdg/G++C81yk6gAFR3I/6NfoohQO81VTmyJhdUvgpHl2uq7oES27vbdPul7Gg/ycR
	 8ahPijtcC+M5tH33Nfw/9dR1u5U0cimYXpI8rG+4T5Sq9bvKPkC5xC1w6OplhFZ/pc
	 XLACWo7KRYFVaNrB6q8VDfoc0b8heJahjdluTXnjV31T5YWumh5k9jFg53gseGOWjc
	 Oyqzl+xkSTbBZL52hshd/MO5n45nFRAZiZgl6bsY3Q9RzZrNMw9P6d65IV36uGpAws
	 P6enf4OhHtvkw==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
Subject: Re: [PATCH v2 0/4] phy: rockchip: add support for the RK3576 MIPI
 CSI-2 DPHYs
Message-Id: <179119565198.316652.7051689992732505012.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 15 Sep 2026 12:42:45 +0200, Amin Gattout wrote:
> The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
> supported using the existing phy-rockchip-inno-csidphy driver.
> 
> This patch series adds support for this variant.
> 
> As you may have guessed, this is part of the efforts to bring the
> support for the RK3576 camera pipeline (VICAP) mainline.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      (no commit info)
[2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
      commit: 40c95f05093129e75f0180938de53dac65ce7e75
[3/4] phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant
      commit: 47de65075563915363ed25affff41b9b4d004d4f
[4/4] arm64: dts: rockchip: add csi dphy nodes to rk3576
      (no commit info)

Best regards,
-- 
~Vinod


