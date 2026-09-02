Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF0C49362D;
	Wed,  2 Sep 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357421; cv=none; b=hS6gkPxPClCcKVgse9bhVkom5AHR4EQvEbFeSVVPcZzcyTqsxyXU9DKS9fL2Ec1T0yPNuqpyPp+uHzJGdAHeGxeNBstUE7PTAtwlv0RppncxcT9YWefw6k0ukrFUUVX2ZcbMhAcRSmD06jgD//S6TKnBLwjOSap7NNo9YqajpvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357421; c=relaxed/simple;
	bh=PVjKblqLkIFVqpvXgvkxMj+FnR0VE7rsrcxl1RmWY7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6tLX6NdJWT33YjU1hWVa5ZPzOVx7cgdgUN2A5nmv1iQRjJCCsiFoXVHMcjqOA9wmVh5gC50EE4AdKgG+IzI5lR6n3hwIktSGDiGCKhSK+KLNnoZp27DrXoOVBdnEYuqxB6YKZP80zdk/S3PbsjeXxcYjfzg+/YJ0a5LCNzohEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmGCrY7/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmGCrY7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB5E1F000E9;
	Wed,  2 Sep 2026 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788357419;
	bh=jLZ9BFi7/CtxeBmTeS1rDSLvBn53L3jWlimsW0IktjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SmGCrY7/iGuSRgoy/NFoOzou0NKw8yjgS81iAhveT4baERvWmRyDtD110vTDo1XX3
	 3gClpdnJ5DpvyBBdd6zIYEGQD79TqOIkFL0cquLORKV6oUhDTjQ03P0gSiHdb4nb4A
	 SmDPawIYUYH2hfwaLH96jiKawXScBDY9RpsbQ/MUYwpMmvO/wj2WuBFQVoJQU8Nwvg
	 2DgGdo6aQne51Tzk2s58piPpgdGta9HbS8/fPmiH42jiwuKP5DakAbduU7y4bVdAfs
	 ryLOFUo+dHsC/XbLhXZXbOy5S7m66TzIY92mMPSoqfVf58gS6xkM1qAPld3dXIlfeQ
	 A9cIZsGgQR47Q==
Date: Wed, 2 Sep 2026 15:56:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: David Carlier <devnexen@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, qiang.yu@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: Select MFD_SYSCON for the
 multi-PHY driver
Message-ID: <zsu6kqnnyjoqs44aihc3e6w2mqrwbwovk23mmr6svj7n2tkdpp@k67xkbgmdm2c>
References: <20260825225729.230493-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825225729.230493-1-devnexen@gmail.com>

On Tue, Aug 25, 2026 at 11:57:28PM +0100, David Carlier wrote:
> The driver reads the active link mode through
> syscon_regmap_lookup_by_phandle_args(). Without CONFIG_MFD_SYSCON the
> stub returning -ENOTSUPP is compiled in instead, so probe fails for
> every device and no PHY is ever registered.
> 
> Nothing in the build catches this: the driver still compiles, and arm64
> defconfig happens to enable MFD_SYSCON through an unrelated select.
> 
> Fixes: 1781be3c8a5d ("phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
