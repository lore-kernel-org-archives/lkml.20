Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C1B314B66;
	Mon,  5 Oct 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791227226; cv=none; b=Ik0MjIHVh5Rs0Nxr7NDTHOApqJBFYvRJLmS2gmlOHPhgZb3Dm5+UARiTylIFNbn5TpCDWXuPMCOgylbV4Ot4/jl8GqGVr5xDtitmCpnrPlclqMu+V2s18eKjYVWDqsZOmmBvhFW7DnuFTbPzN38r2G9qvGolWXQwYJjRVJPG96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791227226; c=relaxed/simple;
	bh=vPWqLX0bZAFj08SJiYYgzy8773Bjd7ezsX6EZ17ZJH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LjqhJjW6c1DwUE9uKLxnpB0cN24CKfmvdTfbihTbx2QPrgK6xLK6PH/7mmXMw639NUL1Od+Y2c6MXftFzrITcGTqW8LP7yivMDPohaMoAf2bKN7hxKcUhcVxZ9WQW8yWJqAnco7LeF1U7oROd6oFlTPESxzi8kw3x8Z/NQ4xmcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Rx5f9B67; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Rx5f9B67"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0iMyjjmTU9UJGjFhBX4xQCZ5Or9tqnivx5Sft6lCQdU=; b=Rx5f9B679fWG3UMPXQv37ZDcYh
	FXDYTOydla9FqTuweIsT9Ucf8nWiV9Rdax+VMf+M6jGUiIrgkTtpxalCnZiXUB9TgEFM7d0si8h+S
	S79iGZTwJW+fq9orsPAx+UmFC9yUcMgzD0Ifa1MciCD1p4jcTJ7NCnFsWkFeYcIrryNXVRxkHw9a/
	iFDZyF7aHN/tcWi+1h9nt3dYM7aWzqAG+NmJb34iR9WpZZdk4CgwlWSLMCGYmNCE8HCdY3pXibNQ8
	ahniwyNzEliyvXZzO7ZN36hal9fTKuPb4UtDGbzTJvDPJeux4Fvhk+YSRgOCNoMW8zuK//CECU2+J
	Sp3CDumg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amin Gattout <amin.gattout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Riesch <michael.riesch@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: add radxa camera 4k on rock 4d
Date: Mon,  5 Oct 2026 21:06:51 +0200
Message-ID: <179122712930.3317128.4716546981671475974.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
References: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Sep 2026 14:16:34 +0200, Amin Gattout wrote:
> Add a device tree overlay for the Radxa Camera 4K (featuring the Sony
> IMX415 image sensor) to be applied on the Radxa ROCK 4D camera
> connector. The camera connects to CSI HOST1 through the MIPI D-PHY0
> in full mode.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: add radxa camera 4k on rock 4d
      commit: eea8ce042825cea71009cffc13bf564afaf7dbe4

moved the &csi* nodes to their alphabetical correct position
above &i2c5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
