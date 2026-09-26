Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310CC322C73;
	Sat, 26 Sep 2026 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790408897; cv=none; b=GBb2AzLeIWKuTrzrw4Un5QFk7nVMl8at3FoBO7wvqBjoe5QY84wAIF3unPZ3AGt7LfXeYK1T5V5f4aNEYkYHuLAkAah8fcLgXwcSyfClrZF8jZkzc226pTOfQPu7iBWoNMuPZd6tpi0qbRAluWOo51hloXOBfiLLXpt3CDpr/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790408897; c=relaxed/simple;
	bh=IqNVfQ5KDAENB2BpXE2k9hAwJ1rJrSX+ljG33XkgQCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d92yITE8kCU8Kol3XNvnWSVOGnz3Fb4nmf1bKmhE1GNUqz99cOYBufVV9uQ99bHHJ1kZ0PMc6zd+Ff9zyLCaN3++ZDC73okQWPOkLupLwZC47szvneMKdUhdZbQRyOrS6csNLPZFXcezxme7dBSv3I+O5SfNCveO1KVp6PDBt6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKZetOO5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKZetOO5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7181F000FF;
	Sat, 26 Sep 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790408895;
	bh=f58KgYFLlHqoxRMag1PJ40k7YF7iSwH7HFuc7gT+hfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BKZetOO5Se/CsuiAwVlykgedBosV+jhO0fcjH5fordh3MW+rTaXLVa+hCYaR5CYdg
	 hNK9gwYNvby1aO4zSigICnezRuuf18KGLuFC00fNPoErFQK/mEakb3foqWYssSSxPC
	 RRj4w5kd/+I5mO1hGbT40Tw6RQ4uKSpRw2MRmSUZIpSxAu2mjI/JB7Hbz5LQheI3oJ
	 D0VRSxIgZg33Ftmkxtwv6IoXZp1RTf/I8MwkVww5m8vIpTGg4GeUfvkecpnevNlvWk
	 lePo7TbNcx1B1ZPU2DKlvYj+NCD7n7PxAOOHW9l/vI2RGMEfZAVuBK2x9esZrOUDOZ
	 cbRnMfh7bNOQA==
Date: Sat, 26 Sep 2026 09:47:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
Message-ID: <vntwi7qi7eok6pryljuryex4jy7qajpidwpzcqavs25deso7kj@eafhk333wtev>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>

On Thu, Sep 24, 2026 at 07:25:37PM +0200, Sebastian Reichel wrote:
> Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> if the configuration changes or cable orientation changes. This is a
> problem, as the consumer device will run into undefined behavior.
> 
> With the new PHY notifier API introduced in this patch, the consumer
> driver can hook into reset events coming from a PHY device to handle the
> PHY going down gracefully.
> 
> Note that this uses -ENOSYS instead of the more sensible -ENOTSUP for
> the stub functions when GENERIC_PHY is disabled to stay consistent with
> the existing ones.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
