Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDCD5349A4;
	Tue, 22 Sep 2026 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077223; cv=none; b=O3lJpBWFyP5Rrsh8gwH6kF/KnFQr+8py4UZGFmeFskltwK8SRfLtArlZ9vS9KVfDCFVGQn5k1PIQG5WzFxKf1x/dZtxZ1gO/IBzF2sALubLiySchRlorprI2PJetQo+KN/QvCviIyuHxfVD5fdHRFT3x/GD6YVwhBTp7fU6gKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077223; c=relaxed/simple;
	bh=WemhoXCB/EePSNL6whhElkmGoo2RtXfr1FTlFqwY+hM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SUR6cSYQC9HSaaLCKFM7cohApOxm8vZkw10j8B5PFpU0k2o0Bw99pIyWoy6FDPmDuDynXvuthWHnC4yvkFVXpJBDNhbmXYy2u9gpUZIZE+o2xdJ01bLEj7+cg98xp5v6d7OtxhQRUA+St56rttv+LSt4GdbYKxE8TSOgOlsgORo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7zTLV59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7zTLV59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95821F0089A;
	Tue, 22 Sep 2026 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790077211;
	bh=ZMxU8J3uKcMOrgQwX+XFw3QA9q6BMZDlr+d3rNm0u+I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L7zTLV59mkZx2WzaeuC3tt5yZOoieSFjr5AlzvV5JgqYl8AkRfatGDTIe9QAUnmq/
	 iZd6e50xWi4UubX9BDHYqfF3tVAE14aba4AkW+xrdozQu6ZMKG/5Db3xJsNUoCCxue
	 qHyAuBdK5DidVPjX+OJoH5ME3rQvECRgVDAlzocGbbq//+vlOet/PRUl3OqjEGKQFx
	 tYVOVYd07YaLRvGgS1VoFcDAp9NcLi9jXHRkFur0zsEjfVgBVwnhsTOja9+3Ek5B8Y
	 92X6DSXN8r1++s/1nj81bSWD7nQxFnSJfkWllABw/Jrth42Rayh+vkOfmfY2W7cpFf
	 yeh3Kyqm0IDjw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Myeonghun Pak <mhun512@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260912191223.46136-1-mhun512@gmail.com>
References: <20260912191223.46136-1-mhun512@gmail.com>
Subject: Re: (subset) [PATCH] mfd: intel_quark_i2c_gpio: manage the
 fixed-rate clock
Message-Id: <179007721050.3323244.11946100004851666445.b4-ty@b4>
Date: Tue, 22 Sep 2026 12:40:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 12 Sep 2026 15:12:23 -0400, Myeonghun Pak wrote:
> The I2C clock is allocated by clk_register_fixed_rate(), but cleanup uses
> clk_unregister(), leaving the fixed-rate provider allocation behind.
> 
> Manage the provider with devm_clk_hw_register_fixed_rate() and its lookup
> with devm_clk_hw_register_clkdev(). Managed resources release the lookup
> before the provider, after the MFD children have been removed.
> 
> [...]

Applied, thanks!

[1/1] mfd: intel_quark_i2c_gpio: manage the fixed-rate clock
      commit: 4975efeed746b50ddcf72d6c5f704d1269794854

--
Lee Jones [李琼斯]

