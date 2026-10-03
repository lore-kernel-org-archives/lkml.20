Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7C39A057
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060596; cv=none; b=Rkp/RQKjbypFm6ImN62jcevCJX+g2qWWgd7lVTAFfxrvNHFvk+/Zn7gOeYCeLr+i5zr39JLlsY4++FzxYeunxeYwjxNn3Bvw9EEUUj4aZ7PJtLhO7JZcOrEmNRCtWNrRbQkUWeDLrduFGlZ/RcfwFXHybBsK8C92svyYPldHFks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060596; c=relaxed/simple;
	bh=mi7F3A2Fd+UGrW6TAf9erjmxiaFcfHCmRonwQNeGVuM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mFnGQuq7fW6+AxiX8GKBlm/2DUqZFuNEActvf8OWqVuLKDCAJLaz0upfBu8Vfb4XcrKTPskrBhXHkZRWueweIr0n/N5x5/980Sk0/V++6JQgScukHCaI3/1i3zsZ3+gQ2XOCaInPLQns3f6XpMOXJuiVaBVWn1RLJRlLojz7P0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gh2NYfif; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gh2NYfif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202781F0089C;
	Sat,  3 Oct 2026 20:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791060595;
	bh=yaWhz0cZdP0xugXEQZDKE9TvZ7j9aOoCXViN0I6PkgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Gh2NYfif3zktSh1k/E+/4+WFz+ddzdFicfb4mcLn5hm+jhWrdPVZ28zB6ks69/fGu
	 y/EobQjdE97AacTFQKFP4pbS+J+FDN8pyNfqFB2PlLb5C3+8RveOTwilDwhFT4hRdd
	 Y4sVEbeDYLeJ8on4cDjRsR2awQrqTit3F/drcVJRHArsXBQjXA2tk1Q6SMPttw6o+p
	 HErOAbMPmAb8MFAIKmZgBpDGoWmsqpqjk96Xbky2uf/VkOwIPRyDU/ntoWcdRkE8Wl
	 cHUuf6o51XrdH+SjBbM9sMlwkBobC1y8aoPPJJiC/lFj5wIg6/3Qc+ptrc9QXAwg5b
	 iJ5oQky5Fj4Mg==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Aristo Chen <aristo.chen@canonical.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Fabio Estevam <festevam@nabladev.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Adam Ford <aford173@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260903054811.9720-1-aristo.chen@canonical.com>
References: <20260903054811.9720-1-aristo.chen@canonical.com>
Subject: Re: [PATCH 1/1] phy: freescale: fsl-samsung-hdmi: initialize
 default rate
Message-Id: <179106059279.240943.2122705521584703079.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 22:49:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 03 Sep 2026 05:47:58 +0000, Aristo Chen wrote:
> The HDMI PHY clock reports 74.25 MHz when cur_cfg is unset, but does
> not establish that rate in hardware. The common clock framework caches
> the reported rate when registering the clock and skips a first
> clk_set_rate(74250000) request because the rate appears unchanged.
> 
> Consequently, a display whose initial mode uses a 74.25 MHz pixel clock
> can leave the PHY with its bootloader register state and receive no
> TMDS signal. Requesting another rate first avoids the issue because the
> set_rate callback configures the PHY.
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: fsl-samsung-hdmi: initialize default rate
      commit: c01ccf91b257741e9edc374a465126bae9ae4711

Best regards,
-- 
~Vinod


